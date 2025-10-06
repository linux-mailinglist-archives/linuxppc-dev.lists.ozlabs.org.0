Return-Path: <linuxppc-dev+bounces-12671-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C20ABBD06D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 06 Oct 2025 06:04:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cg5Hh4Xzcz30Ng;
	Mon,  6 Oct 2025 15:04:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759723456;
	cv=none; b=R1hnPPa0k4T+eMLd3sP1mUzy9KQaMoJUcjDaiw5aZMnQGX/CT4IRbrAziib6IrsQtZ91NyihQUcT4UvrjCDSEP8mpMk+FLVJjWj+Ix8hilfpIk6bwdsU/M/rQQCXrw/uS2IDxO4oQoSEQMkLpidse+a7eewqMf90AwevNm/TAq0LCtiOgNc7WnDeQLctK84KQDRlJFfySgiUvgWvs+8TycXTq/kAwWjPNltcRT/HVgPgvmRiMXj0oLUfWtkuGV9eV7EP4S/VVIALg1wWEdTH7MSE1Vn5kBSfqBEcCEG+BCVL13slxDKavZ66L+WdKJSbaG9bxD7Nmu5L8nln6U2+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759723456; c=relaxed/relaxed;
	bh=V0xxJjR/aWnVZlhSQoZ/liem0KiMSdTrOEVmyyiFsA8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CcRuSsug/5y7VVT2n70PcY1UdQpAcN3ADIAAcY/YzD185wGp9VUgBCqNa2OmHThFcBDIOVd0hSu3T0ciajA5/o6fwviBqBBKWN1BGoFDU+nhuBtRxhe0AkTo+snqeluLZlXWXE+eris1jDOgjvn3d0MifcHBGD9YQqmGypiDpCPBcRU3vHzZs23AQO4RE/lkzzVLBJ9MLee1otiwuwNphECepxkqVKpcsTj2lMGtwXt65W92f7Wf4cTVEbpd+Mj6UR5d5Tdh/8p8nvq5xSce+HBhL1F3eQO9HSmZSfdWWjLMLSkTmNpFEoZHY930AmBQSASJ7r1vNppLSXkx1gMrjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dx6gZOcR; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dx6gZOcR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cg5Hg3FMSz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Oct 2025 15:04:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA4606036E;
	Mon,  6 Oct 2025 04:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939FAC4CEF5;
	Mon,  6 Oct 2025 04:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759723452;
	bh=84injLzOLRzdmbDYcF7g7essdb0dt9odOMPRFgL8OhA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=dx6gZOcRbqZU+4kUH56naw+qthiBcZkT1qtIonANRtUnPXGgZSzKl9WgCt0SFdIhm
	 UbVwoHC4Vs5XWd+JXXmA7hVHDHHcljPxzABSrPU51Ilo+qPPKD4b50iM60t7KVVjsb
	 SMzmXH2mA9VXny2uTwbYaN5+nstbvZoog7xyFS4WtMcvFaxYJ3i1X4/aK2vr9AVBnQ
	 f0YfFDMNeIIwcHvnhWFJp9a2t2UhTULfUIaQQ+5l6+IR5madltMoqZysTSG0SPagkr
	 ukbTi0OjnBiX86Vpr47x0xqWuIEElCfBCKo/rFvEhZv8rGQQRLNt3XkZDanjZzNwxN
	 maoDHGG6tUMAQ==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6D24EF40066;
	Mon,  6 Oct 2025 00:04:10 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Mon, 06 Oct 2025 00:04:10 -0400
