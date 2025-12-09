Return-Path: <linuxppc-dev+bounces-14705-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46916CB137B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 09 Dec 2025 22:40:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQshy5KZDz2xKh;
	Wed, 10 Dec 2025 08:40:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765316434;
	cv=none; b=nU1Gl2Y91uqfcYQbyvQJLFxy2V5y+fYzIQPahf5pVl/d+BM6LlGIzuaulCm2EQzQnMrEI+plbFZ0bZUdoquGPIeBnLLH+352eE7WoXYzPfhKg2Gv5anDxOZzmUe9uO9x7jCdFg2dliCeMJ75hR28gVHC7//TYlA6d4E3FCjoEbcBbL/e/22TiQC/wJqCyXjcw1A7V+NKy8VcBBzVYHeeUdtKaeJhbMR7xzTbFC2wynO/O4AacWlmi0qCCmHW9+G47+j9duZnwDGyLmqhbw/uc8MOvxGcrl9r9pLcg4rIqhjA0kG23YiSS9tMWdnZqynTmMTDXc54K3L5e3AWebjnwg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765316434; c=relaxed/relaxed;
	bh=RfOZgApXXy9+kALkGYzB/Ets38/jq6fxW2oQQcU2kgQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YuBOuxGaNB3HO6cfoLD4laG7UkRjjph6uFkXtCZ0WdHQs2wsq+pEQBPbKlaKpftS9weQ5ZSprPn8ZXsSceWlMYlwpDVMm4QSCD1FMjc/phCLt3+L4iOPbNVEdxry9W3d9tqEAw43++Lu7LIrB0WxTHmgCN9nl3BvqfdfhpDrgLvCzoep842qcbK2hzxTK890LPl+FohEfWCoYmRu38b+HRlWjKMcCdyNzP67A37ewrSfJmD6J5g9+T04bw38qLYWUMnJqWtE6npxDR0nejIEa1MCqfsyQ+T2J9oUpYLn1WqAEmo7ETdloDw/4zjjvVjqwu3+yy9Fb5EYZzyzElyGdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=wGu4rESh; dkim-atps=neutral; spf=pass (client-ip=202.12.124.147; helo=fout-b4-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=fout-b4-smtp.messagingengine.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=wGu4rESh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=fout-b4-smtp.messagingengine.com (client-ip=202.12.124.147; helo=fout-b4-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dQshw0KrKz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Dec 2025 08:40:30 +1100 (AEDT)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id F34101D00187;
	Tue,  9 Dec 2025 16:40:27 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 09 Dec 2025 16:40:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1765316427; x=1765402827; bh=RfOZgApXXy9+kALkGYzB/Ets38/jq6fxW2o
	QQcU2kgQ=; b=wGu4rESh55E7fU67ONJ/DyKco06l2RsXOtxoT27k2vK9jsSgvBd
	J7ovrmRvtk5QA81DmByzXHCoTkWBX6RcV2yosc0eiAaIAb7cD73dhvSEbWndTFmC
	1BSehsDLcUNny13OPPRhZTt/R27jqBO1be1HhRglIg20ped1y173er7EWCzVRg5J
	j8UghLNYUqZTP/2lMFuG7yhW39P+/GksqB2NhpndTmkJUCtSkrvnSbGo8Hfm38jI
	BWf0pT07hmutPahecewobLhZhKFORxJ0w21KdQNegDjyHb/MbG3Fm1V5HO8bc2wC
	jqlcVpScndhlNKOdrXPF3Q1pCAdtP1Gx9Kw==
X-ME-Sender: <xms:S5c4afUsOm7r13big8FM7Z2vXmxWC2H8BRmn3UDyb3g_y9Ij8yd0lA>
    <xme:S5c4afsTBEacfrM4V02Om4j_LsKA5TDGoYLCBcgzPj1OPTSzt4n9SMySfjndq2uBe
    Ro7OFPEP83ywTWIpFGIh_P24ptzT1X0C4zY3ri2zpp09QJaFBHnwqbT>
X-ME-Received: <xmr:S5c4aa4RrVjk502NblkXptOFrjW5ZHDeEZdNBW5lWlMf3tW8XFw-_CuZL0PUBVZFajjPVrC-CQz95DDS-UoVW9o5l4S_nljcZjA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdeiiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefujgfkfhggtgesthdtredttddtvdenucfhrhhomhephfhinhhnucfvhhgr
    ihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepleeuheelheekgfeuvedtveetjeekhfffkeeffffftdfgjeevkeegfedvueehueel
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthh
    grihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohepuddupdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehmrgguugihsehlihhnuhigrdhisghmrdgtoh
    hmpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtohep
    tghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhope
    hnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptggvuggrrhhmrgigfigv
    lhhlsehmrggtrdgtohhmpdhrtghpthhtohepuhhsvghrmhehjeeshigrhhhoohdrtghomh
    dprhgtphhtthhopehlihhnuhigsehtrhgvsghlihhgrdhorhhgpdhrtghpthhtohepsggv
    nhhhsehkvghrnhgvlhdrtghrrghshhhinhhgrdhorhhgpdhrtghpthhtohepshhtrggslh
    gvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:S5c4aaRZZcImTyCks3l7bDnCzaYcY_w_icAASQFp91JlvDjGaYuQag>
    <xmx:S5c4aVuk0Cuc2rIi2SGLzIPhkxWU7p6BU4tabwJmLHpkFQp_PZsFUw>
    <xmx:S5c4aU9c0e7qRP-0vS72S8OJcvuZnK3DFkgVkmiraJ8RKuOJ-thSvQ>
    <xmx:S5c4aWxS0ftzEajY1FNHg5D41zDEYB9S59jkBwP614yCzt8jOwoQtg>
    <xmx:S5c4aWN0AFvhjWRlkLfdvvM6JwFt4GjIno7VJEG9VywON9RvgacLWwT2>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Dec 2025 16:40:25 -0500 (EST)
Date: Wed, 10 Dec 2025 08:41:21 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>
cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
    Nicholas Piggin <npiggin@gmail.com>, Cedar Maxwell <cedarmaxwell@mac.com>, 
    Stan Johnson <userm57@yahoo.com>, 
    "Dr. David Alan Gilbert" <linux@treblig.org>, 
    Benjamin Herrenschmidt <benh@kernel.crashing.org>, stable@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] powerpc: Add reloc_offset() to font bitmap pointer
 used for bootx_printf()
In-Reply-To: <697723f8-ab0b-4cc4-9e83-ea710f62951a@csgroup.eu>
Message-ID: <3ff1f917-fad4-c914-1ffc-58a5d8185368@linux-m68k.org>
References: <22b3b247425a052b079ab84da926706b3702c2c7.1762731022.git.fthain@linux-m68k.org> <697723f8-ab0b-4cc4-9e83-ea710f62951a@csgroup.eu>
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
Content-Type: text/plain; charset=us-ascii
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


I noticed that this bug fix did not get included in the 'powerpc-6.19-1' 
pull last week. Was there a reason for that?

On Wed, 12 Nov 2025, Christophe Leroy wrote:

> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 

