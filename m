Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BA694AA7B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 16:41:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ry0Dv9mC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfCYL34NGz3d88
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 00:41:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ry0Dv9mC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=soleen.com (client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com; envelope-from=pasha.tatashin@soleen.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfCXY0P89z3cTl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 00:40:59 +1000 (AEST)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3dc16d00ba6so1084222b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 07:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1723041655; x=1723646455; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3FCSeVm0zgIRrRlVAZ6M3ezYAgjYCe4IP6mmA4qsAbw=;
        b=ry0Dv9mCStyzxuLrjdW3BdvZd7BVtq2lsOvaNBxy0N5bCciL3IziL3QfG6RyvDdF7M
         RuvSFK6Ha7g3UWDuKGId0FGY/5F3s4dvZ4so2LC29KAeWb00zNl1GhUeYsgtkRZ4Ebnt
         +csF0594+LdShN0I1GDyvyLaQGV1i2rnmYP2nXkOIzwq06NQvuWcFzZrNNpuoGRagR0o
         gTxpqQzjw8C7J2k1oBKNTQn8rf6WxGxafi9P3fH9LgDdcPwSVLr7eZOgbv5wp16jvbb0
         iDaiRws7QEnOLahtt+QIpndjTQcYiyA1uOv22+dmzS9tOL6S0IEKJA8a5uLgRHn9ZqC9
         BskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723041655; x=1723646455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3FCSeVm0zgIRrRlVAZ6M3ezYAgjYCe4IP6mmA4qsAbw=;
        b=p3zpYiH6CTDqBQ8AYEUCXptPZKzNT02iug56LutY+X5nuQypo8eJtqCSavrLYufjXU
         /VTLUfqaC6//zXn0Fu3SBYoSVeDQkgBCweKwT4Cu7+lUAc5xjcAXc/ombuxxxWg7wxOy
         5HTvKVVifZ/Bum33rl7i18A7utUGt4VL8BiHZE6W7/62JaIvZKCCfMZFmypQ9GwLjUNv
         NzoSxnt97syjol7lPBQNoYedLVJGhnjey3qRN5v4JOo+IKf8foL7zGJ/KSbGwoHEeYHH
         o2JtX288WLgnznMTLBunrCR8jkwj3MeRKGahtLQDU8zqJuLEFU2V9MV3LAm+Exodx9GC
         DdnA==
X-Forwarded-Encrypted: i=1; AJvYcCWAt/IETlVEbh/c0dEzajm2//JYoga59q6RrvRL6uQIFru9tM4kkpKq9SoK8SapYnKvd++XzhFcCZ2eEnEW3hF2QO29e9/GVai+B8TzTw==
X-Gm-Message-State: AOJu0YzroPAXNNxRR3Q06+oFNbN/VxU8Xu5JKbik/34QoKgtWw9L0tru
	I0WZAfrTOWOXBg8JooN+4qLG/r2wA+lmMhwhIcy0pwwZhcd713zOekQhub+0CowPScl0ccCyV3d
	DU/RkvkKIhxSgNUCw4zE1h2lWVnFu6UavNhe6zA==
X-Google-Smtp-Source: AGHT+IGOXQAzEiXp6xdPGUMTTnKI09YBOs1Vk6kj0LXvCI51MvBrgaaI5JzS3LcBWq8pGTljqab9RWCOjdJxV6Tr6zo=
X-Received: by 2002:a05:6808:130f:b0:3db:251b:c16 with SMTP id
 5614622812f47-3db558397b9mr20918330b6e.42.1723041654777; Wed, 07 Aug 2024
 07:40:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240806221454.1971755-1-pasha.tatashin@soleen.com>
 <20240806221454.1971755-2-pasha.tatashin@soleen.com> <345ba221-e094-47e8-9481-562faf4acd85@redhat.com>
 <e780e9af-e23d-44ff-ae0f-a8f4ee098a1c@redhat.com>
In-Reply-To: <e780e9af-e23d-44ff-ae0f-a8f4ee098a1c@redhat.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 7 Aug 2024 10:40:17 -0400
Message-ID: <CA+CK2bBuDu-3XeeAsy4zggOrxTrp84bcZp9p6mQipzc3NqpcSg@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm: keep nid around during hot-remove
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: mark.rutland@arm.com, muchun.song@linux.dev, luto@kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, bjorn@rivosinc.com, linux-mm@kvack.org, souravpanda@google.com, rdunlap@infradead.org, hpa@zytor.com, kernel@xen0n.name, will@kernel.org, agordeev@linux.ibm.com, namcao@linutronix.de, linux-s390@vger.kernel.org, arnd@arndb.de, bhe@redhat.com, chenhuacai@kernel.org, christophe.leroy@csgroup.eu, ardb@kernel.org, mingo@redhat.com, rientjes@google.com, gerald.schaefer@linux.ibm.com, borntraeger@linux.ibm.com, aou@eecs.berkeley.edu, ryan.roberts@arm.com, alexghiti@rivosinc.com, gor@linux.ibm.com, hca@linux.ibm.com, dawei.li@shingroup.cn, naveen@kernel.org, maobibo@loongson.cn, chenjiahao16@huawei.com, bp@alien8.de, npiggin@gmail.com, loongarch@lists.linux.dev, paul.walmsley@sifive.com, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, osalvador@suse.de, x86@kernel.org, philmd@linaro.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, mcgrof@kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com, svens@linux.ibm.com, tzimmermann@suse.de, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 7, 2024 at 7:50=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 07.08.24 13:32, David Hildenbrand wrote:
> > On 07.08.24 00:14, Pasha Tatashin wrote:
> >> nid is needed during memory hot-remove in order to account the
> >> information about the memmap overhead that is being removed.
> >>
> >> In addition, we cannot use page_pgdat(pfn_to_page(pfn)) during
> >> hotremove after remove_pfn_range_from_zone().
> >>
> >> We also cannot determine nid from walking through memblocks after
> >> remove_memory_block_devices() is called.
> >>
> >> Therefore, pass nid down from the beginning of hotremove to where
> >> it is used for the accounting purposes.
> >
> > I was happy to finally remove that nid parameter for good in:
> >
> > commit 65a2aa5f482ed0c1b5afb9e6b0b9e0b16bb8b616
> > Author: David Hildenbrand <david@redhat.com>
> > Date:   Tue Sep 7 19:55:04 2021 -0700
> >
> >       mm/memory_hotplug: remove nid parameter from arch_remove_memory()
> >
> > To ask the real question: Do we really need this counter per-nid at all=
?
> >
> > Seems to over-complicate things.
>
> Case in point: I think the handling is wrong?
>
> Just because some memory belongs to a nid doesn't mean that the vmemmap
> was allocated from that nid?

I believe when we hot-add we use nid for the memory that is being
added to account vmemmap, and when we do hot-remove we also use nid of
the memory that is being removed. But, you are correct, this does not
guarantee that the actual vmemmap memory is being allocated or removed
from the given nid.

> Wouldn't we want to look at the actual nid the vmemmap page belongs to
> that we are removing?

I am now looking into converting this counter to be system wide, i.e.
vm_event, it is all done under hotplug lock, so there is no
contention.

Pasha
