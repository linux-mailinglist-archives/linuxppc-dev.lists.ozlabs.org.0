Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBCE1902F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 01:30:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mXFx63rfzDqxG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 11:30:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=almasrymina@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=JGS9qhFf; dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mWDH2nxjzDqHV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 10:43:34 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id k8so16781832oik.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 16:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QEuYlxaghpgWF2p5OUfw9hRKqdJnGRCmq90AXOuejGU=;
 b=JGS9qhFfhzpnjEAVbAAMHJj8in5e/nOn1IICF83YfSbXJY3qg9DEVBEwgVof62szn8
 +wcr6ReeQRfgWIdq3IXB2OeCk9osydynfhtZIMTCNHSyFiVP/P5Caj8dhLtq2BGgXDI9
 z9RWzC11+dTOKTK7uz6IWkRq0sE8ke2sODVks25xtxNeNkP0j/LZ0ZWRVSUO0ISXmDFY
 OXhQuh5V+0FA6tHkTdix9SbRKnBOQB6GwgxG+jXmCWPfN3smHYwjJomfsyJOxbvZNvce
 W9L18k9PNSoTMlcmWM5mVcddQaDKgk7ayZqZ1lqcZwPmZb1GF+ztYj4NfcNcdWQ/KL+9
 +iKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QEuYlxaghpgWF2p5OUfw9hRKqdJnGRCmq90AXOuejGU=;
 b=dznNbyu7h24W26eIq5PUqBuhwtVoEPB089+QrO7CGVkeajQ+MDVuraz4t1HkGcreg/
 4dDpVBdoNZLqjrmEhwWqvhp+0T4uZfCFSPHoiNk4Z23yA8nngEtAKChIow2Rjyb+ATdI
 4gXxUHvTontvTZZOdoa1szCpOwXEfEARyEwnrVnXex6z5otdR4hij//gaoqwjjvNLsju
 6ixYZOBIUmvX4zGCsUxrSNCExoNAskYpUljtcapPuvMlzKvKJFfJf3Xo+QW9sukozQ31
 SJtHtwR1cNo+HGxMQozQs4x/zakJ29bJa8ruGXZSWDB3RtgPLmMdzEFMWrvRI2x90B7C
 Z6mA==
X-Gm-Message-State: ANhLgQ3WVLGIdbzTPIs4xpd7dtua1ykO8KYmDp16CAgnLbbKU0tEDqAA
 2zGTiUEtOfap1hEajG+W/y0ocXY4zhMs6rkL566R2w==
X-Google-Smtp-Source: ADFU+vtBxnTz2QBJIDkSVPYlpKleGGK1ca0DAH/injUpPrVGWi+vIqGYuB7A1hrRam1e7/mwSm5ajjiQswx4Jwdrhqo=
X-Received: by 2002:aca:5d83:: with SMTP id r125mr1504637oib.8.1585007011359; 
 Mon, 23 Mar 2020 16:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
 <20200318220634.32100-2-mike.kravetz@oracle.com>
In-Reply-To: <20200318220634.32100-2-mike.kravetz@oracle.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 23 Mar 2020 16:43:19 -0700
Message-ID: <CAHS8izMnxF9e-QDmA1WL4Kjgt=Uu0Xk64WZB1-bbvO4A+2fZiA@mail.gmail.com>
Subject: Re: [PATCH 1/4] hugetlbfs: add arch_hugetlb_valid_size
To: Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 24 Mar 2020 11:28:47 +1100
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Longpeng <longpeng2@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 18, 2020 at 3:07 PM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> The architecture independent routine hugetlb_default_setup sets up
> the default huge pages size.  It has no way to verify if the passed
> value is valid, so it accepts it and attempts to validate at a later
> time.  This requires undocumented cooperation between the arch specific
> and arch independent code.
>
> For architectures that support more than one huge page size, provide
> a routine arch_hugetlb_valid_size to validate a huge page size.
> hugetlb_default_setup can use this to validate passed values.
>
> arch_hugetlb_valid_size will also be used in a subsequent patch to
> move processing of the "hugepagesz=" in arch specific code to a common
> routine in arch independent code.
>
> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
> ---
>  arch/arm64/include/asm/hugetlb.h   |  2 ++
>  arch/arm64/mm/hugetlbpage.c        | 19 ++++++++++++++-----
>  arch/powerpc/include/asm/hugetlb.h |  3 +++
>  arch/powerpc/mm/hugetlbpage.c      | 20 +++++++++++++-------
>  arch/riscv/include/asm/hugetlb.h   |  3 +++
>  arch/riscv/mm/hugetlbpage.c        | 28 ++++++++++++++++++----------
>  arch/s390/include/asm/hugetlb.h    |  3 +++
>  arch/s390/mm/hugetlbpage.c         | 18 +++++++++++++-----
>  arch/sparc/include/asm/hugetlb.h   |  3 +++
>  arch/sparc/mm/init_64.c            | 23 ++++++++++++++++-------
>  arch/x86/include/asm/hugetlb.h     |  3 +++
>  arch/x86/mm/hugetlbpage.c          | 21 +++++++++++++++------
>  include/linux/hugetlb.h            |  7 +++++++
>  mm/hugetlb.c                       | 16 +++++++++++++---
>  14 files changed, 126 insertions(+), 43 deletions(-)
>

With build fixes:
Acked-by: Mina Almasry <almasrymina@google.com>
