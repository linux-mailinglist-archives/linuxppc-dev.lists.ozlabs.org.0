Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B90E10A985
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 05:57:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47N7mg02shzDqkW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 15:57:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47N7j55hy8zDqkT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 15:54:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47N7j534VQz8t4D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 15:54:17 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47N7j51g98z9sSr; Wed, 27 Nov 2019 15:54:17 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47N7j447VMz9sSp
 for <linuxppc-dev@ozlabs.org>; Wed, 27 Nov 2019 15:54:15 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAR4ljTv101405
 for <linuxppc-dev@ozlabs.org>; Tue, 26 Nov 2019 23:54:13 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxhgqp4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 26 Nov 2019 23:54:12 -0500
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Wed, 27 Nov 2019 04:54:11 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 27 Nov 2019 04:54:09 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAR4s8vJ37945446
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 04:54:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C4D15207A;
 Wed, 27 Nov 2019 04:54:08 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.154])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 20BB952050;
 Wed, 27 Nov 2019 04:54:06 +0000 (GMT)
Subject: Re: [PATCH v3 2/4] powerpc/fadump: reorganize /sys/kernel/fadump_*
 sysfs files
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20191109122339.20484-1-sourabhjain@linux.ibm.com>
 <20191109122339.20484-3-sourabhjain@linux.ibm.com>
 <20191109125933.GF1384@kitsune.suse.cz>
 <8c1ec297-0c34-12de-2528-be436697215a@linux.ibm.com>
 <20191124184059.GP11661@kitsune.suse.cz>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
