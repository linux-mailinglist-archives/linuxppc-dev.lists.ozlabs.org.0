Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9782579F978
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 06:14:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ITSQklnx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmP8x3LPRz3c8v
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 14:14:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ITSQklnx;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmP81653Hz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 14:13:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1694664816;
	bh=mIa+xQ5UYE5c60cHjFMYiCUJEh5cLxZQfAqfbvhrn9c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ITSQklnxpKTnew8ppb17v69JO27vVEzgDQLwekMjNPzZzWD15krtS1/+13sAmPYJa
	 V+7ym4B+JOZT6bz6nGS/7aqCd4emTPg0V4dTDRZ/SasyLZVXYUjSfUGw5HQNMAlLdC
	 UnKFmYLOiMMLctygF8pYrNDPYvxT0SorvNVvejHuwFI6xbGxXILIZfLHNSExwVGx2G
	 awyzmDvQ9D4fV8MsdDRQnyICRpVLGVr+GcREJH4KoCxwSDHUqsin8XpzUcvRIOyx0a
	 HwAIL1WRFTfnmTwnH/RV1gaFePETf1HED7Efuf2TgqP7WEwbw1yqirbyrPz1Rio8WU
	 Dla5ZRR55pw0Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RmP7z2LQYz4x3v;
	Thu, 14 Sep 2023 14:13:35 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>, gjoyce@linux.vnet.ibm.com
Subject: Re: [PATCH v7 3/3 RESEND] powerpc/pseries: PLPKS SED Opal keystore
 support
In-Reply-To: <20230913185951.GA3643621@dev-arch.thelio-3990X>
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
 <20230908153056.3503975-4-gjoyce@linux.vnet.ibm.com>
 <20230913185951.GA3643621@dev-arch.thelio-3990X>
Date: Thu, 14 Sep 2023 14:13:32 +1000
Message-ID: <877cot8k9f.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: axboe@kernel.dk, nayna@linux.ibm.com, linux-block@vger.kernel.org, jarkko@kernel.org, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <nathan@kernel.org> writes:
> Hi Greg,
>
> On Fri, Sep 08, 2023 at 10:30:56AM -0500, gjoyce@linux.vnet.ibm.com wrote:
>> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
>>
>> Define operations for SED Opal to read/write keys
>> from POWER LPAR Platform KeyStore(PLPKS). This allows
>> non-volatile storage of SED Opal keys.
>>
>> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
>> Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
>> Reviewed-by: Hannes Reinecke <hare@suse.de>
>
> After this change in -next as commit 9f2c7411ada9 ("powerpc/pseries:
> PLPKS SED Opal keystore support"), I see the following crash when
> booting some distribution configurations, such as OpenSUSE's [1] (the
> rootfs is available at [2] if necessary):

Thanks for testing Nathan.

The code needs to check plpks_is_available() somewhere, before calling
the plpks routines.

cheers

