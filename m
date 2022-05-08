Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B853251F21D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 03:14:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxNVQ4Z9Vz3ccp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 11:14:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=UlTfZYFJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=songmuchun@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=UlTfZYFJ; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kx1mL69F7z3bfg
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 May 2022 21:09:52 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id 204so7178858pfx.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 May 2022 04:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OWmWFuKURN4UwCDRPsgR9Re+rOOqJePNgFLKfmRbPyI=;
 b=UlTfZYFJ8cQvbSFvJYR0MNjIVNnz94wcIJy7bmyHAq3K7dhExqiXwQ6GlaTqAWyxzy
 /Z/UihrYn4PiXbZkL0LHCX2s5FoaTSEdl9xmTkNYPq7h9HiO+occ9eYuqUW2zt7FKqmt
 b3PN1o5ZoZJqlKw9pM5JrZNOlSwE6WvfVuInjWEAmfTWiOCutIUTw8vwaC1o1YFjwp9f
 +xjwh/8BPP6aVzOrMhkxbxgpxLomJCpFhrQhBvrcVb/DbwLhuEyhNqWHYVVFWiB/5sZZ
 2U9B/tv5Pzx5HC7lG5vZPP5nVcDqOI8s7xA4xdRGTcVQxNcgXyFbsuZyVPlp5azgbVRy
 VmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OWmWFuKURN4UwCDRPsgR9Re+rOOqJePNgFLKfmRbPyI=;
 b=YMgoz1igg1LyWEQLljOVRFCObeBWDwIrrU8ASYntmyryqMEB7ORVg+Zv/jit5L98uE
 ISBrAjuWzjPOx4pT3KyU/mSYgMLC02la12l38cYmQsqPSFbh7D4plbO+QqEWLnVm4pxJ
 tkutKSPEuo9wNtcrVkMzwCkdak563sRAZu8tzJG8xkmdd3sg3SJSdaTyAFkGdsrUHxx9
 HLtsBnMIwS/DcyJU1flKouLN4U+2O5YCehPGZGvVG944orkQNWazbw/Bx0xXkbLWnmj0
 cKv/vWDonm07s3pglu/rn/qlAiXcL+R3t9mgMFsUQY/1qeThO+EcKJOzEzBHmBZC0ODN
 KzZA==
X-Gm-Message-State: AOAM531ZijPH4jygB7CUH6lZPD9toExlcMgQO9L5K5hPgmn7rF+zGIAp
 P8J0tbgtyvfRAFgNfMLjNCquQQ==
X-Google-Smtp-Source: ABdhPJxZzyOA/OXdDbOTRosPq5K5546OioeGuvjfL98xly+cJSbCFdY7/mzCWxYx8HhR8kOEcFz1eQ==
X-Received: by 2002:a62:b60f:0:b0:508:2a61:2c8b with SMTP id
 j15-20020a62b60f000000b005082a612c8bmr11424511pff.2.1652008187667; 
 Sun, 08 May 2022 04:09:47 -0700 (PDT)
Received: from localhost ([139.177.225.234]) by smtp.gmail.com with ESMTPSA id
 17-20020a170902e9d100b0015ea8b4b8f3sm4943158plk.263.2022.05.08.04.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 04:09:47 -0700 (PDT)
Date: Sun, 8 May 2022 19:09:45 +0800
From: Muchun Song <songmuchun@bytedance.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 1/3] mm: change huge_ptep_clear_flush() to return the
 original pte
Message-ID: <Ynek+b3k6PVN3x7J@FVFYT0MHHV2J.usts.net>
References: <cover.1652002221.git.baolin.wang@linux.alibaba.com>
 <012a484019e7ad77c39deab0af52a6755d8438c8.1652002221.git.baolin.wang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <012a484019e7ad77c39deab0af52a6755d8438c8.1652002221.git.baolin.wang@linux.alibaba.com>
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

On Sun, May 08, 2022 at 05:36:39PM +0800, Baolin Wang wrote:
> It is incorrect to use ptep_clear_flush() to nuke a hugetlb page
> table when unmapping or migrating a hugetlb page, and will change
> to use huge_ptep_clear_flush() instead in the following patches.
> 
> So this is a preparation patch, which changes the huge_ptep_clear_flush()
> to return the original pte to help to nuke a hugetlb page table.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: Mike Kravetz <mike.kravetz@oracle.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

But one nit below:

[...]
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 8605d7e..61a21af 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5342,7 +5342,7 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
>  		ClearHPageRestoreReserve(new_page);
>  
>  		/* Break COW or unshare */
> -		huge_ptep_clear_flush(vma, haddr, ptep);
> +		(void)huge_ptep_clear_flush(vma, haddr, ptep);

Why add a "(void)" here? Is there any warning if no "(void)"?
IIUC, I think we can remove this, right?

>  		mmu_notifier_invalidate_range(mm, range.start, range.end);
>  		page_remove_rmap(old_page, vma, true);
>  		hugepage_add_new_anon_rmap(new_page, vma, haddr);
> -- 
> 1.8.3.1
> 
> 
