Return-Path: <linuxppc-dev+bounces-9106-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0ADACC865
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 15:51:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBXDS4QL0z3064;
	Tue,  3 Jun 2025 23:51:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::835"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748958664;
	cv=none; b=aaA1H2UNrPXERiXooIlok19Hdj46OBH70wtFdcFU09a2BSpEDZJ5yPQoLoNFb+xxEkJ5qdP4NPJRYc0uPlmfK4VN9wu2tDuLHbPOCf+t7gP8XCgSHjV9KHuyKk3W0MjpWEurxsca2ssyT9BytQIUX+kuayQLvK+VuKvrlM1E5pUjkYGq5g/Bu0rHXHNWQOpYRoXtn0QcTA9yaurQpNo/MEuWYbyOyejgkATgQypBgKLZL4+ST130Cqjx8f6bAhsV0UMrWxBV7EDKAQ+HA6aWPie8aYxdJ87zNIHGM9+6oosTy3vmgmTIxC2nwchbhwDcpt8pPXpGJLGwth9gfzprGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748958664; c=relaxed/relaxed;
	bh=YjoJn2Zm/22QHFjhWW1StoVgQrArf1QtKVAZNo0G9LI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I4KTFJvIWwzBPa5vifquEe4dauQhbo9k00PUtpnJBWU4dTrnSlKGrLsCC5crf0CTwqZttFpGllMVXFyR8XBEXJQN7KpBuwAlak8SwkvCdYH1UPoJOpudwogyivUcwOWNvlyqk3d+zUddU3CSNMBUJjIqTqYUekzl8ONWlaNMZFNxzXyy0Ed2bj5FQ05oT0UF91RjX7f1Sa2bR9mTtd5Z6ChRPQxzI7af6BB9hMj1hxf5Yf3q4irouYg/Z60Uam7uoKbdXo+UBVM7j1JziJ9ZfFEFjLZmFxgJmhrr0aNzrVhnuecmpbwUsiijvkm962ctbVmwWq+HeoWDHZ30mFuTmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Az2wu1j5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Az2wu1j5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBXDR5zWqz2yf3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 23:51:03 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4a52d82adcaso48858891cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Jun 2025 06:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958661; x=1749563461; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YjoJn2Zm/22QHFjhWW1StoVgQrArf1QtKVAZNo0G9LI=;
        b=Az2wu1j5Mjm49hWuwqNs/zZRUGTm3CAhpVrFG6DJbcjXqnhlKFv8NcvnxY7JfaZI9f
         lRG8YuvZysKsv4rsPCGc/Yp/x9Y4H5IAzs2UtsddHamRCd9IfmxIJUzy2+Z72S16A0QT
         5kiHjinKTRm0oXl8R7bhdMustGzCqMMJntoz1Xn361tIRgMOc19SS+EpZ+0m69LI0alq
         DulJXxQ2DG1VED/PF/iMThboO2BkITqNChnOpfZiRTMiyY5dJU3g5iZVfuQQ4IVFhi6B
         t0NgCPGyektZASZyYHVi4f/IBLF24EkbUnx3MGGI9axsnMVhHo/ZWd/MSyofw3a0coCW
         O6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958661; x=1749563461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjoJn2Zm/22QHFjhWW1StoVgQrArf1QtKVAZNo0G9LI=;
        b=jYzISLGyN5bCNA3ug5eNgZ/a9mELSvujcDmbEHbBpcBbv2ZgxsxBOHU44oDZ+noEKH
         lJkxbgeI/PaC2fEpbZRS+G07ZOB2t9lP1h0LOztSBOaX7YGZOXhLxhwoTVAmhuQKuTG6
         vHO/1i8k7nhBVO4+XcBJeFhkVenyAOJ1Wt1dSfNm7zeXi/kJOLgAwQO02+6LlXtHoHu2
         AotCOS4ljQZYJpopCOnm2G4UrQiN2/0lG0Btq9lGLUx8sRADzDr2fo2tkJJF+s0vdL4F
         fHQwuewEtKHSpDPjdME6vDECFQpBmxCL3Yc+Ih/v/83cqt/JOPcz2inSvHwexz4nBeep
         ImyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwBWx6Scg1SRTbKeCGYwmvgMHIsSSFAFq5eJblfvE+N1BWexSuTlkH2qYTtHlae+KpoNN8AHEiR5yyGD4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwBIoX6DTaJU4ebO4WV9EjgZbZte7aK2yi8wZyJOF8lci7/Eu+9
	L3T6vxhKBXgNEhyT/XpYIViciMRNq89BUJ7DFoYjS26eN6RPwLM8jfpJmIfxOdJC+8uSP8gRfTI
	ge/f6
X-Gm-Gg: ASbGnctfDiVeNfDVnN/EyBBqtri1VL/7V8fu2mNgRbFtTXDVd2lFFEzOhz5QtWZ3/nR
	g57Jyyepp80TTDMVq0mOfn2WDiE4Uqes6e3/y/i0FUsg6OLU5ZlyukwSnLCEhoJrDqWy/c0JiD5
	lAMiTVNp4Iwh3daODfseVczcMmFTCyxsgIfQX/Ij00CbKYICuR4DpdVQDV9Q6VtTY/LFNIl2/T+
	npRbiTckxhaFwOKJmqpmOe/EwHEUJo0iblIVczS9vsO+7AalPTzeqvhkJR4MluvzsLaxECagxe6
	8VC+c7VJ8/B7ACRr3Jmm0OIFVdRi7e6/PBsGKmhrvTEYhG969kERR0pZ0qk7nm/D6Cvs8fqQURp
	KiiIWW4YiMhi+NYaATZiyXKhyseA=
X-Google-Smtp-Source: AGHT+IEFP32FP1kWWCcJZHDROTyLVsjrCtV3bR6kiIwGVnTYe5RPt72l9Jyf9JX2LfFifGppycDP9g==
X-Received: by 2002:a05:620a:4629:b0:7c5:3c0a:ab78 with SMTP id af79cd13be357-7d0eac62c8fmr1708400485a.14.1748958650816;
        Tue, 03 Jun 2025 06:50:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f9925sm841658185a.41.2025.06.03.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:50:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS2T-00000001hDC-3YG8;
	Tue, 03 Jun 2025 10:50:49 -0300
Date: Tue, 3 Jun 2025 10:50:49 -0300
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
Subject: Re: [PATCH 11/12] mm: Remove callers of pfn_t functionality
Message-ID: <20250603135049.GL386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <4b644a3562d1b4679f5c4a042d8b7d565e24c470.1748500293.git-series.apopple@nvidia.com>
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
In-Reply-To: <4b644a3562d1b4679f5c4a042d8b7d565e24c470.1748500293.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 04:32:12PM +1000, Alistair Popple wrote:
> All PFN_* pfn_t flags have been removed. Therefore there is no longer
> a need for the pfn_t type and all uses can be replaced with normal
> pfns.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Yay!

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

