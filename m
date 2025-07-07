Return-Path: <linuxppc-dev+bounces-10143-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D771AFAF26
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 11:02:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbJCj4zCsz30V7;
	Mon,  7 Jul 2025 19:02:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751878945;
	cv=none; b=a0adj+z/UYHRd4t+xAjseK/M9OThBprv1C6CytlJ4+JmEtKSav7J+M9HzJlQFu3BAB6PeAPnERpK8OoK5y2cLD1Vnvu2car4KYrQt2YVQTKk2JxoGX70iCORx36WrioZ6p6GVadvuhz2byCbN7ooA05wGAG47Gdd/0DmdF0MzBopJ8sJft4YG4jTUJ777qrM6cAaSvDqaDPqdTc6x17q34bKw10pSYIp9JdFog3rq51/cTAIfzEu9XihXd6LMQn0FcGPjoV0kmWaZsSGU+llJgmLKlWNUI+7+U//XhGjzk+G3jAO+HIQEAm+XwAF+jxWn0RbSS/f25fvU2UUevWzHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751878945; c=relaxed/relaxed;
	bh=x5RAfZVMPJFJCrDqrPzzBGj1iJyK9B75WsIFFR5pUZk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=AKZtoIgiEFdHwMyg/WK22Uri6/ZOvXr1ueBHcCmZsQDw95tKE5XZJrBH+58MLfbbqE20crShQrOEcJvajR1GoWLUwByuFDeh5z9/0kYDgcFHQY55wV0kqgXi1lG2kUuBwzco09PsI9KM0vXdFN0CxuZLA2/Hx0ecSxuN4X5P+uEJnHN3BHm1XYKIkRn5ZIrzqHuDM3oyyHuyacQpQctcocvpNlbvUxLbcBuycCuCSk/wTunmUBZKIIMseq64ci39SwC8aNGjd3z6OErNpw7GIbphYEW8PPZQkd/y1VF0LVbi9zhk3b8Ah1q3OEJnqKd2EM5/RenWz+rN6gS30HG6PQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=MRPltjlH; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VqAPi0DX; dkim-atps=neutral; spf=pass (client-ip=202.12.124.146; helo=fout-b3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=MRPltjlH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=VqAPi0DX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.146; helo=fout-b3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbJCf1vCqz30TG
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 19:02:21 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 85BCE1D00056;
	Mon,  7 Jul 2025 05:02:18 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 07 Jul 2025 05:02:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751878938;
	 x=1751965338; bh=x5RAfZVMPJFJCrDqrPzzBGj1iJyK9B75WsIFFR5pUZk=; b=
	MRPltjlH0iB5ABfrEAPz8jxlQzIzkA0C8NHl466fcTH0nM1xGALmLY6qJlzD72KS
	/OWvnjDSiOG0iC5X8m4V9b7TnFv+EHGgmMPXPs5MiPdD+ORGlO8h1u3dT/tGKAak
	3kRTwPmqFyGnAgg/2yJBtJfQw7lWapSc2IG4iylPyTBtGad2quSh/BpN/N2zKM0I
	rlC94nxlvPPe+7nfnPmdXK7WuRY35aI20QwdNEOlST65lpDUq04xA3+qurCG3YP8
	hg57oQds6lGOZfuMk1m+iGFC8LFXnZdXkyTywoEjjT+KSGfZcMYYP1Kd509Ubltc
	k0WFIyUNVW068evpVAxopA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751878938; x=
	1751965338; bh=x5RAfZVMPJFJCrDqrPzzBGj1iJyK9B75WsIFFR5pUZk=; b=V
	qAPi0DXwZHrfg5lhevVIl6pOXVVk98H1tYn136DOUIAgHs/zyKnWcpkwyz4HcBAW
	FnIp5nupq03Jz/ch7/xXB8c2vj3oQpXHKBCuvrgXqHd1Ohi+Ie7umjbeBmz5eT46
	Yme+IlFuFpwCbRp36hJ2idvW7TPZBdAv8fkLb+IxnmyDjjSRI9x+O6Fk3RygQ5rE
	jooN8W9So/hXGYZEUgpsScWYX8gGavy//kkHe8cenM26Ov4IZRaWQ9dN+f+kQ1NE
	nVenC44344PkcTjtn0ta3Tg+g0+B8CEbXzCX7PFMlwhsCvSJ+GEFIievAsqm/k1z
	i0Ugcxark8eVBaYjl95Ug==
X-ME-Sender: <xms:Go1raICblR90SCI6WKtE8UjdZexet7Og6r0H9PPLOCcUz8SGy7vsSQ>
    <xme:Go1raKhRXn5mxEuus7oJB1LK6aJykgDrVza7G1WiJF4hB9AyaknfhWllyzD6gzNqN
    r6sOzPJ3vT9PM9xjag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertd
    ertddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhn
    uggsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeegge
    etfefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtoh
    epiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkphesihhnthgvlhdrtgho
    mhdprhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhope
    grkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepohgv
    qdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhope
    hlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Go1raNyFpFHXbUmeHAspkEPC1wKv1-1elgq7av2FHzeqx7ZfkvF5Rg>
    <xmx:Go1raK2CZK0XxpxLCXzqaUM6k5pGrVsxHfh99F3LB1WClE-TVKoiZA>
    <xmx:Go1raNx_Xi2G_320AHJVIVlnAtCnXdcmVSy-zLTdfMVEWlPKGmvumA>
    <xmx:Go1raBHtoCYbdKwNzASDDlfkkcQM7aN3iQge38PcKXJoD7bEiJHq3g>
    <xmx:Go1raB4fBUUMSyNdSJ4zr7Nfd6NOj3cjv_wF2_034T855DVAoTGXoTYQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E951F700065; Mon,  7 Jul 2025 05:02:17 -0400 (EDT)
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
X-ThreadId: Td6fd7ddbb462d16f
Date: Mon, 07 Jul 2025 11:01:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Linux Memory Management List" <linux-mm@kvack.org>
Message-Id: <a38f2413-b13b-411d-88eb-7bde2852f9c2@app.fastmail.com>
In-Reply-To: <202507071557.SDU74U31-lkp@intel.com>
References: <202507071557.SDU74U31-lkp@intel.com>
Subject: Re: mm/slub.o: warning: objtool: ___slab_alloc.isra.111.part.112+0x4c0: can't
 find jump dest instruction at .text.___slab_alloc.isra.111.part.112+0x68c
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jul 7, 2025, at 09:56, kernel test robot wrote:
> commit: 4496e1c1354bd4837bcc1414f6e1a4d042857903 crash_dump, nvme: 
> select CONFIGFS_FS as built-in
...
>>> mm/slub.o: warning: objtool: ___slab_alloc.isra.111.part.112+0x4c0: can't find jump dest instruction at .text.___slab_alloc.isra.111.part.112+0x68c
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for HUGETLBFS
>    Depends on [n]: (X86 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || 
> BROKEN [=n]) && (SYSFS [=n] || SYSCTL [=n])
>    Selected by [y]:
>    - PPC_8xx [=y] && PPC32 [=y]
>

This is an existing bug on PPC_8xx that got exposed by my patch
but could already be triggered in randconfig builds without
CONFIG_SYSFS.

      Arnd

