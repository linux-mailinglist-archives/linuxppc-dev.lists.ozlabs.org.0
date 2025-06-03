Return-Path: <linuxppc-dev+bounces-9104-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9B7ACC848
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 15:49:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBXBF4gBqz2ySQ;
	Tue,  3 Jun 2025 23:49:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748958549;
	cv=none; b=GzR4A3YjZFkvZ2OJ3oJed606amSlr6cy132VEsicbcNbTFKnYpe5FiZd3Vg0TH5dr2+v1d0HaLkVC1j+656S+Sq9eWGg685A1AsZmKPlTXWdFVNR/U7Vm2EUvXGoYBCycfi/vXhYRz+fKiqhpq0dVoyjMABLM1iErF12WfcgRas3ZUdBYFkB6SnXwOTOnu2giOm0LE5sDzD/glDf31POuBXvDswIGd4n7iP/v2KFJs1I7Ok+a+i0QlwYcjFruWVLrDWhSTRGjsL6Au/yWXFai691xrNB+HgM+WjZGhbHKADHVLMZmh66OY/3s7+Z1VEejpvS3JtaBGrP4rCthzB/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748958549; c=relaxed/relaxed;
	bh=ooaH+MVJLI6au3+Z1ecUWfQ+S7G2Wg3KD+ti8ca06oA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhcwpKKteM18BO6KSRomUjZIA+AFegr66oSlKupyHYbbInTEeZn/YDLEMUFffT5EIqgg9WRp5+Iex5sExFHg3oLnH+pOePJuT3s4czBTRVohdKaJvw1xQFzB0bbEBZ4LN8G6tk7es4l2xUm2pK0zuzjXZ4kFlTwkHIG/uvWNcgWRmhiMrYNHaH4tksJX6hcmDtIbKjbg/xVlvJfRG7J4yWOsnYQx3iYV3iRdZnALsPrLVv4hA9e+03R7E9aFdXHIYmIqfs7bpSIr6Tlw7m+Q2Bt/JbFcAeghXNTdLiX9uMPlurjaO2OG75fbwk4yCMQZnNh4YYFFiY0fYUPVhfx1CA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bNi0jxpq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bNi0jxpq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBXBD6mXWz2yRD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 23:49:08 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4a44b9b2af8so24102361cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Jun 2025 06:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958546; x=1749563346; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ooaH+MVJLI6au3+Z1ecUWfQ+S7G2Wg3KD+ti8ca06oA=;
        b=bNi0jxpqoYv13gQg1Q6+WTm/jSBQr5dphvPyCbEPxffbIHbM1X5yIWr2b4t7nv2JwA
         MpENqXCme1ByoQcGcg9XCgH5HWNutSCGOQ9ZW5rZlfBNuWbx3Wpeebo+jdWhXybfWvBh
         08FWz9uzYBoViyyfd+WEhsZP5mV2P88NcztUSjGzYon8qlF1Gy7wRsygh91Os4COM+nQ
         u2Ou29vAQXtqaDmXhD8ZuNeAn7kRQ79JNgfidnEoigEtywIfH1w0wwdR03XNx33RD6dg
         0OBjyion0bYlJhcQoK0+4pYVXxmKpuSoQOpEJ6YyL738ucWzStLW5tBauNHkQKIItFwq
         QCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958546; x=1749563346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooaH+MVJLI6au3+Z1ecUWfQ+S7G2Wg3KD+ti8ca06oA=;
        b=EISylRI23WLtw7oXjDByKYxXSSX1Fioy2zT4kQX7Hk46HofE0FjwhlR5hyntZ4cSiT
         wiIAL6tLexJM+7QBiiNEapGzinBNMv6rZtzpwbhmuoTlXok8/lLjrxQiDuPvv5XoyRnL
         cxfMpC9SCPFQKYXKV/FqxpxxVdbYha1vYTbqSJiH0t1lfEdl9bepoOLm2f1jgRnW3Qq/
         W5oida2rZ2tIvnCHFkNYXP5LaixOTxFztANaVJVL8TGfIdel1a3PishpPwnNua7U+5rQ
         sUaGLfVSG5UUoiODcyKm5wAH84K7b3E3WvYG50HLyLa1yK/e/gJqfB+H1SWaLloUO1lJ
         Wp5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyyvuJ1T3nU9RmiZtsHWoFvw5AbU3N+LG7lw9vT9GDtL5uD8TKigYjXU6vdtrVzWLJNMTfr1nzCU9dIHY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxSRuBrFnc7yPBXmWGAsm0xhe1OVjCCEnDqtfEg67qGFDH4kcoZ
	EQH3dIvakUn9fwfGFoYJOn3we4UuMhFu5Ea+/+WChMCl8f3qoWYemxvii/mE78XRuUo=
