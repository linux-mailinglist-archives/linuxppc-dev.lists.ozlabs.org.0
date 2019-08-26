Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D7E9D1B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 16:33:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HDyR3BKzzDq77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 00:33:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HCS75XMYzDqQv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 23:25:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46HCS665Zjz8swb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 23:25:42 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46HCS62Dgpz9sP6; Mon, 26 Aug 2019 23:25:42 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46HCS53sXLz9sNy;
 Mon, 26 Aug 2019 23:25:41 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7QDLsM5121543; Mon, 26 Aug 2019 09:25:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2umemwm55t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Aug 2019 09:25:31 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7QDMWPZ124369;
 Mon, 26 Aug 2019 09:25:30 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2umemwm554-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Aug 2019 09:25:30 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7QDOWhK006749;
 Mon, 26 Aug 2019 13:25:29 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 2ujvv6w14m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Aug 2019 13:25:29 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7QDPSUP57016662
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Aug 2019 13:25:28 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F87DC6065;
 Mon, 26 Aug 2019 13:25:28 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE507C6057;
 Mon, 26 Aug 2019 13:25:25 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.85.199.141])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 26 Aug 2019 13:25:25 +0000 (GMT)
From: Nayna <nayna@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/4] powerpc: expose secure variables to userspace via
 sysfs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nayna Jain <nayna@linux.ibm.com>
References: <1566400103-18201-1-git-send-email-nayna@linux.ibm.com>
 <1566400103-18201-3-git-send-email-nayna@linux.ibm.com>
 <20190821163018.GA28571@kroah.com>
Message-ID: <c12fdf7c-a717-60f2-5d64-8e77db7fd4e6@linux.vnet.ibm.com>
Date: Mon, 26 Aug 2019 09:25:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190821163018.GA28571@kroah.com>
Content-Type: multipart/alternative;
 boundary="------------EBEEC4AFFD0EEB170C618A67"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908260145
