Return-Path: <linuxppc-dev+bounces-11223-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B35B2B32274
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 20:53:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7q8950LVz3clq;
	Sat, 23 Aug 2025 04:53:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::335"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755888793;
	cv=none; b=X0ZBkDvqGZ/VBO9/8IpmhPSuVyu5MK/ZGpWWz8LTselfUm4Zu+3RrOEHVpWvBn4V30XEhQ1YHpxaVfvvVSixe4/8Q+20q85fwxvg+orPT4282e/u4KHpafW5BxhgW5tv30uYXlb+EdcojAImdICP47dgGvKmnUp0+CKShmbScJ+OB0JHluvIUacZ0/kEEXIUwK6gjCk0LrbFSRl3Wg2STp5RAxB9zMj30r6+fSfN2LRffw5K2+C8upRpS+w/IcSbdfglYD5A4fglFIteQNzIlI07eFJpVxUq1Qb8ac1h0l3Di7kzArV5wxWIV+3DqLy6kdKUMFKp+1LdjNF5HY/1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755888793; c=relaxed/relaxed;
	bh=kgQUn5CtNABDqKDSDivPq45BncqGSev+VDo5NGeADv8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bNBockWAitdwGYpXCCZc06YfqC71buykEFN8R+m9gKe4z7+4U6PTTmulKP+CaR29uLrFBO/OOyTR8/ULpQypysDr6mOw/qeEqzALftU6aZhOGCP5vGjo4Yj2IhVm3VxphCda7DD4CZ8M4IEUmQCRmuHDseJCy9uAiibCvi/S3TTGNm32J8WUhNrErDDpMNVkvGaDxCvRE0HWn73Oe2jY6J1qWcJGy5Jv0kU7Bo/tL7q05Wg/hV11x64TY+AOr0viD8Le1wCkqbK8PGuIxy9cA0Z84vgIeHft23u0hi27mY3BgjuevAV7sGvpBi/UiEcXMScocMLDauAj9s4zyXAetQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k9vMtyGz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k9vMtyGz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c7q884P6Hz3cky
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 04:53:12 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45a1b00f187so13779975e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 11:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755888789; x=1756493589; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgQUn5CtNABDqKDSDivPq45BncqGSev+VDo5NGeADv8=;
        b=k9vMtyGzTTMnkLINWOfuSEWri2jtxaZ38IRP+nkIppHerXZqDJ4ChQ7AVlQ8USHlS5
         o4QiuS+KZCtqw1+/09Y3OiPf15xOepRV6J+qfzhGCq1tKRTXulvMsmZCbxOcpjkIuXg3
         jZxL0xoJCW7HYnoncN1Y8pO3VHxw/6uwgHfXxCLBMIQn25Ay7I1ZPWCr3sL91X6k2Xh0
         cdNc49LEvIfDNBVcnO+kIMzkxEJiGy7RyFOFSmbe3ph5xkzSzMbqhlXGGgk7ADgTILzZ
         WwHcVBhjbhOkMEgeqU3tC3cxATTqFz54NPOW3t8d8MXbzSrLMiLSwgIV/sci7gmuDakq
         loNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755888789; x=1756493589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgQUn5CtNABDqKDSDivPq45BncqGSev+VDo5NGeADv8=;
        b=GmGiuxWrqw6Jl3dp6GrF5/uRqb3Aclr6MPORRqxrR6W3OJsylL8SmnMGza31qReg0s
         XPxB/IC4SIV9JB8/bSNiWQMxeirGlKJhkCAAH+VnWZHnTSlNM/zQddfL3PekByHK/AbY
         580cHvmW090wrYfdyVBf0VohEVvWfBbv74+c0WyaYaki1H/IvlzmPSu5w3tKrotdfpYa
         ImXFN0ci3/3NpItyom6R/dDLOAOZLbYJcLeZ8YC0XYVO83sklMODzY3NgJH8HLHVfT7z
         PvAugCNELB0Nug/ZqhFCYgOBqYZldSZBzjvf+CShzzb/8KEa+WskvrlDgefWNoKocP+c
         ZbAg==
