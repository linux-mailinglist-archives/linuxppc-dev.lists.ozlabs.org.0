Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2400D7EBC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 20:18:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t3ZT5q52zDr5Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 05:18:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="OnJVDC5h"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t3Nr6qNLzDr4D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 05:09:48 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id u40so31866892qth.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 11:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0qwLtcxPALcuAsItN1B8qx8pI5MyvooMsDhjXlcFVYU=;
 b=OnJVDC5hcrBKYzJ0aaZLxRkdp1U3qCbQgu81veLGc4CM3Zb6t5hcOJCBpTdvyBdixF
 VWur9qZ4L56kK+G5lLndae4M48fKcE348SEdyWD92O4lDLHkfxe5ub5wW2//gFbMdbTi
 iE/SuY24OOqYt++fDwkOv1/GwgIUIlLUQjLQSRUD9o8GbrJtA9JJHM6yNqLJ6MTwQsp1
 dfxkcvx1nTD9OtgmSDJrI8pHgij5k8GqR5jvJV2yqTmJQajvA0gKezgdBIJXSTBKmtgD
 Bn30ldSgF22fHm04r+hQGzlUE6CW7jcqmMjIT04sV5F04SskgoCcXMGW7VfjZDMID4ld
 SbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0qwLtcxPALcuAsItN1B8qx8pI5MyvooMsDhjXlcFVYU=;
 b=r1HXjbQfpzL9edZt3Z6WNSjxFRVEUp3V7AGiGRs59X4ICv35UoMXd1uktMBOy5fcCS
 EKiebeLreOzq8iX81nJf5DTkKOgIaoYm6J/Zd0n/ZDfy5iswPsim6Pm5Lr/JoRXZrZo+
 INfNsCquqNeSZVGH57u7t2AVL3SeLUAhQ9gm8Bfoer6jLO7pCtHGR42LBr2ZQYpGotui
 g5+DcdWqWdzixQc5T2iR6Gb6qbODen1xnQx0ElTJjeVK5zgaRX5SEHBP3rxp5X99/FrF
 sZ2afvEzalSLt3OD32KLN3PPdMyBoRgS+RrkyFlqsab7R4J9ltgY19VbNsWiEZzsrbG3
 a19g==
X-Gm-Message-State: APjAAAVJ9YkJQBdYlwXTUL2GCJhqQZGoQMffziup6zopfxnCUObNXgfJ
 yvfs5+ZgJKfnZ4pVG1/AVxg+S+DBYS0=
X-Google-Smtp-Source: APXvYqyVLYUWTIAK6GzhvgdzZLJE6+q5wD4mjw+q975FciP9rpwUqd4etcurLcTJHzy5ZkDdOjbnKA==
X-Received: by 2002:ac8:7289:: with SMTP id v9mr39571710qto.139.1571162985818; 
 Tue, 15 Oct 2019 11:09:45 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id k54sm15559033qtf.28.2019.10.15.11.09.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 11:09:45 -0700 (PDT)
Message-ID: <1571162982.5937.42.camel@lca.pw>
Subject: Re: [PATCH V6 2/2] mm/debug: Add tests validating architecture page
 table helpers
From: Qian Cai <cai@lca.pw>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Date: Tue, 15 Oct 2019 14:09:42 -0400
In-Reply-To: <1571131302-32290-3-git-send-email-anshuman.khandual@arm.com>
References: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
 <1571131302-32290-3-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
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

On Tue, 2019-10-15 at 14:51 +0530, Anshuman Khandual wrote:
> +static unsigned long __init get_random_vaddr(void)
> +{
> +	unsigned long random_vaddr, random_pages, total_user_pages;
> +
> +	total_user_pages = (TASK_SIZE - FIRST_USER_ADDRESS) / PAGE_SIZE;
> +
> +	random_pages = get_random_long() % total_user_pages;
> +	random_vaddr = FIRST_USER_ADDRESS + random_pages * PAGE_SIZE;
> +
> +	WARN_ON(random_vaddr > TASK_SIZE);
> +	WARN_ON(random_vaddr < FIRST_USER_ADDRESS);

It would be nice if this patch does not introduce a new W=1 GCC warning here on
x86 because FIRST_USER_ADDRESS is 0, and GCC think the code is dumb because
"random_vaddr" is unsigned,

In file included from ./arch/x86/include/asm/bug.h:83,
                 from ./include/linux/bug.h:5,
                 from ./include/linux/mmdebug.h:5,
                 from ./include/linux/gfp.h:5,
                 from mm/debug_vm_pgtable.c:13:
mm/debug_vm_pgtable.c: In function ‘get_random_vaddr’:
mm/debug_vm_pgtable.c:359:23: warning: comparison of unsigned expression < 0 is
always false [-Wtype-limits]
  WARN_ON(random_vaddr < FIRST_USER_ADDRESS);
                       ^
./include/asm-generic/bug.h:113:25: note: in definition of macro ‘WARN_ON’
  int __ret_warn_on = !!(condition);    \
                         ^~~~~~~~~
