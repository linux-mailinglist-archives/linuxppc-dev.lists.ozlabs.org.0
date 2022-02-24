Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 334A14C25B7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:15:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K45LD38Stz3cCG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:15:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f4abudYR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=f4abudYR; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45KY59Wfz2x9D
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:14:24 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 v5-20020a17090ac90500b001bc40b548f9so5061266pjt.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 00:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=vBtZuAALJewLaq/BuuDCV2cJjk+dmoyjauh5TxA1GZA=;
 b=f4abudYR5pA2Q0a3XJMCI15iR5dGcVBYCFgl303eFaqKWpTV0qK0byZ9kwsppS7jKE
 luzTVEyU7Kw9LTjtOmyilGqGtDB+akg753wObRv5ozDqzlWH9/4eTO1wbpGZKaTki2zk
 N0pK/RhySisLNpl+DGTN/3SlJniEvdwm9LxERjytaHc0iA0tT+OpFcm6vuXjvRrqX7Ju
 OCW3b1bMg5O2dwh4IfZRzfDwy1XC59/VNCieT1jp9fStYQGXdkdnuLhXOr9i1Vl4ww1B
 Q7egHzodaQnnRYMTZouiYw80+izMeTu0Do7sDI/x/SvSOCyUIPCCajPtrhbP/jb/GsIE
 4+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=vBtZuAALJewLaq/BuuDCV2cJjk+dmoyjauh5TxA1GZA=;
 b=4F2UTksyrtGq41RH6eS9CM8g7DdgWcKRfseTzE4XOr3X51bj8a3MQmvx4OZ09npNCc
 C2KtgAlTgiomw7/oSJ/2Zi6bUnx/+4hQ1mrbNfRDlrcS3zQb8V5nVKnkFXFDRazOcmU0
 2q1FDorZ2w2FJCgagxhwnltFnRiNjYZ9GEtk11Vawl/wObhcShxGTG1WoQsmlmAteXm/
 WuNKFKWudJLiP1aMxeET/S30CegXUH1oCvOxQCAZPL7ef1URrysFKCOQ6bIbAFLs+0Md
 QtUhmIGbn4YbE9PpPEfpOhIXRS3eZNj1toEsO2jrTLn7kwqKpg4Brb4yo9e682dDlOD0
 1tOw==
X-Gm-Message-State: AOAM532eI6lrqpRLmE5NeJ1tWOUaEu4zsdSULOzuqqe4rCUhni1AONN6
 gIwKGMlMpIV89HuB/+vBUpPV6M5MrZI=
X-Google-Smtp-Source: ABdhPJyBN/C7+22VrKk36cqZqE7k05Vv39SYcBEW3Kep/d2b94LJARMfj2XGABlw4ty/tYQXypf6dg==
X-Received: by 2002:a17:902:ce91:b0:150:3f7:5096 with SMTP id
 f17-20020a170902ce9100b0015003f75096mr1188262plg.128.1645679134652; 
 Wed, 23 Feb 2022 21:05:34 -0800 (PST)
Received: from localhost (115-64-212-59.static.tpgi.com.au. [115.64.212.59])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a17090ab39400b001bc4f9ad3cbsm4569708pjr.3.2022.02.23.21.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 21:05:34 -0800 (PST)
Date: Thu, 24 Feb 2022 15:05:28 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
To: Anders Roxell <anders.roxell@linaro.org>, mpe@ellerman.id.au
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
 <1645670923.t0z533n7uu.astroid@bobo.none>
In-Reply-To: <1645670923.t0z533n7uu.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1645678884.dsm10mudmp.astroid@bobo.none>
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
Cc: stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of February 24, 2022 12:54 pm:
> Excerpts from Anders Roxell's message of February 23, 2022 11:58 pm:
>> Building tinyconfig with gcc (Debian 11.2.0-16) and assembler (Debian
>> 2.37.90.20220207) the following build error shows up:
>>=20
>>  {standard input}: Assembler messages:
>>  {standard input}:1190: Error: unrecognized opcode: `stbcix'
>>  {standard input}:1433: Error: unrecognized opcode: `lwzcix'
>>  {standard input}:1453: Error: unrecognized opcode: `stbcix'
>>  {standard input}:1460: Error: unrecognized opcode: `stwcix'
>>  {standard input}:1596: Error: unrecognized opcode: `stbcix'
>>  ...
>>=20
>> Rework to add assembler directives [1] around the instruction. Going
>> through the them one by one shows that the changes should be safe.  Like
>> __get_user_atomic_128_aligned() is only called in p9_hmi_special_emu(),
>> which according to the name is specific to power9.  And __raw_rm_read*()
>> are only called in things that are powernv or book3s_hv specific.
>>=20
>> [1] https://sourceware.org/binutils/docs/as/PowerPC_002dPseudo.html#Powe=
rPC_002dPseudo
>=20
> Thanks for doing this. There is a recent patch committed to binutils to w=
ork
> around this compiler bug.
>=20
> https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dcebc89b93=
28
>=20
> Not sure on the outlook for GCC fix. Either way unfortunately we have=20
> toolchains in the wild now that will explode, so we might have to take=20
> your patches for the time being.

Perhaps not... Here's a hack that seems to work around the problem.

The issue of removing -many from the kernel and replacing it with
appropriate architecture versions is an orthogonal one (that we
should do). Either way this hack should be able to allow us to do
that as well, on these problem toolchains.

But for now it just uses -many as the trivial regression fix to get
back to previous behaviour.

Thanks,
Nick

---
 arch/powerpc/include/asm/asm-compat.h | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/powerpc/include/asm/asm-compat.h b/arch/powerpc/include/a=
sm/asm-compat.h
index 2b736d9fbb1b..f9ac4a36f026 100644
--- a/arch/powerpc/include/asm/asm-compat.h
+++ b/arch/powerpc/include/asm/asm-compat.h
@@ -5,6 +5,34 @@
 #include <asm/types.h>
 #include <asm/ppc-opcode.h>
=20
+#ifndef __ASSEMBLY__
+/*
+ * gcc 10 started to emit a .machine directive at the beginning of generat=
ed
+ * .s files, which overrides assembler -Wa,-m<cpu> options passed down.
+ * Unclear if this behaviour will be reverted.
+ *
+ * gas 2.38 commit b25f942e18d6 made .machine directive more strict, commi=
t
+ * cebc89b9328ea weakens it to take into account the gcc directive and all=
ow
+ * assembler -m<cpu> options to work.
+ *
+ * A combination of both results in an older machine -mcpu=3D code generat=
ion
+ * preventing newer mneumonics in inline asm being recognised because it
+ * overrides our -Wa,-many option from being recognised.
+ *
+ * Emitting a .machine any directive by hand allows us to hack our way aro=
und
+ * this.
+ *
+ * XXX: verify versions and combinations.
+ */
+#ifdef CONFIG_CC_IS_GCC
+#if (GCC_VERSION >=3D 100000)
+#if (CONFIG_AS_VERSION =3D=3D 23800)
+asm(".machine any");
+#endif
+#endif
+#endif
+#endif /* __ASSEMBLY__ */
+
 #ifdef __powerpc64__
=20
 /* operations for longs and pointers */
--=20
2.23.0

