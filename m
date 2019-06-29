Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C24B5ABF3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 16:52:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bc6s4G5szDqwm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 00:52:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AlVvTidm"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bc4R0pLSzDqC3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 00:50:12 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id cl9so4851089plb.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 07:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gpwY9SEzwskjwipmCEjEPDzJ+JkSWKdevJdN5fw1/iM=;
 b=AlVvTidmIeM8754EXuPmkm83s6qNg5Jm5gjt3YhUtsu7/PgF7C0PqVa6ptBpiy7P+b
 7w/vUfWCCFqmbb8iWdujQ5RlItRswygS1/W7QpiSFfq/fT2Nu4dRgemGkLF72hCTAl9s
 CRIHmYzfZsico8YFuLWYJ5693A7o/b4yO4xb3CGFk8Csreadz74Dd/N3TbnDzTPI329w
 tmx7Gx26KM0nmNFaM17rZJNe2CjctoMPNGJ1w13qOjvTkEKMGe5RVpeApLtX8/DXjhQN
 S2voeFsnwfTZ/9nocjMAB1DWN9izRoiZR3qOpRdSjzhL8358DohG1/ewXzBcpnKciwy+
 LQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=gpwY9SEzwskjwipmCEjEPDzJ+JkSWKdevJdN5fw1/iM=;
 b=oa70pf8ewLuw3BaxJdlBqYW+/ppKJ6T2H8FlMLCWY4YDcMqQ7XmkVAK/zWS2Opve21
 2yoQSO1Drx4VvaeAIExfauv+iBjimgTvhE0oratXyc0knruUxyZbE1UoAzKPxYfBlXx8
 HG8mE2mLwnZ+LpIKZ7FLkaABhrFo4ZzSw/mZjD1iN7EVLKu4t1akz6Efb4ulcw3SgCn+
 QsG04lwOFbIbAiZaNM9A5zkYFF+sBpJ5oa1dk8OoTATC01h2LcUiJ2JnjvbDJ48aADcm
 Ng1q2YX126QYQq5CgsKue/ybN11J+ViEl9YoprE+RZmpn2baGmOCWbtSOvaidm5NThp0
 o0mQ==
X-Gm-Message-State: APjAAAXkh2rEyzfkbd+Jw6/yQbqwXDHE9YFBI6wCSVSkuDn2sj0XCvyB
 tDQsltSo/PPf6MQ7RDqVegw=
X-Google-Smtp-Source: APXvYqwzAvuZq8uFS3MlBSIKk71/6JUg9AHYM+1A6MpIzGTxNNk8+GY2Jbg28JKN9AieKqNESQt07g==
X-Received: by 2002:a17:902:2bcb:: with SMTP id
 l69mr18151254plb.155.1561819811065; 
 Sat, 29 Jun 2019 07:50:11 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id r196sm4899405pgr.84.2019.06.29.07.50.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 29 Jun 2019 07:50:10 -0700 (PDT)
Date: Sat, 29 Jun 2019 07:50:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH] mm: Generalize and rename notify_page_fault() as
 kprobe_page_fault()
Message-ID: <20190629145009.GA28613@roeck-us.net>
References: <1560420444-25737-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560420444-25737-1-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, James Hogan <jhogan@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-snps-arc@lists.infradead.org, Fenghua Yu <fenghua.yu@intel.com>,
 linux-s390@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Paul Burton <paul.burton@mips.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, Jun 13, 2019 at 03:37:24PM +0530, Anshuman Khandual wrote:
> Architectures which support kprobes have very similar boilerplate around
> calling kprobe_fault_handler(). Use a helper function in kprobes.h to unify
> them, based on the x86 code.
> 
> This changes the behaviour for other architectures when preemption is
> enabled. Previously, they would have disabled preemption while calling the
> kprobe handler. However, preemption would be disabled if this fault was
> due to a kprobe, so we know the fault was not due to a kprobe handler and
> can simply return failure.
> 
> This behaviour was introduced in the commit a980c0ef9f6d ("x86/kprobes:
> Refactor kprobes_fault() like kprobe_exceptions_notify()")
> 

With this patch applied, parisc:allmodconfig images no longer build.

In file included from arch/parisc/mm/fixmap.c:8:
include/linux/kprobes.h: In function 'kprobe_page_fault':
include/linux/kprobes.h:477:9: error:
	implicit declaration of function 'kprobe_fault_handler'; did you mean 'kprobe_page_fault'?

Reverting the patch fixes the problem.

Guenter
