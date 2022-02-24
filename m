Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 884294C30AC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 16:59:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4Hf85z85z3cHS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 02:59:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4Hdg0S3tz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 02:59:01 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 88B5268AFE; Thu, 24 Feb 2022 16:58:54 +0100 (CET)
Date: Thu, 24 Feb 2022 16:58:54 +0100
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: cleanup swiotlb initialization
Message-ID: <20220224155854.GA30938@lst.de>
References: <20220222153514.593231-1-hch@lst.de>
 <09cb4ad3-88e7-3744-b4b8-a6d745ecea9e@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09cb4ad3-88e7-3744-b4b8-a6d745ecea9e@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Juergen Gross <jgross@suse.com>, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org,
 tboot-devel@lists.sourceforge.net, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks.

This looks really strange as early_amd_iommu_init should not interact much
with the changes.  I'll see if I can find a AMD system to test on.

On Wed, Feb 23, 2022 at 07:57:49PM -0500, Boris Ostrovsky wrote:
> [   37.377313] BUG: unable to handle page fault for address: ffffc90042880018
> [   37.378219] #PF: supervisor read access in kernel mode
> [   37.378219] #PF: error_code(0x0000) - not-present page
> [   37.378219] PGD 7c2f2ee067 P4D 7c2f2ee067 PUD 7bf019b067 PMD 105a30067 PTE 0
> [   37.378219] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [   37.378219] CPU: 14 PID: 1 Comm: swapper/0 Not tainted 5.17.0-rc5swiotlb #9
> [   37.378219] Hardware name: Oracle Corporation ORACLE SERVER E1-2c/ASY,Generic,SM,E1-2c, BIOS 49004900 12/23/2020
> [   37.378219] RIP: e030:init_iommu_one+0x248/0x2f0
> [   37.378219] Code: 48 89 43 68 48 85 c0 74 c4 be 00 20 00 00 48 89 df e8 ea ee ff ff 48 89 43 78 48 85 c0 74 ae c6 83 98 00 00 00 00 48 8b 43 38 <48> 8b 40 18 a8 01 74 07 83 8b a8 04 00 00 01 f6 83 a8 04 00 00 01
> [   37.378219] RSP: e02b:ffffc9004044bd18 EFLAGS: 00010286
> [   37.378219] RAX: ffffc90042880000 RBX: ffff888107260800 RCX: 0000000000000000
> [   37.378219] RDX: 0000000080000000 RSI: ffffea00041cab80 RDI: 00000000ffffffff
> [   37.378219] RBP: ffffc9004044bd38 R08: 0000000000000901 R09: ffffea00041cab00
> [   37.378219] R10: 0000000000000002 R11: 0000000000000000 R12: ffffc90040435008
> [   37.378219] R13: 0000000000080000 R14: 00000000efa00000 R15: 0000000000000000
> [   37.378219] FS:  0000000000000000(0000) GS:ffff88fef4180000(0000) knlGS:0000000000000000
> [   37.378219] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   37.378219] CR2: ffffc90042880018 CR3: 000000000260a000 CR4: 0000000000050660
> [   37.378219] Call Trace:
> [   37.378219]  <TASK>
> [   37.378219]  early_amd_iommu_init+0x3c5/0x72d
> [   37.378219]  ? iommu_setup+0x284/0x284
> [   37.378219]  state_next+0x158/0x68f
> [   37.378219]  ? iommu_setup+0x284/0x284
> [   37.378219]  iommu_go_to_state+0x28/0x2d
> [   37.378219]  amd_iommu_init+0x15/0x4b
> [   37.378219]  ? iommu_setup+0x284/0x284
> [   37.378219]  pci_iommu_init+0x12/0x37
> [   37.378219]  do_one_initcall+0x48/0x210
> [   37.378219]  kernel_init_freeable+0x229/0x28c
> [   37.378219]  ? rest_init+0xe0/0xe0
> [   37.963966]  kernel_init+0x1a/0x130
> [   37.979415]  ret_from_fork+0x22/0x30
> [   37.991436]  </TASK>
> [   37.999465] Modules linked in:
> [   38.007413] CR2: ffffc90042880018
> [   38.019416] ---[ end trace 0000000000000000 ]---
> [   38.023418] RIP: e030:init_iommu_one+0x248/0x2f0
> [   38.023418] Code: 48 89 43 68 48 85 c0 74 c4 be 00 20 00 00 48 89 df e8 ea ee ff ff 48 89 43 78 48 85 c0 74 ae c6 83 98 00 00 00 00 48 8b 43 38 <48> 8b 40 18 a8 01 74 07 83 8b a8 04 00 00 01 f6 83 a8 04 00 00 01
> [   38.023418] RSP: e02b:ffffc9004044bd18 EFLAGS: 00010286
> [   38.023418] RAX: ffffc90042880000 RBX: ffff888107260800 RCX: 0000000000000000
> [   38.155413] RDX: 0000000080000000 RSI: ffffea00041cab80 RDI: 00000000ffffffff
> [   38.175965] Freeing initrd memory: 62640K
> [   38.155413] RBP: ffffc9004044bd38 R08: 0000000000000901 R09: ffffea00041cab00
> [   38.155413] R10: 0000000000000002 R11: 0000000000000000 R12: ffffc90040435008
> [   38.155413] R13: 0000000000080000 R14: 00000000efa00000 R15: 0000000000000000
> [   38.155413] FS:  0000000000000000(0000) GS:ffff88fef4180000(0000) knlGS:0000000000000000
> [   38.287414] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   38.309557] CR2: ffffc90042880018 CR3: 000000000260a000 CR4: 0000000000050660
> [   38.332403] Kernel panic - not syncing: Fatal exception
> [   38.351414] Rebooting in 20 seconds..
>
>
>
> -boris
---end quoted text---
