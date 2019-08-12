Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DF48AB14
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 01:23:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466sNq1v0zzDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 09:23:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466sLt3GtfzDqZy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 09:22:14 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7CNLtoM009116; Mon, 12 Aug 2019 19:22:01 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ubcybhr29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Aug 2019 19:22:00 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7CNM0Jd009800;
 Mon, 12 Aug 2019 19:22:00 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ubcybhr21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Aug 2019 19:22:00 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7CNKAce030901;
 Mon, 12 Aug 2019 23:21:59 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 2u9nj6a6gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Aug 2019 23:21:59 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7CNLwRn19005716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Aug 2019 23:21:58 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FE98C6059;
 Mon, 12 Aug 2019 23:21:58 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E063EC6055;
 Mon, 12 Aug 2019 23:21:54 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.165.146])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Aug 2019 23:21:54 +0000 (GMT)
References: <20190806052237.12525-1-bauerman@linux.ibm.com>
 <20190806052237.12525-12-bauerman@linux.ibm.com>
 <8736i6sfhn.fsf@concordia.ellerman.id.au>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 11/16] powerpc/pseries/svm: Export guest SVM status to
 user space via sysfs
In-reply-to: <8736i6sfhn.fsf@concordia.ellerman.id.au>
Date: Mon, 12 Aug 2019 20:21:50 -0300
Message-ID: <87r25qgeb5.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-12_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908120229
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Ryan Grimm <grimm@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Michael Ellerman <mpe@ellerman.id.au> writes:

> Thiago Jung Bauermann <bauerman@linux.ibm.com> writes:
>> From: Ryan Grimm <grimm@linux.vnet.ibm.com>
>>
>> User space might want to know it's running in a secure VM.  It can't do
>> a mfmsr because mfmsr is a privileged instruction.
>>
>> The solution here is to create a cpu attribute:
>>
>> /sys/devices/system/cpu/svm
>>
>> which will read 0 or 1 based on the S bit of the guest's CPU 0.
>
> Why CPU 0?
>
> If we have different CPUs running with different MSR_S then something
> has gone badly wrong, no?

Yes, that would be very bad.

> So can't we just read the MSR on whatever CPU the sysfs code happens to
> run on.

Good point. I made the change in the patch below.

-- 
Thiago Jung Bauermann
IBM Linux Technology Center



From 2d951305e118bf286f8e83cbf396448085186357 Mon Sep 17 00:00:00 2001
From: Ryan Grimm <grimm@linux.vnet.ibm.com>
Date: Tue, 15 Jan 2019 11:56:29 -0600
Subject: [PATCH] powerpc/pseries/svm: Export guest SVM status to user space
 via sysfs

User space might want to know it's running in a secure VM.  It can't do
a mfmsr because mfmsr is a privileged instruction.

The solution here is to create a cpu attribute:

/sys/devices/system/cpu/svm

which will read 0 or 1 based on the S bit of the current CPU.

Signed-off-by: Ryan Grimm <grimm@linux.vnet.ibm.com>
Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---
 arch/powerpc/kernel/sysfs.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index e2147d7c9e72..80a676da11cb 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -19,6 +19,7 @@
 #include <asm/smp.h>
 #include <asm/pmc.h>
 #include <asm/firmware.h>
+#include <asm/svm.h>
 
 #include "cacheinfo.h"
 #include "setup.h"
@@ -715,6 +716,23 @@ static struct device_attribute pa6t_attrs[] = {
 #endif /* HAS_PPC_PMC_PA6T */
 #endif /* HAS_PPC_PMC_CLASSIC */
 
+#ifdef CONFIG_PPC_SVM
+static ssize_t show_svm(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%u\n", is_secure_guest());
+}
+static DEVICE_ATTR(svm, 0444, show_svm, NULL);
+
+static void create_svm_file(void)
+{
+	device_create_file(cpu_subsys.dev_root, &dev_attr_svm);
+}
+#else
+static void create_svm_file(void)
+{
+}
+#endif /* CONFIG_PPC_SVM */
+
 static int register_cpu_online(unsigned int cpu)
 {
 	struct cpu *c = &per_cpu(cpu_devices, cpu);
@@ -1058,6 +1076,8 @@ static int __init topology_init(void)
 	sysfs_create_dscr_default();
 #endif /* CONFIG_PPC64 */
 
+	create_svm_file();
+
 	return 0;
 }
 subsys_initcall(topology_init);
