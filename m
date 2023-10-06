Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8642F7BBC9C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 18:24:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dRw9iSBC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2DKP3Rchz3vY3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 03:24:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dRw9iSBC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2DJV3FVpz3c58
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 03:23:54 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396GMxUr021812;
	Fri, 6 Oct 2023 16:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WOKqt6dQE0XRrNy/SZjYka7p63UOD56p9AcXGcPLwqQ=;
 b=dRw9iSBCiIFBa+/I4OEvLkQ4d8ODex496JmOJuiQfnqGBlwuIBUhfBdehBjzwih1LuVW
 MyKlcbmgR3rjmIV53pCQRL97/Q4ksww7/LAWpDNSJVIUQfhqcKNrljPPlb1l7/uVZbVL
 LmSThbRzq8Q9P5bGMQQdEcY18DkzrADTe1Iqfjas+S4y+/eCaB+Tt5rjF4AdCGY8Y1Ae
 7NXErL6JtDXBf6s/ad0c/0HTnIQnzgPtwdy0QdELZtdpoGFEj0evqgPWPKh0uBRtAbyz
 zowkeyYBXWrWj6fj69YUFIQ046sX2gqTwD6VdXtRkHbh4cK9fXNvwo3UJ9zpPuZupQyy +w== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjnpy015a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 16:23:30 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 396FrQgP025083;
	Fri, 6 Oct 2023 16:23:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3texd0s65a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 16:23:26 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 396GN1dV35717578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 16:23:01 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE1782005A;
	Fri,  6 Oct 2023 16:23:00 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9189A20063;
	Fri,  6 Oct 2023 16:22:58 +0000 (GMT)
Received: from [9.43.24.22] (unknown [9.43.24.22])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 16:22:58 +0000 (GMT)
Message-ID: <bef1d46a-33bb-62da-544a-06183f60cf42@linux.ibm.com>
Date: Fri, 6 Oct 2023 21:52:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/5] powerpc/code-patching: introduce
 patch_instructions()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>
References: <20230928194818.261163-1-hbathini@linux.ibm.com>
 <20230928194818.261163-2-hbathini@linux.ibm.com>
 <0ca42eae-b25c-c3c0-43d3-7acc653aa53c@csgroup.eu>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <0ca42eae-b25c-c3c0-43d3-7acc653aa53c@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oW1AnRQH70XdqLp07mYbEbBv1LSU73Qs
X-Proofpoint-ORIG-GUID: oW1AnRQH70XdqLp07mYbEbBv1LSU73Qs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_12,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 suspectscore=0 adultscore=0 mlxlogscore=780 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310060123
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,


On 29/09/23 2:09 pm, Christophe Leroy wrote:
> 
> 
> Le 28/09/2023 à 21:48, Hari Bathini a écrit :
>> patch_instruction() entails setting up pte, patching the instruction,
>> clearing the pte and flushing the tlb. If multiple instructions need
>> to be patched, every instruction would have to go through the above
>> drill unnecessarily. Instead, introduce function patch_instructions()
>> that sets up the pte, clears the pte and flushes the tlb only once per
>> page range of instructions to be patched. This adds a slight overhead
>> to patch_instruction() call while improving the patching time for
>> scenarios where more than one instruction needs to be patched.
> 
> On my powerpc8xx, this patch leads to an increase of about 8% of the
> time needed to activate ftrace function tracer.

Interesting! My observation on ppc64le was somewhat different.
With single cpu, average ticks were almost similar with and without
the patch (~1580). I saw a performance degradation of less than
0.6% without vs with this patch to activate function tracer.

Ticks to activate function tracer in 15 attempts without
this patch (avg: 108734089):
106619626
111712292
111030404
111021344
111313530
106253773
107156175
106887038
107215379
108646636
108040287
108311770
107842343
106894310
112066423

Ticks to activate function tracer in 15 attempts with
this patch (avg: 109328578):
109378357
108794095
108595381
107622142
110689418
107287276
107132093
112540481
111311830
112608265
102883923
112054554
111762570
109874309
107393979

