Return-Path: <linuxppc-dev+bounces-9096-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CE0ACC7E3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 15:34:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBWsV00X0z2yKq;
	Tue,  3 Jun 2025 23:34:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f33"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748957677;
	cv=none; b=e7sB2qrVXEkHY6tNtd00jIuZPV24+Mmljk8nIOQwuIYn72cM+S2GUs78a7+R/Bas0mUOE9u4ci6OBatF0SZPdUPkJi1sCQCWnBoN5PIy/CKQnPdU9yFfqpiokO7TzDQW6ZdYIPFmlu4lheFvX7OHOGpV9Yt8kzL631gG5S6aBbE2yK3YauvBSmlS5tid3Vtv1V8ulcBbfoqyBQyUMG/C1vQgg72msQFQ5Tj2Rz6833OJTmHMDXIl2WID8vykKI9JIETYBO/hfY1iKX6zOIdQnITawry/8NfpyhbUFtwK19D4RCwVq7ppDWn8HtoqYuxpU8sw/g2g+gqzp3NHExRc3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748957677; c=relaxed/relaxed;
	bh=o9eD6fBv50JvJ7Gx4KUjwD3EkSFG+lO7duRzw9dtFZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkhTf3PJ/vRAzWF2FWkeKzzAlsQ9HLC0XRdM4FfbrNAP4l/65MtQBurDVnBwkCLN+V62UPFgf3c1Oktci3I2EGmDiR518z25Je+g53nqYnJ3c/CX0oGEAgGMTL7Ojy9e+rcu2NML6HzJX6Iqpei+M63Ik5iAR1RgcYsrw1NS9QOer+NYnkgPfoRD2Xb6TVYtL4HqDGyOfm2052ch9oAKJxGMwwPElJEtoq6HcJR5VCCIiL9+uMWcPwQE4T+KNFm++2Lp6BhQiaO3SdFLvDfovoVqOwdVw4v9D+gz+zuWE9PVXvSg7rE1SetwVUe66ovGaXNNt6j4mFGoqQBqp+AcpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=MbuLD78B; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=MbuLD78B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBWsS46BHz2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 23:34:35 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6f0ad744811so41001256d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Jun 2025 06:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957672; x=1749562472; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o9eD6fBv50JvJ7Gx4KUjwD3EkSFG+lO7duRzw9dtFZs=;
        b=MbuLD78BPP88E9Oge701nD0+XOVh3vj0Hv5H28YDWeAR0341Ix8WcpwSzCm03yvW7l
         44gO91H7lRMuPery4yASLCQ1ONnLYJ/wVPb30EJt2o4sfcY9asfUHH3yvLFJWFB+TUNP
         +HsfrUKcjZfChMx2JpmsdrcKC2VuamqZWkjADTQ7S6mphU9HwIOpmwz7edchbqCIqqiV
         0DsHV9rLLCRI73qq3ZcTurnrGjFeKQTicg24141Abh5RCdpMYS0a0dqEkLqUq4x75Os2
         1cMbT36tj5YOrOEwHR5iMpzFRiccmtH1zJgjl5UbRyeGjeg8+NmeaQFDqMZ8QIKrCCkt
         k43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957672; x=1749562472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9eD6fBv50JvJ7Gx4KUjwD3EkSFG+lO7duRzw9dtFZs=;
        b=Aq8avbZQMqRG3I+X6vgn4mADaI+iyWGjbrU/03rmdH+Lnjcrl32PaVveRXZMnWglax
         7YRFhMiuX9v6ot5xOALcSU4U8YSg7KVa4OOW0pIDHO7nitvQTq8Gwf4ut/+V6MKDXtjY
         MRvpMzk63GJ4mnOWymc8f6+0sNIddWihyouIgqUsO4gzDqAJkLQXZT60YSi7BawfP5tb
         mTdVq4+KThFdGlPpgtJg8vc+LXCMyThqjQNO9JUfcBzH8T10kourn+mWmDBFH4ZdkETZ
         yzWQGP/faZSAe/hJawQzmZQBNFONb5KbcyE5Bhp+IOzttIUXaz1D6QS6fTePYk3rMQBX
         0D4g==
X-Forwarded-Encrypted: i=1; AJvYcCUYmOveJDx70bIMon0TTsvy4+xuZsrUFEk0r4IFyUDM6ETMbuHvpv2nrs79z/Ln8RtO7faWsMRqYu/2lqE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz/KbFNwB5dc6PrLFQrmF0xzmHrCp21n2cHB6zzvIEFwGJ8ISLK
	7Zus4zxBHED7flrAn4E7r5WIW4bF1wIDhuTVgFLCYQiLQEeUvISYiuu/DzYOpMOt/cU=
X-Gm-Gg: ASbGncsinvBFfGL/lVtY5xPiTcunun+oObFR6Zeo9ok3rZx78Uf1LKNAR6Z/CP4AJw3
	tumMPSiYdkDtiD8fG3orcYy0fsuGfwLHoWX7BMD8t7faokhR8ClSAzxdbBTBzqzncbYnQCNscL2
	iOnvkUQVxM3g4jtOyB+HBamFXMPsHRjlQYbGyhuSZmpNZncH689MozzYEJbS0PINJ73Sr5IwyHR
	NFik1AnTTUqZtol0TRVvDGXwo2Og2ErupnaU7qIAb5vslVz97UwiaIg/DDodg/5fTE8/WUrjBFL
	SYVmXDjTWVpGLolvZI0tKcjTLAggn2E9OcwAhEWezbHORa61uRD30qZnf/pDzF7XXXwIDFXDt07
	Hq8P4CrRN+kilJnkR6wYhEGYeDOQ=
X-Google-Smtp-Source: AGHT+IH3/hKllTZ0eEK/dcuWTgO5QsHZ5LZ3JNRLIXTEioRhdRSPfL4GWfnU3eDieGqXq6aFnuzp+A==
X-Received: by 2002:a05:6214:5096:b0:6ed:1651:e8c1 with SMTP id 6a1803df08f44-6fad90aa622mr189063246d6.13.1748957671754;
        Tue, 03 Jun 2025 06:34:31 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e00b78sm80064216d6.75.2025.06.03.06.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:34:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRmg-00000001h3q-2scY;
	Tue, 03 Jun 2025 10:34:30 -0300
Date: Tue, 3 Jun 2025 10:34:30 -0300
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
Subject: Re: [PATCH 01/12] mm: Remove PFN_MAP, PFN_SG_CHAIN and PFN_SG_LAST
Message-ID: <20250603133430.GB386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
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
In-Reply-To: <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 04:32:02PM +1000, Alistair Popple wrote:
> The PFN_MAP flag is no longer used for anything, so remove it. The
> PFN_SG_CHAIN and PFN_SG_LAST flags never appear to have been used so
> also remove them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/pfn_t.h             | 31 +++----------------------------
>  mm/memory.c                       |  2 --
>  tools/testing/nvdimm/test/iomap.c |  4 ----
>  3 files changed, 3 insertions(+), 34 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

