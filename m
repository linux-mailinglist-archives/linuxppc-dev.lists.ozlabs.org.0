Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 775781157B7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 20:22:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47V2Xq6gYczDqZn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Dec 2019 06:22:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47V2TX5qH0zDqfF
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2019 06:19:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47V2TX3RDMz8t1Z
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2019 06:19:44 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47V2TX23L3z9sR7; Sat,  7 Dec 2019 06:19:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47V2TW4PCsz9sR0
 for <linuxppc-dev@ozlabs.org>; Sat,  7 Dec 2019 06:19:43 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6JHLc1142023
 for <linuxppc-dev@ozlabs.org>; Fri, 6 Dec 2019 14:19:41 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wq2twcw42-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 06 Dec 2019 14:19:41 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Fri, 6 Dec 2019 19:19:39 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Dec 2019 19:19:37 -0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xB6JIteD37355782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Dec 2019 19:18:55 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 454AA4204C;
 Fri,  6 Dec 2019 19:19:36 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8ABEB4203F;
 Fri,  6 Dec 2019 19:19:34 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.71.21])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Dec 2019 19:19:34 +0000 (GMT)
Subject: Re: [PATCH v4 6/6] powerpc/fadump: sysfs for fadump memory reservation
To: Greg KH <gregkh@linuxfoundation.org>
References: <20191206122434.29587-1-sourabhjain@linux.ibm.com>
 <20191206122434.29587-7-sourabhjain@linux.ibm.com>
 <20191206124855.GE1360047@kroah.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
Date: Sat, 7 Dec 2019 00:49:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20191206124855.GE1360047@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19120619-0008-0000-0000-0000033E5B24
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120619-0009-0000-0000-00004A5D8348
Message-Id: <dd95f01f-791d-6c6c-e4f5-5824939e01a2@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_06:2019-12-05,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912060155
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
> On Fri, Dec 06, 2019 at 05:54:34PM +0530, Sourabh Jain wrote:
>> Add a sys interface to allow querying the memory reserved by FADump for
>> saving the crash dump.
>>
>> Also added Documentation/ABI for the new sysfs file.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>  Documentation/ABI/testing/sysfs-kernel-fadump    |  7 +++++++
>>  Documentation/powerpc/firmware-assisted-dump.rst |  5 +++++
>>  arch/powerpc/kernel/fadump.c                     | 15 +++++++++++++++
>>  3 files changed, 27 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-kernel-fadump b/Documentation/ABI/testing/sysfs-kernel-fadump
>> index 5d988b919e81..8f7a64a81783 100644
>> --- a/Documentation/ABI/testing/sysfs-kernel-fadump
>> +++ b/Documentation/ABI/testing/sysfs-kernel-fadump
>> @@ -31,3 +31,10 @@ Description:	write only
>>  		the system is booted to capture the vmcore using FADump.
>>  		It is used to release the memory reserved by FADump to
>>  		save the crash dump.
>> +
>> +What:		/sys/kernel/fadump/mem_reserved
>> +Date:		Dec 2019
>> +Contact:	linuxppc-dev@lists.ozlabs.org
>> +Description:	read only
>> +		Provide information about the amount of memory reserved by
>> +		FADump to save the crash dump in bytes.
>> diff --git a/Documentation/powerpc/firmware-assisted-dump.rst b/Documentation/powerpc/firmware-assisted-dump.rst
>> index 365c10209ef3..04993eaf3113 100644
>> --- a/Documentation/powerpc/firmware-assisted-dump.rst
>> +++ b/Documentation/powerpc/firmware-assisted-dump.rst
>> @@ -268,6 +268,11 @@ Here is the list of files under kernel sysfs:
>>      be handled and vmcore will not be captured. This interface can be
>>      easily integrated with kdump service start/stop.
>>  
>> + /sys/kernel/fadump/mem_reserved
>> +
>> +   This is used to display the memory reserved by FADump for saving the
>> +   crash dump.
>> +
>>   /sys/kernel/fadump_release_mem
>>      This file is available only when FADump is active during
>>      second kernel. This is used to release the reserved memory
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index 41a3cda81791..b2af51b7c750 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -1357,6 +1357,13 @@ static ssize_t fadump_enabled_show(struct kobject *kobj,
>>  	return sprintf(buf, "%d\n", fw_dump.fadump_enabled);
>>  }
>>  
>> +static ssize_t fadump_mem_reserved_show(struct kobject *kobj,
>> +					struct kobj_attribute *attr,
>> +					char *buf)
>> +{
>> +	return sprintf(buf, "%ld\n", fw_dump.reserve_dump_area_size);
>> +}
>> +
>>  static ssize_t fadump_register_show(struct kobject *kobj,
>>  					struct kobj_attribute *attr,
>>  					char *buf)
>> @@ -1430,6 +1437,10 @@ static struct kobj_attribute enable_attr = __ATTR(enabled,
>>  static struct kobj_attribute register_attr = __ATTR(registered,
>>  						0644, fadump_register_show,
>>  						fadump_register_store);
>> +static struct kobj_attribute mem_reserved_attr = __ATTR(mem_reserved,
>> +						0444, fadump_mem_reserved_show,
>> +						NULL);
> 
> __ATTRI_RO()?
> 
>> +
>>  
>>  DEFINE_SHOW_ATTRIBUTE(fadump_region);
>>  
>> @@ -1464,6 +1475,10 @@ static void fadump_init_files(void)
>>  			pr_err("unable to create release_mem sysfs file (%d)\n",
>>  			       rc);
>>  	}
>> +	rc = sysfs_create_file(fadump_kobj, &mem_reserved_attr.attr);
>> +	if (rc)
>> +		pr_err("unable to create mem_reserved sysfs file (%d)\n",
>> +		       rc);
> 
> Again, put it in an attribute group, that would have only required one
> line, and not this mess of not cleaning up if something went wrong.


Will make the changes accordingly.


Thanks,
Sourabh Jain

