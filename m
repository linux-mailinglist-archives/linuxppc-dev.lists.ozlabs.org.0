Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 438D3A6728
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 13:13:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N48D2L0hzDqXm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 21:13:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N43p2V12zDqjM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 21:09:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46N43p1r0bz9sDB; Tue,  3 Sep 2019 21:09:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46N43p017Mz9s7T;
 Tue,  3 Sep 2019 21:09:57 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v5 01/31] powerpc/fadump: move internal macros/definitions
 to a new header
In-Reply-To: <156630265249.8896.17574594631603225622.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630265249.8896.17574594631603225622.stgit@hbathini.in.ibm.com>
Date: Tue, 03 Sep 2019 21:09:57 +1000
Message-ID: <87zhjlr5yy.fsf@mpe.ellerman.id.au>
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> Though asm/fadump.h is meant to be used by other components dealing
> with FADump, it also has macros/definitions internal to FADump code.
> Move them to a new header file used within FADump code. This also
> makes way for refactoring platform specific FADump code.
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/fadump.h   |   71 ----------------------------
>  arch/powerpc/kernel/fadump-common.h |   89 +++++++++++++++++++++++++++++++++++
>  arch/powerpc/kernel/fadump.c        |    2 +

I don't like having a header in kernel that's then used in platform
code. Because we end up having to do gross things like:

  arch/powerpc/platforms/powernv/opal-core.c:#include "../../kernel/fadump-common.h"
  arch/powerpc/platforms/powernv/opal-fadump.c:#include "../../kernel/fadump-common.h"
  arch/powerpc/platforms/pseries/rtas-fadump.c:#include "../../kernel/fadump-common.h"


I'd rather you put the internal bits in arch/powerpc/include/asm/fadump-internal.h

cheers