I used the below patch for the experiment:

diff --git a/arch/powerpc/lib/code-patching.c 
b/arch/powerpc/lib/code-patching.c
index b00112d7ad4..0979d12d00c 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -19,6 +19,10 @@
  #include <asm/page.h>
  #include <asm/code-patching.h>
  #include <asm/inst.h>
+#include <asm/time.h>
+
+unsigned long patching_time;
+unsigned long num_times;

  static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 
*patch_addr)
  {
@@ -353,7 +357,7 @@ static int __do_patch_instruction(u32 *addr, 
ppc_inst_t instr)
  	return err;
  }

-int patch_instruction(u32 *addr, ppc_inst_t instr)
+int ___patch_instruction(u32 *addr, ppc_inst_t instr)
  {
  	int err;
  	unsigned long flags;
@@ -376,6 +380,19 @@ int patch_instruction(u32 *addr, ppc_inst_t instr)

  	return err;
  }
+
+int patch_instruction(u32 *addr, ppc_inst_t instr)
+{
+	u64 start;
+	int err;
+
+	start = get_tb();
+	err = ___patch_instruction(addr, instr);
+	patching_time += (get_tb() - start);
+	num_times++;
+
+	return err;
+}
  NOKPROBE_SYMBOL(patch_instruction);

  int patch_branch(u32 *addr, unsigned long target, int flags)
diff --git a/kernel/ksysfs.c b/kernel/ksysfs.c
index 1d4bc493b2f..f52694cfeab 100644
--- a/kernel/ksysfs.c
+++ b/kernel/ksysfs.c
@@ -35,6 +35,18 @@ static struct kobj_attribute _name##_attr = 
__ATTR_RO(_name)
  #define KERNEL_ATTR_RW(_name) \
  static struct kobj_attribute _name##_attr = __ATTR_RW(_name)

+unsigned long patch_avgtime;
+extern unsigned long patching_time;
+extern unsigned long num_times;
+
+static ssize_t patching_avgtime_show(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+	patch_avgtime = patching_time / num_times;
+	return sysfs_emit(buf, "%lu\n", patch_avgtime);
+}
+KERNEL_ATTR_RO(patching_avgtime);
+
  /* current uevent sequence number */
  static ssize_t uevent_seqnum_show(struct kobject *kobj,
  				  struct kobj_attribute *attr, char *buf)
@@ -250,6 +262,7 @@ struct kobject *kernel_kobj;
  EXPORT_SYMBOL_GPL(kernel_kobj);

  static struct attribute * kernel_attrs[] = {
+	&patching_avgtime_attr.attr,
  	&fscaps_attr.attr,
  	&uevent_seqnum_attr.attr,
  	&cpu_byteorder_attr.attr,
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index abaaf516fca..5eb950bcab9 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -50,6 +50,7 @@
  #include <linux/workqueue.h>

  #include <asm/setup.h> /* COMMAND_LINE_SIZE */
+#include <asm/time.h>

  #include "trace.h"
  #include "trace_output.h"
@@ -6517,6 +6518,7 @@ int tracing_set_tracer(struct trace_array *tr, 
const char *buf)
  	bool had_max_tr;
  #endif
  	int ret = 0;
+	u64 start;

  	mutex_lock(&trace_types_lock);

@@ -6536,6 +6538,10 @@ int tracing_set_tracer(struct trace_array *tr, 
const char *buf)
  		ret = -EINVAL;
  		goto out;
  	}
+
+	pr_warn("Current tracer: %s, Changing to tracer: %s\n",
+		tr->current_trace->name, t->name);
+	start = get_tb();
  	if (t == tr->current_trace)
  		goto out;

@@ -6614,6 +6620,7 @@ int tracing_set_tracer(struct trace_array *tr, 
const char *buf)
  	tr->current_trace->enabled++;
  	trace_branch_enable(tr);
   out:
+	pr_warn("Time taken to enable tracer is %llu\n", (get_tb() - start));
  	mutex_unlock(&trace_types_lock);

  	return ret;

Thanks
Hari
