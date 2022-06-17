Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF954F900
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 16:16:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPh166Db7z3cfH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 00:16:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yx70f3IZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yx70f3IZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yx70f3IZ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yx70f3IZ;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPh0M3rrcz3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 00:15:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655475340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=45WsYeBZBgVP+tO+Yp5wRnejBKTYaIp3okpekaDuC30=;
	b=Yx70f3IZl3hchqt9SNW5eda6c6igfIqTwXKF1IQX8MZJeWwbTSbufptwtKQNY/xL/jb+Co
	F1U4ccllBU/kTN5QyJwv79G0KH6FVQgesX1pCP+cs0+vMrZGVsEWhV/R8B/0iuTduuJSuU
	ViyIcMWbjiOfDPM0LQ7kcuh3SNVwYO4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655475340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=45WsYeBZBgVP+tO+Yp5wRnejBKTYaIp3okpekaDuC30=;
	b=Yx70f3IZl3hchqt9SNW5eda6c6igfIqTwXKF1IQX8MZJeWwbTSbufptwtKQNY/xL/jb+Co
	F1U4ccllBU/kTN5QyJwv79G0KH6FVQgesX1pCP+cs0+vMrZGVsEWhV/R8B/0iuTduuJSuU
	ViyIcMWbjiOfDPM0LQ7kcuh3SNVwYO4=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-2xiCX0ZuM2O2h4IvVV2CJw-1; Fri, 17 Jun 2022 10:15:38 -0400
X-MC-Unique: 2xiCX0ZuM2O2h4IvVV2CJw-1
Received: by mail-il1-f199.google.com with SMTP id a2-20020a923302000000b002d1ad5053feso2720509ilf.17
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 07:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=45WsYeBZBgVP+tO+Yp5wRnejBKTYaIp3okpekaDuC30=;
        b=fz4JonxinsalL+qLVcvi5NWEZmrCBLv+OHnSG01CWh7B/UYpwEks/D8slLc7NXLnw/
         Hv7SIsMA21ymhAhV2AthRzC8r8Cp8yHkSErHClz/KWOPDL2BTslpKpRA/wAoHU14NgeF
         HJ2lhYGVZ+C0Sr55KXrNiRCLcZMb+06PDVY0/JeUe+YoqJjkuLqW4V7/vBZZS6/IoJ5/
         b2RVleXlNZj+qB9f8RPEF4IyYsgOOAHoUPnZI4YnvfUrLc+8BSktgym+/TQlMdyO6cEZ
         zdCf2LrchC4LDqlepU5OJXDbx04vIe5KNg7HbYBCSrZCVsuCP7ZzemGhtrGcbvqOJ3A7
         ZddQ==
X-Gm-Message-State: AJIora+HB7KazVR1lZ/PUwf/SEc6K75snHZIjQIkEnPcyBFYkktUGDlb
	koYj+NqNMdmsV28pr7tszlqVi+svW5n9RJXi0Df1I9nl3D1LVu8NUbnqFHxIMlXqw9LHdjuYSPF
	a1r8aMO66cCM0XeU8JGzThB4QXw==
X-Received: by 2002:a92:da4c:0:b0:2d5:4942:151c with SMTP id p12-20020a92da4c000000b002d54942151cmr5595295ilq.54.1655475337979;
        Fri, 17 Jun 2022 07:15:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t5+pBPw8qcp/W9vVk3R5y0UpR770R+5zi051+5lmo73AcdTcYx/JcpFCItROcYKy2t53b2mA==
X-Received: by 2002:a92:da4c:0:b0:2d5:4942:151c with SMTP id p12-20020a92da4c000000b002d54942151cmr5595259ilq.54.1655475337682;
        Fri, 17 Jun 2022 07:15:37 -0700 (PDT)
Received: from xz-m1.local (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
        by smtp.gmail.com with ESMTPSA id h22-20020a02c736000000b0033792143bf5sm649986jao.67.2022.06.17.07.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 07:15:36 -0700 (PDT)
Date: Fri, 17 Jun 2022 10:15:34 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH 1/4] hugetlb: skip to end of PT page mapping when pte not
 present
Message-ID: <YqyMhmAjrQ4C+EyA@xz-m1.local>
References: <20220616210518.125287-1-mike.kravetz@oracle.com>
 <20220616210518.125287-2-mike.kravetz@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20220616210518.125287-2-mike.kravetz@oracle.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Michal Hocko <mhocko@suse.com>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, catalin.marinas@arm.com, Muchun Song <songmuchun@bytedance.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, James Houghton <jthoughton@google.com>, sparclinux@vger.kernel.org, will@kernel.org, Mina Almasry <almasrymina@google.com>, linux-s390@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>, Naoya Horiguchi <naoya.horiguchi@linux.dev>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Mike,

On Thu, Jun 16, 2022 at 02:05:15PM -0700, Mike Kravetz wrote:
> @@ -6877,6 +6896,39 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
>  	return (pte_t *)pmd;
>  }
>  
> +/*
> + * Return a mask that can be used to update an address to the last huge
> + * page in a page table page mapping size.  Used to skip non-present
> + * page table entries when linearly scanning address ranges.  Architectures
> + * with unique huge page to page table relationships can define their own
> + * version of this routine.
> + */
> +unsigned long hugetlb_mask_last_page(struct hstate *h)
> +{
> +	unsigned long hp_size = huge_page_size(h);
> +
> +	switch (hp_size) {
> +	case P4D_SIZE:
> +		return PGDIR_SIZE - P4D_SIZE;
> +	case PUD_SIZE:
> +		return P4D_SIZE - PUD_SIZE;
> +	case PMD_SIZE:
> +		return PUD_SIZE - PMD_SIZE;
> +	default:

Should we add a WARN_ON_ONCE() if it should never trigger?

> +		break; /* Should never happen */
> +	}
> +
> +	return ~(0UL);
> +}
> +
> +#else
> +
> +/* See description above.  Architectures can provide their own version. */
> +__weak unsigned long hugetlb_mask_last_page(struct hstate *h)
> +{
> +	return ~(0UL);

I'm wondering whether it's better to return 0 rather than ~0 by default.
Could an arch with !CONFIG_ARCH_WANT_GENERAL_HUGETLB wrongly skip some
valid address ranges with ~0, or perhaps I misread?

Thanks,

-- 
Peter Xu

