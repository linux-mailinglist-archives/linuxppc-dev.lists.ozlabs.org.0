Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4813B821772
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 06:40:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VSi8N1Hl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VSi8N1Hl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T41sd0FX1z3bnv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 16:40:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VSi8N1Hl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VSi8N1Hl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T41rn3yLjz2xQG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jan 2024 16:39:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704173990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bbq0KObq2f8j+82pUN4AGj7eg3qIjhtUEVS9ATEV+Oo=;
	b=VSi8N1Hlec/TepJlaoQRz+NuUZH16sm1efSRNwEAa/HbBvNmy6+MLfKOzdAQv/8cJKOo0L
	ge4KTeeIBCTGPMtHscApBLxomVXGOqnIPAydpGzwWQ+QMRwg54Z34ft5KEPnYIVmJHlg5w
	dgbj5y8lXW/sIEmDP+sQYGBeRTKspiA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704173990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bbq0KObq2f8j+82pUN4AGj7eg3qIjhtUEVS9ATEV+Oo=;
	b=VSi8N1Hlec/TepJlaoQRz+NuUZH16sm1efSRNwEAa/HbBvNmy6+MLfKOzdAQv/8cJKOo0L
	ge4KTeeIBCTGPMtHscApBLxomVXGOqnIPAydpGzwWQ+QMRwg54Z34ft5KEPnYIVmJHlg5w
	dgbj5y8lXW/sIEmDP+sQYGBeRTKspiA=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-pYp3SftzPYuKZHZqMGIWlg-1; Tue, 02 Jan 2024 00:39:48 -0500
X-MC-Unique: pYp3SftzPYuKZHZqMGIWlg-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-28cd3046fd8so494631a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jan 2024 21:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704173987; x=1704778787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbq0KObq2f8j+82pUN4AGj7eg3qIjhtUEVS9ATEV+Oo=;
        b=QmOnut9KtA01quxGEXO2ZmwTUecV+arrXv4f3IVktJinWWCGfWZj9QWdcjZUIdGcGy
         sXGREtFcQzIN7R9TW3B9yOeHLGtZJkXArN30Pms7m6pF7S/XZN6FEgCjDphya4AMm0yq
         ua5tHFoYCjG+CQgNsucZEa7GTlXwL+bZAMLHyPOg660si8PwOOvAngepfzKYkqCeva0p
         Mk4wxNlvgCNfophPnVNe4o+W3GS1Fx+hYoHmHZrkf5xwDZTgYcRX28clT99h44X01OD9
         Hh79X1j7/5Rrris/qwBCh7olkETwxdVfrlG9nev5uomWU2XPulcLMFvJRdxMDhQwBQEe
         h5Xg==
X-Gm-Message-State: AOJu0YzBdQQxf2tpXOnIeIX1cMtEf/QsiDAdHWp/SUZrDRZ+H4Q5jQqE
	JpKRQ+G7gkqPgd1CGMIzJV4RTJ1Yeg5Mx0m9/PQKGsJA+5P1H9lS1KRl0Bns6OXMCYyGwiHRla3
	oVOlvgt0gat9HTgXvkoephWoaEHofhEZIpQ==
X-Received: by 2002:a17:90a:a589:b0:28b:bd2d:f924 with SMTP id b9-20020a17090aa58900b0028bbd2df924mr24809557pjq.2.1704173987592;
        Mon, 01 Jan 2024 21:39:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuR1t3QCDF99soHy376+nbiN/c3MDqPEKDqcI+XWwTDxY2xbRtvWRrTvKfEHzNP7Fpwq1DzQ==
X-Received: by 2002:a17:90a:a589:b0:28b:bd2d:f924 with SMTP id b9-20020a17090aa58900b0028bbd2df924mr24809540pjq.2.1704173987309;
        Mon, 01 Jan 2024 21:39:47 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id lt24-20020a17090b355800b0028cb445ade2sm6857199pjb.16.2024.01.01.21.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 21:39:46 -0800 (PST)
Date: Tue, 2 Jan 2024 13:39:32 +0800
From: Peter Xu <peterx@redhat.com>
To: Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH 05/13] mm: Introduce vma_pgtable_walk_{begin|end}()
Message-ID: <ZZOhlB-KK4hF3PgY@x1n>
References: <20231219075538.414708-1-peterx@redhat.com>
 <20231219075538.414708-6-peterx@redhat.com>
 <0D9E28F4-AFA8-479C-8311-093DAFD9DF41@linux.dev>
MIME-Version: 1.0
In-Reply-To: <0D9E28F4-AFA8-479C-8311-093DAFD9DF41@linux.dev>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Linux-MM <linux-mm@kvack.org>, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 25, 2023 at 02:34:48PM +0800, Muchun Song wrote:
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>

You're using the old email address here.  Do you want me to also use the
linux.dev one that you suggested me to use?

-- 
Peter Xu

