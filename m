Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 347CB2E2DAF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Dec 2020 09:20:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D2xb01l2hzDqML
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Dec 2020 19:20:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cLssCxKE; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D2xYJ2JVTzDq8w
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Dec 2020 19:19:15 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id n7so4327721pgg.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Dec 2020 00:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=eGo689KM/QMsTQ2b2iCHdJdH9GUywaOrUeQ68krJZ0E=;
 b=cLssCxKEONXTIJkJMXHoe4YH99cBZs2OqM5A1Z3As7ub8LkpUFChh42IvsAS0khlVI
 xX43z4xeMRE1lVlh5awDMBeTxHf3dKTvETu74Ungdydl2JgrptydqH4rcQhvKWzYQ0HC
 JMLbewLYZ0C6ngCKSr3S0QSHbcPUkS6CIfat1bS0HHASka55I8wsN0AhN5BIokfq6iIN
 8bERvZmjaDIWUv8xY88pKMZjpzEIuHJg8l8VR8pefdcBxKnxtHK7RVgWz59K7smfgyXR
 F5N97JeQv9loS28MY5ssANKULL/R1nPeGUv+x4j2Ovbz3ddmcYYKfVkNZz6rN6H4Sacw
 Rp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=eGo689KM/QMsTQ2b2iCHdJdH9GUywaOrUeQ68krJZ0E=;
 b=Y2nmYNcNWtk9OrL4ZpdB/t2+0aEgCPArPinVpZFsxkpv6VMEyDPEsxltqloeB/lxTw
 CT8RrTK9dbdwcCoGxFa9yINDcrx4TkfU+uTLpSK4ELw25OKTCiKSMncuZXiRbkZrL+lA
 bPii8pV5sYvpnRhKxtsEKQlQDVyCfx/bhIwjOGWEZbFFemljTmcJrZMjyJUYPNcwI+No
 51fYhCq74wKDY815U9FQKfz18y/K0WtI+qdvU7eYCyM7GzLVMIcOsU2rOhUF+H1PAucZ
 7sNGcmLXq+16dHfCa4g7nrNQk0pM9m2yJCQq91JwoCTdAIYNiTHZbrA8hyEhawxapZpB
 4gmg==
X-Gm-Message-State: AOAM5330eMv/48NI+p0XBmY6IEDFpLuwTNDflF5pkLmU2MOaEQFqTDWF
 1LuXit2SZZ92tRDGRX02zes=
X-Google-Smtp-Source: ABdhPJwVw9LciDc1x6uLjl6CZK2JTydhvcwZc4MQwrHIUDDdM8T0XntF3FKAFz9hKcbcNUGd614e2w==
X-Received: by 2002:a65:6542:: with SMTP id a2mr24210290pgw.148.1608970750736; 
 Sat, 26 Dec 2020 00:19:10 -0800 (PST)
Received: from localhost (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id m15sm30666412pfa.72.2020.12.26.00.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Dec 2020 00:19:10 -0800 (PST)
Date: Sat, 26 Dec 2020 18:19:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 03/19] powerpc: bad_page_fault, do_break get registers
 from regs
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20201128144114.944000-1-npiggin@gmail.com>
 <20201128144114.944000-4-npiggin@gmail.com>
 <312d3d14-329c-a0c9-89c4-e21d1f9e616d@csgroup.eu>
In-Reply-To: <312d3d14-329c-a0c9-89c4-e21d1f9e616d@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1608970380.delquel806.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of December 23, 2020 12:42 am:
>=20
>=20
> Le 28/11/2020 =C3=A0 15:40, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Similar to the previous patch this makes interrupt handler function
>> types more regular so they can be wrapped with the next patch.
>>=20
>> bad_page_fault and do_break are not performance critical.
>=20
> I partly took your changes into one of my series, in different order thou=
gh.
>=20
> Please have a look at https://patchwork.ozlabs.org/project/linuxppc-dev/l=
ist/?series=3D221656 patches=20
> 4 to 7

Thanks, I had a look. Seems like the result is basically the same as my=20
series, so that's good if you like the end result now :)

> I think some of the changes are missing in your series, especially the ch=
anges in entry_32.S from=20
> patch 7.

Okay I could take them in. In your patch 7/15, why do you leave this=20
load of DSISR?

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/hea=
d_book3s_32.S
index 15e6003fd3b8..0133a02d1d47 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -369,9 +369,9 @@  BEGIN_MMU_FTR_SECTION
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 #endif
 #endif	/* CONFIG_VMAP_STACK */
-1:	mr	r4,r12
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
-	stw	r4, _DAR(r11)
+	stw	r12, _DAR(r11)
+	stw	r5, _DSISR(r11)
 	EXC_XFER_LITE(0x400, handle_page_fault)
=20
 /* External interrupt */
@@ -693,7 +693,6 @@  handle_page_fault_tramp_1:
 #ifdef CONFIG_VMAP_STACK
 	EXCEPTION_PROLOG_2 handle_dar_dsisr=3D1
 #endif
-	lwz	r4, _DAR(r11)
 	lwz	r5, _DSISR(r11)
	^^^^^^^^^^^^^^^^^^^^^^
 	/* fall through */
 handle_page_fault_tramp_2:

?

> Will see how our two series make their way into mainline, yours needs reb=
ase anyway.

I have it rebased, just waiting for a bit after merge window to repost.
Would be good if mine can go first so I don't have to redo the 64s page=20
fault to C conversion again. AFAIKS after that you can just drop 4-7, no=20
conflicts? (after bugs are fixed)

Thanks,
Nick
