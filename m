Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 003143DC6F3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 18:36:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GcVJS4G7wz3cVf
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 02:36:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GcVHz5ssbz3002
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Aug 2021 02:35:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GcVHs0RTGzBB6B;
 Sat, 31 Jul 2021 18:35:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id frZPMb5MSNCg; Sat, 31 Jul 2021 18:35:36 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GcVHr6TZLzBB44;
 Sat, 31 Jul 2021 18:35:36 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 30E13B4; Sat, 31 Jul 2021 18:40:59 +0200 (CEST)
Received: from 37-173-18-216.coucou-networks.fr
 (37-173-18-216.coucou-networks.fr [37.173.18.216]) by messagerie.c-s.fr
 (Horde Framework) with HTTP; Sat, 31 Jul 2021 18:40:59 +0200
Date: Sat, 31 Jul 2021 18:40:59 +0200
Message-ID: <20210731184059.Horde.Yln_bjDrKlAdWFSSbeXUSQ1@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Finn Thain <fthain@linux-m68k.org>
Subject: Re: [PATCH v3 31/41] powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
 <ca5795d04a220586b7037dbbbe6951dfa9e768eb.1615552867.git.christophe.leroy@csgroup.eu>
 <666e3ab4-372-27c2-4621-7cc3933756dd@linux-m68k.org>
In-Reply-To: <666e3ab4-372-27c2-4621-7cc3933756dd@linux-m68k.org>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Stan Johnson <userm57@yahoo.com>, linux-kernel@vger.kernel.org,
 Nick Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Finn Thain <fthain@linux-m68k.org> a =C3=A9crit=C2=A0:

> Hi Christophe,

> We found that reducing memory with the kernel parameter 'mem=3D464M' woul=
d
> prevent the crash.
>
> Below are Stan's notes from the 'git bisect' run. They include an
> additional failure mode that might be of interest. We've also observed
> "Kernel attempted to write user page (c6207c) - exploit attempt?" and
> "kernel BUG at arch/powerpc/kernel/interrupt.c:49!".
>

Interesting.  Can you provide detailed log of thoose two BUGs ?

Thanks
Christophe




