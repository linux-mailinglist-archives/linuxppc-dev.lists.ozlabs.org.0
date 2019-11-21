Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EBE10585A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 18:16:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JmRn4GFhzDqNy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 04:16:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="GPQL0524"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JmNt6wMrzDqJW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 04:13:32 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id o11so4456344qtr.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 09:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ZayFKbpxem7Rx6sqPfGZD/6/mm/I31n5mHZK6Q7q9tU=;
 b=GPQL0524sl+LtJiva3RSEYipi8YEacJn6/zQYZrWVjhF9s4HrtvymIeZTKgH3MIXFj
 R8wfKqqLfrgLVm09e6h3BiX+OPV+4bLeFUeZRCNF/gHg7Qm0M0wXl6FF86NAdOi28dY+
 fyi1KC4P9RV1AoS+WEXiaQpV2BZymq9Gd6avy28yc3h9CXmCf3d8la+Ga5k9v7j/YxIN
 jvAK7m81QIWOTYLjQ1QCoVeCPQwYo33RmnmIVNTMsUSfMnQitHblRD9NlGDSyXnAG542
 tR52KaigPuCxD6QqBTWi9mG0zXIucIRWujzS96qwKku/CDsQjAbfbF0IvBP4B+KSx08d
 i9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=ZayFKbpxem7Rx6sqPfGZD/6/mm/I31n5mHZK6Q7q9tU=;
 b=NcaHE/aRwWQWowEECA2Sg52E+bslCHoMH99MJe0ptau6/fcQu0uzoc7qC5FqCP93cd
 F40GbC7RQNsoIVCSBq/coXr/T8kieoVSn+E04F5iYac5Qzx7WsRfpCcsetIS+9WUCasZ
 rtRF/hPoNqdlOKiqzPfTjy3cj42IqZfv87KRj0kCEJJoWPJ30ZOQaF+nEb+32N773Gde
 FVW2QOSzxR1VG2f8F9PIfLSkMjBhhHLJiQCRdmeD2skZq6uihcFFrLcKAiVyTQCmCg2H
 7I/a/n89ZeWt0pWiY7fSyCr0VW3Dn6fnjJzWFUyb9jFDgxfZ97K8bJHxXWf5vwSC79lz
 8epw==
X-Gm-Message-State: APjAAAVaIqqp/EgxCJ82vHUpmWK/tF85GjNcuaZmCJDLmtMS5PDFN2w6
 27h5vewwu87mEIRA6AhlPVr0+w==
X-Google-Smtp-Source: APXvYqwEgQaqD3B35v9Mdg0/skLSiCGkKVXAgGMhhURL0L9EnOzRsquRUSLtv+4y/PMPaBJmnDlcOw==
X-Received: by 2002:ac8:13ca:: with SMTP id i10mr9262795qtj.214.1574356409173; 
 Thu, 21 Nov 2019 09:13:29 -0800 (PST)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id l12sm530371qtf.93.2019.11.21.09.13.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Nov 2019 09:13:28 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: lockdep warning while booting POWER9 PowerNV
From: Qian Cai <cai@lca.pw>
In-Reply-To: <87ef0vpfbc.fsf@mpe.ellerman.id.au>
Date: Thu, 21 Nov 2019 12:13:27 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <1CAD8EC3-21B3-46BF-82BD-04921126C1B3@lca.pw>
References: <1567199630.5576.39.camel@lca.pw>
 <9b8b287a-4ae1-ca9b-cff1-6d93672b6893@acm.org>
 <87ef0vpfbc.fsf@mpe.ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3601.0.10)
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
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Bart Van Assche <bvanassche@acm.org>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Sep 4, 2019, at 11:55 PM, Michael Ellerman <mpe@ellerman.id.au> =
wrote:
>=20
> Bart Van Assche <bvanassche@acm.org> writes:
>> On 8/30/19 2:13 PM, Qian Cai wrote:
>>> =
https://raw.githubusercontent.com/cailca/linux-mm/master/powerpc.config
>>>=20
>>> Once in a while, booting an IBM POWER9 PowerNV system (8335-GTH) =
would generate
>>> a warning in lockdep_register_key() at,
>>>=20
>>> if (WARN_ON_ONCE(static_obj(key)))
>>>=20
>>> because
>>>=20
>>> key =3D 0xc0000000019ad118
>>> &_stext =3D 0xc000000000000000
>>> &_end =3D 0xc0000000049d0000
>>>=20
>>> i.e., it will cause static_obj() returns 1.
>>=20
>> (back from a trip)
>>=20
>> Hi Qian,
>>=20
>> Does this mean that on POWER9 it can happen that a dynamically =
allocated=20
>> object has an address that falls between &_stext and &_end?
>=20
> I thought that was true on all arches due to initmem, but seems not.
>=20
> I guess we have the same problem as s390 and we need to define
> arch_is_kernel_initmem_freed().
>=20
> Qian, can you try this:
>=20
> diff --git a/arch/powerpc/include/asm/sections.h =
b/arch/powerpc/include/asm/sections.h
> index 4a1664a8658d..616b1b7b7e52 100644
> --- a/arch/powerpc/include/asm/sections.h
> +++ b/arch/powerpc/include/asm/sections.h
> @@ -5,8 +5,22 @@
>=20
> #include <linux/elf.h>
> #include <linux/uaccess.h>
> +
> +#define arch_is_kernel_initmem_freed arch_is_kernel_initmem_freed
> +
> #include <asm-generic/sections.h>
>=20
> +extern bool init_mem_is_free;
> +
> +static inline int arch_is_kernel_initmem_freed(unsigned long addr)
> +{
> +	if (!init_mem_is_free)
> +		return 0;
> +
> +	return addr >=3D (unsigned long)__init_begin &&
> +		addr < (unsigned long)__init_end;
> +}
> +
> extern char __head_end[];
>=20
> #ifdef __powerpc64__
>=20

