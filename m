Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A90869D1C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 16:37:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HF2s4RgVzDqWb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 00:37:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HCTt0t6gzDqTW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 23:27:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46HCTs1ybLz8svw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 23:27:13 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46HCTq6MqSz9sP7; Mon, 26 Aug 2019 23:27:11 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46HCTn2w7Xz9sNf;
 Mon, 26 Aug 2019 23:27:09 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7QDLqPA061470; Mon, 26 Aug 2019 09:26:58 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2umfqpsm55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Aug 2019 09:26:58 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7QDNKeT066203;
 Mon, 26 Aug 2019 09:26:57 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2umfqpsm44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Aug 2019 09:26:57 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7QDOTGx025358;
 Mon, 26 Aug 2019 13:26:56 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 2ujvv6d0ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Aug 2019 13:26:56 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7QDQtNR29294876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 13:26:55 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFB8DC6055;
 Mon, 26 Aug 2019 13:26:54 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 729E6C6057;
 Mon, 26 Aug 2019 13:26:52 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.85.199.141])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 26 Aug 2019 13:26:52 +0000 (GMT)
From: Nayna <nayna@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/4] powerpc: expose secure variables to userspace via
 sysfs
To: "Oliver O'Halloran" <oohall@gmail.com>, Nayna Jain <nayna@linux.ibm.com>, 
 linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org
References: <1566400103-18201-1-git-send-email-nayna@linux.ibm.com>
 <1566400103-18201-3-git-send-email-nayna@linux.ibm.com>
 <23135466fc524a13cd76532ec59f84de51152a1c.camel@gmail.com>
Message-ID: <feb76649-a233-7e7e-2005-53049dfda06b@linux.vnet.ibm.com>
Date: Mon, 26 Aug 2019 09:26:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <23135466fc524a13cd76532ec59f84de51152a1c.camel@gmail.com>
Content-Type: multipart/alternative;
 boundary="------------5CC9181B5501ADD5352FD98D"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908260145