X-Gm-Gg: ASbGncs+iAfi2Off3piPwHjpLPIjOJixM6eDEUs7kZZ++hiGuW4hWbk5KFElCJfKu1M
	ffARsFNeX9Xfv8tgQDX4ERQb13kD6BGW5VQ/BNRaUek1ocSExgU8JDuaqQ2b+iaTJ1yxlB8MbOn
	JvLtvHZ+cBMoFRh8FMdHCpXak+/385XdyQAeiauFLCY/pLdAOn9utX98O20GMTZsMKxUb8PuWu6
	m4Bis1csjgHe5KtrFsdl3ve6nAJHoUbk5bDphhiHF4tT5N/zr/fvCCvpUug4Ds2t1PZJveVWl/7
	XTrcxwAwrrbwrrXJj/7EDhuWKxbZ6bkLQbq/g0s2NUB7g7z4JOnNvLA+H/Hvd7QEQma6icS+5Ej
	1ifeI5U+ZyLB/hgKJKoT57KdR4d8=
X-Google-Smtp-Source: AGHT+IGIU1g+493Q79vIGhbP57BxcXzG4cORozjsE0WNUaw+m77zFEPhKIIEfe6WhON7WEL1UbHK4w==
X-Received: by 2002:a05:622a:5a98:b0:494:b914:d140 with SMTP id d75a77b69052e-4a4aed8a697mr209908281cf.43.1748958546430;
        Tue, 03 Jun 2025 06:49:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435772a19sm74189111cf.1.2025.06.03.06.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:49:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS0n-00000001hCF-1wNL;
	Tue, 03 Jun 2025 10:49:05 -0300
Date: Tue, 3 Jun 2025 10:49:05 -0300
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
Subject: Re: [PATCH 09/12] powerpc: Remove checks for devmap pages and
 PMDs/PUDs
Message-ID: <20250603134905.GJ386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <b837a9191e296e0b9f4e431979bab1f6616beab6.1748500293.git-series.apopple@nvidia.com>
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
In-Reply-To: <b837a9191e296e0b9f4e431979bab1f6616beab6.1748500293.git-series.apopple@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 04:32:10PM +1000, Alistair Popple wrote:
> PFN_DEV no longer exists. This means no devmap PMDs or PUDs will be
> created, so checking for them is redundant. Instead mappings of pages that
> would have previously returned true for pXd_devmap() will return true for
> pXd_trans_huge()
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  arch/powerpc/mm/book3s64/hash_hugepage.c |  2 +-
>  arch/powerpc/mm/book3s64/hash_pgtable.c  |  3 +--
>  arch/powerpc/mm/book3s64/hugetlbpage.c   |  2 +-
>  arch/powerpc/mm/book3s64/pgtable.c       | 10 ++++------
>  arch/powerpc/mm/book3s64/radix_pgtable.c |  5 ++---
>  arch/powerpc/mm/pgtable.c                |  2 +-
>  6 files changed, 10 insertions(+), 14 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

