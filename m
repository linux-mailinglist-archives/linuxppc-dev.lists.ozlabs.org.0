Return-Path: <linuxppc-dev+bounces-14925-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B43CD3C69
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Dec 2025 08:13:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dYstk1dQgz2yFW;
	Sun, 21 Dec 2025 18:13:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766301198;
	cv=none; b=IxIl6C5cRzfrJJD1jn4YdSFSMg/xWFtEDnm6oIowYGXIIrON/GM3aHDxVRr4GRERXTzAinXf8i6j1fg4khqJUpokDqZUHXSJKiieK3NrCsvsxt5EbttA6m+K9jdCGKzdjCXIvuwr9yQ5+g55ozZFdWGMmwomU+GHdxuh9ilt3jq5C6ubbtLbl/uwmM2juV1IUKQHE8D8j/+uaFrjTPkSY97q4Y0d/X2TPjihnQ94YnZ6vJ/s93SOrrRYx1agXi8PQwqeo3ZzgZUlAwYSm87NEsIyxtb/nTek4S7ciVJl2dVHQ5eb/m2A0tHiMcvD0LcZS5QX4zU67LYAu4v6bZmYMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766301198; c=relaxed/relaxed;
	bh=qzCtCXPpJksCwKOWKXvWbqXbkA87udvkBHpHfw0vp1Y=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=Qm04VuMUPErUpgETPyC/gbtxJYmum2X9rVUDXT0Q2J8vtUPqzvkWv8Y8/+yK3zOwTX84/TaIYPLSNNiG23myBmJ0n6wJ9Gf2+AfnjZ9HtZiQyBIB7/Ik4a0PDYCjiKy6TIBWBmPiRNrc5W8uc8SF978e2w3xo8OCNudaRvvNhNKywoEPX5y8Cu+8wcGH3Z5/2zz33Ev25joe9LjeTeGno4Wq7oowpRLVTROi9hz38pNUZKhzDeS1WxBJQnoolvPKH15GwxITz7gMDZYuHXigHxIIml6IP0okmYLkJIojLTo3+KmdAOuBXxsarC83dFt/06s7s7RkfI1oT+AFNnYzVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dZcTslsh; dkim-atps=neutral; spf=pass (client-ip=209.85.214.172; helo=mail-pl1-f172.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dZcTslsh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.172; helo=mail-pl1-f172.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dYsth2JhLz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Dec 2025 18:13:15 +1100 (AEDT)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0d0788adaso26590315ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Dec 2025 23:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766301133; x=1766905933; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzCtCXPpJksCwKOWKXvWbqXbkA87udvkBHpHfw0vp1Y=;
        b=dZcTslshUCcTl90gLh44liu6B3mF5bhrj4CA8nNqKz9+E4ZIjlnYnU+ryY6IGgp/Yl
         OhzLfhCEadKypg6Uk5jYVxsH0D/sqMHVvq5MxcPGmHcuhjnTWMO4E6DZkp3xOF+ZqYxt
         ventwXRsRtCfuTzSlGp59BGZgeNHPcYPFf+WMpyE56DfmZElMfzOqlBHoW7x5ROmlJ4+
         Z+r6NaSuRtZdv6dS3AP3ZRfF7aAum00RZSD7ERORN+y6Bms7Ajy+1FIjr0QH3x6SPEOZ
         1JSiHBbmcSLCI6gycIXVFUOVQHMudZlJDP/x98dwKz20QalRvVd8MPKNhLlyiiHL8zQW
         o/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766301133; x=1766905933;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzCtCXPpJksCwKOWKXvWbqXbkA87udvkBHpHfw0vp1Y=;
        b=a49KGzc/mBP11BGaEVK0Y4zmkdglJq/kGP8mN4pC9/ishjqLq61FKRkANUAxErqwJf
         vlgKq6TkzQt7iCR7PMjmt+bixdpiKKrsFzIiH9qZyRplnBXdLggPB94RSQ70rHnv45T/
         CUMAGKuFl2JSz1vsXfdlpYze0vIZTl8c3PTj6+BLafsDd3pbGYd3uOgYp3oyClMsLh8V
         zh8mAoB3brxIear4Q0tHP21UNkuWdtnHXOLXbi/lTWBL+OUKH+x64nu++YaDhhFXte60
         llm4//GP5H4yN+QhfsQTgUeGSwhiv+U+w6V81l+O+rywPyq7MNzs7R8ZeXzwWIvP7XJ5
         eQrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc0p3XYyK4c3d/9T29ILjg0vIRTmjZ2mYWY9A0EzntPvPK4P8o44u6tw/HAAEouVt/hjXe4BLaOuTB/FI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxtQXI+mgtBjMjX23lKIU80bvsGzYHldGO2G/BLVX6Abxk3RI97
	q6Qmi45GRWPaQDJZzSR3XLiZ+xiEgfIcfWq4D027QkKAIdrk1ubL2fIi
X-Gm-Gg: AY/fxX56p3gAstqFUjWwPkKmg78WcNBlLcLffcFDG+BO6IodT1XesmXL1mCkYtasVZ/
	vxY7P7A62/R/E851EO0UBgkDCc6ZIlwTuUfSKK+qPhRsE2W2AcNPpu70K0f0d6rI5qGE4SJBy81
	CYpBwvviRUL+8dIYQq30dlVCQojGb15wmHf9PGXI87FW3od/R1v1K13GaUAjT49/VqJdwq0kbBE
	BZdvyP4QzIQsiyP1iPi4hChDas+FGjSROCObjR6TssnMCJWybfz9T4/l6YcJCUfyehZRsQTKGdi
	QdqZnZzjYs4eFwGHwjuSVQkeCtaVFMJmP22/+2tJvhJNWeWQMNxUzLQv+BW9dY0kZ3z/HLBwrAg
	aI1ZwN9lDE9XmJcRBQdg/rSa1/Pc9pd2btwrKZ7icfQso0HMloxYpeViA5z/XQIdLjPyxcZ77Qm
	feUmFn
X-Google-Smtp-Source: AGHT+IGIPYFeedEPq4NHjeRfIrATjm+rPLqP/z//FB66WtSOi9nspDfl3x3TE/ddBevIS7cWXjTI7Q==
X-Received: by 2002:a17:902:d488:b0:2a0:9b4f:5ebd with SMTP id d9443c01a7336-2a2f2229d26mr67255515ad.15.1766301132600;
        Sat, 20 Dec 2025 23:12:12 -0800 (PST)
Received: from dw-tp ([171.76.81.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c828dbsm63727595ad.22.2025.12.20.23.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 23:12:11 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org, linux-riscv@lists.infradead.org, "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages are unsupported
In-Reply-To: <20251221053611.441251-1-sourabhjain@linux.ibm.com>
Date: Sun, 21 Dec 2025 11:29:25 +0530
Message-ID: <87a4zcml36.ritesh.list@gmail.com>
References: <20251221053611.441251-1-sourabhjain@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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


Hi Sourabh,

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> Skip processing hugepage kernel arguments (hugepagesz, hugepages, and
> default_hugepagesz) when hugepages are not supported by the
> architecture.
>
> Some architectures may need to disable hugepages based on conditions
> discovered during kernel boot. The hugepages_supported() helper allows
> architecture code to advertise whether hugepages are supported.
>
> Currently, normal hugepage allocation is guarded by
> hugepages_supported(), but gigantic hugepages are allocated regardless
> of this check. This causes problems on powerpc for fadump (firmware-
> assisted dump).
>
> In the fadump (firmware-assisted dump) scenario, a production kernel
> crash causes the system to boot into a special kernel whose sole
> purpose is to collect the memory dump and reboot. Features such as
> hugepages are not required in this environment and should be
> disabled.
>
> For example, when the fadump kernel boots with the following kernel
> arguments:
> default_hugepagesz=1GB hugepagesz=1GB hugepages=200
>
> Before this patch, the kernel prints the following logs:
>
> HugeTLB: allocating 200 of page size 1.00 GiB failed.  Only allocated 58 hugepages.
> HugeTLB support is disabled!
> HugeTLB: huge pages not supported, ignoring associated command-line parameters
> hugetlbfs: disabling because there are no supported hugepage sizes
>
> Even though the logs state that HugeTLB support is disabled, gigantic
> hugepages are still allocated. This causes the fadump kernel to run out
> of memory during boot.
>
> After this patch is applied, the kernel prints the following logs for
> the same command line:
>
> HugeTLB: hugepages unsupported, ignoring default_hugepagesz=1GB cmdline
> HugeTLB: hugepages unsupported, ignoring hugepagesz=1GB cmdline
> HugeTLB: hugepages unsupported, ignoring hugepages=200 cmdline
> HugeTLB support is disabled!
> hugetlbfs: disabling because there are no supported hugepage sizes
>
> To fix the issue, gigantic hugepage allocation should be guarded by
> hugepages_supported().
>
> Previously, two approaches were proposed to bring gigantic hugepage
> allocation under hugepages_supported():
>
> [1] Check hugepages_supported() in the generic code before allocating
> gigantic hugepages
> [2] Make arch_hugetlb_valid_size() return false for all hugetlb sizes
>
> Approach [2] has two minor issues:
> 1. It prints misleading logs about invalid hugepage sizes
> 2. The kernel still processes hugepage kernel arguments unnecessarily
>
> To control gigantic hugepage allocation, skip processing hugepage kernel
> arguments (default_hugepagesz, hugepagesz and hugepages) when
> hugepages_supported() returns false.
>
> Link: https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/ [1]
> Link: https://lore.kernel.org/all/20250128043358.163372-1-sourabhjain@linux.ibm.com/ [2]
> Fixes: c2833a5bf75b ("hugetlbfs: fix changes to command line processing")


I appreciate our proactiveness to respond quickly on mailing list, but I
suggest we give enough time to folks before sending the next version
please ;).

Your email from last night [1] says that we will use this fixes tag but
you haven't even given us 24hrs to respond to that email thread :). Now
we've sent this v6, with Acked-by of David and Reviewed-by of mine,
which seems like everything was agreed upon, but that isn't the case
actually.

My main concern was - 
A fixes tag means it might get auto backported to stable kernels too,
which means if the fixes tag is incorrect it could even break stable
kernels then. 

[1]: https://lore.kernel.org/linuxppc-dev/041352df-41ce-4898-8535-d6b7fd74a52b@linux.ibm.com/T/#m6e16738c03b2b2a8d09717f6291e46207033507a


Anyways,
Coming back to the fixes tag. I did mention a bit of a history [2] of
whatever I could find while reviewing this patch. I am not sure whether
you have looked into the links shared in that email or not. Here [2]: 

[2]: https://lore.kernel.org/linuxppc-dev/875xa3ksz9.ritesh.list@gmail.com/

Where I am coming from is.. The current patch is acutally a partial
revert of the patch mentioned in the fixes tag. That means if this patch
gets applied to the older stable kernels, it would end up bringing the
same problem back, which the "Fixes" tagged patch is fixing in the 1st
place, isnt' it? See this discussion [3]...

[3]: https://lore.kernel.org/all/b1f04f9f-fa46-c2a0-7693-4a0679d2a1ee@oracle.com/T/#m0eee87b458d93559426b8b0e78dc6ebcd26ad3ae

... So, IMO - the right fixes tag, if we have to add, it should be the
patch which moved the hpage_shift initialization to happen early i.e. in
mmu_early_init_devtree. That would be this patch [4]:  

[4]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2354ad252b66695be02f4acd18e37bf6264f0464

Now, it's not really that the patch [4] had any issue as such. But it
seems like, that the current fix can only be applied after patch [4] is
taken.

Do we agree? 

<...>
> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
> Changelog:
>
<...>
> v6:
>  - Updated commit message with additional logs and tags
>  - No functional changes
> ---
>  mm/hugetlb.c | 16 ++++++++++++++++
>  1

-ritesh

