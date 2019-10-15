Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FD3D7F56
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 20:44:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t48Y6VzYzDr4q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 05:44:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="ih4zeCbn"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t4695n9wzDqWw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 05:42:07 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id m15so32114326qtq.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 11:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YXiUOqo8ETclVClbFsr4YOWOeJ7XlxA5Qh2JOUOHtn0=;
 b=ih4zeCbnEW9LSQmgDID0erLrP4wKSRd4quPFdjB7jDfMBRahOCBa+C67Dy1NqHkrCv
 VJSNTqSrY43O2EJhupvXVshQ0BC82dIhxESVHTwLHkCEPN42OBS3yBTYdKusIr1FPyqX
 wpUPZ/cGTRy5YK2T6ObGKxHp1+6vi2CjoWlyTCo/dPXrhBn0tNseTwJyJuKrduDqfttY
 fd4SW/I4j0BpnaIdz6zO9hqQf6+agjiuheLCXQaQrYEDCeHJq0DF3gEtcT6Uvp1RF+B9
 gDgx+ctEQBhsj7GuizlLnNWuM5pbIfjPRVvTdcRA7Ese4V0mQHl7lb1qg7KFEBXx5acS
 G4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YXiUOqo8ETclVClbFsr4YOWOeJ7XlxA5Qh2JOUOHtn0=;
 b=XxUmTXd3WDd2ZHOemOzHCjlNpSx6M6xIjStnKlll/3jKCUmhzjUurGqxlohjVNpRtM
 2jppj8RwnE/Wh1iJVU3bx2G/UVf0HiWu+QO31p09p+8xW+rBDCTjgbgspC9Ezk9szon1
 sjJXq4TlyHNccksk19il/uO/ATjcY1Lkmugqm3FCsQLSix9r6GY9W2ooW/CtFsz+tNHA
 TXKxDtKTJVzEF9PV3brNAllCf6sr7Wj5ps5Wi+cxpYQaNr+DOx4OirCH8JBEY0/yH5Ew
 Y1NR2dATEKttgf502yHwlwUMnl3wvsU/d47sN7b2eetSA9LcyQxn/xfYS4/4UdLnh05O
 Ijaw==
X-Gm-Message-State: APjAAAXIGvhHQ4unGIKHz/WVGZMRLRXT5u09PYE4V8/yUqTuxIQpeqzz
 l6IAL1ipTvA94Sn+KOjdmBh1pg==
X-Google-Smtp-Source: APXvYqwar5I/V60pS57/UcDUw1cogFuq6+7hHVlNRpscniqz5EATufxt8kONpUilAAyTNCHiUcXZ9w==
X-Received: by 2002:ac8:1c49:: with SMTP id j9mr41218038qtk.364.1571164924491; 
 Tue, 15 Oct 2019 11:42:04 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id o28sm9204198qkk.106.2019.10.15.11.42.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 11:42:03 -0700 (PDT)
Message-ID: <1571164920.5937.45.camel@lca.pw>
Subject: Re: [PATCH V6 0/2] mm/debug: Add tests validating architecture page
 table helpers
From: Qian Cai <cai@lca.pw>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Date: Tue, 15 Oct 2019 14:42:00 -0400
In-Reply-To: <c052784a-a5d7-878e-cd97-01daa90c0ed8@arm.com>
References: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
 <1571150502.5937.39.camel@lca.pw>
 <c052784a-a5d7-878e-cd97-01daa90c0ed8@arm.com>
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
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-10-15 at 20:51 +0530, Anshuman Khandual wrote:
> 
> On 10/15/2019 08:11 PM, Qian Cai wrote:
> > The x86 will crash with linux-next during boot due to this series (v5) with the
> > config below plus CONFIG_DEBUG_VM_PGTABLE=y. I am not sure if v6 would address
> > it.
> > 
> > https://raw.githubusercontent.com/cailca/linux-mm/master/x86.config
> > 
> > [   33.862600][    T1] page:ffffea0009000000 is uninitialized and poisoned
> > [   33.862608][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff
> > ffffff871140][    T1]  ? _raw_spin_unlock_irq+0x27/0x40
> > [   33.871140][    T1]  ? rest_init+0x307/0x307
> > [   33.871140][    T1]  kernel_init+0x11/0x139
> > [   33.871140][    T1]  ? rest_init+0x307/0x307
> > [   33.871140][    T1]  ret_from_fork+0x27/0x50
> > [   33.871140][    T1] Modules linked in:
> > [   33.871140][    T1] ---[ end trace e99d392b0f7befbd ]---
> > [   33.871140][    T1] RIP: 0010:alloc_gigantic_page_order+0x3fe/0x490
> 
> Hmm, with defconfig (DEBUG_VM=y and DEBUG_VM_PGTABLE=y) it does not crash but
> with the config above, it does. Just wondering if it is possible that these
> pages might not been initialized yet because DEFERRED_STRUCT_PAGE_INIT=y ?

Yes, this patch works fine.

diff --git a/init/main.c b/init/main.c
index 676d8020dd29..591be8f9e8e0 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1177,7 +1177,6 @@ static noinline void __init kernel_init_freeable(void)
        workqueue_init();
 
        init_mm_internals();
-       debug_vm_pgtable();
 
        do_pre_smp_initcalls();
        lockup_detector_init();
@@ -1186,6 +1185,8 @@ static noinline void __init kernel_init_freeable(void)
        sched_init_smp();
 
        page_alloc_init_late();
+       debug_vm_pgtable();
+
        /* Initialize page ext after all struct pages are initialized. */
        page_ext_init();

> 
> [   13.898549][    T1] page:ffffea0005000000 is uninitialized and poisoned
> [   13.898549][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
> [   13.898549][    T1] raw: ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff
> [   13.898549][    T1] page dumped because: VM_BUG_ON_PAGE(PagePoisoned(p))
> [   13.898549][    T1] ------------[ cut here ]------------
> [   13.898549][    T1] kernel BUG at ./include/linux/mm.h:1107!
> [   13.898549][    T1] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC KASAN PTI
> [   13.898549][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.4.0-rc3-next-20191015+ #