>
> On Thu, 29 Jul 2021, Stanley J. Johnson wrote:
>
>> Here are the git bisect results (I saved the kernels and dmesg outputs
>> in case they're needed later, though it's easy enough to re-create the
>> results).
>>
>> We'll have up to two boots (only one if the first boot fails) for each
>> kernel on WS-1 with the default memory setting of 512M.
>>
>> 1) 5.12.0-pmac-08447-g85f3f17b5db (good)
>> -> works: no dmesg errs, X works
>> -> works: no dmesg errs, X works
>>
>> 2) 5.12.0-pmac-12750-g23243c1ace9 (bad)
>> (Crash and burn. I was tempted to mark this one "skip", since the errors
>> are different, though we've seen them in earlier tests. So there could
>> be multiple regressions. But let's keep chasing this one. I can re-run
>> the bisect later and skip some failures if necessary.)
>> -> fails: "Unable to contact settings server" after wdm login; dmesg err=
ors:
>> ...
>> [  127.169294] BUG: Unable to handle kernel instruction fetch (NULL=20=
=20
>>=20pointer?)
>> [  127.169397] Faulting instruction address: 0x00000000
>> [  127.169635] Oops: Kernel access of bad area, sig: 11 [#2]
>> [  127.169661] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
>> [  127.169696] Modules linked in:
>> [  127.169736] CPU: 0 PID: 1877 Comm: gdbus Tainted: G      D=20=20
>>=205.12.0-pmac-12750-g23243c1ace9 #9
>> [  127.169776] NIP:  00000000 LR: 00000000 CTR: 00000000
>> ...
>>
>> 3) 5.12.0-rc7-pmac-02335-gaeacb52a8de (good)
>> -> works: no dmesg errs, X works
>> -> works: no dmesg errs, X works
>>
>> 4) 5.12.0-pmac-11585-g95275402f66 (bad)
>> -> fails: dmesg errs, wdm login fails with "Unable to contact settings
>> server..."
>> ...
>> [   58.290883] BUG: Unable to handle kernel instruction fetch
>> [   58.291009] Faulting instruction address: 0x7cc903a4
>> [   58.291240] Oops: Kernel access of bad area, sig: 11 [#1]
>> [   58.291268] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
>> [   58.291305] Modules linked in:
>> [   58.291349] CPU: 0 PID: 1750 Comm: Xorg Not tainted=20=20
>>=205.12.0-pmac-11585-g95275402f66 #11
>> [   58.291391] NIP:  7cc903a4 LR: 7cc903a6 CTR: c0127eb8
>> [   58.291417] REGS: e2da1e70 TRAP: 0400   Not tainted=20=20
>>=20(5.12.0-pmac-11585-g95275402f66)
>> [   58.291450] MSR:  40001030 <ME,IR,DR>  CR: 28008228  XER: 20000000
>> ...
>>
>> 5) 5.12.0-pmac-11068-g9d31d233895 (good)
>> -> works: no dmesg errs, X works
>> -> works: no dmesg errs, X works
>>
>> 6) 5.12.0-rc3-pmac-00258-ga9d2f9bb225 (bad)
>> -> fails: wdm dies at login, screen hangs, dmesg errs that I haven't
>> seen before:
>> ...
>> [   59.988732] InputThread[1751]: bad frame in sys_rt_sigreturn:=20=20
>>=2051a79ab6 nip 001023c8 lr 001023c0
>> [   62.079043] InputThread[1760]: bad frame in sys_rt_sigreturn:=20=20
>>=20a98be235 nip 001023c8 lr 001023c0
>> [   64.348063] InputThread[1776]: bad frame in sys_rt_sigreturn:=20=20
>>=20a46b945e nip 001023c8 lr 001023c0
>> [   66.413980] InputThread[1785]: bad frame in sys_rt_sigreturn:=20=20
>>=20a98be235 nip 001023c8 lr 001023c0
>> [   68.486768] InputThread[1794]: bad frame in sys_rt_sigreturn:=20=20
>>=20677e693b nip 001023c8 lr 001023c0
>>
>> 7) 5.12.0-rc3-pmac-00129-g036fc2cb1dc (bad)
>> -> fails: dmesg errs, wdm hangs (wdm did not crash, screen seems hung)
>> ...
>> [  101.136941] BUG: Unable to handle kernel instruction fetch
>> [  101.137059] Faulting instruction address: 0xfea31f74
>> [  101.137296] Oops: Kernel access of bad area, sig: 11 [#1]
>> [  101.137323] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
>> [  101.137358] Modules linked in:
>> [  101.137401] CPU: 0 PID: 1882 Comm: xfce4-session Not tainted=20=20
>>=205.12.0-rc3-pmac-00129-g036fc2cb1dc #14
>> [  101.137443] NIP:  fea31f74 LR: fea31f74 CTR: c00cfef4
>> [  101.137470] REGS: e2e21e70 TRAP: 0400   Not tainted=20=20
>>=20(5.12.0-rc3-pmac-00129-g036fc2cb1dc)
>> [  101.137502] MSR:  40001030 <ME,IR,DR>  CR: 220084e8  XER: 00000000
>> ...
>>
>> 8) 5.12.0-rc3-pmac-00064-g719e7e212c7 (good)
>> -> works: no dmesg errs, X works
>> -> works: no dmesg errs, X works
>>
>> 9) 5.12.0-rc3-pmac-00096-ga2308836880 (bad)
>> -> fails: dmesg errs, wdm hangs while validating login
>> ...
>> [  104.559951] BUG: Unable to handle kernel instruction fetch
>> [  104.560086] Faulting instruction address: 0xfe988ba4
>> [  104.560307] Oops: Kernel access of bad area, sig: 11 [#1]
>> [  104.560337] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
>> [  104.560371] Modules linked in:
>> [  104.560415] CPU: 0 PID: 1834 Comm: xfce4-session Not tainted=20=20
>>=205.12.0-rc3-pmac-00096-ga2308836880 #16
>> [  104.560457] NIP:  fe988ba4 LR: fe988ba4 CTR: c00cfee8
>> [  104.560484] REGS: e2d9de70 TRAP: 0400   Not tainted=20=20
>>=20(5.12.0-rc3-pmac-00096-ga2308836880)
>> [  104.560517] MSR:  40001030 <ME,IR,DR>  CR: 220484e8  XER: 00000000
>> ...
>> [  114.371853] BUG: Unable to handle kernel instruction fetch
>> [  114.371998] Faulting instruction address: 0x3e62a270
>> [  114.372270] Oops: Kernel access of bad area, sig: 11 [#2]
>> [  114.372298] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
>> [  114.372334] Modules linked in:
>> [  114.372382] CPU: 0 PID: 1858 Comm: xfwm4 Tainted: G      D=20=20
>>=205.12.0-rc3-pmac-00096-ga2308836880 #16
>> [  114.372425] NIP:  3e62a270 LR: 3e62a271 CTR: c065eebc
>> [  114.372452] REGS: e2dede70 TRAP: 0400   Tainted: G      D=20=20
>>=20(5.12.0-rc3-pmac-00096-ga2308836880)
>> [  114.372486] MSR:  40001030 <ME,IR,DR>  CR: 22002284  XER: 00000000
>> ...
>>
>> 10) 5.12.0-rc3-pmac-00080-g7a7d744ffe8 (bad)
>> -> fails: dmesg errs, "Unable to contact settings server..."
>> ...
>> [  170.622408] BUG: Unable to handle kernel instruction fetch
>> [  170.622546] Faulting instruction address: 0xfe9255d4
>> [  170.622777] Oops: Kernel access of bad area, sig: 11 [#1]
>> [  170.622806] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
>> [  170.622841] Modules linked in:
>> [  170.622885] CPU: 0 PID: 1863 Comm: xfce4-session Not tainted=20=20
>>=205.12.0-rc3-pmac-00080-g7a7d744ffe8 #17
>> [  170.622927] NIP:  fe9255d4 LR: fe9255d4 CTR: c00cfee8
>> [  170.622954] REGS: e2da1e70 TRAP: 0400   Not tainted=20=20
>>=20(5.12.0-rc3-pmac-00080-g7a7d744ffe8)
>> [  170.622987] MSR:  40001030 <ME,IR,DR>  CR: 220484e8  XER: 00000000
>> ...
>> [  172.611235] BUG: Unable to handle kernel instruction fetch (NULL=20=
=20
>>=20pointer?)
>> [  172.611364] Faulting instruction address: 0x00000000
>> [  172.611662] Oops: Kernel access of bad area, sig: 11 [#2]
>> [  172.611690] BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
>> [  172.611725] Modules linked in:
>> [  172.611773] CPU: 0 PID: 1871 Comm: gmain Tainted: G      D=20=20
>>=205.12.0-rc3-pmac-00080-g7a7d744ffe8 #17
>> [  172.611814] NIP:  00000000 LR: 00000000 CTR: 00000000
>> [  172.611840] REGS: e2db9e70 TRAP: 0400   Tainted: G      D=20=20
>>=20(5.12.0-rc3-pmac-00080-g7a7d744ffe8)
>> [  172.611874] MSR:  40001030 <ME,IR,DR>  CR: 28008468  XER: 00000000
>> ...
>>
>> 11) 5.12.0-rc3-pmac-00072-ga2b3e09ae41 (bad)
>> -> fails: kernel panic, I'd have to capture the output via a serial cons=
ole
>>
>> 12) 5.12.0-rc3-pmac-00068-gacc142b6230 (bad)
>> -> fails: kernel panic
>>
>> 13) 5.12.0-rc3-pmac-00066-g8f6ff5bd9b7 (good)
>> -> works: no dmesg errs, X works
>> -> works: no dmesg errs, X works
>>
>> 14) 5.12.0-rc3-pmac-00067-g4c0104a83fc (bad)
>> -> fails: kernel panic
>>
>> The git bisect thinks this is the bad commit, but I'm not sure it means
>> anything at all:
>>
>> -----
>>
>> 4c0104a83fc3990a76a01a2f4e504251fa9814c4 is the first bad commit


