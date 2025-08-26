Return-Path: <linuxppc-dev+bounces-11330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B117BB363CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 15:33:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB7s22hhsz3dTr;
	Tue, 26 Aug 2025 23:33:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::12f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756215190;
	cv=none; b=EREkOj71LTs82iOXdkhC1PasmU/HhnLPqWi1Nfx2tlqt3PkPHISxVpvMx2G9Pyyo/QZ4Jn0lj3segpxzbUltt8AtatXqtca8hcHZEBAwwT0ngrSoDAUXqoiIz8g/N4vvPJo+MfLy1af2JXo+Oa8tVRoS7NLAXAcbk+bwCfGmXZJPLD9jdtyi0s8PcNz9ZmKa6C6drORVi7ivOrSfW74uX78VCkF62IyEEA785pEfg9t9JAATOfyDRcPMDGcFHx9pm3jFz8zbjGcut+EqCfz4LBGUAJGHhafn+Xmp2kRf+TLdsYZrqumnl3CbSb+0aZqVzUmFwfVLeSp13xx4AdN3Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756215190; c=relaxed/relaxed;
	bh=mTDpa33JS2qApYszgwNnpSK7UHfHjgv5egclBQN5xTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h8UsKdNmXebXwDl98tJNpNBurayvvEOg0sLyfgJZ2CULu/IX4p/Lk9uOASs2TE7cq2A28vl/IXPItBxz96s+bZQ4xdMliyClesL1s7TwgKDC5StVV5kBqt6mH3UALK4IuDparaYcqx1qqtggaS7HhEaKtRNCXiwOeN4aUrMcx9WT7XN7BOkl17R/HqDcWR8uljJiErwmTT5HvJhyBWhFVgku63rQUHSRSGgddD/T2Vddj+xnmoddyXkBxRHOLYE7A4LFe43c9Ez7CpuCauCwD2Z5MtjTHbAOQKUQLkyL3FJEPCUAgjennPZGZp8N0MoKV5TTAuA1DzaP2AyM28j7GA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.dk; dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WU75lPpC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.dk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=WU75lPpC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cB7rz6xcrz3dHC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 23:33:06 +1000 (AEST)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3ef6866cd99so970195ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 06:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1756215183; x=1756819983; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mTDpa33JS2qApYszgwNnpSK7UHfHjgv5egclBQN5xTA=;
        b=WU75lPpC4mOeeLNjeuOnWPukSC153HEgWIaZ5N3RitfADdHUWVDUMqLktykjEvlYId
         0YsudeQLgFDW3/KmBS9KLoKf1iLgSkEYg21ifQ/0/LZCNjxF5HkjD+iWhbjlHUo2iR3E
         I3Xm2nv+Wwknc43oL+G/bgujpeJQM+2r4ymg/vDs37PQtA7q1aXsltQSeZQ5bA5aSM2C
         CkKwY9us23caPObTr3VsvhkLiZrVxz84Vo1OtfZQIEkyt31lYriWG2bqi9d+LaLT7xaK
         3ARaiQ8gFypVAPRbLzHtCskDoGmdEME+XVITAIefwtaAB/poq7zMAf35J6faFuoawLQr
         NGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215183; x=1756819983;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mTDpa33JS2qApYszgwNnpSK7UHfHjgv5egclBQN5xTA=;
        b=a6KWJcQWzVs65ZlCr+rqM4yoKhJS8hgqNmYh3nnDdGtcgMEl+RTnciJfurrDv0L6ag
         UAOUi6Vpwrvz3fMLO6V/HkjB4f24Krrynh8Cu2dR1kzqoDkRVutaAOGIDmwU8r4cs8vh
         WCD8r4VZTo99Ca9i1rvS3qGgaF5h5LzKvq+MPA08861v98P76Qtn5iKOKhU7FkybnyuS
         dLirbLM+aVTgrytxJqxMm7TxYYIcksHP2r7+DxRN8MSpdq8IXBYKUloPJJdN/NfnK8lf
         89FYYoy7A1Nyx6c8TohG+3aj7XZJCmJ7qf17AjZx2YEwbpv9JRp0FyLdSHHieUwZt8Py
         2w2g==
X-Forwarded-Encrypted: i=1; AJvYcCXyOecHG+EEpp4gSyOEFKet8asuouggInIpf+gRuQmmURPgUGUUrsAlmURclq9ezORxJ9CohqQUWXBg9OA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YymtmfCfOWynf4o9cTA7rJz0paaRXc0LjwvI/UPKLEwBjDpkZ6c
	SlIT4DdjVTTV4K+zuJz1t86Qx9oDyXXDKngKvK+Rsb2D/s0ub5BSW44e5WE8hVMleqY=
X-Gm-Gg: ASbGnctOW3v379QO1w9QGsmcZAGJvBjSNyoAn9jfOqqZ99uah+ouWsy9/N8kiAZPON7
	bnClIQZpPBdfoyR9QnA4Dl82vGHSdV2Vm5cWtHQTB27Ar6tXFdrPbOpOWcgCrXsXSTGo8A3g1Wk
	qouccGN0wgieJNusBzGf+D01hsZq+QswGNZ6o/CPVyOSFZKyuEzkziBYsn6d4KZPnxzNwNLzWwl
	PoEkpiV3nOCiCt+WbMpL6rsmeewHRIo+wfskJAh2hnQX77CvH4wwFvbIKiIeC5IaTqC41OunK1r
	BEHJ1T1gFRArGgJCbZvzgkXWIe5Fyt2RI0nUwvIRUWIKXlzFUcNZs8lS0j63LR4+k5FqI4uzwjm
	PuIzgCukvL9yjcilj1G3UpAMNLpzN0g==
X-Google-Smtp-Source: AGHT+IHyeNqFLofJtawZSGlF7nwnpmwOET4pLDhklPZVdBrPT2USiWbLxPrFpiB4fDQsUH70NQxHfA==
X-Received: by 2002:a92:c244:0:b0:3ee:7c7a:c880 with SMTP id e9e14a558f8ab-3ee7c7acb24mr41586495ab.28.1756215183022;
        Tue, 26 Aug 2025 06:33:03 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886c8fa63casm630889339f.17.2025.08.26.06.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 06:33:02 -0700 (PDT)
Message-ID: <4d8cfe65-a8fd-4f3d-a324-8873f4016ad0@kernel.dk>
Date: Tue, 26 Aug 2025 07:32:59 -0600
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] floppy: A couple of cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Fourier <fourier.thomas@gmail.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
 <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
 <aK22kUhlxlyvVLax@smile.fi.intel.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <aK22kUhlxlyvVLax@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 8/26/25 7:28 AM, Andy Shevchenko wrote:
> On Mon, Aug 25, 2025 at 02:48:21PM -0600, Jens Axboe wrote:
>> On Mon, 25 Aug 2025 18:32:54 +0200, Andy Shevchenko wrote:
>>> There are a few places in architecture code for the floppy driver
>>> that may be cleaned up. Do it so.
>>>
>>> Assumed to route via Andrew Morton's tree as floppy is basically orphaned.
>>>
>>> Changelog v2:
>>> - combined separate patches sent earlier into a series
>>> - added tags (Helge, Geert)
>>> - fixed typo in the commit message (Geert)
> 
> [...]
> 
>> Applied, thanks!
> 
> Ah, thanks! It's good to know you can take (and actually did that) them.

I've always been happy to apply floppy fixes or cleanups, I just treat
it like any other orhpaned/unmaintained block driver.

-- 
Jens Axboe

