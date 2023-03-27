Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A07CC6C9B6F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 08:37:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlNQv3F2Hz3f3x
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 17:37:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D75x/PB0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D75x/PB0;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlNPx75FKz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 17:36:37 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id z19so7445117plo.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 23:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679898994;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgQWs7nhs/FdE97dkb000lced7BBVHZwFILQsK7gU7E=;
        b=D75x/PB0J6N0KVG29fPDY4P4OGCoAxTxBkt2rstxG9tVwztovk5KyckzNM/jdcIJoD
         I1YNZledYHx8iItNz9aKNKLkvOJuLXdnAnOqUxy5PNBQ3e2/rp3SCOJcwNAgu+EbhZPG
         fyJfX0q89mfDn1v4fXkc5oHQlTjRWn2fu9rgvKteT2vHDumBruqWjmpPPS3/Lc+PzJCX
         c9chvjzk3xdtNFHLvaTmfQ1UTIlQsGMRjWrddH5UDwCKAhR542x3ICkUvxxCEOUIn4H+
         9WaTtGPcmIxrLXE/Q5+0orKlnzFURvR3rV4INkwEylF+makm6cydZY3FTmDMUOSJwYpM
         xX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679898994;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zgQWs7nhs/FdE97dkb000lced7BBVHZwFILQsK7gU7E=;
        b=7mMYvtj+50cPbt3H/EBwrXQDLqUua9KW/Mko7mmw6LXQLADJva//D3vicC1SmBmp6I
         cwDFnvntsM/FhdP4PJFhc/MjRjCGw4lMJ5fIzfCXbklyf1gyZ3WE4H7ZTtEFQc2GcfxW
         2v6RjqFhmCGfK154JZiRzhraRzaXVUX9RGwxvobVevGyVvo1U8As4iuUEDDPetYJhg4Y
         KgmbgI7DMlrdIVfNK2UF8aG0M8EWtrD54ts5b5GP0XxatLp1g5LBiG1XbqsKl7/GDFbT
         RMoueHilT6JVhVDIc4QgkiDZGMVN/ixkSFkVt5Dh0YMzZGCCResYP07uNKrCdJlrIL7+
         HMhw==
X-Gm-Message-State: AAQBX9f7FWY4FongFiTnDYGB/EKUoPgc5c77d3MZbr0CEXtRmHvVZjWN
	XsIb+RrOR/DM2e92P7wHWvl3oqONu14=
X-Google-Smtp-Source: AKy350aEaG3yBnZvhIbsp9hU75Q509Vl23+Bo5GF2t08vR0J4W+9aqtelNHMWk3d8py2bE6xn47XwA==
X-Received: by 2002:a17:902:f203:b0:1a0:67fb:445c with SMTP id m3-20020a170902f20300b001a067fb445cmr7406298plc.28.1679898994026;
        Sun, 26 Mar 2023 23:36:34 -0700 (PDT)
Received: from localhost ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id a11-20020a1709027d8b00b00198e03c3ad4sm18291930plm.278.2023.03.26.23.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 23:36:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Mar 2023 16:36:30 +1000
Message-Id: <CRGYHQ3C77DV.1PXS812TV997N@bobo>
Subject: Re: [PATCH] powerpc: don't try to copy ppc for task with NULL
 pt_regs
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Jens Axboe" <axboe@kernel.dk>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <d9f63344-fe7c-56ae-b420-4a1a04a2ae4c@kernel.dk>
In-Reply-To: <d9f63344-fe7c-56ae-b420-4a1a04a2ae4c@kernel.dk>
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

On Mon Mar 27, 2023 at 8:15 AM AEST, Jens Axboe wrote:
> Powerpc sets up PF_KTHREAD and PF_IO_WORKER with a NULL pt_regs, which
> from my (arguably very short) checking is not commonly done for other
> archs. This is fine, except when PF_IO_WORKER's have been created and
> the task does something that causes a coredump to be generated. Then we
> get this crash:

Hey Jens,

Thanks for the testing and the patch.

I think your patch would work, but I'd be inclined to give the IO worker
a pt_regs so it looks more like other archs and a regular user thread.

Your IO worker bug reminded me to resurrect some copy_thread patches I
had and I think they should do that

https://lists.ozlabs.org/pipermail/linuxppc-dev/2023-March/256271.html

I wouldn't ask you to test it until I've at least tried, do you have a
test case that triggers this?

Thanks,
Nick

>
> Kernel attempted to read user page (160) - exploit attempt? (uid: 1000)
> BUG: Kernel NULL pointer dereference on read at 0x00000160
> Faulting instruction address: 0xc0000000000c3a60
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D32 NUMA pSeries
> Modules linked in: bochs drm_vram_helper drm_kms_helper xts binfmt_misc e=
cb ctr syscopyarea sysfillrect cbc sysimgblt drm_ttm_helper aes_generic ttm=
 sg libaes evdev joydev virtio_balloon vmx_crypto gf128mul drm dm_mod fuse =
