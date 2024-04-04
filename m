Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D42489911C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 00:16:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Jw1DfUkh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9bZ46sbLz3d2c
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 09:16:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Jw1DfUkh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=103.168.172.149; helo=fout6-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9bY972ttz3cML
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 09:15:55 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id CCFB913800B8;
	Thu,  4 Apr 2024 18:15:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 04 Apr 2024 18:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712268951; x=1712355351; bh=2BjsJg1F1jsrIqkTlwXi7zvS9Quc
	1lTtGbFTjSTDfA4=; b=Jw1DfUkhxICYlaH25P8sNWWfmviY9fTgQD1YAkM+b7J5
	MLDoXeSGk6Ppi2vjNecFMnDMVAWH3cOI51tY25oyukCw05gCNvfiUFjjdFECZNKa
	m6kmayGHiHqRDj+AaubmnhfiCBKbgp2EmGoAOKgnyeAbKRBH5uvrTSwHI0OfjCwQ
	sZh1VGtktjiIk6Q4UAII8BrPseCAW5jBPLkOcHDgMsoDrbctl0ul4GLZPzSG5ny8
	mmslf+tCky2hCQa0gvjwvW1FFj6Ec3CgKxiQvwc14ovTWKx/Vzmm0GWlRDGYB8L6
	J2450RXPLz9cVmVP+dLv4twnNIQ7ApXzz/femDFrSA==
X-ME-Sender: <xms:liYPZvsdxUwhpSDsLAJ15Ck6MEr4JUZhkhvSW4-OJWf8qCgqKfkCUQ>
    <xme:liYPZgdiN14S6lFyxmsaXVP1Hp8-WL0eiNV1Fs9pOJoeOMZHRJlDbJJ0O2oibCxNs
    5ZKoTv0O3_tFUol8pQ>
X-ME-Received: <xmr:liYPZixfe0dvx1nFnKAy4_YRH4ksESFowbNWe2tzbjOn8zuQkuw-FiJ-igtn_J_2x6-zBWbj4Zzu_ZzR2n1MSy-jpDuL28_WP_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudefledgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:liYPZuN5fHDfdNiFMxbrhi9Y_PDp_oI2lNBNnq2OQbPrGu25iHDF_A>
    <xmx:liYPZv-bCS5UZc1XWxuLXceT-WG_8FC5MZT1S7WDvlPmVScgt2-J_A>
    <xmx:liYPZuUhOa5q13FGdcikfp-_luhQxgFEaFh2XZhOxBrX5T4JeBFzqQ>
    <xmx:liYPZge-gMrPjOIYZNYccbqHomnavk-glqv0v4MXwVjv-HW12g49cw>
    <xmx:lyYPZlf_hyBptrtbhf2hDfT4IkUpmoIs8cEwLP9MQkAFhP5RVpNysbGG>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Apr 2024 18:15:47 -0400 (EDT)
Date: Fri, 5 Apr 2024 09:17:27 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] serial/pmac_zilog: Remove flawed mitigation for rx irq
 flood
In-Reply-To: <CAHp75VcxLez_Nm0N8=gpWd7SKGd9JF2QXEOOB_gvX3ZtTzj6HQ@mail.gmail.com>
Message-ID: <5dd285bd-b9a8-c85c-9bd9-a839c10e78fd@linux-m68k.org>
References: <dda2187e128bfaaf092351812e4538e2e41c17f6.1711599093.git.fthain@linux-m68k.org> <Zg3YZN-QupyVaTPm@surfacebook.localdomain> <8f234f26-d5e3-66ed-ab0c-86d3c9852b4a@linux-m68k.org>
 <CAHp75VcxLez_Nm0N8=gpWd7SKGd9JF2QXEOOB_gvX3ZtTzj6HQ@mail.gmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-m68k@lists.linux-m68k.org, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Thu, 4 Apr 2024, Andy Shevchenko wrote:

> 
> > > > ---
> > > (here is a good location for Cc:)
> >
> > Documentation/process/submitting-patches.rst indicats that it should 
> > be above the "---" separator together with Acked-by etc. Has this 
> > convention changed recently?
> 
> I see, I will prepare a patch to discuss this aspect.
> 

If you are going to veto patches on the basis of rules yet unwritten, I 
think you risk turning the kernel development process into a lottery.

How many other patches presently under review will need to be dropped just 
in case they don't conform with possible future rules?
