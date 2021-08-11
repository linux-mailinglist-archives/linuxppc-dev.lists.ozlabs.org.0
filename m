Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EA53E972D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 19:58:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlHbv3hxRz30JK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 03:58:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jr1ubnqS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jr1ubnqS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlHb63rDDz2xbB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 03:57:21 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BHhpVk018906; Wed, 11 Aug 2021 13:57:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : date :
 message-id : cc : subject : from : to : references : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=GzCtx/IoTn01CXoLUsuaiskgelegAacd29R/grOEcs8=;
 b=jr1ubnqSw7zf8UgIwjol4w2YQwKg0QGI6Gqxh1R4o8bch7sex8RLQaUY4FzL6hTzak7n
 JQocvlPz6e32WNVbFZAnBnv61n5C8CIjsfpLLWRiOztOTbQSiYFflw7b7psKeb90Zxsk
 GgwP9+u7NkiRQHd+BQ9QxgM2L04gcBmaoi2VGt/i9SGO4EEVHlNVV8sB6IGeo+yMa7gY
 c5YlZWKTiTkvMUaMiRnivxBLZG+I49nwKNS66gR1DCqNLFYSDPoMR5oaZu66c7VjfyqP
 4to2ugQO+loDKu5RUt8kxy+WPAxNCkYBY3YIsNNDM8cLI1DjnQ7V+dgZLYHzbXBeVNMG pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3abg7msx6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 13:57:05 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17BHk3fH024339;
 Wed, 11 Aug 2021 13:57:04 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3abg7msx5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 13:57:04 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BHrKNh024309;
 Wed, 11 Aug 2021 17:57:03 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 3a9htdaujr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 17:57:03 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BHv2uH37683572
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 17:57:03 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D393EBE061;
 Wed, 11 Aug 2021 17:57:02 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DA64BE071;
 Wed, 11 Aug 2021 17:57:02 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.211.57.193])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with SMTP;
 Wed, 11 Aug 2021 17:57:02 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 27B48BC0CFB;
 Wed, 11 Aug 2021 12:57:00 -0500 (CDT)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Aug 2021 12:57:00 -0500
Message-Id: <CDGVLP8OS8N9.13R0RIGJ1WJ8R@oc8246131445.ibm.com>
Subject: Re: [PATCH v5 2/8] lkdtm/powerpc: Add test to hijack a patch mapping
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
References: <20210713053113.4632-1-cmr@linux.ibm.com>
 <20210713053113.4632-3-cmr@linux.ibm.com>
 <f933e9de-ff3b-aa5a-bb6e-55770d5ab868@csgroup.eu>
In-Reply-To: <f933e9de-ff3b-aa5a-bb6e-55770d5ab868@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HMAbSaSvCzQknzP8ld9PDc-2gPJ1QnZa
X-Proofpoint-ORIG-GUID: 6LWS-Qg83Tl1NZciAzn-kIjf41bnnb9j
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
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