X-Mailman-Approved-At: Tue, 27 Aug 2019 00:29:34 +1000
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------5CC9181B5501ADD5352FD98D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 08/22/2019 01:18 AM, Oliver O'Halloran wrote:
> On Wed, 2019-08-21 at 11:08 -0400, Nayna Jain wrote:
>> PowerNV secure variables, which store the keys used for OS kernel
>> verification, are managed by the firmware. These secure variables need to
>> be accessed by the userspace for addition/deletion of the certificates.
>>
>> This patch adds the sysfs interface to expose secure variables for PowerNV
>> secureboot. The users shall use this interface for manipulating
>> the keys stored in the secure variables.
>>
>> Signed-off-by: Nayna Jain<nayna@linux.ibm.com>
>> ---
>>   Documentation/ABI/testing/sysfs-secvar |  27 ++++
>>   arch/powerpc/Kconfig                   |   9 ++
>>   arch/powerpc/kernel/Makefile           |   1 +
>>   arch/powerpc/kernel/secvar-sysfs.c     | 210 +++++++++++++++++++++++++
>>   4 files changed, 247 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-secvar
>>   create mode 100644 arch/powerpc/kernel/secvar-sysfs.c
>>
>> diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
>> new file mode 100644
>> index 000000000000..68f0e03d873d
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-secvar
>> @@ -0,0 +1,27 @@
>> +What:		/sys/firmware/secvar
>> +Date:		August 2019
>> +Contact:	Nayna Jain<nayna@linux.ibm.com>
>> +Description:
>> +		This directory exposes interfaces for interacting with
>> +		the secure variables managed by OPAL firmware.
>> +
>> +		This is only for the powerpc/powernv platform.
>> +
>> +		Directory:
>> +		vars:		This directory lists all the variables that
>> +				are supported by the OPAL. The variables are
>> +				represented in the form of directories with
>> +				their variable names. The variable name is
>> +				unique and is in ASCII representation. The data
>> +				and size can be determined by reading their
>> +				respective attribute files.
>> +
>> +		Each variable directory has the following files:
>> +		name:		An ASCII representation of the variable name
>> +		data:		A read-only file containing the value of the
>> +				variable
>> +		size:		An integer representation of the size of the
>> +				content of the variable. In other works, it
>> +				represents the size of the data
>> +		update:		A write-only file that is used to submit the new
>> +				value for the variable.
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 42109682b727..b4bdf77837b2 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -925,6 +925,15 @@ config PPC_SECURE_BOOT
>>   	  allows user to enable OS Secure Boot on PowerPC systems that
>>   	  have firmware secure boot support.
>>   
>> +config SECVAR_SYSFS
>> +        tristate "Enable sysfs interface for POWER secure variables"
>> +        depends on PPC_SECURE_BOOT
>> +        help
>> +          POWER secure variables are managed and controlled by firmware.
>> +          These variables are exposed to userspace via sysfs to enable
>> +          read/write operations on these variables. Say Y if you have
>> +	  secure boot enabled and want to expose variables to userspace.
>> +
>>   endmenu
>>   
>>   config ISA_DMA_API
>> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
>> index 9041563f1c74..4ea7b738c3a3 100644
>> --- a/arch/powerpc/kernel/Makefile
>> +++ b/arch/powerpc/kernel/Makefile
>> @@ -158,6 +158,7 @@ obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
>>   obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
>>   
>>   obj-$(CONFIG_PPC_SECURE_BOOT)	+= secboot.o ima_arch.o secvar-ops.o
>> +obj-$(CONFIG_SECVAR_SYSFS)     += secvar-sysfs.o
>>   
>>   # Disable GCOV, KCOV & sanitizers in odd or sensitive code
>>   GCOV_PROFILE_prom_init.o := n
>> diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
>> new file mode 100644
>> index 000000000000..e46986bb29a0
>> --- /dev/null
>> +++ b/arch/powerpc/kernel/secvar-sysfs.c
>> @@ -0,0 +1,210 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2019 IBM Corporation<nayna@linux.ibm.com>
>> + *
>> + * This code exposes secure variables to user via sysfs
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/slab.h>
>> +#include <linux/compat.h>
>> +#include <linux/string.h>
>> +#include <asm/opal.h>
>> +#include <asm/secvar.h>
>> +
>> +//Approximating it for now, it is bound to change.
>> +#define VARIABLE_MAX_SIZE  32000
> this needs to be communicated from the secvar backend, maybe via a
> field in the ops structure?

Thanks Oliver, I have just posted v3 version which includes yours and 
Greg's feedbacks.
And giving some of the responses here.
Yes for this one,  thinking of doing it via device-tree as they will be 
fixed values for a particular platform

