Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CF846C1B2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 18:25:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7nHj3352z307C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 04:25:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ae8k4FGm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ae8k4FGm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7nH21XxZz2yng
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 04:24:45 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B7HMAsl030368; 
 Tue, 7 Dec 2021 17:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lYYtg50oA2KyyjpuKFH4n9B1WD2dth+yMnv3RP8qlTo=;
 b=ae8k4FGmMuXxCn0N1DmZJW5kazO/Su8LOs5LSZPh+eyqTJtbH4x35L/u0jTDmzRKHEgI
 ImAWmqaUjjJJlb705AfEtuNkPrTYIzojPsczb61dbcqNlzg7I/10MK+Ldia06bYA5JHt
 Vw2BmyE1t5AmVpTWEmmeJ3yQg6v24TrlrqEXb6IzUNnwwQHt/GCXmUEEhem4SOOBhoah
 +BMZ0jC721OMICZ9GR4ZzUKBI6uXR1w6z1807teief2qJ9HQBjKZsZ/0d78vQUkdhFW3
 0T3b/LhPYN60a2B4YkA1oBPYnn16mMlUvcbFYcJLgaOQ3grBcogHPBVF99f/fAw1Gb4l jA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ctby001m1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 17:24:42 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B7HNBLP009960;
 Tue, 7 Dec 2021 17:24:40 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3cqyyarr0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Dec 2021 17:24:40 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B7HOaRU29295082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Dec 2021 17:24:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C718CA4055;
 Tue,  7 Dec 2021 17:24:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9784CA404D;
 Tue,  7 Dec 2021 17:24:36 +0000 (GMT)
Received: from [9.145.91.80] (unknown [9.145.91.80])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Dec 2021 17:24:36 +0000 (GMT)
Message-ID: <38aaa1e8-1941-8b84-6cc6-b773f31112f8@linux.ibm.com>
Date: Tue, 7 Dec 2021 18:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v3] powerpc/pseries: read the lpar name from the firmware
Content-Language: en-US
From: Laurent Dufour <ldufour@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20211203154321.13168-1-ldufour@linux.ibm.com>
 <87bl1so588.fsf@linux.ibm.com>
 <bbaa0d78-a09f-3ce3-25a9-67434039b741@linux.ibm.com>
 <878rwwny1l.fsf@linux.ibm.com>
 <21eb4749-42b1-da78-8833-00d360fa36e5@linux.ibm.com>
In-Reply-To: <21eb4749-42b1-da78-8833-00d360fa36e5@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GQ-_jMzMoUxC_JXCill5espuYjR1VA9L
X-Proofpoint-ORIG-GUID: GQ-_jMzMoUxC_JXCill5espuYjR1VA9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-07_07,2021-12-06_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112070106
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07/12/2021, 18:18:40, Laurent Dufour wrote:
> On 07/12/2021, 18:07:50, Nathan Lynch wrote:
>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>> On 07/12/2021, 15:32:39, Nathan Lynch wrote:
>>>> Is there a reasonable fallback for VMs where this parameter doesn't
>>>> exist? PowerVM partitions should always have it, but what do we want the
>>>> behavior to be on other hypervisors?
>>>
>>> In that case, there is no value displayed in the /proc/powerpc/lparcfg and
>>> the lparstat -i command will fall back to the device tree value. I can't
>>> see any valid reason to report the value defined in the device tree
>>> here.
>>
>> Here's a valid reason :-)
>>
>> lparstat isn't the only possible consumer of the interface, and the
>> 'ibm,partition-name' property and the dynamic system parameter clearly
>> serve a common purpose. 'ibm,partition-name' is provided by qemu.
> 
> If the hypervisor is not providing this value, this is not the goal of this
> interface to fetch it from the device tree.
> 
> Any consumer should be able to fall back on the device tree value, and
> there is no added value to do such a trick in the kernel when it can be
> done in the user space.
> 
>> In any case, the function should not print an error when the return
>> value is -3 (parameter not supported).
> 
> That's a valid requirement.

I sent a v4 which is printing an error message even if the parameter is not
supported by the hypervisor.

This is unlikely and since this a call to pr_err_once(), it would be
printed only once, so not really annoying. I don't think a v5 is required
for such a minor message.
