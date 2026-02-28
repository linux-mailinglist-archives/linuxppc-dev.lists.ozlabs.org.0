Return-Path: <linuxppc-dev+bounces-17430-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKN0OJ0xomke0wQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17430-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 01:06:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F24D61BF558
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 01:06:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fN58n6dvWz30VV;
	Sat, 28 Feb 2026 11:06:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772237209;
	cv=none; b=IkxSTgw4DUzPTB2Iml3F0H+NdnnpuI8237OK8cNUu0gak8Dm7Lx3V5SXnSgTw1z6XC0ln2g2Teav/O2W+gokMC/B699qkE4NriOZaG55R3UlpfuSA9OY0tuj9u4SYFCD4JJvWSYoUtbBMcrqfeM9ioQtoDoCgpL6kMz84rU9KMHyswI6zXJkE82Df9qXr1JBWLhGkwkHTQgHkl+ZHEvVrcBspwYC83Y3JamjZ2E3RAtZp1d4ib2zMm7Z3RwFbvXIrMvsGuQc/h2AX9Uo29l52CEJsmcEg0AmVOk3AYGh45tSLSFcf5V+pdVrRhA8aUvmu64gVN5YCjRbxh72fKUY0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772237209; c=relaxed/relaxed;
	bh=ZgQjMLyBsefVKSZLFOZenbLdjl9yvSc36kLvDM5ApCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4A4DI8sWMqH0Wnz/+q475jWt6HM91WasDkGujZfSfsIVASbyqhLolZeH72JFQwu0/iuooOD56Z97p3Biv5coQ5wjzjaPNxPEku+zIqwNnXwFOTLQdOgFNA98PBek5Cht9d6w/ZCkaK80d5uMm4zfAUQ5iZrp68BpbJ2xrlUIFSXUoPSksBWRjWUThJjO82eFojFdoUOG6u6V1nBoqp3yyyOgLHf30T0ePdYNLL37ENg1cRgZjayNO66l61/vOlfdAaogBgvdaC/Na4aDtt064uXViZY5oJ3TI3yzFPkZoqpuFtUPa7kOhUvPKZAtQAHyXzRCok7NScknqTgPTfXQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bndOuJAU; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hnwk+AMn; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=npache@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bndOuJAU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hnwk+AMn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=npache@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fN58m3BG1z30T8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 11:06:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772237202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgQjMLyBsefVKSZLFOZenbLdjl9yvSc36kLvDM5ApCs=;
	b=bndOuJAUep+M1OcbKc2xWulrc339tW1KEJRli8O8ElIV8iLJ1/l6tLTxOLeTdXqvacatkO
	4IHhYPcA0vGoJUmKxCHzZV3Xn2XDacX8B1vywxvufxtSxYAxi5/eRl8pmT9y5KqOQfdi4Q
	83ujudbeDXrFYUkvTA5a2POEACstj/c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772237203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZgQjMLyBsefVKSZLFOZenbLdjl9yvSc36kLvDM5ApCs=;
	b=hnwk+AMnFSWXTWx35FAjfXXeL5qUJx4Jq3P9lTewoeZnWbJDMREpuDKr3uoZg1T8XnFKlJ
	k2GmMtVhVYqTQtd0ytwpnWCp90pP2vjmbHse1TRpEOC3uVlgyi/p+IjApTllXyzsqgqPJM
	hIPiZhEkin05ICJQpP+jIIJun51bsiM=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-ckBdvHuWMHSrfCWlWC840g-1; Fri, 27 Feb 2026 19:06:38 -0500
