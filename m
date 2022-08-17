Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA7E597638
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 21:07:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7HbK3bpXz3cd4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Aug 2022 05:07:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bOpMmpal;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bOpMmpal;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bOpMmpal;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bOpMmpal;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7HZd0djRz2ynh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Aug 2022 05:07:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660763234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ABSmkuZfQM3Y1mClHJcPhcabJ5jPBDhGKX1+BXsp40=;
	b=bOpMmpalmxY27DxwQzhs9Ki6RV9jt+Fe5TAKDRZAZz7FvyCCTtzuGiUTSjFaRQwD3OtVsa
	NSAf3XEkAsUKCbBG7DM8VcvTDyvg0DX/GJ+0YGEH9Q7mIrA7s5Qww+5Q0ME5zxZY5llXYQ
	MuqdeO0DxdJsY0OgTXNrz7AOZtncng0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660763234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5ABSmkuZfQM3Y1mClHJcPhcabJ5jPBDhGKX1+BXsp40=;
	b=bOpMmpalmxY27DxwQzhs9Ki6RV9jt+Fe5TAKDRZAZz7FvyCCTtzuGiUTSjFaRQwD3OtVsa
	NSAf3XEkAsUKCbBG7DM8VcvTDyvg0DX/GJ+0YGEH9Q7mIrA7s5Qww+5Q0ME5zxZY5llXYQ
	MuqdeO0DxdJsY0OgTXNrz7AOZtncng0=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-LSig-EQ5MFyG1qKhEtNzig-1; Wed, 17 Aug 2022 15:07:13 -0400
X-MC-Unique: LSig-EQ5MFyG1qKhEtNzig-1
Received: by mail-qt1-f197.google.com with SMTP id fv24-20020a05622a4a1800b003445e593889so6875282qtb.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 12:07:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=5ABSmkuZfQM3Y1mClHJcPhcabJ5jPBDhGKX1+BXsp40=;
        b=kcJ66LpkN7PE6QxgvPCE+JNnssCTBRxygU7fUIi9H+VApdQPNbzGwQ5RlbwLTcalv8
         YWmVP6fq6F586J3rvhqrHEa3EhYHAzN/wY1UCZwLIYON014VgkhU6CizPzvPXFvIwrQR
         ebCeHLMtAsG/FJsP0EK0Kvs2lyjva2/p+XKmkEOYp23bCWfQJT/H2kmY7WHvRsAJYH4W
         xLcTpj8NiLHB1LF/Hgmv7TFQxW7/Qi2UYkpynDx7/SERyy1OXY1/QeTTnBokMDqfwBX9
         Z7SWt1A8OMrcyqfDSHSfJO0rCaXf3Yi9Vk433vpEKgLj9NYHBCwjOLNjG/qowcxNSi/Q
         iASQ==
X-Gm-Message-State: ACgBeo1uA0fXZWuDjthKPZu5kZ8/75VtH+SFBF2Hfc2/v4UtjCt+H1CJ
	u923NENz+BAw6fDr2paNT2UMn5SYg2eArm8SzQhvxgZ8BeNoRFAcObgDX1Vzbu0AX6csZ2Nqe+3
	EhriAiPHS2E9Owo72orciD4ZGXQ==
X-Received: by 2002:ac8:5b15:0:b0:343:6789:193a with SMTP id m21-20020ac85b15000000b003436789193amr23697800qtw.647.1660763232193;
        Wed, 17 Aug 2022 12:07:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7htcPsTa+zO6/5dGIcJF7fto7SLs+oLa5/xcRr6PogKT9KpDCzjPlwU09EoMQTzAndOv0Wtg==
X-Received: by 2002:ac8:5b15:0:b0:343:6789:193a with SMTP id m21-20020ac85b15000000b003436789193amr23697775qtw.647.1660763231904;
        Wed, 17 Aug 2022 12:07:11 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id bl26-20020a05620a1a9a00b006b8e63dfffbsm15302093qkb.58.2022.08.17.12.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 12:07:11 -0700 (PDT)
Date: Wed, 17 Aug 2022 15:07:09 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v2 1/2] mm/migrate_device.c: Copy pte dirty bit to page
Message-ID: <Yv08XTRv3I5zY4M5@xz-m1.local>
References: <6e77914685ede036c419fa65b6adc27f25a6c3e9.1660635033.git-series.apopple@nvidia.com>
 <CAC=cRTPGiXWjk=CYnCrhJnLx3mdkGDXZpvApo6yTbeW7+ZGajA@mail.gmail.com>
 <Yvv/eGfi3LW8WxPZ@xz-m1.local>
 <871qtfvdlw.fsf@nvdebian.thelocal>
 <YvxWUY9eafFJ27ef@xz-m1.local>
 <87o7wjtn2g.fsf@nvdebian.thelocal>
MIME-Version: 1.0
In-Reply-To: <87o7wjtn2g.fsf@nvdebian.thelocal>
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Huang Ying <ying.huang@intel.com>, stable@vger.kernel.org, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 17, 2022 at 03:41:16PM +1000, Alistair Popple wrote:
> My primary concern with batching is ensuring a CPU write after clearing
> a clean PTE but before flushing the TLB does the "right thing" (ie. faults
> if the PTE is not present).

Fair enough.  Exactly I have that same concern. But I think Nadav replied
very recently on this in the previous thread, quotting from him [1]:

  I keep not remembering this erratum correctly. IIRC, the erratum says
  that the access/dirty might be set, but it does not mean that a write is
  possible after the PTE is cleared (i.e., the dirty/access might be set on
  the non-present PTE, but the access itself would fail). So it is not an
  issue in this case - losing A/D would not impact correctness since the
  access should fail.

I don't really know whether he means this, but I really think the hardware
should behave like that or otherwise I can't see how it can go right.

Let's assume if after pte cleared the page can still be written, then
afaict ptep_clear_flush() is not safe either, because fundamentally it is
two operations happening in sequence, of: (1) ptep_get_and_clear(), and (2)
conditionally do flush_tlb_page() when needed.

If page can be written with TLB cached but without pte present, what if
some process writes to memory during step (1) and (2)?  AFAIU that's the
same question as using raw ptep_get_and_clear() and a batched tlb flush.

IOW, I don't see how a tlb batched solution can be worse than using per-pte
ptep_clear_flush().  It may enlarge the race window but fundamentally
(iiuc) they're the same thing here as long as there's no atomic way to both
"clear pte and flush tlb".

[1] https://lore.kernel.org/lkml/E37036E0-566E-40C7-AD15-720CDB003227@gmail.com/

-- 
Peter Xu

