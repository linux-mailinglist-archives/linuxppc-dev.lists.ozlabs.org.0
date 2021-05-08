Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E737711E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 12:01:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcjWk37Jrz3089
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 20:01:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=D3tpCyYj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D3tpCyYj; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcjW90ZHDz2yYB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 20:00:52 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id v191so9624309pfc.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 May 2021 03:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=LbmHI8d9Qh61VL9ZD+Y+aznmH4Mcskn3PwaJHBCWPwo=;
 b=D3tpCyYjuaqK5RXdWpGozaL0uz+ivGKDdPviZhA93KxKwBMuVkaxHgpns/FlPZX9fO
 XRou6KYree5HekIU8/KP/A9LIybVAKTBIdTCEx4WSdY6PMG0NyvJPyCZoDBRRODdD0XG
 RxhdbSEiPVDfikOk5VaxY6wyp12V2aUGgKKzd6Ahht2AROE9a2UwUnP7a88u4O9I7mDD
 cfC5xySislisLlpT6aE4UAgAeSd0lM5HPoNZi9ct2jjPusxq+xvWuo0ZB9CW5NkJ7Qwq
 w3Fhnd038GepQ8c5aA/+W8YZMAtd1XGw8AWS3FeuAhoro/zqYRE93cqICkMiiVlNAfw6
 6K6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=LbmHI8d9Qh61VL9ZD+Y+aznmH4Mcskn3PwaJHBCWPwo=;
 b=WZRZ2pPAMEtJcdsk8L3XWH38snbpg/41NJ7pFVQYmWp2kfsyufa/xVywCus/NbLZw+
 +E6H/6hh/gayU0DbbGBI9hCA8DMmJlsKM5e0cdDu/sUApd6lKHODQ3v14Gpkjg0fpyQ6
 75oLmY/xj/gPRfElXh/JV9/Xt3dcytXgLYTTuKeSVYTn0n5c7cbtQi7lpMM31CwszJ4T
 Cq+fSMdMcGwli3VKBRmytwl1UFvpqxT8bbgWpmKzy/fGjrC3TE2caPyX9qdIAK1laBFt
 Xor6NllkB9ElSYjWC8mdT/a4Jay5s8s3HhsTreZWSfitLFVi7gfDXrkEuzAQr8GW4hl7
 HQww==
X-Gm-Message-State: AOAM531ydsW4Z01T4oC47//qv0VqYts2wH455g+Kp2Jnth/mnmFO2Er9
 6kpRzDFBo5UBikotIeCdp6c=
X-Google-Smtp-Source: ABdhPJycwX/eO6pjoOGS7cMPO3oKQlVAWpVF5+DoHW1fUHM2wnsRf6MwzkPuWXPMLgR0ADgcapE9JA==
X-Received: by 2002:a62:8fd2:0:b029:28e:8c64:52a4 with SMTP id
 n201-20020a628fd20000b029028e8c6452a4mr15074099pfd.3.1620468048522; 
 Sat, 08 May 2021 03:00:48 -0700 (PDT)
Received: from localhost (60-241-47-46.tpgi.com.au. [60.241.47.46])
 by smtp.gmail.com with ESMTPSA id x22sm6628622pfa.24.2021.05.08.03.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 May 2021 03:00:48 -0700 (PDT)
Date: Sat, 08 May 2021 20:00:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 4/4] powerpc/powernv: Remove POWER9 PVR version check for
 entry and uaccess flushes
To: Joel Stanley <joel@jms.id.au>
References: <20210503130243.891868-1-npiggin@gmail.com>
 <20210503130243.891868-5-npiggin@gmail.com>
 <CACPK8XekEXgqA1bML6A+NbsshzsLe+pLTzGJzRLdC+QKrV5T9Q@mail.gmail.com>
 <1620119643.r94ggot8r7.astroid@bobo.none>
 <CACPK8XeyEaj-0LUa=YMT1WXn=_cQkDXH9xLiVARGCwZANsRk=A@mail.gmail.com>
In-Reply-To: <CACPK8XeyEaj-0LUa=YMT1WXn=_cQkDXH9xLiVARGCwZANsRk=A@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1620467748.tqdm5pvv7k.astroid@bobo.none>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Joel Stanley's message of May 5, 2021 11:43 am:
> On Tue, 4 May 2021 at 09:16, Nicholas Piggin <npiggin@gmail.com> wrote:
>>
>> Excerpts from Joel Stanley's message of May 4, 2021 10:51 am:
>> > On Mon, 3 May 2021 at 13:04, Nicholas Piggin <npiggin@gmail.com> wrote=
:
>> >>
>> >> These aren't necessarily POWER9 only, and it's not to say some new
>> >> vulnerability may not get discovered on other processors for which
>> >> we would like the flexibility of having the workaround enabled by
>> >> firmware.
>> >>
>> >> Remove the restriction that they only apply to POWER9.
>> >
>> > I was wondering how these worked which led me to reviewing your patch.
>> > From what I could see, these are enabled by default (SEC_FTR_DEFAULT
>> > in arch/powerpc/include/asm/security_features.h), so unless all
>> > non-POWER9 machines have set the "please don't" bit in their firmware
>> > this patch will enable the feature for those machines. Is that what
>> > you wanted?
>>
>> Yes. POWER7/8 should be affected (it's similar mechanism that requires
>> the meltdown RFI flush, which those processors need).
>>
>> POWER10 we haven't released a bare metal firmware with the right bits
>> yet. Not urgent at the moment but wouldn't hurt to specify them and
>> add the Linux code for them.
>=20
> Thanks for the explanation. This could go in the commit message if you re=
-spin.
>=20
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>=20

I was talking about the same thing with Michael and he dug up an old
email chain that proves me wrong. P7/8 are actually slightly different.
I'm not sure what I can explain of it in public unfortunately.

How about this?

---

These aren't necessarily POWER9 only, and it's not to say some new
vulnerability may not get discovered on other processors for which
we would like the flexibility of having the workaround enabled by
firmware.

Remove the restriction that the workarounds only apply to POWER9.

However POWER7 and POWER8 are not affected, and they may not have
older firmware that does not advertise this, so clear these workarounds
manually.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/powernv/setup.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platform=
s/powernv/setup.c
index a8db3f153063..874fb016384a 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -123,10 +123,14 @@ static void pnv_setup_security_mitigations(void)
 	}
=20
 	/*
-	 * If we are non-Power9 bare metal, we don't need to flush on kernel
-	 * entry or after user access: they fix a P9 specific vulnerability.
+	 * The issues addressed by the entry and uaccess flush don't affect P7
+	 * or P8, so on bare metal disable them explicitly in case firmware
+	 * does not include these bits. POWER9 and newer processors should
+	 * have the right firmware bits.
 	 */
-	if (!pvr_version_is(PVR_POWER9)) {
+	if (pvr_version_is(PVR_POWER7) || pvr_version_is(PVR_POWER7p) ||
+	    pvr_version_is(PVR_POWER8E) || pvr_version_is(PVR_POWER8NVL) ||
+	    pvr_version_is(PVR_POWER8)) {
 		security_ftr_clear(SEC_FTR_L1D_FLUSH_ENTRY);
 		security_ftr_clear(SEC_FTR_L1D_FLUSH_UACCESS);
 	}
--=20
2.23.0

