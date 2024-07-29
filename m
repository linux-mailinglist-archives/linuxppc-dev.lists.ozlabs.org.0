Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6C89400EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:11:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FMBGN/vh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXsyk5MS6z3cSN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 08:11:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FMBGN/vh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXsxx26c5z3c58
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 08:11:00 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-76cb5b6b3e4so2215747a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2024 15:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722291054; x=1722895854; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsaV4aHVmDy9BEabdtZUIrUBdmxkjCnLJv1JmYCf5Ew=;
        b=FMBGN/vh3euJDDrA3myhSRclQOFz8v+f3M38UCS15opfGxKS6YYZTPWc8Y0p+WWFZc
         GYKM/e/BhDQ3ed8kaJOtzCrqdv8t3N8mC/+RLB1PKZtzR56NrsnqJYaI5DxTydUPI/qQ
         gHRC78rVsbj9Nm+za8oJ3eeKs4KQZHJeZwkubSQQmaQaf274DvR74iQE8SK4LF42rrlT
         fkFv8aspQzwu7QZlXWZwAhVwf/dAx2Z/wyewzpMIiscY1NXUKzaeq7D1wX6CFvWDXlSV
         /iW6r43Y1dAxKxGq8Ra0ZkvPdVYL3LZLbOSzL+xqV8l62ed6blOqqfMA0xuqjzVC5YT5
         y1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722291054; x=1722895854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsaV4aHVmDy9BEabdtZUIrUBdmxkjCnLJv1JmYCf5Ew=;
        b=lb4zmZM8dh7Wm+6KX81eQ1HsebL5/kjt/R2Yx6WYCScSoYUFF1ddLFmCnNOw1aKlFl
         gWwSBF53cN7sjl3l0srWgWPMWy5LJTQTB3M3UIKklxnNEcmpHSlGv8NVTyoKJv4xpuCo
         0pvN6lcYiZMHfVJ36BT5FIqoo7DnjxqmTQdNlJKcKpJAALc2OiBTJ8fKYPeeAMSz3teY
         h/HvbXDdjpFSkQX78HvVcV5YLQTTMQ7dqFEScrz01bB8fffhDU8Pzb30ELxi1jQc7QUX
         543bM+6vId4MEd/ymjJMMF04Gb+XaKQOUMrLsoYh+uIZfWdlzSJjLUgAd3QzZgd6NI6w
         3pMw==
X-Forwarded-Encrypted: i=1; AJvYcCUv3UdCX+QD7wH8TH9Ad2BDqxpF6A7V/IlyevSMIj+5/Aths4HuiXkKTra9KopwIsuGAl1T61IdlcDEaA3OygrR26zPj6szWBBjObx21Q==
X-Gm-Message-State: AOJu0YwSwIiWNNKQyFka4dVrmdbJNEobfhkF7LnI6GrSRVTInuvdfkyC
	cZ3veF/Gw/eg9v/EHS1tMWcHxSX+pv3NJIy90jb1n6QmvIkqttA/
X-Google-Smtp-Source: AGHT+IHFgFcC7a2AZ2iDodzdSo6v8vO5cepaMu/+vRjjPgAt8xw8okI5cuuhotMAuv9cY44n3r+MCw==
X-Received: by 2002:a17:90b:4a0d:b0:2c9:9b65:af4d with SMTP id 98e67ed59e1d1-2cf7e098639mr6500208a91.7.1722291053817;
        Mon, 29 Jul 2024 15:10:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb74e9d4fsm11164225a91.35.2024.07.29.15.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 15:10:53 -0700 (PDT)
Date: Mon, 29 Jul 2024 15:10:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v7 16/23] powerpc/e500: Switch to 64 bits PGD on 85xx (32
 bits)
Message-ID: <2c7adbc9-609d-41a9-8a3b-a63d59e21a1f@roeck-us.net>
References: <cover.1719928057.git.christophe.leroy@csgroup.eu>
 <ca85397df02564e5edc3a3c27b55cf43af3e4ef3.1719928057.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca85397df02564e5edc3a3c27b55cf43af3e4ef3.1719928057.git.christophe.leroy@csgroup.eu>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Tue, Jul 02, 2024 at 03:51:28PM +0200, Christophe Leroy wrote:
> At the time being when CONFIG_PTE_64BIT is selected, PTE entries are
> 64 bits but PGD entries are still 32 bits.
> 
> In order to allow leaf PMD entries, switch the PGD to 64 bits entries.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

With this patch in the mainline kernel, all my boot tests based on the
mpc8544ds qemu emulation start crashing. Example crash log:

