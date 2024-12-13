Return-Path: <linuxppc-dev+bounces-4102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AA89F07C4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 10:23:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8kRW6NWqz3bSY;
	Fri, 13 Dec 2024 20:23:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734081831;
	cv=none; b=Dey6Ht7SuCl2iHT8QyRVQGlY6Qyiae8UP0ba7AFOPyh/2yFvVOB8biSKCr1em1TTs4tc7gvkH5vkd0Xck+AdZzAlc0M+hMotZmQ0g6zzRbVv1aZkZSZUdKmUmBZZJKeEQDhXn08rwnyIsy7p0R0SadCAvyStFZXrrzY0i+ydxs3tlEJdXOkSx3dknk/NMXPFXVx6bgiRd8cVwVGwAiKNBUmIWwAWsSVkKHcWGX1bCrlrRky4YzbFKdFgxp/tvVoMES5o+DikCgJV9ThItFO+fF+G2AniQSLs/SChSt8CjqghaBJohm/YSiLJqYbpD9Aw6jYgW944ZNo3awlGxh9skg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734081831; c=relaxed/relaxed;
	bh=n3jJEXDlikai5BIZE32F7/anjx2vQjCMi91W2c/0OIU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nwNvDWdp6WBqfWiWgnlcuBs5YXiDVD0V1MSBrpiQZaVKqBfTeiKQnffS7El9JzXrmCU+/rH7KZoXXfMsROJzL1baFFUbSc7+Ec5H8sn4jW2hPFMmDPMySRMa5KXCSPI3FWDqXFyGymlf31BDBTdEZeOPSA7CxlygTx9euZ8jsH/Rimjny8PZ0jBlij1B1M5J/HJWLdJ0Hk8RAmB0In7juW6cJ+W9MsMrprTLh4s44oVxL4THIG915QSlAFT7/S//1LuBOWkXwIDiSX8sgQ1rFCnjIdK12UKxYY++0ALdByl8SQ8TFxJKTrOr9+aCGUWsBBJMwbUBpVzuHtmrPrVp4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=s4TV2CZc; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=gWU5S28d; dkim-atps=neutral; spf=pass (client-ip=202.12.124.157; helo=fhigh-b6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=s4TV2CZc;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=gWU5S28d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.157; helo=fhigh-b6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8kRW0QFQz3bPR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 20:23:51 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 54AC925401E6;
	Fri, 13 Dec 2024 04:23:48 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 13 Dec 2024 04:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734081828;
	 x=1734168228; bh=n3jJEXDlikai5BIZE32F7/anjx2vQjCMi91W2c/0OIU=; b=
	s4TV2CZcFzkScS6acPGBCbdFq7V/Dy9RHjeZpO9D08kgTWi83d99z4rSFRDlfItn
	79LEae3O/sswqtGNjOgw6p7A2uwEeu0rfXX0KGnM24oGxe10TsYGKNa9gjwrHH1M
	77z/q7KtVruOe0OdOi5TRWS78SiFNa+SiVNFQ+rpodntJZ3b8xuSM3Xs5Z+TlZPj
	jYk2eN1Px/XuwrJJme56jgHrfrvdu83wF+LObLjV/zkYuwMf0uA5hR0Zcu2ry91Q
	Ry+Uz0q570BdWx1QqFQRL9PRUaVrmXH8DYuhm9SCjYYBS5lrtdgQP9GSk2sX+/SO
	z2MPOgw3vU3Pc2EnX/A7kQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734081828; x=
	1734168228; bh=n3jJEXDlikai5BIZE32F7/anjx2vQjCMi91W2c/0OIU=; b=g
	WU5S28dBtpaWIxa/WfM5+DNCtPcxjWDKZ5b2kRMCICSJF1Jbck+yyL1ak4Ck+oF0
	nox2Q2CbaqUmj7XEf9+21T4ImwGeKoHVi5AE+xHWohHrRQcDoHgKvZ4Yr4kY6gni
	YZIOiSrcIdaQcI0AhGo/p4lWcpMTXzfQ5zLFgCQXQPUT1krKF2v2ZDBcSySmQnjw
	BJqoRz6HxfoszAxXbUwIJzPE5lcC5KeaE/0Fici6VhdoTdJ/8znEVN09XLsFhFrI
	al6U/3+bf4zSqkaual62alMbdvj4QXQ12jAo9/gjiXpO0Ig4vhKGaXWuY4LUKeOi
	9cB+GvrtMyfHT96cMjZ9Q==
X-ME-Sender: <xms:I_1bZ3bSMslrR4QcwZjgzRBZ5UKLplvFQPQjA0HoCnQRTVB04lTnEA>
    <xme:I_1bZ2a8d_Q2fZ0Na0kNwzMS2ZkTU1yxsCa3UliYufnRsy7JexVQuLspvw1Yp0hIM
    JzKyNy6s59A2VINbsY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrkeejgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefhedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtg
    hpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphht
    thhopehgrhgrfhesrghmrgiiohhnrdgtohhmpdhrtghpthhtoheprghtihhshhhpsegrth
    hishhhphgrthhrrgdrohhrghdprhgtphhtthhopegrnhhuphessghrrghinhhfrghulhht
    rdhorhhgpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouh
    hprdgvuhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphht
    thhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepmhhpvg
    esvghllhgvrhhmrghnrdhiugdrrghu
X-ME-Proxy: <xmx:I_1bZ58zp8MDxlCvv9u8Ry7AWm65nv4xnbOyH4IiLbt8eU9JURJk6A>
    <xmx:I_1bZ9pACUTZW8WwPhf4QcxSOuYSxTAQPur06CGzF5qEKPbeOcByjA>
    <xmx:I_1bZyo9cFmEKSDlhBCOYIixy__LIbIAUQqjIMpbNVa2B_j7nEn0sg>
    <xmx:I_1bZzRjXDv_56jhWmo6jXwpR2ylFASCuDSuCjtAjXh0sDj2yp1RYQ>
    <xmx:JP1bZ_ItKkj-d1aQhFXJA5zdxncKJIEWh0breQRKQ_juZTDHL4INUEmF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CDDBA2220072; Fri, 13 Dec 2024 04:23:47 -0500 (EST)
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
MIME-Version: 1.0
Date: Fri, 13 Dec 2024 10:23:27 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andreas Schwab" <schwab@suse.de>, "Arnd Bergmann" <arnd@kernel.org>
Cc: kvm@vger.kernel.org, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Jiaxun Yang" <jiaxun.yang@flygoat.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Alexander Graf" <graf@amazon.com>, "Crystal Wood" <crwood@redhat.com>,
 "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atishp@atishpatra.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Sean Christopherson" <seanjc@google.com>,
 "Paolo Bonzini" <pbonzini@redhat.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>,
 "David Woodhouse" <dwmw2@infradead.org>, "Paul Durrant" <paul@xen.org>,
 "Marc Zyngier" <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Message-Id: <e67c5757-26be-4fa6-932e-c7e51858081b@app.fastmail.com>
In-Reply-To: <mvm4j39ghrj.fsf@suse.de>
References: <20241212125516.467123-1-arnd@kernel.org>
 <20241212125516.467123-2-arnd@kernel.org> <mvm4j39ghrj.fsf@suse.de>
Subject: Re: [RFC 1/5] mips: kvm: drop support for 32-bit hosts
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Dec 12, 2024, at 14:20, Andreas Schwab wrote:
> On Dez 12 2024, Arnd Bergmann wrote:
>
>> KVM support on MIPS was added in 2012 with both 32-bit and 32-bit mode
>
> s/32-bit/64-bit/ (once)
>

Fixed now, thanks,

     Arnd

