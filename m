Return-Path: <linuxppc-dev+bounces-6764-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCF5A54E00
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 15:42:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7sZs097sz3bx0;
	Fri,  7 Mar 2025 01:42:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::230"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741272148;
	cv=none; b=fBmOWhRc55JlcYNWrGsRSgBUGdvdVKYIXb+PnSRX5gl65qKRaUS6znnpBRw3gxy0/mQ2dLrrL4mZboLpPU5XfPw0qHA42X25OhYbq9VcQTifDknxHCUdjW9yCz4REU+5HS87VSFCAVmR23Eqny/w00/nt8uAJ58ryM3fezFFH7Mbas10jfKfUKto6QQ9TP9ASW4RAixyqZuYHKX5lmSw21XBG71biEjtjg4rRrasdjTIZU2bC5a3P3AO4u+Kg1T7WsTTPwntVA53Ax4QsWkIRDl2lvkg3AxTbLjWUbI57nToGRCOl6n25aiAcuO8+78qQzn/iJUztoWB9czWK6mDIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741272148; c=relaxed/relaxed;
	bh=VCk+JJxMuH+7Xc7MK7xCQnQ/UASRlAowqMx07w+Zybg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B+xhiVijQR2V1w/Rvgp8JcV2nIi6BcTrGwlMEw8+jzF9UL4sRrTFwY0t+r3Be001Z4vdA+tGYX6VBkDasewGAWj4YH8pdLNrL/Blbmwi6UcN1EM1qQ7s3MdbqhCFiueKzBmgebtD1eH2kG0EDfVzfHE2SeZsOULqpzVtR0MWTLYfPdeoRv83d8yIwQI0gHDe/yBP2xcShxG0s7J7zyrH+g0mq1phPPHFnF0jBwlI4+9O17zIOHsbTR1G+aKNAlDpabJpNpumLr1+bUzv/J9kasxq7Cz+jQf4S/hVZOFQOcMy+burza09fyM63N+tikGCXJi+H22WhUIgd5l5RWIReQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PBovpeFC; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PBovpeFC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7sZp6G3Fz3bwX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 01:42:25 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-30615661f98so7378911fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Mar 2025 06:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741272142; x=1741876942; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCk+JJxMuH+7Xc7MK7xCQnQ/UASRlAowqMx07w+Zybg=;
        b=PBovpeFCLuWjsCp+DQKdeyaaBu79rOeGpKBMhqwvpVVupk3jOGNcuN1kC+sN+s2Q5h
         EhmGYD962r3B0SyMTlTreePSA7b3dCkk4KQnhXyZGuwQufiF2YaYGMVBVrAt1qBezUjO
         8Dkl3PJrcdob8NV9h/E2XeiBWMyfIEnZ2IfNKHooaSHZTDG3P5FRxClTy4V1Od8ThEqt
         DzU3k6wWYgdP5qQytabWb69/Dc4is3t9883YB6Qv4FPdAP3k3DYastzpRKfmj3fY7ncP
         Z8uSkTG6CL+Ldks0tGtRQSrhKl1nh0fz6oN9c1YNBERelvTSCEnvWZzGziJRpySGOtmQ
         JFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741272142; x=1741876942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VCk+JJxMuH+7Xc7MK7xCQnQ/UASRlAowqMx07w+Zybg=;
        b=xU3Rfz3VlYkeNGdz8E2t10ZjfKIt/Z0/JIBIMDwwi0w3OVgtVC5Gtlq+86iTiEV6vG
         5VrcMBIXID2coIKU8avLbeI/5H3WTsZhG1rlQtrC1WHLIER1o2MVl4mxPex6xSeEcceV
         7IkmxIj2+xGIBO/wBiTqja3HlgdtR8yLyLJ8WoLZamO1PMY3Vyo21fZAhDxhISHXmJkO
         tbkOld9/Mnsd2Nh+XH5cNLHlP4/LJr/xMaofrOjQ1PeNFnOT5zx3kLRFBtJL8fQ/eeL+
         QCdgvjfxZK/g71QXcbgXgl4teAlZj1+ts5iJblNJUQFfh94WkrXE6QNcnGyjOfZmijxo
         K64A==
