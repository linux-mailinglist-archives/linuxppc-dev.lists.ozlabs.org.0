Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 066BA591ACD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Aug 2022 15:58:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M4hvn6c3Lz3c4B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Aug 2022 23:58:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XoC0daH1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XoC0daH1;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M4hvC1Zzjz2xGx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Aug 2022 23:57:42 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id q7-20020a17090a7a8700b001f300db8677so3187787pjf.5
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Aug 2022 06:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc;
        bh=PAh8Ru79cdln4uj9Rh2nf6k+W2vrmNM+Y1Sa0VOhW3g=;
        b=XoC0daH1ngdKRR+QAq5o2F6RWqroxJSJJ1IPGqT8PsSEn/PFdGsY/4KuKo4tAxt8ls
         qC6A4fknvjjpzs5FIgjabKgbMiPDCSZJRbDIYFqyK5XeGuUJmabOkdRScKX/RxoYp35P
         vg+mOYsSfdXVza4Af9bdheRKDss98lbULdgzqFzUYXqrKpr1/J992rpigAEwELNHQbfD
         yvPMMN8HmqCJRms7b9HzW3ACBRzUrufqhxiyPU5lZjt61fQo+3mP0L1TKEnahtYDBb/l
         BeSRlT3fHV8XHholbPp1q4qftCUvveE+Jl3yv6+aOgT35HctSboXW+4Nks6Sfal22p9k
         SvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc;
        bh=PAh8Ru79cdln4uj9Rh2nf6k+W2vrmNM+Y1Sa0VOhW3g=;
        b=YttVwvuZt06eN+H/WoKkMRFlGPVsZdWbbDg5cHENt7Ul7MsX3IVhhi+gHeqH7bUe4o
         ASYgbaHHd0mE1c6HnaRGifgbwiICYtZFk0/MEMnPHLcAnBy3SFoxKv2c58pjKmkIJUDC
         QfvZqePzMbGBtBzKBC9P8lWxCeHq6lxq8E+m6EHL7DfrTxWmqW1uqKSXuNlGRRj9Z+ZD
         feMQoT7lIS+luftv0qd3RYHvtf45zNXWH7L5xkB+8v3F/oBQkD8LUphfp0Ze5kvaZeAk
         3rL4QLbDA/WqceubXp8n7hKyVZMV3mKdwu2hfbWSOarVgodbcxIHcDEbMQjNIrtBiwo6
         +AkQ==
X-Gm-Message-State: ACgBeo2puExwL7G87b8LYOah4xEWUrSlfMPYyxyFJdp//zeLXFnBpmwV
	41BQ0JvkX5SM9IkglD6ncN8=
X-Google-Smtp-Source: AA6agR4r/ZIdLZr7R6ezQ90uGKTlapxmAzO1FYQi+uc43fFZ75T3cJ04/JEWN+55uAYBopWxWBeaig==
X-Received: by 2002:a17:90a:590e:b0:1f2:2184:6893 with SMTP id k14-20020a17090a590e00b001f221846893mr19283389pji.57.1660399057398;
        Sat, 13 Aug 2022 06:57:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l10-20020a17090a4d4a00b001efa332d365sm1575794pjh.33.2022.08.13.06.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 06:57:36 -0700 (PDT)
Date: Sat, 13 Aug 2022 06:57:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v2 2/2] powerpc/pci: Prefer PCI domain assignment via DT
 'linux,pci-domain' and alias
Message-ID: <20220813135735.GA3413265@roeck-us.net>
References: <20220706102148.5060-1-pali@kernel.org>
 <20220706102148.5060-2-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220706102148.5060-2-pali@kernel.org>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Guowen Shan <gshan@redhat.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Bjorn Helgaas <helgaas@kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 06, 2022 at 12:21:48PM +0200, Pali Rohár wrote:
> Other Linux architectures use DT property 'linux,pci-domain' for specifying
> fixed PCI domain of PCI controller specified in Device-Tree.
> 
> And lot of Freescale powerpc boards have defined numbered pci alias in
> Device-Tree for every PCIe controller which number specify preferred PCI
> domain.
> 
> So prefer usage of DT property 'linux,pci-domain' (via function
> of_get_pci_domain_nr()) and DT pci alias (via function of_alias_get_id())
> on powerpc architecture for assigning PCI domain to PCI controller.
> 
> Fixes: 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on device-tree properties")
> Signed-off-by: Pali Rohár <pali@kernel.org>

This patch results in a number of boot warnings with various qemu
boot tests.

Sample log and bisect results are attached.

Guenter

---
BUG: sleeping function called from invalid context at kernel/locking/mutex.c:580
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 1, name: swapper
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
1 lock held by swapper/1:
 #0: c157efb0 (hose_spinlock){+.+.}-{2:2}, at: pcibios_alloc_controller+0x64/0x220
Preemption disabled at:
[<00000000>] 0x0
CPU: 0 PID: 1 Comm: swapper Not tainted 5.19.0-yocto-standard+ #1
Call Trace:
[d101dc90] [c073b264] dump_stack_lvl+0x50/0x8c (unreliable)
[d101dcb0] [c0093b70] __might_resched+0x258/0x2a8
[d101dcd0] [c0d3e634] __mutex_lock+0x6c/0x6ec
[d101dd50] [c0a84174] of_alias_get_id+0x50/0xf4
[d101dd80] [c002ec78] pcibios_alloc_controller+0x1b8/0x220
[d101ddd0] [c140c9dc] pmac_pci_init+0x198/0x784
[d101de50] [c140852c] discover_phbs+0x30/0x4c
[d101de60] [c0007fd4] do_one_initcall+0x94/0x344
[d101ded0] [c1403b40] kernel_init_freeable+0x1a8/0x22c
[d101df10] [c00086e0] kernel_init+0x34/0x160
[d101df30] [c001b334] ret_from_kernel_thread+0x5c/0x64

