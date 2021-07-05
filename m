Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 612243BC420
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 01:36:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJhst2Yghz3bX4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 09:36:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=htxb8N11;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=htxb8N11; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJhsM2xVVz2yP0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 09:36:22 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id d12so19698505pgd.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jul 2021 16:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=66/KKaxAVhcdZyh0So8JHhrIskaGV7GdxJAFI2wCTso=;
 b=htxb8N11qChtjdK0fD4k1AFXZb4nrhjjd7TrTMQq18V6/c/Mss1RGKZMAY73t96QTM
 5ASj8smF1CJQ+bOY7hOa+hEOR9MiI+rNnSkztWwq4jwmM6066+rUPWVCn4t+rPX4DVPF
 H4O8kQQi4C5QhbjjSOXcKcRXir6NGUwEcmSjviJrZRptOVq7p93V//AeHr97WUqr4OBw
 ZyIJCzFk3a9BsYvxZ9fazqQWRKJ2EwP6X5T0ZSBizox5HlAqmOU96FaPmxo3n9HDechc
 j+GcuKO7lTwC56NKXVJ3z8YXhDnyO9/d29tkSnLQEbDoGOGfE/p5+9bT9RXD0g4eVDlV
 +5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=66/KKaxAVhcdZyh0So8JHhrIskaGV7GdxJAFI2wCTso=;
 b=ultXItKefU0FSvYb0LR11eCXi8ceTlevckxXLsPG51/nFW3QPWFKotCOBok2A/yS+u
 0nfvIZJOglsL2b1hBp7roMO4StLC3SsFtS4/FUfHEVyDmL+0MxCFeMqln7VV4XaLOou4
 sMUofdkekWSSRZ9caJYES4X2iDPUF8ext/q1GyZhMa4WPtC7vAM+ZdC1U4KIyLWIp5fJ
 /EVag8K77ySCcKwPTVq4cJ+beblYqVYpBrmasrCv05QZj0Sf9uc4ckiBto95jB+8Kc3r
 HhjEwJBL4Jhxu6SJZeUYHGajqfG0M+dNp1qTtNuYvNmnDVJv4bSSl97unAtfBuqVcjbW
 IM8g==
X-Gm-Message-State: AOAM5302ExFzPPuScfsLWYt8/3ANhu3zBJTy5G+eZEQjDLukyTDF+7Zx
 LUiQVPz9bn7LTJMOIc2nSeU=
X-Google-Smtp-Source: ABdhPJwPk/rQyN0y5HVSRWX/Lm9T/VodK6zX8c1nqJBdm48827l2R59C803yqrjyMQrtS8017xkmOA==
X-Received: by 2002:a62:1514:0:b029:31d:c27f:1daf with SMTP id
 20-20020a6215140000b029031dc27f1dafmr9821188pfv.4.1625528178395; 
 Mon, 05 Jul 2021 16:36:18 -0700 (PDT)
Received: from localhost ([118.209.250.144])
 by smtp.gmail.com with ESMTPSA id fa23sm543392pjb.11.2021.07.05.16.36.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 16:36:17 -0700 (PDT)
Date: Tue, 06 Jul 2021 09:36:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [FSL P50xx] IRQ issues
To: Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
References: <20210509224926.GA31035@embeddedor>
 <CADnq5_OWk+rXK5xrwu0YOMVC45WyQgFQBTUNkcF8oO3ucp+=XQ@mail.gmail.com>
 <ba5f2a73-58e8-6b3e-4048-bb19f238be51@embeddedor.com>
 <4e0a3130-4c20-aa8a-f32a-6c3f0d9cd6f8@xenosoft.de>
 <86de3024-c025-ec65-a45a-264585730c4a@xenosoft.de>
 <cc1b16c0-47d5-2c50-fba0-9e1aa014ee8a@xenosoft.de>
In-Reply-To: <cc1b16c0-47d5-2c50-fba0-9e1aa014ee8a@xenosoft.de>
MIME-Version: 1.0
Message-Id: <1625527692.m58rsysc62.astroid@bobo.none>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christian Zigotzky's message of July 6, 2021 4:49 am:
> Hi All,
>=20
> Our FSL P50xx machines don't boot anymore because of IRQ issues. [1]
>=20
> Please check the IRQ changes in the latest PowerPC updates 5.14-1. [2]
>=20
> Thanks,
> Christian
>=20
> [1]=20
> https://forum.hyperion-entertainment.com/download/file.php?id=3D2592&mode=
=3Dview
> [2]=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D019b3fd94ba73d3ac615f0537440b81f129821f6

This looks like mtmsrd in the 64e code. I think this should fix it.

QEMU does not seem to trap on this, maybe something to improve.

Thanks,
Nick
--

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/inter=
rupt_64.S
index 4063e8a3f704..d4212d2ff0b5 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -311,9 +311,13 @@ END_BTB_FLUSH_SECTION
 	 * trace_hardirqs_off().
 	 */
 	li	r11,IRQS_ALL_DISABLED
-	li	r12,-1 /* Set MSR_EE and MSR_RI */
 	stb	r11,PACAIRQSOFTMASK(r13)
+#ifdef CONFIG_PPC_BOOK3S
+	li	r12,-1 /* Set MSR_EE and MSR_RI */
 	mtmsrd	r12,1
+#else
+	wrteei	1
+#endif
=20
 	/* Calling convention has r9 =3D orig r0, r10 =3D regs */
 	mr	r9,r0
