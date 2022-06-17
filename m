Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7228954F2D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 10:27:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPXFz34b4z3cfC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 18:27:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=T0JCgWDT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=songmuchun@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=T0JCgWDT;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPXFM5JcDz3bks
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 18:26:30 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id y13-20020a17090a154d00b001eaaa3b9b8dso3558507pja.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 01:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Yr0ixUanPwolWpl8lCaQhXzB90rLEzIJZVwDXXKPA0U=;
        b=T0JCgWDTB1C2DISDgdZ4UDVFOWnRp2zy2MnmauLXScjZ1nAwZFhugPqk7LJHr/ZqYR
         gS7AQ2LY7MCi12zojIG7f8Ph+i4IbqU+gY2wftHcxhfe5I/JxipjHT9G+VpC1zh5K6vU
         duBUQkQeO+lYH2S0APPy5npNumr73wIpqlOnbbnKsqaOmmaPmmMnefSyRGqfn72oeVHY
         4XT/louGb1lBLYbfoesSgG/+I51syqllEu+lF2uvmS6543R3TVlllAbeuSojS2oaZNiz
         0vsqAzWz7egUsoU66blaHOD0ko2YmWG/bFdUR0JWK3PFEfpAyeZtKbMvGonQ25pbr7g8
         /rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yr0ixUanPwolWpl8lCaQhXzB90rLEzIJZVwDXXKPA0U=;
        b=d3l4OVbfJ4dNEeH7HoJPTaVLE3p+nPahx9tPFqW/UmMZbLuAXXKLcm0hDcSxbCmDk6
         VFpEq1yPe8mgk9TTbVQjOqBezMtrSHkTGdY5olohlqKnH2ZlpOSfWmlGVlLw5VbMOCX5
         GBpzKC1YzAPWu31dAdiJbaNB9EJ+/tDmLF7Dk9Rr9khpNGRqRCEcoe1UEzd1sbKVXwD+
         FZ9bISSO93ricgkII0qm/BM1SEdXoOMtEVABY8Bkn9kXDdpN1x+Q3Vkz9ZJcvnnljp7N
         pDTIlO45P/w/MQ3gWzsciq+h2/PUzQwfpygIovBfClJTi1rzKkkG+rWbiiRs4WhtePO7
         /68Q==
X-Gm-Message-State: AJIora9F7+VaWqEwRg4J9eSraKOav974inMvDjcSq1ovVNrkPJKXJ4mn
	20vpLXVICcruAxBQIVuB4ETp2w==
X-Google-Smtp-Source: AGRyM1t5yEL1BPz7y9ug30F37C0ubzhxM59TWM8YWNbgEGd6O1gO2tufJo02mvgvoeRwcOdvYuG/tA==
X-Received: by 2002:a17:903:22cb:b0:167:992f:60c3 with SMTP id y11-20020a17090322cb00b00167992f60c3mr8629830plg.59.1655454387624;
        Fri, 17 Jun 2022 01:26:27 -0700 (PDT)
Received: from localhost ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id i12-20020a170902cf0c00b001677fa34a07sm2974542plg.43.2022.06.17.01.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 01:26:27 -0700 (PDT)
Date: Fri, 17 Jun 2022 16:26:23 +0800
From: Muchun Song <songmuchun@bytedance.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH 2/4] arm64/hugetlb: Implement arm64 specific
 hugetlb_mask_last_page
Message-ID: <Yqw6r0/r34sZdrsk@FVFYT0MHHV2J.usts.net>
References: <20220616210518.125287-1-mike.kravetz@oracle.com>
 <20220616210518.125287-3-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616210518.125287-3-mike.kravetz@oracle.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com, Peter Xu <peterx@redhat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, James Houghton <jthoughton@google.com>, sparclinux@vger.kernel.org, will@kernel.org, Mina Almasry <almasrymina@google.com>, linux-s390@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 16, 2022 at 02:05:16PM -0700, Mike Kravetz wrote:
> From: Baolin Wang <baolin.wang@linux.alibaba.com>
> 
> The HugeTLB address ranges are linearly scanned during fork, unmap and
> remap operations, and the linear scan can skip to the end of range mapped
> by the page table page if hitting a non-present entry, which can help
> to speed linear scanning of the HugeTLB address ranges.
> 
> So hugetlb_mask_last_page() is introduced to help to update the address in
> the loop of HugeTLB linear scanning with getting the last huge page mapped
> by the associated page table page[1], when a non-present entry is encountered.
> 
> Considering ARM64 specific cont-pte/pmd size HugeTLB, this patch implemented
> an ARM64 specific hugetlb_mask_last_page() to help this case.
> 
> [1] https://lore.kernel.org/linux-mm/20220527225849.284839-1-mike.kravetz@oracle.com/
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

Acked-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
