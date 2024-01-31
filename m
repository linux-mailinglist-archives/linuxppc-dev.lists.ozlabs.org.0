Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB57844AD3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 23:17:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jp/Dfi19;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQGcg3P5Mz3cSp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 09:17:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQGbh5VdRz3bqx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 09:16:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UaP7e0/xFnUox21quYuKQnRrWMG86d8f4dQdq/uGkg0=; b=jp/Dfi19gPUOUmEPG7CQh9UH2B
	hU08YzQBvtIFeMavgaf9k/O56rFCRonfIfw1OsdrprnEh+R3xxJhra3djTsnllsRhNJoVTySWIgiU
	fWhNyP59cNi0dyRKQz3ENYJZ3Trv6EEWzwYCu+MvY0sKT20usBUlWbHhgWIS4DJUd7IZaE3dGWpZf
	LxlwKRPznAE7XxYZIPkAl98n5kTkI5+qo+FqucZGkmwAUXcb9on2Pe/V4b01gpAGYfbp+c6p7zDev
	/yVUz1uAbBcMWEv1t+0sQ7RrE9p6Q6oAAlKowxOEslJ85z9ZnkYItFvqh1cQxO8TofazphVe9Kj4O
	VpKJNqTA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVIsr-00000005fbS-345v;
	Wed, 31 Jan 2024 22:16:41 +0000
Date: Wed, 31 Jan 2024 14:16:41 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at
 all time
Message-ID: <ZbrGyWKOF1Ux9LT6@bombadil.infradead.org>
References: <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
 <ZbgGDlgrLhB8tcGI@bombadil.infradead.org>
 <20240130091626.GA3684878@google.com>
 <9e298fa7-a953-462a-96a4-56a1b4316a17@csgroup.eu>
 <CGME20240130174812eucas1p166f62549457fd188fed6ed72b6b4b9cd@eucas1p1.samsung.com>
 <30ddedc9-0829-4a99-9cb1-39190937981c@samsung.com>
 <ZblbuHLaK2_Xhff_@bombadil.infradead.org>
 <8b00f75d-a5ee-45a8-9ed4-5da26e4e1f41@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b00f75d-a5ee-45a8-9ed4-5da26e4e1f41@csgroup.eu>
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
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 31, 2024 at 06:53:13AM +0000, Christophe Leroy wrote:
> The problem being identified in commit 677bfb9db8a3 ("module: Don't 
> ignore errors from set_memory_XX()"), you can keep/re-apply the series 
> [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at all time.

Sure, queued that up into modules-testing before I push to modules-next.

  Luis
