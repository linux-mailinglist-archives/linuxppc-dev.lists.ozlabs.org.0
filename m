Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0884C215091
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 02:43:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0Rd66ZbwzDqBd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 10:43:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UCrT/AKd; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0RZd25y9zDqWy
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 10:41:12 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id t15so1846807pjq.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jul 2020 17:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=cCvI0uFaQ+Y+K+p5Wsfh1TUO93oB6Wv7/jPK9z10HWU=;
 b=UCrT/AKdM1iQJMN6nX2dtqriLppLii22ib+BBFaChtcXXTLZddx/55/JPBSbxmuMtY
 zFNDgW0YglaiJiG6t2aZst/ymQVImYxPCRDESr5Is5yyJzUQpDUE81FoC+gMyLSGgxCC
 46AWA17UACP3GhVs9mrRn/C1XsyUVlUt6wuae8qe/zXgDlrbolQlG4WUpFr8zhWVxJdH
 GxBx8kVyqxzF7qNnNTWPgRLKQQBDXBV5xKRz7LumbQoERBCwjEB2O2lQYT4h6P+HcnqL
 JjI9mFzHzXJg6IqiplQK3FtIhEHDkM6TwD8DCggsDBU7SlrYzxG57Ot6AYEfYhpav1Cl
 qX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=cCvI0uFaQ+Y+K+p5Wsfh1TUO93oB6Wv7/jPK9z10HWU=;
 b=BdsCE0B4ZVm4n+6eP5SAA+W9pNWBx17MEIj0iLYAV9WN80IHzdHyytttTCLtuBa3UD
 aChM7TndbFNPW8ItK9b0VVL/hXGdAqunmqlf6/wpLCOPqqj3fP/U8QPu+1bf8k/xZXiw
 NuMoVJggBHo8X4w9XZ19QyFx0kuRPByi6PRdpQmLesfCWPo611FPmo8FbUZvY5ULB5vY
 aZF2sdjqGoqNJ9xCE/vl+lb71AeNgvaKMN7W2rcskH5l0YiUYsyqm9oZmuTtiCfpqwS7
 MHe7nVb0xFHJAHuF/pj9IYiKzYV4zyTU7A2eAmXaEg3+92Zjgm9Ymxr0MMruGfslaRDu
 YrlA==
X-Gm-Message-State: AOAM533qD1ZzjCALG2wQJYWetIKA3IKIvcmCEilouV/+P8Yw+73dVewP
 5NayGMDX7sgXJ4Sogw9/Jw7xUqsS
X-Google-Smtp-Source: ABdhPJw+TUfkM+2f173c7J2EnG5NN6h1rmvUbRmLgspBdtNx55xTXJEI/uWfETxl/exbbP+iZND4qg==
X-Received: by 2002:a17:902:b093:: with SMTP id
 p19mr5955238plr.161.1593996069710; 
 Sun, 05 Jul 2020 17:41:09 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id w64sm16980153pgd.67.2020.07.05.17.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 17:41:09 -0700 (PDT)
Date: Mon, 06 Jul 2020 10:41:03 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Using Firefox hangs system
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Paul Menzel
 <pmenzel@molgen.mpg.de>
References: <673619a2-74d7-105b-dacb-bec15bc37872@molgen.mpg.de>
 <2a86d85d-b51d-52c5-f84f-efea5a0ca628@molgen.mpg.de>
