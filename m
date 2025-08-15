Return-Path: <linuxppc-dev+bounces-11041-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC02EB27818
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 07:11:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c39Ds1qdDz3bqP;
	Fri, 15 Aug 2025 15:11:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755234669;
	cv=none; b=DnBSjl4+rh1KH5vEa/TuIrCwiSShX+z1JnJCqK/TAVBP5Gqgw1Evk8bKBwic//0Vm7IQLqTweTxKmkQi/grxExT227bvPWZOuzFqBM5tOtSa0hqxVLkfBDOAvGXdkS1aX68YE+VirapYVJTDspZEzu5VpaYIvIjDTOkz7g1gU11O5fGGjsDPcFPt2PccJ3tMqZuuEZ02qN501I2ZBSW1JFtQnyMjzgl5N25T8zEruovcuoH8RlxrnxuWd36pmEhPcHeJEyUinKvNf/KhjqWA35OCSNixhIGXPVH0jVV921Sz6OX9CYG/9TNxH607psp6b/EOuoERYzPpd11Naj/YfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755234669; c=relaxed/relaxed;
	bh=XUOWdZP1cezLj5JR2qWET0ULt+yC1LXg9Jc7bXW5jXo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UR78toMLqOot69d4fAJ88qdZ71zOTXyEHQwIvuiq5bbf2MVaHPbQe0q3Q07pJuIYsdRXdiZIpngHIf1z7UIDUbICcrs7bMSknwfOy1KkEAKmudpslUJIAkBGQWlzTpYMYX2baRpSx54nl5A75FSG3qt5tQYo4ZVVBgN55vnWCt0RkR/A7zaHrBH9n0AaxnkzgysrrIdff+BHuDlJeJxD63OiAQCdahiR8ch1vuXhLQVOtIKCdWHbj5SrhukN1H6GJk7h0v86im9LsaitAKFNAN7KknbdZO1k9s2NUg8dH5nqMH5JXWCRWt24wfAzxV7MmSeHV7zhDX0sIMfI7ILNjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qaZHeg2/; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qaZHeg2/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c39Dq4zdzz3bpS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 15:11:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6848645783;
	Fri, 15 Aug 2025 05:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACBBC4CEEB;
	Fri, 15 Aug 2025 05:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755234665;
	bh=rjs/V71n+3a48sbczUimLUbQ99An++PfjAuhQIEa13s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=qaZHeg2/5a1nlFDrCh+QQq8+2z+k/HIBWZUD4nh0+1i6c37KB42J7MuL6+NCG/t+L
	 Sb4lS+mkZ14VoVX+YlDNVGPRMcWMXRHAGigO6GBs+JD82O/j0LxY54D+zDNDsJYKAo
	 sXevI5VIzQWOLFfl/WV5zUlxyV+wLZ1J0REOzQc8KXCWGG5zo4v1sD8WTb37YmZh26
	 fQvGeRnhGwhiRkaAiLioOMAOHFUuoJ1KDM4vS7BfgMxeW43efHE9YPv+gnweYXLTPM
	 XrWCUBDKKDrqe8banORHuWlWg0uTJGuY3c9EmS4cdtxIgiUKad4TjoW3OXKR2Ys5uU
	 wi4dFrypsvChQ==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id CD58BF40066;
	Fri, 15 Aug 2025 01:11:02 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Fri, 15 Aug 2025 01:11:02 -0400
