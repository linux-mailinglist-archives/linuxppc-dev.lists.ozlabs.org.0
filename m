Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B19B17D0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 06:55:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46V3HP28wczF4l9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 14:55:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46V3F74Y7FzF56H
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 14:53:47 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8D4qPR3080705; Fri, 13 Sep 2019 00:53:41 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uytcjgv0j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Sep 2019 00:53:41 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8D4nxwL017729;
 Fri, 13 Sep 2019 04:53:40 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 2uyw58keq4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Sep 2019 04:53:40 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8D4rd2M59310404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 04:53:39 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BBD66E04C;
 Fri, 13 Sep 2019 04:53:39 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D456F6E04E;
 Fri, 13 Sep 2019 04:53:37 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.124.35.160])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 13 Sep 2019 04:53:37 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, cam@neo-zeon.de
Subject: Re: [Bug 204789] New: Boot failure with more than 256G of memory
In-Reply-To: <20190911073153.9df4d4618d7f99752cd18edd@linux-foundation.org>
References: <bug-204789-27@https.bugzilla.kernel.org/>
 <20190911073153.9df4d4618d7f99752cd18edd@linux-foundation.org>
Date: Fri, 13 Sep 2019 10:23:35 +0530
Message-ID: <875zlw7q5s.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-13_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909130050
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
Cc: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Morton <akpm@linux-foundation.org> writes:

> (switched to email.  Please respond via emailed reply-to-all, not via the
> bugzilla web interface).
>
> On Sun, 08 Sep 2019 00:04:26 +0000 bugzilla-daemon@bugzilla.kernel.org wrote:
>
>> https://bugzilla.kernel.org/show_bug.cgi?id=204789
>> 
>>             Bug ID: 204789
>>            Summary: Boot failure with more than 256G of memory
>>            Product: Memory Management
>>            Version: 2.5
>>     Kernel Version: 5.2.x
>>           Hardware: PPC-64
>>                 OS: Linux
>>               Tree: Mainline
>>             Status: NEW
>>           Severity: high
>>           Priority: P1
>>          Component: Other
>>           Assignee: akpm@linux-foundation.org
>>           Reporter: cam@neo-zeon.de
>>         Regression: No
>
> "Yes" :)
>
>> Kernel series 5.2.x will not boot on my Talos II workstation with dual POWER9
>> 18 core processors and 512G of physical memory with disable_radix=yes and 4k
>> pages.
>> 
>> 5.3-rc6 did not work either.
>> 
>> 5.1 and earlier boot fine. 
>
> Thanks.  It's probably best to report this on the powerpc list, cc'ed here.
>
>> I can get the system to boot IF I leave the Radix MMU enabled or if I boot a
>> kernel with 64k pages. I haven't yet tested enabling the Radix MMU with 64k
>> pages at the same time, but I suspect this would work. This is a system I
>> cannot take down TOO frequently.
>> 
>> The system will also boot with the Radix MMU disabled and 4k pages with 256G or
>> less memory. Setting mem on the kernel CLI to 256G or less results in a
>> successful boot. Setting mem=257G or higher no Radix MMU and 4k pages and the
>> kernel will not boot.
>> 
>> Petitboot comes up, but the system fails VERY early in boot in the serial
>> console with:
>> SIGTERM received, booting...
>> [   23.838858] kexec_core: Starting new kernel
>> 
>> Early printk is enabled, and it never progresses any further.
>> 
>> 5.1 boots just fine with the Radix MMU disabled and 4k pages.
>> 
>> Unfortunately, I currently need 4k pages for bcache to work, and Radix MMU
>> disabled in order for FreeBSD 12.x to work under KVM so I'm sticking with
>> 5.1.21 for now.
>> 
>> I have been unable to reproduce this issue in KVM.
>> 
>> Here are my PCIe peripherals:
>> 1. Microsemi/Adaptec HBA 1100-4i SAS controller
>> 2. Megaraid 9316-16i SAS RAID controller.
>> 
>> I've only tried little endian as this is a little endian install.

Will you be able to bisect this? I tried 4K PAGESIZE on P8 with upstream
kernel and I can't recreate the issuue.

[root@ltc ~]# free -g
              total        used        free      shared  buff/cache   available
Mem:            495           0         494           0           0         493
Swap:             0           0           0
[root@ltc ~]# getconf PAGESIZE
4096
[root@ltc ~]# grep Hash /proc/cpuinfo 
MMU             : Hash

I will see if I can get a P9 system with largemem

-aneesh
