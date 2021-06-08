Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5D939EDE8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 07:03:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzdSF2sg5z3brv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 15:03:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Qj0zU6Fr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531;
 helo=mail-pg1-x531.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Qj0zU6Fr; dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzdRn4F1xz2xZW
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 15:03:31 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id y12so3747199pgk.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Jun 2021 22:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Oz+R3buVcrrnFDzHn9gaTiP7O9I196VvCyY7n8MTjhQ=;
 b=Qj0zU6Fr0jpUWq1TVnW6Vq9oyVKbpzpNCcz96cNtfsqJz+CDt7K9gh/+/hueoYIFbN
 ZM/YCm965Syrc3IwPHQBX7lzFBHXgYdmislg1DwzfWzzXGYd5iZaU2Q5CWORDT1l17Qq
 dfEA7HMTXHLBoCkAweTQEYMPgSUX3TSXNnb0wJ6DNNpXDFxxR2/d7OuB7MnaEUzT86fg
 dJol7Z9Q/NoYLJgkQ2vjhGvSSxIrxKWGAjqaPxM1bfOWSdG9nLzp2242tJXcnrDOFuAd
 95x/bDuXR5S1XtzNAb2IKGg6eUVYvhJbv1ynxMxXWZ7c2DwxHSXdGApQzF05Eein06iw
 UD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Oz+R3buVcrrnFDzHn9gaTiP7O9I196VvCyY7n8MTjhQ=;
 b=Fl8J7p1Yc3y+qLMbAncsB98EQnzMXBhsQ1zjTpETX9V08DaHVpbEFCFcX9VObVAl6s
 QRFWYBxj75hg1OVACjvvh2eJhzFh1uUjnJZetaOn50fX4FkOHqORpIwZCC5VBctb55nD
 VuR9vkqYB7/IgDzaw7G4XwDefBdf0fyq3ZZ2ZSeqGklQzDUswvOsUFBLBRxL9kO52+hk
 NH1ccfCKZ0vRt3Vc9yUu51bf/uN4AwoGyLS0f6sWruFWcoiVX+5jR9lerzPZDD9VVo4F
 3tRLw8m4O/nEXw6BEbwwgs/9tqGJYUgCje+Ip0TEE2qD+SlTXKb7mIXGb/T1ONbCHaB9
 E3Og==
X-Gm-Message-State: AOAM533BQREsK4nrXFhiQfMkQ2WiuqLvKWqx7cEnxxLItZHwST3B2t3N
 vmllLGcANO7hJ06M5sGQNC4=
X-Google-Smtp-Source: ABdhPJwle3Pxzn+G7A586bjy9oaf62duVr7i7OL8cojoZ+xK7XtiSlw8tE1QsborIReIZzoYfqmT/w==
X-Received: by 2002:a63:2dc2:: with SMTP id
 t185mr21271238pgt.285.1623128607576; 
 Mon, 07 Jun 2021 22:03:27 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id v22sm9499204pff.105.2021.06.07.22.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 22:03:27 -0700 (PDT)
Date: Tue, 08 Jun 2021 15:03:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 00/11] Speedup mremap on ppc64
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
 <CAPa8GCAmgUyqqAcuLC7KxDvDepkqhhvVcwgSGJh92PT+LoMQcw@mail.gmail.com>
 <3f2b7150-eaba-e1ab-bb88-53a3510727b9@linux.ibm.com>
In-Reply-To: <3f2b7150-eaba-e1ab-bb88-53a3510727b9@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623128236.wygeaklh5o.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "kaleshsingh@google.com" <kaleshsingh@google.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Aneesh Kumar K.V's message of June 8, 2021 2:39 pm:
> On 6/7/21 3:40 PM, Nick Piggin wrote:
>> On Monday, 7 June 2021, Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>=20
>> wrote: This patchset enables MOVE_PMD/MOVE_PUD support on power. This=20
>> requires the platform to support updating higher-level page tables=20
>> without updating page table ZjQcmQRYFpfptBannerStart
>> This Message Is From an External Sender
>> This message came from outside your organization.
>> ZjQcmQRYFpfptBannerEnd
>>=20
>>=20
>> On Monday, 7 June 2021, Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com=20
>> <mailto:aneesh.kumar@linux.ibm.com>> wrote:
>>=20
>>=20
>>     This patchset enables MOVE_PMD/MOVE_PUD support on power. This requi=
res
>>     the platform to support updating higher-level page tables without
>>     updating page table entries. This also needs to invalidate the Page =
Walk
>>     Cache on architecture supporting the same.
>>=20
>>     Changes from v6:
>>     * Update ppc64 flush_tlb_range to invalidate page walk cache.
>>=20
>>=20
>> I'd really rather not do this, I'm not sure if micro bench mark captures=
=20
>> everything.
>>=20
>> Page tables coming from L2/L3 probably aren't the primary purpose or=20
>> biggest benefit of intermediate level caches.
>>=20
>> The situation on POWER with nest mmu (coherent accelerators) is=20
>> magnified. They have huge page walk cashes to make up for the fact they=20
>> don't have data caches for walking page tables which makes the=20
>> invalidation more painful in terms of subsequent misses, but also=20
>> latency to invalidate (can be order of microseconds whereas a page=20
>> invalidate is a couple of orders of magnitude faster).
>>=20
>=20
> If we are using NestMMU, we already upgrade that flush to invalidate=20
> page walk cache right? ie, if we have > PMD_SIZE range, we would upgrade=20
> the invalidate to a pid flush via
>=20
> flush_pid =3D nr_pages > tlb_single_page_flush_ceiling;

Not that we've tuned that parameter for a long time, certainly not with=20
nMMU probably. Quite possibly it should be higher for nMMU because of=20
the big TLBs they have. (and what about =3D=3D PMD_SIZE)?

> =09
> and if it is PID flush if we are using NestMMU we already upgrade a=20
> RIC_FLUSH_TLB to RIC_FLUSH_ALL ?

Does P10 still have that bug?

At any rate, the core MMU I think still has the same issues just less
pronounced. PWC invalidates take longer, and PWC should have most
benefit when CPU data caches are highly used and don't filled with
page table entries.

Thanks,
Nick
