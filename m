Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B9876CAD9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 12:28:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KuWpg6EU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RG7Vr4451z3bT8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 20:28:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KuWpg6EU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RG7Tw2xQlz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 20:28:03 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 372ALkVA009640;
	Wed, 2 Aug 2023 10:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=oXj7HSyRMTqBviVL7YcF6pGvHG1VoYSfKB3xdnnZr9Q=;
 b=KuWpg6EUIgQA5clG/1yO//r6zXqthcer+Z3mD5V7UpWiRNiWNKppCzptUnON+qt010IO
 /5qP9ti86M8Vci5A7Wg7urCkjYayfkQOytL4I5a4ocCN6SSvx+CEjR5H96eTRDQAJ63a
 NEY7oOUThsGrou3+U9V7U7bQB9ogyMULg7I6xA7DawNAsexHQFnKiZW7tZoG9uJGdr27
 RqUINTcn52ATpmnyUBTX3Q9RLviqPDdPpjfFVUXkRvkvd0KkU/msG8dxw7/LHaqDndf5
 kFqr2xxt7nv6fOFEXrfOLZ02YPGp0OfYGTLxSTiAmjhAfYUDl5yab04aQpre6WQWVr6q ww== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s7nax065g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 10:27:56 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3728cHQX014537;
	Wed, 2 Aug 2023 10:27:55 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5ft1k3mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 10:27:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 372ARq6a42729854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Aug 2023 10:27:52 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 365882004D;
	Wed,  2 Aug 2023 10:27:52 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A9A602004F;
	Wed,  2 Aug 2023 10:27:50 +0000 (GMT)
Received: from [9.203.106.137] (unknown [9.203.106.137])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Aug 2023 10:27:50 +0000 (GMT)
Message-ID: <1f26411c-34b9-14e8-66eb-4854d5b1fbbb@linux.ibm.com>
Date: Wed, 2 Aug 2023 15:57:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [next-20230731] Kdump fails to capture vmcore (powerpc)
To: Sachin Sant <sachinp@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mm@kvack.org
References: <F996AB3C-400E-447A-B142-9CB3600BCDD8@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <F996AB3C-400E-447A-B142-9CB3600BCDD8@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: R3CV6zB-xe7IR6XXK__oDj9g4eFKtygh
X-Proofpoint-GUID: R3CV6zB-xe7IR6XXK__oDj9g4eFKtygh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_05,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 impostorscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020089
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 31/07/23 7:39 pm, Sachin Sant wrote:
> Kernel Crash dump(kdump) and firmware assisted dump on powerpc
> fails to capture vmcore on recent linux-next builds.
> 
> Starting Kdump Vmcore Save Service...
> systemd[1]: Starting Kdump Vmcore Save Service...
> kdump[599]: Kdump is using the default log level(3).
> kdump[635]: saving to /sysroot/var/crash/127.0.0.1-2023-07-31-09:01:28/
> kdump[639]: Remounting the dump target in rw mode.
> kdump[643]: saving vmcore-dmesg.txt to /sysroot/var/crash/127.0.0.1-2023-07-31-09:01:28/
> kdump[649]: saving vmcore-dmesg.txt complete
> kdump[651]: saving vmcore
> kdump.sh[652]: readpage_elf: Attempt to read non-existent page at 0x4000000000000000.
> kdump.sh[652]: readmem: type_addr: 0, addr:0, size:8
> kdump.sh[652]: get_vmemmap_list_info: Can't get vmemmap region addresses
> kdump.sh[652]: get_machdep_info_ppc64: Can't get vmemmap list info.
> kdump.sh[652]: makedumpfile Failed.
> kdump[654]: saving vmcore failed, exitcode:1
> kdump[656]: saving the /run/initramfs/kexec-dmesg.log to /sysroot/var/crash/127.0.0.1-2023-07-31-09:01:28//
> kdump[663]: saving vmcore failed
> systemd[1]: kdump-capture.service: Main process exited, code=exited, status=1/FAILURE
> systemd[1]: kdump-capture.service: Failed with result 'exit-code'.
> systemd[1]: Failed to start Kdump Vmcore Save Service.
> [FAILED] Failed to start Kdump Vmcore Save Service.
> 
> Git bisect points to following patch:
> 
> 8dc9a0ad0c3e7f43e4e091e4e24634e21ce17a54 is the first bad commit
> commit 8dc9a0ad0c3e7f43e4e091e4e24634e21ce17a54
>      powerpc/book3s64/vmemmap: switch radix to use a different vmemmap handling function
> 

Earlier, makedumpfile made use of vmemmap_list to populate all the
vmemmap regions but that changed for radix. It uses the init_mm pgtable
for vmemmap regions. A fix is needed in makedumpfile to catch up with
the above change.

Thanks
Hari
