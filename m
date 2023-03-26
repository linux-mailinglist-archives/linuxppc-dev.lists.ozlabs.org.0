Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E54356C9872
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 00:16:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pl9KM665Tz3fSV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 09:16:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ZAGgSG23;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ZAGgSG23;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pl9JP1PNYz3c6P
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 09:16:02 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id kq3so6668877plb.13
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 15:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1679868959; x=1682460959;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKxkpTyDkoOgmmhauSQXq3aTxLtXZ7dckp0QUTgkTYc=;
        b=ZAGgSG23sEfXvfAq7VGcMZJhmVrKmVk+UAFykSBVf7IeMb0F9TkQSE7aTlsyBD/XSq
         S75w5j50slc5lYE4mZBiVQNql+ZXso0Jc4uTeqwO3lqZ34dm/yqyhPDNxMhwuES2ECHg
         JNSRLfWgwpOT/NY1RAJocbuHbaQVTWosZbQF7eCX57rwWhbaRwbTA5eLct5cApqcB5CN
         OkkX+35z1unMEITA+i/DGdl9//E42PjdQXs876s74LlryjvM3CKjsW/C+1cEupMQFalP
         LFtZa1qtbhtHArRylB08ORUVmraMlQCQrFw/KFTQKTCAOXbfwB387rIvPwoYf4L04p7W
         T7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679868959; x=1682460959;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xKxkpTyDkoOgmmhauSQXq3aTxLtXZ7dckp0QUTgkTYc=;
        b=1xkp5VPosbrViGNulG/g7DCSoIZvZ8P5jmX3sVPk3CicykSLKOPD4xRQjvNlosimmS
         yWU5GvEk00BiUDtxXa6wv4eUTZqoyWvPj3aTFqScGbTAZsh9lUqW7a0zKYi3+1J9+DAf
         gGX8QIkRQYL6QG1xms1+5WMP49g93y+pJx9Wjt9Z6aB5YS0wzzOnCKgmKxEJxOTaAXkg
         ketCDTJDMS9qoeGFtmTgb9Z9rVKyyF4ssI0ANdY1CExvCH5C+l9Yhc13S0+e1wgBYCdn
         L2K47xdoi6NGk/k78AgNbMCjNF0E9rtYd6oe+AE8cd6zwoTJolyPLvDtLENV3sTwNARv
         28Qw==
X-Gm-Message-State: AAQBX9eoHpN5W98LQ0GQ/wmoVOGyqgjXsIY7YpDJuS1LqNEF0bFSg5Fu
	H68rrKgmDMUFZULo0S9JEyUFUDxBxAzYnFMOMUzEjQ==
X-Google-Smtp-Source: AKy350ZwlEJYvS731OjbiE7yxh8pcQTcXul88edEvrJElEkn4lfqrjXxskxbfdCjhlwYR48jKa4wFA==
X-Received: by 2002:a17:902:720a:b0:1a1:b51b:4d3b with SMTP id ba10-20020a170902720a00b001a1b51b4d3bmr8194457plb.1.1679868958836;
        Sun, 26 Mar 2023 15:15:58 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ix18-20020a170902f81200b0019f1027f88bsm17790815plb.307.2023.03.26.15.15.58
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 15:15:58 -0700 (PDT)
Message-ID: <d9f63344-fe7c-56ae-b420-4a1a04a2ae4c@kernel.dk>
Date: Sun, 26 Mar 2023 16:15:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] powerpc: don't try to copy ppc for task with NULL pt_regs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Powerpc sets up PF_KTHREAD and PF_IO_WORKER with a NULL pt_regs, which
from my (arguably very short) checking is not commonly done for other
archs. This is fine, except when PF_IO_WORKER's have been created and
the task does something that causes a coredump to be generated. Then we
get this crash:

