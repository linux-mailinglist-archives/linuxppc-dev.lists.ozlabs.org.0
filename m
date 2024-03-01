Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BCF86DAF9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 06:15:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AdVATzUm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmGVr6w2Mz3vZF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 16:15:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AdVATzUm;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmGV63sM2z3dVv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 16:14:22 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TmGV06kx3z4wc1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 16:14:16 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TmGV06Hskz4wyh; Fri,  1 Mar 2024 16:14:16 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AdVATzUm;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TmGV03Lcnz4wc1
	for <linuxppc-dev@ozlabs.org>; Fri,  1 Mar 2024 16:14:16 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4215954T005398;
	Fri, 1 Mar 2024 05:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JX6eSvoNUnWfKDMb2h6OWhmreqplk4n9Il8ykxlGp3M=;
 b=AdVATzUmOoNEQ9mLog5p4g38qUeI6Eien0L47fgzj4QriuNnnEFEZQTxucgB7eQwQLgr
 iQHJTms8w1DY+ZBDnj+5yBW3A99a4svPVgqmbV2S/vx/FCoJXSRNIsSTGUG6T4n1FOR6
 W8vggbZLrkso82jkrBnU7AqobqoDU4W1MovSfVDj6QL/ORFKmmZcJjr4AhJ2Gj+tDPPS
 EU7LymATw++X7X+uWuyFlT637Sl+ArpzxGRTWTrEhiZx/15hXKh6evG1tPcJN3CJCfrY
 xjX0Cxq67SfzOrvdUbeUDvZy0krt2y5QwaiynqdXzg6BIJDIg6Td9YJ0h98R6s2hnSQQ fw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wk8m6g34p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 05:13:35 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42159Pux006313;
	Fri, 1 Mar 2024 05:13:35 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wk8m6g34f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 05:13:34 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4211hHXl021316;
	Fri, 1 Mar 2024 05:13:34 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfuspja0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 05:13:33 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4215DSUx24117966
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Mar 2024 05:13:30 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32E972004D;
	Fri,  1 Mar 2024 05:13:28 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0AF8B20040;
	Fri,  1 Mar 2024 05:13:20 +0000 (GMT)
Received: from [9.43.93.212] (unknown [9.43.93.212])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  1 Mar 2024 05:13:19 +0000 (GMT)
Message-ID: <9dd60fea-5b6c-409d-bc55-8e27545b47d4@linux.ibm.com>
Date: Fri, 1 Mar 2024 10:43:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 0/6] powerpc/crash: Kernel handling of CPU and memory
 hotplug
To: Baoquan He <bhe@redhat.com>
References: <20240226084118.16310-1-sourabhjain@linux.ibm.com>
 <ZeCL1EsQ/vLojCYs@MiWiFi-R3L-srv>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <ZeCL1EsQ/vLojCYs@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9u_Dv4MsjhfHbNzgxaoNunXKjOOrmFVH
X-Proofpoint-ORIG-GUID: -CQuMvGu3TPMfEpKcApoepztV5yUUGMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_02,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=930
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2403010041
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Baoquan,

On 29/02/24 19:21, Baoquan He wrote:
> Hi Sourabh,
>
> On 02/26/24 at 02:11pm, Sourabh Jain wrote:
>> Commit 247262756121 ("crash: add generic infrastructure for crash
>> hotplug support") added a generic infrastructure that allows
>> architectures to selectively update the kdump image component during CPU
>> or memory add/remove events within the kernel itself.
>>
>> This patch series adds crash hotplug handler for PowerPC and enable
>> support to update the kdump image on CPU/Memory add/remove events.
>>
>> Among the 5 patches in this series, the first two patches make changes
>> to the generic crash hotplug handler to assist PowerPC in adding support
>> for this feature. The last three patches add support for this feature.
> The whole series looks good to me. I have acked patch 1 and 2. Leave
> those three ppc patches to ppc expert to review and approve. Thanks a
> lot for your great work.
Thanks for your feedback. I will soon send v18 to fix the two mirror 
document issues
and will look forward to PPC maintainers to provide feedback on the rest 
of the series.

Appreciate your support!

- Sourabh
