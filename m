Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78667103558
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 08:43:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hvn95h2YzDqpH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 18:43:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HvhP6g5GzDqpH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 18:39:00 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47HvhF3JJsz9txdb;
 Wed, 20 Nov 2019 08:38:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 2Je4SgxbiTWQ; Wed, 20 Nov 2019 08:38:53 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47HvhF1c8fz9txdY;
 Wed, 20 Nov 2019 08:38:53 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id C7CEAC70; Wed, 20 Nov 2019 08:38:55 +0100 (CET)
Received: from 37-170-47-250.coucou-networks.fr
 (37-170-47-250.coucou-networks.fr [37.170.47.250]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Wed, 20 Nov 2019 08:38:55 +0100
Date: Wed, 20 Nov 2019 08:38:55 +0100
Message-ID: <20191120083855.Horde.tWflxXv8u6A3uBxaMJth5g7@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 15/15] powerpc/32s: Activate CONFIG_VMAP_STACK
References: <cover.1568106758.git.christophe.leroy@c-s.fr>
 <a99bdfb64e287b16b8cd3f7ec1abfdfb50c7cc64.1568106758.git.christophe.leroy@c-s.fr>
 <875zjgcpyx.fsf@mpe.ellerman.id.au>
In-Reply-To: <875zjgcpyx.fsf@mpe.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> a =C3=A9crit=C2=A0:

> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> A few changes to retrieve DAR and DSISR from struct regs
>> instead of retrieving them directly, as they may have
>> changed due to a TLB miss.
>>
>> Also modifies hash_page() and friends to work with virtual
>> data addresses instead of physical ones.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>  arch/powerpc/kernel/entry_32.S         |  4 +++
>>  arch/powerpc/kernel/head_32.S          | 19 +++++++++++---
>>  arch/powerpc/kernel/head_32.h          |  4 ++-
>>  arch/powerpc/mm/book3s32/hash_low.S    | 46=20=20
>>=20+++++++++++++++++++++-------------
>>  arch/powerpc/mm/book3s32/mmu.c         |  9 +++++--
>>  arch/powerpc/platforms/Kconfig.cputype |  2 ++
>>  6 files changed, 61 insertions(+), 23 deletions(-)
>
> This is faulting with qemu mac99 model:
>
>   Key type id_resolver registered
>   Key type id_legacy registered
>   BUG: Unable to handle kernel data access on read at 0x2f0db684
>   Faulting instruction address: 0x00004130
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   BE PAGE_SIZE=3D4K MMU=3DHash PowerMac
>   Modules linked in:
>   CPU: 0 PID: 65 Comm: modprobe Not tainted 5.4.0-rc2-gcc49+ #63
>   NIP:  00004130 LR: 000008c8 CTR: b7eb86e0
>   REGS: f106de80 TRAP: 0300   Not tainted  (5.4.0-rc2-gcc49+)
>   MSR:  00003012 <FP,ME,DR,RI>  CR: 4106df38  XER: 20000000
>   DAR: 2f0db684 DSISR: 40000000
>   GPR00: b7ec5d64 f106df38 00000000 bf988a70 00000000 2f0db540=20=20
>=20b7ec3620 bf988d38
>   GPR08: 10000880 0000d032 72656773 f106df38 b7ed10ec 00000000=20=20
>=20b7ed3d38 b7ee8900
>   GPR16: bf988d10 00000001 00000000 bf988d10 b7ec3620 bf988d50=20=20
>=20b7ee76ec b7ee7320
>   GPR24: 10000878 00000000 b7ee8900 00000000 10029f00 10000879=20=20
>=20b7ee7ff4 bf988d30
>   NIP [00004130] 0x4130
>   LR [000008c8] 0x8c8
>   Call Trace:
>   [f106df38] [c0016224] ret_from_syscall+0x0/0x34 (unreliable)
>   --- interrupt: c01 at 0xb7ed0f50
>       LR =3D 0xb7ec5d64
>   Instruction dump:
>   db8300e0 XXXXXXXX XXXXXXXX XXXXXXXX fc00048e XXXXXXXX XXXXXXXX XXXXXXXX
>   60a52000 XXXXXXXX XXXXXXXX XXXXXXXX 80850144 XXXXXXXX XXXXXXXX XXXXXXXX
>   ---[ end trace 265da51c6d8b86c5 ]---
>
>
> I think I'll have to drop this series for now.

What about taking the series up to patch 13 ?

I think the problem is related to hash handling as it is working well=20=20
on=20the 8xx (and on the 83xx which is a nohash book3s). I'll look at=20=20
book3s=20hash next week.

Christophe




