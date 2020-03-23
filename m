Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EFF190039
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 22:24:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mS7l4GP6zDqxf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 08:24:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m9P345nBzDqty
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 21:20:06 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02NA3RLj087913
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 06:20:04 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywet1w72d-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 06:20:03 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ganeshgr@linux.ibm.com>;
 Mon, 23 Mar 2020 10:20:01 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 23 Mar 2020 10:19:59 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02NAJwuC39387216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 10:19:59 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DDB24A4055;
 Mon, 23 Mar 2020 10:19:58 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46FCCA404D;
 Mon, 23 Mar 2020 10:19:57 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.72.19])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Mar 2020 10:19:56 +0000 (GMT)
Subject: Re: [PATCH] powerpc/64: allow rtas to be called in real-mode, use
 this in machine check
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200320152816.1469657-1-npiggin@gmail.com>
From: Ganesh <ganeshgr@linux.ibm.com>
Date: Mon, 23 Mar 2020 15:49:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20200320152816.1469657-1-npiggin@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------350A759B5AE6B6D042F8FD7F"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20032310-0020-0000-0000-000003B96F2F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032310-0021-0000-0000-00002211E943
Message-Id: <8435e728-8cb4-c6b2-f228-44ebb0b0cc29@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-23_03:2020-03-21,
 2020-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=900 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003230059
X-Mailman-Approved-At: Tue, 24 Mar 2020 08:23:06 +1100
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------350A759B5AE6B6D042F8FD7F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/20/20 8:58 PM, Nicholas Piggin wrote:
> rtas_call allocates and uses memory in failure paths, which is
> not safe for RMA. It also calls local_irq_save() which may not be safe
> in all real mode contexts.
>
> Particularly machine check may run with interrupts not "reconciled",
> and it may have hit while it was in tracing code that should not be
> rentered.
>
> Create minimal rtas call that should be usable by guest machine check
> code, use it there to call "ibm,nmi-interlock".
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/rtas.h      |  1 +
>   arch/powerpc/kernel/entry_64.S       | 12 ++++++--
>   arch/powerpc/kernel/rtas.c           | 43 ++++++++++++++++++++++++++++
>   arch/powerpc/platforms/pseries/ras.c |  2 +-
>   4 files changed, 54 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> index 3c1887351c71..4ffc499ce1ac 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -352,6 +352,7 @@ extern struct rtas_t rtas;
>   extern int rtas_token(const char *service);
>   extern int rtas_service_present(const char *service);
>   extern int rtas_call(int token, int, int, int *, ...);
> +extern int raw_rtas_call(int token, int, int, int *, ...);
>   void rtas_call_unlocked(struct rtas_args *args, int token, int nargs,
>   			int nret, ...);
>   extern void __noreturn rtas_restart(char *cmd);
> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
> index 51c5b681f70c..309abb677788 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -759,6 +759,13 @@ _GLOBAL(enter_rtas)
>   	li	r0,0
>   	mtcr	r0
>   
> +	/* enter_rtas called from real-mode may not have irqs reconciled
> +	 * but will always have interrupts disabled.
> +	 */
> +	mfmsr	r6
> +	andi.	r7,r6,(MSR_IR|MSR_DR)
> +	beq	2f
> +
>   #ifdef CONFIG_BUG
>   	/* There is no way it is acceptable to get here with interrupts enabled,
>   	 * check it with the asm equivalent of WARN_ON
> @@ -769,10 +776,10 @@ _GLOBAL(enter_rtas)
>   #endif
>   
>   	/* Hard-disable interrupts */
> -	mfmsr	r6
>   	rldicl	r7,r6,48,1
>   	rotldi	r7,r7,16
>   	mtmsrd	r7,1
> +2:
>   
>   	/* Unfortunately, the stack pointer and the MSR are also clobbered,
>   	 * so they are saved in the PACA which allows us to restore
> @@ -795,7 +802,6 @@ _GLOBAL(enter_rtas)
>   	ori	r9,r9,MSR_IR|MSR_DR|MSR_FE0|MSR_FE1|MSR_FP|MSR_RI|MSR_LE
>   	andc	r6,r0,r9
>   
> -__enter_rtas:
>   	sync				/* disable interrupts so SRR0/1 */
>   	mtmsrd	r0			/* don't get trashed */
>   
> @@ -837,7 +843,7 @@ rtas_return_loc:
>   	mtspr	SPRN_SRR1,r4
>   	RFI_TO_KERNEL
>   	b	.	/* prevent speculative execution */
> -_ASM_NOKPROBE_SYMBOL(__enter_rtas)
> +_ASM_NOKPROBE_SYMBOL(enter_rtas)
>   _ASM_NOKPROBE_SYMBOL(rtas_return_loc)
>   
>   	.align	3
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index c5fa251b8950..a058dcfb6726 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -450,6 +450,8 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
>   	char *buff_copy = NULL;
>   	int ret;
>   
> +	WARN_ON_ONCE((mfmsr() & (MSR_IR|MSR_DR)) != (MSR_IR|MSR_DR));
> +
>   	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
>   		return -1;
>   
> @@ -483,6 +485,47 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
>   }
>   EXPORT_SYMBOL(rtas_call);
>   
> +/*
> + * Like rtas_call but no kmalloc or printk etc in error handling, so
> + * error won't go through log_error. No tracing, may be called in real mode.
> + */
> +int notrace raw_rtas_call(int token, int nargs, int nret, int *outputs, ...)
> +{
> +	va_list list;
> +	int i;
> +	struct rtas_args *rtas_args;
> +	int ret;
> +
> +	WARN_ON_ONCE((mfmsr() & MSR_EE));
> +
> +	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
> +		return -1;
> +
> +	/*
> +	 * Real mode must have MSR[EE]=0 and we prefer not to touch any
> +	 * irq or preempt state (this may be called in machine check).
> +	 */
> +	preempt_disable_notrace();
> +	arch_spin_lock(&rtas.lock);

I wonder, if its ok to attempt for this lock in nested MCE.

> +
> +	/* We use the global rtas args buffer */
> +	rtas_args = &rtas.args;
> +
> +	va_start(list, outputs);
> +	va_rtas_call_unlocked(rtas_args, token, nargs, nret, list);
> +	va_end(list);
> +
> +	if (nret > 1 && outputs != NULL)
> +		for (i = 0; i < nret-1; ++i)
> +			outputs[i] = be32_to_cpu(rtas_args->rets[i+1]);
> +	ret = (nret > 0)? be32_to_cpu(rtas_args->rets[0]): 0;
> +
> +	arch_spin_unlock(&rtas.lock);
> +	preempt_enable_notrace();
> +
> +	return ret;
> +}
> +
>   /* For RTAS_BUSY (-2), delay for 1 millisecond.  For an extended busy status
>    * code of 990n, perform the hinted delay of 10^n (last digit) milliseconds.
>    */
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
> index c74d5e740922..e87f86f02569 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -458,7 +458,7 @@ static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
>    */
>   static void fwnmi_release_errinfo(void)
>   {
> -	int ret = rtas_call(ibm_nmi_interlock_token, 0, 1, NULL);
> +	int ret = raw_rtas_call(ibm_nmi_interlock_token, 0, 1, NULL);
>   	if (ret != 0)
>   		printk(KERN_ERR "FWNMI: nmi-interlock failed: %d\n", ret);
>   }


