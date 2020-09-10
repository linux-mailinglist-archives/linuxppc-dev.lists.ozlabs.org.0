Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9672654DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 00:13:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnY6v4t6WzDqkj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 08:13:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=AUJ38pNh; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnY4q2DgWzDqft
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 08:11:21 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id 19so6207475qtp.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 15:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GR2McBa3c+WLdwdMHBorMHUc/q8N5804j6NsqXnydDM=;
 b=AUJ38pNh0a4cQmfCkYoSwn3bQPVBlwFjRFCC3eqLV97NVXGHYiBtqhCLijvLN5pJxI
 M83viNf12njX2Xn6pt8DTRLrTv+Yi2XRlLLobXY4F/+TXjKcrclhFAukpdgOBtvUoKKm
 ZdTIQ7EeYqDWWsH+dJqOVGuwap0dXDj7iwPesU2Oz2BoLbKastojnW9wmbmn+mbjkErc
 UAHzLwSE0IYeouh1DRajO8KaCPaHMnEMzhWcO3K0AkwuFJxqf+b2xT1vzMKusCE1sXGr
 XG2/iiyv7+8B0IDMPiPTapf/TRd17VN1WEByhVr0AC1whRwkUI37PQCd3/YwB5bWZ3LP
 KYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GR2McBa3c+WLdwdMHBorMHUc/q8N5804j6NsqXnydDM=;
 b=luOV6PRbZRjiXtx2hqAcNfaySRJg/WEByUuVOXh5FvE0UQn9jnJLYwnFCdBglMapt0
 lebjC9z0fm3nhUEJ+QXCQvUYU/GBgQuzE1hHRa4pY3UnYK3+6ytjPFVhWkSg4j6l9dTJ
 ribbKEO7WHaG/JgkaHeJc2Nq+svxYLJnJyM8hcUEQxYFzLO7ibfrXdyCsx5eIpwD6lIm
 G8W1x4bJ+9BEvh36R78faVeFllSvsslJhuXTAiF7nDSQoCCq2cqozlCVF7D8C1lMCmI4
 hFC5gFKO34PMIKw7HOM0i9sNCBOOvUWgLj2Gccc22aWEsoxGchcBWfG2yuxV0LL63O+x
 JEVg==
X-Gm-Message-State: AOAM532SqMynI35FQrO/0nhTYlfol9WXj+uSKKuNPx9XE0CygqvCz+6t
 1NW9VZyGi0HKLusscmhSaIB1qA==
X-Google-Smtp-Source: ABdhPJwpZ+eye27c1rO1L8I5ha6UkMNDUxgxsSlTX4QAPB5V32wMurFKQFX7MoZPKzYmfpKdteHCqQ==
X-Received: by 2002:ac8:66da:: with SMTP id m26mr10507099qtp.111.1599775878060; 
 Thu, 10 Sep 2020 15:11:18 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id w36sm100489qtc.48.2020.09.10.15.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 15:11:17 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kGUmi-004RcY-HM; Thu, 10 Sep 2020 19:11:16 -0300
Date: Thu, 10 Sep 2020 19:11:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [RFC PATCH v2 1/3] mm/gup: fix gup_fast with dynamic page table
 folding
Message-ID: <20200910221116.GQ87483@ziepe.ca>
References: <20200907180058.64880-2-gerald.schaefer@linux.ibm.com>
 <0dbc6ec8-45ea-0853-4856-2bc1e661a5a5@intel.com>
 <20200909142904.00b72921@thinkpad>
 <aacad1b7-f121-44a5-f01d-385cb0f6351e@intel.com>
 <20200909192534.442f8984@thinkpad>
 <20200909180324.GI87483@ziepe.ca>
 <20200910093925.GB29166@oc3871087118.ibm.com>
 <CAHk-=wh4SuNvThq1nBiqk0N-fW6NsY5w=VawC=rJs7ekmjAhjA@mail.gmail.com>
 <20200910181319.GO87483@ziepe.ca>
 <0c9bcb54-914b-e582-dd6d-3861267b6c94@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c9bcb54-914b-e582-dd6d-3861267b6c94@nvidia.com>
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
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 linux-mm <linux-mm@kvack.org>, linux-power <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 10, 2020 at 02:22:37PM -0700, John Hubbard wrote:

> Or am I way off here, and it really is possible (aside from the current
> s390 situation) to observe something that "is no longer a page table"?

Yes, that is the issue. Remember there is no locking for GUP
fast. While a page table cannot be freed there is nothing preventing
the page table entry from being concurrently modified.

Without the stack variable it looks like this:

       pud_t pud = READ_ONCE(*pudp);
       if (!pud_present(pud))
            return
       pmd_offset(pudp, address);

And pmd_offset() expands to

    return (pmd_t *)pud_page_vaddr(*pud) + pmd_index(address);

Between the READ_ONCE(*pudp) and (*pud) inside pmd_offset() the value
of *pud can change, eg to !pud_present.

Then pud_page_vaddr(*pud) will crash. It is not use after free, it
is using data that has not been validated.

Jason
