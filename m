Return-Path: <linuxppc-dev+bounces-9100-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C78ACC80C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 15:38:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBWy93vMZz2yYJ;
	Tue,  3 Jun 2025 23:38:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748957921;
	cv=none; b=C5OFLNnXuE0+zaVYvcaSkMAxenX8FAsqkCUNk34ZzOfC0zNNyC8fxVzxmwxt8ZfSMXRslesVVzT7sR6JYRMHVwhw9ca1rwhysK2zD7sRgE+qcqivkE1MQ7q/hDVZT/WObY6MzTuINi/jzgCtWaLhQjBqvVfjoLEAP9pRE+jvpmzZKrLQyGZ83D+f9Pd43V9SNHGVvkSX7mLg0F602/HsYh3IRtFBMkd7g6PHD2SBsvh6OsEgsOVE/wfvrb5tLHR1IKBxI6PVPGGa1hlOZPrCyg+OC2K2C1vaur6QBK0j/s81/PjsDgGqx2Q2iQ+LzYXUUO2T/ekjB/usNPBGy8nf/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748957921; c=relaxed/relaxed;
	bh=2YoBzO9/Vr83m9kWgElnZwYJY0cXKTy7GFrgVmwfY4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MudRs4yvATRSUjeuHW3nnbXxvzyEhPEl6fJAy+adjFmMdR8BIjpcb0BQRXQTOjKxwKnF4PWtJSm1vUb2APrNq6ecRdDIK+dnWO/3IcNgT9daoGqJlyMg+e5Od8QE2oPRF3QoFML2VYuMqfxNOV8KkjE/0iR1zD8f2oBplHczVirjryMHe3HrUhs7OtJkCqF7WGawHo6Gkkzdd8z2On3G28/PeaY+bMeoFWolU1wZmJ2nHdAiKfG1VQY6Cfw2WInWoAYzt4K/NMwGo2XdYqtbqBV7uWH/9iG66QUlsSK9gnp8OKTTXR06QEegL2/AHO6ko82PqH+5B0A8ya6Ffj1T0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nIDaVXG9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nIDaVXG9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBWy862SQz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 23:38:40 +1000 (AEST)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6fad4a1dc33so40437896d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Jun 2025 06:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957919; x=1749562719; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2YoBzO9/Vr83m9kWgElnZwYJY0cXKTy7GFrgVmwfY4k=;
        b=nIDaVXG94KJXrdzBQcQkmwZUDPD8VpMUvhzG0HiE6kLLzD+RJX6SDBolr/q8wRE0W5
         f2rmo2+x6+bjB7kKpD/OK7ndY73uNR2z/oUVQJSnNxp8zQnSS1kbA3S/KK6HZGFgFRaF
         bkOxQHHAu19AuwO7Su8EsMiGVnbrnX9kcZcN0O2MpOr1QQzejdxOh7dSELCGtenki+2j
         bs/lPVJes2viX7DfzTWTrnqfFcOjz6iT/IFaHt/o955b4QI6SL9HL+gmrqpeVCibS6gu
         nuWSxYkxui0zYSHEXOfm8lMCu5vGEkmm2UnbzC9V1IpfD/prAC8LhyJ4lBTCnfyAFrm2
         e8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957919; x=1749562719;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YoBzO9/Vr83m9kWgElnZwYJY0cXKTy7GFrgVmwfY4k=;
        b=eO1GrbB3uXk6CAcmpmX/70m/+DpaaqcbkiGlkVbCd/H9tXiAUSZpeihBLg6JWSE6zU
         aZEO33c94Yq46sy6IF4kuFzc8RdrNGFr7mtfq193OwaiNjr1H1CX0dMbTmRQM3pYmeW/
         UhLiP9vYJ2Jn1nggQlXBVaT+p4cX5qf7+IUR7ALOgizQBmEm+hi+8nZzUqMNxbhiPXzB
         52PcZg9+eVyx1g3Y4fQ8MzUCPy9RwHf7mPEnam+rq27ktlBFakYdV+Q2hdrvF70wMiSP
         IN7Vp1OGFlttYiXhvtrhG71TKlylcvo/NCzJAoMjc9tspLrgRFCme1WrARe48I31tz/x
         l7jA==
