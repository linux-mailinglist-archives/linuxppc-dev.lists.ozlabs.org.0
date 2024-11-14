Return-Path: <linuxppc-dev+bounces-3217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEB79C8D17
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 15:42:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq2td1kNcz305S;
	Fri, 15 Nov 2024 01:42:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731595353;
	cv=none; b=ePB6sEgIQ2XmqO5oy9REM6k5wN+/RyOhOPu8sZBoqXo4N5Hmcg/vVjPBp0FeRV89SWd8MZdS341Fo1qUeEgl9r5FBKXVYcCxEF8j7ciLh6G46Ihk/VhJtJoHfe3qsSb54H4EfnlPOak9FVPrQ0N4R1w+FFFBbKbDOOeOWzX3kmneNrz62jikr12/pf/600aNO66JHmod/dybag5+5VnK+0o+ma6LSxPUKnI/nKuKQgBa5CfRk2NJKt25q2ux0y59u+Jwv4lhb6V6mSuv4+GCE+iZoS85QlJsYVWOlXv/kt4hswfRUjsastVGppNZ5G6cfeIgXOJ1dP+DUkOE4uV+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731595353; c=relaxed/relaxed;
	bh=d+Ikno+ZFVKYWdZ3jjxaqVwVRHUcpIv7yzpK/oJR0I4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=K8Qztdu0cul9Djkl3vkB2UIFraKGi1Rmno1i9N7A+mP6AR0kumgonU07f45I8jWUVFyXCo/5jXPZXqwb4Gq+Wg3NZHDUb+KFdXInVQcuXKnofW3buQm39YWyrhaUxYbWTCsFReNQSlm4BHPi9WXGQxGqnJnXbW0UX7JBg56dNlfWB3YnQJzZqIRE6Qnv3jfNllOOCILqSGo1z1iiXcZTutrvS8eM+1/oF3VZ7se0BQRscpj+qxULskFT4J/1ErGoG4gkhOyCwT1kdhqdp4tiZzxqFauq8biuQiqaBUMrr5AYhzO3emWUyfJYPhVXGI8aqr46ErBCdiL26IjVrhwhZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=CaW4KMyA; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Qhnb5ZCW; dkim-atps=neutral; spf=pass (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=CaW4KMyA;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Qhnb5ZCW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq2tX0lcfz305G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 01:42:27 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 5136413801F8;
	Thu, 14 Nov 2024 09:42:24 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 14 Nov 2024 09:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1731595344;
	 x=1731681744; bh=d+Ikno+ZFVKYWdZ3jjxaqVwVRHUcpIv7yzpK/oJR0I4=; b=
	CaW4KMyAOGexXYhGpffvrReReIhm0wvgihJCAkrScp94Z9LDpcGs1h06PiCw7zeo
	dtP3HDsZT3TBI82JdTSd4hHeEqTliaPNA03MLBZcPWt+b1IWxwWu1fR9AN06hlhs
	p2BKSpdrZzOeh2Xz1HJdj14bPz4ec2bt1W6bkga7h2tTb8flmr65vN0pLYZzTNO1
	OdvmBeUgqrDhFwTgJWew7a9rFUpxHXjW6M30JFaaLT1Oqj8YtROCGQaaobhfoprI
	m8s5F1sJXpXUQiGMcz1GVGAom1Y6yHOytZaeRuyCzWxC2moN8TMZps0zFzMAMcPI
	Nw9cS48zdpEo36SyHgLGHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731595344; x=
	1731681744; bh=d+Ikno+ZFVKYWdZ3jjxaqVwVRHUcpIv7yzpK/oJR0I4=; b=Q
	hnb5ZCWyhF2Oc0DW3sC1a7LGVY/Z+P4E6sTsCsgP8tWavkdi+nGixvVYGSvHsfQ5
	ktGD8ydDdIuJCxC93OtapQuBsrWYxYBZrQdr43h0dyYzfNGWigYe+2B4u1DXgzDo
	ZyXJvkxj8JcX0y32DAtZim4m9gyFAeM0vmDk9R9n+VeUMMNwV9N3eTDmpnBgeBBW
	C6zwTMAFPkrAJOQ7K9grxGTBHBLP1fyQyNaJQvdCMFTb8oX1KaqnLV5R/nCep1cV
	rB7NhV9DagU4CewTn/8gaQyqeM7jcV6P90US1rYgA3NBFoHvXQZ9EgPLYYoNm/2X
	0zR6yOFZljbdBfHJ5Lz2w==
X-ME-Sender: <xms:Tww2Z3HFksmytPVQJoRMCgtMLEb4S2nr7HY847_983uOWrtwaviUvw>
    <xme:Tww2Z0WzA_uJ9-isnsrQuJ3yfVurZNqOnGT9Cg4kmw1eBuSOVTav9yECUU1rJ90oj
    EQeY8XTfTQgkqARW-M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvddvgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurd
    gruhdprhgtphhtthhopehgvghofhhfsehinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    oheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtph
    htthhopehjkhesohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:UAw2Z5Kqn0SHidYWTQdmc2h_b-e2b3eocJUNG9k8tN2KTFuKJlhK4Q>
    <xmx:UAw2Z1E4tspN3hJyR8iwVnDdo2Mb1qJ6FbM5QjXDPhLZDFweRqtH7A>
    <xmx:UAw2Z9WEHmurer65EKYEDKwam8VHM6Cas6II_RsqUZgYz4NvksBnCA>
    <xmx:UAw2ZwOJmLKNNIFZ4m21fI2i1lQCYpjMNhaG87gGsz4eirpesJhmsg>
    <xmx:UAw2Zzy1GPXJrNeBKWk5TenjwbQKlM2fxqRLgzJrmDN9gnc6aFvHm-tC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DDAC2222006F; Thu, 14 Nov 2024 09:42:23 -0500 (EST)
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
Date: Thu, 14 Nov 2024 15:41:26 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, "Jeremy Kerr" <jk@ozlabs.org>,
 "Geoff Levand" <geoff@infradead.org>
Message-Id: <e16f8cd7-aa46-4f43-926d-21f2b77eb213@app.fastmail.com>
In-Reply-To: <20241114125111.599093-10-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
 <20241114125111.599093-10-mpe@ellerman.id.au>
Subject: Re: [RFC PATCH 10/20] powerpc/io: Remove PPC_INDIRECT_MMIO
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 14, 2024, at 13:50, Michael Ellerman wrote:
> The Cell blade support was the last user of PPC_INDIRECT_MMIO, so it can
> now be removed.
>
> PPC_INDIRECT_PIO is still used by Power8 powernv, so it needs to remain.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

I think the powernv side only uses parts of PPC_INDIRECT_PIO,
so there is a good chance of simplifying that code further if
we want to.

This bit looks great so far.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