=============================
[ BUG: Invalid wait context ]
5.19.0-yocto-standard+ #1 Tainted: G        W
-----------------------------
swapper/1 is trying to lock:
c16a9dd8 (of_mutex){+.+.}-{3:3}, at: of_alias_get_id+0x50/0xf4
other info that might help us debug this:
context-{4:4}
1 lock held by swapper/1:
 #0: c157efb0 (hose_spinlock){+.+.}-{2:2}, at: pcibios_alloc_controller+0x64/0x220
stack backtrace:
CPU: 0 PID: 1 Comm: swapper Tainted: G        W          5.19.0-yocto-standard+ #1
Call Trace:
[d101dbc0] [c073b264] dump_stack_lvl+0x50/0x8c (unreliable)
[d101dbe0] [c00bb8e8] __lock_acquire+0x8c4/0x2278
[d101dc60] [c00ba4b8] lock_acquire+0x148/0x3b4
[d101dcd0] [c0d3e688] __mutex_lock+0xc0/0x6ec
[d101dd50] [c0a84174] of_alias_get_id+0x50/0xf4
[d101dd80] [c002ec78] pcibios_alloc_controller+0x1b8/0x220
[d101ddd0] [c140c9dc] pmac_pci_init+0x198/0x784
[d101de50] [c140852c] discover_phbs+0x30/0x4c
[d101de60] [c0007fd4] do_one_initcall+0x94/0x344
[d101ded0] [c1403b40] kernel_init_freeable+0x1a8/0x22c
[d101df10] [c00086e0] kernel_init+0x34/0x160
[d101df30] [c001b334] ret_from_kernel_thread+0x5c/0x64
Found UniNorth PCI host bridge at 0x00000000f2000000. Firmware bus number: 0->0
PCI host bridge /pci@f2000000 (primary) ranges:
  IO 0x00000000f2000000..0x00000000f27fffff -> 0x0000000000000000
 MEM 0x0000000080000000..0x000000008fffffff -> 0x0000000080000000

---
# bad: [69dac8e431af26173ca0a1ebc87054e01c585bcc] Merge tag 'riscv-for-linus-5.20-mw2' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux
# good: [6614a3c3164a5df2b54abb0b3559f51041cf705b] Merge tag 'mm-stable-2022-08-03' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
git bisect start 'HEAD' '6614a3c3164a'
# bad: [24cb958695724ffb4488ef4f65892c0767bcd2f2] Merge tag 's390-5.20-1' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
git bisect bad 24cb958695724ffb4488ef4f65892c0767bcd2f2
# good: [a3b5d4715fd5a839857f8b7be78dff258a8d5a47] Merge tag 'asoc-v5.20-2' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus
git bisect good a3b5d4715fd5a839857f8b7be78dff258a8d5a47
# good: [1d239c1eb873c7d6c6cbc80d68330c939fd86136] Merge tag 'iommu-updates-v5.20-or-v6.0' of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu
git bisect good 1d239c1eb873c7d6c6cbc80d68330c939fd86136
# bad: [4cfa6ff24a9744ba484521c38bea613134fbfcb3] powerpc/64e: Fix kexec build error
git bisect bad 4cfa6ff24a9744ba484521c38bea613134fbfcb3
# good: [78988b273d592ce74c8aecdd5d748906c38a9e9d] powerpc/perf: Give generic PMU a nice name
git bisect good 78988b273d592ce74c8aecdd5d748906c38a9e9d
# good: [de40303b54bc458d7df0d4b4ee1d296df7fe98c7] powerpc/ppc-opcode: Define and use PPC_RAW_SETB()
git bisect good de40303b54bc458d7df0d4b4ee1d296df7fe98c7
# bad: [738f9dca0df3bb630e6f06a19573ab4e31bd443a] powerpc/sysdev: Fix comment typo
git bisect bad 738f9dca0df3bb630e6f06a19573ab4e31bd443a
# good: [4d5c5bad51935482437528f7fa4dffdcb3330d8b] powerpc: Remove asm/prom.h from asm/mpc52xx.h and asm/pci.h
git bisect good 4d5c5bad51935482437528f7fa4dffdcb3330d8b
# good: [d80f6de9d601c30b53c17f00cb7cfe3169f2ddad] powerpc/iommu: Fix iommu_table_in_use for a small default DMA window case
git bisect good d80f6de9d601c30b53c17f00cb7cfe3169f2ddad
# bad: [0fe1e96fef0a5c53b4c0d1500d356f3906000f81] powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' and alias
git bisect bad 0fe1e96fef0a5c53b4c0d1500d356f3906000f81
# good: [d20c96deb3e2c1cedc47d2be9fc110ffed81b1af] powerpc/85xx: Fix description of MPC85xx and P1/P2 boards options
git bisect good d20c96deb3e2c1cedc47d2be9fc110ffed81b1af
# first bad commit: [0fe1e96fef0a5c53b4c0d1500d356f3906000f81] powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' and alias

