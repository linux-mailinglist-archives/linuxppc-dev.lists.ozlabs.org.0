Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E1CEF24D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 01:55:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476WS43ZdrzF3fj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 11:55:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d41;
 helo=mail-io1-xd41.google.com; envelope-from=youling257@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Kmj2s2Wh"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4763ks3GCLzF2R7
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 18:06:57 +1100 (AEDT)
Received: by mail-io1-xd41.google.com with SMTP id c11so17184311iom.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Nov 2019 23:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=v3wRS/GCt1JcbtGZPLunVzhglTfqvaHyzRcXN60Gypc=;
 b=Kmj2s2WhR+XPsN5lHjLIX7ONh1QlAnYolGlDouLDW4frOZHIoj3qP03fR3JlgZQ/HQ
 QN5Ef8x2KeAwmS4Vn3pXhoQ2Jv53GGupsHzqzw9S/WDQMMIXvcSlg3b8qkxBrkR3cGuC
 4FV5bz2mNwFuQ//tTgwmcSXn8Jo0y7RRpwiaMd+7EUukDhv0NcfIPmrWu8hXNF3A9jsy
 m4D28triGwlX6fPzPg+e4fwNgxjo2gxW4dEP5I0+QDtJkkgi3DfozK7QVW+ACqEoXTFp
 FrWPu3sON0UxdV1Qt9u6Jje2RCq4madKVgkOBjUgCNgQd1Cr/uYGNxeNyHqOUOuomDgo
 MoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=v3wRS/GCt1JcbtGZPLunVzhglTfqvaHyzRcXN60Gypc=;
 b=nOWvJqToYCIqFs06QCaV35Bw+jmjkHAssNiHUDnNWF+aPwuSpSWtnvgHhYHpnTq4bV
 MhQ2GXz/Yu9e2Ypx3IomxC4DJQVRZ2hgUtRH1gHg9HBFuqd/cco8tB0qkhE5Rljb/1Al
 8X+hWPmSQ2Qa1yL/XrgJTHevfi5yhURiaTXRJMz2vdWAO4W83RixlZ3gjrTAQMG4On4S
 KPhZ1F7/keMofjJgx4dqPO+KsfCVWoCcLVHgIsryYwv/2MBQjNnRc6OLtEFlR/GyfwU4
 KMcW0nNb1mIju8OBQpDW+JyhQ29Rh/gKV6cgKvoSAPYlTqPyy5+tHAIPhgWbH52vmCzW
 7n6w==
X-Gm-Message-State: APjAAAUiSLqQ/yRrxPEK+5wrc4/jQ9wI1+TvoqR1KiB4yRTzuoWl+xbd
 WNobVk5kt+EC3RCQ45IfpSRO2zv5ZeODQec75OQ=
X-Google-Smtp-Source: APXvYqySjZdVvaqyUTMLUFbcyeLTpZCKzFgAkvT8BjIlZ6MqTHedk9riyVyXoTdqiniHs2r3O/+1jeHNx5MSmZXMYRs=
X-Received: by 2002:a5d:8e17:: with SMTP id e23mr11694586iod.263.1572851214146; 
 Sun, 03 Nov 2019 23:06:54 -0800 (PST)
MIME-Version: 1.0
From: youling 257 <youling257@gmail.com>
Date: Mon, 4 Nov 2019 15:06:37 +0800
Message-ID: <CAOzgRdYSaaF6OkXGME2=fn1dfTbpyt_GqEs=10oXH=V6SudfyA@mail.gmail.com>
Subject: Re: ALSA: pcm: use dma_can_mmap() to check if a device supports
 dma_mmap_*
To: linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>, 
 Vladimir Murzin <vladimir.murzin@arm.com>, linux-parisc@vger.kernel.org, 
 linux-sh@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
 linuxppc-dev@lists.ozlabs.org, 
 Helge Deller <deller@gmx.de>, x86@kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org, 
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org,
 hch@lst.de, gregkh@google.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 05 Nov 2019 11:54:16 +1100
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch cause oops on android mainline kernel about gadget audio_source.
Androidx86 run on android mainline kernel.

