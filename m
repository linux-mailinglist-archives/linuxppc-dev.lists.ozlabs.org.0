Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98093BC73A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 13:52:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d01X0RkJzDqQS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 21:52:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.b="ga2DmRzW"; 
 dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46czzc1yFgzDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 21:51:07 +1000 (AEST)
Received: by mail-ed1-x543.google.com with SMTP id h2so1555872edn.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 04:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/6kM5ATWnIRmId0RwOcRfnLcpIWKP734aWDaVWhsGUo=;
 b=ga2DmRzWY94J19ywTXc7aJlINJ/KRYQ8PGtndpIW2otrRhhwz0vdOk+0aZyvFf12zM
 XpRveudYGeGkFKJSHG8HcySuK12YIGpCUEC2wkOTV45q1k8LT1ifI5j18tohQF7m/PA+
 6K8RlpcUkVPR9/+LLhQ4mzvuJBoUuyuUhlcKKiXhgp+n7PTRkv6s71hrNtmrwMJbpl7m
 e1KH2/aooSfrmq/GY1oql/dqAZBTTajifnl7uEJSb86NOqby7WFhLm7p3odLbtelzM4m
 ZVwvJJ/+RmqA5b79C+mbE04M3aieJOA2xjgY+3pjxmiSzVw2GC4lYm0cvsm1rZytvgPU
 ruog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/6kM5ATWnIRmId0RwOcRfnLcpIWKP734aWDaVWhsGUo=;
 b=fBJtC68aj16uT/vxUgnXPamGnDRjeFO/R8OjYshyteZDYkC9AweIrferh9TmuezFMm
 CKh+syHa6N123Zl6Crz4gtqTPjSdvFQ7Viyo616lx4QsVk7JIFn0N6DMeXhMS3m40Lvi
 0WvL0f9JW6NoFQlxDdjPHziyLsuULRiYNwnPVofS6LC+/+Ucip6CqM8CqkjNJmTjSQ69
 Dm4HhabWiH99NGXY5XMV0rf2kTuosYO/vWKQsxO8wxtTXauYBKjl0EuwtLAFiEnri8w5
 rSFoT1tHkw6Ps3pQZNkXNcG4FBQLVBBhQb6I787dLgW7jQFgMr9K0kraj7TywqDV0403
 SE9w==
X-Gm-Message-State: APjAAAWW22ZDn+78ZjlvNkGD94BgPXc/letW9dNyQMGeTKHiJqp/0ENv
 X25/N2vE+mgnRhnazMNXJqn0JA==
X-Google-Smtp-Source: APXvYqxJMR8XXzMM+ktrv2ws01Rr8qKWI/iP6Q9Wd6fsMeCMuUxQBVCNuUcjqBIbwcds2k2WtfZxLA==
X-Received: by 2002:a50:9fe5:: with SMTP id c92mr2202655edf.280.1569325860692; 
 Tue, 24 Sep 2019 04:51:00 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id r18sm319556edx.94.2019.09.24.04.50.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Sep 2019 04:51:00 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 60C621022A6; Tue, 24 Sep 2019 14:51:01 +0300 (+03)
Date: Tue, 24 Sep 2019 14:51:01 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V3 0/2] mm/debug: Add tests for architecture exported
 page table helpers
Message-ID: <20190924115101.p6y7vpbtgmj5qjku@box>
References: <1568961203-18660-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568961203-18660-1-git-send-email-anshuman.khandual@arm.com>
User-Agent: NeoMutt/20180716
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 20, 2019 at 12:03:21PM +0530, Anshuman Khandual wrote:
> This series adds a test validation for architecture exported page table
> helpers. Patch in the series adds basic transformation tests at various
> levels of the page table. Before that it exports gigantic page allocation
> function from HugeTLB.
> 
> This test was originally suggested by Catalin during arm64 THP migration
> RFC discussion earlier. Going forward it can include more specific tests
> with respect to various generic MM functions like THP, HugeTLB etc and
> platform specific tests.
> 
> https://lore.kernel.org/linux-mm/20190628102003.GA56463@arrakis.emea.arm.com/
> 
> Testing:
> 
> Successfully build and boot tested on both arm64 and x86 platforms without
> any test failing. Only build tested on some other platforms. Build failed
> on some platforms (known) in pud_clear_tests() as there were no available
> __pgd() definitions.
> 
> - ARM32
> - IA64

Hm. Grep shows __pgd() definitions for both of them. Is it for specific
config?


-- 
 Kirill A. Shutemov
