Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2C65A2BC4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 17:56:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDkwD0hkdz3c3L
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 01:56:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BckzJXwo;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BckzJXwo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BckzJXwo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BckzJXwo;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDkvW29ckz3bY8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Aug 2022 01:55:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661529347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kxP+Dmq/9QrBSNE7t25KnXniHyhrvm0D5T7RzuSjQVM=;
	b=BckzJXwoci2ns9E9yfw/86jPHpQKs9xHUuTgB04a61ObWrE/GjkMlfGkizRzrgeLSh6102
	VdSC3T9bWcjGy7OR0WNyWSqiVx2RAs0lCXToLlpNWFoVMEccbDnSOcXLmDFE66DjJo9J91
	N5ugMYbRfRuHR/fSe59qGNfWsRmTfxo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661529347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kxP+Dmq/9QrBSNE7t25KnXniHyhrvm0D5T7RzuSjQVM=;
	b=BckzJXwoci2ns9E9yfw/86jPHpQKs9xHUuTgB04a61ObWrE/GjkMlfGkizRzrgeLSh6102
	VdSC3T9bWcjGy7OR0WNyWSqiVx2RAs0lCXToLlpNWFoVMEccbDnSOcXLmDFE66DjJo9J91
	N5ugMYbRfRuHR/fSe59qGNfWsRmTfxo=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-388-7kWXdYmXNSe1JPImNPWPPQ-1; Fri, 26 Aug 2022 11:55:46 -0400
X-MC-Unique: 7kWXdYmXNSe1JPImNPWPPQ-1
Received: by mail-qt1-f198.google.com with SMTP id i19-20020ac85e53000000b00342f05b902cso1564513qtx.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 08:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=kxP+Dmq/9QrBSNE7t25KnXniHyhrvm0D5T7RzuSjQVM=;
        b=1blZDWnN5Hxv79VZyQCMj/gl7S/MANUR6XTVw4yTWgquPyx2yFEQOCGxHAyluJBKuH
         ofErWUGkBEk0e7eFyOfXeBg6hfQkOes3AGLpv9BwSLOKFNrl63NOybTzsOpLbxTxKmhr
         qYMwXtlYhyX1x5wotdg2SlcEGtLYHT6f7ysrCZigykM5C+mb0v5gm8dPfsMSCvqbwR9p
         +zlw5ml8gH0LTzYVZd06GhjdA65Ia1UEFZtkEI4ZvDbT2gr3OVQ9fZlsX+NqPdM+qTrG
         l2ZH6ZkqnlLK/eDBG0XtRXGoWffHOAIew7Ail8dz+fLmf05yjQYmrACDN9bCyYYaTAep
         eqqg==
X-Gm-Message-State: ACgBeo1ZLuGqTQdcYlpKDn2yKbt0/OgxKullJ/EchgvzPPCa8FYFNLuj
	s4llpE8ZGV8P4P43xECzUggn5x1Sat5D42yjndxQfN91cxjK3YPXlcAwoktZkXoZZpdn36ZCSys
	7SErYzwRmjJuT3MVtT5HnIRCoQw==
X-Received: by 2002:a05:620a:4549:b0:6bb:bcd5:bebd with SMTP id u9-20020a05620a454900b006bbbcd5bebdmr237497qkp.281.1661529345629;
        Fri, 26 Aug 2022 08:55:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7ptvaOj1PH8113xcy+IwXkhfYIf0njU7CP9Dg6jANrLlzn5ahE+pvxpqeln6UJrgFHbun7Bg==
X-Received: by 2002:a05:620a:4549:b0:6bb:bcd5:bebd with SMTP id u9-20020a05620a454900b006bbbcd5bebdmr237473qkp.281.1661529345399;
        Fri, 26 Aug 2022 08:55:45 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id y6-20020a05620a25c600b006b59f02224asm2017524qko.60.2022.08.26.08.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 08:55:44 -0700 (PDT)
Date: Fri, 26 Aug 2022 11:55:42 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 2/3] mm/migrate_device.c: Copy pte dirty bit to page
Message-ID: <Ywjs/i4kIVlxZwpb@xz-m1.local>
References: <3b01af093515ce2960ac39bb16ff77473150d179.1661309831.git-series.apopple@nvidia.com>
 <ffbc824af5daa2c44b91c66834a341894fba4ce6.1661309831.git-series.apopple@nvidia.com>
 <YwZGHyYJiJ+CGLn2@xz-m1.local>
 <8735dkeyyg.fsf@nvdebian.thelocal>
 <YwgFRLn43+U/hxwt@xz-m1.local>
 <8735dj7qwb.fsf@nvdebian.thelocal>
 <YwjZamk4n/dz+Y/M@xz-m1.local>
 <72146725-3d70-0427-50d4-165283a5a85d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <72146725-3d70-0427-50d4-165283a5a85d@redhat.com>
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Huang Ying <ying.huang@intel.com>, Ralph Campbell <rcampbell@nvidia.com>, linuxppc-dev@lists.ozlabs.org, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alistair Popple <apopple@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 26, 2022 at 04:47:22PM +0200, David Hildenbrand wrote:
> > To me anon exclusive only shows this mm exclusively owns this page. I
> > didn't quickly figure out why that requires different handling on tlb
> > flushs.  Did I perhaps miss something?
> 
> GUP-fast is the magic bit, we have to make sure that we won't see new
> GUP pins, thus the TLB flush.
> 
> include/linux/mm.h:gup_must_unshare() contains documentation.

Hmm.. Shouldn't ptep_get_and_clear() (e.g., xchg() on x86_64) already
guarantees that no other process/thread will see this pte anymore
afterwards?

-- 
Peter Xu

