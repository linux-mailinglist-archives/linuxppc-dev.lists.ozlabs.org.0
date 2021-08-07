Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 293263E378D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Aug 2021 01:18:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ghyv10n2mz3cLx
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Aug 2021 09:18:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e1H+Gg/3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=e1H+Gg/3; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhytX5GWRz302W
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Aug 2021 09:17:39 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GhytS1fFCz9sWX;
 Sun,  8 Aug 2021 09:17:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1628378256;
 bh=PWOzXFIKeUu2qxb6O/vuk6Ol6fUDMqUIaa+119yejJI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=e1H+Gg/3r/Vew3wnVvXF/EHFO7NVnk/MLYSWGJaGoGoB1R5WLGyp6wdNlxqRFUXwQ
 eMmn+80K80kJO3F4LMUZ+tF7/hwO2CGoBpLTn725GYXlC5qcGgkkcZVvPZn3IRFNHS
 nwRdZfiE+X9gzZNnxPIMPpOoM5jEu1T8m3ndBWG8JPwM0hsuN/btzmL84Zf3wR2zir
 eSNNfy44R2eEzQQhD8E/mak4UcYD4VkytAFwmMjvydsWOVHzZt/cLIMdacbQ1X8zA8
 08qv8siZo/Lg1gBTQ4KYQ1SavgWSb90QmPddyHlGIlPsy0UsXRAIFZOGcYxS1PeEEe
 akq5aO6s24pDw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v1 26/55] KVM: PPC: Book3S HV: Change dec_expires to be
 relative to guest timebase
In-Reply-To: <20210726035036.739609-27-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-27-npiggin@gmail.com>
Date: Sun, 08 Aug 2021 09:17:34 +1000
Message-ID: <87y29cn8tt.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Change dec_expires to be relative to the guest timebase, and allow
> it to be moved into low level P9 guest entry functions, to improve
> SPR access scheduling.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/kvm_book3s.h   |  6 +++
>  arch/powerpc/include/asm/kvm_host.h     |  2 +-
>  arch/powerpc/kvm/book3s_hv.c            | 58 +++++++++++++------------
>  arch/powerpc/kvm/book3s_hv_nested.c     |  3 ++
>  arch/powerpc/kvm/book3s_hv_p9_entry.c   | 10 ++++-
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 14 ------
>  6 files changed, 49 insertions(+), 44 deletions(-)

My p8 is hitting an oops running guests, and bisect points to this. Not
obvious how the change relates to the oops, but maybe you can see it.

cheers


