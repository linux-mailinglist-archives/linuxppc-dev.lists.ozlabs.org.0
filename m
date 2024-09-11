Return-Path: <linuxppc-dev+bounces-1235-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC81F974C3E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 10:13:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3YGn3lDFz2xJ6;
	Wed, 11 Sep 2024 18:13:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726040889;
	cv=none; b=WSZPwq4tBel4irNtssjrT6ZfZndjpqVhbEyLs3llDVY/X2dYsnfJb9Ec3q3mU5hXjHANhLUdsbahaX5ML9ltog94LjNrnP8i6oiFaI5SBH5eYB1T+n9WDd2gavKzFKf9IdmaCgCE4PgDP2nH2gAXeOFWiWdKNoaYfWdGyHOwfee26xJKZoubuNOhOK6acRhUS5ZMqElj6NxghM0+74t1tXBhfn+5hlqrbNq3srmoAbQV5+FAVvfLo8AlZWDWn2u8SqQN9/g5mgzxja9F9Uh9d9UVGyFCEG7H2YktaRDyi5KCYWi0xG+vYG22BrJT2PS6YnGZE1nLNihc71CIBdYW5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726040889; c=relaxed/relaxed;
	bh=DAqoY6jIAjc3xzIZO9ujMSqjm0EX+JGfOEbTRNWh9ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CI+Ykz9z9KUaJ8Mv0KDOqkF85yftKdjkKCpCS4e/Wpy4MgzSDL52wirWLPGX3um5UygidlG9ghv7WD4je68l2jruMTSwsDSxlO2owF0hJdKHiq30/iFNspzLHms/leavZkMsDf8ZKQAcpp+ePWEGnGjV79PxR68YAuUvaY1jy+KnP88R5XUgwW1QkeuZNrj09h7Y3XaKRVNItzAvnRE/sIQXP58hRUFbv5ZubMG2S2c40wAQyXCs0gK2z9K11gbmEsDTerHSA7Hr40l6MYnR9ckCW5QtX7y6T3GWL/MEJ697mXZEofigTXVds4mgcPJRfQD6wNEa2jrTMjrGjjOPVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PIh2vXkO; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=zhanglyra.2023@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PIh2vXkO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=zhanglyra.2023@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3Xjz6x43z2xYq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 17:48:07 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a8d3e662791so243679766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 00:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726040880; x=1726645680; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DAqoY6jIAjc3xzIZO9ujMSqjm0EX+JGfOEbTRNWh9ek=;
        b=PIh2vXkOnQOsV6AliToyKBBMdg/KO4UzUkCZSnj8ebwLsgAPWuSKXH8TqbrQKXJ9FV
         UJS3qGE7htPBRZq3NGsdEa1ckqFY8O0qyS6+dTKsBZFMlLTt/hn7n3cuhcKHifdM+Ku8
         eB9aW0CybwneMzY5H9BYDEJ4se9jdIeoyz9njn2soME6zsbIwar+yG5CjQ+rI1OVR9GW
         gYweQt+dKpHNCubXifGE+pr86UNUjz1vvKdI0fEExVoJsbs95KbNgGEqmh4M5RD2YRKv
         CjEM5+etpaNdWAVZxn9Hj0gwoVJ/gK6ZU/6mrjNmqOAY9kmJdIGyOyCSW+YeDMoLW3RO
         29PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726040880; x=1726645680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAqoY6jIAjc3xzIZO9ujMSqjm0EX+JGfOEbTRNWh9ek=;
        b=tZL+IyNEveCQ0ynwveJ035hh1AhNAG13HTd7SH8h3i9Bd7EpfDWuFw2V9GJz0Clz+s
         NAjFJB6qUf93xErMZDDf9NKJRVtiSkd1UjLQTbOqIFIPn7duZkaGDOd/gsyP7eikVxEc
         SOUwxuVkCnz70n826cqMwdpMRdXIGQuAAXvh5bTzQenAcpWoDgt+DeKE2nK9czJWEpzl
         4pBn+zs5b+07Tk/9aqlYucND2f7utAhSiF82j99dh2r05gPZ3Exmq2XmnYGTo4LNPEEN
         lCkw9QgrhSojQ9G6RRDH+xefPX8hCrLrjSCgnmfJwLurtYI20Wk/wsMLFXM4+koudsmd
         ve/w==