--------------350A759B5AE6B6D042F8FD7F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 3/20/20 8:58 PM, Nicholas Piggin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200320152816.1469657-1-npiggin@gmail.com">
      <pre class="moz-quote-pre" wrap="">rtas_call allocates and uses memory in failure paths, which is
not safe for RMA. It also calls local_irq_save() which may not be safe
in all real mode contexts.

Particularly machine check may run with interrupts not "reconciled",
and it may have hit while it was in tracing code that should not be
rentered.

Create minimal rtas call that should be usable by guest machine check
code, use it there to call "ibm,nmi-interlock".

Signed-off-by: Nicholas Piggin <a class="moz-txt-link-rfc2396E" href="mailto:npiggin@gmail.com">&lt;npiggin@gmail.com&gt;</a>
---
 arch/powerpc/include/asm/rtas.h      |  1 +
 arch/powerpc/kernel/entry_64.S       | 12 ++++++--
 arch/powerpc/kernel/rtas.c           | 43 ++++++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/ras.c |  2 +-
 4 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 3c1887351c71..4ffc499ce1ac 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -352,6 +352,7 @@ extern struct rtas_t rtas;
 extern int rtas_token(const char *service);
 extern int rtas_service_present(const char *service);
 extern int rtas_call(int token, int, int, int *, ...);
+extern int raw_rtas_call(int token, int, int, int *, ...);
 void rtas_call_unlocked(struct rtas_args *args, int token, int nargs,
 			int nret, ...);
 extern void __noreturn rtas_restart(char *cmd);
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 51c5b681f70c..309abb677788 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -759,6 +759,13 @@ _GLOBAL(enter_rtas)
 	li	r0,0
 	mtcr	r0
 
