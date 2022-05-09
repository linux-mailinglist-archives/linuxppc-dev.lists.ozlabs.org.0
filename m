Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1A351F495
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 08:43:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxWny3dJkz3c8q
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 16:43:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=YUWb9VnH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=songmuchun@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=YUWb9VnH; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxWnF5qB2z3bWf
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 16:42:23 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id g8so11440567pfh.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 May 2022 23:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=KwBbyH87QLuFybJCJK1L3o2HCzGQtzlhndyFtKBo1+M=;
 b=YUWb9VnH9CLdCOFSCg0EgRuHaol/guxgUnIE24J/u98QZ3I3dvqShcw6bHn8PbLn33
 De91e3fLiUGBZs3puXjUkFqnGkfsceO/2eweNFJzxUeEtvloQSE+QJUqsSR4B/n5rCXn
 fOwQjXfTmiY/r6o87bGR+3OcaUM524WjnTrpTYj/0PlXxJLh/+Gh7NH9mmwLwHUNU7RV
 798mKiROjo4EcdLxdwMlUkdsZDYVb3TJer8JHISDq/bQz+F1seNMMayMZJHD4rOjmga0
 GVFw2YGdi2fk3IJL1R+yM+i5a8XRpkgqS57S/UyObr/jP4lzVJidIkm4bfeiGNsDsFN7
 rlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KwBbyH87QLuFybJCJK1L3o2HCzGQtzlhndyFtKBo1+M=;
 b=XDMPkm9Em3hszUtEwZC/yYrDZvC6FcA3h3vzcm1esT4lJA8VaXYIRb4bVkQ1BoEQSa
 KYmnguy+YmXDs2NnDLFio2Dv1p20wTQkV+1/neNkk4+5mGSitFHdc5bPPiGsgzbE82d1
 p1VHIbImzGiTEM+GJN4F6VNLRiQbUkIZcs/4hN2c0daTJBWdOitUtmBI5zylmraRmnM3
 034l7bZvb4VrgExZM2Yo2/EYd4RPD7wuJUPsMSKh1VYacsvRys4qCz1CiYvowoMTWV+0
 CwS6eS6SBrlVNUsC2uU3jB09tpIJXq8M+lDwLR5PF7/uLMyRQW7coV1D420fCtwMQHyw
 1g9A==
X-Gm-Message-State: AOAM530+8+LYR2eMiweuYHHeA/9bR47kJwREni6WZXW2EEameXGjhIEd
 EiR2WQoEVGnqQyB1o9shQYYM2Q==
X-Google-Smtp-Source: ABdhPJzri2xI4eu2ZTD8cGUcHrOUq+LTIb9Xrei/K8/ULY+fOTzB8m7m6qoWPFqlzvQXcDaMYRtrhA==
X-Received: by 2002:a63:6987:0:b0:3c6:c3ce:5097 with SMTP id
 e129-20020a636987000000b003c6c3ce5097mr2699720pgc.293.1652078540543; 
 Sun, 08 May 2022 23:42:20 -0700 (PDT)
Received: from localhost ([139.177.225.250]) by smtp.gmail.com with ESMTPSA id
 r10-20020a170903020a00b0015e8d4eb21bsm6178989plh.101.2022.05.08.23.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 23:42:20 -0700 (PDT)
Date: Mon, 9 May 2022 14:42:17 +0800
From: Muchun Song <songmuchun@bytedance.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 3/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue
 when unmapping
Message-ID: <Yni3yTLblEF5aJw5@FVFYT0MHHV2J.usts.net>
References: <cover.1652002221.git.baolin.wang@linux.alibaba.com>
 <43b11b69e9f0d9d7e7960b86661db27cc404d0c7.1652002221.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43b11b69e9f0d9d7e7960b86661db27cc404d0c7.1652002221.git.baolin.wang@linux.alibaba.com>
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

On Sun, May 08, 2022 at 05:36:41PM +0800, Baolin Wang wrote:
> On some architectures (like ARM64), it can support CONT-PTE/PMD size
> hugetlb, which means it can support not only PMD/PUD size hugetlb:
> 2M and 1G, but also CONT-PTE/PMD size: 64K and 32M if a 4K page
> size specified.
> 
> When unmapping a hugetlb page, we will get the relevant page table
> entry by huge_pte_offset() only once to nuke it. This is correct
> for PMD or PUD size hugetlb, since they always contain only one
> pmd entry or pud entry in the page table.
> 
> However this is incorrect for CONT-PTE and CONT-PMD size hugetlb,
> since they can contain several continuous pte or pmd entry with
> same page table attributes, so we will nuke only one pte or pmd
> entry for this CONT-PTE/PMD size hugetlb page.
> 
> And now try_to_unmap() is only passed a hugetlb page in the case
> where the hugetlb page is poisoned. Which means now we will unmap
> only one pte entry for a CONT-PTE or CONT-PMD size poisoned hugetlb
> page, and we can still access other subpages of a CONT-PTE or CONT-PMD
> size poisoned hugetlb page, which will cause serious issues possibly.
> 
> So we should change to use huge_ptep_clear_flush() to nuke the
> hugetlb page table to fix this issue, which already considered
> CONT-PTE and CONT-PMD size hugetlb.
> 
> We've already used set_huge_swap_pte_at() to set a poisoned
> swap entry for a poisoned hugetlb page. Meanwhile adding a VM_BUG_ON()
> to make sure the passed hugetlb page is poisoned in try_to_unmap().
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
