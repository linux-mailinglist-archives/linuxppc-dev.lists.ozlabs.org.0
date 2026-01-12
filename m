Return-Path: <linuxppc-dev+bounces-15589-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49054D15033
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:29:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj9t638mz2xSZ;
	Tue, 13 Jan 2026 06:29:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768246162;
	cv=none; b=ZW+05gcPpdKU4xLpXg5CAsfmqpSp27V7+9k8G5L3guECdJEK+sIEhPUMRcSCkI2P6CZwhpdcV4edhF5fSrKbZ17zmQ9Beb38DZiqNnAMzySHpL4NiOJ3RXssqEHovHzCYIVm9hzKKeQkGYRowN8XeAkv9jOcbkuGql3XeYniVa7w6yqWwR0Azn5s3yDR/kOSNxJEkuQ5U2+4yIA4bREGDK+kxFGzZX8fLNk9X0YErO6aI9bQ5uKM+p4rJvJX4mlobDTIjcl4PYaKry1XCs9N6Ns57oye1jDYY1KNVu6LaWUYXZ3HHwwBU9JrtWkGVOuK5CBxzRX91U0dhLRhqc9Npw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768246162; c=relaxed/relaxed;
	bh=a9AdLI7uJUYtOYd89GixDifcE7N5970uW2swaB6ncSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSsF2qFk133GD2d6GuzMDFT3GxtiIDyQANgOjVjc6TqN9VBj3lxEar9P4MHfwMgUvADa2F9CjQXJdyjoArvp5ELTVdXhW4Z+DrXJvcvduRcliEyYLFftNwj7J3jVPEqEoMUb7N0VFaFVo3MuuusjQr1VRrAu+NDb+p7pGTfz0Q/Myj0nUZeQiJC4jDaZFTS6UKx884xAEGPqgwS08GWJFL1XAt76lMf/vvZLq9QXSbZj9sezHQsJFWd5qaTcRlTAH3EhYX86QAOOH424PptDAoTfnZckmQoPJwCfvmKqISfab2H0IXcD0eTxI9nvVjHA/OkGwZboK+Vs6J8lgjIqBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=eqBvhEN4; dkim-atps=neutral; spf=pass (client-ip=209.85.222.182; helo=mail-qk1-f182.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=eqBvhEN4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=209.85.222.182; helo=mail-qk1-f182.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj9s3v5nz2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:29:20 +1100 (AEDT)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b2f0f9e4cbso457310485a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 11:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1768246098; x=1768850898; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a9AdLI7uJUYtOYd89GixDifcE7N5970uW2swaB6ncSw=;
        b=eqBvhEN40G19RExnaBJdZE64ehgI0jqoTpWe92BihELdBYtDa9OpeHmN0ECYYKFA1R
         K080qKn+QLSlaEMN8CshapYqKkJ2ZE0RCwX6zqq14tdvOzsj8w7f3ngdtIlJl71Adn2c
         dbG4G9skZSel8d5UttKT7U8dMGKuhyN1fWEjyu94GZyYe2Bnr3TV2tVkZZqaywoRYngS
         rXrFjmOEAfrdLj3IciV343UH8+oSTIq2zYiNj7U3rr8M7It839uXhdPbcKFiy/K/WGsv
         Z5mIsV9zNfEr0Q69/SROSpfGHs5kESIOoAIRlI1cl12odaG0SpnmLNi5yLCpeLg+ST56
         Kv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768246098; x=1768850898;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9AdLI7uJUYtOYd89GixDifcE7N5970uW2swaB6ncSw=;
        b=M9dibZAn/8WhzQC7RWTjOZfbJMzVf9v05Uw+onvAtsbhp+ih58hd8PtMBQqQLItdUe
         p4/Jc3eSUD3UBDMYNimv8BmjZ5cxvXGBVN55rmwKAtcibpAxtimtKabxk49XNp/DmTFC
         ksWKYskoSNjmZ5d46qPFfkd+AryCRgRH4TofQyICopX3aMF+zaNd3TJ4licctQ6X5gXy
         R1qDvH/B3dNj5M0agesLEWeM+4xzH+TP5XIVbmPL3lIWRPUeMqZ/7puSRYgIvCZhhlAP
         20UqZVsdIlqyaXCw8P2Ncuj14onVMWRdT9haep+BjdR7A1H9W66+/WcNfiPCJ6TWTzFr
         63GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEtP0R2BPBmmDFMq69+s2Op2fdSnRxf6jL51MN2g0repk8kbVUphy0mUlAANv41g3WZETW3Xl3qnHu71s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzvw4tjqkwR/Mi+O0M7DslPesgxfwy0BSUdVyDQ7FOSM0c4nrby
	UKrOPgSxG31zkIJUBUnIBZ6c1lW0RN4Gp8FTovx1hGAbz/frro+++x1yxTcBtoUpxiA=
X-Gm-Gg: AY/fxX7wcjCm00Z2bC9OuVDGeb4CL9MrWVbDdCcqOPIuv0xr0EBAki/xhy5wi9MN6Y7
	I0UEhzZo89nSqqNsDCILbloevZpODgHtRM8rAN4OcfFDsQbUOdaK8vIMJ8OrABnSq73h/OPkL5V
	YoyWsYTjy6My/xVOyeWDFHXakjKT/WBBYK6e5GssNEudwsuvFVvSRspalnL1ibPV34YgU7F+21N
	+fYK+KUXu22LxGjsei+rkn0JUREms0rImL+MrP9yBXMNlpMAH16vpgz0z23KQ4PfIaoGOuz4rWZ
	SV+/TXiyUfMa/XaCDzNkDUtudr8xbjy56Wu8yd/2X8RJea70NdSdyVbgv9KEzE+zaptXO7hfT1r
	7Fe8lA/+gnJdG5DTnnupwXlpVPRCVW/kpEKNmJLJO334hETsXtW9FUZZ3hZ3vMMd+c47PmJXAmy
	/1e0xtU6ChYVb2YLgD/L5Do1UoBI96WoF8u/KjELrRmUJxT7v0LfFxwxLQF7eq23CeDLQ=
X-Received: by 2002:a05:620a:1726:b0:8b8:7f8d:c33b with SMTP id af79cd13be357-8c5208f18e3mr71372585a.43.1768246097807;
        Mon, 12 Jan 2026 11:28:17 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f4cd7a3sm1609425185a.24.2026.01.12.11.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 11:28:16 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vfNaK-00000003cxB-192v;
	Mon, 12 Jan 2026 15:28:16 -0400
Date: Mon, 12 Jan 2026 15:28:16 -0400
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
Message-ID: <20260112192816.GL745888@ziepe.ca>
References: <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <218D42B0-3E08-4ABC-9FB4-1203BB31E547@nvidia.com>
 <20260112165001.GG745888@ziepe.ca>
 <86D91C8B-C3EA-4836-8DC2-829499477618@nvidia.com>
 <20260112182500.GI745888@ziepe.ca>
 <6AFCEB51-8EE1-4AC9-8F39-FCA561BE8CB5@nvidia.com>
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
In-Reply-To: <6AFCEB51-8EE1-4AC9-8F39-FCA561BE8CB5@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 12, 2026 at 01:55:18PM -0500, Zi Yan wrote:
> > That's different, I am talking about reaching 0 because it has been
> > freed, meaning there are no external pointers to it.
> >
> > Further, when a page is frozen page_ref_freeze() takes in the number
> > of references the caller has ownership over and it doesn't succeed if
> > there are stray references elsewhere.
> >
> > This is very important because the entire operating model of split
> > only works if it has exclusive locks over all the valid pointers into
> > that page.
> >
> > Spurious refcount failures concurrent with split cannot be allowed.
> >
> > I don't see how pointing at __folio_freeze_and_split_unmapped() can
> > justify this series.
> >
> 
> But from anyone looking at the folio state, refcount == 0, compound_head
> is set, they cannot tell the difference.

This isn't reliable, nothing correct can be doing it :\

> If what you said is true, why is free_pages_prepare() needed? No one
> should touch these free pages. Why bother resetting these states.

? that function does alot of stuff, thinks like uncharging the cgroup
should obviously happen at free time.

What part of it are you looking at?

> > You can't refcount a folio out of nothing. It has to come from a
> > memory location that already is holding a refcount, and then you can
> > incr it.
> 
> Right. There is also no guarantee that all code is correct and follows
> this.

Let's concretely point at things that have a problem please.

> My point here is that calling prep_compound_page() on a compound page
> does not follow core MM’s conventions.

Maybe, but that doesn't mean it isn't the right solution..

Jason

