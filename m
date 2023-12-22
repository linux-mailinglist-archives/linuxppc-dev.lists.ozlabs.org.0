Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E3081C2D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 02:36:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YIGN3i3U;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YIGN3i3U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sx8zP4MTlz3cbd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 12:36:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YIGN3i3U;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YIGN3i3U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sx8yX6NcMz30YL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 12:36:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703208959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2akJnTxfKkE9MplltMUxeeJDEmgi/IaQGIuEfCeumQQ=;
	b=YIGN3i3Ud3EPgN/1HeZsnfkSnyuKZ9BjyPcaTp7K544XYFN8h6sC27DUXhkz5RQlgagpGv
	s3MQimlXFR5rRiBLOPevHRrRBxHy1As1yglULOqPV7BLAebrywmxa8VjVh0sKvrhlVZCY1
	i1DidW3OynKFMp8Sigo5JLqn7flGdeA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703208959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2akJnTxfKkE9MplltMUxeeJDEmgi/IaQGIuEfCeumQQ=;
	b=YIGN3i3Ud3EPgN/1HeZsnfkSnyuKZ9BjyPcaTp7K544XYFN8h6sC27DUXhkz5RQlgagpGv
	s3MQimlXFR5rRiBLOPevHRrRBxHy1As1yglULOqPV7BLAebrywmxa8VjVh0sKvrhlVZCY1
	i1DidW3OynKFMp8Sigo5JLqn7flGdeA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-Fqd5wESOPk22Fy8zhlmQWQ-1; Thu, 21 Dec 2023 20:35:57 -0500
X-MC-Unique: Fqd5wESOPk22Fy8zhlmQWQ-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-28bc1adb0c0so418319a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 17:35:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703208956; x=1703813756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2akJnTxfKkE9MplltMUxeeJDEmgi/IaQGIuEfCeumQQ=;
        b=e6rH9QGg5tMoE1GECRcFrxmF4oAbjvKZoCDGqcT4VVKRJ9GVwu191SBDV4aOoiCDBQ
         UqVG+Tltd+TwXRtGhfwkAgqEAqHuqVMhSuIBIdOKFK/uXPV5jYeqX0yEc0lvbeWvIgt+
         Rhep1Icy/Tb2shnsLJRYudxaM0UneR26bI530qE0Hlr4tuORXR4sRDSXD50mv2KtVmmI
         sVnxZApPy5636KyyGOKGhSd/q2tid9OF2QC9SSSpgYra087BOHlr34x7shwGdYZdKKij
         aNoG6ETRb0hQjIb1SFIo9rcqin+hcvPbMBW/jzmSfUD8IgQU1uVnJ2MfTok7wA9k1l/k
         Oteg==
X-Gm-Message-State: AOJu0YxxWtlKZpKTqjsJvK7yNsCTyhNqg2junaUOJXlCfkq/ytT15Fip
	28T/onQyyS54oqftlZuECjKYQHjxGBFcFPlmG3rIPSAEXU6Yz/h98e5t3gga37iNXQMTKjGI91t
	G/1aaCKU5fdT1/vp54LMeUdy/LxPGoGwvFg==
X-Received: by 2002:a17:90a:4b8f:b0:28b:c1ad:9cef with SMTP id i15-20020a17090a4b8f00b0028bc1ad9cefmr1137542pjh.3.1703208956240;
        Thu, 21 Dec 2023 17:35:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1CdzSSxO6gL0EU6CjYH72GBwDyRwTpiPtorA3Dx6OQ9XzFAqCTOZ2ez8iSmfN4CA4vPwFxQ==
X-Received: by 2002:a17:90a:4b8f:b0:28b:c1ad:9cef with SMTP id i15-20020a17090a4b8f00b0028bc1ad9cefmr1137522pjh.3.1703208955962;
        Thu, 21 Dec 2023 17:35:55 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id qc12-20020a17090b288c00b0028b6f522fedsm6308509pjb.43.2023.12.21.17.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 17:35:55 -0800 (PST)
Date: Fri, 22 Dec 2023 09:35:43 +0800
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: Re: [PATCH 00/13] mm/gup: Unify hugetlb, part 2
Message-ID: <ZYTn70CDVeNMed0f@x1n>
References: <20231219075538.414708-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231219075538.414708-1-peterx@redhat.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Copy Muchun, which I forgot since the start, sorry.

-- 
Peter Xu

