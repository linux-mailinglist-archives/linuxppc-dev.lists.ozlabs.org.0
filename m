Return-Path: <linuxppc-dev+bounces-9105-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EEBACC85C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 15:50:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBXCf3t1Dz2yhX;
	Tue,  3 Jun 2025 23:50:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::834"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748958622;
	cv=none; b=jQmZAuZ/umJ7zvMc7GaHAlQkfTvdCYGPn+65LibQMr/+x8C/Q83/UsDBT/VQcl4lgYHwYcHIxEt6cU1/dURiHpBiI3JFZ/unzlCZq2o9iuMBrFjhwRXFVj+aaIN1E9jDvTGIVg96pThAmH7vl5DeZD3bMnys0XBYQ4Zzh+pC6Vxq4K/yZzR3JllHfofKrG71uiNV4OjhOqN1omulEUbOBrb+mYfwdkEar2+dQnYYSWW+0Mhk8C9bvXL0R8qDk/u8VRPkqlhTZ5uQmVjwJeLSf1DfcgP9vu8IdAiCuKPKWeRMC0la+GdERUHwCH/pGyyiLNzcr7r4JnT8NYe05/vWgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748958622; c=relaxed/relaxed;
	bh=YkymsPnXdQBda6JrJEhL1GWpprQuWSyxObGqKIJXWus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWxFRFCnoHV6kenOvdjXPmVD3QL4PjDHwIWHetQ0G8OBRRuG5F9vAWFFAErJA0Swy3ZwT5c2+pqXVXSB4aFaAvsFB/LP4w2eftCDk7EAf9unS0d1a+lPWguUGrz+acg9mNEY96q+6Z0+IJrdfOkCkL28OGF+wgRPIdr7PPNJmNwj9Fo7vSfUdtRqUUBu4B2SbI1UWt8q8oq5Kh/dMm32JiELdQxTXivLBK0LxHcwQEYOTUJnvhnQaGBJXTzfpxwsJddILvJnGJzm+6ofVQqls4Tlkq8hqbrwS5TUv8XcpMnqRWnLWuzK/6ao5UsMpQa8yr6YP9OLfHeu4kOnhszbrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=o9tD2Ut3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=o9tD2Ut3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBXCd4hx6z2yRD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 23:50:21 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4a43e277198so40308311cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Jun 2025 06:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958619; x=1749563419; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YkymsPnXdQBda6JrJEhL1GWpprQuWSyxObGqKIJXWus=;
        b=o9tD2Ut3LjYQZa8SmJ9GDZosmuuotn9Gb7L3WrFz04f8nZB1JCokWqMWxiDu+Q4E7V
         KvnXY5rE+diMU1DUaFj8svAdJmSsaUm6axtwFFEtd+D24fqIc0skyA6j0JI7TYd5dsOe
         d/lo08omrOJFT0YjGBtewUyAQcZrPs9oCgdyq4y8V5BIBIW8AKlAh03axzQQ77+qkGki
         pXomthVNRkBtdXxIKTD/AHxGYmuV7cxpu/LU3hUzIQK4e6CMZms8Z8Ge1dPSVs4r3bkY
         j1pz2uT7XpBMbdL0d9ngIsFXx4MbZSfw6RQJQWlLG9Q1UXEkwz9rN20l0IvvarkMs3bJ
         8/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958619; x=1749563419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YkymsPnXdQBda6JrJEhL1GWpprQuWSyxObGqKIJXWus=;
        b=YfvOizW+Fye2DMSFiKtElHOGPRRIZ6k7lj0AJ0ddg6Nn8jUsoYbCH5ZtNF+XZzZsk6
         krH7RUpq1EbhzE+sSPt6jNkZIwL14f3qQjmnFnWnCIBQ/ou6PIWlfi/vlLCdTxVnHI1e
         2TQ5D9fXySZ1tdsz8iaieXbsMQWXysEYurF5DBV/yxby70RWHDT2dFi4sBEG+mX3wkq4
         NGkup1J8hVJITZ/xgtjuz+pGZREKIQO+mEQCcYQbGvOM5fOqB41+uUC2pmC5sWXiNhfw
         gd8RoQW1jQV5LSPHw0qnxT0V8AK89GYagRrKokfMsz+fHmsKjprM2qHWBwBn9hX5Mb7y
         wHTg==
X-Forwarded-Encrypted: i=1; AJvYcCWpPFeU/sdIjbnp0D9ezDpi1I5d1V51ztIPEDTrEPzdzoHFgA8h+XS/vJ6pb11Ys4t70fwO2scjIKScVCc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzxcKY/hm8R+8MBHH8HJ8va7g+4PNvwq9j+7Fjn9jD1cJH1H+mA
	L4BgM2GRLgG9kmOa5R3ayggdIcI0BykiZLL3Ga8N8K1fSZSlcOkbBxQMZlqu4Dzx848=