X-Forwarded-Encrypted: i=1; AJvYcCUKqX47L5D5oeUmB/CboqTPbzV6ewwmvIRBlvv0rtMjCIIfbOormPW5g3RHao4M5LENdtzCRptRZX0gREw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx5zI+jfbviLxAmlhI8Egd8EXU7E/sFFNGvPhHUeTb/MIKu9oBS
	IdApsACyG8Q6VqH1sIwvCV/VlZllIWnK6FrurZO96tBYC4wsy0RxS3sMvP8K/KhbwdI=
X-Gm-Gg: ASbGncucHfQh65n/Kwd3FuvUfjAGKhcElKGEfTYSLN0IgImw0I9Nb3RAaCKKbUQp5T0
	UcBzLD/zxLH7M6mgzKOsB/qZrXCzJuHirO4ty8kFwfMVN4W2YSJ1rZh804L/XrNkS0ilpk01pUZ
	O81Lbqok0akxbdAhuLteZjUwKKJbF9mZe8SCSUOdc4mIOOSl+/N8/jAvqlxGYg0NcEMaMKP7DjJ
	qnBGWZX0nS8VwiNw/7si3TgCHfqUXP/zGRXTjsbG5a3eTM/RfWFfu/Rq+pmFjnfYCB88U7WGeXH
	IszSAkY7BYg1csBahMjDCktO/t8hjVRTY63gKSDZvCSGLfBldnzvn1J417hV4KM2QoQpcPxNRWE
	lT3dZbeuZW4EfFqpSJe7Y0kFovx4=
X-Google-Smtp-Source: AGHT+IFNNgr1gOgNIDIKGgPc3bhuHOtoZeZOnCuhf1c+LALW25Lvqo21bVxhfooiSUL50e5IoEYUCA==
X-Received: by 2002:a05:6214:194d:b0:6f5:3a79:a4b2 with SMTP id 6a1803df08f44-6fad191b357mr264142056d6.14.1748957918424;
        Tue, 03 Jun 2025 06:38:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e1a681sm80140746d6.98.2025.06.03.06.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:38:37 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRqf-00000001h6M-29EG;
	Tue, 03 Jun 2025 10:38:37 -0300
Date: Tue, 3 Jun 2025 10:38:37 -0300
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
Subject: Re: [PATCH 05/12] mm: Remove remaining uses of PFN_DEV
Message-ID: <20250603133837.GF386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <ee89c9f307c6a508fe8495038d6c3aa7ce65553b.1748500293.git-series.apopple@nvidia.com>
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
In-Reply-To: <ee89c9f307c6a508fe8495038d6c3aa7ce65553b.1748500293.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 04:32:06PM +1000, Alistair Popple wrote:
> PFN_DEV was used by callers of dax_direct_access() to figure out if the
> returned PFN is associated with a page using pfn_t_has_page() or
> not. However all DAX PFNs now require an assoicated ZONE_DEVICE page so can
> assume a page exists.
> 
> Other users of PFN_DEV were setting it before calling
> vmf_insert_mixed(). This is unnecessary as it is no longer checked, instead
> relying on pfn_valid() to determine if there is an associated page or not.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/gma500/fbdev.c     |  2 +-
>  drivers/gpu/drm/omapdrm/omap_gem.c |  5 ++---
>  drivers/s390/block/dcssblk.c       |  3 +--
>  drivers/vfio/pci/vfio_pci_core.c   |  6 ++----
>  fs/cramfs/inode.c                  |  2 +-
>  include/linux/pfn_t.h              | 25 ++-----------------------
>  mm/memory.c                        |  4 ++--
>  7 files changed, 11 insertions(+), 36 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

