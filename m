Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6129592B06
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 10:49:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5nyL04mYz3bly
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 18:49:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hqZcnnR7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TtFCt046;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hqZcnnR7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TtFCt046;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5lKj2C9Qz2xXS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 16:50:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660546241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fH5UwWIX9OQs+lDeT8kxr/N3oertTip+Q2crz6TCHlw=;
	b=hqZcnnR7VM7YPZPCOlYJ5rQtDE7he27thvCqGzifel0N0C0TXyxXUm/Fum3gKyTO6VPz6F
	hPdH+NxA6pj4ho50ldRazt3r983Qtqbm6bhHHuaYIS9rTqPvpmESkKVVIfg+UWDxejuTbq
	BFVitD90GUUKLD4FBQgXrDrVR+APY9E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660546242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fH5UwWIX9OQs+lDeT8kxr/N3oertTip+Q2crz6TCHlw=;
	b=TtFCt046G8O+Km8qmKMquxUwwz6EmilUpf6Yw0hs5oite2FqBoy+bm8cTgufAi250WnF0w
	4+2ZcESjA3mWCVT/jWMzx5lDTMMucjxOk7pUh4e/OPl0PQPooPU3XjuDzJ/Br8EKsY3XDC
	RfZXhFUnJonVEV0wqTkcLBstc/s3b+k=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-011TUPMkNtm8f2-FaDO3bw-1; Mon, 15 Aug 2022 02:50:40 -0400
X-MC-Unique: 011TUPMkNtm8f2-FaDO3bw-1
Received: by mail-pf1-f198.google.com with SMTP id i3-20020aa78b43000000b005320ac5b724so2122749pfd.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Aug 2022 23:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=fH5UwWIX9OQs+lDeT8kxr/N3oertTip+Q2crz6TCHlw=;
        b=IxYCbcjC2r++lT2oTHH5NuCAdXZeQaLQQIjDehqq2zVZ+/ehq22x8j2Zq5JiEU7BSD
         jMgviP8ZUgpxxoz0HSe1VhEGnUg7qI9cpQwF3jiAQCvSOE6ePdlfLqaWdaudNwSqi93F
         2hyZR/qs+DIpH3KDWWcqg8keunKwIsf2xLajHwX8fmIpFIIQAbGZdopgIHTolkstJIkU
         HX4E1gvpqjmCl9NRzOL3SElNZkIANlTPk4EWanz1y8mmkwq7TgN3NT8fHhw9WuTKFrF7
         zTTQewVtiQ0X3dxBzuahjrj+hBz3+15W1oICYZFlQ0XBaLeRfwZ0sEVlDmnaNFfxpPs3
         jMyw==
X-Gm-Message-State: ACgBeo0XhcA/FWr1m8qDY+lVhCkr8q6d3rbrlZjir4xngZtfqZ2cTdur
	SxAC+IW7g78jxWHPUYazdT6V4obzfsgtZ5zmNoBC296mhcIgCmLDbhq1mYig+sKwI7R52YBZASk
	9F3G0ZU7x4GZPa/QoRRidX+1Opw==
X-Received: by 2002:a05:6a00:1a49:b0:528:6ea0:14e2 with SMTP id h9-20020a056a001a4900b005286ea014e2mr14838992pfv.22.1660546238687;
        Sun, 14 Aug 2022 23:50:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4PQGZOnNvpKrm4VdqdTXnzXqXIyQPGqkluzieKE/EdGg9J7TGEQ7aCkqPIvuBbI8mBEFkBhw==
X-Received: by 2002:a05:6a00:1a49:b0:528:6ea0:14e2 with SMTP id h9-20020a056a001a4900b005286ea014e2mr14838964pfv.22.1660546237888;
        Sun, 14 Aug 2022 23:50:37 -0700 (PDT)
Received: from localhost ([240e:3a1:2ea:acc0:8cff:e01c:2dbf:2ae8])
        by smtp.gmail.com with ESMTPSA id d1-20020a623601000000b00534abad34easm2744569pfa.51.2022.08.14.23.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 23:50:37 -0700 (PDT)
Date: Mon, 15 Aug 2022 14:48:13 +0800
From: Coiby Xu <coxu@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v7 0/6] tpm: Preserve TPM measurement log across kexec
 (ppc64)