In-Reply-To: <2a86d85d-b51d-52c5-f84f-efea5a0ca628@molgen.mpg.de>
MIME-Version: 1.0
Message-Id: <1593995628.78zg3dfzk8.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Menzel's message of July 5, 2020 8:30 pm:
> [Removed Rafael from CC]
>=20
> Dear Linux folks,
>=20
>=20
> Am 05.07.20 um 11:22 schrieb Paul Menzel:
>=20
>> With an IBM S822LC with Ubuntu 20.04, after updating to Firefox 78.0,=20
>> using Firefox seems to hang the system. This happened with self-built=20
>> Linux 5.7-rc5+ and now with 5.8-rc3+.
>>=20
>> (At least I believe the Firefox update is causing this.)
>>=20
>> Log in is impossible, and using the Serial over LAN over IPMI shows the=20
>> messages below.
>>=20
>>> [ 2620.579187] watchdog: BUG: soft lockup - CPU#125 stuck for 22s!=20
>>> [swapper/125:0]
>>> [ 2620.579378] Modules linked in: tcp_diag inet_diag unix_diag=20
>>> xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4=20
>>> xt_tcpudp ip6table_mangle ip6table_nat iptable_mangle iptable_nat=20
>>> nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink=20
>>> ip6table_filter ip6_tables iptable_filter bridge stp llc overlay xfs=20
>>> kvm_hv kvm joydev binfmt_misc uas usb_storage vmx_crypto ofpart=20
>>> cmdlinepart bnx2x powernv_flash mtd mdio crct10dif_vpmsum at24=20
>>> ibmpowernv ipmi_powernv ipmi_devintf powernv_rng ipmi_msghandler=20
>>> opal_prd sch_fq_codel parport_pc nfsd ppdev lp auth_rpcgss nfs_acl=20
>>> parport lockd grace sunrpc ip_tables x_tables autofs4 btrfs=20
>>> blake2b_generic libcrc32c xor zstd_compress raid6_pq input_leds=20
>>> mac_hid hid_generic ast drm_vram_helper drm_ttm_helper i2c_algo_bit=20
>>> ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm=20
>>> drm_panel_orientation_quirks ahci libahci usbhid hid crc32c_vpmsum=20
>>> uio_pdrv_genirq uio
>>> [ 2620.579537] CPU: 125 PID: 0 Comm: swapper/125 Tainted: G=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 D=20
>>> W=C2=A0=C2=A0=C2=A0 L=C2=A0=C2=A0=C2=A0 5.8.0-rc3+ #1
>>> [ 2620.579552] NIP:=C2=A0 c0000000010dad38 LR: c0000000010dad30 CTR:=20
>>> c000000000237830
>>> [ 2620.579568] REGS: c00000ffcb8c7600 TRAP: 0900=C2=A0=C2=A0 Tainted: G=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=20
>>> W=C2=A0=C2=A0=C2=A0 L=C2=A0=C2=A0=C2=A0=C2=A0 (5.8.0-rc3+)
>>> [ 2620.579582] MSR:=C2=A0 9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>=C2=
=A0 CR:=20
>>> 44004228=C2=A0 XER: 00000000
>>> [ 2620.579599] CFAR: c0000000010dad44 IRQMASK: 0 [ 2620.579599] GPR00:=20
>>> c00000000023718c c00000ffcb8c7890 c000000001f9a900 0000000000000000 [=20
>>> 2620.579599] GPR04: c000000001fce438 0000000000000078 000000010008c1f2=20
>>> 0000000000000000 [ 2620.579599] GPR08: 000000ffd96a0000=20
>>> 0000000080000087 0000000000000000 c000000001fd25e0 [ 2620.579599]=20
>>> GPR12: 0000000000004400 c00000ffff72f680 c000000001ea36d8=20
>>> c00000ffcb859800 [ 2620.579599] GPR16: c00000000166c880=20
>>> c0000000016f8e00 000000000000000a c00000ffcb859800 [ 2620.579599]=20
>>> GPR20: 0000000000000100 c00000000166c918 c000000001fd21e8=20
>>> c00000ffcb859800 [ 2620.579599] GPR24: 000000ffd96a0000=20
>>> c000000001d44b80 c000000001d53780 0000000000000008 [ 2620.579599]=20
>>> GPR28: c000000001fd21e0 0000000000000001 0000000000000000=20
>>> c000000001d44b80 [ 2620.579711] NIP [c0000000010dad38]=20
>>> _raw_spin_lock_irqsave+0x98/0x120
>>> [ 2620.579724] LR [c0000000010dad30] _raw_spin_lock_irqsave+0x90/0x120
>>> [ 2620.579737] Call Trace:
>>> [ 2620.579746] [c00000ffcb8c7890] [c0000000013c84a0]=20
>>> ncsi_ops+0x209f50/0x2dc1d8 (unreliable)
>>> [ 2620.579763] [c00000ffcb8c78d0] [c00000000023718c] rcu_core+0xfc/0x7a=
0
>>> [ 2620.579777] [c00000ffcb8c7970] [c0000000010db81c]=20
>>> __do_softirq+0x17c/0x534
>>> [ 2620.579791] [c00000ffcb8c7aa0] [c0000000001786f4] irq_exit+0xd4/0x13=
0
>>> [ 2620.579805] [c00000ffcb8c7ad0] [c000000000025eec]=20
>>> timer_interrupt+0x13c/0x370
>>> [ 2620.579821] [c00000ffcb8c7b40] [c0000000000165c0]=20
>>> replay_soft_interrupts+0x320/0x3f0
>>> [ 2620.579837] [c00000ffcb8c7d30] [c0000000000166d8]=20
>>> arch_local_irq_restore+0x48/0xa0
>>> [ 2620.579853] [c00000ffcb8c7d50] [c000000000de2fe0]=20
>>> cpuidle_enter_state+0x100/0x780

[snip]

>>=20
>> I have to warm reset the system to get it working again.
>=20
> I am unable to reproduce this with Ubuntu=E2=80=99s Linux

Okay, not sure what that would be from, looks like RCU perhaps. Anyway=20
if it comes up again, let us know.

