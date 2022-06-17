Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C077C54F294
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 10:14:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPWz94FkXz3brp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 18:14:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=BjmCyWwg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=songmuchun@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=BjmCyWwg;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPWyW2PpRz3bkP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 18:13:37 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id y6so3308044plg.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 01:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7ajw5ZlW7BO6xh4idYg9ZGUxMVX3OZuSbGQMRvZITss=;
        b=BjmCyWwguCYTpglhYm7P+9sfT2Sf6eI4hqC5TCzRNcj8GpT7Cc5jJvVeFu+/QvdoQO
         RGPpgCZxneDK+JRvBbAA3vU8YL0MLBkdIjsUazKCO2zJ5IT6caqZ177xBPaHYaNtSFhL
         wsOPZyAq8zDsC4+RXY1GMKrYj3Yyu9EDxibHdpAAagnIOLEJ3bJD7JOCrpBNaHhaJdjq
         /4qXmmNFH+/zsDvQ2LPSFYj7Byd34mjZXsxzy6la7Th49HWzuITGgf435hSeF0LnrHen
         fHCXck9cWmkJX/PFv6Ee2nUXQikqy1BawnEmGitan/14y2a4JTmEO8TSXRXXDJrqoj/v
         LdRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7ajw5ZlW7BO6xh4idYg9ZGUxMVX3OZuSbGQMRvZITss=;
        b=CtsiInz/JQP6ByIjm8L9V1W7AsU818/htmE0GjW/FJ375sNcfAUkVQ9zhGfhGRsy6Z
         fDAld71VSNWPPced4M+HFeOoxQjd9wYUuIKwHrGd7xxtwMoKHPo9dbIYWDWCZxQPUe/n
         vrggz+B2nFBWpMT18ObG3yYf2RfJbiW1dFCRMER1kitXD6Ucmr0udDtSktMjOg2GNCKm
         Ka2aia6mEzZSIRZrqtkAhtBJPWtI0VVCngbL+tKcrA7BxKe0W5S0LaLQLatrJzyt7KSv
         Cok8hPMo7rOm32ihPlUNbnHixg1at3f4dOo9CjLI4XSj33Oi9GiJVoJvqS12Acu4iBmU
         eYWA==
X-Gm-Message-State: AJIora9MyRsWDCfDlot5HQmRa8EgBpdtXkRIo0JLeaMCFjGkLvX+0BX+
	XYV0A0HAlkvDGLp4mq98KFSf9w==
X-Google-Smtp-Source: AGRyM1uaJ6D+98lyL0Nb8O2bTi6YMfyv3saLk9hySILdD8r9XB2OdIlAqHZgNeMyStjI4ZdfZ29vcg==
X-Received: by 2002:a17:90b:4a4c:b0:1e4:da3a:9b07 with SMTP id lb12-20020a17090b4a4c00b001e4da3a9b07mr9398372pjb.242.1655453612597;
        Fri, 17 Jun 2022 01:13:32 -0700 (PDT)
Received: from localhost ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id w22-20020a1709026f1600b0015e8d4eb219sm2932151plk.99.2022.06.17.01.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 01:13:31 -0700 (PDT)
Date: Fri, 17 Jun 2022 16:13:28 +0800
From: Muchun Song <songmuchun@bytedance.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH 1/4] hugetlb: skip to end of PT page mapping when pte not
 present
Message-ID: <Yqw3qHZIwM35rcLh@FVFYT0MHHV2J.usts.net>
References: <20220616210518.125287-1-mike.kravetz@oracle.com>
 <20220616210518.125287-2-mike.kravetz@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616210518.125287-2-mike.kravetz@oracle.com>
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

On Thu, Jun 16, 2022 at 02:05:15PM -0700, Mike Kravetz wrote:
> HugeTLB address ranges are linearly scanned during fork, unmap and
> remap operations.  If a non-present entry is encountered, the code
> currently continues to the next huge page aligned address.  However,
> a non-present entry implies that the page table page for that entry
> is not present.  Therefore, the linear scan can skip to the end of
> range mapped by the page table page.  This can speed operations on
> large sparsely populated hugetlb mappings.
> 
> Create a new routine hugetlb_mask_last_page() that will return an
> address mask.  When the mask is ORed with an address, the result
> will be the address of the last huge page mapped by the associated
> page table page.  Use this mask to update addresses in routines which
> linearly scan hugetlb address ranges when a non-present pte is
> encountered.
> 
> hugetlb_mask_last_page is related to the implementation of
> huge_pte_offset as hugetlb_mask_last_page is called when huge_pte_offset
> returns NULL.  This patch only provides a complete hugetlb_mask_last_page
> implementation when CONFIG_ARCH_WANT_GENERAL_HUGETLB is defined.
> Architectures which provide their own versions of huge_pte_offset can also
> provide their own version of hugetlb_mask_last_page.
> 
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

It'll be more efficient, Thanks.

Acked-by: Muchun Song <songmuchun@bytedance.com>

