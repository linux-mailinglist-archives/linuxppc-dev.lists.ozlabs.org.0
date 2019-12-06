Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEFC1157B0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 20:19:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47V2Sk6TKhzDqhD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 06:19:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47V2Pt28c3zDqf9
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2019 06:16:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47V2Pt0Fxfz8t1Z
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2019 06:16:34 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47V2Ps5LsZz9sR0; Sat,  7 Dec 2019 06:16:33 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47V2Ps1J0kz9sPf
 for <linuxppc-dev@ozlabs.org>; Sat,  7 Dec 2019 06:16:32 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6JC8xB059563
 for <linuxppc-dev@ozlabs.org>; Fri, 6 Dec 2019 14:16:31 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq55txcgn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 06 Dec 2019 14:16:31 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Fri, 6 Dec 2019 19:16:28 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Dec 2019 19:16:26 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB6JGPWr60489848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Dec 2019 19:16:25 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5111D42049;
 Fri,  6 Dec 2019 19:16:25 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 902D14204B;
 Fri,  6 Dec 2019 19:16:23 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.71.21])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Dec 2019 19:16:23 +0000 (GMT)
Subject: Re: [PATCH v4 4/6] powerpc/powernv: move core and
 fadump_release_opalcore under new kobject
To: Greg KH <gregkh@linuxfoundation.org>
References: <20191206122434.29587-1-sourabhjain@linux.ibm.com>
 <20191206122434.29587-5-sourabhjain@linux.ibm.com>
 <20191206124801.GD1360047@kroah.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