> With Linux 5.8-rc3+, I got now the beginning of the Linux messages.
>=20
>> [  572.253008] Oops: Exception in kernel mode, sig: 5 [#1]
>> [  572.253198] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA Pow=
erNV
>> [  572.253232] Modules linked in: tcp_diag inet_diag unix_diag xt_CHECKS=
UM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_=
mangle ip6table_nat iptable_mangle iptable_nat nf_nat nf_conntrack nf_defra=
g_ipv6 nf_defrag_ipv4 nf_tables nfnetlink ip6table_filter ip6_tables iptabl=
e_filter bridge stp llc overlay xfs kvm_hv kvm binfmt_misc joydev uas usb_s=
torage vmx_crypto bnx2x crct10dif_vpmsum ofpart cmdlinepart powernv_flash m=
td mdio ibmpowernv at24 ipmi_powernv ipmi_devintf ipmi_msghandler opal_prd =
powernv_rng sch_fq_codel parport_pc ppdev lp nfsd parport auth_rpcgss nfs_a=
cl lockd grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic libc=
rc32c xor zstd_compress raid6_pq input_leds mac_hid hid_generic ast drm_vra=
m_helper drm_ttm_helper i2c_algo_bit ttm drm_kms_helper syscopyarea sysfill=
rect sysimgblt fb_sys_fops drm ahci drm_panel_orientation_quirks libahci us=
bhid hid crc32c_vpmsum uio_pdrv_genirq uio
>> [  572.253639] CPU: 4 PID: 6728 Comm: Web Content Not tainted 5.8.0-rc3+=
 #1
>> [  572.253659] NIP:  c00000000000ff5c LR: c00000000001a8f8 CTR: c0000000=
001d5f00
>> [  572.253835] REGS: c000007f31f0f420 TRAP: 1500   Not tainted  (5.8.0-r=
c3+)
>> [  572.253854] MSR:  900000000290b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,L=
E>  CR: 28c48482  XER: 20000000
>> [  572.253888] CFAR: c00000000000fecc IRQMASK: 1=20
>> [  572.253888] GPR00: c00000000001b228 c000007f31f0f6b0 c000000001f9a900=
 c000007f351544d0=20
>> [  572.253888] GPR04: 0000000000000000 c000007f31f0fe90 c000007f351544f0=
 c000007f32e522b0=20
>> [  572.253888] GPR08: 0000000000000000 0000000000002000 9000000000009033=
 c000007fbcd85800=20
>> [  572.253888] GPR12: 0000000000008800 c000007fffffb680 0000000000000005=
 0000000000000004=20
>> [  572.253888] GPR16: c000007f35153800 c000007f35154130 0000000000000005=
 0000000000000001=20
>> [  572.253888] GPR20: 0000000000000024 c000007f32e51e68 c000007f35154028=
 0000007fd8da0000=20
>> [  572.253888] GPR24: 0000007fd8da0000 c000007f351544d0 c000007e9a4024d0=
 c000000001665f18=20
>> [  572.253888] GPR28: c000007f351544d0 c000007f35153800 900000000290f033=
 c000007f35153800=20
>> [  572.254079] NIP [c00000000000ff5c] save_fpu+0xa8/0x2ac
>> [  572.254098] LR [c00000000001a8f8] __giveup_fpu+0x28/0x80
>> [  572.254114] Call Trace:
>> [  572.254128] [c000007f31f0f6b0] [c000007f35153980] 0xc000007f35153980 =
(unreliable)
>> [  572.254156] [c000007f31f0f6e0] [c00000000001b228] giveup_all+0x128/0x=
150
>> [  572.254327] [c000007f31f0f710] [c00000000001c124] __switch_to+0x104/0=
x490
>> [  572.254352] [c000007f31f0f770] [c0000000010d2e34] __schedule+0x2e4/0x=
a10
>> [  572.254374] [c000007f31f0f840] [c0000000010d35d4] schedule+0x74/0x140
>> [  572.254397] [c000007f31f0f870] [c0000000010d9478] schedule_timeout+0x=
358/0x5d0
>> [  572.254424] [c000007f31f0f980] [c0000000010d5638] wait_for_completion=
+0xc8/0x210
>> [  572.254451] [c000007f31f0fa00] [c000000000608ed4] do_coredump+0x3a4/0=
xd60
>> [  572.254625] [c000007f31f0fba0] [c00000000018d1cc] get_signal+0x1dc/0x=
d00
>> [  572.254648] [c000007f31f0fcc0] [c00000000001f088] do_notify_resume+0x=
158/0x450
>> [  572.254672] [c000007f31f0fda0] [c000000000037d04] interrupt_exit_user=
_prepare+0x1c4/0x230
>> [  572.254699] [c000007f31f0fe20] [c00000000000f2b4] interrupt_return+0x=
14/0x1c0
>> [  572.254720] Instruction dump:
>> [  572.254882] dae60170 db060180 db260190 db4601a0 db6601b0 db8601c0 dba=
601d0 dbc601e0=20
>> [  572.254912] dbe601f0 48000204 38800000 f0000250 <7c062798> f0000250 3=
8800010 f0210a50=20
>> [  572.254946] ---[ end trace ba4452ee5c77d58e ]---
>=20
> Please find all the messages attached.

"Oops: Exception in kernel mode, sig: 5 [#1]"

Unfortunately it's a very poor error message. I think it is a 0x1500=20
exception triggering in the kernel FP register saving. Do you have the
CONFIG_PPC_DENORMALISATION config option set?

Thanks,
Nick
