Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 326EE64F40D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 23:25:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYkDn1J5bz3bym
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Dec 2022 09:24:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VhId9RCw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VhId9RCw;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYkCp6zk8z2yHc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Dec 2022 09:24:06 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 701B66215E;
	Fri, 16 Dec 2022 22:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2294C433F0;
	Fri, 16 Dec 2022 22:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671229442;
	bh=vWyTChF9TwDDk0WZDplapmkRwworn0IhwYAjtOOf+HI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VhId9RCwx0o6BIUUKNNpCYsiCZTXnrltQNzrTl/Ftd4Klkn+1bOBPosAosRsqzd7w
	 SmJcY6ezwecIBtw8ne6L5Fnm1ARAEG4lPrrNVC1PFTd4RqUphMzqBKSB9S/GY4tOw5
	 8lix3BG86bHAwVQ05sdJdQi0s5aFewL9i8Hh+3KR8WCuRz8Du0d4SKnpWsn1SpXtL2
	 Hf4AVwPPIcKpNxB2krUNN5JUg7LjSaxQjaXO1M6GbdResGIN4TgA/JuwjHlwBm5MVD
	 iH5ZT4tslMouVNxaqzaxAgNNgOVvhVLNXH7LbOD9hVuPBRmYNO98BqziSlJZaSQWXq
	 j2upcgQjzkihA==
Received: by pali.im (Postfix)
	id D741F711; Fri, 16 Dec 2022 23:23:59 +0100 (CET)
Date: Fri, 16 Dec 2022 23:23:59 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v1] powerpc/64: Set default CPU in Kconfig
Message-ID: <20221216222359.74i6otxszwanf76y@pali>
References: <3fd60c2d8a28668a42b766b18362a526ef47e757.1670420281.git.christophe.leroy@csgroup.eu>
 <20221215204202.mbw2ij4ou7t2ttpv@pali>
 <20221216191543.GE25951@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216191543.GE25951@gate.crashing.org>
User-Agent: NeoMutt/20180716
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 16 December 2022 13:15:43 Segher Boessenkool wrote:
> > Anyway, do you know what is e500mc64 core? I was trying to find some
> > information about it, but it looks like some unreleased freescale core
> > which predates e5500 core.
> 
> It looks that way yes.  It was submitted at
> <https://gcc.gnu.org/pipermail/gcc-patches/2009-November/273251.html>
> and committed as <https://gcc.gnu.org/g:b17f98b1c541>.  It looks as if
> it was based on the e500mc core, while e5500 is a new core (or
> significantly different anyway).

Just a two old Freescale PDF files which I found and mention e500mc-64:
https://web.archive.org/web/20121215191707/http://www.freescale.com/files/ftf_2010/Americas/FTF10_ENT_F0453.pdf
https://web.archive.org/web/20120905164305/http://www.freescale.com/files/ftf_2010/Americas/FTF10_ENT_F0273.pdf

On page 6 in both documents is described P5020 with e500mc-64 cores. But
production version of P5020 contains e5500 cores.

Some other documents are also on nxp.com website:
https://www.google.com/search?q=%22e500mc-64%22+site%3Anxp.com

https://www.nxp.com/files-static/training/doc/MULTICORE_MORE.pdf
https://www.nxp.com/docs/en/supporting-information/WBNR_FTF10_NET_F0707.pdf
https://www.nxp.com/docs/en/supporting-information/WBNR_FTF10_NET_F0704.pdf

> > ISA (without extensions like altivec) seems
> > to be same for e500mc64, e5500 and e6500 cores and difference is only
> > pipeline definitions in gcc config files. So if my understanding is
> > correct then kernel binary compiled with any of these -mcpu= flag should
> > work on any of those cores. Just for mismatches core binary will not be
> > optimized for speed.
> 
> It appears the E500MC64 never made it outside of FSL, so it is best not
> to use it at all, imo.

Yes, it really makes sense to not use e500mc64 flag. Maybe gcc
documentation could be updated to mention this fact?
