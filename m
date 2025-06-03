Return-Path: <linuxppc-dev+bounces-9101-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A822ACC834
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 15:47:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBX8p0vhKz2yNG;
	Tue,  3 Jun 2025 23:47:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::22e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748958474;
	cv=none; b=V2betXCTVjo0QPEzbIb+JK/RvNEsFLG2uLhNGvtbcAY7ulpIyGKkrtXpiJGXMWCqzais5Mlzbvrec62AcXkkvinzIC0EmYjfYEYAIPsMSyKkYKqDKmCsL8fRt14AH7Vb5c27QNGEE2zGyp6vbeytxJUbI4FmlKlRp4BTxkX51V2999GVoN6re5syKI8cgTT4vhATB1PIY5UDzQKPKSzoZ1R9vLo4WE8SoBsenRe1I7O3fqT5e4fi3+MM/5h8FYTv/pK7f+C20Nt75AvhDh537MKfpvwwvMTNSj9n/7g1t32odzsRXqGFHLopzFZS/HxCfezggBeu5PlSADiZUZkh4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748958474; c=relaxed/relaxed;
	bh=UpF3njOJtHrMyikmrAfZ4zzOg2YUvEVFUbKoE3kb2rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoUetzEHTcoB1qb2FGP5Hxxl9melyf52BYds6GlZPXFo9Ge0YHTfkSFMEpg03Yyawi0c+rB+O+RbjXiDMgPzL9eCSh8v1B/oi9fqHpxpU8TOlfBC6SxnpnG8S0Tbrk83iz29KK9HyZBfbIoFCfjGmzMeDSm+2iUtzj+OWlqhoA2cl81W3DU+CUm0SiK8EB0q5MLt7FXhyNtLHdY3EJtqCRLfxZPwwg1sq+iGYzY1t8B5feuq2UskvJMhVVHMfl77gWT06mYT8s3AtQT0kSPKtsDkEZ+UIcrse8DRAxyzLaCvAjaMGDjJpItaPPMJyv+u8P9NQgdF/s+NkalPuMb5SA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hsSzXxsc; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hsSzXxsc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBX8n1Dw1z2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 23:47:52 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-40356cb3352so3640822b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Jun 2025 06:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958470; x=1749563270; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UpF3njOJtHrMyikmrAfZ4zzOg2YUvEVFUbKoE3kb2rM=;
        b=hsSzXxscKoQNWOy58Z2OqLjffjPC6Gp8K7mR4O4yBb8Yfllh7bmv2rdlK+ymkB1/Xh
         Xy4Jvzqt7zUAByEdqyKnUW/CCTS27OOnbO5dlmAa2+9q1l125Z1deNZF00+fgDqPnNSR
         4skDkm91a2lw2U2/Zooi0QOHVNGEdrdB7u/CM0MISdYh3aKTftI0xmDJML0QU4IWnOGS
         dTEzSsbn/xnqvG4HM3MNCEcYbD0JLafm3tn4hOz34w04jqIyjvpFkFYhCWDs0n35sBCQ
         5jQ6G39JLQSm0Pa2ueR+oKdEEJ/ob+JZFxOEZTRtjMZAQU41qUG86GOITMx9G7Ewj0wT
         zYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958470; x=1749563270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpF3njOJtHrMyikmrAfZ4zzOg2YUvEVFUbKoE3kb2rM=;
        b=MWm/016SZp7zfVz9VXvcAxMBSu9KRACWWl1FLl9ZJwXv+d84yLaB47k3pv/9ChiCZ2
         BroXCVJVHfUCmj8nIBLBqeeAJCik3zCw1g62uUZzy8uVRoPJc7f+62lhVdFpQU6wgFNN
         p9B1WxiWJrajvj+8nCB+J5sjFRA/gVHLY1jfbea2Gynbg2KDqf3fpdCWuTk+Jv3gk5dh
         hneEZ9gWLywpLRvHmlxPjaJAfgO1SA8cIWVkDpkcNA82hxNuO8sTARzgV05IOnHyKzaj
         ssoYXy192H8kgOarFVpPLdfLMZ6uUO0kPCsPE8F2YaM9LT8jtcB8ZH5yo//AZMqyTrXC
         v4Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWF/I6wYHhkJycLtGlUQw9Em/fJilLp2xm7g/oc3hF4c8j8koZ2Tsc3H4yiYgQ4ih+hzxdjRIjYiIBbXnY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxVV1ukSUwgtXW/sjL9GeH2MJikFPFws2wjdukF157Spe43fk4t
	N/VajbafUFCUWmeQd7OSGizc9x3RC7FwuJTnk2I/nqvdtz7cp+0iKptl/UNk9LRld8gVWQogSBg
	VNscU
