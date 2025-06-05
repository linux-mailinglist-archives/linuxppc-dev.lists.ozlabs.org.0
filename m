Return-Path: <linuxppc-dev+bounces-9166-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49299ACEEF1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jun 2025 14:09:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCjtC2BBXz2yLB;
	Thu,  5 Jun 2025 22:09:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f33"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749125363;
	cv=none; b=fmtFuMEJ7IUN+Ftsgv8siVink5+fnl+/4mOlza1NjdwLsg3TSPwpg+xdYUVG4Y6MDIZpQyHz0EjZ3RoeSVl/Kf//z8k8RSvphlzmCZIDmYO9N8LC9udvY39wXMD3/UxajqFVprvYR1cyKXGRClfTzB6bx6B45HIPqXNoxJO2OhbqqIrHxF0PXFIL4VBcMB+jnK3dbRK1l9bVXe+iu2aeXw5aRx7ai74r/64OC+027zxWpB99+peZSaEn92M1v8ROWrMJe9v+2f3DpzPz7xEDkW53BKe8HBwr2p+693lR2qAFuvsw1G6urPiVdbRLCuewyHmpp82P0s9yRZFEaZRejg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749125363; c=relaxed/relaxed;
	bh=UNA1AqJPiuiUBzCeRC8bK1nu38f0qCHlYuwt9uDWl+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0L97kT793WYzEPak+mOBJF/Kjspi/utEEwGtRjN3+RdZMC24IwggCM+s7t/9ZdbIAZzOHgd6WAa7n78bvaRfLYL2Jp1YROmgCDqaZkm0xNZ/L1PssLosR0kSiZLSoTEW/wpaq6IRT8PsiGojzImTDxHyy8XAairVRXQaXRxoalZMzoTZSyxJ+mZQf4eLsIeHBqfhGIwvyyCObx5xay9iLwSzwrlr72P61O/tbyyTLWVIv9/rvhQQtlAn7cHW90z3ULQIGJv/tZf41diaScxpnjRwl8nhXQBOLyXy+rt+BbE8yR1ndKfpJzXKtcmdQL1bV+BJTVz5KKRrBN4IHqIhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=dd5/AOVP; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=dd5/AOVP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::f33; helo=mail-qv1-xf33.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCjtB15p9z2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jun 2025 22:09:21 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6fadb9a0325so8791506d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Jun 2025 05:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1749125358; x=1749730158; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UNA1AqJPiuiUBzCeRC8bK1nu38f0qCHlYuwt9uDWl+g=;
        b=dd5/AOVPaG8ozl670CfTudpE0ipWiQbpMkYrwZ6O82xbUcjpVlLPdZdoqR7NDqQzlK
         omQs6tGHtbobMLI97/4+AXiFF/0PdqLqbFBgPvLVtlSRTP/1GhtX6rxNB8nMUHt+vTk0
         vAw1e+weGYBrnY2tStVDZP0uJqdAB86ymXPl75bkLyrMHG1iV8aEvw5VeTW94sK8bThG
         PV669uh1sVxzzmyaD4hj3nvcgHx/ZQXRO0EhoPRvykbO71iI6rsNU1NQq7Uz4v2Dw51R
         AK7j8q6jcWb3ESM5Vj45WPUnY+JKxLN9PVtDn4PHgAQg3fpqSD86RVO/3MykCwrvfuDo
         O7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749125358; x=1749730158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNA1AqJPiuiUBzCeRC8bK1nu38f0qCHlYuwt9uDWl+g=;
        b=h3aVogyZYjS7UyuejvlyghHSk4+IOVZjKEqIwqJVDRKGythHAXP8ToPpYSJwOcDE4+
         0zr9+mpVooT6QrDhVKDeQa0cKUOx05cCQ6ArTyKUG7q2Keb+Zw6w1CFvNCLcxcG8ffVU
         2hZSQnEJq2/4WLRDEA7Lk2MlVCJYfVufmIpX7ZRNoMcMerABkTBL2KoLSfggLRVbQMRw
         yAj95/ss43k1yflp/q/zcOBkMnDZkqxFDlCsHgib/nqynPVmYAe3roTXX2O9Ws+x9vr6
         1wWyHrEWcnsusi/KXf9LvkkiVJDxTg/cAuciFlZ1CkGCZ1GxeM9vQyuHGD+ATm15C9gQ
         VWDw==