> $ qemu-system-ppc64 \
>     -display none \
>     -nodefaults \
>     -device ipmi-bmc-sim,id=bmc0 \
>     -device isa-ipmi-bt,bmc=bmc0,irq=10 \
>     -machine powernv \
>     -kernel arch/powerpc/boot/zImage.epapr \
>     -initrd ppc64le-rootfs.cpio \
>     -m 2G \
>     -serial mon:stdio
> ...
> [    0.000000] Linux version 6.6.0-rc1-00004-g9f2c7411ada9 (nathan@dev-arch.thelio-3990X) (powerpc64-linux-gcc (GCC) 13.2.0, GNU ld (GNU Binutils) 2.41) #1 SMP Wed Sep 13 11:53:38 MST 2023
> ...
> [    1.808911] ------------[ cut here ]------------
> [    1.810336] kernel BUG at arch/powerpc/kernel/syscall.c:34!
> [    1.810799] Oops: Exception in kernel mode, sig: 5 [#1]
> [    1.810985] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
> [    1.811191] Modules linked in:
> [    1.811483] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.6.0-rc1-00004-g9f2c7411ada9 #1
> [    1.811825] Hardware name: IBM PowerNV (emulated by qemu) POWER9 0x4e1202 opal:v7.0 PowerNV
> [    1.812133] NIP:  c00000000002c8c4 LR: c00000000000d620 CTR: c00000000000d4c0
> [    1.812335] REGS: c000000002deb7b0 TRAP: 0700   Not tainted  (6.6.0-rc1-00004-g9f2c7411ada9)
> [    1.812595] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 2800028d  XER: 20040004
> [    1.812930] CFAR: c00000000000d61c IRQMASK: 3
> [    1.812930] GPR00: c00000000000d620 c000000002deba50 c0000000015ef400 c000000002debe80
> [    1.812930] GPR04: 000000004800028d 0000000000000000 0000000000000000 0000000000000000
> [    1.812930] GPR08: 0000000079cd0000 0000000000000001 0000000000000000 0000000000000000
> [    1.812930] GPR12: 0000000000000000 c0000000028b0000 0000000000000000 0000000000000000
> [    1.812930] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.812930] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.812930] GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.812930] GPR28: 0000000000000000 000000004800028d c000000002debe80 c000000002debe10
> [    1.814858] NIP [c00000000002c8c4] system_call_exception+0x84/0x250
> [    1.815480] LR [c00000000000d620] system_call_common+0x160/0x2c4
> [    1.815772] Call Trace:
> [    1.815929] [c000000002debe50] [c00000000000d620] system_call_common+0x160/0x2c4
> [    1.816178] --- interrupt: c00 at plpar_hcall+0x38/0x60
> [    1.816330] NIP:  c0000000000e43f8 LR: c0000000000fb558 CTR: 0000000000000000
> [    1.816518] REGS: c000000002debe80 TRAP: 0c00   Not tainted  (6.6.0-rc1-00004-g9f2c7411ada9)
> [    1.816740] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 2800028d  XER: 00000000
> [    1.817039] IRQMASK: 0
> [    1.817039] GPR00: 000000004800028d c000000002deb950 c0000000015ef400 0000000000000434
> [    1.817039] GPR04: 00000000028eb190 0000000028ac6600 000000000000001d 0000000000000010
> [    1.817039] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.817039] GPR12: 0000000000000000 c0000000028b0000 c000000000011188 0000000000000000
> [    1.817039] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.817039] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.817039] GPR24: 0000000000000000 0000000000000000 0000000000000000 c000000028ac6600
> [    1.817039] GPR28: 0000000000000010 c0000000028eb190 c000000028ac6600 c000000002deba30
> [    1.818785] NIP [c0000000000e43f8] plpar_hcall+0x38/0x60
> [    1.818929] LR [c0000000000fb558] plpks_read_var+0x208/0x290
> [    1.819093] --- interrupt: c00
> [    1.819195] [c000000002deb950] [c0000000000fb528] plpks_read_var+0x1d8/0x290 (unreliable)
> [    1.819433] [c000000002deba10] [c0000000000fc1ac] sed_read_key+0x9c/0x170
> [    1.819617] [c000000002debad0] [c0000000020541a8] sed_opal_init+0xac/0x174
> [    1.819823] [c000000002debc50] [c000000000010ad0] do_one_initcall+0x80/0x3b0
> [    1.820017] [c000000002debd30] [c000000002004860] kernel_init_freeable+0x338/0x3dc
> [    1.820229] [c000000002debdf0] [c0000000000111b0] kernel_init+0x30/0x1a0
> [    1.820411] [c000000002debe50] [c00000000000d620] system_call_common+0x160/0x2c4
> [    1.820614] --- interrupt: c00 at plpar_hcall+0x38/0x60
> [    1.820755] NIP:  c0000000000e43f8 LR: c0000000000fb558 CTR: 0000000000000000
> [    1.820940] REGS: c000000002debe80 TRAP: 0c00   Not tainted  (6.6.0-rc1-00004-g9f2c7411ada9)
> [    1.821157] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 2800028d  XER: 00000000
> [    1.821444] IRQMASK: 0
> [    1.821444] GPR00: 000000004800028d c000000002deb950 c0000000015ef400 0000000000000434
> [    1.821444] GPR04: 00000000028eb190 0000000028ac6600 000000000000001d 0000000000000010
> [    1.821444] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.821444] GPR12: 0000000000000000 c0000000028b0000 c000000000011188 0000000000000000
> [    1.821444] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.821444] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.821444] GPR24: 0000000000000000 0000000000000000 0000000000000000 c000000028ac6600
> [    1.821444] GPR28: 0000000000000010 c0000000028eb190 c000000028ac6600 c000000002deba30
> [    1.823188] NIP [c0000000000e43f8] plpar_hcall+0x38/0x60
> [    1.823331] LR [c0000000000fb558] plpks_read_var+0x208/0x290
> [    1.823493] --- interrupt: c00
> [    1.823585] [c000000002deb950] [c0000000000fb528] plpks_read_var+0x1d8/0x290 (unreliable)
> [    1.823813] [c000000002deba10] [c0000000000fc1ac] sed_read_key+0x9c/0x170
> [    1.823996] [c000000002debad0] [c0000000020541a8] sed_opal_init+0xac/0x174
> [    1.824183] [c000000002debc50] [c000000000010ad0] do_one_initcall+0x80/0x3b0
> [    1.824370] [c000000002debd30] [c000000002004860] kernel_init_freeable+0x338/0x3dc
> [    1.824577] [c000000002debdf0] [c0000000000111b0] kernel_init+0x30/0x1a0
> [    1.824764] [c000000002debe50] [c00000000000d620] system_call_common+0x160/0x2c4
> [    1.824965] --- interrupt: c00 at plpar_hcall+0x38/0x60
> [    1.825105] NIP:  c0000000000e43f8 LR: c0000000000fb558 CTR: 0000000000000000
> [    1.825290] REGS: c000000002debe80 TRAP: 0c00   Not tainted  (6.6.0-rc1-00004-g9f2c7411ada9)
> [    1.825505] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 2800028d  XER: 00000000
> [    1.825795] IRQMASK: 0
> [    1.825795] GPR00: 000000004800028d c000000002deb950 c0000000015ef400 0000000000000434
> [    1.825795] GPR04: 00000000028eb190 0000000028ac6600 000000000000001d 0000000000000010
> [    1.825795] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.825795] GPR12: 0000000000000000 c0000000028b0000 c000000000011188 0000000000000000
> [    1.825795] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.825795] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.825795] GPR24: 0000000000000000 0000000000000000 0000000000000000 c000000028ac6600
> [    1.825795] GPR28: 0000000000000010 c0000000028eb190 c000000028ac6600 c000000002deba30
> [    1.827538] NIP [c0000000000e43f8] plpar_hcall+0x38/0x60
> [    1.827682] LR [c0000000000fb558] plpks_read_var+0x208/0x290
> [    1.827842] --- interrupt: c00
> [    1.827930] [c000000002deb950] [c0000000000fb528] plpks_read_var+0x1d8/0x290 (unreliable)
> [    1.828154] [c000000002deba10] [c0000000000fc1ac] sed_read_key+0x9c/0x170
> [    1.828335] [c000000002debad0] [c0000000020541a8] sed_opal_init+0xac/0x174
> [    1.828522] [c000000002debc50] [c000000000010ad0] do_one_initcall+0x80/0x3b0
> [    1.828712] [c000000002debd30] [c000000002004860] kernel_init_freeable+0x338/0x3dc
> [    1.828917] [c000000002debdf0] [c0000000000111b0] kernel_init+0x30/0x1a0
> [    1.829098] [c000000002debe50] [c00000000000d620] system_call_common+0x160/0x2c4
> [    1.829300] --- interrupt: c00 at plpar_hcall+0x38/0x60
> [    1.829443] NIP:  c0000000000e43f8 LR: c0000000000fb558 CTR: 0000000000000000
> [    1.829627] REGS: c000000002debe80 TRAP: 0c00   Not tainted  (6.6.0-rc1-00004-g9f2c7411ada9)
> [    1.829841] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 2800028d  XER: 00000000
> [    1.830127] IRQMASK: 0
> [    1.830127] GPR00: 000000004800028d c000000002deb950 c0000000015ef400 0000000000000434
> [    1.830127] GPR04: 00000000028eb190 0000000028ac6600 000000000000001d 0000000000000010
> [    1.830127] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.830127] GPR12: 0000000000000000 c0000000028b0000 c000000000011188 0000000000000000
> [    1.830127] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.830127] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.830127] GPR24: 0000000000000000 0000000000000000 0000000000000000 c000000028ac6600
> [    1.830127] GPR28: 0000000000000010 c0000000028eb190 c000000028ac6600 c000000002deba30
> [    1.831867] NIP [c0000000000e43f8] plpar_hcall+0x38/0x60
> [    1.832011] LR [c0000000000fb558] plpks_read_var+0x208/0x290
> [    1.832168] --- interrupt: c00
> [    1.832255] [c000000002deb950] [c0000000000fb528] plpks_read_var+0x1d8/0x290 (unreliable)
> [    1.832476] [c000000002deba10] [c0000000000fc1ac] sed_read_key+0x9c/0x170
> [    1.832661] [c000000002debad0] [c0000000020541a8] sed_opal_init+0xac/0x174
> [    1.832845] [c000000002debc50] [c000000000010ad0] do_one_initcall+0x80/0x3b0
> [    1.833037] [c000000002debd30] [c000000002004860] kernel_init_freeable+0x338/0x3dc
> [    1.833243] [c000000002debdf0] [c0000000000111b0] kernel_init+0x30/0x1a0
> [    1.833423] [c000000002debe50] [c00000000000d620] system_call_common+0x160/0x2c4
> [    1.833631] --- interrupt: c00 at plpar_hcall+0x38/0x60
> [    1.833778] NIP:  c0000000000e43f8 LR: c0000000000fb558 CTR: 0000000000000000
> [    1.833964] REGS: c000000002debe80 TRAP: 0c00   Not tainted  (6.6.0-rc1-00004-g9f2c7411ada9)
> [    1.834179] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 2800028d  XER: 00000000
> [    1.834466] IRQMASK: 0
> [    1.834466] GPR00: 000000004800028d c000000002deb950 c0000000015ef400 0000000000000434
> [    1.834466] GPR04: 00000000028eb190 0000000028ac6600 000000000000001d 0000000000000010
> [    1.834466] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.834466] GPR12: 0000000000000000 c0000000028b0000 c000000000011188 0000000000000000
> [    1.834466] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.834466] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.834466] GPR24: 0000000000000000 0000000000000000 0000000000000000 c000000028ac6600
> [    1.834466] GPR28: 0000000000000010 c0000000028eb190 c000000028ac6600 c000000002deba30
> [    1.836206] NIP [c0000000000e43f8] plpar_hcall+0x38/0x60
> [    1.836349] LR [c0000000000fb558] plpks_read_var+0x208/0x290
> [    1.836505] --- interrupt: c00
> [    1.836592] [c000000002deb950] [c0000000000fb528] plpks_read_var+0x1d8/0x290 (unreliable)
> [    1.836819] [c000000002deba10] [c0000000000fc1ac] sed_read_key+0x9c/0x170
> [    1.837002] [c000000002debad0] [c0000000020541a8] sed_opal_init+0xac/0x174
> [    1.837187] [c000000002debc50] [c000000000010ad0] do_one_initcall+0x80/0x3b0
> [    1.837380] [c000000002debd30] [c000000002004860] kernel_init_freeable+0x338/0x3dc
> [    1.837587] [c000000002debdf0] [c0000000000111b0] kernel_init+0x30/0x1a0
> [    1.837772] [c000000002debe50] [c00000000000d620] system_call_common+0x160/0x2c4
> [    1.837978] --- interrupt: c00 at plpar_hcall+0x38/0x60
> [    1.838117] NIP:  c0000000000e43f8 LR: c0000000000fb558 CTR: 0000000000000000
> [    1.838305] REGS: c000000002debe80 TRAP: 0c00   Not tainted  (6.6.0-rc1-00004-g9f2c7411ada9)
> [    1.838521] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 2800028d  XER: 00000000
> [    1.838803] IRQMASK: 0
> [    1.838803] GPR00: 000000004800028d c000000002deb950 c0000000015ef400 0000000000000434
> [    1.838803] GPR04: 00000000028eb190 0000000028ac6600 000000000000001d 0000000000000010
> [    1.838803] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.838803] GPR12: 0000000000000000 c0000000028b0000 c000000000011188 0000000000000000
> [    1.838803] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.838803] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.838803] GPR24: 0000000000000000 0000000000000000 0000000000000000 c000000028ac6600
> [    1.838803] GPR28: 0000000000000010 c0000000028eb190 c000000028ac6600 c000000002deba30
> [    1.840549] NIP [c0000000000e43f8] plpar_hcall+0x38/0x60
> [    1.840699] LR [c0000000000fb558] plpks_read_var+0x208/0x290
> [    1.840854] --- interrupt: c00
> [    1.840940] [c000000002deb950] [c0000000000fb528] plpks_read_var+0x1d8/0x290 (unreliable)
> [    1.841164] [c000000002deba10] [c0000000000fc1ac] sed_read_key+0x9c/0x170
> [    1.841347] [c000000002debad0] [c0000000020541a8] sed_opal_init+0xac/0x174
> [    1.841538] [c000000002debc50] [c000000000010ad0] do_one_initcall+0x80/0x3b0
> [    1.841727] [c000000002debd30] [c000000002004860] kernel_init_freeable+0x338/0x3dc
> [    1.841932] [c000000002debdf0] [c0000000000111b0] kernel_init+0x30/0x1a0
> [    1.842114] [c000000002debe50] [c00000000000d620] system_call_common+0x160/0x2c4
> [    1.842311] --- interrupt: c00 at plpar_hcall+0x38/0x60
> [    1.842453] NIP:  c0000000000e43f8 LR: c0000000000fb558 CTR: 0000000000000000
> [    1.842638] REGS: c000000002debe80 TRAP: 0c00   Not tainted  (6.6.0-rc1-00004-g9f2c7411ada9)
> [    1.842856] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 2800028d  XER: 00000000
> [    1.843143] IRQMASK: 0
> [    1.843143] GPR00: 000000004800028d c000000002deb950 c0000000015ef400 0000000000000434
> [    1.843143] GPR04: 00000000028eb190 0000000028ac6600 000000000000001d 0000000000000010
> [    1.843143] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.843143] GPR12: 0000000000000000 c0000000028b0000 c000000000011188 0000000000000000
> [    1.843143] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.843143] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.843143] GPR24: 0000000000000000 0000000000000000 0000000000000000 c000000028ac6600
> [    1.843143] GPR28: 0000000000000010 c0000000028eb190 c000000028ac6600 c000000002deba30
> [    1.844880] NIP [c0000000000e43f8] plpar_hcall+0x38/0x60
> [    1.845027] LR [c0000000000fb558] plpks_read_var+0x208/0x290
> [    1.845184] --- interrupt: c00
> [    1.845272] [c000000002deb950] [c0000000000fb528] plpks_read_var+0x1d8/0x290 (unreliable)
> [    1.845491] [c000000002deba10] [c0000000000fc1ac] sed_read_key+0x9c/0x170
> [    1.845674] [c000000002debad0] [c0000000020541a8] sed_opal_init+0xac/0x174
> [    1.845857] [c000000002debc50] [c000000000010ad0] do_one_initcall+0x80/0x3b0
> [    1.846043] [c000000002debd30] [c000000002004860] kernel_init_freeable+0x338/0x3dc
> [    1.846246] [c000000002debdf0] [c0000000000111b0] kernel_init+0x30/0x1a0
> [    1.846429] [c000000002debe50] [c00000000000d620] system_call_common+0x160/0x2c4
> [    1.846625] --- interrupt: c00 at plpar_hcall+0x38/0x60
> [    1.846775] NIP:  c0000000000e43f8 LR: c0000000000fb558 CTR: 0000000000000000
> [    1.846965] REGS: c000000002debe80 TRAP: 0c00   Not tainted  (6.6.0-rc1-00004-g9f2c7411ada9)
> [    1.847178] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 2800028d  XER: 00000000
> [    1.847457] IRQMASK: 0
> [    1.847457] GPR00: 000000004800028d c000000002deb950 c0000000015ef400 0000000000000434
> [    1.847457] GPR04: 00000000028eb190 0000000028ac6600 000000000000001d 0000000000000010
> [    1.847457] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.847457] GPR12: 0000000000000000 c0000000028b0000 c000000000011188 0000000000000000
> [    1.847457] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.847457] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.847457] GPR24: 0000000000000000 0000000000000000 0000000000000000 c000000028ac6600
> [    1.847457] GPR28: 0000000000000010 c0000000028eb190 c000000028ac6600 c000000002deba30
> [    1.849184] NIP [c0000000000e43f8] plpar_hcall+0x38/0x60
> [    1.849328] LR [c0000000000fb558] plpks_read_var+0x208/0x290
> [    1.849483] --- interrupt: c00
> [    1.849571] [c000000002deb950] [c0000000000fb528] plpks_read_var+0x1d8/0x290 (unreliable)
> [    1.849795] [c000000002deba10] [c0000000000fc1ac] sed_read_key+0x9c/0x170
> [    1.849976] [c000000002debad0] [c0000000020541a8] sed_opal_init+0xac/0x174
> [    1.850165] [c000000002debc50] [c000000000010ad0] do_one_initcall+0x80/0x3b0
> [    1.850359] [c000000002debd30] [c000000002004860] kernel_init_freeable+0x338/0x3dc
> [    1.850561] [c000000002debdf0] [c0000000000111b0] kernel_init+0x30/0x1a0
> [    1.850743] [c000000002debe50] [c00000000000d620] system_call_common+0x160/0x2c4
> [    1.850943] --- interrupt: c00 at plpar_hcall+0x38/0x60
> [    1.851082] NIP:  c0000000000e43f8 LR: c0000000000fb558 CTR: 0000000000000000
> [    1.851264] REGS: c000000002debe80 TRAP: 0c00   Not tainted  (6.6.0-rc1-00004-g9f2c7411ada9)
> [    1.851480] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 2800028d  XER: 00000000
> [    1.851762] IRQMASK: 0
> [    1.851762] GPR00: 000000004800028d c000000002deb950 c0000000015ef400 0000000000000434
> [    1.851762] GPR04: 00000000028eb190 0000000028ac6600 000000000000001d 0000000000000010
> [    1.851762] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.851762] GPR12: 0000000000000000 c0000000028b0000 c000000000011188 0000000000000000
> [    1.851762] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.851762] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.851762] GPR24: 0000000000000000 0000000000000000 0000000000000000 c000000028ac6600
> [    1.851762] GPR28: 0000000000000010 c0000000028eb190 c000000028ac6600 c000000002deba30
> [    1.853506] NIP [c0000000000e43f8] plpar_hcall+0x38/0x60
> [    1.853654] LR [c0000000000fb558] plpks_read_var+0x208/0x290
> [    1.853811] --- interrupt: c00
> [    1.853897] [c000000002deb950] [c0000000000fb528] plpks_read_var+0x1d8/0x290 (unreliable)
> [    1.854119] [c000000002deba10] [c0000000000fc1ac] sed_read_key+0x9c/0x170
> [    1.854303] [c000000002debad0] [c0000000020541a8] sed_opal_init+0xac/0x174
> [    1.854488] [c000000002debc50] [c000000000010ad0] do_one_initcall+0x80/0x3b0
> [    1.854677] [c000000002debd30] [c000000002004860] kernel_init_freeable+0x338/0x3dc
> [    1.854877] [c000000002debdf0] [c0000000000111b0] kernel_init+0x30/0x1a0
> [    1.855061] [c000000002debe50] [c00000000000d620] system_call_common+0x160/0x2c4
> [    1.855262] --- interrupt: c00 at plpar_hcall+0x38/0x60
> [    1.855404] NIP:  c0000000000e43f8 LR: c0000000000fb558 CTR: 0000000000000000
> [    1.855587] REGS: c000000002debe80 TRAP: 0c00   Not tainted  (6.6.0-rc1-00004-g9f2c7411ada9)
> [    1.855805] MSR:  900000000280b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 2800028d  XER: 00000000
> [    1.856090] IRQMASK: 0
> [    1.856090] GPR00: 000000004800028d c000000002deb950 c0000000015ef400 0000000000000434
> [    1.856090] GPR04: 00000000028eb190 0000000028ac6600 000000000000001d 0000000000000010
> [    1.856090] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.856090] GPR12: 0000000000000000 c0000000028b0000 c000000000011188 0000000000000000
> [    1.856090] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.856090] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    1.856090] GPR24: 0000000000000000 0000000000000000 0000000000000000 c000000028ac6600
> [    1.856090] GPR28: 0000000000000010 c0000000028eb190 c000000028ac6600 c000000002deba30
> [    1.857848] NIP [c0000000000e43f8] plpar_hcall+0x38/0x60
> [    1.857992] LR [c0000000000fb558] plpks_read_var+0x208/0x290
> [    1.858148] --- interrupt: c00
> [    1.858325] Code: 7d41496a 39210020 60000000 39200000 0b090000 60000000 e93e0108 692a0002 794affe2 0b0a0000 69294000 792997e2 <0b090000> e93e0138 792907e0 0b090000
> [    1.859199] ---[ end trace 0000000000000000 ]---
> [    1.859407]
> [    2.859747] note: swapper/0[1] exited with irqs disabled
> [    2.862681] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000005
> [    2.864206] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000005 ]---
>
> IIRC, this occurs when running on a non-pseries machine, as I think this
> is a similar crash to commit a66de5283e16 ("powerpc/pseries: Fix plpks
> crash on non-pseries"), but I am not sure if that fix is appropriate or
> not here, hence just the report. If there is any additional information
> I can provide or patches I can test, I am more than happy to do so.
>
> [1]: https://github.com/openSUSE/kernel-source/raw/master/config/ppc64le/default
> [2]: https://github.com/ClangBuiltLinux/boot-utils/releases
>
> Cheers,
> Nathan
