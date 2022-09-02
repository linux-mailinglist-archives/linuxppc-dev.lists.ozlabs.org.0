Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F5C5AA855
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 08:52:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJpWF4VvGz3bYy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 16:52:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M39p2jX9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IezG0HVO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M39p2jX9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IezG0HVO;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJpVV0xhLz2xZB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 16:51:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662101501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CzecCuEjT8bsZhw/7187r3Lof871WwEw17oDlg4yQ4A=;
	b=M39p2jX9umo6JXc7ITsHX2F5CIEA7TNM++oFldvpkoE88dJ1/NpRLbC7a/cQEoOBzXKmeW
	c7WxR5yTzkkBNnm2mg6j1l5LdsrMbeKg5Jzlvr2R61MUobLperw2jdsjKhvEVT+k5ugbTK
	Es3wE2rQLyb+7Yp7Pp0L0OWqopc8uPw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662101502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CzecCuEjT8bsZhw/7187r3Lof871WwEw17oDlg4yQ4A=;
	b=IezG0HVO2RqXOxrxfKSMgy7SKNdmDLPHigFxRvpu0XD2eRq/kKN/Xosq0eUPpBb0FUMqia
	qG46JOgys6EZpWRouFaWOsyl8rlnY05aLicR76rLCSosXZm/MeR/a6VU14M9dQRJKyAOEY
	0CZ3V2b0gUT2AqB5kEIs3p1igRyM2RA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-230-Yh9nMVe1OT-xGZV8wF0t6A-1; Fri, 02 Sep 2022 02:51:38 -0400
X-MC-Unique: Yh9nMVe1OT-xGZV8wF0t6A-1
Received: by mail-wm1-f72.google.com with SMTP id j3-20020a05600c1c0300b003a5e72421c2so3417993wms.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 23:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=CzecCuEjT8bsZhw/7187r3Lof871WwEw17oDlg4yQ4A=;
        b=0QMciMQJPaBZYiap/A1x8eiRGl+F3Ev9yZBi8x7d4XX9KkeS6G3aXcc5s5Fc/9h+f2
         T8PbNmbUqQuM6w4SZfwzAOg5kVPT1GE16rtXMu9GRe6tdYbJCUwAsUuWD0cWvOAYlqCU
         m1bepQDVtME+h054l1oEW+7S3yJbXhPc5rrjpc/jsIt9k3qfigJg0rcn7rsM34JQq0h4
         jL9ChCdmTBXlwjBc23vhBWsbQDOk6uNuxUR3XGMFyolOg+I7rwnQoQmhfF5GjgZN7mvB
         +Ap/bcqH4MT2Rj/oEcmeIiwu+RZXqHzYM2WOpeJrDOkAzhMSbE0or2d9hbSTPsmjgGMq
         MlXA==
X-Gm-Message-State: ACgBeo0JadmslY9tDCeK9eWkLo/Hb05oG+Mc+0uCThHbdemSSoYORSE+
	070MQLFaRDPzxbka3vUyb4DxLCQXrpOEgzlTPPlGuJv2dR9ekgaTDeyv35hFW0bOPVtcp+xodkS
	ghzj+HqFEnT88Dz3/5KxnOvV0+A==
X-Received: by 2002:a5d:5a82:0:b0:224:f744:1799 with SMTP id bp2-20020a5d5a82000000b00224f7441799mr16343586wrb.582.1662101497174;
        Thu, 01 Sep 2022 23:51:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6iZBZuSEIjazOLEKCa9lgC4RY/uchGV2EbWYG93tx8iwY/c8Hx5sRdwdAfHdsyv+pj+sX/bA==
X-Received: by 2002:a5d:5a82:0:b0:224:f744:1799 with SMTP id bp2-20020a5d5a82000000b00224f7441799mr16343574wrb.582.1662101496869;
        Thu, 01 Sep 2022 23:51:36 -0700 (PDT)
Received: from ?IPV6:2003:cb:c714:4800:2077:1bf6:40e7:2833? (p200300cbc714480020771bf640e72833.dip0.t-ipconnect.de. [2003:cb:c714:4800:2077:1bf6:40e7:2833])
        by smtp.gmail.com with ESMTPSA id x1-20020a5d6b41000000b002250c35826dsm727061wrw.104.2022.09.01.23.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 23:51:36 -0700 (PDT)
Message-ID: <cdca9b14-18fc-8cf2-5139-49a397098380@redhat.com>
Date: Fri, 2 Sep 2022 08:51:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 2/4] mm/migrate_device.c: Add missing
 flush_cache_page()
To: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <9f801e9d8d830408f2ca27821f606e09aa856899.1662078528.git-series.apopple@nvidia.com>
 <5676f30436ab71d1a587ac73f835ed8bd2113ff5.1662078528.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <5676f30436ab71d1a587ac73f835ed8bd2113ff5.1662078528.git-series.apopple@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, Logan Gunthorpe <logang@deltatee.com>, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, huang ying <huang.ying.caritas@gmail.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02.09.22 02:35, Alistair Popple wrote:
> Currently we only call flush_cache_page() for the anon_exclusive case,
> however in both cases we clear the pte so should flush the cache.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Fixes: 8c3328f1f36a ("mm/migrate: migrate_vma() unmap page from vma while collecting pages")
> Cc: stable@vger.kernel.org
> 
> ---
> 
> New for v4
> ---
>  mm/migrate_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 6a5ef9f..4cc849c 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -193,9 +193,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			bool anon_exclusive;
>  			pte_t swp_pte;
>  
> +			flush_cache_page(vma, addr, pte_pfn(*ptep));
>  			anon_exclusive = PageAnon(page) && PageAnonExclusive(page);
>  			if (anon_exclusive) {
> -				flush_cache_page(vma, addr, pte_pfn(*ptep));
>  				ptep_clear_flush(vma, addr, ptep);
>  
>  				if (page_try_share_anon_rmap(page)) {

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

