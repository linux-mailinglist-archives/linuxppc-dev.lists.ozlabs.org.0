Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6C851F21E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 03:14:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxNW65jn0z3cg9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 11:14:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=SyLOThmL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=songmuchun@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=SyLOThmL; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kx4wL4BRqz2xZW
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 May 2022 23:32:00 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id c11so11578590plg.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 May 2022 06:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PmPqsk4Ds+rkfpu3nL2hTmPZ4zZI7ndI1Rv+jcAXn+g=;
 b=SyLOThmLnXTk6qRKX1oo9DRLScsXkpBQJcjqc2ZX8BklsBr9Jd5/4XzS5R0rdBNn64
 Gj08t8HnQPHGWv/6lK5azajHcMs4BDXMAWO/si9Vg++doIk4TwR6gjg96i/2Ieo239U+
 GD/hhn1ajJzQO2Fu00Id46ibFUBWFedLdoweGjfehLyxDpd+kx2jhOMeAvgK4hJi70uy
 2Sxen0AzDNegfxiv3X3keWQqOByVGhCLH68rwxiyhvd4lp5cQorNpjcRm00TCUGhYcZj
 TpQMhfYAi5LQjolnYmnz+/jetR/+obipzK9Rq4yk9iPkemX0aPQqHJMSY4KTNlniPFzy
 Gz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PmPqsk4Ds+rkfpu3nL2hTmPZ4zZI7ndI1Rv+jcAXn+g=;
 b=QZ80dbcr7cbjad6UBQXjDW/l9p04U/3QQpWw0Yox0T6oW6joyovrtnJIuX//VBBQyj
 knlc1yqruDHFDJ5vAzh6rOWAEAgXE2aoE7JPfb1/UPjGAJSrDneBsvFWmppptE2R5OPT
 5IEv3u5qLtocw5sP3vQARSow6Hez8xwtSPyYfc/lCnznIbXxOOSk4ToBmofr0pnr8hoe
 fsnG5HgHizlN2u48yCHy0odJQ6TVV/KJzDrhaiaNH5ItlhZK+Z9IjJ4mwCqkvMfimN7z
 9UB6XTw1YHBSriku89oLMk6Xx4mAiEm/O4LCq0NN8DQCKLCjnRAPjsH83EDay7lsGpFh
 8Zxg==
X-Gm-Message-State: AOAM533UHve1Ecj0+n7VopKdERsemFp7W6BipXbuixzBn25JoO/Qqrfs
 QptGGueVZv/E14yBOlCmr2lkrQ==
X-Google-Smtp-Source: ABdhPJxahffH9rcJXLYibIJ0tdGcqVx0aeXH5wYUXoWTVBpSrJpN/ltMk318QQF+PAogtyB3/7uLhQ==
X-Received: by 2002:a17:90b:4c88:b0:1dc:60c2:25b2 with SMTP id
 my8-20020a17090b4c8800b001dc60c225b2mr21748033pjb.133.1652016717528; 
 Sun, 08 May 2022 06:31:57 -0700 (PDT)
Received: from localhost ([139.177.225.234]) by smtp.gmail.com with ESMTPSA id
 cj25-20020a056a00299900b0050dc76281e1sm6590444pfb.187.2022.05.08.06.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 06:31:57 -0700 (PDT)
Date: Sun, 8 May 2022 21:31:54 +0800
From: Muchun Song <songmuchun@bytedance.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 2/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue
 when migration
Message-ID: <YnfGSu8tPzTt9ozL@FVFYT0MHHV2J.usts.net>
References: <cover.1652002221.git.baolin.wang@linux.alibaba.com>
 <1ec8a987be1a5400e077260a300d0079564b1472.1652002221.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ec8a987be1a5400e077260a300d0079564b1472.1652002221.git.baolin.wang@linux.alibaba.com>
X-Mailman-Approved-At: Mon, 09 May 2022 11:12:57 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 linux-mm@kvack.org, paulus@samba.org, sparclinux@vger.kernel.org,
 agordeev@linux.ibm.com, will@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, arnd@arndb.de, ysato@users.sourceforge.jp,
 deller@gmx.de, catalin.marinas@arm.com, borntraeger@linux.ibm.com,
 gor@linux.ibm.com, hca@linux.ibm.com, linux-arm-kernel@lists.infradead.org,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, svens@linux.ibm.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 08, 2022 at 05:36:40PM +0800, Baolin Wang wrote:
> On some architectures (like ARM64), it can support CONT-PTE/PMD size
> hugetlb, which means it can support not only PMD/PUD size hugetlb:
> 2M and 1G, but also CONT-PTE/PMD size: 64K and 32M if a 4K page
> size specified.
> 
> When migrating a hugetlb page, we will get the relevant page table
> entry by huge_pte_offset() only once to nuke it and remap it with
> a migration pte entry. This is correct for PMD or PUD size hugetlb,
> since they always contain only one pmd entry or pud entry in the
> page table.
> 
> However this is incorrect for CONT-PTE and CONT-PMD size hugetlb,
> since they can contain several continuous pte or pmd entry with
> same page table attributes. So we will nuke or remap only one pte
> or pmd entry for this CONT-PTE/PMD size hugetlb page, which is
> not expected for hugetlb migration. The problem is we can still
> continue to modify the subpages' data of a hugetlb page during
> migrating a hugetlb page, which can cause a serious data consistent
> issue, since we did not nuke the page table entry and set a
> migration pte for the subpages of a hugetlb page.
> 
> To fix this issue, we should change to use huge_ptep_clear_flush()
> to nuke a hugetlb page table, and remap it with set_huge_pte_at()
> and set_huge_swap_pte_at() when migrating a hugetlb page, which
> already considered the CONT-PTE or CONT-PMD size hugetlb.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

This looks fine to me.

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
