Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F663815A2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 05:59:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fhs8z6jTgz3bsC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 13:59:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AJGtllVD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AJGtllVD; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fhs8X2Nqvz2yWr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 13:59:08 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F220613F6;
 Sat, 15 May 2021 03:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621051144;
 bh=Z1sccg2vrpIeTClwluNbqzKfuQ+iCA6YJXcgWJREDvo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AJGtllVDTxzsfnQoqk8BsCbL64losT+Ty47Mg00VeF0nf6O82MPJ4NXwclyYvMmjU
 6To2isk6gBN6F7TMXgX3O8djMUZfQn6d2WNAOfFd2afdfKBNfYGfuEHSiKRQT8Q984
 ImdElmlY38m5D0beV6Ke2Gkbgyor8Kfx1/LnuM81Fi6X9ghxMu/2J4wek/8dVZ998P
 f1JqGJTkRYzzXMKKduiP/OHQM/m56qOQcav6Jt//03j3VosRZ77UWA5SZdukjMT/39
 3MqPRJ2WKfoOXg+d7S1Puls51F/EiiR0wRlp1htvcOFmyrWwq7yB6acKq7gw4x0K/2
 UqF1mdOKHOuRQ==
Date: Fri, 14 May 2021 20:58:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] arm64: Define only {pud/pmd}_{set/clear}_huge when usefull
Message-ID: <YJ9HAg+o8nd2xmix@archlinux-ax161>
References: <73ec95f40cafbbb69bdfb43a7f53876fd845b0ce.1620990479.git.christophe.leroy@csgroup.eu>
 <20210514144200.b49ee77c9b2a7f9998ffbf22@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514144200.b49ee77c9b2a7f9998ffbf22@linux-foundation.org>
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
Cc: linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 naresh.kamboju@linaro.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 14, 2021 at 02:42:00PM -0700, Andrew Morton wrote:
> On Fri, 14 May 2021 11:08:53 +0000 (UTC) Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
> > When PUD and/or PMD are folded, those functions are useless
> > and we now have a stub in linux/pgtable.h
> 
> OK, help me out here please.  What patch does this fix?
> 

Naresh's original report is here it seems:

https://lore.kernel.org/r/CA+G9fYv79t0+2W4Rt3wDkBShc4eY3M3utC5BHqUgGDwMYExYMw@mail.gmail.com/

I can reproduce the failure that he reported with
ARCH=arm64 allmodconfig and this patch resolves it for me.

Cheers,
Nathan