X-Gm-Gg: ASbGncv0TRabffC4WPHQVTvy7vbzlAx6x002cLbgw81a1Ape6PEcm/Fzmzoj51fw56K
	Plha+3t2L1oJ/aSYRFQVGgrl7lcHOwY45QSuOb2/GD5Map2u3sSzqsh8LGZ440dObx1kNvDcpqc
	9UqowspGSgrIjexhfljIIAZ05woJE97zUaaA5lYFagVMyvA70yCGlNsEqx1Bfisl9DQ640rKgwJ
	iwBhVhE3np1Ac1FAOqrlBUi4qQ1engYdHi252n7L0JOTRWwBK/5abag8qM258V2dZ8LmrmE/sK/
	2XDIzWMCXrFcDMATyigg9LCU0xYyUgVqprTlEmPkEk14P3fixwvxcMh6u7LjK6nYG8rHKEPMB9V
	q51G33NNi4xIlmNsOE8IOzGzJROI=
X-Google-Smtp-Source: AGHT+IFrQ3mNOrW6/ZBr5BKf2weoO3iOKbQMChhnKb6iKzSLwy4jyxYkXr8u6rUugOKC/0R4gbcrnw==
X-Received: by 2002:a05:622a:4d96:b0:4a4:3171:b942 with SMTP id d75a77b69052e-4a4aed86ba3mr229299171cf.39.1748958619327;
        Tue, 03 Jun 2025 06:50:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a4358eef6csm75933171cf.48.2025.06.03.06.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:50:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS1y-00000001hCj-1MTz;
	Tue, 03 Jun 2025 10:50:18 -0300
Date: Tue, 3 Jun 2025 10:50:18 -0300
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
	John@groves.net, Will Deacon <will@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH 10/12] mm: Remove devmap related functions and page table
 bits
Message-ID: <20250603135018.GK386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <32209333cfdddffc76f18981f41a989b14780956.1748500293.git-series.apopple@nvidia.com>
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
In-Reply-To: <32209333cfdddffc76f18981f41a989b14780956.1748500293.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 04:32:11PM +1000, Alistair Popple wrote:
> Now that DAX and all other reference counts to ZONE_DEVICE pages are
> managed normally there is no need for the special devmap PTE/PMD/PUD
> page table bits. So drop all references to these, freeing up a
> software defined page table bit on architectures supporting it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: Will Deacon <will@kernel.org> # arm64
> Suggested-by: Chunyan Zhang <zhang.lyra@gmail.com>
> Reviewed-by: Björn Töpel <bjorn@rivosinc.com>
> ---
>  Documentation/mm/arch_pgtable_helpers.rst     |  6 +--
>  arch/arm64/Kconfig                            |  1 +-
>  arch/arm64/include/asm/pgtable-prot.h         |  1 +-
>  arch/arm64/include/asm/pgtable.h              | 24 +--------
>  arch/loongarch/Kconfig                        |  1 +-
>  arch/loongarch/include/asm/pgtable-bits.h     |  6 +--
>  arch/loongarch/include/asm/pgtable.h          | 19 +------
>  arch/powerpc/Kconfig                          |  1 +-
>  arch/powerpc/include/asm/book3s/64/hash-4k.h  |  6 +--
>  arch/powerpc/include/asm/book3s/64/hash-64k.h |  7 +--
>  arch/powerpc/include/asm/book3s/64/pgtable.h  | 53 +------------------
>  arch/powerpc/include/asm/book3s/64/radix.h    | 14 +-----
>  arch/riscv/Kconfig                            |  1 +-
>  arch/riscv/include/asm/pgtable-64.h           | 20 +-------
>  arch/riscv/include/asm/pgtable-bits.h         |  1 +-
>  arch/riscv/include/asm/pgtable.h              | 17 +------
>  arch/x86/Kconfig                              |  1 +-
>  arch/x86/include/asm/pgtable.h                | 51 +-----------------
>  arch/x86/include/asm/pgtable_types.h          |  5 +--
>  include/linux/mm.h                            |  7 +--
>  include/linux/pgtable.h                       | 19 +------
>  mm/Kconfig                                    |  4 +-
>  mm/debug_vm_pgtable.c                         | 59 +--------------------
>  mm/hmm.c                                      |  3 +-
>  mm/madvise.c                                  |  8 +--
>  25 files changed, 17 insertions(+), 318 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

