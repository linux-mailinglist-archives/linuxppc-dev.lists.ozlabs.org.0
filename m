Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 269CC266516
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 18:53:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp1zG49VszDqsK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 02:53:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=LzixW8IE; 
 dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp1x50141zDqq5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 02:51:19 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id j11so14717061ejk.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 09:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ymUunqCLw2vPuQ1VbXcUDi5LPgcqHOLwtMhV+h1hP00=;
 b=LzixW8IE64pueJHPc4pkVfB4hu8uL7V9KR6+6qOQDiBrSui1M4vSI9xeqysgklBESL
 0IQ4jxvW89dAuyt0txhLnLuupNLcl3TzUTNbKM8yk1mUHFyRH5GgOM7DPBaXlmnovHXl
 RwxBgeTE5qnMUevVAeinQ8lEe8Rzs7ehh51xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ymUunqCLw2vPuQ1VbXcUDi5LPgcqHOLwtMhV+h1hP00=;
 b=iof1/c6n3DTL2B7ywUqbFCmMFaIuefqaVbQL3RDP5zYpqBxxVeqwzkHhU39+dsymtT
 2Z4pPeR//FsL8zqC12aFPQXPnJkPJrvdO0mlvJHhNW35FPjdULOGefCs6kF8P3V5MsAo
 bQb7Hz3F3S3KmPTiBjHsJrf5YaA7RSHJCcouI+dZ84CpdJgWEKeVSyryRxwtWsy0ycBP
 aXmbkijvyDBVeIhU2aBsYRvNp445KW3kObE0vyvN0HY9g2A6BG4tIoWY8rdU/FoJNyne
 tNFpWKyNbia2hqWvU5RW+bzVoMRQvk3ZG7Rf54e38s81Xomx6Eh5DMqIMXtTeirIskQN
 fjgg==
X-Gm-Message-State: AOAM532FQndOouh9THXSQvv4Y8yHjWmjurp4T3WwpNx9b8lfww5Ca/v1
 19OXvBHTpgs3uiC2K58y+L70oCGJbpf6QA==
X-Google-Smtp-Source: ABdhPJzXCarie7apBd06s/G0LMTE2TAclSk9USgvfsd1lmReiPVOs7/nq+NrrQ8K7kigY0HfD5vEqg==
X-Received: by 2002:a17:906:1691:: with SMTP id
 s17mr3056145ejd.458.1599843070332; 
 Fri, 11 Sep 2020 09:51:10 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43])
 by smtp.gmail.com with ESMTPSA id k25sm1927850ejk.3.2020.09.11.09.51.09
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 09:51:10 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id k15so12126772wrn.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 09:51:09 -0700 (PDT)
X-Received: by 2002:ac2:5594:: with SMTP id v20mr585120lfg.344.1599842749970; 
 Fri, 11 Sep 2020 09:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad> <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
 <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
 <20200910181319.GO87483@ziepe.ca>
 <0c9bcb54-914b-e582-dd6d-3861267b6c94@nvidia.com>
 <20200910221116.GQ87483@ziepe.ca>
 <20200911121955.GA10250@oc3871087118.ibm.com>
In-Reply-To: <20200911121955.GA10250@oc3871087118.ibm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 11 Sep 2020 09:45:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiiEUD_XvNnXysYsKiT4B3SajWbZ4VKY3jYk-17EEaaiA@mail.gmail.com>
Message-ID: <CAHk-=wiiEUD_XvNnXysYsKiT4B3SajWbZ4VKY3jYk-17EEaaiA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
To: Alexander Gordeev <agordeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um <linux-um@lists.infradead.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 linux-mm <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-power <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 11, 2020 at 5:20 AM Alexander Gordeev
<agordeev@linux.ibm.com> wrote:
>
> What if the entry is still pud_present, but got remapped after
> READ_ONCE(*pudp)? IOW, it is still valid, but points elsewhere?

That can't happen.

The GUP walk doesn't hold any locks, but it *is* done with interrupts
disabled, and anybody who is modifying the page tables needs to do the
TLB flush, and/or RCU-free them.

The interrupt disable means that on architectures where the TLB flush
involves an IPI, it will be delayed until afterwards, but it also acts
as a big RCU read lock hammer.

So the page tables can get modified under us, but the old pages won't
be released and re-used.

                Linus
