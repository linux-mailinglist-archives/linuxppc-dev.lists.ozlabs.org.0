Return-Path: <linuxppc-dev+bounces-9102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FABACC83D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 15:48:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBX9H0F7cz2yPS;
	Tue,  3 Jun 2025 23:48:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::72a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748958498;
	cv=none; b=GkTwu1tw1MLvy1TLIN8ggrX9QqiEiL5G7Ig0dwDbOLQwvPusmzFqdtnD7byKaBTlkkE+sLgs6EW7IojVw8LNbddAKnYNiHxwdvlhDz9h6RjDZvbCqAL0bZMtQKnWRnoUAma0/p+qwEt5XYO6ABD4zte0wF0tjIAQSd2h3rwVXQPS+MIzIjfKDFxsMRZUtAyvEdWMCUL44Q0hlF1y2V2UgZQt0I78++2Wg7yKvMooYYIclWET/uy3gIbqJwWVMiZKgoXajZOD9tTmDcwdedo8uWWwWbrmJ7Ts+ASntxCHxGPnFRy+5BBPBYrapMWkn7WejFr0yuWiXG+0Ergv6g1bAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748958498; c=relaxed/relaxed;
	bh=0ag2KSfmpizoceiuoj+cZXZUUA1usyi82jYygfJs/Bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWfsIcC3mSoHinPTMUeEC4RmU3SQ+Lnc3p4OZvwuOlgptwgJozpyoh4q8A6x3812WNz673SPjSCFrlQhL26hetNDLTf4ER7pCeoHE+zf40ba7LoPu+LyESDy78ZwUF2Wzc6V8SBzccysPfbqxJ1tFrXWsD3d/2btEx7vvIl3Sw9YmCQDzwBYi41V6Ban/aRU8yeyFNzUQMDvXmJQHG5adlaUdD6sHQNcnhD9mrKTCrbv4bzNDt8Ht6r9J3aDjVlAjuww9tkINyHI2DZbhEKctFb9N03tANVcI2Y7WeoezhGkV6Crw/dsd13elaxO5qgBHBou5xy/fulcnzfkwQOiGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=IxrCvwU0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=IxrCvwU0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBX9G27Hmz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 23:48:18 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7c59e7039eeso777946985a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Jun 2025 06:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958496; x=1749563296; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ag2KSfmpizoceiuoj+cZXZUUA1usyi82jYygfJs/Bg=;
        b=IxrCvwU0vJWePy52CN26n6decR7OsMYx8YzV9JFO/CiupNrDzd4pgL8qeH44Td6CXU
         F6F+CCxHVtsfle7eJfKwCjteDRkAtd9F4VRc9nuQ9cruXbco9cYObA88AWBwgsgNhvzP
         8FmC3Oa5sOl3GuJijpU+1QN5fRPbhK2KlOVTU0oUSIU+5pnXW/0gDeNLFIuv1Q/ZZQUA
         MI0opKJaZxDajMJ8gavizjVsU7b3z0OkEzSfEPDIKVlHGtk01A7JRroo5WsjCXY0W41S
         hhQBoD92VOcjiiUctMnte2lsXPXPUeWCFfycMYjlF4twG47U0Jh7ID5Z0dz7eQ2TF5Es
         VF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958496; x=1749563296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ag2KSfmpizoceiuoj+cZXZUUA1usyi82jYygfJs/Bg=;
        b=rvfEYxmkxzL62ZhEII4q79bAAY/DJSV4SQMmraA160ua59U8yYYZ/GSxTmYCvT0Eex
         sW1pdpvK7tCeeLdFk6ws9wsFmmsGbtJYZK/4YiEZBEbnAira3m05Tv07gEJf++78/f9o
         sYmd8aGVc1FRjVj27EX/S6/5AtGX9J0sUjA22hmpI/DexZYuzFVZNG9LZMtjjfgY/m2F
         Yivcu7K0/01Gi9Jojj/72IViUmxuIiLv2AVR+GnmFo94qTPNFP3on1y6PryYwC2k75jD
         +awr5f6/ZO/NP/025c06DVQvZ8joAcnypCPvrW1tH8PPcENLcM05h/YnfrHutSZXz4qO
         0xIA==
