Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC8E7C47CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 04:31:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z0w8p/Es;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z0w8p/Es;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4xbP4Ggqz3cR1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 13:31:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z0w8p/Es;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Z0w8p/Es;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4xZT2LWZz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 13:30:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696991420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcUpikdqlVkBFBhmn8IVM/gEwzIZ0mlDiQYCj1NI/Vs=;
	b=Z0w8p/EsooUMZq4v0RDhjYrhDQsEFk0CgW8MwisXgZiBKCq3+1Fcwp1NTnmHSFR8EaTcW3
	3zpnZ2u/lsFQsBT5HBZP3NlFD8fZADpwmoqY7lYiU9860BWo+Xh0bG/9eH9vQMFNMWLWSb
	XL2PUajDueFeeIfz9MDNeR2KcZqAkwg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696991420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rcUpikdqlVkBFBhmn8IVM/gEwzIZ0mlDiQYCj1NI/Vs=;
	b=Z0w8p/EsooUMZq4v0RDhjYrhDQsEFk0CgW8MwisXgZiBKCq3+1Fcwp1NTnmHSFR8EaTcW3
	3zpnZ2u/lsFQsBT5HBZP3NlFD8fZADpwmoqY7lYiU9860BWo+Xh0bG/9eH9vQMFNMWLWSb
	XL2PUajDueFeeIfz9MDNeR2KcZqAkwg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-mTBYO2vIN4K-a7mC1a4OeA-1; Tue, 10 Oct 2023 22:30:13 -0400
X-MC-Unique: mTBYO2vIN4K-a7mC1a4OeA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11513101A585;
	Wed, 11 Oct 2023 02:30:13 +0000 (UTC)
