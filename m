Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3604655FF9A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 14:17:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY0nl13zNz3cf5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 22:16:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY0n32LkRz3cfC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 22:16:23 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LY0n24Wfcz4xZG;
	Wed, 29 Jun 2022 22:16:22 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, martin.petersen@oracle.com, jejb@linux.ibm.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <3b1dfb19a2c3265fb4abc2bfc7b6eae9261a998b.1654966508.git.christophe.leroy@csgroup.eu>
References: <3b1dfb19a2c3265fb4abc2bfc7b6eae9261a998b.1654966508.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc: Don't include asm/setup.h in asm/machdep.h
Message-Id: <165650492297.3004956.3199700587499347269.b4-ty@ellerman.id.au>
Date: Wed, 29 Jun 2022 22:15:22 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 11 Jun 2022 18:55:15 +0200, Christophe Leroy wrote:
> asm/machdep.h doesn't need asm/setup.h
> 
> Remove it.
> 
> Add it directly in files that needs it.
> 
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc: Don't include asm/setup.h in asm/machdep.h
      https://git.kernel.org/powerpc/c/113fe88eed53af08800f54a03e463636105831e0
[2/2] powerpc: Move prom_init() out of asm-prototypes.h
      https://git.kernel.org/powerpc/c/7dc3ba0a071892ea212f90f63738fd9f81b1f638

cheers
