Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BFB907442
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 15:49:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QNI8xS8o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0P0r4X3mz3cXM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 23:49:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QNI8xS8o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0P070G5xz2ypm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 23:49:10 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45D9uILG029123;
	Thu, 13 Jun 2024 13:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=H
	UNZZ05qLihxDP0emfB43dBkj/5UIjesMQXRHD6OCBI=; b=QNI8xS8o8AXfOcC42
	7yntxyhVcq1EkiR0358YllOJs7Ru5sGHuJJrjMOcc3wBrWACcpDM4AhbOQwssveo
	p9vilOVOZCcjDuS4ndc3GhSq5I6xaediVrbicS0coBhSiGPpjqVMQ0DVTGprE3Nu
	Flrdheh2zJyEn7GPgToZBQQ/6JTDUeno/UChoVYNacY26w+qOzd1BEkFMyV0SW6t
	QSTG8YKn41EdcRNh/neSGoOsB2Dv5q1t43BybDZbOtErKl21uxzFzA5NP0Uj7EKj
	fYcf/82yjssB5ju1WTS2vMpfLFgV+p1oHgpFybHiyQJMzTjc3uMfjf+HtxFbXwYb
	RlTKQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yqpq09qab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 13:49:03 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45DCamtZ008731;
	Thu, 13 Jun 2024 13:49:03 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yn4b3qh0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 13:49:03 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45DDmxxR56164648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Jun 2024 13:49:01 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A44B2004B;
	Thu, 13 Jun 2024 13:48:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AE8020040;
	Thu, 13 Jun 2024 13:48:58 +0000 (GMT)
Received: from [9.171.40.104] (unknown [9.171.40.104])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 13 Jun 2024 13:48:57 +0000 (GMT)
Message-ID: <0bda8914-a417-48f9-90bb-ea68f8acfa13@linux.ibm.com>
Date: Thu, 13 Jun 2024 19:18:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/eeh: avoid possible crash when edev->pdev changes
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20240527075433.415693-1-ganeshgr@linux.ibm.com>
 <87cyoop52k.fsf@mail.lhotse>
Content-Language: en-US
From: Ganesh G R <ganeshgr@linux.ibm.com>
In-Reply-To: <87cyoop52k.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZjB5QD2MiPZx9xB45dHZLqVvvEXeihCX
X-Proofpoint-GUID: ZjB5QD2MiPZx9xB45dHZLqVvvEXeihCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_05,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1011 mlxlogscore=711
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130098
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
Cc: mahesh@linux.ibm.com, wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/11/24 8:18 AM, Michael Ellerman wrote:

> Hi Ganesh,
>
> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>> If a PCI device is removed during eeh_pe_report_edev(), edev->pdev
>> will change and can cause a crash, hold the PCI rescan/remove lock
>> while taking a copy of edev->pdev.
>>
>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/eeh_pe.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
>> index d1030bc52564..49f968733912 100644
>> --- a/arch/powerpc/kernel/eeh_pe.c
>> +++ b/arch/powerpc/kernel/eeh_pe.c
>> @@ -859,7 +859,9 @@ struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe)
>>   
>>   	/* Retrieve the parent PCI bus of first (top) PCI device */
>>   	edev = list_first_entry_or_null(&pe->edevs, struct eeh_dev, entry);
>> +	pci_lock_rescan_remove();
>>   	pdev = eeh_dev_to_pci_dev(edev);
>> +	pci_unlock_rescan_remove();
>>   	if (pdev)
>>   		return pdev->bus;
> What prevents pdev being freed/reused immediately after you drop the
> rescan/remove lock?

Yeah, I should have released the lock after getting bus address, I will send v2.

> AFAICS eeh_dev_to_pci_dev() doesn't take an additional reference to the
> pdev or anything.

Yes, I think we have to evaluate the possible eventualities of not taking the reference
in all the cases.
But we need this lock here because, if the PCI error is encountered in the hotplug remove
path, we need the pci rescan lock to avoid race between hotplug remove path and the bottom
half of EEH recovery, this lets the hotplug remove to complete since it is already holding
the lock and drop the recovery process as the device is no longer present.