loop configfs drm_panel_orientation_quirks ip_tables x_tables autofs4 hid_g=
eneric usbhid hid xhci_pci xhci_hcd usbcore usb_common sd_mod
> CPU: 1 PID: 1982 Comm: ppc-crash Not tainted 6.3.0-rc2+ #88
> Hardware name: IBM pSeries (emulated by qemu) POWER9 (raw) 0x4e1202 0xf00=
0005 of:SLOF,HEAD hv:linux,kvm pSeries
> NIP:  c0000000000c3a60 LR: c000000000039944 CTR: c0000000000398e0
> REGS: c0000000041833b0 TRAP: 0300   Not tainted  (6.3.0-rc2+)
> MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 88082828  X=
ER: 200400f8
> CFAR: c0000000000c386c DAR: 0000000000000160 DSISR: 40000000 IRQMASK: 0
> GPR00: c000000000039920 c000000004183650 c00000000175d600 c0000000040f980=
0
> GPR04: 0000000000000160 0000000000000008 c000000000039920 000000000000000=
0
> GPR08: 0000000000000000 0000000000000000 00000003fe060000 000000000000200=
0
> GPR12: c0000000000398e0 c0000003fffff200 c0000000015edbc0 c00000000ba2f64=
8
> GPR16: c00000000ba2f600 c000000001616ea8 0000000000000004 00000000fffffff=
f
> GPR20: 0000000000000048 c000000004183918 c000000001410f00 c000000001410ef=
8
> GPR24: c0000000040f9800 c0000000040f9800 c0000000041837b8 c0000000000398e=
0
> GPR28: c00000000cc4cb80 c0000000040f9800 0000000000000008 000000000000000=
8
> NIP [c0000000000c3a60] memcpy_power7+0x200/0x7d0
> LR [c000000000039944] ppr_get+0x64/0xb0
> Call Trace:
> [c000000004183650] [c000000000039920] ppr_get+0x40/0xb0 (unreliable)
> [c000000004183690] [c0000000001e5e80] __regset_get+0x180/0x1f0
> [c000000004183700] [c0000000001e5f94] regset_get_alloc+0x64/0x90
> [c000000004183740] [c0000000007ae638] elf_core_dump+0xb98/0x1b60
> [c0000000041839c0] [c0000000007bb564] do_coredump+0x1c34/0x24a0
> [c000000004183ba0] [c0000000001acf0c] get_signal+0x71c/0x1410
> [c000000004183ce0] [c0000000000228a0] do_notify_resume+0x140/0x6f0
> [c000000004183db0] [c0000000000353bc] interrupt_exit_user_prepare_main+0x=
29c/0x320
> [c000000004183e20] [c00000000003579c] interrupt_exit_user_prepare+0x6c/0x=
a0
> [c000000004183e50] [c00000000000c6f4] interrupt_return_srr_user+0x8/0x138
> --- interrupt: 300 at 0x183ee09e0
> NIP:  0000000183ee09e0 LR: 0000000183ee09dc CTR: 800000000280f033
> REGS: c000000004183e80 TRAP: 0300   Not tainted  (6.3.0-rc2+)
> MSR:  800000000000d033 <SF,EE,PR,ME,IR,DR,RI,LE>  CR: 22002848  XER: 0000=
00f8
> CFAR: 00007ffe6d746aa8 DAR: 0000000000000000 DSISR: 42000000 IRQMASK: 0
> GPR00: 0000000183ee09dc 00007ffff20d37c0 0000000183f07f00 000000000000000=
0
> GPR04: 0000000000000000 00007ffff20d37a8 0000000000000000 00007ffe6d9eae0=
0
> GPR08: 00007ffff20d3710 0000000000000000 0000000000000000 000000000000000=
0
> GPR12: 0000000000000000 00007ffe6d9eae00 0000000000000000 000000000000000=
0
> GPR16: 0000000000000000 0000000000000000 0000000000000000 000000000000000=
0
> GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000183ee086=
0
> GPR24: 00007ffe6d9df820 00007ffe6d9e0000 00007ffff20d7d98 000000000000000=
1
> GPR28: 0000000183ee0c60 00007ffff20d7924 00007ffff20d7820 000000000000000=
0
> NIP [0000000183ee09e0] 0x183ee09e0
> LR [0000000183ee09dc] 0x183ee09dc
> --- interrupt: 300
> Code: f9030018 38630020 409f001c e8040000 e8c40008 38840010 f8030000 f8c3=
0008 38630010 78a50720 7cb01120 409c001c <80040000> 80c40004 38840008 90030=
000
> ---[ end trace 0000000000000000 ]---
>
> note: ppc-crash[1982] exited with irqs disabled
>
> because ppr_get() is trying to copy from a PF_IO_WORKER with a NULL
> pt_regs.
>
> Check for a valid pt_regs in both ppc_get/ppr_set, and return an error
> if not set. The actual error value doesn't seem to be important here,
> so just pick -EINVAL.
>
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
>
> diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kern=
el/ptrace/ptrace-view.c
> index 2087a785f05f..80b699dd0d7f 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace-view.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
> @@ -290,6 +290,8 @@ static int gpr_set(struct task_struct *target, const =
struct user_regset *regset,
>  static int ppr_get(struct task_struct *target, const struct user_regset =
*regset,
>  		   struct membuf to)
>  {
> +	if (!target->thread.regs)
> +		return -EINVAL;
>  	return membuf_write(&to, &target->thread.regs->ppr, sizeof(u64));
>  }
> =20
> @@ -297,6 +299,8 @@ static int ppr_set(struct task_struct *target, const =
struct user_regset *regset,
>  		   unsigned int pos, unsigned int count, const void *kbuf,
>  		   const void __user *ubuf)
>  {
> +	if (!target->thread.regs)
> +		return -EINVAL;
>  	return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
>  				  &target->thread.regs->ppr, 0, sizeof(u64));
>  }
>
> --=20
> Jens Axboe

