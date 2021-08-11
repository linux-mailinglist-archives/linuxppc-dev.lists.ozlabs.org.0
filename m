Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 532163E973A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 20:03:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlHkc19tWz3cGx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 04:03:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R9GCgjQw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=R9GCgjQw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlHjq153rz2yL7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 04:03:10 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BHcZtH007754; Wed, 11 Aug 2021 14:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-transfer-encoding : content-type : date : message-id : cc :
 subject : from : to : references : in-reply-to; s=pp1;
 bh=u1oB5YaQvMYIBmFEZ9xf2K9tqJjtge1oSR06PRIkdWM=;
 b=R9GCgjQwb4/XWkx6j1I6t+omnq3WzzeHgx28ZEi3ZdWK3Wxx1Ky+3QIRAkqJ2nnZqbhW
 g7TMxHB49YFv+hwMJUm1Wf/L1XGolhEndQ/V81SADrNlWhOBDdWT6x/WOXIXiVP++fRY
 g+hx4ovqAoQJsfKwlIKh2xXTXB0BvBsatfBbZo0Np6dkBP+jSxuwhDgy8apQg473QNPZ
 iWnfwO+O6Atw2xfETjDCEt62XxMzhYOe6rA6sV4NCK0mXAX/0bBAd2Hgn84Ktj8FxJUE
 x5HFxZbKIK22Z+vPJHIgSwpiPrG0sr/CUX4f8ff4mZ4vUQ6Zy687CTqnpvOtSTp/s/0/ aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3abg7mt49y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 14:02:56 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17BHk9ek024977;
 Wed, 11 Aug 2021 14:02:55 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3abg7mt49n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 14:02:55 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BHuwTo025851;
 Wed, 11 Aug 2021 18:02:54 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02dal.us.ibm.com with ESMTP id 3a9htf58ep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 18:02:54 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BI2rVP16056702
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 18:02:53 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E9E0124060;
 Wed, 11 Aug 2021 18:02:53 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B35C124055;
 Wed, 11 Aug 2021 18:02:52 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.211.57.193])
 by b01ledav002.gho.pok.ibm.com (Postfix) with SMTP;
 Wed, 11 Aug 2021 18:02:52 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id EE986BC0CFB;
 Wed, 11 Aug 2021 13:02:49 -0500 (CDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Aug 2021 13:02:49 -0500
Message-Id: <CDGVQ5XZULK3.3JSJ73JDZZW5E@oc8246131445.ibm.com>
Subject: Re: [PATCH v5 5/8] powerpc/64s: Introduce temporary mm for Radix MMU
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20210713053113.4632-1-cmr@linux.ibm.com>
 <20210713053113.4632-6-cmr@linux.ibm.com>
 <c8b2291e-57f9-6d9a-583e-4ec65b2c9bcb@csgroup.eu>
In-Reply-To: <c8b2291e-57f9-6d9a-583e-4ec65b2c9bcb@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Z4p0dsHb8gzaGUdthpcjjk54l0TZN0Sz
X-Proofpoint-ORIG-GUID: OzS881EW8PcZOTtOwwXXuyGoeDZK5C3l
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_06:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108110120
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
Cc: keescook@chromium.org, peterz@infradead.org, x86@kernel.org,
 npiggin@gmail.com, linux-hardening@vger.kernel.org, tglx@linutronix.de,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Aug 5, 2021 at 4:27 AM CDT, Christophe Leroy wrote:
>
>
> Le 13/07/2021 =C3=A0 07:31, Christopher M. Riedl a =C3=A9crit :
> > x86 supports the notion of a temporary mm which restricts access to
> > temporary PTEs to a single CPU. A temporary mm is useful for situations
> > where a CPU needs to perform sensitive operations (such as patching a
> > STRICT_KERNEL_RWX kernel) requiring temporary mappings without exposing
> > said mappings to other CPUs. Another benefit is that other CPU TLBs do
> > not need to be flushed when the temporary mm is torn down.
> >=20
> > Mappings in the temporary mm can be set in the userspace portion of the
> > address-space.
> >=20
> > Interrupts must be disabled while the temporary mm is in use. HW
> > breakpoints, which may have been set by userspace as watchpoints on
> > addresses now within the temporary mm, are saved and disabled when
> > loading the temporary mm. The HW breakpoints are restored when unloadin=
g
> > the temporary mm. All HW breakpoints are indiscriminately disabled whil=
e
> > the temporary mm is in use.
>
> Can you explain more about that breakpoint stuff ? Why is it a special
> case here at all ? Isn't it
> the same when you switch from one user task to another one ? x86 commit
> doesn't say anythink about
> breakpoints.
>

We do not check if the breakpoint is on a kernel address (perf can do
this IIUC) and just disable all of them. I had to dig, but x86 has a
comment with their implementation at arch/x86/kernel/alternative.c:743.

I can reword that part of the commit message if it's unclear.

> >=20
> > Based on x86 implementation:
> >=20
> > commit cefa929c034e
> > ("x86/mm: Introduce temporary mm structs")
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
> >=20
> > ---
> >=20
> > v5:  * Drop support for using a temporary mm on Book3s64 Hash MMU.
> >=20
> > v4:  * Pass the prev mm instead of NULL to switch_mm_irqs_off() when
> >         using/unusing the temp mm as suggested by Jann Horn to keep
> >         the context.active counter in-sync on mm/nohash.
> >       * Disable SLB preload in the temporary mm when initializing the
> >         temp_mm struct.
> >       * Include asm/debug.h header to fix build issue with
> >         ppc44x_defconfig.
> > ---
> >   arch/powerpc/include/asm/debug.h |  1 +
> >   arch/powerpc/kernel/process.c    |  5 +++
> >   arch/powerpc/lib/code-patching.c | 56 +++++++++++++++++++++++++++++++=
+
> >   3 files changed, 62 insertions(+)
> >=20
> > diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/as=
m/debug.h
> > index 86a14736c76c3..dfd82635ea8b3 100644
> > --- a/arch/powerpc/include/asm/debug.h
> > +++ b/arch/powerpc/include/asm/debug.h
> > @@ -46,6 +46,7 @@ static inline int debugger_fault_handler(struct pt_re=
gs *regs) { return 0; }
> >   #endif
> >  =20
> >   void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk);
> > +void __get_breakpoint(int nr, struct arch_hw_breakpoint *brk);
> >   bool ppc_breakpoint_available(void);
> >   #ifdef CONFIG_PPC_ADV_DEBUG_REGS
> >   extern void do_send_trap(struct pt_regs *regs, unsigned long address,
> > diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/proces=
s.c
> > index 185beb2905801..a0776200772e8 100644
> > --- a/arch/powerpc/kernel/process.c
> > +++ b/arch/powerpc/kernel/process.c
> > @@ -865,6 +865,11 @@ static inline int set_breakpoint_8xx(struct arch_h=
w_breakpoint *brk)
> >   	return 0;
> >   }
> >  =20
> > +void __get_breakpoint(int nr, struct arch_hw_breakpoint *brk)
> > +{
> > +	memcpy(brk, this_cpu_ptr(&current_brk[nr]), sizeof(*brk));
> > +}
> > +
> >   void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
> >   {
> >   	memcpy(this_cpu_ptr(&current_brk[nr]), brk, sizeof(*brk));
> > diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-p=
atching.c
> > index 54b6157d44e95..3122d8e4cc013 100644
> > --- a/arch/powerpc/lib/code-patching.c
> > +++ b/arch/powerpc/lib/code-patching.c
> > @@ -17,6 +17,9 @@
> >   #include <asm/code-patching.h>
> >   #include <asm/setup.h>
> >   #include <asm/inst.h>
> > +#include <asm/mmu_context.h>
> > +#include <asm/debug.h>
> > +#include <asm/tlb.h>
> >  =20
> >   static int __patch_instruction(u32 *exec_addr, struct ppc_inst instr,=
 u32 *patch_addr)
> >   {
> > @@ -45,6 +48,59 @@ int raw_patch_instruction(u32 *addr, struct ppc_inst=
 instr)
> >   }
> >  =20
> >   #ifdef CONFIG_STRICT_KERNEL_RWX
> > +
> > +struct temp_mm {
> > +	struct mm_struct *temp;
> > +	struct mm_struct *prev;
> > +	struct arch_hw_breakpoint brk[HBP_NUM_MAX];
> > +};
> > +
> > +static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_str=
uct *mm)
> > +{
> > +	/* We currently only support temporary mm on the Book3s64 Radix MMU *=
/
> > +	WARN_ON(!radix_enabled());
> > +
> > +	temp_mm->temp =3D mm;
> > +	temp_mm->prev =3D NULL;
> > +	memset(&temp_mm->brk, 0, sizeof(temp_mm->brk));
> > +}
> > +
> > +static inline void use_temporary_mm(struct temp_mm *temp_mm)
> > +{
> > +	lockdep_assert_irqs_disabled();
> > +
> > +	temp_mm->prev =3D current->active_mm;
> > +	switch_mm_irqs_off(temp_mm->prev, temp_mm->temp, current);
> > +
> > +	WARN_ON(!mm_is_thread_local(temp_mm->temp));
> > +
> > +	if (ppc_breakpoint_available()) {
> > +		struct arch_hw_breakpoint null_brk =3D {0};
> > +		int i =3D 0;
> > +
> > +		for (; i < nr_wp_slots(); ++i) {
> > +			__get_breakpoint(i, &temp_mm->brk[i]);
> > +			if (temp_mm->brk[i].type !=3D 0)
> > +				__set_breakpoint(i, &null_brk);
> > +		}
> > +	}
> > +}
> > +
> > +static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
>
> not sure about the naming.
>
> Maybe start_using_temp_mm() and stop_using_temp_mm() would be more
> explicit.
>

Hehe I think we've discussed this before - naming things is hard :) I'll
take your suggestions for the next spin.

>
> > +{
> > +	lockdep_assert_irqs_disabled();
> > +
> > +	switch_mm_irqs_off(temp_mm->temp, temp_mm->prev, current);
> > +
> > +	if (ppc_breakpoint_available()) {
> > +		int i =3D 0;
> > +
> > +		for (; i < nr_wp_slots(); ++i)
> > +			if (temp_mm->brk[i].type !=3D 0)
> > +				__set_breakpoint(i, &temp_mm->brk[i]);
> > +	}
> > +}
> > +
> >   static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
> >  =20
> >   #if IS_BUILTIN(CONFIG_LKDTM)
> >=20
>
> You'll probably get a bisecting hasard with those unused 'static inline'
> functions in a .c file
> because that patch alone probably fails build.

I just built the patch without any issue. The compiler only complains
for unused 'static' (non-inline) functions right?