X-Forwarded-Encrypted: i=1; AJvYcCV986eSkBvOyYyR6wwX8jV+dDjENVRDi7jHZcy+wBrT8oe6WvicObLiDl/vrEmI9L+SbLqv1H7Pm6t9LTE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwSPiiGaSXalf2480Tv+fGdJdd5A3zd8KotH2Y6XfzaTKHrSZfA
	Ps5dFuT6T1MCDnMxpTpQKg9HoNYPt/LXRt19kVh6shEglLXdZTLq72ME
X-Gm-Gg: ASbGncu7KBAvkNc+A4fVnMEtKZJng9vb9ZUxQTbeM1MffI1Bh1ZzKCgNXdIzpGtVEcZ
	/af6N4yyEsyaBGYWwd/ciC6eKgm2afMeBelZc1Bdr6CKmPb0mdEpP2njTndOFVVCCPJthB5DgNC
	WWjjSBJHJmaOyYEzrWb8ALI+EPPurwA6LZowRWM4Lps2ZYv/6SyEPlk2sTcA2jdxspL0UoMjapk
	RRPDIXXdSPcpsF4uwzwJ0RSWafL7KLGyrrnHYt8hckncVv9qJXDcvPER8xuZbk6d6Yj3W5cAuMg
	b/qB9YBjm92PGxeaq6+vWbOcmZ5DWT3Ftqdg6CCU9e97DROQjsm/ZN52DNTr+8AaTOTCRQjntyV
	a0HjKvNXPu/j5WFG6Fmri1+pu8TT5tAkjV3F0/MXRLw6BrS+CCZFxq++L2NkTIIxI
X-Google-Smtp-Source: AGHT+IH2CJD7uzzmkgj7levHo8yeRDnD2Rey6jjYpn4mLRK/SjHZtD8Mo7fIGKErdyaVDFxn1SiP2A==
X-Received: by 2002:a05:600c:1d02:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-45b5178e6d8mr38320405e9.8.1755888788475;
        Fri, 22 Aug 2025 11:53:08 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c70f238640sm527339f8f.26.2025.08.22.11.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 11:53:08 -0700 (PDT)
Date: Fri, 22 Aug 2025 19:53:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida
 <andrealmeid@igalia.com>, Andrew Morton <akpm@linux-foundation.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, Daniel Borkmann
 <daniel@iogearbox.net>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-block@vger.kernel.org
Subject: Re: [PATCH v2 02/10] uaccess: Add speculation barrier to
 copy_from_user_iter()
Message-ID: <20250822195303.0d9fb6eb@pumpkin>
In-Reply-To: <CAHk-=whKeVCEtR2mQJQjT2ndSOXGDdb+L0=WoVUQUGumm88VpA@mail.gmail.com>
References: <cover.1755854833.git.christophe.leroy@csgroup.eu>
	<82b9c88e63a6f1f5926e39471364168b345d84cc.1755854833.git.christophe.leroy@csgroup.eu>
	<CAHk-=whKeVCEtR2mQJQjT2ndSOXGDdb+L0=WoVUQUGumm88VpA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 22 Aug 2025 09:46:37 -0400
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Fri, 22 Aug 2025 at 05:58, Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
> >
> > The results of "access_ok()" can be mis-speculated.  The result is that
> > you can end speculatively:
> >
> >         if (access_ok(from, size))
> >                 // Right here
> 
> I actually think that we should probably just make access_ok() itself do this.

You'd need to re-introduce the read/write parameter.
And you'd want it to be compile time.
Although going through the code changing them to read_access_ok()
and write_access_ok() would probably leave you with a lot fewer calls.

> We don't have *that* many users since we have been de-emphasizing the
> "check ahead of time" model, and any that are performance-critical can
> these days be turned into masked addresses.

Or aim to allocate a guard page on all archs, support 'masked' access
on all of them, and then just delete access_ok().
That'll make it look less ugly.
Perhaps not this week though :-)

	David

> 
> As it is, now we're in the situation that careful places - like
> _inline_copy_from_user(), and with your patch  copy_from_user_iter() -
> do maybe wethis by hand and are ugly as a result, and lazy and
> probably incorrect places don't do it at all.
> 
> That said, I don't object to this patch and maybe we should do that
> access_ok() change later and independently of any powerpc work.
> 
>                  Linus