Date: Sat, 7 Dec 2019 00:46:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191206124801.GD1360047@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19120619-0008-0000-0000-0000033E5B01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120619-0009-0000-0000-00004A5D8325
Message-Id: <d22893e3-41e0-c8db-9262-670f90536816@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_06:2019-12-05,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912060154
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
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org, mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/6/19 6:18 PM, Greg KH wrote:
> On Fri, Dec 06, 2019 at 05:54:32PM +0530, Sourabh Jain wrote:
>> The /sys/firmware/opal/core and /sys/kernel/fadump_release_opalcore sysfs
>> files are used to export and release the OPAL memory on PowerNV platform.
>> let's organize them into a new kobject under /sys/firmware/opal/mpipl/
>> directory.
>>
>> A symlink is added to maintain the backward compatibility for
>> /sys/firmware/opal/core sysfs file.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>  .../sysfs-kernel-fadump_release_opalcore      |  2 ++
>>  .../powerpc/firmware-assisted-dump.rst        | 15 +++++----
>>  arch/powerpc/platforms/powernv/opal-core.c    | 31 ++++++++++++++-----
>>  3 files changed, 34 insertions(+), 14 deletions(-)
>>  rename Documentation/ABI/{testing => removed}/sysfs-kernel-fadump_release_opalcore (82%)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore b/Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
>> similarity index 82%
>> rename from Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
>> rename to Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
>> index 53313c1d4e7a..a8d46cd0f4e6 100644
>> --- a/Documentation/ABI/testing/sysfs-kernel-fadump_release_opalcore
>> +++ b/Documentation/ABI/removed/sysfs-kernel-fadump_release_opalcore
>> @@ -1,3 +1,5 @@
>> +This ABI is moved to /sys/firmware/opal/mpipl/release_core.
>> +
>>  What:		/sys/kernel/fadump_release_opalcore
>>  Date:		Sep 2019
>>  Contact:	linuxppc-dev@lists.ozlabs.org
>> diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
>> index 0455a78486d5..345a3405206e 100644
>> --- a/Documentation/powerpc/firmware-assisted-dump.rst
>> +++ b/Documentation/powerpc/firmware-assisted-dump.rst
>> @@ -112,13 +112,13 @@ to ensure that crash data is preserved to process later.
>>  
>>  -- On OPAL based machines (PowerNV), if the kernel is build with
>>     CONFIG_OPAL_CORE=y, OPAL memory at the time of crash is also
>> -   exported as /sys/firmware/opal/core file. This procfs file is
>> +   exported as /sys/firmware/opal/mpipl/core file. This procfs file is
>>     helpful in debugging OPAL crashes with GDB. The kernel memory
>>     used for exporting this procfs file can be released by echo'ing
>> -   '1' to /sys/kernel/fadump_release_opalcore node.
>> +   '1' to /sys/firmware/opal/mpipl/release_core node.
>>  
>>     e.g.
>> -     # echo 1 > /sys/kernel/fadump_release_opalcore
>> +     # echo 1 > /sys/firmware/opal/mpipl/release_core
>>  
>>  Implementation details:
>>  -----------------------
>> @@ -283,14 +283,17 @@ Here is the list of files under kernel sysfs:
>>      enhanced to use this interface to release the memory reserved for
>>      dump and continue without 2nd reboot.
>>  
>> - /sys/kernel/fadump_release_opalcore
>> +Note: /sys/kernel/fadump_release_opalcore sysfs has moved to
>> +      /sys/firmware/opal/mpipl/release_core
>> +
>> + /sys/firmware/opal/mpipl/release_core
>>  
>>      This file is available only on OPAL based machines when FADump is
>>      active during capture kernel. This is used to release the memory
>> -    used by the kernel to export /sys/firmware/opal/core file. To
>> +    used by the kernel to export /sys/firmware/opal/mpipl/core file. To
>>      release this memory, echo '1' to it:
>>  
>> -    echo 1  > /sys/kernel/fadump_release_opalcore
>> +    echo 1  > /sys/firmware/opal/mpipl/release_core
>>  
>>  Here is the list of files under powerpc debugfs:
>>  (Assuming debugfs is mounted on /sys/kernel/debug directory.)
>> diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
>> index ed895d82c048..7fcc092d065e 100644
>> --- a/arch/powerpc/platforms/powernv/opal-core.c
>> +++ b/arch/powerpc/platforms/powernv/opal-core.c
>> @@ -589,7 +589,8 @@ static ssize_t fadump_release_opalcore_store(struct kobject *kobj,
>>  	return count;
>>  }
>>  
>> -static struct kobj_attribute opalcore_rel_attr = __ATTR(fadump_release_opalcore,
>> +struct kobject *mpipl_kobj;
>> +static struct kobj_attribute opalcore_rel_attr = __ATTR(release_core,
>>  						0200, NULL,
>>  						fadump_release_opalcore_store);
> 
> __ATTR_WO()?

Thanks :)
> 
>>  
>> @@ -609,7 +610,7 @@ static int __init opalcore_init(void)
>>  	 * then capture the dump.
>>  	 */
>>  	if (!(is_opalcore_usable())) {
>> -		pr_err("Failed to export /sys/firmware/opal/core\n");
>> +		pr_err("Failed to export /sys/firmware/opal/mpipl/core\n");
>>  		opalcore_cleanup();
>>  		return rc;
>>  	}
>> @@ -617,18 +618,32 @@ static int __init opalcore_init(void)
>>  	/* Set OPAL core file size */
>>  	opal_core_attr.size = oc_conf->opalcore_size;
>>  
>> +	mpipl_kobj = kobject_create_and_add("mpipl", opal_kobj);
>> +	if (!mpipl_kobj) {
>> +		pr_err("unable to create mpipl kobject\n");
>> +		return -ENOMEM;
>> +	}
>> +
>>  	/* Export OPAL core sysfs file */
>> -	rc = sysfs_create_bin_file(opal_kobj, &opal_core_attr);
>> +	rc = sysfs_create_bin_file(mpipl_kobj, &opal_core_attr);
> 
> Again, create an attribute group and add everything all at once, makes
> it much simpler and your error cleanup logic will actually work :)

Agree.

Thanks,
Sourabh Jain

