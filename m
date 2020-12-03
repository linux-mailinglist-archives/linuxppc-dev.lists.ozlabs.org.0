Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 039652CE039
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 21:57:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cn7T26ms0zDrNd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 07:57:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=qcai@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ROcmYQma; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ROcmYQma; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cn2bJ0g76zDqdx
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 04:17:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607015859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DrgWEVcy5X+u7rWoXJywDRf6moICb6GY+oH3ek558X0=;
 b=ROcmYQmatK5KYcnRUw3UgbFzX1fUoWyDmYxzDZY++TiOJbJqvFMiK3Lbjng8xn53dpfTkS
 0SQ/JIbOaIEXtEAb22Dd94onOa5YXdDVFPqnBpLJXXL/B1zVieA5eeSVa2qdskANqTBWtU
 jhdzlQPOBKzGavKpDdR9x1sHyHtM60c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607015859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DrgWEVcy5X+u7rWoXJywDRf6moICb6GY+oH3ek558X0=;
 b=ROcmYQmatK5KYcnRUw3UgbFzX1fUoWyDmYxzDZY++TiOJbJqvFMiK3Lbjng8xn53dpfTkS
 0SQ/JIbOaIEXtEAb22Dd94onOa5YXdDVFPqnBpLJXXL/B1zVieA5eeSVa2qdskANqTBWtU
 jhdzlQPOBKzGavKpDdR9x1sHyHtM60c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-X6uMCanNOHypb3p87xFT6w-1; Thu, 03 Dec 2020 12:17:34 -0500
X-MC-Unique: X6uMCanNOHypb3p87xFT6w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5EDE85819D;
 Thu,  3 Dec 2020 17:17:32 +0000 (UTC)
