Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B90535AC7E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 11:33:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHVDC0ZF9z3c1H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 19:33:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256 header.s=1a1hai header.b=hDHquVIs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=me.com
 (client-ip=17.58.6.56; helo=pv50p00im-ztdg10021801.me.com;
 envelope-from=sxwjean@me.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=me.com header.i=@me.com header.a=rsa-sha256
 header.s=1a1hai header.b=hDHquVIs; dkim-atps=neutral
Received: from pv50p00im-ztdg10021801.me.com (pv50p00im-ztdg10021801.me.com
 [17.58.6.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHVCl0R3kz30C3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 19:32:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1618047168; bh=TuKzrScqdRWu72rMVnZMiFTpDKkn4mp/CnjnJ/3EEZ4=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=hDHquVIszATKxOPv9lUvXT05wc204MqE3c84Y1fJjNVmpCjOOYDvtTNq9zQaJUncx
 4VKFMRdOOR22fUMrcHV+A/3rpdc9OEddsbigiAGGZL0H+WIpOxDFXL+VoanRhVHslx
 Q+5omzfSolb4JER2t+ZpnFtKUqyi5duVuApy9mYMKhVkWT1Na8BVzVAcXn6X2NTBYs
 QvQQqdjWcw6FSJ7TMgJ5e7cN5Ix0QLCjNu0Rz4iCYNFQBOITQX25hrTsM1YzLRJJUB
 ih/S5GNZHPu3hHGK/dAALMiWPdttROqrECJe5MmpfrDkawwkdvCCOp4km1AJmmT3iE
 dsUoKNadWuNHQ==
Received: from 192.168.1.3 (unknown [120.245.2.39])
 by pv50p00im-ztdg10021801.me.com (Postfix) with ESMTPSA id 746173603A0;
 Sat, 10 Apr 2021 09:32:41 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v4] powerpc/traps: Enhance readability for trap types
From: Xiongwei Song <sxwjean@me.com>
In-Reply-To: <1618014353.jyyolglj7u.astroid@bobo.none>
Date: Sat, 10 Apr 2021 17:32:38 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <757C4B35-860C-4688-A135-507B49F7D078@me.com>
References: <20210409142832.26063-1-sxwjean@me.com>
 <1618014353.jyyolglj7u.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-10_06:2021-04-09,
 2021-04-10 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2009150000 definitions=main-2104100072
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
Cc: ravi.bangoria@linux.ibm.com, aik@ozlabs.ru, linux-kernel@vger.kernel.org,
 paulus@samba.org, kan.liang@linux.intel.com, mikey@neuling.org,
 maddy@linux.ibm.com, haren@linux.ibm.com, peterz@infradead.org,
 kjain@linux.ibm.com, pmladek@suse.com, john.ogness@linutronix.de,
 alistair@popple.id.au, jniethe5@gmail.com, atrajeev@linux.vnet.ibm.com,
 Xiongwei Song <sxwjean@gmail.com>, oleg@redhat.com, aneesh.kumar@linux.ibm.com,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On Apr 10, 2021, at 8:35 AM, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>=20
> Thanks for working on this, I think it's a nice cleanup and helps
> non-powerpc people understand the code a bit better.
>=20

My pleasure.

> Excerpts from Xiongwei Song's message of April 10, 2021 12:28 am:
>> From: Xiongwei Song <sxwjean@gmail.com>
>>=20
>> Create a new header named traps.h, define macros to list ppc =
interrupt
>> types in traps.h, replace the references of the trap hex values with =
these
>> macros.
>>=20
>> Referred the hex numbers in arch/powerpc/kernel/exceptions-64e.S,
>> arch/powerpc/kernel/exceptions-64s.S and
>> arch/powerpc/include/asm/kvm_asm.h.
>>=20
>> Reported-by: kernel test robot <lkp@intel.com>
>=20
> It now looks like lkp asked for this whole cleanup patch. I would
> put [kernel test robot <lkp@intel.com>] in your v3->4 changelog
> item.
>=20

Agree. I just forgot to delete this line in the patch.

>> Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
>> ---
>>=20
>> v3-v4:
>> Fix compile issue:
>> arch/powerpc/kernel/process.c:1473:14: error: =
'INTERRUPT_MACHINE_CHECK' undeclared (first use in this function); did =
you mean 'TAINT_MACHINE_CHECK'?
>> I didn't add "Reported-by: kernel test robot <lkp@intel.com>" here,
>> because it's improper for this patch.
>=20
> [...]
>=20
>> diff --git a/arch/powerpc/include/asm/traps.h =
b/arch/powerpc/include/asm/traps.h
>> new file mode 100644
>> index 000000000000..2e64e10afcef
>> --- /dev/null
>> +++ b/arch/powerpc/include/asm/traps.h
>> @@ -0,0 +1,32 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef _ASM_PPC_TRAPS_H
>> +#define _ASM_PPC_TRAPS_H
>=20
> These could go in interrupt.h.
>=20
>> +#if defined(CONFIG_BOOKE) || defined(CONFIG_4xx)
>> +#define INTERRUPT_MACHINE_CHECK   0x000
>> +#define INTERRUPT_CRITICAL_INPUT  0x100
>> +#define INTERRUPT_ALTIVEC_UNAVAIL 0x200
>> +#define INTERRUPT_PERFMON         0x260
>> +#define INTERRUPT_DOORBELL        0x280
>> +#define INTERRUPT_DEBUG           0xd00
>> +#else
>> +#define INTERRUPT_SYSTEM_RESET    0x100
>> +#define INTERRUPT_MACHINE_CHECK   0x200
>=20
> [...]
>=20
>> @@ -1469,7 +1470,9 @@ static void __show_regs(struct pt_regs *regs)
>> 	trap =3D TRAP(regs);
>> 	if (!trap_is_syscall(regs) && cpu_has_feature(CPU_FTR_CFAR))
>> 		pr_cont("CFAR: "REG" ", regs->orig_gpr3);
>> -	if (trap =3D=3D 0x200 || trap =3D=3D 0x300 || trap =3D=3D 0x600) =
{
>> +	if (trap =3D=3D INTERRUPT_MACHINE_CHECK ||
>> +	    trap =3D=3D INTERRUPT_DATA_STORAGE ||
>> +	    trap =3D=3D INTERRUPT_ALIGNMENT) {
>> 		if (IS_ENABLED(CONFIG_4xx) || IS_ENABLED(CONFIG_BOOKE))
>> 			pr_cont("DEAR: "REG" ESR: "REG" ", regs->dar, =
regs->dsisr);
>> 		else
>=20
> This is now a change in behaviour because previously BOOKE/4xx tested
> 0x200, but now it tests 0.

Yes. Previously BOOKE/4xx tested 0x200, but checked this line history, =
please see
the commit below:

commit c54006491dde7d1b8050c5542716b751be92ed80
Author: Anton Blanchard <anton@samba.org>
Date:   Fri Nov 15 15:41:19 2013 +1100

    powerpc: Print DAR and DSISR on machine check oopses
   =20
    Machine check exceptions set DAR and DSISR, so print them in our
    oops output.
   =20
    Signed-off-by: Anton Blanchard <anton@samba.org>
    Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

diff --git a/arch/powerpc/kernel/process.c =
b/arch/powerpc/kernel/process.c
index 75c2d1009985..37c4103a8cff 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -864,7 +864,7 @@ void show_regs(struct pt_regs * regs)
        trap =3D TRAP(regs);
        if ((regs->trap !=3D 0xc00) && cpu_has_feature(CPU_FTR_CFAR))
                printk("CFAR: "REG"\n", regs->orig_gpr3);
-       if (trap =3D=3D 0x300 || trap =3D=3D 0x600)
+       if (trap =3D=3D 0x200 || trap =3D=3D 0x300 || trap =3D=3D 0x600)
 #if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
                printk("DEAR: "REG", ESR: "REG"\n", regs->dar, =
regs->dsisr);
 #else

0x200 aims to test Machine check, but for 64e, the regs->trap should be =
0x000 here,
under the commit comments, I changed the code behavior. Sorry I didn=E2=80=
=99t add=20
comments.=20

>=20
> That looks wrong for 4xx. 64e does put 0x000 there but I wonder if it=20=

> should use 0x200 instead.

Ok. Thanks for pointing this out, let me learn about 4xx.=20

> Bit difficult to test this stuff, I do have
> some MCE injection patches for QEMU for 64s, might be able to look at
> porting them to 64e although I have no idea about booke machine =
checks.
>=20

Yes, would appreciate your sharing.

> Anyway I don't think this patch should change generated code at all.
> Either change the code first with smaller patches, or make sure you
> keep the tests the same.

Agree.

Regards,
Xiongwei

>=20
> Thanks,
> Nick

