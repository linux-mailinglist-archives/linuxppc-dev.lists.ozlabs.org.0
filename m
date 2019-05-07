Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBBA16C89
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 22:47:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zBW53DS3zDqNG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 06:47:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="rqW6lucK"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zBTq3xPyzDq8M
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 06:46:22 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id o39so16289801ota.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 13:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fw0JPQ4oQ07pMZfSEOmqFo0Ax/JNe6lqDNiuIeW+cfk=;
 b=rqW6lucK5GLSkk6D3VC83NNNr3p5l4cDVk4n80Uvm322BBV2qCuKSPr4z+P2ezcoyK
 z+YMgkO0V+5hEmcMr0MwF6O3QHG8xWVY2eTA1Py3k6awm18aqMlPP98eZujqBEdbRRXN
 aS93k1uMcPJFXIHF98HnDfB8WCQgSAWAn+PzoKcCdVTC+uJmNJ+7TTcrUEmBZNFgGikS
 JoN377FDE4nzpHgH/fCwVvnpugUJXF2ApAVZaCrgrLXf7ZjFcE/OLNwmWNUpvbW/wIQU
 Uwg4mKk8U4/mWeh5D1XY1VYZpFjHtv4IPmwLoWQVjBRPrwTp5axa3EA9O5FG/AT874cG
 VNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fw0JPQ4oQ07pMZfSEOmqFo0Ax/JNe6lqDNiuIeW+cfk=;
 b=ltgfflJaoFbezRLOZ4t1d743D3ifgL3klkhmvvAn7qUcq9AoTVzhSQMz4/0sZ4Zfvz
 AmnDVoyrNeAAUudRTslI4bmn5LzfVZLFLrY1c/fG8Mnix4Gxwt+8A7VMU7NIXRqbuWYW
 3IPe9kiVYTHvNSeOHHfI1YPWUT6wfhk6ePbfApVdr3tqHo3dhnOaoL9+7vB4pHGUgFR9
 QPkcm3Af9I4QV4X6Tw96xNYmHw0+EU3q2COpLvI1iJZ0LKJnhIZMJCcEDPw8/8n81WrI
 YHGKU562Vbca+yr0muBl7cmNZbN0Odzzu7ddRrW7i5pwF9ktGblDmuWcpH9hmTmvcrhu
 Pe8A==
X-Gm-Message-State: APjAAAXHEcqn7YUxTitsCRJ7RXXeBptLX4AzyLa7U5j4VOxa6a0nfWin
 yY7bncRYGjR/8R9dLMDbXYkyj+u1qzpuuUkMaMFD7A==
X-Google-Smtp-Source: APXvYqwkL7vHIYJxD+HfiXZUkr4PGh3XR7bd+koUKuRLubXL7y6kGEyKk74Z2RGz0ad/moc44qYziRyn+VmkpRZHHO8=
X-Received: by 2002:a9d:6f19:: with SMTP id n25mr2402081otq.367.1557261979262; 
 Tue, 07 May 2019 13:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190507183804.5512-1-david@redhat.com>
 <20190507183804.5512-3-david@redhat.com>
In-Reply-To: <20190507183804.5512-3-david@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 7 May 2019 13:46:08 -0700
Message-ID: <CAPcyv4gtAMn2mDz0s1GRTJ52MeTK3jJYLQne6MiEx_ipPFUsmA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] s390x/mm: Implement arch_remove_memory()
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Oscar Salvador <osalvador@suse.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Linux-sh <linux-sh@vger.kernel.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 7, 2019 at 11:38 AM David Hildenbrand <david@redhat.com> wrote:
>
> Will come in handy when wanting to handle errors after
> arch_add_memory().
>
> Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Oscar Salvador <osalvador@suse.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/s390/mm/init.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index 31b1071315d7..1e0cbae69f12 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -237,12 +237,13 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  void arch_remove_memory(int nid, u64 start, u64 size,
>                         struct vmem_altmap *altmap)
>  {
> -       /*
> -        * There is no hardware or firmware interface which could trigger a
> -        * hot memory remove on s390. So there is nothing that needs to be
> -        * implemented.
> -        */
> -       BUG();
> +       unsigned long start_pfn = start >> PAGE_SHIFT;
> +       unsigned long nr_pages = size >> PAGE_SHIFT;
> +       struct zone *zone;
> +
> +       zone = page_zone(pfn_to_page(start_pfn));

Does s390 actually support passing in an altmap? If 'yes', I think it
also needs the vmem_altmap_offset() fixup like x86-64:

        /* With altmap the first mapped page is offset from @start */
        if (altmap)
                page += vmem_altmap_offset(altmap);

...but I suspect it does not support altmap since
arch/s390/mm/vmem.c::vmemmap_populate() does not arrange for 'struct
page' capacity to be allocated out of an altmap defined page pool.

I think it would be enough to disallow any arch_add_memory() on s390
where @altmap is non-NULL. At least until s390 gains ZONE_DEVICE
support and can enable the pmem use case.
