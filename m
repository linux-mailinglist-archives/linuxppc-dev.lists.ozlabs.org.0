Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E72A51F32E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 06:07:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxSLS5y32z2yHt
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 14:07:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=7oatG6we;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=songmuchun@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=7oatG6we; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxSKp2yNkz3bck
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 14:06:52 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so11741497pjf.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 May 2022 21:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=i8fTOca+12ZBwL8GFn68r89tRt5Zov30Zcvy0gFIx3s=;
 b=7oatG6weF86vW9pYog/WbnQv4ca5m77rm6XTxoXr1wXD+MeQ64n02aa13Lj0IMGWDh
 0jcAZ1/E8rhHmjwEiLH/wurqHwo7x7/oZPYnCacuSWGecYOh1cK7FR/f3ATgGUHe2XoH
 alZRF5CLU74LfUYGYSIuPW6xCoE9yhYrt5aPGmZHPMFjbnAa5HGvTb+BGlG1lzOEp7hA
 36hA/3+gDs89H4Ko4WXpK9eOIJ7FvaCtE+d5TzIwgk5OffyCSOeBgBkeqs8WGQvukk6n
 Rziui08UqLz3/L11wKnIDNIsOSawBpoleO3JIuQk/5rZjNynFDwVMrI47wZqmUxCKfmZ
 bBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i8fTOca+12ZBwL8GFn68r89tRt5Zov30Zcvy0gFIx3s=;
 b=1qAqaDpcRQAUIvav9kt+e6VJBE++cdpJhOf+CbsvRcnv7a/XLOmg7KEBzAmbMbKLh6
 79viv9nZZp9HXCOsLBaAfpdP2M5VyOLAERCF27KFp75/0g3n+elIUntVQQrKUPRX+yhj
 +PGrfS6FKebVxm8kiEBWY8fYNqPiXlgG+VdmnbcN/X4daelv1o6+b6Rs1S2KF/G+1HiK
 cF9HtiGDPwwUBLP1djjPeARFlhe1Es9J0cJIUCLHFejvaVyoPDXCT5h8wRlRXA/TOGbq
 M5Ict8ZJGcGdE7bRfI+rEK54qF9xghLk3u9Hk3yXKqen/mBGWmqGxnpUH8+WHipKI6mz
 xs2Q==
X-Gm-Message-State: AOAM533z4GGyIV6gL4ULOZjntA74DXICX7Bs7lfsEczr0O4lwP2iVNEK
 C+aJWwJjHy6HLICVnruCjRXnHA==
X-Google-Smtp-Source: ABdhPJzXNNNMoKGLlNS0rEzt5xQj0NLF+6rNIW0g3Nng1UFaP6z9LjY7xwl48st6GzktvUM1QgACdw==
X-Received: by 2002:a17:902:758a:b0:15e:ef4f:fed5 with SMTP id
 j10-20020a170902758a00b0015eef4ffed5mr12919922pll.1.1652069208384; 
 Sun, 08 May 2022 21:06:48 -0700 (PDT)
Received: from localhost ([139.177.225.250]) by smtp.gmail.com with ESMTPSA id
 f4-20020a170902ab8400b0015e8d4eb1f8sm5831321plr.66.2022.05.08.21.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 21:06:47 -0700 (PDT)
Date: Mon, 9 May 2022 12:06:43 +0800
From: Muchun Song <songmuchun@bytedance.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 1/3] mm: change huge_ptep_clear_flush() to return the
 original pte
Message-ID: <YniTU+iT/pV5j/41@FVFYT0MHHV2J.usts.net>
References: <cover.1652002221.git.baolin.wang@linux.alibaba.com>
 <012a484019e7ad77c39deab0af52a6755d8438c8.1652002221.git.baolin.wang@linux.alibaba.com>
 <Ynek+b3k6PVN3x7J@FVFYT0MHHV2J.usts.net>
 <bf627d1a-42f8-77f3-6ac2-67edde2feb8a@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf627d1a-42f8-77f3-6ac2-67edde2feb8a@linux.alibaba.com>
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

On Sun, May 08, 2022 at 09:09:55PM +0800, Baolin Wang wrote:
> 
> 
> On 5/8/2022 7:09 PM, Muchun Song wrote:
> > On Sun, May 08, 2022 at 05:36:39PM +0800, Baolin Wang wrote:
> > > It is incorrect to use ptep_clear_flush() to nuke a hugetlb page
> > > table when unmapping or migrating a hugetlb page, and will change
> > > to use huge_ptep_clear_flush() instead in the following patches.
> > > 
> > > So this is a preparation patch, which changes the huge_ptep_clear_flush()
> > > to return the original pte to help to nuke a hugetlb page table.
> > > 
> > > Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > > Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
> > 
> > Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> 
> Thanks for reviewing.
> 
> > 
> > But one nit below:
> > 
> > [...]
> > > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > > index 8605d7e..61a21af 100644
> > > --- a/mm/hugetlb.c
> > > +++ b/mm/hugetlb.c
> > > @@ -5342,7 +5342,7 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
> > >   		ClearHPageRestoreReserve(new_page);
> > >   		/* Break COW or unshare */
> > > -		huge_ptep_clear_flush(vma, haddr, ptep);
> > > +		(void)huge_ptep_clear_flush(vma, haddr, ptep);
> > 
> > Why add a "(void)" here? Is there any warning if no "(void)"?
> > IIUC, I think we can remove this, right?
> 
> I did not meet any warning without the casting, but this is per Mike's
> comment[1] to make the code consistent with other functions casting to void
> type explicitly in hugetlb.c file.
>

Got it. I see hugetlb.c per this rule, while others do not.
 
> [1]
> https://lore.kernel.org/all/495c4ebe-a5b4-afb6-4cb0-956c1b18d0cc@oracle.com/
> 