X-MC-Unique: ckBdvHuWMHSrfCWlWC840g-1
X-Mimecast-MFC-AGG-ID: ckBdvHuWMHSrfCWlWC840g_1772237198
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-64cb719e778so4917941d50.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 16:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772237198; x=1772841998;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZgQjMLyBsefVKSZLFOZenbLdjl9yvSc36kLvDM5ApCs=;
        b=tvVKLQZrjVCGQQl7+DvY6CwU2oGfD3S51P/o8sJkn6SKfCGZwdwT/KizmVHlNtseA3
         uAOZ2qiMQ9BVx74CdHL8EA6RZi1kBTwjprBKamr71AnBLfKCZIk/aprF5NJEFydKrSbe
         ya2h6mmyQ3kkBObxqfs3smlLYSVlbK5v8MJkOiH4023Npg7SD8uf+1k6H8cWX2MEdihB
         YctaNnCg9kJtObV3KSIuUbNOJxs7lO2UkqD4PWCemkY/OGYKKPQGNdWvKLTqJttDQ88j
         YkPFgBclNjiTgOwOBiNCNPPhWTJ/P4SFRY3GqKvcoebkw/6LRVtDYZKAJO036SR/AtBM
         PvdA==
X-Forwarded-Encrypted: i=1; AJvYcCXj2zvKDJboAc/xMdot0C0AsMkMwbdGB+JnHwXAAg85W9NEJLAxEEym5FSUZwfyXwTGoH5vKIrxVCQFBkU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwxtCgxgBM1OsNGYOZjazolNZTB3AUH6vVhlZT36v4GJR0hbOtA
	ymV2tzojC5swOdis+zdB4o9gGaIKu5tRKEc5UqdOsC10y5M4UepxIOAcLW5VFQv+DMyJzHFOkQA
	uj/sTBm6jCsir1d2JR73YCZcaX6HFehVxICGa1PiWFEpnz4AFEpTTBcBGVegGuEsvA9ahDrTql5
	UhGo7htpc3OY/dbFq1rFWF4Ysgc8j59SzxmbVNvdiXww==
X-Gm-Gg: ATEYQzxxhEjMasc4FSpA87/y0K7yjheItZZsbZzUPfR3+SGGODvQbABcEZQBx9FJ2uO
	qEJA/KrN9xqrMhyTIh3hIR1eF2EzVV/EvRQGUvKLtkC8ratIIXuuDhaiLg9rZEW+iSGzRHils56
	9mwrTQYSVhFNqBgy38ho7l56ghhz7PJugFiQB2YqRMsnTBIZp54QHaSEQLwbEWD4ZM6wizDTHIb
	8Ux
X-Received: by 2002:a05:690e:edb:b0:64c:9a08:9948 with SMTP id 956f58d0204a3-64cc2302f31mr3708786d50.76.1772237198198;
        Fri, 27 Feb 2026 16:06:38 -0800 (PST)
X-Received: by 2002:a05:690e:edb:b0:64c:9a08:9948 with SMTP id
 956f58d0204a3-64cc2302f31mr3708764d50.76.1772237197814; Fri, 27 Feb 2026
 16:06:37 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20260226113233.3987674-1-usama.arif@linux.dev>
 <CAA1CXcAYt3OfW_uBTYZgr-dBhg99x=5pUs5uvqtpg+PNJ1KxGQ@mail.gmail.com> <1d3a4e8e-9ea0-42e7-b8e7-d92fb27f80f4@linux.dev>
