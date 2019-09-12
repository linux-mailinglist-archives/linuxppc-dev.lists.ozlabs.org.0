Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D95B0D78
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 13:02:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TbTN46gZzF4Lm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 21:02:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.b="XU1ehr7B"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TbQf51jfzF3SS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 21:00:21 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id u6so23536793edq.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 04:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=i4n3cs5YIwHpBBnCvQbY3FnLMZHpwOIQycs63oVDiSc=;
 b=XU1ehr7BQ2UPg1KBuVQ5nl6L4OIYSyENUTpJxtu0PcESlZD1JDIDF/kfEGLVTwGTPP
 MxBuxnwufiCItM0eu2f6PGyyjzV27Q2cNWmrCI/fGkWv00JgM+mdZSN1lgpv2XIZF9yD
 Ti1WM/t84cLxXEP8DSXzi5NQKs0TYyJ79hQa7AZv9JgQdH0hTuNKnH8BEAiZ+ewccLLa
 vvU+d/v7/7I+eQ9LvIytn9jJr+WOd1sRRaRjF83QEr00IfWCJU2SCQ/EcoyWOdAh3E8X
 tFKZsg92QCTLtpzpNowjR1vbUr8LIL24WrcjhMNVcplThOrveFyd6bS7Oehx93UQGF8r
 wpAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i4n3cs5YIwHpBBnCvQbY3FnLMZHpwOIQycs63oVDiSc=;
 b=mmm7rHZ4gNhAcIHkR1e4y3Kwpl26hY2utDhRoXaJmrUbHA/oF/e2JpIyvDhk+yEBxl
 4rbhH5t6lhyK9p8BurT8gbqDvoE3uHFfHq2F+GimIlCgHh96bOllaF3aoJqZqMc5jRxW
 sbxjC+T4rc6zmRznHJgDkl+L2kQiSYazxp+lBV1KM1RfWLUQ2eppcvypObkiC3MOhDdF
 l8jr0Rg3PP44g4V2GKoNm3PQAGkNRWmyzqIOhCR6jZz3mk0+/3HgJxfb6wvJh8S3NsyS
 Ranj4r9GqPduujvrGt8WCFk/RoM9M0eMBTF7B5v4+xIOV8JTBwfM8x1vGoVSJUKqx7hA
 AH4Q==
X-Gm-Message-State: APjAAAWUgboCElJFQsm+y8VueAj+j0QY0gHOgdFpFVk5ui6ySWcdRRr1
 Ox7I/xieWJL9hTiYTueBpYXBJQ==
X-Google-Smtp-Source: APXvYqzn86bOsg/hOamx0ZM4X4jdcRXf0RIV/TYjmuJGR8c1qTMEHrx7GcnktNsAZCbZ5Sfr2/boLg==
X-Received: by 2002:a50:d084:: with SMTP id v4mr42151595edd.48.1568286015703; 
 Thu, 12 Sep 2019 04:00:15 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id 60sm4730030edg.10.2019.09.12.04.00.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Sep 2019 04:00:14 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 379ED100B4A; Thu, 12 Sep 2019 14:00:16 +0300 (+03)
Date: Thu, 12 Sep 2019 14:00:16 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V2 2/2] mm/pgtable/debug: Add test validating
 architecture page table helpers
Message-ID: <20190912110016.srrydg2krplscbgq@box>
References: <1568268173-31302-1-git-send-email-anshuman.khandual@arm.com>
 <1568268173-31302-3-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568268173-31302-3-git-send-email-anshuman.khandual@arm.com>
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
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 12, 2019 at 11:32:53AM +0530, Anshuman Khandual wrote:
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Anshuman Khandual <anshuman.khandual@arm.com>");
> +MODULE_DESCRIPTION("Test architecture page table helpers");

It's not module. Why?

BTW, I think we should make all code here __init (or it's variants) so it
can be discarded on boot. It has not use after that.

-- 
 Kirill A. Shutemov
