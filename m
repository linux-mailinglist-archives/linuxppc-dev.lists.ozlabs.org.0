Return-Path: <linuxppc-dev+bounces-9103-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32466ACC843
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 15:48:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBX9r0MTrz2yfx;
	Tue,  3 Jun 2025 23:48:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f29"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748958528;
	cv=none; b=f0DTgWbh7ijN9ayCSuus0oK3bbwujuoeY6RnGUu/lEqEasNuMeDfg+1AvMmz5oJXT3DmCb2q9WwJGROFpV7QaCB2h8ZVaKoUU58RKAK4sw3a9tQjfoW+hpxof8rWt7g1KhqHXKzp4MT7uxCpFvldkzf3tnMdrq4EMVn0jgB9h1Xtm0jkLyPEogxU3Plk50Y5wi2m5CV51/1VYRqVjzhFT8hlFvOOvaLDEo2/Z4Z7ip/1oiXN4Y4j82H2bdx3h93viSfyamTlQk4JUjuRS+TW3N28RTG7058SDkayeWYQ7EV3QwOQXWRnAtIYVi09bQi2THpSU/brDg6gzQ0TTC3rQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748958528; c=relaxed/relaxed;
	bh=ZSTZfPDDH1MLe7AQH4Yed2Uaqt/hLn+gokhyp0JhueY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arLNicp+DaAsUc0v4b+QdlGtpukzHTXyP4GrEu4eg/209jGwxdt6weGe1yr57Wbtr+SunGN2LB4Bi6iLEg/kW5iFaoJpOW0mxYmkD0kpip+jcc5JE0JldWB5YhCoDbcVst12j1aslhZFSrElI4i1HcmBWH37M9w+t/yMH8H+X7v0iZNI1iKZzLniI1Zke5sy7dKZB9kJqBfrQlTEEIB4DV0nVGEZmOvN0q0LzPbiLDiJ0BTtVWFAlmMqXz5iOadUoE6x9CRFRCWUSDM87JxHZOLh14ayUJshx4ZwhqLccF5P8xcKGl2d5CvQPZ3jT7FGRJnE+1bUPcgQZYlA7Fx+nQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=oMvWsaRz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=oMvWsaRz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBX9q1gTzz2yRD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 23:48:47 +1000 (AEST)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6fa980d05a8so52697736d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Jun 2025 06:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958525; x=1749563325; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSTZfPDDH1MLe7AQH4Yed2Uaqt/hLn+gokhyp0JhueY=;
        b=oMvWsaRzuDcNuV5Xqn9+ItqTUV0DWKlc2mxmTJfoKYm+lxJwivfmPeZo/UCux42E7w
         VOLvtH5HiUQDb4/yczRP5VG/pScRgu716ZJqO3rXe1JEiv+5WXdrBNjEIaYNHFfN+2H8
         4gEZelM6Ri6TMpErWhWtVdJIkOQRb55uGoINXfeBqhD6lXwFJ3zHYg0qywQJfpPOVWVz
         8bBxIUbLoglSIjoYV+fGmMBHEv+l4CCwkmg9W7VmTrdWwzYZdpDgLm2yr6JGIw2QUs5p
         JeKO05X+4f6KpFaS6y3i2cv3PUOEXVDnIf5EZ7k4kYf/b/eGsE8VUIWXcKRA+y0dWSi6
         jJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958525; x=1749563325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSTZfPDDH1MLe7AQH4Yed2Uaqt/hLn+gokhyp0JhueY=;
        b=TSV70Ebrg8rlRVcBPtPRo+gn6cA7tgPUmfuFWg5wiGSQbrpaQYOR3tgjlD7z1NCIuY
         k5s8twL8dqThrFBoNzZSX0mkQgAH2BegwHk+WSBpk1CjxSGy4x24CRcX+hKzaOCUVk1U
         D7ypNEXB6WMAA40CvSovIBNAgdwBCTatZUzYouTiYX2BxhDtCvjsVHTWp46EoiOr4G3S
         oE7uol5QxD1UjT40hPjM5QE4auo6VArvVwx0iZShDOgWqKaaou17JGpOg6WbIYg3AB/Y
         JID7w6R8Ft4pn5heg+aER+XA71X30ngY9MFG3DH9z43aY3qR1FDFKPKjtMJp/+nQxAPN
         YpdA==
X-Forwarded-Encrypted: i=1; AJvYcCVJJSSeSOUEvSOJqmf+Fb340hvFRB/Bkodid8qunivUObusIC86lAsS4od12lB7BOHUKhkgJouy41G8rLI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzjfxpV+hz/HmyziqdLxh3/52VVrv2OBeS72/YMSJOw0LMPJuh4
	jNpkkVYP1ptPQIuZEfA6RGWIEoDIamQ+cYwSOqpPJq4ttdP+SWlzhsJj/BpCcnd9XiI=
X-Gm-Gg: ASbGncuVDKuuZ+VwHb8HsyW+n8aK6cZ8y6UoJ0MMYb2+1nvKKTGYr7TRhQN7yQ2jR9x
	uA99Sbt05h+AsxqMFZe9tJzO5qwJt+SBUwlsc1KLPZUosiR5quPeHYE1Y0wKTuDbpzL/NPasaYi
	CGeTD78DR08k8bBdKSkm6Wba6bXYySbk2Cp9FFnEnOj6aPvp9RPjxuqKEoe2plL17DK+0VDHYQB
	ouTE1HrJIaTdYnfmMADQEDTLrdZQEfDePxpdZ4dhlEylUVYgTynzaMuBNg9XbpqQxqi0c68TS3V
	wIcnaHOcwtpOXzVA2WB1lGb4LgWMZv4XdbrSAwEzLQRkb5/uoCb1KElJCS48NxtnPIavDmTWZvp
	WoNBIwaLMPu2Q6dzBjyNIcdROaPc=
X-Google-Smtp-Source: AGHT+IH3Vn4y24ccOnNjvyrMKRdXMvoXmINXxWtKUHHRDjsnlypx2qCEJce143rhCfMATkU1PKi1PQ==
X-Received: by 2002:a05:6214:27cb:b0:6fa:acc1:f077 with SMTP id 6a1803df08f44-6facebef794mr265266426d6.35.1748958525108;
        Tue, 03 Jun 2025 06:48:45 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a10e844sm842209085a.49.2025.06.03.06.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:48:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS0S-00000001hBt-0o7d;
	Tue, 03 Jun 2025 10:48:44 -0300
Date: Tue, 3 Jun 2025 10:48:44 -0300
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
Subject: Re: [PATCH 08/12] mm/khugepaged: Remove redundant pmd_devmap() check
Message-ID: <20250603134844.GI386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2093b864560884a2a525d951a7cc20007da6b9b6.1748500293.git-series.apopple@nvidia.com>
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
In-Reply-To: <2093b864560884a2a525d951a7cc20007da6b9b6.1748500293.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 04:32:09PM +1000, Alistair Popple wrote:
> The only users of pmd_devmap were device dax and fs dax. The check for
> pmd_devmap() in check_pmd_state() is therefore redundant as callers
> explicitly check for is_zone_device_page(), so this check can be dropped.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/khugepaged.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

