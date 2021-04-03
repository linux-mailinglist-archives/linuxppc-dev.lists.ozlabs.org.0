Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D847835321C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 04:28:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FC17R6JgBz3bw0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 13:28:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Z2sUMI6E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Z2sUMI6E; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FC1736p0fz2xZC
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 13:28:15 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FC16y504tz9sSC;
 Sat,  3 Apr 2021 13:28:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617416890;
 bh=0h9Rkk3pH8W3/mESmW/wTOFUsfeyLufvNbYm/QFLvgA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Z2sUMI6E2b9/GIGqjYHJTE9eseIMOq5EoL75l07QPAf5DqpdH7lYF64fwseXtK3mR
 efwcgFKVjklBsR/MRM2rhMGyNvU0tQIb2e42Deg25VSGOnwh9QPDeoi2uj6AweiTIV
 eCzbyIgMVQ190cMa29hRhDXJMr46qj+v5IsG4Ra3yCIejbuRgfHWGyOlPhKzjcYSk7
 MZCsGV/6FBsfpJu8OqBzJZlt09KZAwIz/hNyErKFLe2lUowq0FjCqUv8xFDQzm1C9w
 4Q0aoQVT8C9IXN03lcDq0v5+l08TmYVwKfU1g8voIxg8cepMsMaT46gAuouHwYiLq1
 uBXjIZP2Cfy2Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 04/14] powerpc/64s: avoid reloading (H)SRR registers if
 they are still valid
In-Reply-To: <20210315220402.260594-5-npiggin@gmail.com>
References: <20210315220402.260594-1-npiggin@gmail.com>
 <20210315220402.260594-5-npiggin@gmail.com>
Date: Sat, 03 Apr 2021 13:28:07 +1100
Message-ID: <874kgo14qw.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
> index ccf913cedd29..b466b3e1bb3f 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -64,6 +64,30 @@ exception_marker:
>  	.section	".text"
>  	.align 7
>  
> +.macro DEBUG_SRR_VALID srr
> +#ifdef CONFIG_PPC_RFI_SRR_DEBUG
> +	.ifc \srr,srr
> +	mfspr	r11,SPRN_SRR0
> +	ld	r12,_NIP(r1)
> +100:	tdne	r11,r12
> +	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)

This always points at *this* line, not the caller. Works better with the
patch below.

cheers


diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index b466b3e1bb3f..ada76b1279f9 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -64,26 +64,26 @@
 	.section	".text"
 	.align 7
 
-.macro DEBUG_SRR_VALID srr
+.macro DEBUG_SRR_VALID srr line
 #ifdef CONFIG_PPC_RFI_SRR_DEBUG
 	.ifc \srr,srr
 	mfspr	r11,SPRN_SRR0
 	ld	r12,_NIP(r1)
 100:	tdne	r11,r12
-	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
+	EMIT_BUG_ENTRY 100b,__FILE__,\line,(BUGFLAG_WARNING | BUGFLAG_ONCE)
 	mfspr	r11,SPRN_SRR1
 	ld	r12,_MSR(r1)
 100:	tdne	r11,r12
-	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
+	EMIT_BUG_ENTRY 100b,__FILE__,\line,(BUGFLAG_WARNING | BUGFLAG_ONCE)
 	.else
 	mfspr	r11,SPRN_HSRR0
 	ld	r12,_NIP(r1)
 100:	tdne	r11,r12
-	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
+	EMIT_BUG_ENTRY 100b,__FILE__,\line,(BUGFLAG_WARNING | BUGFLAG_ONCE)
 	mfspr	r11,SPRN_HSRR1
 	ld	r12,_MSR(r1)
 100:	tdne	r11,r12
-	EMIT_BUG_ENTRY 100b,__FILE__,__LINE__,(BUGFLAG_WARNING | BUGFLAG_ONCE)
+	EMIT_BUG_ENTRY 100b,__FILE__,\line,(BUGFLAG_WARNING | BUGFLAG_ONCE)
 	.endif
 #endif
 .endm
@@ -358,7 +358,7 @@ END_BTB_FLUSH_SECTION
 	mtspr	SPRN_SRR0,r4
 	mtspr	SPRN_SRR1,r5
 1:
-	DEBUG_SRR_VALID srr
+	DEBUG_SRR_VALID srr __LINE__
 
 BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1			/* to clear the reservation */
@@ -753,7 +753,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	stb	r4,PACAHSRR_VALID(r13)
 #endif
 	.endif
-	DEBUG_SRR_VALID \srr
+	DEBUG_SRR_VALID \srr __LINE__
 
 BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1		/* to clear the reservation */
@@ -825,7 +825,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	stb	r4,PACAHSRR_VALID(r13)
 #endif
 	.endif
-	DEBUG_SRR_VALID \srr
+	DEBUG_SRR_VALID \srr __LINE__
 
 BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1		/* to clear the reservation */
