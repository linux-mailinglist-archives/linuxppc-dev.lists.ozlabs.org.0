Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0E44BBD7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 17:30:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0ccG1SFtz3cbY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 03:30:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=networkplumber-org.20210112.gappssmtp.com header.i=@networkplumber-org.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=17FGGI/Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=networkplumber.org (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=stephen@networkplumber.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=networkplumber-org.20210112.gappssmtp.com
 header.i=@networkplumber-org.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=17FGGI/Y; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0cbX2rqXz3cNc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Feb 2022 03:29:25 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 m13-20020a17090aab0d00b001bbe267d4d1so797621pjq.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 08:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+S2A0TOvwCJqKZEf2n99ER8D0GRma+qu1vDI6jWof+k=;
 b=17FGGI/YNQ0KAFTAypdxgCTm9RsrQp5K+/cVxDpHxnSkxeVsiaSt9Ac07mjSXc13ZK
 h5Ktl0Ae9ERA3vumep+jO9/6crSymL4N2TdTM5DBCyniUTz322SOFXsEU2aB7M3NSZQp
 z5hdVjRJWawRVRC0hpmiGDUjVPj0CD4yz5GQBg6hUP2yFvgjq4iPANEEQRU+8mSBTiHQ
 A74gL4IMVRFT6lyj4iCaPqObqquNtP7bwR2C5I2kljvhaKHQ9gMBTIUNlISvXQcvzFwd
 VQmKQo8+Hfr3ClRpm9RFA9lJXxMQ8O/AZd5D3rPCYmee6i9hEsWNVIuVLJwzf83SOXO7
 fY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+S2A0TOvwCJqKZEf2n99ER8D0GRma+qu1vDI6jWof+k=;
 b=sILjHdDj/ZHQPy3avMSb2rtTHq8eVtC8jZNyTtrpJD3HVwbECa0CkTQ0ucswwaczTm
 mTbf8n3bsbGlPFd/an0khbAD2Xi53d42ByiVYKd4106XQo7yvGJ1S1Hrijs9GXuIXlum
 uhB4G5HHznSX+lG41a5YSwhPJnZi/fnO6AW5c7EM3nyo1azNh3zmb3VqET+er7m/dxuv
 cOBXTb0c5Zx+PP73VSf6Rb2e1FQClbPuSU+V5mqECft5F6NVG0P1NR3tvgsmZmNhEtGJ
 L2PT16XLLWmZKxfO+G7uoKfu92Fp6a/FoIx5/tDOOu8aEb79TMhQQcd+X/AZJH6kRdm5
 QGIg==
X-Gm-Message-State: AOAM531PtEK4syZ04PEtQre5GHTb/Yd0MEsa2HMOzQOiK6KxrFKFInWo
 ufNBeLM35yfJjB2x7KjAk52yLw==
X-Google-Smtp-Source: ABdhPJwExeAIiHnGtSDYvzLTn9a79LfvNamR7Qrx/rmjXi3TsyKaPlksaqY9nzNuXqJXPRkk8OfIyw==
X-Received: by 2002:a17:90a:bb0d:b0:1b8:a958:543d with SMTP id
 u13-20020a17090abb0d00b001b8a958543dmr9142994pjr.51.1645201763446; 
 Fri, 18 Feb 2022 08:29:23 -0800 (PST)
Received: from hermes.local (204-195-112-199.wavecable.com. [204.195.112.199])
 by smtp.gmail.com with ESMTPSA id
 f16sm3920555pfa.147.2022.02.18.08.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 08:29:23 -0800 (PST)
Date: Fri, 18 Feb 2022 08:29:20 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH net v3] net: Force inlining of checksum functions in
 net/checksum.h
Message-ID: <20220218082920.06d6b80f@hermes.local>
In-Reply-To: <20220218121237.GQ614@gate.crashing.org>
References: <978951d76d8cb84bab347c7623bc163e9a038452.1645100305.git.christophe.leroy@csgroup.eu>
 <35bcd5df0fb546008ff4043dbea68836@AcuMS.aculab.com>
 <d38e5e1c-29b6-8cc6-7409-d0bdd5772f23@csgroup.eu>
 <9b8ef186-c7fe-822c-35df-342c9e86cc88@csgroup.eu>
 <3c2b682a7d804b5e8749428b50342c82@AcuMS.aculab.com>
 <CAK7LNASWTJ-ax9u5yOwHV9vHCBAcQTazV-oXtqVFVFedOA0Eqw@mail.gmail.com>
 <2e38265880db45afa96cfb51223f7418@AcuMS.aculab.com>
 <CAK7LNASvBLLWMa+kb5eGJ6vpSqob_dBUxwCnpHZfL-spzRG7qA@mail.gmail.com>
 <20220217180735.GM614@gate.crashing.org>
 <CAK7LNAQ3tdOEYP7LjSX5+vhy=eUf0q-YiktQriH-rcr1n2Q3aA@mail.gmail.com>
 <20220218121237.GQ614@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 David Laight <David.Laight@aculab.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Ingo Molnar <mingo@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 18 Feb 2022 06:12:37 -0600
Segher Boessenkool <segher@kernel.crashing.org> wrote:

> On Fri, Feb 18, 2022 at 10:35:48AM +0900, Masahiro Yamada wrote:
> > On Fri, Feb 18, 2022 at 3:10 AM Segher Boessenkool
> > <segher@kernel.crashing.org> wrote:  
> > > On Fri, Feb 18, 2022 at 02:27:16AM +0900, Masahiro Yamada wrote:  
> > > > On Fri, Feb 18, 2022 at 1:49 AM David Laight <David.Laight@aculab.com> wrote:  
> > > > > That description is largely fine.
> > > > >
> > > > > Inappropriate 'inline' ought to be removed.
> > > > > Then 'inline' means - 'really do inline this'.  
> > > >
> > > > You cannot change "static inline" to "static"
> > > > in header files.  
> > >
> > > Why not?  Those two have identical semantics!  
> > 
> > e.g.)
> > 
> > 
> > [1] Open  include/linux/device.h with your favorite editor,
> >      then edit
> > 
> > static inline void *devm_kcalloc(struct device *dev,
> > 
> >     to
> > 
> > static void *devm_kcalloc(struct device *dev,
> > 
> > 
> > [2] Build the kernel  
> 
> You get some "defined but not used" warnings that are shushed for
> inlines.  Do you see something else?
> 
> The semantics are the same.  Warnings are just warnings.  It builds
> fine.

Kernel code should build with zero warnings, the compiler is telling you
something.
