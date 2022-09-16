Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0CB5BB42B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 23:57:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTnxW4lZhz3c8x
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Sep 2022 07:57:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kq0IBnsU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kq0IBnsU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTnwk0Dmtz3bmW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Sep 2022 07:57:09 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28GLg50i007087
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 21:57:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=/tZOvFilqFQSX1ngRrjqGqKKGqEMGAUKuCL7OIzAmj4=;
 b=kq0IBnsUU14JWw7/GUkfZN/CURViNLXYJUmU9LblYXIyq5tUZpN96hsOdYXLoZHGVzm9
 QqI4sJP+rbXBrMCnCRL8oSCZyRBBXbK5mqQVuP8nai33g+wwqyS6Ij9TpA6L023UlqFe
 hpBrV7cY5sIH/YcANT3vXvJPzLSAq5L3+FWoZD7aVIVE16mFMvrh2NTiHbaT07RSaFzp
 zVVb69XIB2/Jm4DO1QKT/4EgSBwX+d95TfZ7HnqLoLocQ/tCnvC9l2yS+abgtkmFGmTV
 /4PIJCZ5/z5WWjWvK3PkCnj4W0Q6XM1g+qXr3CHRfYKx8wwMwuuM9dw0ExdIYMrI2zUu fA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jn19frb3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 21:57:06 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28GLv6MX000314
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 21:57:06 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jn19frb2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 21:57:06 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28GLoipq020163;
	Fri, 16 Sep 2022 21:56:19 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma05wdc.us.ibm.com with ESMTP id 3jm9167b8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 21:56:19 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28GLuIaZ62718224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 21:56:18 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B60E136053;
	Fri, 16 Sep 2022 21:56:18 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB9BA13604F;
	Fri, 16 Sep 2022 21:56:17 +0000 (GMT)
Received: from localhost (unknown [9.65.126.57])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 21:56:17 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>,
        Leonardo =?utf-8?Q?Br=C3=A1s?=
 <leobras.c@gmail.com>
Subject: Re: [PATCH] Revert "powerpc/rtas: Implement reentrant rtas call"
In-Reply-To: <CMXFROL4N1OT.4DV7ZOHOP954@bobo>
References: <20220907220111.223267-1-nathanl@linux.ibm.com>
 <1d76891ee052112ee1547a4027e358d5cbcac23d.camel@gmail.com>
 <871qskve2f.fsf@linux.ibm.com>
 <cf845311ca7fcc0fded8db153499d9394f2add4e.camel@gmail.com>
 <87y1uotlfa.fsf@linux.ibm.com>
 <14e227181543ab45550ddf8e8fa1c53838361d61.camel@gmail.com>
 <CMXFROL4N1OT.4DV7ZOHOP954@bobo>
Date: Fri, 16 Sep 2022 16:56:18 -0500
Message-ID: <87h717t24d.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 61ZNzmTrEMBNyoN39We8rVg2w1ZOY8Aq
X-Proofpoint-GUID: dU9RyEOiGpB47xgstodWpCEOztJxlB_O
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_14,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209160153
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Nicholas Piggin" <npiggin@gmail.com> writes:
> On Wed Sep 14, 2022 at 3:39 AM AEST, Leonardo Br=C3=A1s wrote:
>> On Mon, 2022-09-12 at 14:58 -0500, Nathan Lynch wrote:
>> > Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
>> > > On Fri, 2022-09-09 at 09:04 -0500, Nathan Lynch wrote:
>> > > > Leonardo Br=C3=A1s <leobras.c@gmail.com> writes:
>> > > > > On Wed, 2022-09-07 at 17:01 -0500, Nathan Lynch wrote:
>> > > > > > At the time this was submitted by Leonardo, I confirmed -- or =
thought
>> > > > > > I had confirmed -- with PowerVM partition firmware development=
 that
>> > > > > > the following RTAS functions:
>> > > > > >=20
>> > > > > > - ibm,get-xive
>> > > > > > - ibm,int-off
>> > > > > > - ibm,int-on
>> > > > > > - ibm,set-xive
>> > > > > >=20
>> > > > > > were safe to call on multiple CPUs simultaneously, not only wi=
th
>> > > > > > respect to themselves as indicated by PAPR, but with arbitrary=
 other
