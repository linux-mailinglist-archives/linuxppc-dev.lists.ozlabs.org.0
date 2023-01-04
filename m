Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E894965DA95
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 17:45:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NnFpn68TFz3c7C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 03:45:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WxwgsSgt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WxwgsSgt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WxwgsSgt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WxwgsSgt;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NnFnm4pltz2xZB
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 03:44:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672850694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6EzsGSC3holClBSPQw8EocT+rCm9w6LTUpG8IqXLKaM=;
	b=WxwgsSgtV/aUyKxpMinNBr0WvgK2Zmd8TgA3cR6rxwn+KkF47DkRl6eZrYoRR6BK58TVUu
	2zEeBmdhd58UT4Oxci+Z0hZNMVglItFZJJ5tSvM4l21CAh/KJLxY3ZWEmknr0kb1Z2www/
	CiNvzeKsjuoWnmoZQptFStcyZzh4Z2k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672850694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6EzsGSC3holClBSPQw8EocT+rCm9w6LTUpG8IqXLKaM=;
	b=WxwgsSgtV/aUyKxpMinNBr0WvgK2Zmd8TgA3cR6rxwn+KkF47DkRl6eZrYoRR6BK58TVUu
	2zEeBmdhd58UT4Oxci+Z0hZNMVglItFZJJ5tSvM4l21CAh/KJLxY3ZWEmknr0kb1Z2www/
	CiNvzeKsjuoWnmoZQptFStcyZzh4Z2k=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-228-EylGpGliMaWVDaWVIIGjbQ-1; Wed, 04 Jan 2023 11:44:52 -0500
X-MC-Unique: EylGpGliMaWVDaWVIIGjbQ-1
Received: by mail-qk1-f200.google.com with SMTP id br6-20020a05620a460600b007021e1a5c48so23241424qkb.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Jan 2023 08:44:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EzsGSC3holClBSPQw8EocT+rCm9w6LTUpG8IqXLKaM=;
        b=AesdItF1HYERYdF1rgeZ96E6eXXbA/Vs6h+uCx8E9jPlkxD/obquamvRywD5Ugnrjz
         kg7odhQ3KW5v+E7FHoqaElsxvtBDm1GCz4hrHjyC8BCz3FlTcObq15Nq4BhPwMKEp0cY
         VSpj10SyygLv362wEQywYXaZ9uDwtXb7CvjS9WMGMGxi9Rd8qFiUCikpNnJg5/VF5cY5
         4hfWCBgNpgVt6DaPX6bk7YYPyt0Fz3gr+VjE/1ywXPCsYm1Y3C4OFVEJnw1xL60JPmj4
         v3H8fzTBBW01URVoak2tYcRecAar8tDARJ8yUvYoY5ycUOiwZk+UuKoLfOlpJIAuu1xZ
         DJtg==
X-Gm-Message-State: AFqh2kq1jwrcsNBwNSVxJRIRA8HOD9KuoPm2QJqbundtU6j2g8bwrtk1
	GodkW3d91JQEoYgh6b8W2rHatYs+ljhAh3oNOwgzQ1oAt2BE3UU8BqqCJ7Zbe0CE5+sE+qDpsQM
	CueStCAAygEap3yRWKIWRWtDJmw==
X-Received: by 2002:a05:622a:124b:b0:3ab:7bb3:4707 with SMTP id z11-20020a05622a124b00b003ab7bb34707mr50094164qtx.64.1672850692362;
        Wed, 04 Jan 2023 08:44:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtC6/5x1TZXjNxaTZni/mgmGgEGvHrxdB4Ldf1ggEJ59TT3GmI7MMZ8cyzI4+MP/hbyTOvkqA==
X-Received: by 2002:a05:622a:124b:b0:3ab:7bb3:4707 with SMTP id z11-20020a05622a124b00b003ab7bb34707mr50094133qtx.64.1672850692030;
        Wed, 04 Jan 2023 08:44:52 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-39-70-52-228-144.dsl.bell.ca. [70.52.228.144])
        by smtp.gmail.com with ESMTPSA id u22-20020a05620a455600b006fb112f512csm24300165qkp.74.2023.01.04.08.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 08:44:51 -0800 (PST)
Date: Wed, 4 Jan 2023 11:44:49 -0500
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH] mm: remove zap_page_range and create zap_vma_pages
Message-ID: <Y7WtAXpZM3Mxi95N@x1n>
References: <20230104002732.232573-1-mike.kravetz@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20230104002732.232573-1-mike.kravetz@oracle.com>
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
Cc: Christian Brauner <brauner@kernel.org>, linux-s390@vger.kernel.org, Nadav Amit <nadav.amit@gmail.com>, Michal Hocko <mhocko@suse.com>, Will Deacon <will@kernel.org>, David Hildenbrand <david@redhat.com>, netdev@vger.kernel.org, Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-riscv@lists.infradead.org, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 03, 2023 at 04:27:32PM -0800, Mike Kravetz wrote:
> zap_page_range was originally designed to unmap pages within an address
> range that could span multiple vmas.  While working on [1], it was
> discovered that all callers of zap_page_range pass a range entirely within
> a single vma.  In addition, the mmu notification call within zap_page
> range does not correctly handle ranges that span multiple vmas.  When
> crossing a vma boundary, a new mmu_notifier_range_init/end call pair
> with the new vma should be made.
> 
> Instead of fixing zap_page_range, do the following:
> - Create a new routine zap_vma_pages() that will remove all pages within
>   the passed vma.  Most users of zap_page_range pass the entire vma and
>   can use this new routine.
> - For callers of zap_page_range not passing the entire vma, instead call
>   zap_page_range_single().
> - Remove zap_page_range.
> 
> [1] https://lore.kernel.org/linux-mm/20221114235507.294320-2-mike.kravetz@oracle.com/
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

