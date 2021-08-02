Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB943DE0BA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 22:32:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdqSG2JHwz3cLt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 06:32:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jE2IKMDJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=adobriyan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jE2IKMDJ; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdqRr379Tz2yND
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Aug 2021 06:32:08 +1000 (AEST)
Received: by mail-wm1-x333.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso268251wmg.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Aug 2021 13:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=M1nBUo4KZ7/feK13SK1ltjciiCFL6QbXAmkAclXDcwk=;
 b=jE2IKMDJCKiu0+a2EeiLzhAmvFml5I8A0zkmXmFK3ZyQXlSQ97rdMAB7ZaYdAHijd3
 Vzvu8Mp17UBwHT2nih+IFxaiZFGHuFM1DriOKm7vudR+6k3VGnEc5NVUlSRHYAIwzROs
 HQNhFf5hHNFHMDSPC7V4AsPHQbXgylyxoPpNT1YcXaAwPgrdoOKA3YI0LzQHUfSP8Ig/
 qpmzQExuMPpumfAMIxc8zZJI5/iEsZbjA8LuYqBgsqbIk0wrQrvauJ7hZmi0i2uCsSBH
 /DiDgqCOPCPXVja/fb5w2KS/D/Zygf/ZGuSXkWaSIUqdhen2wuB+i0gVMdFb5fLFdvh6
 XR+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M1nBUo4KZ7/feK13SK1ltjciiCFL6QbXAmkAclXDcwk=;
 b=aCkFiHlE1Itf1V6XatRtU9/Yf0AXDCWKrpi0Pn4yaFfGHej5dZxIP4mN0QIQXOHnJ1
 +72vyDMIREwrrtk26jfJDubW3vFbyGEi3fr4+KjsnusPsP5pEA170R/gf3uAplN+nWWR
 Tx+AKAYOs34ECsiNrxivgUdTiY0MvKJv2xTZd6peJzACqzxyru2985+pMtneLwmTxThh
 jOXnnMmWqXoy3QLbXHBQC3hvNZqTF1L2Z06lMr6K/PuXB3NsZ2SkMw2atLvuSuWuuaum
 httmVDtrZV67auvjjb1YOJyfo+EeMfffe97CKusLkEjXZ9spB+Fusq+32AKw0ZzQ4dFK
 /JSw==
X-Gm-Message-State: AOAM532QZNg02k6gK8g+whwi+GXcPzhcYQqeKB99hQW8AcB4ZJKNOgQt
 1RVaLK6qUkw0b3efBGY5ag==
X-Google-Smtp-Source: ABdhPJywcnySifupCI+7bkrOwR1Br6hJZav/murBPhZkaBphO5C0vq9XjyYzQ+BUWPpZaGgnsr67YQ==
X-Received: by 2002:a05:600c:2909:: with SMTP id
 i9mr689355wmd.74.1627936324376; 
 Mon, 02 Aug 2021 13:32:04 -0700 (PDT)
Received: from localhost.localdomain ([46.53.249.181])
 by smtp.gmail.com with ESMTPSA id s9sm12474226wra.80.2021.08.02.13.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 13:32:04 -0700 (PDT)
Date: Mon, 2 Aug 2021 23:32:02 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 3/3] isystem: delete global -isystem compile option
Message-ID: <YQhWQkbN+pe354RW@localhost.localdomain>
References: <20210801201336.2224111-1-adobriyan@gmail.com>
 <20210801201336.2224111-3-adobriyan@gmail.com>
 <YQg2+C4Z98BMFucg@archlinux-ax161>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YQg2+C4Z98BMFucg@archlinux-ax161>
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
Cc: linux-arch@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 masahiroy@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 akpm@linux-foundation.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 02, 2021 at 11:18:32AM -0700, Nathan Chancellor wrote:
> On Sun, Aug 01, 2021 at 11:13:36PM +0300, Alexey Dobriyan wrote:
> > In theory, it enables "leakage" of userspace headers into kernel which
> > may present licensing problem.
> > 
> > In practice, only stdarg.h was used, stdbool.h is trivial and SIMD
> > intrinsics are contained to a few architectures and aren't global
> > problem.
> > 
> > In general, kernel is very self contained code and -isystem removal
> > will further isolate it from Ring Threeland influence.
> > 
> > nds32 keeps -isystem globally due to intrisics used in entrenched header.
> > 
> > -isystem is selectively reenabled for some files.
> > 
> > Not compile tested on hexagon.
> 
> With this series on top of v5.14-rc4 and a tangential patch to fix
> another issue, ARCH=hexagon defconfig and allmodconfig show no issues.
> 
> Tested-by: Nathan Chancellor <nathan@kernel> # build (hexagon)

Oh wow, small miracle. Thank you!

Where can I find a cross-compiler? This link doesn't seem to have one
https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/11.1.0/
