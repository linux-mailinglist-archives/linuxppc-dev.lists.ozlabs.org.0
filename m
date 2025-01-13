Return-Path: <linuxppc-dev+bounces-5119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8589CA0B116
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 09:27:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWlk70DkKz30Wl;
	Mon, 13 Jan 2025 19:27:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::229"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736756846;
	cv=none; b=dMO/NI3ZbxQ1I5xcxu6EPMw7YWDlLEJCaMW0TsCIwS+dse/jukYpvzF/GwqhhB27z1AjiuJt2LjqaCuzq6gVog0TUEAj6rB5hl6WqYbZtrTRMe7uyeoNFg9i+MpSB1ERCRFdF0TM5rrgNi+0INMm5L9d5Orei4AI8VsVRkM5NYeVPuUu4fgNjxaMOjsTuhpo44WYSi3lc/Hj4VV1QhMfj/QGmOJ/6zWh9bb5A2FJwHvmMv9ZxUCVsKbBzdVkQPiHElhp46lPQOW3ZefMKbBT8kZ7UzSE6iCPkIme3W0n1p0nwoRdFbV33+JXDK6AYeg9fbGiEjHY42xdWQylIaHHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736756846; c=relaxed/relaxed;
	bh=m7czTCt5DgRu7CfYHHHSqcATvcfKa0xxPZ0cCCGUQX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgjL5cuEbK0YEWGz6HgmNmmX9t6dONwr2HhvFfcTfXwUHS5VBT2Xtw5sGEr1QHBJNcrPpScK4c2pnGJ1kdzJ5JePjS7WTfltpuBh15TuQcpJ3/JlhvxSRR+98efl3ewmn/AckjiFPvxuywgcCqqMKWJuEBWnZVLTLhwl4qWlOzC45GS9x0np9JDwFmuLmSNxPJuilbXM8GYExMKnfN08kbyuTvz0V4W6cM3hPy9kVZ4Yk1KCfaipilMUXEJ5lA4/kvjjSVgU5AuF/nBnAdKh/hmLhg2IlmCVd/qd2VY6u+beAVO1dlV6BPRI0bj0/sPuHzWlxbF9Kw5IzLuzir26SQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GomcvOKC; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=wangzhengshu39@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GomcvOKC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=wangzhengshu39@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWlk50m18z30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 19:27:24 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3061513d353so12405171fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 00:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736756833; x=1737361633; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7czTCt5DgRu7CfYHHHSqcATvcfKa0xxPZ0cCCGUQX8=;
        b=GomcvOKC8HL6tpQxAqXbWpyTzeKzHJ8HPEkN8k2k5sNPT03fHZo48Lc+mwyuVEsUGu
         pTUf/ftir5HbIFV2IG1IcrkAsBNpcQ1/+pfgM2f4nPEo1PQRlU3i+615zYd9aYhfuKbJ
         fPQ6Z3aTiLmsRFZRhtda54Av7ZmlyJWkBoY49JPmsl6NclFKSa8Gh2utGukVRjYm/kS9
         /ZdVBkGQFmEDY+P5FKKshR8iKx3GYSmvejPIz7z+1wJGk9dH5ev2qJYh0xIhMH5ASncO
         WEitr/IOiByM0VnnIsVAqPpnBh79fAOOMXKYfmhwnvFJc+lzeXMm75k/Y8LMjQ1W0Y1F
         oTOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736756833; x=1737361633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7czTCt5DgRu7CfYHHHSqcATvcfKa0xxPZ0cCCGUQX8=;
        b=r5dzIp2g/lmk9ytkFoifyYb7wdID7JcKncpl8Ml1CEqGGAWkHjGeX4VaqKqlRC8Nik
         qb2ee4vDUAbJkTHldpnt/jAJCkHWVQQ6u4YNZ5ddjJUrPgIBFOvTaDm6Ej9lPBKS+9XD
         AHzaL3Zgknt4Ic1bvZZb4PVLNDC73hso1G2nOsC7/W4EFXBSIjZb/AUDWPVUCHPuVo99
         SOZ1ipzSb5fLLmjSezOGrQk42ogw/Nhi7X9ugt2ME61E2Vzzk1nirXQjL5ZM+R8Zdkpi
         k4eGMEZJdc/JR06ydgDZRu8rOEzlUzDbwWQnMuVrydR4Xt0ZH5ds8cuHhYjSCOb4q41m
         gRQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdg5k0DBSNEF3Q/yLrcvYuNDpZL9pNJqeOnr5PyOHUGyRFm7HnWDIXXzCLei96wM4yW0JjEu9jwcs0/bk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzFRiB5Lgahrk2/iGcaPx9pVzbfZRy3HIXl+Jy75p0aDvFAIK+b
	Bst/urg6/Q5CeaDRK0y9uNMMhN8QoLPIqv0ahRWwqvfUHxblkD9HGQflNKu9Y90JNOj6eKy7uAn
	WltEGz+xTtQg6BZrE1I/59gMUNFw=
