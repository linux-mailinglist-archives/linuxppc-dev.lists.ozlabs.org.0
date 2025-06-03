Return-Path: <linuxppc-dev+bounces-9097-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BE8ACC7EC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 15:35:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBWt93zVmz2yNG;
	Tue,  3 Jun 2025 23:35:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748957713;
	cv=none; b=f5VwcMRqbPv4oKWdRTqXg+AT6CxZbbxrYZVxunMrdwr70e590RdZHviy+oDylm9GfZEVmdoASoK0lrjOZRlwtwAOxvBVsVBDF8uZlyilc2AxfJfWki/7G7fQFHR72otMQLr1+Qpug466pBBujZGJ+jv/2rq4zzf5M85MB6OPbUvWcLtWyAt+8CnJZdJiAZiu8a+/5GZyQvWrYaSRl3V9CASd7wMBL4jQOnoqM7KKmeBuMBlhgljguWOA3y++DhP9sS4iCLhxJHpVxw/GAt9lWjob5bFm/QY0hDMe1c234aBHoqWL/r5Q1ApQxHv5r6JP36Isoai3ctR09B/0UyDyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748957713; c=relaxed/relaxed;
	bh=csMjX6EgdDvsoUroDDkC2t6M2H8xOJU7irccfVA/OHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8a86E1XdqKIaZS0EmlhpaJouQ+Gy++EQvkM/j4PPpPgP1WGELop4UU2eDvnR/WPjkWYkGuvd81R2DKMhyFBKWiEJFL68rhxD6B2UPZ9i2x3nuKt3reE25/9S1O46kaEZTsTD8g+2A4LimyTM6G4Bjr3jVZGXtL05G3d9/1G51wO+VYQHHo/BkX6s6SEZzW3Yo9EZIF4dgWn0oteDS97cMNKfIHfBr25/5Stz4MHfmtIgPTaHVVrbw4T4/NzkWvbs5PCa9kdHmWLNxVnwHZL28IEuTc6/VMUTlEvMpQbaQXRiRUl1qA9CnXrI8lD8EWFfmnUKAVgrcL3/5PAMABaNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NLROuPsX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NLROuPsX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBWt85k6Jz2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 23:35:12 +1000 (AEST)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6fac7b6fd32so29254336d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Jun 2025 06:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957710; x=1749562510; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=csMjX6EgdDvsoUroDDkC2t6M2H8xOJU7irccfVA/OHY=;
        b=NLROuPsX5z6ocWPKeprIzdH45ft9q0sQ2oIbFmVWxLnjKs1I1xQZYwQl0nErS70wcr
         af7ZuUVbBXqeyOXWMiK92Hm+4SMzhujBWg5h/YnlnamzGN+A9Hlm3ATIJ7jG5Ip+xgFR
         QqyB5y2LYolv9adoeXCcqfzM7MeHbnaYFogNaP651QvfItA1qu/YN5DZKfb7GB+4MJth
         zzOH/x0Gg9ekoWdretpariRjxisXoUmmoC4Q1p3I0/p2nZhHbnM6i8bXyBTjmkSGueK/
         KZ8irnd1YEv0pYSl9Vv2F991qM+nNuJ5Y+Kz5hWZ7t79hB7LTwt1PkbIir00U6vH0pfl
         OKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957710; x=1749562510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csMjX6EgdDvsoUroDDkC2t6M2H8xOJU7irccfVA/OHY=;
        b=qQulZlsdgndEBweOUub7tMIHP88yj3gUc219RvZ4rFLTpWVm02hnY88kKBFQnlBGey
         kUPGaYMujQkn/7F/VZa6b6uQ1jfK9G3pw3sDgIEAwjIC5oA77b/fDT5BpHep2EBSa4Nw
         Q1aG0zb0jbVCSRlFjdRdY1JeUOHxXtHvdIPxtuZx2VOvSELzc8g2v1/ntxXK92u4BU9l
         EhdKtFu1lRMx9hCBwueDYv1ePzR2UqQMf45xXJE7vN3Hc2tDwPfInsT4r4nbnGh5S5cH
         9WxRUDnWMzdq+wrOYZeTZbke8H+7c8OJn+8qqKniv+2fXuqsayMtQDPF7D/C9THScM4e
         8Pcw==
X-Forwarded-Encrypted: i=1; AJvYcCUy4JK1MXsMwCuQ7+bjYF1IBbL72hmB8dAfCeOdUq7zZ8ENlmnsUI82JgL5HcgJR4ut//C2PTRLgfJiNKw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwTwAB3I1JY+xQ/dOI00ejGdcIVAW6KA+uJ7VnPzWRym4jPnBAT
	K7d2ccv4+an2aBE3E0CmfMZMhRmXIqf/zCe6QijdIrWANQkDUCyH2xzflnf3Zm+/l8A=
X-Gm-Gg: ASbGnctqsJ5Va/yK80+iKR8BoM83YFlyfiwC2CwOaJAQ8mcHmJfZUCGiF4LtQabl10b
	zacYBSX6vsGVGKT7pSK8UIabhgSim6CczMliChzvGATv2umXv04AmdupkaCj0GTF5/pkch2K45O
	VfY3p9uBJiSdQL81rbW6lvfJRnBZgBf8GHMPdUcfDHRrPeMQPcaz+RR7b3w56KUIHFCxbKVGnog
	SoMaBBeHpNsBdRKq0PPvwe4SNAk8Ey7Jj2TBTA/U4XLBdvOE5C6tkxHHB/WEeNr+QBCoqyeHUT1
	zRNigKlGW9adLnjYDGQMpUMPVK2SF406GQTMC0fa793U7hfNePLp+/WcrLoT4fb0DCpBlH9YkjY
	P3cF4UFoop8UEksqjw6qpMvHPdX3YDZdMCsobbQ==
X-Google-Smtp-Source: AGHT+IGTO1Uq6qWKkHjHjzXPtbeutCQLStskBTpgABiXf8IiWIF7+BRGzTPM/WsKdaJBbv1DscVTNw==
X-Received: by 2002:a05:6214:d87:b0:6eb:1e80:19fa with SMTP id 6a1803df08f44-6fad9090760mr153489766d6.1.1748957710547;
        Tue, 03 Jun 2025 06:35:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e2fc45sm80639296d6.122.2025.06.03.06.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:35:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRnJ-00000001h4R-2OPU;
	Tue, 03 Jun 2025 10:35:09 -0300
Date: Tue, 3 Jun 2025 10:35:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 02/12] mm: Convert pXd_devmap checks to vma_is_dax
Message-ID: <20250603133509.GC386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <224f0265027a9578534586fa1f6ed80270aa24d5.1748500293.git-series.apopple@nvidia.com>
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
In-Reply-To: <224f0265027a9578534586fa1f6ed80270aa24d5.1748500293.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 04:32:03PM +1000, Alistair Popple wrote:
> Currently dax is the only user of pmd and pud mapped ZONE_DEVICE
> pages. Therefore page walkers that want to exclude DAX pages can check
> pmd_devmap or pud_devmap. However soon dax will no longer set PFN_DEV,
> meaning dax pages are mapped as normal pages.
> 
> Ensure page walkers that currently use pXd_devmap to skip DAX pages
> continue to do so by adding explicit checks of the VMA instead.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  fs/userfaultfd.c | 2 +-
>  mm/hmm.c         | 2 +-
>  mm/userfaultfd.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

