Return-Path: <linuxppc-dev+bounces-7183-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A605A67673
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 15:32:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHDnx2y3bz2yLB;
	Wed, 19 Mar 2025 01:32:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742308357;
	cv=none; b=ksMjlmi5zQjt+BvMmunSUsPcaYIVUtm0Y/b15mjXW/PVWQ+e0SjtECOb0FEY4ORLyaiKkUWfxYlh7Haj/j3KdaFMGvvpscWK+SCx8BSz/dqMT3w/Kkq4J7ehDDoYp0b6GnKRu+FnOFRe7vKb77v4lUFxf+ZG6qWaDxa7T1dM9+BdOEURGUQBet9FA1lZEyYGH3AR+tLNubE9qRoZXlzGBj0kWHdymy+tsjzX6Xm0AC34xYB2KgFoKxOcWWrrcDq+XOru6a7gXGxKdXk9EVDFtR6Y/4RmE8tCBSSDEcYt2bsm0ay4IZ8a9C2pPA3NKThlxnqw0fuYhgpTKThd4t9sOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742308357; c=relaxed/relaxed;
	bh=3zH0zIzfMPX0IzLv/ep/R2+X8F/IWB5VDiuwY9CZdp4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=fcanm4P1VElMhX9xIsyzBw2vIYhcO1niGdMyo5tCUsf45R0wKdxVPH8n3oLDybOSy5yZhAzFufaYK6rbaU0HWLyniOp3iFKjbWIjnIoCQBzQsCFXoMaTdbkqerP6+VR+1uG+fqDd2xvcXo5ag7jmxhWTkE4QFGbhSJbpcq0DhBa40jPN/12oVDJu0C2lb5RJseZc+X4lyLHYT5rdEQpJFOq93dGA6DiyOKrIcg39lSTi3VuxnwEweKs2nCY+EmT1L+QcZ4wekSDgJ0l4rdsQz6/Pns2gepB5TrU+8PDEV3fAhPUjeQC7K6zJesRswz8nAN040lelXhzRJF2rJg7jyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=V0N38Kgx; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=b6DtvfQd; dkim-atps=neutral; spf=pass (client-ip=103.168.172.156; helo=fhigh-a5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=V0N38Kgx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=b6DtvfQd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.156; helo=fhigh-a5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHDns5BNcz2ySX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 01:32:33 +1100 (AEDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E0F7E11400FC;
	Tue, 18 Mar 2025 10:32:29 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Tue, 18 Mar 2025 10:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742308349;
	 x=1742394749; bh=3zH0zIzfMPX0IzLv/ep/R2+X8F/IWB5VDiuwY9CZdp4=; b=
	V0N38Kgx6nEGmzd4ZMp+1yQvwSTQi/T33VxDdfcnKapCZ0ToBWMjpoGp3BJdAJSx
	VSF6wggTPpY3suVD0Yqn/PjhpwwPVlJ6kowBxjQBfXgZFEva7VrjQ16cSZ2Avi3h
	OY18VPd+foa+WZBO18dswpv0REP7U/r3dmKKqauP1l4XSvopZB+kkoM2sf3ngIeE
	ajLrX2VS45VjnfuheDxnqTCGc5e7tWH6IO0jYvsSxUTzgKT/sJJXv+9jUiwUkDwh
	zHHTwlJNYPt7cQbNDOdMTAO2IzYJ/XeSA96S9EjzdMG84dLiFqsOF4Yw+1JUkFW2
	ioaqlueoKepW06yNDkyZfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742308349; x=
	1742394749; bh=3zH0zIzfMPX0IzLv/ep/R2+X8F/IWB5VDiuwY9CZdp4=; b=b
	6DtvfQd7+bbD3NnKcOyCSNCKlbHAYiXEapIFLKoAsTFJnDUmEoTRshJezRSjYliG
	vIQP2A0XQwiUXONPbjH+l9AtWtvbKospWxgQusXAErIvcLpBff6goAq4aed/0DNg
	KuYcS+RPvs2Lcxoph/hJbH6cfCxOgpM9X7CB7e3Wou+bOC/ck5XW4kBb+Cs2Gx88
	45t1FD5kQVPioY7fDfzUiz7mIbXV8Mg3Y60HdncKwOUhmoZa3nRVEkNCxV+zp111
	AaAokmDaw3t3OgfEzFO8tGNeK/BoyX8mPovo6xozWNxZ7c0SpkwN078P+uIWiPk7
	dnFrgHmjcnqC7Hkk7XgzA==
X-ME-Sender: <xms:_YPZZ9MvwaGfvpuNBXY8lMBPHHD2Twvbb3inkGMeZzfoBMx9fHdZHw>
    <xme:_YPZZ_8Ks8igkmOzMWQC_bvcjr1nDA2VSnS8alWuC-ohjwZhoWrM1ouiIel2a-O-f
    EXvvV_w4cE1p2oKzq8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedvieelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedv
    vdegjedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvg
    hrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehsthhuhihouggvrhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonh
    drohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgr
    sghsrdhorhhgpdhrtghpthhtohepihhorghnrgdrtghiohhrnhgvihesnhigphdrtghomh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:_YPZZ8QgkYzueg74dpDz6gXxtf5SuLTW93kUM-8tBS-BwnCfxlQbjw>
    <xmx:_YPZZ5t3zq5oY-M-hWPcXo7MU4ZoBSTFe5BJOSFnycCRJng8dhnX9A>
    <xmx:_YPZZ1fzhdYUfDTFSbWWyiT06fOIirsEqhDsTPEZSm96DP2X9n1MsA>
    <xmx:_YPZZ11iw_bqsKUu4q0uX11j5BS3adXQGToOL-0Vi1aJMelhegSodg>
    <xmx:_YPZZ-FFMkLtJ0HFhO1ojikVsSkN3u7l3RlmwVAydIqm2Vtpwt6Q5czw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 683C82220072; Tue, 18 Mar 2025 10:32:29 -0400 (EDT)
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
X-ThreadId: T9cc54f082f285df0
Date: Tue, 18 Mar 2025 15:31:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Ioana Ciornei" <ioana.ciornei@nxp.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Stuart Yoder" <stuyoder@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Message-Id: <62924bca-3495-4cb8-83cf-b0b9812ce45c@app.fastmail.com>
In-Reply-To: <1d822960-85a7-42b3-88cf-9d3dbc75a831@csgroup.eu>
References: <2xzljdzktgpsyag5jhfwbxc2sroaacljecsq36hlxefu6jnz6g@zlorxu7niqnq>
 <1d822960-85a7-42b3-88cf-9d3dbc75a831@csgroup.eu>
Subject: Re: Maintenance path for the fsl-mc bus
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Mar 18, 2025, at 14:46, Christophe Leroy wrote:
> Le 18/03/2025 =C3=A0 11:40, Ioana Ciornei a =C3=A9crit=C2=A0:
>>
>> Christophe, would you be open to pick up patches for this bus driver
>> through your tree?
>
> Yes its fine for me to take it via my soc fsl subtree unless Arnd tell=
s=20
> different. But be aware that it will be purely administrative. I will=20
> have no mean to check whether any changes are actually working properl=
y.
>
> In that case please add the following entry in MAINTAINERS:
>
> L:	linuxppc-dev@lists.ozlabs.org

Sounds good, thank you for helping out!

     Arnd