X-ME-Sender: <xms:uj_jaP_ofC9a_l28ntKx_gy42AQmYCP8lb4C2SR10mCLtk9SsRoVMA>
    <xme:uj_jaGgiJzpY8OBGdAHO0Sug4_6m8jP9b99pQfrT4W6TnMBKVOLM7R8GEtxUIBrad
    -kpFskrRXUFhspIfBqdrOdo09KkfLKr2F4CPRVd9JM75FUTPegu8VYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelieehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnvghonhcu
    tfhomhgrnhhovhhskhihfdcuoehlvghonheskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeejvefflefgledvgfevvdetleehhfdvffehgeffkeevleeiveefjeetieel
    ueeuvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hlvghonhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvfedtheefleek
    gedqvdejjeeljeejvdekqdhlvghonheppehkvghrnhgvlhdrohhrgheslhgvohhnrdhnuh
    dpnhgspghrtghpthhtohepfedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegs
    phesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfh
    hrrghnkhgvnhdruggvpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgv
    thdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhope
    grnhgurhgvrghssehgrghishhlvghrrdgtohhmpdhrtghpthhtoheplhhinhhmrghgjees
    ghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhsthekkeesghhmrghilhdrtghomh
    dprhgtphhtthhopeguvghllhgvrhesghhmgidruggvpdhrtghpthhtohepjhgrmhgvshdr
    sghothhtohhmlhgvhieshhgrnhhsvghnphgrrhhtnhgvrhhshhhiphdrtghomh
X-ME-Proxy: <xmx:uj_jaLVfDv-gcu_8eG8KMmCcu_lqD-hKSTkIpQVlhGsqYjX-BjSkAg>
    <xmx:uj_jaB0W371EPdKaI_VHwQcrPhlDBdzMVGXgBoeat-lOPO7F0-eoBA>
    <xmx:uj_jaEj5JbL-yJ3t6Tejadmxf5_fK5DIiQgEqWTLJ9rYb1M0S8qU4w>
    <xmx:uj_jaJIeYEGT-skfES59I8zK2h3dLuh_CCWKnOpBJzKNKgbBNwzpFQ>
    <xmx:uj_jaFVMUbmcoU_NyQKMtnVnad6DjfKDRYBqvXnd_1VVAyrxFpX1Mb4b>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 14BDB2CE0072; Mon,  6 Oct 2025 00:04:10 -0400 (EDT)
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
X-ThreadId: AYer2uYmcW7k
Date: Mon, 06 Oct 2025 07:03:49 +0300
From: "Leon Romanovsky" <leon@kernel.org>
To: "Jason Gunthorpe" <jgg@nvidia.com>
Cc: "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "David Miller" <davem@davemloft.net>,
 "Geoff Levand" <geoff@infradead.org>, "Helge Deller" <deller@gmx.de>,
 "Ingo Molnar" <mingo@redhat.com>, iommu@lists.linux.dev,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Jason Wang" <jasowang@redhat.com>, "Juergen Gross" <jgross@suse.com>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Matt Turner" <mattst88@gmail.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 sparclinux@vger.kernel.org,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Thomas Gleixner" <tglx@linutronix.de>, virtualization@lists.linux.dev,
 x86@kernel.org, xen-devel@lists.xenproject.org,
 "Magnus Lindholm" <linmag7@gmail.com>
Message-Id: <d8c1e548-ebc5-4a07-8bf5-d98e9f2e6587@app.fastmail.com>
In-Reply-To: <20251005233133.GL3360665@nvidia.com>
References: <cover.1759071169.git.leon@kernel.org>
 <333ec4dabec16d3d913a93780bc6e7ddb5240fcf.1759071169.git.leon@kernel.org>
 <20251003150144.GC3360665@nvidia.com> <20251005132259.GA21221@unreal>
 <20251005233133.GL3360665@nvidia.com>
Subject: Re: [PATCH v1 3/9] parisc: Convert DMA map_page to map_phys interface
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On Mon, Oct 6, 2025, at 02:31, Jason Gunthorpe wrote:
> On Sun, Oct 05, 2025 at 04:22:59PM +0300, Leon Romanovsky wrote:
>> @@ -582,7 +582,7 @@ ccio_io_pdir_entry(__le64 *pdir_ptr, space_t sid, unsigned long vba,
>>         ** Grab virtual index [0:11]
>>         ** Deposit virt_idx bits into I/O PDIR word
>>         */
>> -       asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (vba));
>> +       asm volatile ("lci %%r0(%1), %0" : "=r" (ci) : "r" (pba));
>
> Don't know how I missed this, but this is the virtual address for the
> cache invalidate James mentioned
>
> So the optimal is to drop the lpa() and to use phys_to_virt() to get
> vba for this instruction.

The optimal is to keep parisc arch code as I did in v1 and don't change it too much.

>
> Jason

