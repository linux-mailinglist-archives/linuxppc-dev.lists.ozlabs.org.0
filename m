Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 696A04A37D8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 18:13:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JmySW2NwZz3cLN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 04:12:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QF78vYBJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QF78vYBJ; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JmyRn1KdFz30Mr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 04:12:18 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id s185so22389394oie.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 09:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w1dNkPhtgiRjushmjZUey1uH/mwMDz9W8IeIjD9XGNU=;
 b=QF78vYBJuFyFO0WuVGOnN8lRblJpn342qlEeX7HiKWboUdAtwbFRe3IeTC6lVcWB/R
 4N84b2uUq2+PKSm35M7ONMSAwTC/Az0dw0ipKleJzJX2pMSA6J9nhBfISWdZWu5QJVq9
 Fo2KgA4IjFPwqEf7VtfbL+V2p8nzGF2YrZm6hfaaCt06Fag/mTDRnUoBfERcs0XRRgYZ
 0s6PTUxFBvh1truP4Kw2sc7kHYJm4j/x/3+pTbch9ghHfobfYHWUxsM/TcZgiH2YqryW
 ERjUmG8WbeJ7HXEmt5lTb4D3hBy1mtcBpyRJ9rRCAbaCfkQhD/VimAg/BuhC9lB1hbzA
 Hqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=w1dNkPhtgiRjushmjZUey1uH/mwMDz9W8IeIjD9XGNU=;
 b=HH7S/L+GKG7dD7isbUmsto7zGeng8/ZgNXB69cboYXt4x7rBo6E8b5XXW2iHM1UTzX
 0kzZ5WbvZXgHXDQqacuQkw5Y19YWjoumuTfjAfrtK60iSPMbYDeUXAE1gCFlLRq7olll
 nMDp4+vdxKGWgmfP1sL98xcRCEBWG7v/HtPkDuvdV4ZoanjZG9xFF0yHfKBu6AgFIGOS
 Yhfuhu9B/1iCSQboJQj0f6Drq5HeUPRtd0ttB4Vn6HLWasy0OhnRsw0M2zp0RK+Fpzdb
 K5ZbDKOEA8BGJ95OFsZ5uGktoT9ouVymljjC91V8KsfaInXqYG4Hyv26SsX8DIXQY7K7
 UhXg==
X-Gm-Message-State: AOAM533kuqnUR1jhHYl9eH1xa9adJSgETC13S63pSAxsXVbGBpS1mZrO
 WW2F+EA1+zAGLEgicUDg4cA=
X-Google-Smtp-Source: ABdhPJzDfpA/kFQ2ZUKPGwyRfaVdw4HLQweTlCDIHi6gw/h077fparPnBlJNMYVufYz9gxu/ali5cg==
X-Received: by 2002:a05:6808:bca:: with SMTP id
 o10mr6747446oik.58.1643562733195; 
 Sun, 30 Jan 2022 09:12:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w9sm11309793ool.31.2022.01.30.09.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 09:12:12 -0800 (PST)
Date: Sun, 30 Jan 2022 09:12:10 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V3 28/35] PCI/MSI: Simplify pci_irq_get_affinity()
Message-ID: <20220130171210.GA3545402@roeck-us.net>
References: <20211210221642.869015045@linutronix.de>
 <20211210221814.900929381@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211210221814.900929381@linutronix.de>
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
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, linux-pci@vger.kernel.org,
 Will Deacon <will@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Ashok Raj <ashok.raj@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, xen-devel@lists.xenproject.org,
 Kevin Tian <kevin.tian@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@kaod.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Marc Zygnier <maz@kernel.org>, dmaengine@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 10, 2021 at 11:19:26PM +0100, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Replace open coded MSI descriptor chasing and use the proper accessor
> functions instead.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

This patch results in the following runtime warning when booting x86
(32 bit) nosmp images from NVME in qemu.

