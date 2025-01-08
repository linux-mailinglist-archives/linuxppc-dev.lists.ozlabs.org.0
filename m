Return-Path: <linuxppc-dev+bounces-4864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37491A06389
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 18:34:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSw674qmvz2xnc;
	Thu,  9 Jan 2025 04:34:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736357695;
	cv=none; b=e4chV3rFYdNV+a1brCtp46Lm6hIW2l7kJe9KB6fTTkXX4V7aAWjgjqq7pHH/v4lO2a41eRQsg3NV030Ji5crl4L7IDIep30YiY6rukFU4B+02xk/MUwQJ0+INysH3etCDvKFMVbHjawtbkXZK2iyl1ISSHtlOZTiCjGcSartotTLfQUI2FYj3ermIXB6v8sxEI1iLvOB5TnKvVdzF7/3bVxr1R2gNBeH3T4Y1DgdrIB0JcESoOo899T0uuP+kST+qNzpH2ekNa8ldkVvwY8HJqSENIRcEO2BLkXom8t+XMEWz4UytQLCg5DFkl7sOEth1+L0CGkAeO6n2bCrOnRjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736357695; c=relaxed/relaxed;
	bh=uFSUfP1qtRuzGaG+XFGpp6Zt99NNZ4zrYvsYvHahhsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJPlOs8ppvBuEXdtEmmiwyQIgJDQ3JqgBa26ts3dsSn/XUlAba+wiG30RNFE2g/m4uYA+LLhC7ws1y+n1PQ1XmjWtUaqBUBwddp0ByOwq5kYxyebI6O8W5CbFGFGfX+uyPJNqzjK19c/TZ4F+FzuNHRKRPD7IHWmNOrFz8gMfhynbCBz+EM2GA0PEr3be5AbksRb5DyAIa7+iXUP8wNG21jl94f2TjCNCHWFTp8wViy7Azw2lQcypkMY6kLjtEqzFAOfzEQ6hr9cwjmJaD4uxF39KVTQPc9q8nX2fL2yse0yDmyRj5rrYj+n5qjsLTzxn+E1XsdD6dTwJ2+7Lu2XJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CuJHc01O; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CuJHc01O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSw654Z1lz2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 04:34:51 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so14403008a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2025 09:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736357687; x=1736962487; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFSUfP1qtRuzGaG+XFGpp6Zt99NNZ4zrYvsYvHahhsA=;
        b=CuJHc01OM9knnIOe9bHLTwexrS56YqBdMpmoFw6nbyE68DHrZu0ipAmt8S1ObJC+Ia
         bG4A37FjQLSPtSFsDjV1d1+08vxqwKI6uFe0RdvJXMWfzQxf6OhRG19161cMAw0cTDKM
         6oTkPpGuIudEqfpPJKc+suQOWJ9G20289rCYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736357687; x=1736962487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uFSUfP1qtRuzGaG+XFGpp6Zt99NNZ4zrYvsYvHahhsA=;
        b=CrZeXc+uGfjklABAzAJixz/1DI5r5WiMqdZ7sJIIotVjnixwNfbH2XmfuGFzT5hTLL
         +Kf3VpyjACYDxj2suz9jQpK5hg9mQJ+ge1EZoITC8knIQn2asqsBg8BTXOeRx1mPm9pN
         sQdtP88Ld48DRh9zzbHrTB05iHim3SKyHK790B2exJU4rFabHmoW3BWJo7IU9JXED476
         eQuZ0SUw26i+v/Sny/IUVDejnNU3a07hSTU1b4VbEaH+1vqPAk4lQ/yye1+VOkPpbLK7
         nWGrYT62woQUn1OpIBcpGZQhwF3fCuXcKmS15Ikbcw+uXTh2wHl2HWfbaxb0IxJ/MIZR
         cUaA==
X-Forwarded-Encrypted: i=1; AJvYcCWmboeUIW6KJ6W4/lxKoJtTJxmeuOGVFj/l8dTe1sO7oXYjZObTgTjtaOYosC0ezOj/mf1xi04Cv6/NGIE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzEmYf1jwtvJ2cZ2pyOJukQ8gHoferIjYoD02AHEAl4tBpruv03
	xaDVToscZMdrGFUekyfQ4khXf062A5YcO50LHdBPIFWTc3siETtfWbSvR06fRcyRz4c7295Brix
	SSV7w
