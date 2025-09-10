Return-Path: <linuxppc-dev+bounces-11987-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B9CB516D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 14:26:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMKfy2k1Cz3dBg;
	Wed, 10 Sep 2025 22:26:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757507178;
	cv=none; b=XwO0XwyMFdT+pwgXVI/Ys367qoLmWtg7d3dLEwM6e4RoIqtE+na1/2Ctx6a5KGY0xqe268aUXCNa/lrkurmeaTxbdJAVCIDh5/CQasauVFHUpQCYUKAJKvNn016GY0xMCBss0R+oFM1F5BgVszlPKPBLQW4buz1jm7sPIdgkquR36uvIMOnabapqVyVxrnB1P1ICLqA+Z6hbkH22ZvGd4njk0P0DTu52eaVOCFM7UshVbIbDHLSCfeJrUvOaMQp+ZHez9GgANQyx8Fd1bFQ2n+P2iEMST3doyNrVXYQsviN8kZTI4jSrj8ZxxY2oQqQCXLe1bZcPvz83vOB+COn84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757507178; c=relaxed/relaxed;
	bh=Q8QtYwN/6PZfKDPEAgWxGMzQb2D01FG/mGmHU9G0gsI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=I0oVETsvdgesuEj+FeUxwMvOXhyML7UxwhOaUOpxAFVtM0BhF1r7ZTyJ3681LczYt1L3rmKPH2mwMlUv1zxhDntMPjNIwLR8go+zfC9QHdrrtesMZGGhVnIIls18GQesB4nch23eqHG6RDWpzMLaIts/HAb+4D5nbj37i7jajryl6kQJqghIkiXEwb5aoQRPfcVlj2dtMrceJrxsMBHt5DRdC8n2xY2Ty1V6q2cURjiLisCJQ3KbwPUtKkIlAVdFkp/KQYRAWbA6rQCffe4idw6i8qYskjR4ACpNXArXSArqIp/0iMlHelpwJ0+Owp6fJICeTYt+sG04XZlU4Ue3dw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=lMRppWvj; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Y5iH1dNj; dkim-atps=neutral; spf=pass (client-ip=103.168.172.157; helo=fhigh-a6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=lMRppWvj;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Y5iH1dNj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.157; helo=fhigh-a6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 474 seconds by postgrey-1.37 at boromir; Wed, 10 Sep 2025 22:26:15 AEST
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMKfv03Fqz3dBX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 22:26:14 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E53E91400363;
	Wed, 10 Sep 2025 08:18:17 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 10 Sep 2025 08:18:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757506697;
	 x=1757593097; bh=Q8QtYwN/6PZfKDPEAgWxGMzQb2D01FG/mGmHU9G0gsI=; b=
	lMRppWvjlb2mRKxIhB6zQg+atJittD3Vv0ZFlNazWaKYhCDUGlit6C8CogCEhZ1q
	2sgfbhbJXdiaC4H4OidSoW40ubFOCE39XJ4KzVLOJ10wP9pvvRgOJMCav1aSbIxu
	b5u73dAtlkdNSkkiMI6PCleDEH4MA3fhLbYHi9vDGXnFFF3HSW25cOUquO7mmoMj
	hLTihsaytQfa9faTH1k79YiYkCM7t4dUSBbNDzGqmAGL6UHzBn5bnAk28/B8UHVl
	HVbi26/Q/o6w6GGoMmjwYJCsCj3ZwcOGPMd2msbPUCVMtjIfrykiD6CUNuGGzFwi
	0eau0fM1D3x/hvj/bGfcjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757506697; x=
	1757593097; bh=Q8QtYwN/6PZfKDPEAgWxGMzQb2D01FG/mGmHU9G0gsI=; b=Y
	5iH1dNjKENA9lB+WPTE+aDfd4EEnjCQqu9aXxgemhakIsSB8xgRSPmhWJOELM+Qc
	IiQZMh2MYWB2J4DQgGxeAv8e3Tv5X8adt+BU0fQ3Bx0kWFJe+j8JUOO+K3HMO98X
	gynbPyjA0RL3/qKL2eWUMp19Md1yc2Zl15HQ6hSWEwPRxIRDnR8UwsT46S4X1btz
	q973lX+TENS1d+jVxzDgyYuVsxhPd1+lVItZvghiroNZ7Q1gp4kQIF65tksNivPN
	9YnVwWznR3+55rCsarJ/A5EB6Y1NQPUeyBXfrRAbH8NDDB4OOQdTfJfemow7s1L0
	SCw4jQQeqFMyxCkr2GVqQ==
X-ME-Sender: <xms:iGzBaLzC5EVSAADw_ZXg73KwvPlGkppPq-JRpw5uboD5jbP27FwN4g>
    <xme:iGzBaDTuoR4zP1RmrdotU0_sl9iOja29GXfmFtU8duZVGR2bSE_X4GARY5TKnB8CH
    th5x07cEPZvTAFjklA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfedvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepvdekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegthhgvshhtvghrrd
    grrdhunhgrlhesrghrihhntgelrdgtohhmpdhrtghpthhtoheptghhrhhishhtohhphhgv
    rdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegrnhgurhgvrghssehgrg
    hishhlvghrrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihgu
    vghrrdgsvgdprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesghhmrg
    hilhdrtghomhdprhgtphhtthhopehsvghrghhiohdrphgrrhgrtghuvghllhhoshesghhm
    rghilhdrtghomhdprhgtphhtthhopehsuhhrvghnsgesghhoohhglhgvrdgtohhmpdhrtg
    hpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehirhgr
    rdifvghinhihsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:iGzBaNO7Os19I4sPMn6-otQ5bbEKAB4pch0OZuFXHFI5x9JEd39xpg>
    <xmx:iGzBaK3yqnNlqS-sfm9Lx7D_9HNKC12n5KccpVTug2j5bpB0xc1AZg>
    <xmx:iGzBaNOhVAFIENTxMk6beeNI3AnqDtq-OlhJo9DV9HIPb6ewt2VQSA>
    <xmx:iGzBaAvXxr0sCtad7do3vmGOYAy8bEnqRMURmIo7PtKiN1CGOde_GQ>
    <xmx:iWzBaM4JqI_NrZjl1sbxSuVsA0MIBP4IgV_a6-a8UVVN-ccxa-XdLGBK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 88DD670006A; Wed, 10 Sep 2025 08:18:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
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
X-ThreadId: AmcCJOTBQ5ho
Date: Wed, 10 Sep 2025 14:17:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Matthew Wilcox" <willy@infradead.org>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Richard Weinberger" <richard@nod.at>,
 "Lucas Stach" <l.stach@pengutronix.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "David Hildenbrand" <david@redhat.com>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Ira Weiny" <ira.weiny@intel.com>, "Nishanth Menon" <nm@ti.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 "Sergio Paracuellos" <sergio.paracuellos@gmail.com>,
 "Andreas Larsson" <andreas@gaisler.com>
Message-Id: <b60310f3-25d3-4f2b-88cb-ad65d5f55ec2@app.fastmail.com>
In-Reply-To: <aMDYdp3H-yOHU1Pm@casper.infradead.org>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <aMDYdp3H-yOHU1Pm@casper.infradead.org>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 10, 2025, at 03:46, Matthew Wilcox wrote:
> On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
>> While removing a feature that is actively used is clearly a regression
>> and not normally done, I expect removing highmem is going to happen
>> at some point anyway when there are few enough users, but the question
>> is when that time will be.
>
> I don't mind that the feature remains ... unless it causes us trouble.
> Which it currently does.  Perhaps we could start by removing HIGHPTE?
> There was a certain amount of complexity introduced into the page fault
> path when support for that was introduced.  x86 removed support for it,
> so it's just ARM left before we can remove the complexity again.
>
> Most of the other pain points are around storing metadata (directories,
> superblocks, etc) in page cache highmem.  I think we can get rid of that
> now too.

Agreed, this is roughly what I meant with the suggestion of removing
__GFP_HIGHMEM allocations from as many places as possible, while leaving
the pagecache and zram. I already brought up HIGHPTE earlier this year
since it already has an separate Kconfig symbol, but Russell was worried
about increasing the lowmem usage at all.

Maybe we could go back to the earlier idea of first categorizing
the important highmem users better, and make it possible to
use Kconfig symbols to enable highpte/highmem-anonymous/highmem-file/
highmem-metadata/highmem-zram/... individually as well as count the
actual usage for each of them. Having statistics in /proc/meminfo or
similar would allow more informed decision about no longer supporting
some of the categories later.

Not sure how many __GFP_ flags we could reasonably spend on categorizing,
as we are already up to 26 out of 32 (not counting CONFIG_ASAN_HW_TAGS,
which is 64-bit only and uses two more bits), or what alternative
would work.

> I don't see any particular need to gt rid of file data stored in highmem,
> nor anonymous memory stored in highmem.  And if we're only talking
> about hundreds of megabytes of memory, I think anon+ file pagecache is
> probably most of the memory in the system already unless you have some
> very weird workloads.

The main problem I see with the pagecache itself is that the fewer
highmem machines people test on, the harder it gets to spot regressions
where new code fails to kmap() the pages correctly.

Another concern is the number of memory zones, but it does not appear
that we would completely remove ZONE_HIGHMEM as long as ZRAM or pagecache
uses it.

> Where we may want to be a bit careful is some people have Plans to
> reuse the kmap infrastructure to support things like unmapping the
> pagecacheto protect against spectre-eqsue attacks.  I know Intel was
> working on this when 3dxp was going to be a Thing, but it's recently
> been brought back:
>
> https://lore.kernel.org/linux-mm/20250812173109.295750-1-jackmanb@google.com/

If that gets merged, it would at least address the concern about
testing, since presumably many bugs around missing kmap/kumap then
also show up on x86-64 kernels with ASI enabled.

    Arnd