[  716.042962][T16989] Kernel attempted to read user page (0) - exploit attempt? (uid: 0)
[  716.043020][T16989] BUG: Kernel NULL pointer dereference on read at 0x00000000
[  716.043028][T16989] Faulting instruction address: 0xc00000000001e1a8
[  716.043037][T16989] Oops: Kernel access of bad area, sig: 11 [#1]
[  716.043043][T16989] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
[  716.043052][T16989] Modules linked in: xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp iptable_mangle iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nfnetlink ip6table_filter ip6_tables iptable_filter tun bridge stp llc fuse kvm_hv kvm binfmt_misc squashfs mlx4_ib ib_uverbs dm_multipath scsi_dh_rdac ib_core scsi_dh_alua mlx4_en sr_mod cdrom lpfc sg mlx4_core bnx2x crc_t10dif crct10dif_generic scsi_transport_fc mdio vmx_crypto gf128mul crct10dif_vpmsum crct10dif_common leds_powernv powernv_rng led_class crc32c_vpmsum rng_core powernv_op_panel sunrpc ip_tables x_tables autofs4
[  716.043128][T16989] CPU: 56 PID: 16989 Comm: qemu-system-ppc Not tainted 5.14.0-rc4-02329-g9bdd37071243 #1
[  716.043137][T16989] NIP:  c00000000001e1a8 LR: c00000000001e154 CTR: c00000000016ebb0
[  716.043144][T16989] REGS: c0000009f1a93480 TRAP: 0300   Not tainted  (5.14.0-rc4-02329-g9bdd37071243)
[  716.043150][T16989] MSR:  9000000002803033 <SF,HV,VEC,VSX,FP,ME,IR,DR,RI,LE>  CR: 42442444  XER: 20000000
[  716.043167][T16989] CFAR: c00000000000cd0c DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 3
[  716.043167][T16989] GPR00: c00000000001eab8 c0000009f1a93720 c000000002459f00 c0000009c0730270
[  716.043167][T16989] GPR04: 00000000000001f0 0000000000000000 0000000022442448 c0000009c072ec80
[  716.043167][T16989] GPR08: 00000000000000c2 0000000044000000 9000000002803033 0000000000000001
[  716.043167][T16989] GPR12: 0000000000002200 c000000ffffec600 00007fff955f4410 0000000000000000
[  716.043167][T16989] GPR16: 00007fff96280000 00007fff955f0320 00007fff8ee8ebe0 00007fff8e660028
[  716.043167][T16989] GPR20: c000000803807400 c000000858b243bc 000000000000000a c000000002496eb8
[  716.043167][T16989] GPR24: c000000801123650 c0000009c0730250 c0000009c072ec80 0000000002802000
[  716.043167][T16989] GPR28: 0000000000800000 0000000002802000 0000000000800000 c0000009f1a93e80
[  716.043236][T16989] NIP [c00000000001e1a8] restore_math+0x208/0x310
[  716.043247][T16989] LR [c00000000001e154] restore_math+0x1b4/0x310
[  716.043254][T16989] Call Trace:
[  716.043257][T16989] [c0000009f1a93720] [0000000022442448] 0x22442448 (unreliable)
[  716.043267][T16989] [c0000009f1a93780] [c00000000001eab8] __switch_to+0x228/0x2f0
[  716.043274][T16989] [c0000009f1a937e0] [c000000000f7949c] __schedule+0x40c/0xf10
[  716.043283][T16989] [c0000009f1a938b0] [c000000000f7a034] schedule+0x94/0x170
[  716.043291][T16989] [c0000009f1a938e0] [c00800000b8e4474] kvmppc_wait_for_exec+0xdc/0xf8 [kvm_hv]
[  716.043307][T16989] [c0000009f1a93960] [c00800000b8eeb18] kvmppc_vcpu_run_hv+0x900/0x10f0 [kvm_hv]
[  716.043319][T16989] [c0000009f1a93a10] [c00800000b76355c] kvmppc_vcpu_run+0x34/0x48 [kvm]
[  716.043340][T16989] [c0000009f1a93a30] [c00800000b75f188] kvm_arch_vcpu_ioctl_run+0x340/0x450 [kvm]
[  716.043359][T16989] [c0000009f1a93ac0] [c00800000b74d470] kvm_vcpu_ioctl+0x328/0x8f8 [kvm]
[  716.043378][T16989] [c0000009f1a93ca0] [c0000000004fe9d4] sys_ioctl+0x6b4/0x13b0
[  716.043386][T16989] [c0000009f1a93db0] [c00000000002f918] system_call_exception+0x168/0x290
[  716.043394][T16989] [c0000009f1a93e10] [c00000000000c864] system_call_common+0xf4/0x258
[  716.043402][T16989] --- interrupt: c00 at 0x7fff954af010
[  716.043407][T16989] NIP:  00007fff954af010 LR: 0000000116243430 CTR: 0000000000000000
[  716.043413][T16989] REGS: c0000009f1a93e80 TRAP: 0c00   Not tainted  (5.14.0-rc4-02329-g9bdd37071243)
[  716.043419][T16989] MSR:  900000000000d033 <SF,HV,EE,PR,ME,IR,DR,RI,LE>  CR: 22444442  XER: 00000000
[  716.043434][T16989] IRQMASK: 0
[  716.043434][T16989] GPR00: 0000000000000036 00007fff8ee8dc30 00007fff955a7100 000000000000000f
[  716.043434][T16989] GPR04: 000000002000ae80 0000000000000000 00000000000004fb 0000000000000000
[  716.043434][T16989] GPR08: 000000000000000f 0000000000000000 0000000000000000 0000000000000000
[  716.043434][T16989] GPR12: 0000000000000000 00007fff8ee96290 00007fff955f4410 0000000000000000
[  716.043434][T16989] GPR16: 00007fff96280000 00007fff955f0320 00007fff8ee8ebe0 00007fff8e660028
[  716.043434][T16989] GPR20: 0000000000000000 0000000000000000 000000011689b0d0 000000002000ae80
[  716.043434][T16989] GPR24: 00007fff8ffa00ae 0000000000000000 00007fff8ee8f290 00007fff8ffb0010
[  716.043434][T16989] GPR28: 0000000116e010e0 00007fff8ffb0010 0000000000000000 000000002000ae80
[  716.043498][T16989] NIP [00007fff954af010] 0x7fff954af010
[  716.043503][T16989] LR [0000000116243430] 0x116243430
[  716.043507][T16989] --- interrupt: c00
[  716.043511][T16989] Instruction dump:
[  716.043517][T16989] fb610038 67db0200 9907185a 4182005c 7c0802a6 7f63db78 f8010070 4bffeeed
[  716.043529][T16989] 2c3e0000 408200d4 547ddb78 0082812b <eb000000> 387a1860 7fdcf378 7f7edb78
[  716.043543][T16989] ---[ end trace b02ece1d913ff866 ]---