[ 385.104963] android_work: sent uevent USB_STATE=CONNECTED
[ 385.109006] android_work: sent uevent USB_STATE=DISCONNECTED
[ 385.182024] android_work: sent uevent USB_STATE=CONNECTED
[ 385.184737] configfs-gadget gadget: high-speed config #1: b
[ 385.184921] android_work: sent uevent USB_STATE=CONFIGURED
[ 385.285268] BUG: kernel NULL pointer dereference, address: 0000000000000220
[ 385.285339] #PF: supervisor read access in kernel mode
[ 385.285374] #PF: error_code(0x0000) - not-present page
[ 385.285436] PGD 80000000791e6067 P4D 80000000791e6067 PUD 0
[ 385.285473] Oops: 0000 [#1] PREEMPT SMP PTI
[ 385.285509] CPU: 0 PID: 5780 Comm: Binder:1383_5 Tainted: G O
5.4.0-rc6-android-x86_64+ #1
[ 385.285571] Hardware name: Insyde ONDA Tablet/ONDA Tablet, BIOS
ONDA.D890HBBNR0A 03/11/2015
[ 385.285639] RIP: 0010:dma_can_mmap+0x5/0x30
[ 385.285675] Code: 74 11 e9 ae 98 b2 00 48 8b 05 9f 40 94 01 48 85 c0
75 e3 31 c0 c3 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 0f 1f 44
00 00 <48> 8b 87 20 02 00 00 48 85 c0 74 09 48 83 78 10 00 0f 95 c0 c3
48
[ 385.285762] RSP: 0018:ffffb39443b63b78 EFLAGS: 00010246
[ 385.285797] RAX: 0000000000000001 RBX: ffffa28b91756600 RCX: 0000000000000040
[ 385.285857] RDX: ffffffffb62b2a00 RSI: 0000000000000000 RDI: 0000000000000000
[ 385.285917] RBP: ffffa28bac69f800 R08: ffffffffb63141b0 R09: ffffa28bf9a34a88
[ 385.285952] R10: ffffffffb62b2be0 R11: ffffffffb62b2bd0 R12: 0000000000000008
[ 385.286013] R13: 0000000000000000 R14: ffffa28bacd736a8 R15: ffffa28bacd736c8
[ 385.286076] FS: 0000000000000000(0000) GS:ffffa28bfb600000(0063)
knlGS:00000000f5d81970
[ 385.286110] CS: 0010 DS: 002b ES: 002b CR0: 0000000080050033
[ 385.286171] CR2: 0000000000000220 CR3: 000000007b2f6000 CR4: 00000000001006f0
[ 385.286232] Call Trace:
[ 385.286275] snd_pcm_hw_constraints_complete+0x3e/0x1f0
[ 385.286314] snd_pcm_open_substream+0x94/0x140
[ 385.286377] snd_pcm_open+0xf0/0x240
[ 385.286416] ? wake_up_q+0x60/0x60
[ 385.286460] snd_pcm_playback_open+0x3d/0x60
[ 385.286533] chrdev_open+0xa2/0x1c0
[ 385.286574] ? cdev_put.part.0+0x20/0x20
[ 385.286615] do_dentry_open+0x13a/0x380
[ 385.286686] path_openat+0x588/0x15d0
[ 385.286728] do_filp_open+0x91/0x100
[ 385.286769] ? __check_object_size+0x136/0x147
[ 385.286840] do_sys_open+0x184/0x280
[ 385.286880] ? handle_mm_fault+0xd7/0x1c0
[ 385.286920] do_fast_syscall_32+0x8e/0x250
[ 385.286992] entry_SYSENTER_compat+0x7c/0x8e

[ 385.287302] CR2: 0000000000000220
[ 385.287391] ---[ end trace 73ffcefcbbe2b9a0 ]---
[ 385.296269] RIP: 0010:dma_can_mmap+0x5/0x30
[ 385.296337] Code: 74 11 e9 ae 98 b2 00 48 8b 05 9f 40 94 01 48 85 c0
75 e3 31 c0 c3 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 0f 1f 44
00 00 <48> 8b 87 20 02 00 00 48 85 c0 74 09 48 83 78 10 00 0f 95 c0 c3
48
[ 385.296407] RSP: 0018:ffffb39443b63b78 EFLAGS: 00010246
[ 385.296477] RAX: 0000000000000001 RBX: ffffa28b91756600 RCX: 0000000000000040
[ 385.296516] RDX: ffffffffb62b2a00 RSI: 0000000000000000 RDI: 0000000000000000
[ 385.296584] RBP: ffffa28bac69f800 R08: ffffffffb63141b0 R09: ffffa28bf9a34a88
[ 385.296654] R10: ffffffffb62b2be0 R11: ffffffffb62b2bd0 R12: 0000000000000008
[ 385.296693] R13: 0000000000000000 R14: ffffa28bacd736a8 R15: ffffa28bacd736c8
[ 385.296761] FS: 0000000000000000(0000) GS:ffffa28bfb600000(0063)
knlGS:00000000f5d81970
[ 385.296830] CS: 0010 DS: 002b ES: 002b CR0: 0000000080050033
[ 385.296867] CR2: 0000000000000220 CR3: 000000007b2f6000 CR4: 00000000001006f0
[ 385.296936] Kernel panic - not syncing: Fatal exception
[ 385.296985] Kernel Offset: 0x33e00000 from 0xffffffff81000000
(relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[ 385.305185] Rebooting in 5 seconds..

Revert it no the oops.

Revert "ALSA: pcm: use dma_can_mmap() to check if a
 device supports dma_mmap_*"

This reverts commit 425da159707b271dc865d7e167ac104a0e60e4af.
---
 sound/core/pcm_native.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 91c6ad58729f..61f6229c9124 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -220,12 +220,13 @@ static bool hw_support_mmap(struct
snd_pcm_substream *substream)
 {
  if (!(substream->runtime->hw.info & SNDRV_PCM_INFO_MMAP))
   return false;
-
- if (substream->ops->mmap ||
- substream->dma_buffer.dev.type != SNDRV_DMA_TYPE_DEV)
- return true;
-
- return dma_can_mmap(substream->dma_buffer.dev.dev);
+ /* architecture supports dma_mmap_coherent()? */
+#if defined(CONFIG_MMU) || !defined(CONFIG_HAS_DMA)
+ if (!substream->ops->mmap &&
+ substream->dma_buffer.dev.type == SNDRV_DMA_TYPE_DEV)
+ return false;
+#endif
+ return true;
 }

 static int constrain_mask_params(struct snd_pcm_substream *substream,
