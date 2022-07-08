Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C99F56BE62
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 19:13:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LffxK4Gkjz3cdh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 03:13:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ThWQzWOP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ThWQzWOP;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lffwg1ZDZz3c3b
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jul 2022 03:12:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 490B5CE2B21;
	Fri,  8 Jul 2022 17:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C652C341C0;
	Fri,  8 Jul 2022 17:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657300350;
	bh=v8cAq7/Gzi8ptaUAj35finBpJ4sd0O5IcACMWgZqGEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ThWQzWOPM3uHWo0maxJeaD2y/kfNNAPVJMfEeQ/6+K+oAOIp6ojjrL7zX1HTXWAv9
	 mWcrcxpwhBKw0CZa5Br7ILK2RqMhRdn6w/o6NDXFemTI1sj9E3wQFuawE+hdCl8Uzf
	 UASo2gu7jj9G654QCamb31v5pXoI40ic2DWPMbWR1iFJ9tBWTZz+OWp9/WUeQZ6vTT
	 rBz2rqWMMnMT/4Mh8qpppuzMW77d7Axyff1EBTIrgOMvwLssu1WDEkCGQcGyUIlDLs
	 cuWBm4M3Jp7XwLvFVhTPR+yE+l93VtWXFNP/QlKO0wIyCBSFqIH24xNPVZhShBVUO3
	 gwXqL2QRGLUGg==
Received: by pali.im (Postfix)
	id 62F297D1; Fri,  8 Jul 2022 19:12:27 +0200 (CEST)
Date: Fri, 8 Jul 2022 19:12:27 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] powerpc: e500: Fix compilation with gcc e500 compiler
Message-ID: <20220708171227.74nbcgsk63y4bdna@pali>
References: <20220524093939.30927-1-pali@kernel.org>
 <20220702094405.tp7eo4df7fjvn2ng@pali>
 <8D562851-304F-4153-9194-426CC22B7FF2@ellerman.id.au>
 <20220704103951.nm4m4kpgnus3ucqo@pali>
 <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2tdny8SA7jcqhUZT13iq1mYqjFueC-gnTUZA1JKCtfgg@mail.gmail.com>
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
Cc: Michael Ellerman <michael@ellerman.id.au>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 04 July 2022 14:07:10 Arnd Bergmann wrote:
> Another problem I see is that a kernel that is built for both E500 and E500MC
> uses -mcpu=e500mc and may not actually work on the older ones either
> (even with your patch).

Such configuration is not supported, see arch/powerpc/platforms/Kconfig.cputype:

config PPC_E500MC
	bool "e500mc Support"
	select PPC_FPU
	select COMMON_CLK
	depends on E500
	help
	  This must be enabled for running on e500mc (and derivatives
	  such as e5500/e6500), and must be disabled for running on
	  e500v1 or e500v2.

Based on this option you can enable either support for e500v1/e500v2 or
for e500mc. But not both.