Kernel attempted to read user page (160) - exploit attempt? (uid: 1000)
BUG: Kernel NULL pointer dereference on read at 0x00000160
Faulting instruction address: 0xc0000000000c3a60
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=32 NUMA pSeries
Modules linked in: bochs drm_vram_helper drm_kms_helper xts binfmt_misc ecb ctr syscopyarea sysfillrect cbc sysimgblt drm_ttm_helper aes_generic ttm sg libaes evdev joydev virtio_balloon vmx_crypto gf128mul drm dm_mod fuse loop configfs drm_panel_orientation_quirks ip_tables x_tables autofs4 hid_generic usbhid hid xhci_pci xhci_hcd usbcore usb_common sd_mod
CPU: 1 PID: 1982 Comm: ppc-crash Not tainted 6.3.0-rc2+ #88
Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf000005 of:SLOF,HEAD hv:linux,kvm pSeries
NIP:  c0000000000c3a60 LR: c000000000039944 CTR: c0000000000398e0
REGS: c0000000041833b0 TRAP: 0300   Not tainted  (6.3.0-rc2+)
MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 88082828  XER: 200400f8
CFAR: c0000000000c386c DAR: 0000000000000160 DSISR: 40000000 IRQMASK: 0
GPR00: c000000000039920 c000000004183650 c00000000175d600 c0000000040f9800
GPR04: 0000000000000160 0000000000000008 c000000000039920 0000000000000000
GPR08: 0000000000000000 0000000000000000 00000003fe060000 0000000000002000
GPR12: c0000000000398e0 c0000003fffff200 c0000000015edbc0 c00000000ba2f648
GPR16: c00000000ba2f600 c000000001616ea8 0000000000000004 00000000ffffffff
GPR20: 0000000000000048 c000000004183918 c000000001410f00 c000000001410ef8
GPR24: c0000000040f9800 c0000000040f9800 c0000000041837b8 c0000000000398e0
GPR28: c00000000cc4cb80 c0000000040f9800 0000000000000008 0000000000000008
NIP [c0000000000c3a60] memcpy_power7+0x200/0x7d0
LR [c000000000039944] ppr_get+0x64/0xb0
Call Trace:
[c000000004183650] [c000000000039920] ppr_get+0x40/0xb0 (unreliable)
[c000000004183690] [c0000000001e5e80] __regset_get+0x180/0x1f0
[c000000004183700] [c0000000001e5f94] regset_get_alloc+0x64/0x90
[c000000004183740] [c0000000007ae638] elf_core_dump+0xb98/0x1b60
[c0000000041839c0] [c0000000007bb564] do_coredump+0x1c34/0x24a0
[c000000004183ba0] [c0000000001acf0c] get_signal+0x71c/0x1410
[c000000004183ce0] [c0000000000228a0] do_notify_resume+0x140/0x6f0
[c000000004183db0] [c0000000000353bc] interrupt_exit_user_prepare_main+0x29c/0x320
[c000000004183e20] [c00000000003579c] interrupt_exit_user_prepare+0x6c/0xa0
[c000000004183e50] [c00000000000c6f4] interrupt_return_srr_user+0x8/0x138
--- interrupt: 300 at 0x183ee09e0
NIP:  0000000183ee09e0 LR: 0000000183ee09dc CTR: 800000000280f033
REGS: c000000004183e80 TRAP: 0300   Not tainted  (6.3.0-rc2+)
MSR:  800000000000d033 <SF,EE,PR,ME,IR,DR,RI,LE>  CR: 22002848  XER: 000000f8
CFAR: 00007ffe6d746aa8 DAR: 0000000000000000 DSISR: 42000000 IRQMASK: 0
GPR00: 0000000183ee09dc 00007ffff20d37c0 0000000183f07f00 0000000000000000
GPR04: 0000000000000000 00007ffff20d37a8 0000000000000000 00007ffe6d9eae00
GPR08: 00007ffff20d3710 0000000000000000 0000000000000000 0000000000000000
GPR12: 0000000000000000 00007ffe6d9eae00 0000000000000000 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000183ee0860
GPR24: 00007ffe6d9df820 00007ffe6d9e0000 00007ffff20d7d98 0000000000000001
GPR28: 0000000183ee0c60 00007ffff20d7924 00007ffff20d7820 0000000000000000
NIP [0000000183ee09e0] 0x183ee09e0
LR [0000000183ee09dc] 0x183ee09dc
--- interrupt: 300
Code: f9030018 38630020 409f001c e8040000 e8c40008 38840010 f8030000 f8c30008 38630010 78a50720 7cb01120 409c001c <80040000> 80c40004 38840008 90030000
---[ end trace 0000000000000000 ]---

note: ppc-crash[1982] exited with irqs disabled

because ppr_get() is trying to copy from a PF_IO_WORKER with a NULL
pt_regs.

Check for a valid pt_regs in both ppc_get/ppr_set, and return an error
if not set. The actual error value doesn't seem to be important here,
so just pick -EINVAL.

Signed-off-by: Jens Axboe <axboe@kernel.dk>

diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 2087a785f05f..80b699dd0d7f 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -290,6 +290,8 @@ static int gpr_set(struct task_struct *target, const struct user_regset *regset,
 static int ppr_get(struct task_struct *target, const struct user_regset *regset,
 		   struct membuf to)
 {
+	if (!target->thread.regs)
+		return -EINVAL;
 	return membuf_write(&to, &target->thread.regs->ppr, sizeof(u64));
 }
 
@@ -297,6 +299,8 @@ static int ppr_set(struct task_struct *target, const struct user_regset *regset,
 		   unsigned int pos, unsigned int count, const void *kbuf,
 		   const void __user *ubuf)
 {
+	if (!target->thread.regs)
+		return -EINVAL;
 	return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
 				  &target->thread.regs->ppr, 0, sizeof(u64));
 }

-- 
Jens Axboe