kernel BUG at include/linux/pgtable.h:1599!
Oops: Exception in kernel mode, sig: 5 [#1]
BE PAGE_SIZE=4K MPC8544 DS
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper Tainted: G                 N 6.11.0-rc1 #1
Tainted: [N]=TEST
Hardware name: MPC8544DS e500v2 0x80210030 MPC8544 DS
NIP:  c01f51b8 LR: c01f6fec CTR: 00000000
REGS: c4135c40 TRAP: 0700   Tainted: G                 N  (6.11.0-rc1)
MSR:  00029000 <CE,EE,ME>  CR: 24228288  XER: 20000000
GPR00: c01f6fc0 c4135d30 c415bf20 c762e3f0 c29c9318 c7624ff8 0000026b b5fc2ea1
GPR08: 00000000 00000000 5a5a5000 b7f4dd55 44228282 00000000 c0005014 00000000
GPR16: 00000000 00000000 00000001 00050003 24228282 24228282 00000000 00000095
GPR24: c1375b30 c4135de8 c4135e48 00050003 c762e3a0 c762e3f0 bffffff1 c7676a08
NIP [c01f51b8] pmd_write.constprop.0.isra.0+0x4/0x8
LR [c01f6fec] follow_page_mask+0x150/0x17c
Call Trace:
[c4135d30] [c4135de8] 0xc4135de8 (unreliable)
[c4135d40] [c01f6fc0] follow_page_mask+0x124/0x17c
[c4135d70] [c01f7170] __get_user_pages+0x158/0x5d8
[c4135dd0] [c01f7750] get_user_pages_remote+0x160/0x560
[c4135e30] [c026838c] get_arg_page+0xb0/0x25c
[c4135e70] [c0268dd4] copy_string_kernel+0xf0/0x200
[c4135eb0] [c026a0e4] kernel_execve+0xbc/0x190
[c4135ee0] [c0005108] kernel_init+0xf4/0x1d4
[c4135f00] [c0016224] ret_from_kernel_user_thread+0x10/0x18

This is with v6.11-rc1; the actually observed crash differs from test
to test while running bisect.

I can't just revert the patch because subsequent patches depend on it.
Is this confirmed to work on real hardware ? If so, do you have a
suggestion how I could continue to use the mpc8544ds emulation for
testing, or is it just dead ?

For reference, the configuration file is mpc85xx_defconfig.
Bisect log is attached.

Thanks,
Guenter

---
# bad: [8400291e289ee6b2bf9779ff1c83a291501f017b] Linux 6.11-rc1
# good: [2c9b3512402ed192d1f43f4531fb5da947e72bd0] Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
git bisect start 'v6.11-rc1' '2c9b3512402e'
# bad: [6dc2e98d5f1de162d1777aee97e59d75d70d07c5] s390: Remove protvirt and kvm config guards for uv code
git bisect bad 6dc2e98d5f1de162d1777aee97e59d75d70d07c5
# bad: [30d77b7eef019fa4422980806e8b7cdc8674493e] mm/mglru: fix ineffective protection calculation
git bisect bad 30d77b7eef019fa4422980806e8b7cdc8674493e
# good: [c02525a33969000fa7b595b743deb4d79804916b] ftrace: unpoison ftrace_regs in ftrace_ops_list_func()
git bisect good c02525a33969000fa7b595b743deb4d79804916b
# good: [8ef6fd0e9ea83a792ba53882ddc6e0d38ce0d636] Merge branch 'mm-hotfixes-stable' into mm-stable to pick up "mm: fix crashes from deferred split racing folio migration", needed by "mm: migrate: split folio_migrate_mapping()".
git bisect good 8ef6fd0e9ea83a792ba53882ddc6e0d38ce0d636
# good: [a898530eea3d0ba08c17a60865995a3bb468d1bc] powerpc/64e: split out nohash Book3E 64-bit code
git bisect good a898530eea3d0ba08c17a60865995a3bb468d1bc
# bad: [00f58104202c472e487f0866fbd38832523fd4f9] mm: fix khugepaged activation policy
git bisect bad 00f58104202c472e487f0866fbd38832523fd4f9
# good: [e081c14744f4a93514069e1af1a7273d5451b909] powerpc/e500: remove enc and ind fields from struct mmu_psize_def
git bisect good e081c14744f4a93514069e1af1a7273d5451b909
# bad: [57fb15c32f4f6a4f1a58f1fbc58a799c3f975ed8] powerpc/64s: use contiguous PMD/PUD instead of HUGEPD
git bisect bad 57fb15c32f4f6a4f1a58f1fbc58a799c3f975ed8
# bad: [276d5affbbaea4d369d1e5b9711cb2951037f6ee] powerpc/e500: don't pre-check write access on data TLB error
git bisect bad 276d5affbbaea4d369d1e5b9711cb2951037f6ee
# bad: [84319905ca5f3759c42082e20ed978c81f4dead0] powerpc/e500: encode hugepage size in PTE bits
git bisect bad 84319905ca5f3759c42082e20ed978c81f4dead0
# bad: [6b0e82791bd03b2326c7f7d8c1124c825742f2a4] powerpc/e500: switch to 64 bits PGD on 85xx (32 bits)
git bisect bad 6b0e82791bd03b2326c7f7d8c1124c825742f2a4
# first bad commit: [6b0e82791bd03b2326c7f7d8c1124c825742f2a4] powerpc/e500: switch to 64 bits PGD on 85xx (32 bits)