Date: Wed, 27 Nov 2019 10:24:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191124184059.GP11661@kitsune.suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112704-0028-0000-0000-000003C07E12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112704-0029-0000-0000-0000248382FB
Message-Id: <ea97b5e3-e1e2-2aff-8227-7cfb551c8ebc@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-26_08:2019-11-26,2019-11-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270037
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
Cc: linux-doc@vger.kernel.org, mahesh@linux.vnet.ibm.com, corbet@lwn.net,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/25/19 12:10 AM, Michal Suchánek wrote:
> On Sat, Nov 16, 2019 at 08:07:29PM +0530, Sourabh Jain wrote:
>>
>>
>> On 11/9/19 6:29 PM, Michal Suchánek wrote:
>>> On Sat, Nov 09, 2019 at 05:53:37PM +0530, Sourabh Jain wrote:
>>>> As the number of FADump sysfs files increases it is hard to manage all of
>>>> them inside /sys/kernel directory. It's better to have all the FADump
>>>> related sysfs files in a dedicated directory /sys/kernel/fadump. But in
>>>> order to maintain the backward compatibility the /sys/kernel/fadump_*
>>>> sysfs files are replicated inside /sys/kernel/fadump/ and eventually get
>>>> removed in future.
>>>>
>>>> As the FADump sysfs files are now part of dedicated directory there is no
>>>> need to prefix their name with fadump_, hence sysfs file names are also
>>>> updated. For example fadump_enabled sysfs file is now referred as enabled.
>>>>
>>>> Also consolidate ABI documentation for all the FADump sysfs files in a
>>>> single file Documentation/ABI/testing/sysfs-kernel-fadump.
>>>>
>>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>>> ---
>>>>  Documentation/ABI/testing/sysfs-kernel-fadump | 41 +++++++++++++++++++
>>>>  arch/powerpc/kernel/fadump.c                  | 38 +++++++++++++++++
>>>>  arch/powerpc/platforms/powernv/opal-core.c    | 10 +++--
>>>>  3 files changed, 86 insertions(+), 3 deletions(-)
>>>>  create mode 100644 Documentation/ABI/testing/sysfs-kernel-fadump
>>>>
>>>> diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
>>>> new file mode 100644
>>>> index 000000000000..a77f1a5ba389
>>>> --- /dev/null
>>>> +++ b/Documentation/ABI/testing/sysfs-kernel-fadump
>>>> @@ -0,0 +1,41 @@
>>>> +What:		/sys/kernel/fadump/*
>>>> +Date:		Nov 2019
>>>> +Contact:	linuxppc-dev@lists.ozlabs.org
>>>> +Description:
>>>> +		The /sys/kernel/fadump/* is a collection of FADump sysfs
>>>> +		file provide information about the configuration status
>>>> +		of Firmware Assisted Dump (FADump).
>>>> +
>>>> +What:		/sys/kernel/fadump/enabled
>>>> +Date:		Nov 2019
>>>> +Contact:	linuxppc-dev@lists.ozlabs.org
>>>> +Description:	read only
>>>> +		Primarily used to identify whether the FADump is enabled in
>>>> +		the kernel or not.
>>>> +User:		Kdump service
>>>> +
>>>> +What:		/sys/kernel/fadump/registered
>>>> +Date:		Nov 2019
>>>> +Contact:	linuxppc-dev@lists.ozlabs.org
>>>> +Description:	read/write
>>>> +		Helps to control the dump collect feature from userspace.
>>>> +		Setting 1 to this file enables the system to collect the
>>>> +		dump and 0 to disable it.
>>>> +User:		Kdump service
>>>> +
>>>> +What:		/sys/kernel/fadump/release_mem
>>>> +Date:		Nov 2019
>>>> +Contact:	linuxppc-dev@lists.ozlabs.org
>>>> +Description:	write only
>>>> +		This is a special sysfs file and only available when
>>>> +		the system is booted to capture the vmcore using FADump.
>>>> +		It is used to release the memory reserved by FADump to
>>>> +		save the crash dump.
>>>> +
>>>> +What:		/sys/kernel/fadump/release_opalcore
>>>> +Date:		Nov 2019
>>>> +Contact:	linuxppc-dev@lists.ozlabs.org
>>>> +Description:	write only
>>>> +		The sysfs file is available when the system is booted to
>>>> +		collect the dump on OPAL based machine. It used to release
>>>> +		the memory used to collect the opalcore.
>>>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>>>> index ed59855430b9..a9591def0c84 100644
>>>> --- a/arch/powerpc/kernel/fadump.c
>>>> +++ b/arch/powerpc/kernel/fadump.c
>>>> @@ -1418,6 +1418,9 @@ static int fadump_region_show(struct seq_file *m, void *private)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +struct kobject *fadump_kobj;
>>>> +EXPORT_SYMBOL_GPL(fadump_kobj);
>>>> +
>>>>  static struct kobj_attribute fadump_release_attr = __ATTR(fadump_release_mem,
>>>>  						0200, NULL,
>>>>  						fadump_release_memory_store);
>>>> @@ -1428,6 +1431,16 @@ static struct kobj_attribute fadump_register_attr = __ATTR(fadump_registered,
>>>>  						0644, fadump_register_show,
>>>>  						fadump_register_store);
>>>>  
>>>> +static struct kobj_attribute release_attr = __ATTR(release_mem,
>>>> +						0200, NULL,
>>>> +						fadump_release_memory_store);
>>>> +static struct kobj_attribute enable_attr = __ATTR(enabled,
>>>> +						0444, fadump_enabled_show,
>>>> +						NULL);
>>>> +static struct kobj_attribute register_attr = __ATTR(registered,
>>>> +						0644, fadump_register_show,
>>>> +						fadump_register_store);
>>>> +
>>>>  DEFINE_SHOW_ATTRIBUTE(fadump_region);
>>>>  
>>>>  static void fadump_init_files(void)
>>>> @@ -1435,6 +1448,11 @@ static void fadump_init_files(void)
>>>>  	struct dentry *debugfs_file;
>>>>  	int rc = 0;
>>>>  
>>>> +	fadump_kobj = kobject_create_and_add("fadump", kernel_kobj);
>>>> +	if (!fadump_kobj) {
>>>> +		pr_err("failed to create fadump kobject\n");
>>>> +		return;
>>>> +	}
>>>>  	rc = sysfs_create_file(kernel_kobj, &fadump_attr.attr);
>>>>  	if (rc)
>>>>  		printk(KERN_ERR "fadump: unable to create sysfs file"
>>>> @@ -1458,6 +1476,26 @@ static void fadump_init_files(void)
>>>>  			printk(KERN_ERR "fadump: unable to create sysfs file"
>>>>  				" fadump_release_mem (%d)\n", rc);
>>>>  	}
>>>> +	/* Replicating the following sysfs attributes under FADump kobject.
>>>> +	 *
>>>> +	 *	- fadump_enabled -> enabled
>>>> +	 *	- fadump_registered -> registered
>>>> +	 *	- fadump_release_mem -> release_mem
>>>> +	 */
>>>> +	rc = sysfs_create_file(fadump_kobj, &enable_attr.attr);
>>>> +	if (rc)
>>>> +		pr_err("unable to create enabled sysfs file (%d)\n",
>>>> +		       rc);
>>>> +	rc = sysfs_create_file(fadump_kobj, &register_attr.attr);
>>>> +	if (rc)
>>>> +		pr_err("unable to create registered sysfs file (%d)\n",
>>>> +		       rc);
>>>> +	if (fw_dump.dump_active) {
>>>> +		rc = sysfs_create_file(fadump_kobj, &release_attr.attr);
>>>> +		if (rc)
>>>> +			pr_err("unable to create release_mem sysfs file (%d)\n",
>>>> +			       rc);
>>>> +	}
>>>>  	return;
>>>>  }
>>> Hello,
>>>
>>
>> I’m so sorry for taking this long to write you back. 
>>
>>> wouldn't it make more sense to create the files in the new location and
>>> add a symlink at the old location?
>>
>> There are APIs which allow to create a symlink for an entire kobject but
>> I did not find a way to create symlink of an individual sysfs file.
>>
>> Do you have any approach in mind to achieve the same?
> 
> There is at least one example of plain symlink:
> 
> find /sys -type l -xtype f
> /sys/kernel/security/evm

Yes, there are APIs available in debugfs and securityfs that allow creatinga symlink of sysfs files. But I did not find a generic API at sysfs level tocreate symlink.

Let's wait for others to put in their view on this. Meanwhile, I'll start
exploring how we can replace the older FADump sysfs files with symlink.

Thanks,
Sourabh Jain

