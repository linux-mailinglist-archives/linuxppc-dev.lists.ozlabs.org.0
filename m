Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE920352446
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:13:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBL9s6C09z3c36
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 11:13:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QbZg4me4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QbZg4me4; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBL9R5M40z2yhs
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 11:12:59 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d8so1781526plh.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 17:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=w+uMm5y81TmVu99pulguuZSef2iVnhjsZnzedjRmtbY=;
 b=QbZg4me4ZDg4cfJe30HhdatXAhn6SOBUFAgSLPG3RGmd51dFkaVQ78R6DdWlow0dRC
 cwxfLegYTTiIomjnyF+b8+4WgP9tt/si0Rk2JAHDC5//GimV9SOHpGksxO3tVDiizgRi
 MkKV9tor4YaWoYHY5Vss5Xv/7mFhKKyVnrSq1wkURV+BQVyDO0DqZdfyviBp32yYD3my
 z3I6HMzO1ZQkIG6tb60NfvdohRbfI2fFGsr9Zk/BRdEmP7BOzEL4ZUBWbeV9hI2Q56R5
 rjWqnqnW2kTRLf3vvuZILSzidtFeeuS8UdU9WLvmcI7IwDULw3hOsv1ftVEnSpzVelLJ
 hnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=w+uMm5y81TmVu99pulguuZSef2iVnhjsZnzedjRmtbY=;
 b=jIUIgl1MNt7bGz1LR14nrhH+AY/Q6hfmsR+aIzwChR/rIPdg+32Woc/IRs1vGavHcH
 YIKWHa06cv43wSrJ3ejmrJmbJt9kMndoB7Q1nG9p2cPTpWNE2wpSbvqdjRPjyL7BEb4Y
 CBXrZD++YE6wHNpcaxiiyZnCfJg0rU1vpWSM2Tw/PPRncj+8HZWClCXrVxScmoGC0JQk
 KgFO5gRbfTeFJLmaDd56vrqZnMp/LAVu5oeNuvPs9+6vwGQNblulpD/WJmTYRkxyJmyg
 0S6a8WWtSZx4G92V+Es9zuipjLE2qXMKqvwf3Y0peHV8VLagqXRDxiSwplAZScHGsE+x
 D2Cg==
X-Gm-Message-State: AOAM531KfHUvBWhazbdHrVr6hP7oawymz7fant0L0SzgcXzoTWGQE7uy
 BGJNjDk9ODYUj+E+jMirYBM=
X-Google-Smtp-Source: ABdhPJwMGaevZkWpnNq2jucx6RURBC9dU+jVdIlSiN1GrAG5inc1FiNUq146dfQ2xYbfzoWtybYqUg==
X-Received: by 2002:a17:902:c389:b029:e7:1029:8ba5 with SMTP id
 g9-20020a170902c389b02900e710298ba5mr10253384plg.55.1617322316521; 
 Thu, 01 Apr 2021 17:11:56 -0700 (PDT)
Received: from localhost ([1.128.156.122])
 by smtp.gmail.com with ESMTPSA id w15sm35493pja.18.2021.04.01.17.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 17:11:56 -0700 (PDT)
Date: Fri, 02 Apr 2021 10:11:49 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 48/48] KVM: PPC: Book3S HV: remove ISA v3.0 and v3.1
 support from P7/8 path
To: kvm-ppc@vger.kernel.org
References: <20210401150325.442125-1-npiggin@gmail.com>
 <20210401150325.442125-49-npiggin@gmail.com>
In-Reply-To: <20210401150325.442125-49-npiggin@gmail.com>
MIME-Version: 1.0
Message-Id: <1617322040.20cd3hcyo5.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of April 2, 2021 1:03 am:
> POWER9 and later processors always go via the P9 guest entry path now.
> Remove the remaining support from the P7/8 path.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

[...]

> @@ -2527,28 +2259,14 @@ BEGIN_FTR_SECTION
>  END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> =20
>  kvm_nap_sequence:		/* desired LPCR value in r5 */
> -BEGIN_FTR_SECTION
> -	/*
> -	 * PSSCR bits:	exit criterion =3D 1 (wakeup based on LPCR at sreset)
> -	 *		enable state loss =3D 1 (allow SMT mode switch)
> -	 *		requested level =3D 0 (just stop dispatching)
> -	 */
> -	lis	r3, (PSSCR_EC | PSSCR_ESL)@h
>  	/* Set LPCR_PECE_HVEE bit to enable wakeup by HV interrupts */
>  	li	r4, LPCR_PECE_HVEE@higher
>  	sldi	r4, r4, 32
>  	or	r5, r5, r4
> -FTR_SECTION_ELSE
> -	li	r3, PNV_THREAD_NAP

^^^^^^^

> -ALT_FTR_SECTION_END_IFSET(CPU_FTR_ARCH_300)
>  	mtspr	SPRN_LPCR,r5
>  	isync
> =20
> -BEGIN_FTR_SECTION
> -	bl	isa300_idle_stop_mayloss
> -FTR_SECTION_ELSE
>  	bl	isa206_idle_insn_mayloss
> -ALT_FTR_SECTION_END_IFSET(CPU_FTR_ARCH_300)

Got a bug or two in the old path because I didn't test SMT configs.

I'll work through those so for now don't spend too much time trying to=20
run the old path or going through the rmhandlers.S asm changes in the=20
series until I post the next round.

Thanks,
Nick
