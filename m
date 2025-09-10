Return-Path: <linuxppc-dev+bounces-11990-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7249B518CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 16:05:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMMrw2pMrz3dCV;
	Thu, 11 Sep 2025 00:05:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757513104;
	cv=none; b=nygGKI785OMLM/Q3sIwGFVtvMwIi22sryi6bA7nfvmk8Ei8NzCedk6MD9/1UiXg7+7Ga/PR7hwB4yP+ajB3QmcqkojWADrjCC8qAGdh3lcWWcBGB8OkJECk/oBsxh0OfVcZ5tDbRS2tBEoidWMDQLZQpkUy2C/Ayt9HF9nDt5ZwIp4dstskVzx6zI4cJpc56H0V+gDu+tHsfH078Q2aipBGX88MO9kJfQvQdCvux/OF3H6WJ00u+8JNfv93OTCe+0mxsSXdOPLw0lB8JSMwialrSS0uS0FmNcu1AgfSg+uyPGrIR2qICsAA0IdImXUc063lj4F5CGvo+kmmsiENc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757513104; c=relaxed/relaxed;
	bh=mKSB+4xL7cCmeYE/ZtEdtCjsvm7CIgVIfr0teJIjFAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYzxrkTKLUYoBJpJ0fzVDJEBXKmy02K/kZ7NatqCNAFiMR74Ggl1DLsZZq84jQLL5YQ93mwzZq2qWKPjzE0PzXlnDgPBhb1OTfyNK1Ng8keggkH2L20F9XKndba2FSYdcEf7Wwgrh1Rnh+5Gfx+51ihMXvLZfOwYiruFcKvy1om+N9sNAN6kD3K8sOoQtsO9jsTxP3nIZNlskPow8ZrXyFg3IeDRt0g5JVpT8jGZyiJHgzcygp/mD2qOSOSo9XHdWH4WqvEenxsHapiRpg+R+03p00x7oB/X197KyuQ50Dczsy/tDjc1ZaxbCxnCCKeSPRnaO3XEnGPoTNqn5qLy7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=dofEW7af; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=dofEW7af;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMMrr6G1bz3dBt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 00:05:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mKSB+4xL7cCmeYE/ZtEdtCjsvm7CIgVIfr0teJIjFAU=; b=dofEW7af/ejhmNipPt2aD1zjQc
	r/T1X53PF0e+BEfGBFGmptVoarxZBEN1Hr7xriD76R1w+M+nvAcyFt2PcHdzuHg+TQmoMQFUdBQaA
	jm/o6jj1rPqB5i/QW6QVLU4W6O2YAUS0S3TvZPMLDfVQol1YTS76QR+/j8xxBFEpwnMLWAqId4scS
	bdUpC9Pcr4BH4JRwC/mCjcKWJe0ye/ZaEnL2OllK0B+92NxsmXiDMXLQP/kJYOtEetOYDdThozbzr
	U+eiVsgCMI71Rea2iE366+z3/3jQiRamjgJEHnieliGZegYbRdaVVmJTC4g6lcXbzYemC7sUUzZ3A
	gI/iBz2w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLRO-0000000A1bz-3lAQ;
	Wed, 10 Sep 2025 14:04:54 +0000
Date: Wed, 10 Sep 2025 15:04:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, imx@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Richard Weinberger <richard@nod.at>,
	Lucas Stach <l.stach@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ankur Arora <ankur.a.arora@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Andreas Larsson <andreas@gaisler.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Message-ID: <aMGFhuHyQwtwyF7B@casper.infradead.org>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <CACRpkdb=E-_6fZ+4mX5FJas9C5Njp3Gwrygs-cAfWNdbP594cw@mail.gmail.com>
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
Content-Disposition: inline
In-Reply-To: <CACRpkdb=E-_6fZ+4mX5FJas9C5Njp3Gwrygs-cAfWNdbP594cw@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 10, 2025 at 03:10:05PM +0200, Linus Walleij wrote:
> This is is done so that we can unmap *most* of the kernel
> memory but *keep* the VMALLOC area, so that e.g. exceptions
> can still execute and save to stack when they occur, and we can
> call into the kernel to execute said exceptions.
> 
> This in practice means the area 0xf1000000-0xffffffff
> which also includes the high exception vectors that must for
> natural reasons also be kept in the mapping.
> What we have mapped today (all of the time) is
> 0xc0000000-0xffffffff.
> 
> A minimal 256 MB mapping from 0xf0000000-0xffffffff
> should be able to cover this.

Can I ask where the MMIO (PCI?) window lives?

