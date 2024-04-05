Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D023C8993F7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 05:45:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=C81QSD5A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9ksD4ScTz3vYc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 14:45:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=C81QSD5A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=64.147.123.144; helo=wfout1-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from wfout1-smtp.messagingengine.com (wfout1-smtp.messagingengine.com [64.147.123.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9krR4H2Tz3d31
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 14:44:37 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id 0977D1C0009E;
	Thu,  4 Apr 2024 23:44:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Thu, 04 Apr 2024 23:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712288670; x=1712375070; bh=YYryhgN6k4zAyvC/eOIu42dxlhfu
	pw+E0NbxOoGoDXg=; b=C81QSD5AN2lgFOxtYWBrXWwhGfRaN1myhcFPEJtsdna1
	y3KI7ki6k3LoQ6wanvh7ek7OCGqnuk8La/UKj4YzV50mNwatTsKPAYY3wOo9TWkR
	1TH/PV+rfnVHnNFV9AMr7l1uft7y5+64d8VirT5vgvMi6QUaFOZrxyfsgy2uXTGU
	5Ii8y1HpotS7x7jrOEpHoBOQ9t4tyFOCI8uhNL6Ny/qryGILHOvLDlwglpjZDkok
	LBjfXTN/JKNNPYN9jMJ24rKPrLwAZXo9mtbeyw94TQscJQTPAN7y1wCU1+RSp0Bi
	oRMifHOt66N8dTO6H7oTYyLslz4mZfrvaSvcS4e44Q==
X-ME-Sender: <xms:nXMPZrWAi09F-2pkasZh3e4LxYUURcYASuu9XXfN5aFte3fVVGHmiQ>
    <xme:nXMPZjmH2hhl2bjt2RSrZ5CuVgXf-g0weQBhcVpVmrf9Ae-tm5PVWXZZ0XqGcsPAn
    Ne9GoZrkfW39p9UqXQ>
X-ME-Received: <xmr:nXMPZnYhdfi4BpVgPnTJsselG-2LMSF68qraFL4CBAf9zqYU5V4rPAdKVXQP0VBN4rAh1iDjrmXlHVJ-7Qp_FE9kkSgneEE-7a0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudefledgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:nnMPZmWvmndcnC68Z4XcXHk59kNUS7IUTfsRxTvSSJhoPm8cUQW_Kw>
    <xmx:nnMPZlkw0WmXCIj8Ey7Urnj7JoFoTaODYcuyRudjL79ESfV2E_NIEg>
    <xmx:nnMPZjcodEDnCWyPaFGcVcUDJsuwW-dAe9V_guzE9DxdrkKXPSZ2EA>
    <xmx:nnMPZvEa6ASIjTJQYhMcHRfXiODLjWNsgAKvDMHhgA95SSBy43a8pQ>
    <xmx:nnMPZnn37qv0I34juauWUCcca0SPYmpyQZ3yNtnYZY5ny5gBAYpXi5_L>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Apr 2024 23:44:28 -0400 (EDT)
Date: Fri, 5 Apr 2024 14:46:17 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Jiri Slaby <jirislaby@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq
 flood
In-Reply-To: <87y19s7bk6.fsf@mail.lhotse>
Message-ID: <4bddf8ec-97f1-07f6-9c0a-523c102c0a1b@linux-m68k.org>
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org> <Zg3YZN-QupyVaTPm@surfacebook.localdomain> <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org> <CAHp75VcxLez_Nm0N8=gpWd7SKGd9JF2QXEOOB_gvX3ZtTzj6HQ@mail.gmail.com>
 <87y19s7bk6.fsf@mail.lhotse>
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
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Fri, 5 Apr 2024, Michael Ellerman wrote:

> >> > > ---
> >> > (here is a good location for Cc:)
> >>
> >> Documentation/process/submitting-patches.rst indicats that it should 
> >> be above the "---" separator together with Acked-by etc. Has this 
> >> convention changed recently?
> 
> The docs don't really say where to put the Cc: tags, although they are 
> mentioned along with other tags which clearly are intended to go above 
> the separator.
> 

I see no ambiguity there. What's the point of copying the message headers 
into the message body unless it was intended that they form part of the 
commit log?

> > I see, I will prepare a patch to discuss this aspect.
> 
> FYI there was a discussion about this several years ago, where at least 
> some maintainers agreed that Cc: tags don't add much value and are 
> better placed below the --- separator.
> 

Maintainers who merge patches almost always add tags. And they can use the 
Cc tags from the message headers if they wish to. Or they can omit them or 
remove them. I don't mind. And I'd be happy to resubmit the patch with 
different tags if that's what is needed by the workflow used by Jiri Slaby 
or Greg Kroah-Hartman.