On Thu Aug 5, 2021 at 4:13 AM CDT, Christophe Leroy wrote:
>
>
> Le 13/07/2021 =C3=A0 07:31, Christopher M. Riedl a =C3=A9crit :
> > When live patching with STRICT_KERNEL_RWX the CPU doing the patching
> > must temporarily remap the page(s) containing the patch site with +W
> > permissions. While this temporary mapping is in use, another CPU could
> > write to the same mapping and maliciously alter kernel text. Implement a
> > LKDTM test to attempt to exploit such an opening during code patching.
> > The test is implemented on powerpc and requires LKDTM built into the
> > kernel (building LKDTM as a module is insufficient).
> >=20
> > The LKDTM "hijack" test works as follows:
> >=20
> >    1. A CPU executes an infinite loop to patch an instruction. This is
> >       the "patching" CPU.
> >    2. Another CPU attempts to write to the address of the temporary
> >       mapping used by the "patching" CPU. This other CPU is the
> >       "hijacker" CPU. The hijack either fails with a fault/error or
> >       succeeds, in which case some kernel text is now overwritten.
> >=20
> > The virtual address of the temporary patch mapping is provided via an
> > LKDTM-specific accessor to the hijacker CPU. This test assumes a
> > hypothetical situation where this address was leaked previously.
> >=20
> > How to run the test:
> >=20
> > 	mount -t debugfs none /sys/kernel/debug
> > 	(echo HIJACK_PATCH > /sys/kernel/debug/provoke-crash/DIRECT)
> >=20
> > A passing test indicates that it is not possible to overwrite kernel
> > text from another CPU by using the temporary mapping established by
> > a CPU for patching.
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@linux.ibm.com>
> >=20
> > ---
> >=20
> > v5:  * Use `u32*` instead of `struct ppc_inst*` based on new series in
> >         upstream.
> >=20
> > v4:  * Separate the powerpc and x86_64 bits into individual patches.
> >       * Use __put_kernel_nofault() when attempting to hijack the mapping
> >       * Use raw_smp_processor_id() to avoid triggering the BUG() when
> >         calling smp_processor_id() in preemptible code - the only thing
> >         that matters is that one of the threads is bound to a different
> >         CPU - we are not using smp_processor_id() to access any per-cpu
> >         data or similar where preemption should be disabled.
> >       * Rework the patching_cpu() kthread stop condition to avoid:
> >         https://lwn.net/Articles/628628/
> > ---
> >   drivers/misc/lkdtm/core.c  |   1 +
> >   drivers/misc/lkdtm/lkdtm.h |   1 +
> >   drivers/misc/lkdtm/perms.c | 134 +++++++++++++++++++++++++++++++++++++
> >   3 files changed, 136 insertions(+)
> >=20
> > diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
> > index 8024b6a5cc7fc..fbcb95eda337b 100644
> > --- a/drivers/misc/lkdtm/core.c
> > +++ b/drivers/misc/lkdtm/core.c
> > @@ -147,6 +147,7 @@ static const struct crashtype crashtypes[] =3D {
> >   	CRASHTYPE(WRITE_RO),
> >   	CRASHTYPE(WRITE_RO_AFTER_INIT),
> >   	CRASHTYPE(WRITE_KERN),
> > +	CRASHTYPE(HIJACK_PATCH),
> >   	CRASHTYPE(REFCOUNT_INC_OVERFLOW),
> >   	CRASHTYPE(REFCOUNT_ADD_OVERFLOW),
> >   	CRASHTYPE(REFCOUNT_INC_NOT_ZERO_OVERFLOW),
> > diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
> > index 99f90d3e5e9cb..87e7e6136d962 100644
> > --- a/drivers/misc/lkdtm/lkdtm.h
> > +++ b/drivers/misc/lkdtm/lkdtm.h
> > @@ -62,6 +62,7 @@ void lkdtm_EXEC_USERSPACE(void);
> >   void lkdtm_EXEC_NULL(void);
> >   void lkdtm_ACCESS_USERSPACE(void);
> >   void lkdtm_ACCESS_NULL(void);
> > +void lkdtm_HIJACK_PATCH(void);
> >=20=20=20
> >   /* refcount.c */
> >   void lkdtm_REFCOUNT_INC_OVERFLOW(void);
> > diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> > index 2dede2ef658f3..39e7456852229 100644
> > --- a/drivers/misc/lkdtm/perms.c
> > +++ b/drivers/misc/lkdtm/perms.c
> > @@ -9,6 +9,7 @@
> >   #include <linux/vmalloc.h>
> >   #include <linux/mman.h>
> >   #include <linux/uaccess.h>
> > +#include <linux/kthread.h>
> >   #include <asm/cacheflush.h>
> >=20=20=20
> >   /* Whether or not to fill the target memory area with do_nothing(). */
> > @@ -222,6 +223,139 @@ void lkdtm_ACCESS_NULL(void)
> >   	pr_err("FAIL: survived bad write\n");
> >   }
> >=20=20=20
> > +#if (IS_BUILTIN(CONFIG_LKDTM) && defined(CONFIG_STRICT_KERNEL_RWX) && \
> > +	defined(CONFIG_PPC))
>
>
> I think this test shouldn't be limited to CONFIG_PPC and shouldn't be
> limited to
> CONFIG_STRICT_KERNEL_RWX. It should be there all the time.
>
> Also why limiting it to IS_BUILTIN(CONFIG_LKDTM) ?
>

The test needs read_cpu_patching_addr() which definitely cannot be
exposed outside of the kernel (ie. builtin).