X-Forwarded-Encrypted: i=1; AJvYcCWbCLv2iErVb1p/89iMFy9zVpxpK448qEBO9Nz91rzu6R5cb3kBNRjaZ6u5kWahVkRRU6C5G4ninDWp+tw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzFDlrBFphPy4DF3E1o5ENdT7mSpNtrexr6KjbE+Er6nMfngcwQ
	VWj3QTAuUWdQ7n+NSqrT4LEGiA44HbcusEFS9Xe98can5VrqCXUd8rpPOkAQt6mRYnw=
X-Gm-Gg: ASbGncviMMg56BW2jCxJY+Mb/miwXVBCLJ2qywDr2Hbhb1Pw2IDJqjSNEils8zeoQTz
	UarlF5Agfq9LB4Y6KfLI8YrnB+CCGZT1HzVJq7kB5eft2JMO8dtVjN+cJXEC2rJ2d6bf3VczcxY
	rf0PyfXwo+9+nz+HLS6AhdstOnqRNHUBLZWbCaLy0l0SKeJDpYWLnzBRu7v0cunHFCve2HBRiom
	G2rFV2zUBYMPHOPSm+9K8aFh+eQEjd4Jhxkddh38USeJgs0TRv9S8nsHZEGsDtdT+4M49LnJOfk
	55YT1lXrPusjQHX4bOOMVE7U815EBEUVUx9253n6au2Q3StarEU/W8elrB1Q8k00+qrSz61xHCm
	3oScd87Fa+o9vlzcesK1u/wSenvw=
X-Google-Smtp-Source: AGHT+IGoKm/5U4/UM2uM64qO2HBitYJapsKbuDFJlmk9byEyE/W8ROsmev/IR9V9jeal6LfHAI1O8g==
X-Received: by 2002:a05:6214:224d:b0:6fa:c512:c401 with SMTP id 6a1803df08f44-6faf70163f2mr115317766d6.37.1749125350351;
        Thu, 05 Jun 2025 05:09:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4c7d8sm120604836d6.36.2025.06.05.05.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 05:09:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uN9PB-00000000EdT-18gz;
	Thu, 05 Jun 2025 09:09:09 -0300
Date: Thu, 5 Jun 2025 09:09:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
	gerald.schaefer@linux.ibm.com, willy@infradead.org,
	david@redhat.com, linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com, hch@lst.de, zhang.lyra@gmail.com,
	debug@rivosinc.com, bjorn@kernel.org, balbirs@nvidia.com,
	lorenzo.stoakes@oracle.com, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-cxl@vger.kernel.org,
	dri-devel@lists.freedesktop.org, John@groves.net
Subject: Re: [PATCH 07/12] mm: Remove redundant pXd_devmap calls
Message-ID: <20250605120909.GA44681@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
 <6841026c50e57_249110022@dwillia2-xfh.jf.intel.com.notmuch>
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
In-Reply-To: <6841026c50e57_249110022@dwillia2-xfh.jf.intel.com.notmuch>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 04, 2025 at 07:35:24PM -0700, Dan Williams wrote:

> If all dax pages are special, then vm_normal_page() should never find
> them and gup should fail.
> 
> ...oh, but vm_normal_page_p[mu]d() is not used in the gup path, and
> 'special' is not set in the pte path.

That seems really suboptimal?? Why would pmd and pte be different?

> I think for any p[mu]d where p[mu]d_page() is ok to use should never set
> 'special', right?

There should be dedicated functions for installing pages and PFNs,
only the PFN one would set the special bit.

And certainly your tests *should* be failing as special entries should
never ever be converted to struct page.

Jason