X-Mailman-Approved-At: Tue, 27 Aug 2019 00:29:33 +1000
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
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linux-integrity@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------EBEEC4AFFD0EEB170C618A67
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 08/21/2019 12:30 PM, Greg Kroah-Hartman wrote:
> On Wed, Aug 21, 2019 at 11:08:21AM -0400, Nayna Jain wrote:
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
> Can you break this out into one-entry-per-file like most other entries
> are defined?  That makes it easier for tools to parse (specifically the
> tool in the tree right now...)
>
>
>
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
> No depends on SYSFS?
>
>> +        help
>> +          POWER secure variables are managed and controlled by firmware.
>> +          These variables are exposed to userspace via sysfs to enable
>> +          read/write operations on these variables. Say Y if you have
>> +	  secure boot enabled and want to expose variables to userspace.
> Mix of tabs and spaces :(
>
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
> No tab?
>
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
> " " before "A" here please.
>
>> +#define VARIABLE_MAX_SIZE  32000
>> +
>> +static struct kobject *powerpc_kobj;
>> +static struct secvar_operations *secvarops;
>> +struct kset *secvar_kset;
>> +
>> +static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +			 char *buf)
>> +{
>> +	return sprintf(buf, "%s", kobj->name);
>> +}
> Why do you need this entry as it is the directory name?  Userspace
> already "knows" it if they can open this file.
>
>
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
> __ATTR_RO()?
>
>> +
>> +static struct kobj_attribute size_attr =
>> +__ATTR(size, 0444, size_show, NULL);
> __ATTR_RO()?
>
>> +
>> +static struct bin_attribute data_attr = {
>> +	.attr = {.name = "data", .mode = 0444},
>> +	.size = VARIABLE_MAX_SIZE,
>> +	.read = data_read,
>> +};
> __BIN_ATTR_RO()?
>
>> +
>> +
>> +static struct bin_attribute update_attr = {
>> +	.attr = {.name = "update", .mode = 0200},
>> +	.size = VARIABLE_MAX_SIZE,
>> +	.write = update_write,
>> +};
> __BIN_ATTR_RO()?
>
>
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
> static?
>
>> +
>> +int secvar_sysfs_load(void)
>> +{
>> +
>> +	char *name;
> No blank line.  You didn't run this this through checkpatch, did you :(
>
>
>> +	unsigned long namesize;
>> +	struct kobject *kobj;
>> +	int status;
>> +	int rc = 0;
>> +
>> +	name = kzalloc(1024, GFP_KERNEL);
> Why 1024?
>
>> +	if (!name)
>> +		return -ENOMEM;
>> +
>> +	do {
>> +
>> +		status = secvarops->get_next_variable(name, &namesize, 1024);
>> +		if (status != OPAL_SUCCESS)
>> +			break;
>> +
>> +		pr_info("name is %s\n", name);
> Please delete debugging messages.
>
>> +		kobj = kobject_create_and_add(name, &(secvar_kset->kobj));
>> +		if (kobj) {
>> +			rc = sysfs_create_group(kobj, &secvar_attr_group);
> You just raced userspace and lost :(
>
> If you set your kobj_type to have the attribute group you will not race
> and loose, the core will handle it for you.
>
>
>> +			if (rc)
>> +				pr_err("Error creating attributes for %s variable\n",
>> +				name);
>> +		} else {
>> +			pr_err("Error creating sysfs entry for %s variable\n",
>> +				name);
>> +			rc = -EINVAL;
>> +		}
>> +
>> +	} while ((status == OPAL_SUCCESS) && (rc == 0));
>> +
>> +	kfree(name);
>> +	return rc;
>> +}
>> +
>> +int secvar_sysfs_init(void)
>> +{
>> +	powerpc_kobj = kobject_create_and_add("secvar", firmware_kobj);
>> +	if (!powerpc_kobj) {
>> +		pr_err("secvar: Failed to create firmware kobj\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	secvar_kset = kset_create_and_add("vars", NULL, powerpc_kobj);
>> +	if (!secvar_kset) {
>> +		pr_err("secvar: sysfs kobject registration failed.\n");
> You juat leaked a kobject :(
>
>> +		return -ENODEV;
>> +	}
>> +
>> +	secvarops = get_secvar_ops();
>> +	if (!secvarops) {
>> +		kobject_put(powerpc_kobj);
>> +		pr_err("secvar: failed to retrieve secvar operations.\n");
>> +		return -ENODEV;
> You just leaked 2 things from above :(
>
>> +	}
>> +
>> +	secvar_sysfs_load();
>> +	pr_info("Secure variables sysfs initialized");
> Do not be noisy when all goes just fine.  The kernel log should be quiet
> when all goes well.
>

Thanks Greg for feedback. I just posted v3 version with the fixes 
suggested by you and Oliver.

Currently, the name length as 1024 is taken from examples of efivars. 
Probably a smaller one is fine.
In v3 version, it is still 1024 but made it #define.

Thanks & Regards,
       - Nayna


--------------EBEEC4AFFD0EEB170C618A67
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
    <div class="moz-cite-prefix">On 08/21/2019 12:30 PM, Greg
      Kroah-Hartman wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20190821163018.GA28571@kroah.com">
      <pre wrap="">On Wed, Aug 21, 2019 at 11:08:21AM -0400, Nayna Jain wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">--- /dev/null
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
</pre>
      </blockquote>
      <pre wrap="">Can you break this out into one-entry-per-file like most other entries
are defined?  That makes it easier for tools to parse (specifically the
tool in the tree right now...)



</pre>
      <blockquote type="cite">
        <pre wrap="">diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 42109682b727..b4bdf77837b2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -925,6 +925,15 @@ config PPC_SECURE_BOOT
 	  allows user to enable OS Secure Boot on PowerPC systems that
 	  have firmware secure boot support.
 
+config SECVAR_SYSFS
+        tristate "Enable sysfs interface for POWER secure variables"
+        depends on PPC_SECURE_BOOT
</pre>
      </blockquote>
      <pre wrap="">No depends on SYSFS?

</pre>
      <blockquote type="cite">
        <pre wrap="">+        help
+          POWER secure variables are managed and controlled by firmware.
+          These variables are exposed to userspace via sysfs to enable
+          read/write operations on these variables. Say Y if you have
+	  secure boot enabled and want to expose variables to userspace.
</pre>
      </blockquote>
      <pre wrap="">Mix of tabs and spaces :(

</pre>
      <blockquote type="cite">
        <pre wrap="">+
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
</pre>
      </blockquote>
      <pre wrap="">No tab?

</pre>
      <blockquote type="cite">
        <pre wrap=""> 
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
</pre>
      </blockquote>
      <pre wrap="">" " before "A" here please.

</pre>
      <blockquote type="cite">
        <pre wrap="">+#define VARIABLE_MAX_SIZE  32000
+
+static struct kobject *powerpc_kobj;
+static struct secvar_operations *secvarops;
+struct kset *secvar_kset;
+
+static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sprintf(buf, "%s", kobj-&gt;name);
+}
</pre>
      </blockquote>
      <pre wrap="">Why do you need this entry as it is the directory name?  Userspace
already "knows" it if they can open this file.


</pre>
      <blockquote type="cite">
        <pre wrap="">+
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
</pre>
      </blockquote>
      <pre wrap="">__ATTR_RO()?

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+static struct kobj_attribute size_attr =
+__ATTR(size, 0444, size_show, NULL);
</pre>
      </blockquote>
      <pre wrap="">__ATTR_RO()?

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+static struct bin_attribute data_attr = {
+	.attr = {.name = "data", .mode = 0444},
+	.size = VARIABLE_MAX_SIZE,
+	.read = data_read,
+};
</pre>
      </blockquote>
      <pre wrap="">__BIN_ATTR_RO()?

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+
+static struct bin_attribute update_attr = {
+	.attr = {.name = "update", .mode = 0200},
+	.size = VARIABLE_MAX_SIZE,
+	.write = update_write,
+};
</pre>
      </blockquote>
      <pre wrap="">__BIN_ATTR_RO()?


</pre>
      <blockquote type="cite">
        <pre wrap="">+
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
</pre>
      </blockquote>
      <pre wrap="">static?

</pre>
      <blockquote type="cite">
        <pre wrap="">+
+int secvar_sysfs_load(void)
+{
+
+	char *name;
</pre>
      </blockquote>
      <pre wrap="">No blank line.  You didn't run this this through checkpatch, did you :(


</pre>
      <blockquote type="cite">
        <pre wrap="">+	unsigned long namesize;
+	struct kobject *kobj;
+	int status;
+	int rc = 0;
+
+	name = kzalloc(1024, GFP_KERNEL);
</pre>
      </blockquote>
      <pre wrap="">Why 1024?

</pre>
      <blockquote type="cite">
        <pre wrap="">+	if (!name)
+		return -ENOMEM;
+
+	do {
+
+		status = secvarops-&gt;get_next_variable(name, &amp;namesize, 1024);
+		if (status != OPAL_SUCCESS)
+			break;
+
+		pr_info("name is %s\n", name);
</pre>
      </blockquote>
      <pre wrap="">Please delete debugging messages.

</pre>
      <blockquote type="cite">
        <pre wrap="">+		kobj = kobject_create_and_add(name, &amp;(secvar_kset-&gt;kobj));
+		if (kobj) {
+			rc = sysfs_create_group(kobj, &amp;secvar_attr_group);
</pre>
      </blockquote>
      <pre wrap="">You just raced userspace and lost :(

If you set your kobj_type to have the attribute group you will not race
and loose, the core will handle it for you.


</pre>
      <blockquote type="cite">
        <pre wrap="">+			if (rc)
+				pr_err("Error creating attributes for %s variable\n",
+				name);
+		} else {
+			pr_err("Error creating sysfs entry for %s variable\n",
+				name);
+			rc = -EINVAL;
+		}
+
+	} while ((status == OPAL_SUCCESS) &amp;&amp; (rc == 0));
+
+	kfree(name);
+	return rc;
+}
+
+int secvar_sysfs_init(void)
+{
+	powerpc_kobj = kobject_create_and_add("secvar", firmware_kobj);
+	if (!powerpc_kobj) {
+		pr_err("secvar: Failed to create firmware kobj\n");
+		return -ENODEV;
+	}
+
+	secvar_kset = kset_create_and_add("vars", NULL, powerpc_kobj);
+	if (!secvar_kset) {
+		pr_err("secvar: sysfs kobject registration failed.\n");
</pre>
      </blockquote>
      <pre wrap="">You juat leaked a kobject :(

</pre>
      <blockquote type="cite">
        <pre wrap="">+		return -ENODEV;
+	}
+
+	secvarops = get_secvar_ops();
+	if (!secvarops) {
+		kobject_put(powerpc_kobj);
+		pr_err("secvar: failed to retrieve secvar operations.\n");
+		return -ENODEV;
</pre>
      </blockquote>
      <pre wrap="">You just leaked 2 things from above :(

</pre>
      <blockquote type="cite">
        <pre wrap="">+	}
+
+	secvar_sysfs_load();
+	pr_info("Secure variables sysfs initialized");
</pre>
      </blockquote>
      <pre wrap="">Do not be noisy when all goes just fine.  The kernel log should be quiet
when all goes well.

</pre>
    </blockquote>
    <br>
    Thanks Greg for feedback. I just posted v3 version with the fixes
    suggested by you and Oliver.<br>
    <br>
    Currently, the name length as 1024 is taken from examples of
    efivars. Probably a smaller one is fine.<br>
    In v3 version, it is still 1024 but made it #define.<br>
    <br>
    Thanks &amp; Regards,<br>
          - Nayna<br>
    <br>
  </body>
</html>

--------------EBEEC4AFFD0EEB170C618A67--

