Return-Path: <linuxppc-dev+bounces-15600-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 010E6D15E37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 00:54:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqq3R3Lpxz2yFw;
	Tue, 13 Jan 2026 10:54:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768262051;
	cv=none; b=bibNVJvZF6sdj0m0FUv4bLkJJ/3DM6P6x9EsYhRDF2Eq28H1Pf5h+i3a9czLW3EPfBUCtOeul/lSXaph2CS/QnlzQuqvzbrcGwbhA8wMU9ozrScs9Gb6DqokNgPC4yjgEv5MF7Dxtw9+nFADP/w2FQZNL9k+Jp1c5Hg1SRx7eUxoFUpPpJv/rDtGxwffPc5idJzGX3XZ2SQEXaos0fTd3nwN3+Mc1YoMCYbCWozIJ1dasYsUxf/4fhNqCIfu4miZgsHc2X0nG7icLeM9Ys2UeBiFneUPsOenF3PA1qRKT5631LHpw0r/DQeMribdY/0Fy7J7sZjyas+Lq7hcEwRrDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768262051; c=relaxed/relaxed;
	bh=MFAPVPPrTQcXGzmX4uMQny5ONRwVZsvoYJMZG32QBJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBJ0InIs/gzWKLM+BmuoG7uiNmhn6xBEf/CrTU81pc3hoMMdEqXzTXY604rfe6kL1Ee1Y9ZaFNe/mOKxMmnl6wb5j7g2gUPXNMvs7lsduLmCXSSKT2fInq/sZ/AshDXLSVWkGuQVlmWuxpufjeVoGR7ckbCU1fGFVtw71IrSVrbATr4dJ+KlKH+9132Iwb5NH6dYGEGD1bZryrX6BZAOVdyuBSJ+X4B1A37v4NCeqwDknL5NYQXxx9EbQgkbv5duvStoTShzBuLEH76tb1Mj736kON03Mo9Cus8lHmqfYogGbY90eBfJe/RnEeJQpeiA0OFDg9GDXxYV7Wj08QSkOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iqkNu5TX; dkim-atps=neutral; spf=pass (client-ip=209.85.222.178; helo=mail-qk1-f178.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iqkNu5TX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=209.85.222.178; helo=mail-qk1-f178.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqq3Q2nrsz2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 10:54:09 +1100 (AEDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8b2d56eaaceso796120885a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 15:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768261987; x=1768866787; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MFAPVPPrTQcXGzmX4uMQny5ONRwVZsvoYJMZG32QBJM=;
        b=iqkNu5TXeVI/m0zGzbAcId0zC5F1x5rTlxpVoqwg5xpSWvbKsx6ni87m1IEv3AxRZI
         ju7QQ79ZONQBfsdhavGb9EviouWPeNKZrT+8utIA+OZBPf6zqAS3vc3jLoFX1mVzVdFa
         d/bm/rhbgcJsVA3KZbIS6/AVBSZvqM94JPM9QiqYkCB1Q3A2ai9ImzNWiClBQFgEKkP5
         IqWX2UD6THe6Iik3nh7tCBQt1W+gX0EkLPYVJeGVEiQ1VgOt/WYhGiBJ4eg4s4v64E5E
         sMcLD9XoYIEhroBIpNpa1dtDIOkdgDPIfYOiRiJCWawdwSY7OEXAJv3P4ZWYxle283n3
         0suQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768261987; x=1768866787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFAPVPPrTQcXGzmX4uMQny5ONRwVZsvoYJMZG32QBJM=;
        b=AxUEfjlSOhY3Qc4WOrz/TTa22SE9h+Xzw54cG70DDg5FEOsaYs01el0HNZ3F6pUDmv
         CGhRsrx6yUXo6rO5NXXVshxOTeD0tOqPt6Vp8/HKeo2MScLcgcyLEflXDhLLW1QwefS1
         UCkbETPW5vb9IArBwPAjLUp+RidUJYSxaOoer4JmYRkRp6V6CGaarcx+bMvefgJr3rrZ
         MvFCq/aWX/y2Z9Wg8VXUhmk8XDvF08ktA5ls1tnA1fYtN0phMAg7bZQWzxQSb25NfQHM
         vysRRUSqQursOBK93u2QIEikjPvMD9pNCNAgkOVw9TNnVOv61iugNY8c+hEaxgMa6TIu
         Nj0g==
X-Forwarded-Encrypted: i=1; AJvYcCWkpboXFUbEk4Hnn7hWOGxeN4VMpRSBP0LgeSoi6Dtj3PgsEbQpqs9KKrifUKa92JI3LPHYdwfSi8jNRUQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwIQJaAU7wH8/CQtao0geiDlnH8AH2Ig4q7vPiX8fXvpJIwbcjg
	wgwIEkCWB4pq8dVix/PT8Qcjk3/D09BrcKlkEwE9uQcaxbxRvS2+gbRLwRlJH8k91cg=
X-Gm-Gg: AY/fxX6iVjK6/BnLlrwjtMrwlSl/S0MbPdvmpCTh9Jzl4yDR5O0c9ZWir7SYtIKpa6l
	OGav/OtcvpBkHG/MNLBbuFb6Gb63aRY35sy6T5YEedf0uBSs7xDapnBBNNtbSs1jGSTPKEI6EDr
	BBhJHEkBqEjyLTXhokSjrBeTZ3TqbBpBvDCfQXMkvvP2pv2InonGiRjJF3RnwTjqI3snoCU2NfS
	J5iC7aOUUkYkP/zI0uwJCaeTDaxzP8e/aMbDCMDCwb9djx8M+bQjnmUrbA1fHCuEzkQQdIvB0Le
	LdKsLVRlFl9s6PlnY40lA+mawxbpzaqYLSMYD05Buve0X5PVA6pfxIEZLc0/ZtZoL2rxJq1ZNYX
	A04mROZC+4yaEMbLUiVxfEYSxjOSMfZ+/UKu8YldGWk/poEZdcz8IqNdy5jQCPd1hBGKabMd5S6
	QTk1JBQaYYpSHduG5XUdEIqs+97rDZA8Uz/3laklbVxnHvAuGLlpHaIfd7V2ueaY7WbnsmhajEV
	tZhuw==
X-Google-Smtp-Source: AGHT+IECCLtz04Q1g6y58MlK+cu2G+IQ+shlJTLlvJFkV+wtTDGmcQVfka7R8tosUNuc3dGp+UEbDg==
X-Received: by 2002:a05:620a:4804:b0:8b2:7536:bd2c with SMTP id af79cd13be357-8c3894188a8mr2759937485a.78.1768261987580;
        Mon, 12 Jan 2026 15:53:07 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f530907sm1597443885a.39.2026.01.12.15.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 15:53:07 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfRic-00000003fUQ-2VnR;
	Mon, 12 Jan 2026 19:53:06 -0400
Date: Mon, 12 Jan 2026 19:53:06 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zi Yan <ziy@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>, Balbir Singh <balbirs@nvidia.com>,
	Francois Dugast <francois.dugast@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alistair Popple <apopple@nvidia.com>, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-pci@vger.kernel.org, linux-mm@kvack.org,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <20260112235306.GN745888@ziepe.ca>
References: <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
 <20260112165001.GG745888@ziepe.ca>
 <86D91C8B-C3EA-4836-8DC2-829499477618@nvidia.com>
 <20260112182500.GI745888@ziepe.ca>
 <6AFCEB51-8EE1-4AC9-8F39-FCA561BE8CB5@nvidia.com>
 <20260112192816.GL745888@ziepe.ca>
 <8DB7DC41-FDBD-4739-AABC-D363A1572ADD@nvidia.com>
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
In-Reply-To: <8DB7DC41-FDBD-4739-AABC-D363A1572ADD@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 12, 2026 at 06:34:06PM -0500, Zi Yan wrote:
> page[1].flags.f &= ~PAGE_FLAGS_SECOND. It clears folio->order.
> 
> free_tail_page_prepare() clears ->mapping, which is TAIL_MAPPING, and
> compound_head at the end.
> 
> page->flags.f &= ~PAGE_FLAGS_CHECK_AT_PREP. It clears PG_head for compound
> pages.
> 
> These three parts undo prep_compound_page().

Well, mm doesn't clear all things on alloc..

> In current nouveau code, ->free_folios is used holding the freed folio.
> In nouveau_dmem_page_alloc_locked(), the freed folio is passed to
> zone_device_folio_init(). If the allocated folio order is different
> from the freed folio order, I do not know how you are going to keep
> track of the rest of the freed folio. Of course you can implement a
> buddy allocator there.

nouveau doesn't support high order folios.

A simple linked list is not really a suitable data structure to ever
support high order folios with.. If it were to use such a thing, and
did want to take a high order folio off the list, and reduce its
order, then it would have to put the remainder back on the list with a
revised order value. That's all, nothing hard.

Again if the driver needs to store information in the struct page to
manage its free list mechanism (ie linked pointers, order, whatever)
then it should be doing that directly.

When it takes the memory range off the free list it should call
zone_device_page_init() to make it ready to be used again. I think it
is a poor argument to say that zone_device_page_init() should rely on
values already in the struct page to work properly :\

The usable space within the struct page, and what values must be fixed
for correct system function, should exactly mirror what frozen pages
require. After free it is effectively now a frozen page owned by the
device driver.

I haven't seen any documentation on that, but I suspect Matthew and
David have some ideas..

If there is a reason for order, flags and mapping to be something
particular then it should flow from the definition of frozen pages,
and be documented, IMHO.

Jason