>> +
>> +static struct kobject *powerpc_kobj;
> Call it secvar_kobj or something.
>
>> +static struct secvar_operations *secvarops;
> Ah, the old I-can't-believe-it's-not-global trick.
>
>> +struct kset *secvar_kset;
> shouldn't that be static too?
>
>> +
>> +static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +			 char *buf)
>> +{
>> +	return sprintf(buf, "%s", kobj->name);
>> +}
>> +
>> +static ssize_t size_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +			 char *buf)
>> +{
>> +	unsigned long dsize;
>> +	int rc;
>> +
>> +	rc = secvarops->get_variable(kobj->name, strlen(kobj->name) + 1, NULL,
>> +				     &dsize);
>> +	if (rc) {
>> +		pr_err("Error retrieving variable size %d\n", rc);
>> +		return rc;
>> +	}
>> +
>> +	rc = sprintf(buf, "%ld", dsize);
>> +
>> +	return rc;
>> +}
>> +
>> +static ssize_t data_read(struct file *filep, struct kobject *kobj,
>> +			 struct bin_attribute *attr, char *buf, loff_t off,
>> +			 size_t count)
>> +{
>> +	unsigned long dsize;
>> +	int rc;
>> +	char *data;
>> +
>> +	rc = secvarops->get_variable(kobj->name, strlen(kobj->name) + 1, NULL,
>> +				     &dsize);
>> +	if (rc) {
>> +		pr_err("Error getting variable size %d\n", rc);
>> +		return rc;
>> +	}
>> +	pr_debug("dsize is %ld\n", dsize);
>> +
>> +	data = kzalloc(dsize, GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	rc = secvarops->get_variable(kobj->name, strlen(kobj->name)+1, data,
>> +				     &dsize);
>> +	if (rc) {
>> +		pr_err("Error getting variable %d\n", rc);
>> +		goto data_fail;
>> +	}
>> +
>> +	rc = memory_read_from_buffer(buf, count, &off, data, dsize);
>> +
>> +data_fail:
>> +	kfree(data);
>> +	return rc;
>> +}
>> +
>> +static ssize_t update_write(struct file *filep, struct kobject *kobj,
>> +			    struct bin_attribute *attr, char *buf, loff_t off,
>> +			    size_t count)
>> +{
>> +	int rc;
>> +
>> +	pr_debug("count is %ld\n", count);
>> +	rc = secvarops->set_variable(kobj->name, strlen(kobj->name)+1, buf,
>> +				     count);
>> +	if (rc) {
>> +		pr_err("Error setting the variable %s\n", kobj->name);
>> +		return rc;
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static struct kobj_attribute name_attr =
>> +__ATTR(name, 0444, name_show, NULL);
>> +
>> +static struct kobj_attribute size_attr =
>> +__ATTR(size, 0444, size_show, NULL);
>> +
>> +static struct bin_attribute data_attr = {
>> +	.attr = {.name = "data", .mode = 0444},
>> +	.size = VARIABLE_MAX_SIZE,
>> +	.read = data_read,
>> +};
> Should they be globally readable? If efivars is globally readable I'm
> happy to follow that example, but mpe might have opinions.

efivars are globally readable.


>> +
>> +
>> +static struct bin_attribute update_attr = {
>> +	.attr = {.name = "update", .mode = 0200},
>> +	.size = VARIABLE_MAX_SIZE,
>> +	.write = update_write,
>> +};
>> +
>> +static struct bin_attribute  *secvar_bin_attrs[] = {
>> +	&data_attr,
>> +	&update_attr,
>> +	NULL,
>> +};
>> +
>> +static struct attribute *secvar_attrs[] = {
>> +	&name_attr.attr,
>> +	&size_attr.attr,
>> +	NULL,
>> +};
>> +
>> +const struct attribute_group secvar_attr_group = {
>> +	.attrs = secvar_attrs,
>> +	.bin_attrs = secvar_bin_attrs,
>> +};
>> +
>> +int secvar_sysfs_load(void)
>> +{
>> +
>> +	char *name;
>> +	unsigned long namesize;
>> +	struct kobject *kobj;
>> +	int status;
>> +	int rc = 0;
>> +
>> +	name = kzalloc(1024, GFP_KERNEL);
>> +	if (!name)
>> +		return -ENOMEM;
> Where'd the 1024 restriction on the length of the variable name come
> from? is that enforced by firmware? If so, how does firmware
> communicate the limited key length?

It is not enforced by the firmware. Currently, it is sort of agreed upon 
value between the firmware and the kernel, and taken from the examples 
of efivars. Probably it can be reduced.


--------------5CC9181B5501ADD5352FD98D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 08/22/2019 01:18 AM, Oliver
      O'Halloran wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:23135466fc524a13cd76532ec59f84de51152a1c.camel@gmail.com">
      <pre wrap="">On Wed, 2019-08-21 at 11:08 -0400, Nayna Jain wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">PowerNV secure variables, which store the keys used for OS kernel
verification, are managed by the firmware. These secure variables need to
be accessed by the userspace for addition/deletion of the certificates.

This patch adds the sysfs interface to expose secure variables for PowerNV
secureboot. The users shall use this interface for manipulating
the keys stored in the secure variables.

Signed-off-by: Nayna Jain <a class="moz-txt-link-rfc2396E" href="mailto:nayna@linux.ibm.com">&lt;nayna@linux.ibm.com&gt;</a>
---
 Documentation/ABI/testing/sysfs-secvar |  27 ++++
 arch/powerpc/Kconfig                   |   9 ++
 arch/powerpc/kernel/Makefile           |   1 +
 arch/powerpc/kernel/secvar-sysfs.c     | 210 +++++++++++++++++++++++++
 4 files changed, 247 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-secvar
 create mode 100644 arch/powerpc/kernel/secvar-sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
new file mode 100644
index 000000000000..68f0e03d873d
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-secvar
@@ -0,0 +1,27 @@
+What:		/sys/firmware/secvar
+Date:		August 2019
+Contact:	Nayna Jain <a class="moz-txt-link-rfc2396E" href="mailto:nayna@linux.ibm.com">&lt;nayna@linux.ibm.com&gt;</a>
+Description:
+		This directory exposes interfaces for interacting with
+		the secure variables managed by OPAL firmware.
+
+		This is only for the powerpc/powernv platform.
+
+		Directory:
+		vars:		This directory lists all the variables that
+				are supported by the OPAL. The variables are
+				represented in the form of directories with
+				their variable names. The variable name is
+				unique and is in ASCII representation. The data
+				and size can be determined by reading their
+				respective attribute files.
+
+		Each variable directory has the following files:
+		name:		An ASCII representation of the variable name
+		data:		A read-only file containing the value of the
+				variable
+		size:		An integer representation of the size of the
+				content of the variable. In other works, it
+				represents the size of the data
+		update:		A write-only file that is used to submit the new
+				value for the variable.
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 42109682b727..b4bdf77837b2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -925,6 +925,15 @@ config PPC_SECURE_BOOT
 	  allows user to enable OS Secure Boot on PowerPC systems that
 	  have firmware secure boot support.
 
+config SECVAR_SYSFS
+        tristate "Enable sysfs interface for POWER secure variables"
+        depends on PPC_SECURE_BOOT
+        help
+          POWER secure variables are managed and controlled by firmware.
+          These variables are exposed to userspace via sysfs to enable
+          read/write operations on these variables. Say Y if you have
+	  secure boot enabled and want to expose variables to userspace.
+
 endmenu
 
 config ISA_DMA_API
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 9041563f1c74..4ea7b738c3a3 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -158,6 +158,7 @@ obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
 obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
 
 obj-$(CONFIG_PPC_SECURE_BOOT)	+= secboot.o ima_arch.o secvar-ops.o
+obj-$(CONFIG_SECVAR_SYSFS)     += secvar-sysfs.o
 
 # Disable GCOV, KCOV &amp; sanitizers in odd or sensitive code
 GCOV_PROFILE_prom_init.o := n
diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
new file mode 100644
index 000000000000..e46986bb29a0
--- /dev/null
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019 IBM Corporation <a class="moz-txt-link-rfc2396E" href="mailto:nayna@linux.ibm.com">&lt;nayna@linux.ibm.com&gt;</a>
+ *
+ * This code exposes secure variables to user via sysfs
+ */
+
+#include &lt;linux/module.h&gt;
+#include &lt;linux/slab.h&gt;
+#include &lt;linux/compat.h&gt;
+#include &lt;linux/string.h&gt;
+#include &lt;asm/opal.h&gt;
+#include &lt;asm/secvar.h&gt;
+
+//Approximating it for now, it is bound to change.
+#define VARIABLE_MAX_SIZE  32000
</pre>
      </blockquote>
      <pre wrap="">this needs to be communicated from the secvar backend, maybe via a
field in the ops structure?
</pre>
    </blockquote>
    <br>
    Thanks Oliver, I have just posted v3 version which includes yours
    and Greg's feedbacks.<br>
    And giving some of the responses here.<br>
    Yes for this one,  thinking of doing it via device-tree as they will
    be fixed values for a particular platform<br>
    <br>
    <blockquote type="cite"
      cite="mid:23135466fc524a13cd76532ec59f84de51152a1c.camel@gmail.com">
      <blockquote type="cite">
        <pre wrap="">+
+static struct kobject *powerpc_kobj;
</pre>
      </blockquote>
      <pre wrap="">Call it secvar_kobj or something.

</pre>
      <blockquote type="cite">
        <pre wrap="">+static struct secvar_operations *secvarops;
</pre>
      </blockquote>
      <pre wrap="">Ah, the old I-can't-believe-it's-not-global trick.

</pre>
      <blockquote type="cite">
        <pre wrap="">+struct kset *secvar_kset;
</pre>
      </blockquote>
      <pre wrap="">shouldn't that be static too?

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sprintf(buf, "%s", kobj-&gt;name);
+}
+
+static ssize_t size_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	unsigned long dsize;
+	int rc;
+
+	rc = secvarops-&gt;get_variable(kobj-&gt;name, strlen(kobj-&gt;name) + 1, NULL,
+				     &amp;dsize);
+	if (rc) {
+		pr_err("Error retrieving variable size %d\n", rc);
+		return rc;
+	}
+
+	rc = sprintf(buf, "%ld", dsize);
+
+	return rc;
+}
+
+static ssize_t data_read(struct file *filep, struct kobject *kobj,
+			 struct bin_attribute *attr, char *buf, loff_t off,
+			 size_t count)
+{
+	unsigned long dsize;
+	int rc;
+	char *data;
+
+	rc = secvarops-&gt;get_variable(kobj-&gt;name, strlen(kobj-&gt;name) + 1, NULL,
+				     &amp;dsize);
+	if (rc) {
+		pr_err("Error getting variable size %d\n", rc);
+		return rc;
+	}
+	pr_debug("dsize is %ld\n", dsize);
+
+	data = kzalloc(dsize, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	rc = secvarops-&gt;get_variable(kobj-&gt;name, strlen(kobj-&gt;name)+1, data,
+				     &amp;dsize);
+	if (rc) {
+		pr_err("Error getting variable %d\n", rc);
+		goto data_fail;
+	}
+
+	rc = memory_read_from_buffer(buf, count, &amp;off, data, dsize);
+
+data_fail:
+	kfree(data);
+	return rc;
+}
+
+static ssize_t update_write(struct file *filep, struct kobject *kobj,
+			    struct bin_attribute *attr, char *buf, loff_t off,
+			    size_t count)
+{
+	int rc;
+
+	pr_debug("count is %ld\n", count);
+	rc = secvarops-&gt;set_variable(kobj-&gt;name, strlen(kobj-&gt;name)+1, buf,
+				     count);
+	if (rc) {
+		pr_err("Error setting the variable %s\n", kobj-&gt;name);
+		return rc;
+	}
+
+	return count;
+}
+
+static struct kobj_attribute name_attr =
+__ATTR(name, 0444, name_show, NULL);
+
+static struct kobj_attribute size_attr =
+__ATTR(size, 0444, size_show, NULL);
+
</pre>
      </blockquote>
      <blockquote type="cite">
        <pre wrap="">+static struct bin_attribute data_attr = {
+	.attr = {.name = "data", .mode = 0444},
+	.size = VARIABLE_MAX_SIZE,
+	.read = data_read,
+};
</pre>
      </blockquote>
      <pre wrap="">Should they be globally readable? If efivars is globally readable I'm
happy to follow that example, but mpe might have opinions.</pre>
    </blockquote>
    <br>
    efivars are globally readable.<br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:23135466fc524a13cd76532ec59f84de51152a1c.camel@gmail.com">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <pre wrap="">+
+
+static struct bin_attribute update_attr = {
+	.attr = {.name = "update", .mode = 0200},
+	.size = VARIABLE_MAX_SIZE,
+	.write = update_write,
+};
+
+static struct bin_attribute  *secvar_bin_attrs[] = {
+	&amp;data_attr,
+	&amp;update_attr,
+	NULL,
+};
+
+static struct attribute *secvar_attrs[] = {
+	&amp;name_attr.attr,
+	&amp;size_attr.attr,
+	NULL,
+};
+
+const struct attribute_group secvar_attr_group = {
+	.attrs = secvar_attrs,
+	.bin_attrs = secvar_bin_attrs,
+};
+
+int secvar_sysfs_load(void)
+{
+
+	char *name;
+	unsigned long namesize;
+	struct kobject *kobj;
+	int status;
+	int rc = 0;
+
+	name = kzalloc(1024, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
</pre>
      </blockquote>
      <pre wrap="">Where'd the 1024 restriction on the length of the variable name come
from? is that enforced by firmware? If so, how does firmware
communicate the limited key length?</pre>
    </blockquote>
    <br>
    It is not enforced by the firmware. Currently, it is sort of agreed
    upon value between the firmware and the kernel, and taken from the
    examples of efivars. Probably it can be reduced.<br>
    <br>
  </body>
</html>

--------------5CC9181B5501ADD5352FD98D--

