Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAA7217F00
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 07:16:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1nZr2Q7WzDr6Q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 15:16:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jXGsRI+q; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1nTv2SwRzDqVJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 15:11:47 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id g67so20198172pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jul 2020 22:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=KmOioD5Sx+VOrnTOnrg9q65BJ+AXQVZFPEj3acVrBHQ=;
 b=jXGsRI+qkjvRwbthBl+uoiwBV4/uy0Aq645Fcy8ci8sBj2XOwzqHbBUo6aDkXYreU9
 EjD0O6Yz+aZ1naAvNlCuUprDlEl7lmqW/67MtwKv+ZRp1Uac0ymTqIqVBMtBgM/2g0RG
 5vi1gPqP16Q5sk6+bH8iBO9IfCewF5PBom8os7MFGGhMFS7QRFpPY1AHslL4lTvH89lC
 RUYIKY7fqSx2/hAZ7JMDyHhRyWU3OHMYDzUyl+hfzuwChnS6k6PT/YVKudIryMwS/IyU
 QaYH0LmgcDjfH7eKvj0d+KgNjD7k5YeoddxtrRRUEejSTsjHKcsaTdarLbtTfFchn5kZ
 ZL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=KmOioD5Sx+VOrnTOnrg9q65BJ+AXQVZFPEj3acVrBHQ=;
 b=ABaPwAlVGmlgf66Am7/T+KIs3G67SIJCH8FPWiFOO85zjBgIYbtF3pD7V1SdWh8uL2
 vXHGfKuynT0cKHLKW1x4Ne4Iw2hKBW4tf7ylokyLN0ylU0b8HzvasZ+Ew6xvDYmrAuy9
 /LSsDhpAiXFtAQ11E3qBm72ObMF6FXpLtvEXSJHgj9XVdKk0sk10nlO6n5WYG3P4ClJ1
 FDi+2iH2ScdU9ODQuqu0hUGu1smBl2PmqRImC3fACb84gg79E+AiPbsI13Ii0SauORug
 Zg+7og0WLIGTYlhtqwaGaJjhpLaMREzXi+APkNvSiXk9En+DZZm9hipIK4YvtsVyhGUM
 p1jw==
X-Gm-Message-State: AOAM533+NqDTO/Zdj442+am9fzDHzHWZIOTbfbFEphSSkSxlQxSw6RmY
 Q4K1MMxgYLd2stmk47DzZq0=
X-Google-Smtp-Source: ABdhPJy7RO/xnxkE5RLCfL+GP//siyiXtlUkTvJg939rNk/qctilmqXFln/IPTW3WAXZ5j4+4/TysA==
X-Received: by 2002:a63:8c4a:: with SMTP id q10mr48427392pgn.431.1594185103903; 
 Tue, 07 Jul 2020 22:11:43 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id c12sm24306493pfn.162.2020.07.07.22.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 22:11:43 -0700 (PDT)
Date: Wed, 08 Jul 2020 15:11:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Using Firefox hangs system
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Paul Menzel
 <pmenzel@molgen.mpg.de>
References: <673619a2-74d7-105b-dacb-bec15bc37872@molgen.mpg.de>
 <2a86d85d-b51d-52c5-f84f-efea5a0ca628@molgen.mpg.de>
 <1593995628.78zg3dfzk8.astroid@bobo.none>
 <de2c9ccd-a078-a2ca-e7c7-13a1032cbda3@molgen.mpg.de>
 <1594101688.1iv25hofi6.astroid@bobo.none>
 <604fa0d7-ddb5-7302-fd28-b9fee57ce015@molgen.mpg.de>
In-Reply-To: <604fa0d7-ddb5-7302-fd28-b9fee57ce015@molgen.mpg.de>
MIME-Version: 1.0
Message-Id: <1594185067.e3lxl6qocu.astroid@bobo.none>
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