X-Gm-Gg: ASbGnctrHVYtVOuO4vzxCJEFr75C2UAj9Zb1EkgiT/v2AnSVaWcJpjepRW+KH0Bo2sM
	bzHKkjoLK3eP0wQB/O92FJCOMgTbQKVMGCBqHPtgUo/HxamV5y/LXUdDwi32zyhIxy7YpszmLSA
	q+4LlMXBQ6DAL7Onn9gxwlpAnu1m3CJRjBCloViYCuI3/z5ss+bulWEVrtmpcWK63sQFQjpHNrM
	eXOtJ1tzOxoAJRjHULfmIcBe6b2h/1tXJ7WQKIj7RDnEaGfh7vCGsUNJqunG+YdNxK9BQkmLnrP
	1dkNotO/MpRsYmV62BBg
X-Google-Smtp-Source: AGHT+IE7Q6ysiVQk2gsxCwcy9K0QoGNW8iwQ5KwS3YYP9jmJ29U53IuSLFTRJiCqVR9L21YPh2bg0Q==
X-Received: by 2002:a05:6402:2681:b0:5d0:214b:96b0 with SMTP id 4fb4d7f45d1cf-5d972dfbc21mr3185274a12.1.1736357687277;
        Wed, 08 Jan 2025 09:34:47 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedca8sm26137937a12.61.2025.01.08.09.34.46
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 09:34:46 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361fe642ddso803325e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2025 09:34:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjvEI7pzifs4IqLEujbkJOYFMuS4jo5XxYwthX3rvKuhH/nzwMuJJsQ2NHIkcyhpV2WMbM7Tt3cKZxfLU=@lists.ozlabs.org
X-Received: by 2002:a05:6512:2354:b0:540:21f1:e9e7 with SMTP id
 2adb3069b0e04-542845b9b94mr1068026e87.16.1736357249082; Wed, 08 Jan 2025
 09:27:29 -0800 (PST)
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
In-Reply-To: <CAGXGE_JWtMo8Qs=hsH=NULkDRFoYKYorKHACpqvqpYiO3am8eQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 8 Jan 2025 09:27:17 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VOjzdBvyx9-g=Mvv6SJvur5ogtUbRfR3oCFpQoQ4VK3w@mail.gmail.com>
X-Gm-Features: AbW1kvZ7WHp39ciL3QA7T0aXBTFHS6WcSbmLSDiGkRPVgTELV5ossj5Zmm_Z_6A
Message-ID: <CAD=FV=VOjzdBvyx9-g=Mvv6SJvur5ogtUbRfR3oCFpQoQ4VK3w@mail.gmail.com>
Subject: Re: watchdog: BUG: soft lockup
To: wzs <wangzhengshu39@gmail.com>
Cc: tglx@linutronix.de, liusong@linux.alibaba.com, akpm@linux-foundation.org, 
	pmladek@suse.com, kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	jan.kiszka@siemens.com, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, yaoma@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi,

On Sun, Dec 22, 2024 at 10:32=E2=80=AFPM wzs <wangzhengshu39@gmail.com> wro=
te:
>
> Hello,
> when fuzzing the Linux kernel,
> I triggered many "watch: BUG: soft lockup" warnings.
> I am not sure whether this is an issue with the kernel or with the
> fuzzing program I ran.
> (The same fuzzing program, when tested on kernel versions from
> Linux-6.7.0 to 6.12.0, triggers the 'watchdog: BUG: soft lockup'
> warning on some versions, while others do not. Linux 6.12.0 is the
> latest stable release where this error occurs.)
>
> The bug information I provided below is from the Linux-6.12.0 kernel.
> If you need bug information from other versions, I would be happy to prov=
ide it.
>
> kernel config :https://pastebin.com/i4LPXNAN
> console output :https://pastebin.com/uKVpvJ78

IMO it's nearly always a bug if userspace can cause the kernel to soft
lockup. I'd expect this isn't a bug in the soft lockup detector but a
problem in whatever part of the kernel you're fuzzing. For some
details of the soft lockup detector, see
`Documentation/admin-guide/lockup-watchdogs.rst`.

Presumably you're fuzzing the kernel in a way that causes it to enter
a big loop while preemption is disabled, or something like that.
Presumably the kernel should be detecting something invalid that
userspace did and that would keep it from looping so long.

I tried looking at your pastebin and probably what's going on is
somewhere hidden in there, but unfortunately the beginning of the logs
are a bit jumbled since it looks like the RCU warning and the soft
lockup warning happened at about the same time and their stuff is
jumbled. There's also a lot of tasks to go through. Honestly, it's
probably less work just to look at whatever you were trying to fuzz to
help you pinpoint the problem.

I'll also note that you seem to be using KASAN and are running in a
virtual machine. It's not inconceivable that's contributing to your
problems. KASAN makes things _a lot_ slower and a VM may be getting
its time stolen by the host.

-Doug