X-ME-Sender: <xms:ZsGeaEjCAtEWX1UaHLA2gfColtQZO7w89chtZ2uFaG4vMYHweTmDIQ>
    <xme:ZsGeaNCED0uQ78E9d2j9GAg3NYkGAhxwrM8S6giPlAbcy5DsDkd_hrjkIGTNdnggG
    4eL_xWyjdx6jEOR_bI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeeftdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfnfgvohhn
    ucftohhmrghnohhvshhkhidfuceolhgvohhnsehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepffegjefgueegffffjeevheektdekgeevheelvdekieehvdejvdejjefh
    hfelhfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlvghonhdomhgvshhmthhprghuthhh
    phgvrhhsohhnrghlihhthidquddvfedtheefleekgedqvdejjeeljeejvdekqdhlvghonh
    eppehkvghrnhgvlhdrohhrgheslhgvohhnrdhnuhdpnhgspghrtghpthhtohepfeejpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehjohhroheskegshihtvghsrdhorhhgpd
    hrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthhtohep
    tghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhope
    hmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopegrsgguihgvlhdrjhgr
    nhhulhhguhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrdhgrgihnhhorh
    esghhmrghilhdrtghomhdprhgtphhtthhopehrohhsthgvughtsehgohhoughmihhsrdho
    rhhgpdhrtghpthhtohepghhlihguvghrsehgohhoghhlvgdrtghomhdprhgtphhtthhope
    hkrghsrghnqdguvghvsehgohhoghhlvghgrhhouhhpshdrtghomh
X-ME-Proxy: <xmx:ZsGeaPWPNXdI6VvYib3k9QdMC2XlJbr86LA_KN5YspkDL_EEK6BRlA>
    <xmx:ZsGeaI3d1bh3fFRFl4aiXZUts9ejR-WHFcon7KnhJbC_6nOGWjjn2Q>
    <xmx:ZsGeaIdgKvfZyaCQpAF_MAary9Xg8Dva0Q5zSBAie2gJ8xC3nka9fw>
    <xmx:ZsGeaNVlXDFhOQ5jT6MnFggS_FVesjsSUNJLf3EVumbGV5Io7NaXkQ>
    <xmx:ZsGeaG9LccLFJ2EboOYrfkTWU2yRr6gsoUbWRyvB7Ij-X0QWOgy49Rp5>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8094E2CE0071; Fri, 15 Aug 2025 01:11:02 -0400 (EDT)
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
X-ThreadId: AWyaQ402xWe7
Date: Fri, 15 Aug 2025 08:10:43 +0300
From: "Leon Romanovsky" <leon@kernel.org>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Marek Szyprowski" <m.szyprowski@samsung.com>
Cc: "Jason Gunthorpe" <jgg@nvidia.com>,
 "Abdiel Janulgue" <abdiel.janulgue@gmail.com>,
 "Alexander Potapenko" <glider@google.com>,
 "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Christoph Hellwig" <hch@lst.de>, "Danilo Krummrich" <dakr@kernel.org>,
 iommu@lists.linux.dev, "Jason Wang" <jasowang@redhat.com>,
 "Jens Axboe" <axboe@kernel.dk>, "Joerg Roedel" <joro@8bytes.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Juergen Gross" <jgross@suse.com>,
 kasan-dev@googlegroups.com, "Keith Busch" <kbusch@kernel.org>,
 linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-trace-kernel@vger.kernel.org,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Robin Murphy" <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
 "Sagi Grimberg" <sagi@grimberg.me>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Steven Rostedt" <rostedt@goodmis.org>, virtualization@lists.linux.dev,
 "Will Deacon" <will@kernel.org>, xen-devel@lists.xenproject.org
Message-Id: <45552b38-5717-4b0c-b0eb-8c463d8cf816@app.fastmail.com>
In-Reply-To: <ccc8eeba-757a-440d-80d3-9158e80c19fe@csgroup.eu>
References: <cover.1755193625.git.leon@kernel.org>
 <ccc8eeba-757a-440d-80d3-9158e80c19fe@csgroup.eu>
Subject: Re: [PATCH v3 00/16] dma-mapping: migrate to physical address-based API
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On Thu, Aug 14, 2025, at 22:05, Christophe Leroy wrote:
> Le 14/08/2025 =C3=A0 19:53, Leon Romanovsky a =C3=A9crit=C2=A0:
>> Changelog:
>> v3:
>>   * Fixed typo in "cacheable" word
>>   * Simplified kmsan patch a lot to be simple argument refactoring
>
> v2 sent today at 12:13, v3 sent today at 19:53 .... for only that ?
>
> Have you read=20
> https://docs.kernel.org//process/submitting-patches.html#don-t-get-dis=
couraged-or-impatient=20
> ?

Yes, I'm aware of that section. It is not even remotely close to the rea=
lity in different subsystems.

There are some places in the kernel where you never get any responses.

Thanks

