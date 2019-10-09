Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F51D0824
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 09:17:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46p5CN2Ps6zDqBm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2019 18:17:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=buserror.net
 (client-ip=165.227.176.147; helo=baldur.buserror.net;
 envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=buserror.net
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46p59R4slzzDqKr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2019 18:16:10 +1100 (AEDT)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1iI6AQ-0000r8-Fp; Wed, 09 Oct 2019 02:13:50 -0500
Message-ID: <38141b946f3376ce471e46eaf065e357ac540354.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Jason Yan <yanaijie@huawei.com>, mpe@ellerman.id.au, 
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com,
 christophe.leroy@c-s.fr,  benh@kernel.crashing.org, paulus@samba.org,
 npiggin@gmail.com,  keescook@chromium.org,
 kernel-hardening@lists.openwall.com
Date: Wed, 09 Oct 2019 02:13:48 -0500
In-Reply-To: <c4769b34-95f6-81b9-4856-50459630aa0d@huawei.com>
References: <20190920094546.44948-1-yanaijie@huawei.com>
 <9c2dd2a8-83f2-983c-383e-956e19a7803a@huawei.com>
 <c4769b34-95f6-81b9-4856-50459630aa0d@huawei.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: yanaijie@huawei.com, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, diana.craciun@nxp.com, christophe.leroy@c-s.fr,
 benh@kernel.crashing.org, paulus@samba.org, npiggin@gmail.com,
 keescook@chromium.org, kernel-hardening@lists.openwall.com,
 linux-kernel@vger.kernel.org, wangkefeng.wang@huawei.com, yebin10@huawei.com,
 thunder.leizhen@huawei.com, jingxiangfeng@huawei.com, zhaohongjiang@huawei.com
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
Subject: Re: [PATCH v7 00/12] implement KASLR for powerpc/fsl_booke/32
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org,
 jingxiangfeng@huawei.com, zhaohongjiang@huawei.com, thunder.leizhen@huawei.com,
 yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-10-09 at 14:10 +0800, Jason Yan wrote:
> Hi Scott,
> 
> Would you please take sometime to test this?
> 
> Thank you so much.
> 
> On 2019/9/24 13:52, Jason Yan wrote:
> > Hi Scott,
> > 
> > Can you test v7 to see if it works to load a kernel at a non-zero address?
> > 
> > Thanks,

Sorry for the delay.  Here's the output:

## Booting kernel from Legacy Image at 10000000 ...
   Image Name:   Linux-5.4.0-rc2-00050-g8ac2cf5b4
   Image Type:   PowerPC Linux Kernel Image (gzip compressed)
   Data Size:    7521134 Bytes = 7.2 MiB
   Load Address: 04000000
   Entry Point:  04000000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 1fc00000
   Booting using the fdt blob at 0x1fc00000
   Uncompressing Kernel Image ... OK
   Loading Device Tree to 07fe0000, end 07fff65c ... OK
KASLR: No safe seed for randomizing the kernel base.
OF: reserved mem: initialized node qman-fqd, compatible id fsl,qman-fqd
OF: reserved mem: initialized node qman-pfdr, compatible id fsl,qman-pfdr
OF: reserved mem: initialized node bman-fbpr, compatible id fsl,bman-fbpr
Memory CAM mapping: 64/64/64 Mb, residual: 12032Mb
Linux version 5.4.0-rc2-00050-g8ac2cf5b4e4a-dirty (scott@snotra) (gcc version 8.
1.0 (GCC)) #26 SMP Wed Oct 9 01:50:40 CDT 2019
Using CoreNet Generic machine description
printk: bootconsole [udbg0] enabled
CPU maps initialized for 1 thread per core
-----------------------------------------------------
phys_mem_size     = 0x2fc000000
dcache_bsize      = 0x40
icache_bsize      = 0x40
cpu_features      = 0x00000000000003b4
  possible        = 0x00000000010103bc
  always          = 0x0000000000000020
cpu_user_features = 0x8c008000 0x08000000
mmu_features      = 0x000a0010
physical_start    = 0xc7c4000
-----------------------------------------------------
CoreNet Generic board
mpc85xx_qe_init: Could not find Quicc Engine node
barrier-nospec: using isync; sync as speculation barrier
Zone ranges:
  Normal   [mem 0x0000000004000000-0x000000000fffffff]
  HighMem  [mem 0x0000000010000000-0x00000002ffffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000004000000-0x00000002ffffffff]
Initmem setup node 0 [mem 0x0000000004000000-0x00000002ffffffff]
Kernel panic - not syncing: Failed to allocate 125173760 bytes for node 0 memory
 map
CPU: 0 PID: 0 Comm: swapper Not tainted 5.4.0-rc2-00050-g8ac2cf5b4e4a-dirty #26
Call Trace:
[c989fe10] [c924bfb0] dump_stack+0x84/0xb4 (unreliable)
[c989fe30] [c880badc] panic+0x140/0x334
[c989fe90] [c89a1144] alloc_node_mem_map.constprop.117+0xa0/0x11c
[c989feb0] [c95481c4] free_area_init_node+0x314/0x5b8
[c989ff30] [c9548b34] free_area_init_nodes+0x57c/0x5c0
[c989ff80] [c952cbb4] setup_arch+0x250/0x270
[c989ffa0] [c95278e0] start_kernel+0x74/0x4e8
[c989fff0] [c87c4478] set_ivor+0x150/0x18c
Kernel Offset: 0x87c4000 from 0xc0000000
Rebooting in 180 seconds..

-Scott


