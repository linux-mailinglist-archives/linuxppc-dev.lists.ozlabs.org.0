Return-Path: <linuxppc-dev+bounces-12379-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F20FB85F15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 18:19:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSLRp2FHpz2yGM;
	Fri, 19 Sep 2025 02:19:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758212342;
	cv=none; b=FHr9WERgtpjF6mB/Ggs/JeO3PL9M4tv6DhohpuglYLbAwd2tMT1DD6Qm5/JE32WLu7WdV4HQeYLiXcft8a1CpuhsooCqCHLk8VFti36Dj12cPsflnsMNCHmpbmf6f6TXaKF0Ku5CMOqDgFFPnLwFiSKJX99KX5GoG/nYUZtfpeYZkxJHdBDL973wMSDvOyF7g1EC2/JxdiK+GFMOt/d+4JvpXmU9+pBfJgGIQ6dJ8aOd7D2AX43bVUn2NwBtGOuQmM21VIUvj+/x56lOj2JHZiE2V0g0Wax0AKC6zW5lAeBjPtR4jl7G7ONkIPVpeCgBCXXH5f16XgAVDoqwlliVHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758212342; c=relaxed/relaxed;
	bh=fm4R8b6atPDjgItmLn3c75WIBp5VlWzcsZH4FVIt7ag=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OMoLQIFGDspUD2s4jtMeYQbMNePwhNNhvv8wOEfFBPVxRhBH8BqoHXb79EYT9XlwbPx5uqMO8NqZYCMeA/SgodebC/32c1aYrLO9RSwceVuhaw9WcW/4CoY1m2f+qloDvfI/FWdNWXtIVF2khvsLzs73u+iolsp8AFvPOocfmkLmlFf0PM21rLUVc5FoRV5iyT46/oZOk+QQB0Hgu0sAPMvjLvsPnzSktqQuT3pUMOtobh7eZiKoTU0xnBWF88io/JYasKVZ/nCFbhoPJRjWZbpf21B9gvBn5bz3slCvjj4o37eWE6ysvIYw4P6osleSULHAzGAWTnS8bZs/glHd0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=hT3UzSYH; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=narD2chK; dkim-atps=neutral; spf=pass (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=hT3UzSYH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=narD2chK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSLRk4dgtz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 02:18:57 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id E9DB1EC030E;
	Thu, 18 Sep 2025 12:18:54 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 18 Sep 2025 12:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758212334;
	 x=1758298734; bh=fm4R8b6atPDjgItmLn3c75WIBp5VlWzcsZH4FVIt7ag=; b=
	hT3UzSYHqECruml9nJYhLaF2PeApMfKPsa2Kchq0gCzfeBYX32RBViapVaUovlLI
	Txe/jjqieezrzrzA7uJYsDtvqVjCXXnC1LoBBhdcmSoOMaSrN5Fqt+5RD4WlTS+u
	BKhECFDp11UJ471uauSho7G4oGR/BvOy/5lMipcEoJKhdbXiTwla7TTe3MuQrnYQ
	KueeBTCWfI8OcXJS2UG9kae6uVbtlAF7CcZVk2LQ2vS/xIuZHiD0Lp9ICyNHy82r
	40M21sNMmpSgYWUZzCPqKroJovjjCGbk7bJ6mlDgjqwo5fwELH5lepoBABDtgS9L
	scjCSBoybymPnkbUAktH5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758212334; x=
	1758298734; bh=fm4R8b6atPDjgItmLn3c75WIBp5VlWzcsZH4FVIt7ag=; b=n
	arD2chK72CMw+3XE4ZMyHoCXIAodtWOlFh+lygozTruGzTZh8h856redrTp47dRO
	sXbFqPqDBwTwab9JjkqMOZqEpw8xcAx1CsSrhxGH9ZhJahklo+5B/YYA8F9qKGuK
	wms91Otr8e2xctRFqgvVzfrtq2c8xTnxS+u/pW8oiV7Qo/b/JpZmiOHUmjZVqgw/
	j7EXQHPtj5+QrGpRsg0kWk6VvAUAduP/2DL/i1mtAsRcQBIRbZU3Rh1twx82usbv
	RgntitcMyx+XgxmuyvLSSVKNtRoybAgMqWlWzYvwXSnU7WaKl8QejTpIg2kBSi6W
	CaYxaV9Q1r98Co569m6Gg==
X-ME-Sender: <xms:7TDMaNodCGNeyIp-SBSrJ_TtgdGNi08_RHKQYU5GUMzQyGU2qL51sw>
    <xme:7TDMaPqtNE5Wm9OwOTBTVsoBpq7nOqMcCYUvpQ-AcC442Pi0J8C_IlqeLqpTVtfET
    Z4yar8_IO-zzD-k2lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegieejlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeeggfejudejvdeijeeglefgtdfhudffieetfedugefhffekjeefhedtjeefjeetfeen
    ucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepfedtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegthhgvshhtvghrrd
    grrdhunhgrlhesrghrihhntgelrdgtohhmpdhrtghpthhtoheptghhrhhishhtohhphhgv
    rdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegrnhgurhgvrghssehgrg
    hishhlvghrrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihgu
    vghrrdgsvgdprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesghhmrg
    hilhdrtghomhdprhgtphhtthhopehsvghrghhiohdrphgrrhgrtghuvghllhhoshesghhm
    rghilhdrtghomhdprhgtphhtthhopehsuhhrvghnsgesghhoohhglhgvrdgtohhmpdhrtg
    hpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehirhgr
    rdifvghinhihsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:7TDMaPbKt2WoXqHMwpanytM6BOnhzj_CQNwGh1PFIqubtDAyu5jB5Q>
    <xmx:7TDMaGKxNLlBIr_WiBflz4DJZ5ui2U4YOwVgSsgJGQrpphOVta5LLQ>
    <xmx:7TDMaG8COQwGxvO3AW0IJmLokZHWS06CKK-GHPM5ep7McMCa1__b0A>
    <xmx:7TDMaNp9nu7518TclPj1lZvDtvnU_ezCWZtqceFpg9Flbxum44e-lg>
    <xmx:7jDMaKcwFz32-9rZOzFDRZfXWP5Uej9dboxG4Bi3HNtAfR6kH7cYV8fc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7D7F370006D; Thu, 18 Sep 2025 12:18:53 -0400 (EDT)
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
X-ThreadId: AneuvEk2E7Kg
Date: Thu, 18 Sep 2025 18:18:13 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: "Jason Gunthorpe" <jgg@nvidia.com>, ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, imx@lists.linux.dev,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Richard Weinberger" <richard@nod.at>,
 "Lucas Stach" <l.stach@pengutronix.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "David Hildenbrand" <david@redhat.com>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Matthew Wilcox" <willy@infradead.org>,
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
Message-Id: <ea6562f4-ec8c-4e99-98ec-000c25c34a3e@app.fastmail.com>
In-Reply-To: <ca6fc8dc-d1ee-41a8-a1c9-11ed2907207f@lunn.ch>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <ca6fc8dc-d1ee-41a8-a1c9-11ed2907207f@lunn.ch>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 18, 2025, at 15:34, Andrew Lunn wrote:
>> * Marvell mv78xx0 and kirkwood (armv5 pj1) were fairly
>>   powerful in 2008 and could support at least 1GB of RAM,
>>   but I only found one machine (OpenBlocks A7) that does
>>   this. It's unclear if anyone is still updating kernels
>>   on this machine, but they could /probably/ use
>>   VMSPLIT_3G_OPT if they do.
>
> If i remember correctly, there was a design issue with the OpenBlocks
> A7, and it would not run with its full amount of memory. To get a
> stable system you had to limit the RAM. I don't remember if that was
> just with the NULL series, and it was fixed for mass production
> devices, or they are all broken.

It's possible that the bug is in the exact bit of code that
Jason was suggesting to have removed, if this was the last
ARMv5 machine that actually tried to use highmem.

> I doubt there are any mv78xx0 machines left, why where never very
> popular, but there are still Kirkwood NAS boxes around.

https://github.com/1000001101000/Debian_on_Buffalo does support
some variations of the Terastation Duo, and they were planning
to do a DT conversion at some point, but I think there is not
much hope of that ever happening now that Debian armel has had
its last release, and I expect we can drop the entire platform
soon.

The reference system for mv78xx0 of course was the platform
that Nico used for implementing highmem on, with a full 2GB
of RAM. I think in the end this was around the same time
as dove and then armada xp.

> I keep mine up to date, put an LTS kernel on it once a year,
> update to the latest debian sid.

Do you know of any kirkwood machines beside the OpenBlocks A7
that have more than 512MB of RAM?

    Arnd