X-Gm-Gg: ASbGnct572bLGD+vVAhsZHOBDHyxWE8/G6IWImmVwZRKWJTFClAO1oLYelYR2/n+GPc
	Ssy5zvjcXUlUxQzx7vg4daetMBVZlvIcPdTGI13K9zH2DvW/HJhqx5oSdJ7JtJOYRM0CxKqRM1K
	YJiux8PC9jWq6oYCnUi9iyGTTWtv1Y+M+b3Z9/zt8MbTFaU1QV7rmlQbSwZsLMj/XJN57s2NvTO
	Unv508lAxdOva9bhC03dT/v6nFh4dZDls74t4A1pBy3HGMwLw7ciqG4M1SJxJsub8Xss/kxYE8F
	8x+5eHu5Rh9s1YQEmQBbs2lBXkPO+1enQzX5DeVaoorvd21qMsO0iV+GvQ2BMeDneoeXbfXvYHU
	vyGxHb7ph/Xc3S2Kkk7z1hnZaV1w=
X-Google-Smtp-Source: AGHT+IEn/uCXnqGk9mGrQEIlQbsguMg4s70jmRhOs28+dV79kPuZtTFgI19mnXFgGkPMbOXTAF/Qjg==
X-Received: by 2002:a05:620a:278d:b0:7c5:d71c:6a47 with SMTP id af79cd13be357-7d211676724mr394455585a.8.1748958459265;
        Tue, 03 Jun 2025 06:47:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a195d7dsm840098585a.78.2025.06.03.06.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:47:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRzO-00000001hB3-1CmA;
	Tue, 03 Jun 2025 10:47:38 -0300
Date: Tue, 3 Jun 2025 10:47:38 -0300
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
Subject: Re: [PATCH 06/12] mm/gup: Remove pXX_devmap usage from
 get_user_pages()
Message-ID: <20250603134738.GG386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <c4d81161c6d04a7ae3f63cc087bdc87fb25fd8ea.1748500293.git-series.apopple@nvidia.com>
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
In-Reply-To: <c4d81161c6d04a7ae3f63cc087bdc87fb25fd8ea.1748500293.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 04:32:07PM +1000, Alistair Popple wrote:
> GUP uses pXX_devmap() calls to see if it needs to a get a reference on
> the associated pgmap data structure to ensure the pages won't go
> away. However it's a driver responsibility to ensure that if pages are
> mapped (ie. discoverable by GUP) that they are not offlined or removed
> from the memmap so there is no need to hold a reference on the pgmap
> data structure to ensure this.

Yes, the pgmap refcounting never made any sense here.

But I'm not sure this ever got fully fixed up?

To solve races with GUP fast we need a IPI/synchronize_rcu after all
VMAs are zapped and before the pgmap gets destroyed. Granted it is a
very small race in gup fast, it still should have this locking.

> Furthermore mappings with PFN_DEV are no longer created, hence this
> effectively dead code anyway so can be removed.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/huge_mm.h |   3 +-
>  mm/gup.c                | 162 +----------------------------------------
>  mm/huge_memory.c        |  40 +----------
>  3 files changed, 5 insertions(+), 200 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