X-Forwarded-Encrypted: i=1; AJvYcCUIyFpJVzZUnJNbYVqZAFThng2rCA4nm0XVbN6WJ9a87RUDTqfvWtv+KjLecI2VmqOm7uqqFLNWBd5bCt8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxN2M2ArZmVAVMESu7fMMcDB956wG2WaZ9QeEiMrFvBIONKYLXG
	XbPK/OJTpqlA/+L0U0pqQhbxuitTH+Oc9bZz66aDqey2LA2SP46PkV9+IEFWqmfPtI0PhIXova4
	WuU5POsu22xhC6OdphF2cF+v30kk=
X-Gm-Gg: ASbGncv7o+14LEGCn0Og7tSC2gJkN9nl+sdhqwuEzc4je5/wa/xLVdRF4DemuYKYrYM
	pBQP4WS3/YWtId0zcFPGwJuXTUcCnXEojevlZP/BYcIZFCZOH/oRqewHRbfiExOfaIu7wrVex8p
	R+lgRWvVqVUMha/98hJgkscbiEypVyjn+90kMosgs4/A==
X-Google-Smtp-Source: AGHT+IGOs0tm+vlePSriOvo4exloY4uff5hQyhMGSFCdw9I6NO0PFz3l856QvBjOCsMzUglvlxiovip4pW93x04X3AQ=
X-Received: by 2002:a2e:a78a:0:b0:306:1524:4a65 with SMTP id
 38308e7fff4ca-30bd7a5453bmr26242801fa.20.1741272141974; Thu, 06 Mar 2025
 06:42:21 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250221-printf-kunit-convert-v5-0-5db840301730@gmail.com>
 <20250221-printf-kunit-convert-v5-1-5db840301730@gmail.com>
 <Z8mUH0comOCpycpK@pathway.suse.cz> <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>
In-Reply-To: <CAJ-ks9nFSzRXFauavzSWhvhr2Rou7qqkWi_LZ=4e1Tyr4_bn3g@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 6 Mar 2025 09:41:44 -0500
X-Gm-Features: AQ5f1JpJWKoqf6Ad0yhsZAI6HTLS5t2uCBoOGMRrpWewZnGmz7aTZFflUPyKXMo
Message-ID: <CAJ-ks9nDLGvzZ+NDAJsk2Hy1=hsCzayg4-65gk60T_WJZzOUzA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] printf: convert self-test to KUnit
To: Petr Mladek <pmladek@suse.com>
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, David Gow <davidgow@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Mar 6, 2025 at 9:25=E2=80=AFAM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> On Thu, Mar 6, 2025 at 7:25=E2=80=AFAM Petr Mladek <pmladek@suse.com> wro=
te:
> >
> > On Fri 2025-02-21 15:34:30, Tamir Duberstein wrote:
> > > Convert the printf() self-test to a KUnit test.
> > >
> > > [...]
> > >
>
> > 2. What was the motivation to remove the trailing '\n', please?
> >
> >    It actually makes a difference from the printk() POV. Messages witho=
ut
> >    the trailing '\n' are _not_ flushed to the console until another
> >    message is added. The reason is that they might still be appended
> >    by pr_cont(). And printk() emits only complete lines to the
> >    console.
> >
> >    In general, messages should include the trailing '\n' unless the
> >    code wants to append something later or the trailing '\n' is
> >    added by another layer of the code. It does not seem to be this case=
.
> >
> >
> > >                       bufsize, fmt, ret, elen);
> > > -             return 1;
> > > +             return;
> > >       }
> >
> > [...]
>
> I noticed in my testing that the trailing \n didn't change the test
> output, but I didn't know the details you shared about the trailing
> \n. I'll restore them, unless we jump straight to the KUNIT macros per
> the discussion above.

Ah, I forgot that `tc_fail` already delegates to KUNIT_FAIL. This was
the reason I removed the trailing newlines -- there is a mix of
present and absent trailing newlines in KUNIT_* macros, and it's not
clear to me what the correct thing is. For instance, the examples in
Documentation/dev-tools/kunit/{start,usage}.rst omit the trailing newlines.