Received: from ovpn-66-132.rdu2.redhat.com (unknown [10.10.67.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9C845C1B4;
 Thu,  3 Dec 2020 17:17:31 +0000 (UTC)
Message-ID: <e82f315e08fe9f13ce4e94259968e0782ebb57a3.camel@redhat.com>
Subject: Re: [PATCH 3/7] powerpc/64s: flush L1D after user accesses
From: Qian Cai <qcai@redhat.com>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 03 Dec 2020 12:17:31 -0500
In-Reply-To: <20201119231333.361771-4-dja@axtens.net>
References: <20201119231333.361771-1-dja@axtens.net>
 <20201119231333.361771-4-dja@axtens.net>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=qcai@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 04 Dec 2020 07:56:02 +1100
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
Cc: cmr@informatik.wtf, spoorts2@in.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-11-20 at 10:13 +1100, Daniel Axtens wrote:
> From: Nicholas Piggin <npiggin@gmail.com>
> 
> IBM Power9 processors can speculatively operate on data in the L1 cache
> before it has been completely validated, via a way-prediction mechanism. It
> is not possible for an attacker to determine the contents of impermissible
> memory using this method, since these systems implement a combination of
> hardware and software security measures to prevent scenarios where
> protected data could be leaked.
> 
> However these measures don't address the scenario where an attacker induces
> the operating system to speculatively execute instructions using data that
> the attacker controls. This can be used for example to speculatively bypass
> "kernel user access prevention" techniques, as discovered by Anthony
> Steinhauser of Google's Safeside Project. This is not an attack by itself,
> but there is a possibility it could be used in conjunction with
> side-channels or other weaknesses in the privileged code to construct an
> attack.
> 
> This issue can be mitigated by flushing the L1 cache between privilege
> boundaries of concern. This patch flushes the L1 cache after user accesses.
> 
> This is part of the fix for CVE-2020-4788.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>  .../admin-guide/kernel-parameters.txt         |  4 +
>  .../powerpc/include/asm/book3s/64/kup-radix.h | 66 ++++++++------
>  arch/powerpc/include/asm/exception-64s.h      |  3 +
>  arch/powerpc/include/asm/feature-fixups.h     |  9 ++
>  arch/powerpc/include/asm/kup.h                | 19 +++--
>  arch/powerpc/include/asm/security_features.h  |  3 +
>  arch/powerpc/include/asm/setup.h              |  1 +
>  arch/powerpc/kernel/exceptions-64s.S          | 85 ++++++-------------
>  arch/powerpc/kernel/setup_64.c                | 62 ++++++++++++++
>  arch/powerpc/kernel/vmlinux.lds.S             |  7 ++
>  arch/powerpc/lib/feature-fixups.c             | 50 +++++++++++
>  arch/powerpc/platforms/powernv/setup.c        | 10 ++-
>  arch/powerpc/platforms/pseries/setup.c        |  4 +
>  13 files changed, 233 insertions(+), 90 deletions(-)
[]
> diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> index 3ee1ec60be84..97c2394e7dea 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
[]
> +static inline bool
> +bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
> +{
> +	return WARN(mmu_has_feature(MMU_FTR_RADIX_KUAP) &&
> +		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
> +		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
> +}

A simple "echo t > /proc/sysrq-trigger" will trigger this warning almost
endlessly on Power8 NV.

.config: 
https://cailca.coding.net/public/linux/mm/git/files/master/powerpc.config

[  391.734028][ T1986] Bug: Read fault blocked by AMR!
[  391.734032][ T1986] WARNING: CPU: 80 PID: 1986 at arch/powerpc/include/asm/book3s/64/kup-radix.h:145 do_page_fault+0x8fc/0xb70
[  391.734232][ T1986] Modules linked in: kvm_hv kvm ip_tables x_tables sd_mod ahci libahci tg3 libata firmware_class libphy dm_mirror dm_region_hash dm_log dm_mod
[  391.734425][ T1986] CPU: 80 PID: 1986 Comm: bash Tainted: G        W         5.10.0-rc6-next-20201203+ #3
[  391.734535][ T1986] NIP:  c00000000004dd1c LR: c00000000004dd18 CTR: 0000000000000000
[  391.734648][ T1986] REGS: c00020003a0bf3a0 TRAP: 0700   Tainted: G        W          (5.10.0-rc6-next-20201203+)
[  391.734768][ T1986] MSR:  9000000000021033 <SF,HV,ME,IR,DR,RI,LE>  CR: 48222284  XER: 00000000
[  391.734906][ T1986] CFAR: c0000000000bb05c IRQMASK: 1 
[  391.734906][ T1986] GPR00: c00000000004dd18 c00020003a0bf630 c000000007fe0d00 000000000000001f 
[  391.734906][ T1986] GPR04: c000000000f1cc58 0000000000000003 0000000000000027 c000201cc6207218 
[  391.734906][ T1986] GPR08: 0000000000000023 0000000000000002 c00020004753bd80 c000000007f1cee8 
[  391.734906][ T1986] GPR12: 0000000000002000 c000201fff7f8380 0000000040000000 0000000110929798 
[  391.734906][ T1986] GPR16: 0000000110929724 00000001108c6988 000000011085f290 000000011092d568 
[  391.734906][ T1986] GPR20: 00000001229f1f80 0000000000000001 0000000000000001 c000000000aa8dc8 
[  391.734906][ T1986] GPR24: c000000000ab4a00 c00020001cc8c880 0000000000000000 0000000000000000 
[  391.734906][ T1986] GPR28: c00000000801aa18 0000000000000160 c00020003a0bf760 0000000000000300 
[  391.735865][ T1986] NIP [c00000000004dd1c] do_page_fault+0x8fc/0xb70
[  391.735947][ T1986] LR [c00000000004dd18] do_page_fault+0x8f8/0xb70
[  391.736033][ T1986] Call Trace:
[  391.736072][ T1986] [c00020003a0bf630] [c00000000004dd18] do_page_fault+0x8f8/0xb70 (unreliable)
[  391.736181][ T1986] [c00020003a0bf6f0] [c00000000000c1b8] handle_page_fault+0x10/0x2c
[  391.736294][ T1986] --- interrupt: 300 at copy_from_kernel_nofault+0x68/0x190
[  391.736294][ T1986]     LR = copy_from_kernel_nofault+0x40/0x190
[  391.736441][ T1986] [c00020003a0bf9f0] [c00020003a0bfa30] 0xc00020003a0bfa30 (unreliable)
[  391.736565][ T1986] [c00020003a0bfa30] [c0000000000edd98] print_worker_info+0xe8/0x1c0
[  391.736672][ T1986] [c00020003a0bfaf0] [c000000000104b0c] sched_show_task+0x2dc/0x350
[  391.736807][ T1986] [c00020003a0bfb70] [c000000000112cd8] show_state_filter+0x148/0x320
[  391.736899][ T1986] [c00020003a0bfbe0] [c00000000070a3f4] sysrq_handle_showstate+0x24/0x40
[  391.736995][ T1986] [c00020003a0bfc00] [c00000000070add4] __handle_sysrq+0x164/0x280
[  391.737111][ T1986] [c00020003a0bfca0] [c00000000070b03c] write_sysrq_trigger+0xfc/0x13c
[  391.737233][ T1986] [c00020003a0bfce0] [c0000000004c579c] proc_reg_write+0x10c/0x1b0
[  391.737327][ T1986] [c00020003a0bfd10] [c0000000003e5ec4] vfs_write+0xf4/0x480
[  391.737431][ T1986] [c00020003a0bfd70] [c0000000003e642c] ksys_write+0x7c/0x140
[  391.737536][ T1986] [c00020003a0bfdc0] [c00000000002c578] system_call_exception+0xf8/0x1d0
[  391.737623][ T1986] [c00020003a0bfe20] [c00000000000d1c8] system_call_common+0xe8/0x218
[  391.737708][ T1986] Instruction dump:
[  391.737777][ T1986] 60000000 2fbb0000 e93e0168 419e007c 2fa90000 3c82f8ac 388467a0 409cfed4 
[  391.737913][ T1986] 3c62f8ac 386368a8 4806d2e1 60000000 <0fe00000> e80100d0 3ae0000b eb410090 
[  391.738041][ T1986] irq event stamp: 126198
[  391.738077][ T1986] hardirqs last  enabled at (126197): [<c00000000002cbf4>] interrupt_exit_kernel_prepare+0xb4/0x250
[  391.738196][ T1986] hardirqs last disabled at (126198): [<c00000000000897c>] data_access_common_virt+0x16c/0x180
[  391.738327][ T1986] softirqs last  enabled at (126196): [<c000000000948f08>] __do_softirq+0x388/0x704
[  391.738427][ T1986] softirqs last disabled at (126191): [<c0000000000c75b8>] irq_exit+0x198/0x1c0
[  392.177827][ T1986] ---[ end trace 8eaf99b33f09def0 ]---
[  392.177934][ T1986] Workqueue:  0x0 (mm_percpu_wq)
[  392.177994][ T1986] Call Trace:
[  392.178048][ T1986] [c00000002afbf9d0] [c000000000ab0ee8] __func__.4060+0x125178/0x185