Michael, this fix is also needed as it starts to trigger another one of =
those where the allocated
memory is from initmem.=20

[   31.326825] key =3D c0000000019049a0
[   31.326862] stext =3D c000000000000000, end =3D c0000000070e0000
[   31.326907] init_start =3D c000000000c70000, init_end =3D =
c0000000020f0000

[   31.325021] WARNING: CPU: 0 PID: 5 at kernel/locking/lockdep.c:1121 =
lockdep_register_key+0xb4/0x340
[   31.325061] Modules linked in: tg3(+) ahci(+) libahci libata mdio =
libphy firmware_class dm_mirror dm_region_hash dm_log dm_mod
[   31.325128] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted =
5.4.0-rc8-next-20191120+ #4
[   31.325190] Workqueue: events work_for_cpu_fn
[   31.325215] NIP:  c0000000001a23a4 LR: c00000000075eccc CTR: =
0000000000000000
[   31.325257] REGS: c00000002e72f4c0 TRAP: 0700   Not tainted  =
(5.4.0-rc8-next-20191120+)
[   31.325320] MSR:  900000000282b033 =
<SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 48000c20  XER: 20040000
[   31.325392] CFAR: c0000000001a233c IRQMASK: 0=20
               GPR00: c00000000075eccc c00000002e72f750 c000000002cff500 =
c0000000070df500=20
               GPR04: c0000014beb01990 c0000000019042b8 0000000000000000 =
0000000000000000=20
               GPR08: 0000000000000000 0000000000000000 c000000000425e28 =
c00c000004761020=20
               GPR12: 0000000000000000 c0000000070e0000 c00000002e5214f8 =
c000001ffca018c8=20
               GPR16: c000001ffca018e4 c000001ffca01c80 c000001ffca018d0 =
c00000002e6e3e48=20
               GPR20: c000000002cbf500 c00000002e520080 c000001ffca05408 =
c00000002e6e3e00=20
               GPR24: c0000000007d36d0 0000000000000005 0000000000000005 =
c000000001904000=20
               GPR28: c0000000070e0000 c000000000000000 c0000000019049a0 =
c00000002e72f7f0=20
[   31.325765] NIP [c0000000001a23a4] lockdep_register_key+0xb4/0x340
[   31.325809] LR [c00000000075eccc] alloc_netdev_mqs+0x15c/0x500
[   31.325848] Call Trace:
[   31.325886] [c00000002e72f750] [0000000000000005] 0x5 (unreliable)
[   31.325930] [c00000002e72f7f0] [c00000000075eccc] =
alloc_netdev_mqs+0x15c/0x500
[   31.325984] [c00000002e72f8d0] [c0000000007d37f0] =
alloc_etherdev_mqs+0x60/0x90
[   31.326047] [c00000002e72f910] [c00800000f150110] =
tg3_init_one+0x108/0x1d00 [tg3]
[   31.326098] [c00000002e72fac0] [c000000000633b48] =
local_pci_probe+0x78/0x100
[   31.326143] [c00000002e72fb50] [c000000000134b60] =
work_for_cpu_fn+0x40/0x70
[   31.326190] [c00000002e72fb80] [c00000000013927c] =
process_one_work+0x3ac/0x710
[   31.326221] [c00000002e72fc70] [c000000000138d90] =
process_scheduled_works+0x60/0xa0
[   31.326274] [c00000002e72fcb0] [c000000000139ba4] =
worker_thread+0x344/0x4a0
[   31.326317] [c00000002e72fda0] [c000000000142f68] kthread+0x1b8/0x1e0
[   31.326363] [c00000002e72fe20] [c00000000000b748] =
ret_from_kernel_thread+0x5c/0x74
[   31.326412] Instruction dump:
[   31.326448] 28230000 418200a0 7fc3f378 48191fd9 60000000 70630001 =
41810018 7fc3f378=20
[   31.326510] 4807fe25 60000000 70630001 40810060 <0fe00000> 3c62fffc =
8883fa2f 70840001=20
[   31.326573] irq event stamp: 806
[   31.326617] hardirqs last  enabled at (805): [<c0000000008daa4c>] =
_raw_write_unlock_irqrestore+0x5c/0xc0
[   31.326666] hardirqs last disabled at (806): [<c000000000008fbc>] =
program_check_common+0x21c/0x230
[   31.326710] softirqs last  enabled at (0): [<c0000000000fa098>] =
copy_process+0x688/0x1850
[   31.326752] softirqs last disabled at (0): [<0000000000000000>] 0x0
[   31.326791] ---[ end trace c9674d7f7d278f30 ]---


