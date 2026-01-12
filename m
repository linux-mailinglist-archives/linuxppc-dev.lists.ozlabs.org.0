Return-Path: <linuxppc-dev+bounces-15597-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86069D15D02
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 00:33:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqpb16G9yz2yFw;
	Tue, 13 Jan 2026 10:33:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768260781;
	cv=none; b=MtWUjMUmzrwzYdEtvtBk9iBAepNJjjR3be/Ts0YWuHPZ0oiw4OyLPo6Njvr4IiduEMFAPEg2/fWQuz6GkDQWAPuzLSSUVpKG5r1OvQUSHxRAKckn/oukQXOSWzyCFa6yYKzUPxYAHOkaFFSRSNFfEuJYqbjc8HEBpW2tkY0XuDYjfKAlB9zAzrAP7W0xfWKuZOIfQF65JAzVYKOp9oiq0ZovRYykw5378ilPc3r060Gtnb5uNrO0MMWq59g3N9kZ6xCHibRY5Qr8aus3nDgfb19SwVhbfUYt3NVXYCVtr5kRJjsFecsY0v6w/qplBQMFhM+i/r29++SP3Kl0evJw6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768260781; c=relaxed/relaxed;
	bh=pIO8dQifpp5qZTd7WcwNdFqrDRKIKFleYoHUkXQdAb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VN+6Y3Q9+8zxFryYjN/YIrhZVvPrmQEl/5yLLi8UuVGMYIFs7eK5XfsUhps5uvcYVfuAJAuAgF4lojuEKEpTZRGX353f+G9ZThlDjAnz8BEeA+O7NE2Ygi9qtDBghXKErgwUdRD7TlaKFVhq7dOEPa4QMvWjzurSSHtnIOnWE52gr75PQjOviCVjb6rfD4OsTLLF01szYxnjRvB3GL7ly3kHlbvpLCIdWlJpgd9kqQ8dJB9G5HKG/2N2CmF/92070k01STxOdbUOpU+igH5vOzebfvu4SAS2RLZXMDWV/IoGSyqvFo66NcDHe4zFq3chK6K1tiQQ9GZNRBpG1vUxYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=igaWZm5P; dkim-atps=neutral; spf=pass (client-ip=209.85.222.179; helo=mail-qk1-f179.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=igaWZm5P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=209.85.222.179; helo=mail-qk1-f179.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqpb03M9Nz2yFj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 10:32:59 +1100 (AEDT)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8b23b6d9f11so747203085a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 15:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768260717; x=1768865517; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pIO8dQifpp5qZTd7WcwNdFqrDRKIKFleYoHUkXQdAb0=;
        b=igaWZm5PjyJX6kGGHYLNwEWTkQ72UWxACzBGkqVLA7XK7WrRGM4rBrW3jPqhiApBVe
         IDEu8nXPS6xs2bbMfjKXcOUBTnVufX5szRB+83TzQIbq0AZQEiHls4+CKh9vqkVFN7l6
         XkBxi4W5Qt68Pf+aMDFsifZswm+NLea8BDyM44k1cmwKxcM2+F3nfKgBS/C07SP/grHz
         qFwo7KRmodjE5KvP+F2aArMHgVDW2yA1YxtNaPHRjp5LchHAJrFl42QJULbzO8AaUYvn
         HbmGoqdr2GaHu70ge2ZJGuBoraiEZPooMDp87newPOazrkMgFXmVIe3JMvmYMtWCg0YV
         OHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768260717; x=1768865517;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pIO8dQifpp5qZTd7WcwNdFqrDRKIKFleYoHUkXQdAb0=;
        b=vkb7zy/8DmGM/VXRgJVYEIsqg7T9HjAcpaRpY21mBbunx3QxeZ/kzUJJfoBlPDtAGl
         sk7iZn+bIoqIXsXFVo5ZpxnOHiKotzuIhmVPi/qKU4ZOJskXW9ACz+WG5Kkf/fPCNdme
         jyQlmKBG/f4811Qq5Xr2F2hUvWQGLeiAP6MurJkWiVtB0qD3shhym8jGyCf17pEGBotP
         BwmXf/OTXAAdH9pzz77XKmCgHcAz9i/mgI5VzVM9uDGTjmDLNAcQ7mWTIMZ2S8dygIXU
         7M4HK+BbIgkRAZYM7m716xG5fbR4aUKKkL1ltWc+gqz3O/K2fJMI1ujSE/Z/k/jnTI9N
         5Sqg==
X-Forwarded-Encrypted: i=1; AJvYcCVaSEdROYov86NAmrNS7TpT2vUPkkpVna/kCkz2Jlzh3zl9UkOwzfbozPrIe4Zbd5xEm+bwRsiUMrzZSMo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzwITBdRHUTqyNjedqZKS9Hk7wcQoATwAzx4MrZcoi3QSTcoPWL
	6gdC693uc3KpHKzsKuyXplF8VId3Ms/GdXNVfcgVZVIRb8Lroalo+nUQ9y2genWlmaQ=
X-Gm-Gg: AY/fxX4x+emgwF/1VenSCokJv9yQLiyl0qMVnCodM/SzO0V5qfgklxj9fhPA7v/MJvZ
	P1lTi2mf3P/7fB+DXp+gHP0e+YBd13G3wSWwdpKUr11JPI638yNjnwA1S24T6UQr412pyQbhSku
	bpGkm4sdECOxAs8QnXFULcjYCr49v0etDaQ4l3Jjpntv44GQn/XUCO3oY6/I+z6mC3K6pbVuThZ
	VMxeys+YhRDLRhhvjBRSr9hAKZeVSVrY2cBpzkiJy/ODKCJC+xPy+aDzhI2CDGj0g9INS9r5Y1Q
	fk0GOZw77JaVnhEJAfPUnCxMF0EvRvW7c7zd+4Cb6e+Std/gVVn8T5KXsS35ryk9s+zCi2LyDMt
	hJ9BVI1TL5kMcLeLVqfWSPxXA01xoku/qoF6QGStyhwXCQLDH5lTKs0/MMTomEhnXJ+BtuYjGii
	lSrGXEMxzuUdW2KLBCTILOqo3P9LJFAgeQe2C5MctYsSxpGNjN47D3pzUaMz8QRCRm7N8=
X-Google-Smtp-Source: AGHT+IHEv3oyWJcb06Rw4VjhDeFEk4R9SXi3D7aPoLG3khcVAljGyaq9fJ2LebD88CvTcTHK3Zmx+A==
X-Received: by 2002:a05:620a:3952:b0:89e:99b3:2eaa with SMTP id af79cd13be357-8c389375870mr2741069685a.8.1768260716611;
        Mon, 12 Jan 2026 15:31:56 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51bf8csm1591462585a.28.2026.01.12.15.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 15:31:55 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfRO6-00000003evB-2tne;
	Mon, 12 Jan 2026 19:31:54 -0400
Date: Mon, 12 Jan 2026 19:31:54 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Balbir Singh <balbirs@nvidia.com>,
	Francois Dugast <francois.dugast@intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
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
Message-ID: <20260112233154.GM745888@ziepe.ca>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <aWVsUu1RBKgn0VFH@lstrano-desk.jf.intel.com>
 <45A4E73B-F6C2-44B7-8C81-13E24ED12127@nvidia.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45A4E73B-F6C2-44B7-8C81-13E24ED12127@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 12, 2026 at 06:15:26PM -0500, Zi Yan wrote:
> > We could move the call to free_zone_device_folio_prepare() [1] into the
> > driver-side implementation of ->folio_free() and drop the order argument
> > here. Zi didn’t particularly like that; he preferred calling
> > free_zone_device_folio_prepare() [2] before invoking ->folio_free(),
> > which is why this patch exists.
> 
> On a second thought, if calling free_zone_device_folio_prepare() in
> ->folio_free() works, feel free to do so.

I don't think there is anything "prepare" about
free_zone_device_folio_prepare() it effectively zeros the struct page
memory - ie undoes some amount of zone_device_page_init() and AFAIK
there are only two reasons to do this:

 1) It helps catch bugs where things are UAF'ing the folio, now they
    read back zeros (it also creates bugs where zero might be OK, so
    you might be better to poison it under a debug flag)

 2) It avoids the allocate side having to zero the page memory - and
    perhaps the allocate side is not doing a good job of this right now
    but I think you should state a position why it makes more sense for
    the free side to do this instead of the allocate side.

    IOW why should it be mandatory to call
    free_zone_device_folio_prepare() prior to zone_device_page_init()
    ?

Certainly if the only reason you are passing the order is because the
core code zero'd the order too early, that doesn't make alot of sense.

I think calling the deinit function paired with
zone_device_page_init() within the driver does make alot of sense and
I see no issue with that. But please name it more sensibly and
describe concretely why it should be split up like this.

Because what I see is you write to all the folios on free and then
write to them all again on allocation - which is 2x the cost that is
probably really needed...

Jason