>> > > > > > RTAS calls:
>> > > > > >=20
>> > > > > > https://lore.kernel.org/linuxppc-dev/875zcy2v8o.fsf@linux.ibm.=
com/
>> > > > > >=20
>> > > > > > Recent discussion with firmware development makes it clear tha=
t this
>> > > > > > is not true, and that the code in commit b664db8e3f97 ("powerp=
c/rtas:
>> > > > > > Implement reentrant rtas call") is unsafe, likely explaining s=
everal
>> > > > > > strange bugs we've seen in internal testing involving DLPAR and
>> > > > > > LPM. These scenarios use ibm,configure-connector, whose intern=
al state
>> > > > > > can be corrupted by the concurrent use of the "reentrant" func=
tions,
>> > > > > > leading to symptoms like endless busy statuses from RTAS.
>> > > > >=20
>> > > > > Oh, does not it means PowerVM is not compliant to the PAPR specs?
>> > > >=20
>> > > > No, it means the premise of commit b664db8e3f97 ("powerpc/rtas:
>> > > > Implement reentrant rtas call") change is incorrect. The "reentran=
t"
>> > > > property described in the spec applies only to the individual RTAS
>> > > > functions. The OS can invoke (for example) ibm,set-xive on multipl=
e CPUs
>> > > > simultaneously, but it must adhere to the more general requirement=
 to
>> > > > serialize with other RTAS functions.
>> > > >=20
>> > >=20
>> > > I see. Thanks for explaining that part!
>> > > I agree: reentrant calls that way don't look as useful on Linux than=
 I
>> > > previously thought.
>> > >=20
>> > > OTOH, I think that instead of reverting the change, we could make us=
e of the
>> > > correct information and fix the current implementation. (This could =
help when we
>> > > do the same rtas call in multiple cpus)
>> >=20
>> > Hmm I'm happy to be mistaken here, but I doubt we ever really need to =
do
>> > that. I'm not seeing the need.
>> >=20
>> > > I have an idea of a patch to fix this.=20
>> > > Do you think it would be ok if I sent that, to prospect being an alt=
ernative to
>> > > this reversion?
>> >=20
>> > It is my preference, and I believe it is more common, to revert to the
>> > well-understood prior state, imperfect as it may be. The revert can be
>> > backported to -stable and distros while development and review of
>> > another approach proceeds.
>>
>> Ok then, as long as you are aware of the kdump bug, I'm good.
>>
>> FWIW:
>> Reviewed-by: Leonardo Bras <leobras.c@gmail.com>
>
> A shame. I guess a reader/writer lock would not be much help because
> the crash is probably more likely to hit longer running rtas calls?
>
> Alternative is just cheat and do this...?
>
> Thanks,
> Nick
>
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 693133972294..89728714a06e 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -26,6 +26,7 @@
>  #include <linux/syscalls.h>
>  #include <linux/of.h>
>  #include <linux/of_fdt.h>
> +#include <linux/panic.h>
>=20=20
>  #include <asm/interrupt.h>
>  #include <asm/rtas.h>
> @@ -97,6 +98,19 @@ static unsigned long lock_rtas(void)
>  {
>         unsigned long flags;
>=20=20
> +       if (atomic_read(&panic_cpu) =3D=3D raw_smp_processor_id()) {
> +               /*
> +                * Crash in progress on this CPU. Other CPUs should be
> +                * stopped by now, so skip the lock in case it was being
> +                * held, and is now needed for crashing e.g., kexec
> +                * (machine_kexec_mask_interrupts) requires rtas calls.
> +                *
> +                * It's possible this could have caused rtas state
> breakage
> +                * but the alternative is deadlock.
> +                */
> +               return 0;
> +       }
> +
>         local_irq_save(flags);
>         preempt_disable();
>         arch_spin_lock(&rtas.lock);
> @@ -105,6 +119,9 @@ static unsigned long lock_rtas(void)
>=20=20
>  static void unlock_rtas(unsigned long flags)
>  {
> +       if (atomic_read(&panic_cpu) =3D=3D raw_smp_processor_id())
> +               return;
> +
>         arch_spin_unlock(&rtas.lock);
>         local_irq_restore(flags);
>         preempt_enable();

Looks correct.

I wonder - would it be worth making the panic path use a separate
"emergency" rtas_args buffer as well? If a CPU is actually "stuck" in
RTAS at panic time, then leaving rtas.args untouched might make the
ibm,int-off, ibm,set-xive, ibm,os-term, and any other RTAS calls we
incur on the panic path more likely to succeed.

Building on yours, something like (sorry, it's ugly):

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 693133972294..4865d26e7391 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -73,6 +73,8 @@ struct rtas_t rtas =3D {
 };
 EXPORT_SYMBOL(rtas);
=20
+static struct rtas_args emergency_rtas_args;
+
 DEFINE_SPINLOCK(rtas_data_buf_lock);
 EXPORT_SYMBOL(rtas_data_buf_lock);
=20
@@ -93,20 +95,24 @@ EXPORT_SYMBOL(rtas_flash_term_hook);
  * such as having the timebase stopped which would lockup with
  * normal locks and spinlock debugging enabled
  */
-static unsigned long lock_rtas(void)
+static struct rtas_args *lock_rtas(unsigned long *flags)
 {
-	unsigned long flags;
+	if (atomic_read(&panic_cpu) =3D=3D raw_smp_processor_id())
+		return &emergency_rtas_args;
=20
-	local_irq_save(flags);
+	local_irq_save(*flags);
 	preempt_disable();
 	arch_spin_lock(&rtas.lock);
-	return flags;
+	return &rtas.args;
 }
=20
-static void unlock_rtas(unsigned long flags)
+static void unlock_rtas(struct rtas_args *args, unsigned long *flags)
 {
+	if (atomic_read(&panic_cpu) =3D=3D raw_smp_processor_id())
+		return;
+
 	arch_spin_unlock(&rtas.lock);
-	local_irq_restore(flags);
+	local_irq_restore(*flags);
 	preempt_enable();
 }
=20
@@ -117,14 +123,15 @@ static void unlock_rtas(unsigned long flags)
  */
 static void call_rtas_display_status(unsigned char c)
 {
-	unsigned long s;
+	struct rtas_args *args;
+	unsigned long flags;
=20
 	if (!rtas.base)
 		return;
=20
-	s =3D lock_rtas();
-	rtas_call_unlocked(&rtas.args, 10, 1, 1, NULL, c);
-	unlock_rtas(s);
+	args =3D lock_rtas(&flags);
+	rtas_call_unlocked(args, 10, 1, 1, NULL, c);
+	unlock_rtas(args, &flags);
 }
=20
 static void call_rtas_display_status_delay(char c)
@@ -468,7 +475,7 @@ int rtas_call(int token, int nargs, int nret, int *outp=
uts, ...)
 {
 	va_list list;
 	int i;
-	unsigned long s;
+	unsigned long flags;
 	struct rtas_args *rtas_args;
 	char *buff_copy =3D NULL;
 	int ret;
@@ -481,10 +488,7 @@ int rtas_call(int token, int nargs, int nret, int *out=
puts, ...)
 		return -1;
 	}
=20
-	s =3D lock_rtas();
-
-	/* We use the global rtas args buffer */
-	rtas_args =3D &rtas.args;
+	rtas_args =3D lock_rtas(&flags);
=20
 	va_start(list, outputs);
 	va_rtas_call_unlocked(rtas_args, token, nargs, nret, list);
@@ -500,7 +504,7 @@ int rtas_call(int token, int nargs, int nret, int *outp=
uts, ...)
 			outputs[i] =3D be32_to_cpu(rtas_args->rets[i+1]);
 	ret =3D (nret > 0)? be32_to_cpu(rtas_args->rets[0]): 0;
=20
-	unlock_rtas(s);
+	unlock_rtas(rtas_args, &flags);
=20
 	if (buff_copy) {
 		log_error(buff_copy, ERR_TYPE_RTAS_LOG, 0);
@@ -1190,6 +1194,7 @@ static void __init rtas_syscall_filter_init(void)
 /* We assume to be passed big endian arguments */
 SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 {
+	struct rtas_args *argsp;
 	struct rtas_args args;
 	unsigned long flags;
 	char *buff_copy, *errbuf =3D NULL;
@@ -1249,18 +1254,18 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, ua=
rgs)
=20
 	buff_copy =3D get_errorlog_buffer();
=20
-	flags =3D lock_rtas();
+	argsp =3D lock_rtas(&flags);
=20
-	rtas.args =3D args;
-	do_enter_rtas(__pa(&rtas.args));
-	args =3D rtas.args;
+	*argsp =3D args;
+	do_enter_rtas(__pa(argsp));
+	args =3D *argsp;
=20
 	/* A -1 return code indicates that the last command couldn't
 	   be completed due to a hardware error. */
 	if (be32_to_cpu(args.rets[0]) =3D=3D -1)
 		errbuf =3D __fetch_rtas_last_error(buff_copy);
=20
-	unlock_rtas(flags);
+	unlock_rtas(argsp, &flags);
=20
 	if (buff_copy) {
 		if (errbuf)
