Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E248414593
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 09:49:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yFJD1tn5zDqLh
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 17:49:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=mingo.kernel.org@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Slaf58rR"; 
 dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yFGl6Gt8zDqBY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 17:48:31 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id p21so14472697wmc.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2019 00:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lOMmC2TdPGvudZ5zd3K88q7Hkn2nNBdEod9TPs+T1As=;
 b=Slaf58rRFMPspfJPXpmTfLlvwHidotLOMxhyQjova1O4DpsmA/t1EGlinnwrWNjZEa
 WGXX51gARplly5SfcaxFi1xynREwymrx2nkYqsnw8tXplC1Jed+eZEL89EAMgspKPkx4
 VMPvROYT21z9Gfa2hf4YEkbEZMzU64Pnrvx0w/E2NvCgLPuXS/Ce2M5vuYhuVd2j+r4u
 wKFhmjQwd8VN5pi1cR7+4kAfj/k4clFbyCNw4CyQnrW+2UniB1kSivgEVBjU7pyF37Mw
 fisW2RubkyT9oK8pxfLjs06SlLs2nGZsRfxwfbOxUCSoy1gKnwLXV46GP1FupbieOKBi
 gikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=lOMmC2TdPGvudZ5zd3K88q7Hkn2nNBdEod9TPs+T1As=;
 b=BZdUO+UbwHja+Qd1BlX5ae5yeqWcfYDkk23ErK/ewT1To5E87bur4/VnkuZTdYYqSf
 RLLuaiIucfum+fPYKtWJNy6JNdgnfi9ThlmPgRCR2q7yGCHajROzBPNseo69XrWsA0Ac
 PDkRUbQ87OX2bajQ1fVQNuxjrLfGv/0/4CxJ9ZvTyDDkOAHWrz33uQbj216UQMXX/ioN
 rc1R+twzAQQ6cIJr3pCPp9C9sLXKkQ1tsCwCQ7zrPtqsznSI0UKnvT9+mTirhk2nNeyJ
 sOZCVdjvFYofwUPeyC3WVn7B/ush6D6ERwmgTdLe7cDOwtZHzyt0pi4kUPYI7LjBm3pV
 4rAA==
X-Gm-Message-State: APjAAAVBT6UfQvGKh9EEFYanAEdSCjp0wzoyVs7VLOKkTGkGKt1n2+5y
 S2QtbklMlN7/x7YNgsEcK98=
X-Google-Smtp-Source: APXvYqyxnM3H0RW7VAjyrnVoeQuJS4dJsfRQz2+6D0KPmo/7z1/mSm31TtogRWgjeRvZ41viotGPaw==
X-Received: by 2002:a1c:4602:: with SMTP id t2mr15129112wma.120.1557128907723; 
 Mon, 06 May 2019 00:48:27 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id u11sm16796834wrg.35.2019.05.06.00.48.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 00:48:27 -0700 (PDT)
Date: Mon, 6 May 2019 09:48:24 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 00/10] implement DYNAMIC_DEBUG_RELATIVE_POINTERS
Message-ID: <20190506074824.GA40476@gmail.com>
References: <20190409212517.7321-1-linux@rasmusvillemoes.dk>
 <1afb0702-3cc5-ba4f-2bdd-604d9da2b846@rasmusvillemoes.dk>
 <20190506070544.GA66463@gmail.com>
 <25dfde77-fdad-0b99-75ec-4ba480058970@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25dfde77-fdad-0b99-75ec-4ba480058970@rasmusvillemoes.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 Jason Baron <jbaron@akamai.com>, Ingo Molnar <mingo@redhat.com>,
 Andy Lutomirski <luto@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:

> I _am_ bending the C rules a bit with the "extern some_var; asm 
> volatile(".section some_section\nsome_var: blabla");". I should 
> probably ask on the gcc list whether this way of defining a local 
> symbol in inline assembly and referring to it from C is supposed to 
> work, or it just happens to work by chance.

Doing that would be rather useful I think.

Thanks,

	Ingo