X-Gm-Gg: ASbGnctGLTTJC2lcrc8rPuEL+9GWkOjcwkMcqLFlBWQ7/ZAhBQkcl2ISOnrGPgnzFjx
	hjJ/6qijiBBE1IMgwkNvwjHBiiotb7oFdL0MH
X-Google-Smtp-Source: AGHT+IHbnPn6i9h7YBUlLi8m5aMfqWXK89UzEp3V6TTJV5vWAk5yvS0/3N9anCOG7Usk3SgfvFBd5HW9NsEBwWHSpx4=
X-Received: by 2002:a2e:a716:0:b0:300:4362:40 with SMTP id 38308e7fff4ca-305f463cf58mr41312191fa.36.1736756831112;
 Mon, 13 Jan 2025 00:27:11 -0800 (PST)
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
References: <CAGXGE_JWtMo8Qs=hsH=NULkDRFoYKYorKHACpqvqpYiO3am8eQ@mail.gmail.com>
 <CAD=FV=VOjzdBvyx9-g=Mvv6SJvur5ogtUbRfR3oCFpQoQ4VK3w@mail.gmail.com>
In-Reply-To: <CAD=FV=VOjzdBvyx9-g=Mvv6SJvur5ogtUbRfR3oCFpQoQ4VK3w@mail.gmail.com>
From: wzs <wangzhengshu39@gmail.com>
Date: Mon, 13 Jan 2025 16:27:00 +0800
X-Gm-Features: AbW1kvaZRDwF8NRC6pRwpBV01fZRcE__7p5mkdq9ZI2BSDV4bxbnWk5RbAlBpYo
Message-ID: <CAGXGE_JaVxfpsGh4qqJ4zb3smaV3EFYPggtF9cEQvv_BtBR+Cw@mail.gmail.com>
Subject: Re: watchdog: BUG: soft lockup
To: Doug Anderson <dianders@chromium.org>
Cc: tglx@linutronix.de, liusong@linux.alibaba.com, akpm@linux-foundation.org, 
	pmladek@suse.com, kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	jan.kiszka@siemens.com, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, yaoma@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Thanks for the tip!

Doug Anderson <dianders@chromium.org> =E4=BA=8E2025=E5=B9=B41=E6=9C=889=E6=
=97=A5=E5=91=A8=E5=9B=9B 01:33=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Sun, Dec 22, 2024 at 10:32=E2=80=AFPM wzs <wangzhengshu39@gmail.com> w=
rote:
> >
> > Hello,
> > when fuzzing the Linux kernel,
> > I triggered many "watch: BUG: soft lockup" warnings.
> > I am not sure whether this is an issue with the kernel or with the
> > fuzzing program I ran.
> > (The same fuzzing program, when tested on kernel versions from
> > Linux-6.7.0 to 6.12.0, triggers the 'watchdog: BUG: soft lockup'
> > warning on some versions, while others do not. Linux 6.12.0 is the
> > latest stable release where this error occurs.)
> >
> > The bug information I provided below is from the Linux-6.12.0 kernel.
> > If you need bug information from other versions, I would be happy to pr=
ovide it.
> >
> > kernel config :https://pastebin.com/i4LPXNAN
> > console output :https://pastebin.com/uKVpvJ78
>
> IMO it's nearly always a bug if userspace can cause the kernel to soft
> lockup. I'd expect this isn't a bug in the soft lockup detector but a
> problem in whatever part of the kernel you're fuzzing. For some
> details of the soft lockup detector, see
> `Documentation/admin-guide/lockup-watchdogs.rst`.
>
> Presumably you're fuzzing the kernel in a way that causes it to enter
> a big loop while preemption is disabled, or something like that.
> Presumably the kernel should be detecting something invalid that
> userspace did and that would keep it from looping so long.
>
> I tried looking at your pastebin and probably what's going on is
> somewhere hidden in there, but unfortunately the beginning of the logs
> are a bit jumbled since it looks like the RCU warning and the soft
> lockup warning happened at about the same time and their stuff is
> jumbled. There's also a lot of tasks to go through. Honestly, it's
> probably less work just to look at whatever you were trying to fuzz to
> help you pinpoint the problem.
>
> I'll also note that you seem to be using KASAN and are running in a
> virtual machine. It's not inconceivable that's contributing to your
> problems. KASAN makes things _a lot_ slower and a VM may be getting
> its time stolen by the host.
>
> -Doug