X-Forwarded-Encrypted: i=1; AJvYcCXLgz3plddYchXE4Q0q5GVkfty8eU4LPeu5quYxCC1F4A3D6vKFALzyZ/D56JqDyRZbeM6Xp6GiqmD1Vkw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxJMKZSHPnWjAYRgK4hqf9Thgq5DYEL1DUWSlVynCZMyjA2+BO2
	V10U2gXmzH8pZ7StN2aZ40Ib0Qvgj9qOsS1efEFlhnqPQnpJQKSLps7y/fQaGhOFIKAvLb4ofkP
	KOBUDPVtVuXE0t03qcF+BebhMrSg=
X-Google-Smtp-Source: AGHT+IFIM8V4DC0Z/5BWC5YRsJ9oRKTopRmw4RDrk2NBxBFwPDaaIWbAeLPw628HCYH5EvgpHLChk4iqxgrwnmbG4z4=
X-Received: by 2002:a05:6402:40d4:b0:5c3:d0e1:9f81 with SMTP id
 4fb4d7f45d1cf-5c3dc77ab97mr18285042a12.7.1726040879000; Wed, 11 Sep 2024
 00:47:59 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <cover.9f0e45d52f5cff58807831b6b867084d0b14b61c.1725941415.git-series.apopple@nvidia.com>
 <39b1a78aa16ebe5db1c4b723e44fbdd217d302ac.1725941415.git-series.apopple@nvidia.com>
In-Reply-To: <39b1a78aa16ebe5db1c4b723e44fbdd217d302ac.1725941415.git-series.apopple@nvidia.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 11 Sep 2024 15:47:22 +0800
Message-ID: <CAOsKWHCEFSw6d7nC3A1Z4DKMNuUjirt-oULSr7hCWqT2GfnUDQ@mail.gmail.com>
Subject: Re: [PATCH 12/12] mm: Remove devmap related functions and page table bits
To: Alistair Popple <apopple@nvidia.com>
Cc: dan.j.williams@intel.com, linux-mm@kvack.org, vishal.l.verma@intel.com, 
	dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com, jack@suse.cz, 
	jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au, 
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com, 
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, 
	david@redhat.com, peterx@redhat.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, jhubbard@nvidia.com, 
	hch@lst.de, david@fromorbit.com
Content-Type: text/plain; charset="UTF-8"

Hi Alistair,

On Tue, 10 Sept 2024 at 12:21, Alistair Popple <apopple@nvidia.com> wrote:
>
> Now that DAX and all other reference counts to ZONE_DEVICE pages are
> managed normally there is no need for the special devmap PTE/PMD/PUD
> page table bits. So drop all references to these, freeing up a
> software defined page table bit on architectures supporting it.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: Will Deacon <will@kernel.org> # arm64
> ---
>  Documentation/mm/arch_pgtable_helpers.rst     |  6 +--
>  arch/arm64/Kconfig                            |  1 +-
>  arch/arm64/include/asm/pgtable-prot.h         |  1 +-
>  arch/arm64/include/asm/pgtable.h              | 24 +--------
>  arch/powerpc/Kconfig                          |  1 +-
>  arch/powerpc/include/asm/book3s/64/hash-4k.h  |  6 +--
>  arch/powerpc/include/asm/book3s/64/hash-64k.h |  7 +--
>  arch/powerpc/include/asm/book3s/64/pgtable.h  | 52 +------------------
>  arch/powerpc/include/asm/book3s/64/radix.h    | 14 +-----
>  arch/x86/Kconfig                              |  1 +-
>  arch/x86/include/asm/pgtable.h                | 50 +-----------------
>  arch/x86/include/asm/pgtable_types.h          |  5 +--

RISC-V's references also need to be cleanup, it simply can be done by
reverting the commit

216e04bf1e4d (riscv: mm: Add support for ZONE_DEVICE)

Thanks,
Chunyan

>  include/linux/mm.h                            |  7 +--
>  include/linux/pfn_t.h                         | 20 +-------
>  include/linux/pgtable.h                       | 19 +------
>  mm/Kconfig                                    |  4 +-
>  mm/debug_vm_pgtable.c                         | 59 +--------------------
>  mm/hmm.c                                      |  3 +-
>  18 files changed, 11 insertions(+), 269 deletions(-)
>