> > +/*
> > + * This is just a dummy location to patch-over.
> > + */
> > +static void patching_target(void)
> > +{
> > +	return;
> > +}
> > +
> > +#include <asm/code-patching.h>
> > +const u32 *patch_site =3D (const u32 *)&patching_target;
> > +
> > +static inline int lkdtm_do_patch(u32 data)
> > +{
> > +	return patch_instruction((u32 *)patch_site, ppc_inst(data));
> > +}
> > +
> > +static inline u32 lkdtm_read_patch_site(void)
> > +{
> > +	return READ_ONCE(*patch_site);
> > +}
> > +
> > +/* Returns True if the write succeeds */
> > +static inline bool lkdtm_try_write(u32 data, u32 *addr)
> > +{
> > +	__put_kernel_nofault(addr, &data, u32, err);
> > +	return true;
> > +
> > +err:
> > +	return false;
> > +}
> > +
> > +static int lkdtm_patching_cpu(void *data)
> > +{
> > +	int err =3D 0;
> > +	u32 val =3D 0xdeadbeef;
> > +
> > +	pr_info("starting patching_cpu=3D%d\n", raw_smp_processor_id());
> > +
> > +	do {
> > +		err =3D lkdtm_do_patch(val);
> > +	} while (lkdtm_read_patch_site() =3D=3D val && !err && !kthread_shoul=
d_stop());
> > +
> > +	if (err)
> > +		pr_warn("XFAIL: patch_instruction returned error: %d\n", err);
> > +
> > +	while (!kthread_should_stop()) {
> > +		set_current_state(TASK_INTERRUPTIBLE);
> > +		schedule();
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +void lkdtm_HIJACK_PATCH(void)
> > +{
> > +	struct task_struct *patching_kthrd;
> > +	int patching_cpu, hijacker_cpu, attempts;
> > +	unsigned long addr;
> > +	bool hijacked;
> > +	const u32 bad_data =3D 0xbad00bad;
> > +	const u32 original_insn =3D lkdtm_read_patch_site();
> > +
> > +	if (!IS_ENABLED(CONFIG_SMP)) {
> > +		pr_err("XFAIL: this test requires CONFIG_SMP\n");
> > +		return;
> > +	}
> > +
> > +	if (num_online_cpus() < 2) {
> > +		pr_warn("XFAIL: this test requires at least two cpus\n");
> > +		return;
> > +	}
> > +
> > +	hijacker_cpu =3D raw_smp_processor_id();
> > +	patching_cpu =3D cpumask_any_but(cpu_online_mask, hijacker_cpu);
> > +
> > +	patching_kthrd =3D kthread_create_on_node(&lkdtm_patching_cpu, NULL,
> > +						cpu_to_node(patching_cpu),
> > +						"lkdtm_patching_cpu");
> > +	kthread_bind(patching_kthrd, patching_cpu);
> > +	wake_up_process(patching_kthrd);
> > +
> > +	addr =3D offset_in_page(patch_site) | read_cpu_patching_addr(patching=
_cpu);
> > +
> > +	pr_info("starting hijacker_cpu=3D%d\n", hijacker_cpu);
> > +	for (attempts =3D 0; attempts < 100000; ++attempts) {
> > +		/* Try to write to the other CPU's temp patch mapping */
> > +		hijacked =3D lkdtm_try_write(bad_data, (u32 *)addr);
> > +
> > +		if (hijacked) {
> > +			if (kthread_stop(patching_kthrd)) {
> > +				pr_info("hijack attempts: %d\n", attempts);
> > +				pr_err("XFAIL: error stopping patching cpu\n");
> > +				return;
> > +			}
> > +			break;
> > +		}
> > +	}
> > +	pr_info("hijack attempts: %d\n", attempts);
> > +
> > +	if (hijacked) {
> > +		if (lkdtm_read_patch_site() =3D=3D bad_data)
> > +			pr_err("overwrote kernel text\n");
> > +		/*
> > +		 * There are window conditions where the hijacker cpu manages to
> > +		 * write to the patch site but the site gets overwritten again by
> > +		 * the patching cpu. We still consider that a "successful" hijack
> > +		 * since the hijacker cpu did not fault on the write.
> > +		 */
> > +		pr_err("FAIL: wrote to another cpu's patching area\n");
> > +	} else {
> > +		kthread_stop(patching_kthrd);
> > +	}
> > +
> > +	/* Restore the original data to be able to run the test again */
> > +	lkdtm_do_patch(original_insn);
> > +}
> > +
> > +#else
> > +
> > +void lkdtm_HIJACK_PATCH(void)
> > +{
> > +	if (!IS_ENABLED(CONFIG_PPC))
> > +		pr_err("XFAIL: this test only runs on powerpc\n");
> > +	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> > +		pr_err("XFAIL: this test requires CONFIG_STRICT_KERNEL_RWX\n");
> > +	if (!IS_BUILTIN(CONFIG_LKDTM))
> > +		pr_err("XFAIL: this test requires CONFIG_LKDTM=3Dy (not =3Dm!)\n");
> > +}
> > +
> > +#endif
> > +
> >   void __init lkdtm_perms_init(void)
> >   {
> >   	/* Make sure we can write to __ro_after_init values during __init */
> >=20

