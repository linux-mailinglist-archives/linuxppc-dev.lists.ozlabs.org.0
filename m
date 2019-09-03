Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CEAA67C5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 13:48:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N4wP2R1GzDqkL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 21:48:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N4tH2ZYrzDqfL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 21:46:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46N4tG4V92z9s7T;
 Tue,  3 Sep 2019 21:46:46 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michael Neuling <mikey@neuling.org>
Subject: Re: [PATCH 3/3] powerpc/tm: Add tm-poison test
In-Reply-To: <20190903044718.13773-3-mikey@neuling.org>
References: <20190903044718.13773-1-mikey@neuling.org>
 <20190903044718.13773-3-mikey@neuling.org>
Date: Tue, 03 Sep 2019 21:46:44 +1000
Message-ID: <87k1apr49n.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, cyrilbur@gmail.com,
 Gustavo Romero <gromero@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Neuling <mikey@neuling.org> writes:
> From: Gustavo Romero <gromero@linux.ibm.com>
>
> Add TM selftest to check if FP or VEC register values from one process
> can leak into another process when both run on the same CPU.
>
> This tests for CVE-2019-15030 and CVE-2019-15031.
>
> Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> Signed-off-by: Michael Neuling <mikey@neuling.org>
> ---
>  tools/testing/selftests/powerpc/tm/.gitignore |   1 +
>  tools/testing/selftests/powerpc/tm/Makefile   |   2 +-
>  .../testing/selftests/powerpc/tm/tm-poison.c  | 180 ++++++++++++++++++
>  3 files changed, 182 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/powerpc/tm/tm-poison.c

This doesn't build on 64-bit big endian:

tm-poison.c: In function 'tm_poison_test':
tm-poison.c:118:10: error: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'uint64_t {aka long long unsigned int}' [-Werror=format=]
   printf("Unknown value %#lx leaked into f31!\n", unknown);
          ^
tm-poison.c:166:10: error: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'uint64_t {aka long long unsigned int}' [-Werror=format=]
   printf("Unknown value %#lx leaked into vr31!\n", unknown);
          ^

cheers