Received: from piliu.users.ipa.redhat.com (unknown [10.72.120.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AE0C40C6F79;
	Wed, 11 Oct 2023 02:30:08 +0000 (UTC)
Date: Wed, 11 Oct 2023 10:30:04 +0800
From: Pingfan Liu <piliu@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCHv8 1/5] powerpc/setup : Enable boot_cpu_hwid for PPC32
Message-ID: <ZSYIrNRSxzkiPqv+@piliu.users.ipa.redhat.com>
References: <20231009113036.45988-1-piliu@redhat.com>
 <20231009113036.45988-2-piliu@redhat.com>
 <36b2aa11-dfd9-529d-0386-aa181caeb93f@linux.ibm.com>
 <7da645c3-2899-fb01-bf11-392b9bd52e38@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <7da645c3-2899-fb01-bf11-392b9bd52e38@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Ming Lei <ming.lei@redhat.com>, linuxppc-dev@lists.ozlabs.org, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 10, 2023 at 02:38:40PM +0530, Sourabh Jain wrote:
> Hello Pingfan,
> 
> > 
> > With this patch series applied, the kdump kernel fails to boot on
> > powerpc with nr_cpus=1.
> > 
> > Console logs:
> > -------------------
> > [root]# echo c > /proc/sysrq-trigger
> > [   74.783235] sysrq: Trigger a crash
> > [   74.783244] Kernel panic - not syncing: sysrq triggered crash
> > [   74.783252] CPU: 58 PID: 3838 Comm: bash Kdump: loaded Not tainted
> > 6.6.0-rc5pf-nr-cpus+ #3
> > [   74.783259] Hardware name: POWER10 (raw) phyp pSeries
> > [   74.783275] Call Trace:
> > [   74.783280] [c00000020f4ebac0] [c000000000ed9f38]
> > dump_stack_lvl+0x6c/0x9c (unreliable)
> > [   74.783291] [c00000020f4ebaf0] [c000000000150300] panic+0x178/0x438
> > [   74.783298] [c00000020f4ebb90] [c000000000936d48]
> > sysrq_handle_crash+0x28/0x30
> > [   74.783304] [c00000020f4ebbf0] [c00000000093773c]
> > __handle_sysrq+0x10c/0x250
> > [   74.783309] [c00000020f4ebc90] [c000000000937fa8]
> > write_sysrq_trigger+0xc8/0x168
> > [   74.783314] [c00000020f4ebcd0] [c000000000665d8c]
> > proc_reg_write+0x10c/0x1b0
> > [   74.783321] [c00000020f4ebd00] [c00000000058da54]
> > vfs_write+0x104/0x4b0
> > [   74.783326] [c00000020f4ebdc0] [c00000000058dfdc]
> > ksys_write+0x7c/0x140
> > [   74.783331] [c00000020f4ebe10] [c000000000033a64]
> > system_call_exception+0x144/0x3a0
> > [   74.783337] [c00000020f4ebe50] [c00000000000c554]
> > system_call_common+0xf4/0x258
> > [   74.783343] --- interrupt: c00 at 0x7fffa0721594
> > [   74.783352] NIP:  00007fffa0721594 LR: 00007fffa0697bf4 CTR:
> > 0000000000000000
> > [   74.783364] REGS: c00000020f4ebe80 TRAP: 0c00   Not tainted
> > (6.6.0-rc5pf-nr-cpus+)
> > [   74.783376] MSR:  800000000280f033
> > <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 28222202  XER: 00000000
> > [   74.783394] IRQMASK: 0
> > [   74.783394] GPR00: 0000000000000004 00007ffffc4b6800 00007fffa0807300
> > 0000000000000001
> > [   74.783394] GPR04: 000000013549ea60 0000000000000002 0000000000000010
> > 0000000000000000
> > [   74.783394] GPR08: 0000000000000000 0000000000000000 0000000000000000
> > 0000000000000000
> > [   74.783394] GPR12: 0000000000000000 00007fffa0abaf70 0000000040000000
> > 000000011a0f9798
> > [   74.783394] GPR16: 000000011a0f9724 000000011a097688 000000011a02ff70
> > 000000011a0fd568
> > [   74.783394] GPR20: 0000000135554bf0 0000000000000001 000000011a0aa478
> > 00007ffffc4b6a24
> > [   74.783394] GPR24: 00007ffffc4b6a20 000000011a0faf94 0000000000000002
> > 000000013549ea60
> > [   74.783394] GPR28: 0000000000000002 00007fffa08017a0 000000013549ea60
> > 0000000000000002
> > [   74.783440] NIP [00007fffa0721594] 0x7fffa0721594
> > [   74.783443] LR [00007fffa0697bf4] 0x7fffa0697bf4
> > [   74.783447] --- interrupt: c00
> > I'm in purgatory
> > [    0.000000] radix-mmu: Page sizes from device-tree:
> > [    0.000000] radix-mmu: Page size shift = 12 AP=0x0
> > [    0.000000] radix-mmu: Page size shift = 16 AP=0x5
> > [    0.000000] radix-mmu: Page size shift = 21 AP=0x1
> > [    0.000000] radix-mmu: Page size shift = 30 AP=0x2
> > [    0.000000] Activating Kernel Userspace Access Prevention
> > [    0.000000] Activating Kernel Userspace Execution Prevention
> > [    0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000000010000
> > with 64.0 KiB pages (exec)
> > [    0.000000] radix-mmu: Mapped 0x0000000000010000-0x0000000000200000
> > with 64.0 KiB pages
> > [    0.000000] radix-mmu: Mapped 0x0000000000200000-0x0000000020000000
> > with 2.00 MiB pages
> > [    0.000000] radix-mmu: Mapped 0x0000000020000000-0x0000000022600000
> > with 2.00 MiB pages (exec)
> > [    0.000000] radix-mmu: Mapped 0x0000000022600000-0x0000000040000000
> > with 2.00 MiB pages
> > [    0.000000] radix-mmu: Mapped 0x0000000040000000-0x0000000180000000
> > with 1.00 GiB pages
> > [    0.000000] radix-mmu: Mapped 0x0000000180000000-0x00000001a0000000
> > with 2.00 MiB pages
> > [    0.000000] lpar: Using radix MMU under hypervisor
> > [    0.000000] Linux version 6.6.0-rc5pf-nr-cpus+
> > (root@ltcever7x0-lp1.aus.stglabs.ibm.com) (gcc (GCC) 8.5.0 20210514 (Red
> > Hat 8.5.0-20), GNU ld version 2.30-123.el8) #3 SMP Mon Oct  9 11:07:
> > 41 CDT 2023
> > [    0.000000] Found initrd at 0xc000000022e60000:0xc0000000248f08d8
> > [    0.000000] Hardware name: IBM,9043-MRX POWER10 (raw) 0x800200
> > 0xf000006 of:IBM,FW1060.00 (NM1060_016) hv:phyp pSeries
> > [    0.000000] printk: bootconsole [udbg0] enabled
> > [    0.000000] the round shift between dt seq and the cpu logic number:
> > 56
> > [    0.000000] BUG: Unable to handle kernel data access on write at
> > 0xc0000001a0000000
> > [    0.000000] Faulting instruction address: 0xc000000022009c64
> > [    0.000000] Oops: Kernel access of bad area, sig: 11 [#1]
> > [    0.000000] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> > [    0.000000] Modules linked in:
> > [    0.000000] CPU: 2 PID: 0 Comm: swapper Not tainted
> > 6.6.0-rc5pf-nr-cpus+ #3
> > [    0.000000] Hardware name:  POWER10 (raw)  hv:phyp pSeries
> > [    0.000000] NIP:  c000000022009c64 LR: c000000022009c54 CTR:
> > c0000000201ff348
> > [    0.000000] REGS: c000000022aebb00 TRAP: 0300   Not tainted
> > (6.6.0-rc5pf-nr-cpus+)
> > [    0.000000] MSR:  8000000000001033 <SF,ME,IR,DR,RI,LE> CR: 28222824 
> > XER: 00000001
> > [    0.000000] CFAR: c000000020031574 DAR: c0000001a0000000 DSISR:
> > 42000000 IRQMASK: 1
> > [    0.000000] GPR00: c000000022009ba0 c000000022aebda0 c0000000213d1300
> > 0000000000000004
> > [    0.000000] GPR04: 0000000000000001 c000000022aebbc0 c000000022aebbb8
> > 0000000000000000
> > [    0.000000] GPR08: 0000000000000001 c00000019ffffff8 000000000000003a
> > c0000000229c8a78
> > [    0.000000] GPR12: 0000000000002000 c000000022e4a800 c0000000211d34b8
> > c0000000211d3aa8
> > [    0.000000] GPR16: c0000000211d75a0 c0000000211d75b0 c0000000225f3b98
> > 0000000000000000
> > [    0.000000] GPR20: 0000000000000001 0000000000000001 0000000000000001
> > 0000000000000001
> > [    0.000000] GPR24: 0000000000000008 0000000000000000 0000000000000001
> > c00000019ffffdc0
> > [    0.000000] GPR28: 0000000000000002 c000000022b368e0 c000000022aebe08
> > 0000000000000008
> > [    0.000000] NIP [c000000022009c64] smp_setup_cpu_maps+0x420/0x724
> > [    0.000000] LR [c000000022009c54] smp_setup_cpu_maps+0x410/0x724
> > [    0.000000] Call Trace:
> > [    0.000000] [c000000022aebda0] [c000000022009ba0]
> > smp_setup_cpu_maps+0x35c/0x724 (unreliable)
> > [    0.000000] [c000000022aebeb0] [c00000002200a19c]
> > setup_arch+0x1b8/0x54c
> > [    0.000000] [c000000022aebf30] [c000000022003f88]
> > start_kernel+0xb0/0x768
> > [    0.000000] [c000000022aebfe0] [c00000002000d888]
> > start_here_common+0x1c/0x20
> > [    0.000000] Code: 3929ffff 7f89e040 409c002c 7ec4b378 7f83e378
> > 4a027939 7f83e378 4a0278e5 e95b0018 3d22017d e929f028 7d4ac42c
> > <7d49c12e> eb7b0000 7e99a378 4bffff3c
> 
> The faulting instruction address, 0xc000000022009c6, corresponds to the code
> below:
> 
> File:
> arch/powerpc/kernel/setup-common.c
> 
> Function
> void __init smp_setup_cpu_maps(void)
> {
>             ...
>             cpu_to_phys_id[bt_thread] =
> be32_to_cpu(intserv_node->intserv[bt_thread]);
>             ...
> }
> 
> Hope it helps.
> 

Appreciate your help.

This issue should be linked with the capability of cpu_to_phys_id[].

Could you please to try the fix suggested at the end of the email? 
It should be a fix for 
[PATCHv8 3/5] powerpc/setup: Handle the case when boot_cpuid greater than nr_cpus


Thanks,

Pingfan

---

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index bd7853a4bc91..849adc7a4b47 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -464,12 +464,6 @@ void __init smp_setup_cpu_maps(void)
 	DBG("smp_setup_cpu_maps()\n");
 
 	INIT_LIST_HEAD(&head);
-	cpu_to_phys_id = memblock_alloc(nr_cpu_ids * sizeof(u32),
-					__alignof__(u32));
-	if (!cpu_to_phys_id)
-		panic("%s: Failed to allocate %zu bytes align=0x%zx\n",
-		      __func__, nr_cpu_ids * sizeof(u32), __alignof__(u32));
-
 	for_each_node_by_type(dn, "cpu") {
 		const __be32 *intserv;
 		__be32 cpu_be;
@@ -533,6 +527,16 @@ void __init smp_setup_cpu_maps(void)
 		}
 
 	}
+
+	/* There may be hole between cpu0 and boot cpu */
+	j = (bt_thread + 1) > nr_cpu_ids ? (bt_thread + 1) : nr_cpu_ids;
+	cpu_to_phys_id = memblock_alloc(j * sizeof(u32),
+					__alignof__(u32));
+	if (!cpu_to_phys_id)
+		panic("%s: Failed to allocate %zu bytes align=0x%zx\n",
+		      __func__, nr_cpu_ids * sizeof(u32), __alignof__(u32));
+
+
 	cpu = 0;
 	list_del_init(&head);
 	/* Select the primary thread, the boot cpu's slibing, as the logic 0 */
-- 
2.31.1

