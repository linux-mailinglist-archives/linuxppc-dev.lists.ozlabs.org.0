Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 022754F778B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 09:32:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYtQ20LJCz3bdY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 17:32:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=OUk4rI03;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=wout1-smtp.messagingengine.com (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=OUk4rI03; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYtPM0fLgz2x9v
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 17:32:04 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 149EB32009E5;
 Thu,  7 Apr 2022 03:32:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 07 Apr 2022 03:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=A2uzp1VB6qZPb9v+8
 i65Ac3fQAGNJ0BYUHWC15GyxfQ=; b=OUk4rI03fHtv6kIgxgfmeIX3tHzmfemxg
 KFBHtlRVYjKaCgH6ekKV0jrMbRkICFT0WPfLCsHaDk62uaR8xXs4TUOew/O3lVI7
 3RBy9IC/rMNEboLdPBzMTrQgppSrq22KmyoeUfKtnLWvlP1sWlKam2motp6imT5A
 RflsV5/zRNAt452+QimRdT2EXbtlRs226T/kjlspQgVOrsOv0faPdxg+25++LOyf
 8GYlIGALKnUxrFwAy8TR0qh2td26Q9Ii+PC9YYpt3TBeNE9ytyYx2DQvHd/W6FjN
 8tAX+mTKKQALdHelQw7cKwSeWXDyiInqajol1yq7HbyZkXMHaYgMw==
X-ME-Sender: <xms:bpNOYszjB3nKKKA0xMPFOHdihootxN1s9LBteo1H2-xOURBxeObI2g>
 <xme:bpNOYgRiC88WpcWZ5KPc2kKgtXaQ157ck0VCHxWuykXVUvdbEJ5k2PIGgYOqQxxK9
 9pZ2ojYcdttEuvPiZ4>
X-ME-Received: <xmr:bpNOYuWr-Cz9BxR2rbcTcP_wTadj_etgKPwfGmv_s6ZwjY4ZfJSkEC9pICbgrFlLLjnU4rPkaJWI07K-dZDI1-hfxlkjR1LvONE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejjedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
 vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
 htthgvrhhnpeffudfhgeefvdeitedugfelueegheekkeefveffhfeiveetledvhfdtveff
 teeuudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:bpNOYqhaUOIh_7ORD6SOs3eKYlST4yOp3aHFbcXlDdnU11FDZKJJaA>
 <xmx:bpNOYuBNzQzOHRum7i7F15freBvK3Nc1-ksfI81iTwXmcvztZSzNNg>
 <xmx:bpNOYrIEyHJVR_o3Mu-H61HRX5v6AcJ4_ixmNuNdtHIYrjUDInnP2A>
 <xmx:b5NOYq1X7lewgIgPuglWsbZfAXyTy1yACogGCfWDLM3658WyLIeAqg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Apr 2022 03:31:56 -0400 (EDT)
Date: Thu, 7 Apr 2022 17:31:03 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] macintosh: fix via-pmu and via-cuda build errors
In-Reply-To: <20220407023700.7216-1-rdunlap@infradead.org>
Message-ID: <7ddb26a1-be89-813f-8dcc-4bebaf8f5636@linux-m68k.org>
References: <20220407023700.7216-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 6 Apr 2022, Randy Dunlap wrote:

> When CONFIG_RTC_CLASS is not set, rtc_tm_to_time64() is not defined.
> 
> ...
> 
> m68k-linux-ld: drivers/macintosh/via-pmu.o: in function `pmu_set_rtc_time':
> drivers/macintosh/via-pmu.c:1758: undefined reference to `rtc_tm_to_time64'
> m68k-linux-ld: drivers/macintosh/via-cuda.o: in function `cuda_set_rtc_time':
> drivers/macintosh/via-cuda.c:797: undefined reference to `rtc_tm_to_time64'
> 
> ...
> This is a big hammer type of patch. We could possibly do (a) some
> conditional code blocks for RTC_CLASS 

rtc_tm_to_time64() call sites also appear in several other files without 
conditionals:

arch/powerpc/kernel/time.c
arch/powerpc/platforms/8xx/m8xx_setup.c
arch/powerpc/platforms/maple/time.c
arch/powerpc/platforms/powermac/time.c

Why not use mktime64() instead? That seems to be a common pattern for this 
kind of thing (without needing conditional code).