X-Forwarded-Encrypted: i=1; AJvYcCXsIjJUGxijc8Gye4e3Y6ZaaDsra0FxKCiim29coPMm9tg3e6dHS1Zz8c/DI+xLM0slEAtey5WwXSKd204=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxPl4NRyrlH2+JUr0OtJos2oaFGCUWc7/eDfniHHUsELW3j6r8s
	nO+HHRxdjlFlFB7wCp51KK6tEd/UuWYSEK2utNWLE5Aqa7/SeEYABFq3bhMOoR3ZCxg=
X-Gm-Gg: ASbGncsMiAlsnIqhBTkrXTxJmvJjK+20ZjCb/Z2m/CjGwQXBnF81jKmX01c52UGUpZ3
	fkPiqFgWIvOBHLffmFQnV/Ifp4O02Ur6wK/WfcJoaB3ucT22nejIox39khHqHJnXPYrjAjh8m2m
	6j8jHU5GgUka8ghb0risIEQhyphm73usggB710uZSckR3f3jQk75FYUWuIRRZ1sHfDlOvoAElOC
	y/rWYq27YFlKTadUQWxNWu1j3Bm9JT5MKnr8XxwHXNwxe49KmtwZ8WpemFJfCS44oAsbNZ2eXFg
	w+mPJ5K/wK+L+hCGVoO495wIMFpM+EMqNKVurpR+5MEVZIQFY6lsLjKjKgXHZgiDmRJvtYVeXRs
	Qqn9BC+mhpFPMfhyoY97iZ6R3QIs=
X-Google-Smtp-Source: AGHT+IEC7tetoyd4MWB27Cys7lEZRwLgg/tDNDKGL2nO8t1WlsQDGW4e4zhoToAJp9Wky9F+fr/2kQ==
X-Received: by 2002:a05:620a:290a:b0:7c5:544e:2ccf with SMTP id af79cd13be357-7d0a4e57644mr2655730585a.57.1748958495697;
        Tue, 03 Jun 2025 06:48:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0e3fa9sm838696585a.24.2025.06.03.06.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:48:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRzy-00000001hBT-2tOq;
	Tue, 03 Jun 2025 10:48:14 -0300
Date: Tue, 3 Jun 2025 10:48:14 -0300
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
Subject: Re: [PATCH 07/12] mm: Remove redundant pXd_devmap calls
Message-ID: <20250603134814.GH386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
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
In-Reply-To: <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 04:32:08PM +1000, Alistair Popple wrote:
> DAX was the only thing that created pmd_devmap and pud_devmap entries
> however it no longer does as DAX pages are now refcounted normally and
> pXd_trans_huge() returns true for those. Therefore checking both pXd_devmap
> and pXd_trans_huge() is redundant and the former can be removed without
> changing behaviour as it will always be false.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  fs/dax.c                   |  5 ++---
>  include/linux/huge_mm.h    | 10 ++++------
>  include/linux/pgtable.h    |  2 +-
>  mm/hmm.c                   |  4 ++--
>  mm/huge_memory.c           | 30 +++++++++---------------------
>  mm/mapping_dirty_helpers.c |  4 ++--
>  mm/memory.c                | 15 ++++++---------
>  mm/migrate_device.c        |  2 +-
>  mm/mprotect.c              |  2 +-
>  mm/mremap.c                |  5 ++---
>  mm/page_vma_mapped.c       |  5 ++---
>  mm/pagewalk.c              |  8 +++-----
>  mm/pgtable-generic.c       |  7 +++----
>  mm/userfaultfd.c           |  4 ++--
>  mm/vmscan.c                |  3 ---
>  15 files changed, 40 insertions(+), 66 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