In-Reply-To: <1d3a4e8e-9ea0-42e7-b8e7-d92fb27f80f4@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Fri, 27 Feb 2026 17:06:12 -0700
X-Gm-Features: AaiRm50atKm0LplrPamqC93Qv4KgvjRMNXj12GuBsNodzUDc90TXdhaD9w6BIXM
Message-ID: <CAA1CXcCygvA9uUJjB-+2J00srnHbiNGwbvcbqpRer8Vy8QBxWg@mail.gmail.com>
Subject: Re: [RFC v2 00/21] mm: thp: lazy PTE page table allocation at PMD split
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, lorenzo.stoakes@oracle.com, 
	willy@infradead.org, linux-mm@kvack.org, fvdl@google.com, hannes@cmpxchg.org, 
	riel@surriel.com, shakeel.butt@linux.dev, kas@kernel.org, baohua@kernel.org, 
	dev.jain@arm.com, baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, 
	ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>, lance.yang@linux.dev, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, linux-s390@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QAvPtdYYVWDV64seWEYuusPowVsfb8_ug62pW6xQcEU_1772237198
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_BL_SPAMCOP_NET,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:usama.arif@linux.dev,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@kernel.org,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[npache@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-17430-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[npache@redhat.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.dev:email]
X-Rspamd-Queue-Id: F24D61BF558
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 4:14=E2=80=AFAM Usama Arif <usama.arif@linux.dev> w=
rote:
>
>
>
> On 26/02/2026 21:01, Nico Pache wrote:
> > On Thu, Feb 26, 2026 at 4:33=E2=80=AFAM Usama Arif <usama.arif@linux.de=
v> wrote:
> >>
> >> When the kernel creates a PMD-level THP mapping for anonymous pages, i=
t
> >> pre-allocates a PTE page table via pgtable_trans_huge_deposit(). This
> >> page table sits unused in a deposit list for the lifetime of the THP
> >> mapping, only to be withdrawn when the PMD is split or zapped. Every
> >> anonymous THP therefore wastes 4KB of memory unconditionally. On large
> >> servers where hundreds of gigabytes of memory are mapped as THPs, this
> >> adds up: roughly 200MB wasted per 100GB of THP memory. This memory
> >> could otherwise satisfy other allocations, including the very PTE page
> >> table allocations needed when splits eventually occur.
> >>
> >> This series removes the pre-deposit and allocates the PTE page table
> >> lazily =E2=80=94 only when a PMD split actually happens. Since a large=
 number
> >> of THPs are never split (they are zapped wholesale when processes exit=
 or
> >> munmap the full range), the allocation is avoided entirely in the comm=
on
> >> case.
> >>
> >> The pre-deposit pattern exists because split_huge_pmd was designed as =
an
> >> operation that must never fail: if the kernel decides to split, it nee=
ds
> >> a PTE page table, so one is deposited in advance. But "must never fail=
"
> >> is an unnecessarily strong requirement. A PMD split is typically trigg=
ered
> >> by a partial operation on a sub-PMD range =E2=80=94 partial munmap, pa=
rtial
> >> mprotect, partial mremap and so on.
> >> Most of these operations already have well-defined error handling for
> >> allocation failures (e.g., -ENOMEM, VM_FAULT_OOM). Allowing split to
> >> fail and propagating the error through these existing paths is the nat=
ural
> >> thing to do. Furthermore, split failing requires an order-0 allocation=
 for
> >> a page table to fail, which is extremely unlikely.
> >>
> >> Designing functions like split_huge_pmd as operations that cannot fail
> >> has a subtle but real cost to code quality. It forces a pre-allocation
> >> pattern - every THP creation path must deposit a page table, and every
> >> split or zap path must withdraw one, creating a hidden coupling betwee=
n
> >> widely separated code paths.
> >>
> >> This also serves as a code cleanup. On every architecture except power=
pc
> >> with hash MMU, the deposit/withdraw machinery becomes dead code. The
> >> series removes the generic implementations in pgtable-generic.c and th=
e
> >> s390/sparc overrides, replacing them with no-op stubs guarded by
> >> arch_needs_pgtable_deposit(), which evaluates to false at compile time
> >> on all non-powerpc architectures.
> >
> > Hi Usama,
> >
> > Thanks for tackling this, it seems like an interesting problem. Im
> > trying to get more into reviewing, so bare with me I may have some
> > stupid comments or questions. Where I can really help out is with
> > testing. I will build this for all RH-supported architectures and run
> > some automated test suites and performance metrics. I'll report back
> > if I spot anything.
> >
> > Cheers!
> > -- Nico
> >
>
> Thanks for the build and looking into reviewing this. All comments
> and questions are welcome! I had only tested on x86, and I had a look
> at the link you shared so its great to know that powerPC and s390 are fin=
e.

Good news: as you noted all the builds succeeded, and the sanity tests
dont show any signs of an immediate issue across the architectures.
I'll proceed to debug kernels, and then performance testing. I will
try to start reviewing the actual code changes in depth next week :)

Cheers,
-- Nico

>