+	/* enter_rtas called from real-mode may not have irqs reconciled
+	 * but will always have interrupts disabled.
+	 */
+	mfmsr	r6
+	andi.	r7,r6,(MSR_IR|MSR_DR)
+	beq	2f
+
 #ifdef CONFIG_BUG
 	/* There is no way it is acceptable to get here with interrupts enabled,
 	 * check it with the asm equivalent of WARN_ON
@@ -769,10 +776,10 @@ _GLOBAL(enter_rtas)
 #endif
 
 	/* Hard-disable interrupts */
-	mfmsr	r6
 	rldicl	r7,r6,48,1
 	rotldi	r7,r7,16
 	mtmsrd	r7,1
+2:
 
 	/* Unfortunately, the stack pointer and the MSR are also clobbered,
 	 * so they are saved in the PACA which allows us to restore
@@ -795,7 +802,6 @@ _GLOBAL(enter_rtas)
 	ori	r9,r9,MSR_IR|MSR_DR|MSR_FE0|MSR_FE1|MSR_FP|MSR_RI|MSR_LE
 	andc	r6,r0,r9
 
-__enter_rtas:
 	sync				/* disable interrupts so SRR0/1 */
 	mtmsrd	r0			/* don't get trashed */
 
@@ -837,7 +843,7 @@ rtas_return_loc:
 	mtspr	SPRN_SRR1,r4
 	RFI_TO_KERNEL
 	b	.	/* prevent speculative execution */
-_ASM_NOKPROBE_SYMBOL(__enter_rtas)
+_ASM_NOKPROBE_SYMBOL(enter_rtas)
 _ASM_NOKPROBE_SYMBOL(rtas_return_loc)
 
 	.align	3
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index c5fa251b8950..a058dcfb6726 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -450,6 +450,8 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 	char *buff_copy = NULL;
 	int ret;
 
+	WARN_ON_ONCE((mfmsr() &amp; (MSR_IR|MSR_DR)) != (MSR_IR|MSR_DR));
+
 	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
 		return -1;
 
@@ -483,6 +485,47 @@ int rtas_call(int token, int nargs, int nret, int *outputs, ...)
 }
 EXPORT_SYMBOL(rtas_call);
 
+/*
+ * Like rtas_call but no kmalloc or printk etc in error handling, so
+ * error won't go through log_error. No tracing, may be called in real mode.
+ */
+int notrace raw_rtas_call(int token, int nargs, int nret, int *outputs, ...)
+{
+	va_list list;
+	int i;
+	struct rtas_args *rtas_args;
+	int ret;
+
+	WARN_ON_ONCE((mfmsr() &amp; MSR_EE));
+
+	if (!rtas.entry || token == RTAS_UNKNOWN_SERVICE)
+		return -1;
+
+	/*
+	 * Real mode must have MSR[EE]=0 and we prefer not to touch any
+	 * irq or preempt state (this may be called in machine check).
+	 */
+	preempt_disable_notrace();
+	arch_spin_lock(&amp;rtas.lock);</pre>
    </blockquote>
    <pre>I wonder, if its ok to attempt for this lock in nested MCE. 
</pre>
    <blockquote type="cite"
      cite="mid:20200320152816.1469657-1-npiggin@gmail.com">
      <pre class="moz-quote-pre" wrap="">
+
+	/* We use the global rtas args buffer */
+	rtas_args = &amp;rtas.args;
+
+	va_start(list, outputs);
+	va_rtas_call_unlocked(rtas_args, token, nargs, nret, list);
+	va_end(list);
+
+	if (nret &gt; 1 &amp;&amp; outputs != NULL)
+		for (i = 0; i &lt; nret-1; ++i)
+			outputs[i] = be32_to_cpu(rtas_args-&gt;rets[i+1]);
+	ret = (nret &gt; 0)? be32_to_cpu(rtas_args-&gt;rets[0]): 0;
+
+	arch_spin_unlock(&amp;rtas.lock);
+	preempt_enable_notrace();
+
+	return ret;
+}
+
 /* For RTAS_BUSY (-2), delay for 1 millisecond.  For an extended busy status
  * code of 990n, perform the hinted delay of 10^n (last digit) milliseconds.
  */
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index c74d5e740922..e87f86f02569 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -458,7 +458,7 @@ static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
  */
 static void fwnmi_release_errinfo(void)
 {
-	int ret = rtas_call(ibm_nmi_interlock_token, 0, 1, NULL);
+	int ret = raw_rtas_call(ibm_nmi_interlock_token, 0, 1, NULL);
 	if (ret != 0)
 		printk(KERN_ERR "FWNMI: nmi-interlock failed: %d\n", ret);
 }
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------350A759B5AE6B6D042F8FD7F--

