Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5101A4A47
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 21:19:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zSWN5WcVzDrCW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Apr 2020 05:19:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=peterx@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=gmVjI/VE; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zSRg2lHRzDr0v
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 05:16:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586546180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cv7iW9UAPEbptJQ7pxTuJ8mpCyBB8TXm9+xjBE0kLBw=;
 b=gmVjI/VETuwYAeYbrArpbQTmnjIYLVEW3o7HoX6keMIWotqjUhdnMrVum7SuOgzN5/w3AQ
 sIszYe5UdlmQHn7j1D9yv+xcgsOsAQEA5EuxDUh+Aj+fnNYozxVis3pL0l2rr9w08jTM9Y
 oMFH0FFjglivJtBA/Jdn6V+LYFJPdVQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-C2iEV-3mMtSKXE2qDoN2uQ-1; Fri, 10 Apr 2020 15:16:17 -0400
X-MC-Unique: C2iEV-3mMtSKXE2qDoN2uQ-1
Received: by mail-qv1-f71.google.com with SMTP id m5so2416210qvy.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 12:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mwSL4Svde7cDyREN44P4y94Qc6dx9Sv2bNY13UCrEho=;
 b=nhBAF2utt5OrdBriZSb1B9oUhfPNpP57QqNI7DMtgxWPb9cWouXt2S8FpYG1oNL6js
 5hNTAFd/zda5h2oawBc0yB56l67gq4En7At+GRkr7UpnSIFll9/KM/iUI1uN2I0NA3ZG
 VSGJm3CXJX+zMJ7nUb2hmiElgSMW5AjuENxb2Y9rD5SwoXp6/XkBcZVK1Ks6fJIkt5tC
 IsGiFkwmH023skAbFpTD1/pW0++sDqmXteRaNFbE0d+D7SLLHcrolH/vQNYxhSWEeunR
 gu8nYMjCvUy67ZhIzNsO5y3P8HkjZVdQGRKUlFjbXqVi/c3WH+RNo32KmbCXYufE8uRL
 /YGw==
X-Gm-Message-State: AGi0PubkvRqTfG5Pw/ba+pYr0FcYQj/0X8PNGkwrxrMe/28jFIiAAkrz
 Dvrg+1vetfbGMmlcZ6LpJs/ZsIJ5G1uGdhT+lzSGHcJE+3YQIrD77D6sZY1IKLXC8FLjZ18FxaO
 dgeJLwDwd/wzia1SphSKANhPrRA==
X-Received: by 2002:a05:620a:89d:: with SMTP id
 b29mr5792243qka.329.1586546177445; 
 Fri, 10 Apr 2020 12:16:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypLiuHO8rQfrWs/w6IUs43Srn34pCDFpZie/ieWUpJNT3bX04my6S/Xtwb+5j5ZmCFgzwIqbpg==
X-Received: by 2002:a05:620a:89d:: with SMTP id
 b29mr5792202qka.329.1586546177111; 
 Fri, 10 Apr 2020 12:16:17 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id b13sm1590230qtp.46.2020.04.10.12.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 12:16:16 -0700 (PDT)
Date: Fri, 10 Apr 2020 15:16:13 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v2 1/4] hugetlbfs: add arch_hugetlb_valid_size
Message-ID: <20200410191613.GD3172@xz-x1>
References: <20200401183819.20647-1-mike.kravetz@oracle.com>
 <20200401183819.20647-2-mike.kravetz@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20200401183819.20647-2-mike.kravetz@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Mina Almasry <almasrymina@google.com>, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Longpeng <longpeng2@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 01, 2020 at 11:38:16AM -0700, Mike Kravetz wrote:
> diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hu=
getlb.h
> index 2eb6c234d594..81606223494f 100644
> --- a/arch/arm64/include/asm/hugetlb.h
> +++ b/arch/arm64/include/asm/hugetlb.h
> @@ -59,6 +59,8 @@ extern void huge_pte_clear(struct mm_struct *mm, unsign=
ed long addr,
>  extern void set_huge_swap_pte_at(struct mm_struct *mm, unsigned long add=
r,
>  =09=09=09=09 pte_t *ptep, pte_t pte, unsigned long sz);
>  #define set_huge_swap_pte_at set_huge_swap_pte_at
> +bool __init arch_hugetlb_valid_size(unsigned long size);
> +#define arch_hugetlb_valid_size arch_hugetlb_valid_size

Sorry for chimming in late.

Since we're working on removing arch-dependent codes after all.. I'm
thinking whether we can define arch_hugetlb_valid_size() once in the
common header (e.g. linux/hugetlb.h), then in mm/hugetlb.c:

bool __init __attribute((weak)) arch_hugetlb_valid_size(unsigned long size)
{
=09return size =3D=3D HPAGE_SIZE;
}

We can simply redefine arch_hugetlb_valid_size() in arch specific C
files where we want to override the default.  Would that be slightly
cleaner?

Thanks,

--=20
Peter Xu