Message-ID: <20220815064813.77g6icbkygrbmapa@Rk>
References: <20220812164305.2056641-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220812164305.2056641-1-stefanb@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 15 Aug 2022 18:48:38 +1000
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
Cc: devicetree@vger.kernel.org, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, nasastry@in.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I can confirm this patch set fixes an issue that guest kdump kernel
crashes on POWER9 host by applying it to 5.19.1 (there is a conflict
when applying this patch set to latest kernel i.e. 6.0.0-rc1).

Tested-by: Coiby Xu <coxu@redhat.com>

Previously, the issue can be reproduced as follows,

1. revert commit 7c5ed82b800d ("powerpc: Set crashkernel offset to mid
    of RMA region") which masks the issue
2. build & boot the kernel with crashkernel=512M 
3. load kdump kernel and trigger kernel crash,
[    4.209792] Oops: Kernel access of bad area, sig: 11 [#1]
[    4.210373] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
[    4.210985] Modules linked in:
[    4.211570] CPU: 12 PID: 1 Comm: swapper/12 Not tainted 6.0.0-rc1+ #3
[    4.212204] NIP:  c0000000080a6540 LR: c00000000840c630 CTR: 0000000000000800
[    4.212871] REGS: c00000000e66b130 TRAP: 0300   Not tainted  (6.0.0-rc1+)
[    4.213529] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24000280  XER: 0000005b
[    4.214242] CFAR: c0000000080a6528 DAR: c00000002ffb0000 DSISR: 40000000 IRQMASK: 0 
[    4.214242] GPR00: 000000000e000000 c00000000e66b3d0 c00000000aa69a00 c0000000117c0000 
[    4.214242] GPR04: c00000002ffb0000 0000000000040000 0000000000000800 03fffffffee84000 
[    4.214242] GPR08: 0000000080000000 0000000000000010 0000000000000020 0000000000000030 
[    4.214242] GPR12: 0000000000000040 c00000000ad61000 0000000000000050 0000000000000060 
[    4.214242] GPR16: 0000000000000070 0000000000000000 0000000000000000 0000000000000000 
[    4.214242] GPR20: 0000000000000000 0000000000000000 c000000008f7ebd8 c00000000e418420 
[    4.214242] GPR24: c00000000ad3c389 c000000008f7ed60 c00000000ecc9000 c000000011271848 
[    4.214242] GPR28: c000000027fcee5c c00000002ffb0000 0000000000040000 c0000000117c0000 
[    4.220176] NIP [c0000000080a6540] memcpy_power7+0x400/0x7d0
[    4.220808] LR [c00000000840c630] kmemdup+0x50/0x80
[    4.221428] Call Trace:
[    4.222006] [c00000000e66b3d0] [c0000000080a63b4] memcpy_power7+0x274/0x7d0 (unreliable)
[    4.222662] [c00000000e66b4d0] [c00000000840c630] kmemdup+0x50/0x80
[    4.223293] [c00000000e66b510] [c000000008973ee0] tpm_read_log_of+0x110/0x1f0
[    4.223929] [c00000000e66b5a0] [c000000008973020] tpm_bios_log_setup+0x80/0x250
[    4.224552] [c00000000e66b630] [c00000000896b938] tpm_chip_register.part.0+0x38/0x2a0
[    4.225170] [c00000000e66b6b0] [c000000008979a80] tpm_ibmvtpm_probe+0x530/0x7d0
[    4.225777] [c00000000e66b790] [c0000000081055e4] vio_bus_probe+0x94/0x150
[    4.226366] [c00000000e66b7e0] [c0000000089936d4] really_probe+0x104/0x550
[    4.226947] [c00000000e66b860] [c000000008993bd4] __driver_probe_device+0xb4/0x240
[    4.227560] [c00000000e66b8e0] [c000000008993db4] driver_probe_device+0x54/0x130
[    4.228159] [c00000000e66b920] [c000000008994a88] __driver_attach+0x128/0x2d0
[    4.228748] [c00000000e66b9a0] [c00000000898fcf8] bus_for_each_dev+0xa8/0x130
[    4.229325] [c00000000e66ba00] [c000000008992bd4] driver_attach+0x34/0x50
[    4.229887] [c00000000e66ba20] [c0000000089922d8] bus_add_driver+0x218/0x300
[    4.230453] [c00000000e66bab0] [c000000008995f94] driver_register+0xb4/0x1c0
[    4.231012] [c00000000e66bb20] [c000000008103fb0] __vio_register_driver+0x80/0xf0
[    4.231569] [c00000000e66bba0] [c00000000a06807c] ibmvtpm_module_init+0x34/0x48
[    4.232119] [c00000000e66bbc0] [c000000008011c14] do_one_initcall+0x64/0x300
[    4.232664] [c00000000e66bca0] [c00000000a0053f0] do_initcalls+0x13c/0x190
[    4.233183] [c00000000e66bd50] [c00000000a00570c] kernel_init_freeable+0x22c/0x2a0
[    4.233706] [c00000000e66bdb0] [c000000008012240] kernel_init+0x30/0x1a0
[    4.234204] [c00000000e66be10] [c00000000800ca54] ret_from_kernel_thread+0x5c/0x64
[    4.234721] Instruction dump:
[    4.235191] fa010080 39800040 39c00050 39e00060 3a000070 7cc903a6 48000018 60000000 
[    4.235738] 60000000 60000000 60000000 60000000 <7ce020ce> 7cc448ce 7ca450ce 7c8458ce 
[    4.236302] ---[ end trace 0000000000000000 ]---

On Fri, Aug 12, 2022 at 12:42:59PM -0400, Stefan Berger wrote:
>The of-tree subsystem does not currently preserve the IBM vTPM 1.2 and
>vTPM 2.0 measurement logs across a kexec on PowerVM and PowerKVM. This
>series fixes this for the kexec_file_load() syscall using the flattened
>device tree (fdt) to carry the TPM measurement log's buffer across kexec.
>
>   Stefan
>
>v7:
> - Added Nageswara's Tested-by tags
> - Added back original comment to inline function and removed Jarkko's R-b tag
>
>v6:
> - Add __init to get_kexec_buffer as suggested by Jonathan
> - Fixed issue detected by kernel test robot
>
>v5:
> - Rebased on 1 more patch that would otherwise create merge conflicts
>
>v4:
> - Rebased on 2 patches that would otherwise create merge conflicts;
>   posting these patches in this series with several tags removed so
>   krobot can test the series already
> - Changes to individual patches documented in patch descripitons
>
>v3:
> - Moved TPM Open Firmware related function to drivers/char/tpm/eventlog/tpm_of.c
>
>v2:
> - rearranged patches
> - fixed compilation issues for x86
>
>
>Jonathan McDowell (1):
>  x86/kexec: Carry forward IMA measurement log on kexec
>
>Palmer Dabbelt (1):
>  drivers: of: kexec ima: Support 32-bit platforms
>
>Stefan Berger (3):
>  tpm: of: Make of-tree specific function commonly available
>  of: kexec: Refactor IMA buffer related functions to make them reusable
>  tpm/kexec: Duplicate TPM measurement log in of-tree for kexec
>
>Vaibhav Jain (1):
>  of: check previous kernel's ima-kexec-buffer against memory bounds
>
> arch/x86/Kconfig                      |   1 +
> arch/x86/include/uapi/asm/bootparam.h |   9 +
> arch/x86/kernel/e820.c                |   6 +-
> arch/x86/kernel/kexec-bzimage64.c     |  42 +++-
> arch/x86/kernel/setup.c               |  63 +++++
> drivers/char/tpm/eventlog/of.c        |  31 +--
> drivers/of/kexec.c                    | 342 ++++++++++++++++++++++----
> include/linux/ima.h                   |   5 +
> include/linux/kexec.h                 |   6 +
> include/linux/of.h                    |  11 +-
> include/linux/tpm.h                   |  36 +++
> kernel/kexec_file.c                   |   6 +
> security/integrity/ima/ima_kexec.c    |   2 +-
> 13 files changed, 478 insertions(+), 82 deletions(-)
>
>
>base-commit: 3d7cb6b04c3f3115719235cc6866b10326de34cd
>-- 
>2.35.1
>
>
>_______________________________________________
>kexec mailing list
>kexec@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/kexec
>

-- 
Best regards,
Coiby