Excerpts from Paul Menzel's message of July 8, 2020 3:42 am:
> Dear Nicholas,
>=20
>=20
> Am 07.07.20 um 09:03 schrieb Nicholas Piggin:
>> Excerpts from Paul Menzel's message of July 6, 2020 3:20 pm:
>=20
>>> Am 06.07.20 um 02:41 schrieb Nicholas Piggin:
>>>> Excerpts from Paul Menzel's message of July 5, 2020 8:30 pm:
>>>
>>>>> Am 05.07.20 um 11:22 schrieb Paul Menzel:
>>>>>> [  572.253008] Oops: Exception in kernel mode, sig: 5 [#1]
>>>>>> [  572.253198] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA=
 PowerNV
>>>>>> [  572.253232] Modules linked in: tcp_diag inet_diag unix_diag xt_CH=
ECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6ta=
ble_mangle ip6table_nat iptable_mangle iptable_nat nf_nat nf_conntrack nf_d=
efrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink ip6table_filter ip6_tables ip=
table_filter bridge stp llc overlay xfs kvm_hv kvm binfmt_misc joydev uas u=
sb_storage vmx_crypto bnx2x crct10dif_vpmsum ofpart cmdlinepart powernv_fla=
sh mtd mdio ibmpowernv at24 ipmi_powernv ipmi_devintf ipmi_msghandler opal_=
prd powernv_rng sch_fq_codel parport_pc ppdev lp nfsd parport auth_rpcgss n=
fs_acl lockd grace sunrpc ip_tables x_tables autofs4 btrfs blake2b_generic =
libcrc32c xor zstd_compress raid6_pq input_leds mac_hid hid_generic ast drm=
_vram_helper drm_ttm_helper i2c_algo_bit ttm drm_kms_helper syscopyarea sys=
fillrect sysimgblt fb_sys_fops drm ahci drm_panel_orientation_quirks libahc=
i usbhid hid crc32c_vpmsum uio_pdrv_genirq uio
>>>>>> [  572.253639] CPU: 4 PID: 6728 Comm: Web Content Not tainted 5.8.0-=
rc3+ #1
>>>>>> [  572.253659] NIP:  c00000000000ff5c LR: c00000000001a8f8 CTR: c000=
0000001d5f00
>>>>>> [  572.253835] REGS: c000007f31f0f420 TRAP: 1500   Not tainted  (5.8=
.0-rc3+)
>>>>>> [  572.253854] MSR:  900000000290b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,=
RI,LE>  CR: 28c48482  XER: 20000000
>>>>>> [  572.253888] CFAR: c00000000000fecc IRQMASK: 1
>>>>>> [  572.253888] GPR00: c00000000001b228 c000007f31f0f6b0 c000000001f9=
a900 c000007f351544d0
>>>>>> [  572.253888] GPR04: 0000000000000000 c000007f31f0fe90 c000007f3515=
44f0 c000007f32e522b0
>>>>>> [  572.253888] GPR08: 0000000000000000 0000000000002000 900000000000=
9033 c000007fbcd85800
>>>>>> [  572.253888] GPR12: 0000000000008800 c000007fffffb680 000000000000=
0005 0000000000000004
>>>>>> [  572.253888] GPR16: c000007f35153800 c000007f35154130 000000000000=
0005 0000000000000001
>>>>>> [  572.253888] GPR20: 0000000000000024 c000007f32e51e68 c000007f3515=
4028 0000007fd8da0000
>>>>>> [  572.253888] GPR24: 0000007fd8da0000 c000007f351544d0 c000007e9a40=
24d0 c000000001665f18
>>>>>> [  572.253888] GPR28: c000007f351544d0 c000007f35153800 900000000290=
f033 c000007f35153800
>>>>>> [  572.254079] NIP [c00000000000ff5c] save_fpu+0xa8/0x2ac
>>>>>> [  572.254098] LR [c00000000001a8f8] __giveup_fpu+0x28/0x80
>>>>>> [  572.254114] Call Trace:
>>>>>> [  572.254128] [c000007f31f0f6b0] [c000007f35153980] 0xc000007f35153=
980 (unreliable)
>>>>>> [  572.254156] [c000007f31f0f6e0] [c00000000001b228] giveup_all+0x12=
8/0x150
>>>>>> [  572.254327] [c000007f31f0f710] [c00000000001c124] __switch_to+0x1=
04/0x490
>>>>>> [  572.254352] [c000007f31f0f770] [c0000000010d2e34] __schedule+0x2e=
4/0xa10
>>>>>> [  572.254374] [c000007f31f0f840] [c0000000010d35d4] schedule+0x74/0=
x140
>>>>>> [  572.254397] [c000007f31f0f870] [c0000000010d9478] schedule_timeou=
t+0x358/0x5d0
>>>>>> [  572.254424] [c000007f31f0f980] [c0000000010d5638] wait_for_comple=
tion+0xc8/0x210
>>>>>> [  572.254451] [c000007f31f0fa00] [c000000000608ed4] do_coredump+0x3=
a4/0xd60
>>>>>> [  572.254625] [c000007f31f0fba0] [c00000000018d1cc] get_signal+0x1d=
c/0xd00
>>>>>> [  572.254648] [c000007f31f0fcc0] [c00000000001f088] do_notify_resum=
e+0x158/0x450
>>>>>> [  572.254672] [c000007f31f0fda0] [c000000000037d04] interrupt_exit_=
user_prepare+0x1c4/0x230
>>>>>> [  572.254699] [c000007f31f0fe20] [c00000000000f2b4] interrupt_retur=
n+0x14/0x1c0
>>>>>> [  572.254720] Instruction dump:
>>>>>> [  572.254882] dae60170 db060180 db260190 db4601a0 db6601b0 db8601c0=
 dba601d0 dbc601e0
>>>>>> [  572.254912] dbe601f0 48000204 38800000 f0000250 <7c062798> f00002=
50 38800010 f0210a50
>>>>>> [  572.254946] ---[ end trace ba4452ee5c77d58e ]---
>>>>>
>>>>> Please find all the messages attached.
>>>>
>>>> "Oops: Exception in kernel mode, sig: 5 [#1]"
>>>>
>>>> Unfortunately it's a very poor error message. I think it is a 0x1500
>>>> exception triggering in the kernel FP register saving. Do you have the
>>>> CONFIG_PPC_DENORMALISATION config option set?
>>>
>>> Yes, as it=E2=80=99s set in the Ubuntu Linux kernel configuration, I ha=
ve it set
>>> too.
>>>
>>>       $ grep DENORMALI /boot/config-*
>>>       /boot/config-4.15.0-23-generic:CONFIG_PPC_DENORMALISATION=3Dy
>>>       /boot/config-5.4.0-40-generic:CONFIG_PPC_DENORMALISATION=3Dy
>>>       /boot/config-5.7.0-rc5+:CONFIG_PPC_DENORMALISATION=3Dy
>>>       /boot/config-5.8.0-rc3+:CONFIG_PPC_DENORMALISATION=3Dy
>>=20
>> Ah thanks I was able to reproduce with a little denorm test case.
>>=20
>> The denorm interrupt handler got broken by some careless person.
>>=20
>> This patch should hopefully fix it for you?
>=20
> Yes, it does. Thank you.
>=20
>> ---
>>   arch/powerpc/kernel/exceptions-64s.S | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/=
exceptions-64s.S
>> index fa080694e581..0fc8bad878b2 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -2551,7 +2551,7 @@ EXC_VIRT_NONE(0x5400, 0x100)
>>   INT_DEFINE_BEGIN(denorm_exception)
>>   	IVEC=3D0x1500
>>   	IHSRR=3D1
>> -	IBRANCH_COMMON=3D0
>> +	IBRANCH_TO_COMMON=3D0
>>   	IKVM_REAL=3D1
>>   INT_DEFINE_END(denorm_exception)
>=20
> Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>

Thanks for reporting and testing, sorry for breaking it for you!

Thanks,
Nick
