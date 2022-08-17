Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A50B259766A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 21:28:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7J2r5hkBz3c4w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 05:28:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vo6lxKbU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LhXxvkaQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vo6lxKbU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LhXxvkaQ;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7J255qXSz3bYy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 05:27:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660764456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dmDD/m9rVXOHRexADGf5nUOz3ccETHTRAhO5DzNVEqY=;
	b=Vo6lxKbULmO4EZRaY9c+k593rH5sBqkgmKWt3KWqHdRPc9QTx+l6vqNt2SE23NheogGZCn
	cKSZ3AvwVrK0GPj6ww8WMqhWgGK+IaJUOsH/y/0TltbRs3rOq/EVTbiQosIRdiik9KVgAY
	27RKhKFNR/T94D/tJm4TydSw6xsAsMA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660764457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dmDD/m9rVXOHRexADGf5nUOz3ccETHTRAhO5DzNVEqY=;
	b=LhXxvkaQoXR/cOslQY/HfoLNDHK/L6dD2VKtfJowjGa0Su/5pmenEUCgzEzBk0pbQ7HFAi
	tzG46nCjNWPYyvB9aWGuCftWKP7cVGFel0usGXHz4gRmahkGPF19VcOwe6RlOtistbDCju
	OLObvUimKih6QKjsSGYJqhex45BB9Dg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-GNk_GaVxNHyUOLQszyFJ1w-1; Wed, 17 Aug 2022 15:27:35 -0400
X-MC-Unique: GNk_GaVxNHyUOLQszyFJ1w-1
Received: by mail-qt1-f199.google.com with SMTP id o22-20020ac85a56000000b0034481129ce6so1997834qta.19
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 12:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=dmDD/m9rVXOHRexADGf5nUOz3ccETHTRAhO5DzNVEqY=;
        b=h+q0USdiRJf0BOwGR90Uaehk1GUL/dnylS7uUHmvN7xBMUlrwiq8augGLnle/P8hGt
         QgJ3mF4CDAaPTd7FevzYAYb/zjUjPKbxQQFYD+OjRxqjX7xnGOz4cnKTas47N7AlX9mC
         pZ7OScxvf4hiSnRobsTXAv8A80wSYGAnhh/wUKggefke1eNmVW0b+5bVWfNWLD2oa3vq
         sUnt4ty1xsHQ0UNsoyB79D+hoIO4OZ6obMa6uexKAXSiweuLrsmAxX2PO0ZX3LeDvl7k
         pvbgoqF7NbzWfwXMUg8vOJDLJaJgy1pmZBO7ZydoL9tx351PtjMy/eSHAtg1tHuLc0l3
         LCFg==
X-Gm-Message-State: ACgBeo2p8zOtgg++y2jjCyn75CtEhnvKG2VdfdCaF9Y94QX732k8lVLk
	PCjWX5RO37gyIb997gNKOsUhpejrngyg76PfwMmI9ngqclWlfw07Vwv3vinBaUi0SnOh1aRDPPS
	VrwZdz7p1zjzF6iZh3sAmzgIsgA==
X-Received: by 2002:a05:6214:b6c:b0:476:8321:db81 with SMTP id ey12-20020a0562140b6c00b004768321db81mr23492944qvb.100.1660764455111;
        Wed, 17 Aug 2022 12:27:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6vqYZw2nSP0al2QOlYxSI+caDpn668z2wTq0sUdA1GVvZZhov4a4lSRj3rYF0hmqY4tBw2Ng==
X-Received: by 2002:a05:6214:b6c:b0:476:8321:db81 with SMTP id ey12-20020a0562140b6c00b004768321db81mr23492907qvb.100.1660764454794;
        Wed, 17 Aug 2022 12:27:34 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id bj38-20020a05620a192600b006bb5cdd4031sm5016365qkb.40.2022.08.17.12.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 12:27:34 -0700 (PDT)
Date: Wed, 17 Aug 2022 15:27:32 -0400
From: Peter Xu <peterx@redhat.com>
To: Nadav Amit <nadav.amit@gmail.com>
Subject: Re: [PATCH v2 1/2] mm/migrate_device.c: Copy pte dirty bit to page
Message-ID: <Yv1BJKb5he3dOHdC@xz-m1.local>
References: <6e77914685ede036c419fa65b6adc27f25a6c3e9.1660635033.git-series.apopple@nvidia.com>
 <CAC=cRTPGiXWjk=CYnCrhJnLx3mdkGDXZpvApo6yTbeW7+ZGajA@mail.gmail.com>
 <Yvv/eGfi3LW8WxPZ@xz-m1.local>
 <871qtfvdlw.fsf@nvdebian.thelocal>
 <YvxWUY9eafFJ27ef@xz-m1.local>
 <87o7wjtn2g.fsf@nvdebian.thelocal>
 <87tu6bbaq7.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <1D2FB37E-831B-445E-ADDC-C1D3FF0425C1@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1D2FB37E-831B-445E-ADDC-C1D3FF0425C1@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, linuxppc-dev@lists.ozlabs.org, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alistair Popple <apopple@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Linux MM <linux-mm@kvack.org>, Logan Gunthorpe <logang@deltatee.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, "Huang, Ying" <ying.huang@intel.com>, stable@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, huang ying <huang.ying.caritas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 17, 2022 at 02:41:19AM -0700, Nadav Amit wrote:
> 4. Having multiple TLB flushing infrastructures makes all of these
> discussions very complicated and unmaintainable. I need to convince myself
> in every occasion (including this one) whether calls to
> flush_tlb_batched_pending() and tlb_flush_pending() are needed or not.
> 
> What I would like to have [3] is a single infrastructure that gets a
> “ticket” (generation when the batching started), the old PTE and the new PTE
> and checks whether a TLB flush is needed based on the arch behavior and the
> current TLB generation. If needed, it would update the “ticket” to the new
> generation. Andy wanted a ring for pending TLB flushes, but I think it is an
> overkill with more overhead and complexity than needed.
> 
> But the current situation in which every TLB flush is a basis for long
> discussions and prone to bugs is impossible.
> 
> I hope it helps. Let me know if you want me to revive the patch-set or other
> feedback.
> 
> [1] https://lore.kernel.org/all/20220711034615.482895-5-21cnbao@gmail.com/
> [2] https://lore.kernel.org/all/20220718120212.3180-13-namit@vmware.com/
> [3] https://lore.kernel.org/all/20210131001132.3368247-16-namit@vmware.com/

I need more reading on tlb code and also [3] which looks useful to me.
It's definitely sad to make tlb flushing so complicated.  It'll be great if
things can be sorted out someday.

In this specific case, the only way to do safe tlb batching in my mind is:

	pte_offset_map_lock();
	arch_enter_lazy_mmu_mode();
        // If any pending tlb, do it now
        if (mm_tlb_flush_pending())
		flush_tlb_range(vma, start, end);
        else
                flush_tlb_batched_pending();
        loop {
                ...
                pte = ptep_get_and_clear();
                ...
                if (pte_present())
                        unmapped++;
                ...
        }
	if (unmapped)
		flush_tlb_range(walk->vma, start, end);
	arch_leave_lazy_mmu_mode();
	pte_unmap_unlock();

I may miss something, but even if not it already doesn't look pretty.

Thanks,

-- 
Peter Xu