[   14.825482] nvme nvme0: 1/0/0 default/read/poll queues
ILLOPC: ca7c6d10: 0f 0b
[   14.826188] ------------[ cut here ]------------
[   14.826307] WARNING: CPU: 0 PID: 7 at drivers/pci/msi/msi.c:1114 pci_irq_get_affinity+0x80/0x90
[   14.826455] Modules linked in:
[   14.826640] CPU: 0 PID: 7 Comm: kworker/u2:0 Not tainted 5.17.0-rc1-00419-g1d2d8baaf053 #1
[   14.826797] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.15.0-0-g2dd4b9b3f840-prebuilt.qemu.org 04/01/2014
[   14.827132] Workqueue: nvme-reset-wq nvme_reset_work
[   14.827336] EIP: pci_irq_get_affinity+0x80/0x90
[   14.827452] Code: e8 d5 30 af ff 85 c0 75 bd 90 0f 0b 31 c0 5b 5e 5d c3 8d b4 26 00 00 00 00 90 5b b8 24 32 7e cb 5e 5d c3 8d b4 26 00 00 00 00 <0f> 0b eb e0 8d b4 26 00 00 00 00 8d 74 26 00 90 55 89 e5 57 56 53
[   14.827717] EAX: 00000000 EBX: c18ba000 ECX: 00000000 EDX: c297c210
[   14.827816] ESI: 00000001 EDI: c18ba000 EBP: c1247e24 ESP: c1247e1c
[   14.827924] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00000246
[   14.828110] CR0: 80050033 CR2: ffda9000 CR3: 0b8ad000 CR4: 000006d0
[   14.828268] Call Trace:
[   14.828554]  blk_mq_pci_map_queues+0x26/0x70
[   14.828710]  nvme_pci_map_queues+0x75/0xc0
[   14.828808]  blk_mq_update_queue_map+0x86/0xa0
[   14.828891]  blk_mq_alloc_tag_set+0xf3/0x390
[   14.828965]  ? nvme_wait_freeze+0x3d/0x50
[   14.829137]  nvme_reset_work+0xd02/0x1120
[   14.829269]  ? lock_acquire+0xc3/0x290
[   14.829435]  process_one_work+0x1ed/0x490
[   14.829569]  worker_thread+0x15e/0x3c0
[   14.829665]  kthread+0xd3/0x100
[   14.829729]  ? process_one_work+0x490/0x490
[   14.829799]  ? kthread_complete_and_exit+0x20/0x20
[   14.829890]  ret_from_fork+0x1c/0x28

Bisect results below.

#regzbot introduced: f48235900182d6

Guenter

---
# bad: [e783362eb54cd99b2cac8b3a9aeac942e6f6ac07] Linux 5.17-rc1
# good: [df0cc57e057f18e44dac8e6c18aba47ab53202f9] Linux 5.16
git bisect start 'v5.17-rc1' 'v5.16'
# good: [fef8dfaea9d6c444b6c2174b3a2b0fca4d226c5e] Merge tag 'regulator-v5.17' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator
git bisect good fef8dfaea9d6c444b6c2174b3a2b0fca4d226c5e
# bad: [3ceff4ea07410763d5d4cccd60349bf7691e7e61] Merge tag 'sound-5.17-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
git bisect bad 3ceff4ea07410763d5d4cccd60349bf7691e7e61
# good: [57ea81971b7296b42fc77424af44c5915d3d4ae2] Merge tag 'usb-5.17-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
git bisect good 57ea81971b7296b42fc77424af44c5915d3d4ae2
# bad: [feb7a43de5ef625ad74097d8fd3481d5dbc06a59] Merge tag 'irq-msi-2022-01-13' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad feb7a43de5ef625ad74097d8fd3481d5dbc06a59
# good: [ce990f1de0bc6ff3de43d385e0985efa980fba24] Merge tag 'for-linus-5.17-rc1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/xen/tip
git bisect good ce990f1de0bc6ff3de43d385e0985efa980fba24
# good: [4afd2a9355a9deb16ea42b896820dacf49843a8f] Merge branches 'clk-ingenic' and 'clk-mediatek' into clk-next
git bisect good 4afd2a9355a9deb16ea42b896820dacf49843a8f
# good: [455e73a07f6e288b0061dfcf4fcf54fa9fe06458] Merge tag 'clk-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
git bisect good 455e73a07f6e288b0061dfcf4fcf54fa9fe06458
# bad: [f2948df5f87a722591499da60ab91c611422f755] x86/pci/xen: Use msi_for_each_desc()
git bisect bad f2948df5f87a722591499da60ab91c611422f755
# good: [93296cd1325d1d9afede60202d8833011c9001f2] PCI/MSI: Allocate MSI device data on first use
git bisect good 93296cd1325d1d9afede60202d8833011c9001f2
# good: [82ff8e6b78fc4587a4255301f0a283506daf11b6] PCI/MSI: Use msi_get_virq() in pci_get_vector()
git bisect good 82ff8e6b78fc4587a4255301f0a283506daf11b6
# bad: [125282cd4f33ecd53a24ae4807409da0e5e90fd4] genirq/msi: Move descriptor list to struct msi_device_data
git bisect bad 125282cd4f33ecd53a24ae4807409da0e5e90fd4
# bad: [065afdc9c521f05c53f226dabe5dda2d30294d65] iommu/arm-smmu-v3: Use msi_get_virq()
git bisect bad 065afdc9c521f05c53f226dabe5dda2d30294d65
# bad: [f6632bb2c1454b857adcd131320379ec16fd8666] dmaengine: mv_xor_v2: Get rid of msi_desc abuse
git bisect bad f6632bb2c1454b857adcd131320379ec16fd8666
# bad: [f48235900182d64537c6e8f8dc0932b57a1a0638] PCI/MSI: Simplify pci_irq_get_affinity()
git bisect bad f48235900182d64537c6e8f8dc0932b57a1a0638
# first bad commit: [f48235900182d64537c6e8f8dc0932b57a1a0638] PCI/MSI: Simplify pci_irq_get_affinity()
