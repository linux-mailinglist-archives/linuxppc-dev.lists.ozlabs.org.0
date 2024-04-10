Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 671838A042E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 01:44:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Zj0athZp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFKDv1DVRz3vXl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 09:44:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Zj0athZp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=103.168.172.150; helo=fout7-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFKD35Zclz3cM4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 09:44:01 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 139DA1380151;
	Wed, 10 Apr 2024 19:43:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 10 Apr 2024 19:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1712792637; x=1712879037; bh=bNMg1NINdfov5fE28cnjx4gPyFXP
	b8x0Ed9EbQW+UjE=; b=Zj0athZpcBqw4LBCEYRO4uIZESXsiMfgl3Pd8ZNHvcps
	kBVQv1qftU+JxF/ifOdLCOG4EUgmQU9vc85Blaved1YE7A624xH8I+fwdviIoH+X
	gUMKZChRB29PCUHOnK2aS1qB3MVYumQZAhuyB9pc0jTf2qyLU1sJrRpj4uwu/d3J
	klrQJgor5HJZsxFTXA5d8LOct2Xh5Gh38dgAQBiqW6eAT+YI4FkI9QLdwjQKkr3D
	1K1JIlb1ji8CJk/YQ+ZbHBRA7a5SjegrP29GeJ6awYargoz56iInxEeoqboF7iEj
	kHxrsqBd+hvGkjcMXvIYwccs3nkanC0pAwDYoJJ78g==
X-ME-Sender: <xms:PCQXZq1aFKWxI1FEeOmRXl4M-GJ1JghcCXc_T0bikJfWY8a5d5qDog>
    <xme:PCQXZtEllHgyZRF0AlY-NsKIKCPnlmVq_Y1-TgbgNopqCr15gcYDCD2jK0aZ_Cc20
    mt_ZByHgSGWG_xDMrA>
X-ME-Received: <xmr:PCQXZi44GoPDMyPdy8EYkfUywqNfvxUCGVdBsbJgbZo9-IjCnPUmhq0ntLxuBtvfFZ-seZEawbTo2OMhGuqiHladoXMdc8u1k1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudehjedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcu
    vfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrg
    htthgvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeu
    heeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:PCQXZr2r7lP-f9lauhFdW3EhfpUGo2an6v-N1TpsOm7xhgbuP-hXkQ>
    <xmx:PCQXZtGxap-AhhgfYTGn2_OMVV0B_v_5SU8oFx8y-9k_NUxO7C_Vsg>
    <xmx:PCQXZk8YwmdkhjuMA741W0C06uKnT9N0ZKFp29NA_U2saufjON4hqQ>
    <xmx:PCQXZinl7OwFJnFwRKYrX6ZVE06z5_Li1pxfV9Ct5P4ZXSGnf3507g>
    <xmx:PSQXZjaIn2qvY18pp2TpkVCKZY0-MeM9ewKjg7KAitwMfU_WejDyEs3U>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Apr 2024 19:43:53 -0400 (EDT)
Date: Thu, 11 Apr 2024 09:43:48 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Michael Ellerman <michaele@au1.ibm.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Make cxl obsolete
In-Reply-To: <87o7aha1mj.fsf@mail.lhotse>
Message-ID: <cf03bfb4-0970-fe3a-062f-8c4e371a7afa@linux-m68k.org>
References: <20240409031027.41587-1-ajd@linux.ibm.com> <20240409031027.41587-2-ajd@linux.ibm.com> <87bk6jb17s.fsf@mail.lhotse> <0dd09e90-440d-46f0-827e-cbef93ce72c6@csgroup.eu> <87o7aha1mj.fsf@mail.lhotse>
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
Cc: "ukrishn@linux.ibm.com" <ukrishn@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "manoj@linux.ibm.com" <manoj@linux.ibm.com>, "fbarrat@linux.ibm.com" <fbarrat@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Wed, 10 Apr 2024, Michael Ellerman wrote:

> >
> > Could we do something similar, write a message at boottime when the 
> > CXL driver gets probed ?
> 
> Yeah, I think so.
> 
> There's still the problem that people tend not to look at dmesg until 
> something breaks, but at least we can try and get their attention.
> 

People would get in the habit to look for that, if all maintainers adopted 
a convention such that a boot-time message would list every newly-orphaned 
driver in each release. Maybe the maintainer of the MAINTAINERS file could 
check that every newly orphaned driver got announced.
