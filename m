Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2204C3A41
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 01:23:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Vr95vL1z3bY0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 11:23:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h1p+uPkq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=h1p+uPkq; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4VqW5Lhnz2yPv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 11:23:17 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 132so3150129pga.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 16:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=WNAX63/c99XOFkeIMCeWIytIe0Oh9CQliGpSjMLfo3Q=;
 b=h1p+uPkqcxvYE7x/Gfa8GpqEMj4C9gcpysZ6Fb53cs1JgFb/EVxyJGzvWFnhrdhOyp
 Pu0iIfffTCWQwNdEhPkG5awMACtbndp4X1M3A4+EFp6YaMMyTuNAqNZRlX/zeFrietnw
 ygoBuzggj6hn8c0MeDdKuCV4YLuxPoO3/RocYqK8vlprzOzWiHyauUmM2z6e+iv7GABi
 pcXXLVwad2bFlYs1QfNAO+wSaK191EdX/K6DvFUVIZht7tnOIZUYj+t5UbiFZfPWUG6C
 Q1spvP7hiXgiW5CdXPCbo9fh36YOB8CGcKX6qS2eXOx8XNX+954o+Cn/up+0mBc9KXq7
 HzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=WNAX63/c99XOFkeIMCeWIytIe0Oh9CQliGpSjMLfo3Q=;
 b=k502b+/hD7i5FSavgdDv80u6w2oTo+K5IgWSuJiijh0K3YMBpbty/xtD44IgA8AbdC
 vR2qPXTR2hjtud88BCFpRYUse64taYNyAP5dy/XnqXEwd4ogvak6cNDF1O4vpAq6IMEI
 wbGvCXMwfA8eDy5mNJO2fH/yXwCvO0yuZj0p8jvFw4Iwmx3lwN/biLdJfUD4rpbHGPw5
 Edh4dP0PZ5uVrGWI3H2v9ckwOEudyc8ziCLD2EjTbOtviLcN+1ycyTcU4E4zJ7gbf/pk
 0SZmTy6LbLVjSv/ezrEcSThBSyDAV1N9dGBVF1K4h4BU3WxDjJq25I2MERHht68VXkyq
 gUCA==
X-Gm-Message-State: AOAM533g/CV/Wv4Or1qJ7UensAQ62VtlfGgQXt5ns/cIEhKpkI4RM6J0
 8smdtzNvAmJrF9I0qIjId9M=
X-Google-Smtp-Source: ABdhPJyUjEFOcHnNJKQCfpLKU2R/5+7s046kejLK9AP1h3bVEuzh+/IK8fJtiWjzrrTU4pidgLaG9Q==
X-Received: by 2002:aa7:8d08:0:b0:4e1:5fb5:b15 with SMTP id
 j8-20020aa78d08000000b004e15fb50b15mr4989729pfe.70.1645748593544; 
 Thu, 24 Feb 2022 16:23:13 -0800 (PST)
Received: from localhost (115-64-212-59.static.tpgi.com.au. [115.64.212.59])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a655582000000b00372b2b5467asm637228pgs.10.2022.02.24.16.23.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 16:23:13 -0800 (PST)
Date: Fri, 25 Feb 2022 10:23:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
 <1645670923.t0z533n7uu.astroid@bobo.none>
 <1645678884.dsm10mudmp.astroid@bobo.none>
 <CAK8P3a28XEN7aH-WdR=doBQKGskiTAeNsjbfvaD5YqEZNM=v0g@mail.gmail.com>
 <1645694174.z03tip9set.astroid@bobo.none>
 <CAK8P3a1LgZkAV2wX03hAgx527MuiFt5ABWFp1bGdsTGc=8OmMg@mail.gmail.com>
 <1645700767.qxyu8a9wl9.astroid@bobo.none>
 <20220224172948.GN614@gate.crashing.org>
In-Reply-To: <20220224172948.GN614@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1645748553.sa2ewgy7dr.astroid@bobo.none>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "# 3.4.x" <stable@vger.kernel.org>, Anders Roxell <anders.roxell@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Segher Boessenkool's message of February 25, 2022 3:29 am:
> On Thu, Feb 24, 2022 at 09:13:25PM +1000, Nicholas Piggin wrote:
>> Excerpts from Arnd Bergmann's message of February 24, 2022 8:20 pm:
>> > Again, there should be a minimum number of those .machine directives
>> > in inline asm as well, which tends to work out fine as long as the
>> > entire kernel is built with the correct -march=3D option for the minim=
um
>> > supported CPU, and stays away from inline asm that requires a higher
>> > CPU level.
>>=20
>> There's really no advantage to them, and they're ugly and annoying
>> and if we applied the concept consistently for all asm they would grow=20
>> to a very large number.
>=20
> The advantage is that you get machine code that *works*.  There are
> quite a few mnemonics that translate to different instructions with
> different machine options!  We like to get the intended instructions
> instead of something that depends on what assembler options the user
> has passed behind our backs.
>=20
>> The idea they'll give you good static checking just doesn't really
>> pan out.
>=20
> That never was a goal of this at all.
>=20
> -many was very problematical for GCC itself.  We no longer use it.

You have the wrong context. We're not talking about -many vs .machine
here.

Thanks,
Nick
