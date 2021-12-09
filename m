Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4896446E977
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 14:54:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8wWJ1MDFz3cFX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 00:54:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MMHipn05;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MMHipn05; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8wVW0PDYz30J3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 00:53:38 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9CRj6s031341; 
 Thu, 9 Dec 2021 13:53:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=c8YtCvCAGQ4Tu561RayOzbKX1N47zM/ybeJ2/SrfPFI=;
 b=MMHipn05aFE4waBi2SLicO5sqTjDwY5W+4r/i24niPEOMv4IsUgXvBjvFyXcqPqq2NR1
 hEiHqPU2+AfAlKtC1Em5Ht3ELxTpLsb1BCJg7RSxBYwvB9PHGu/aIFfQhtdUI165x9AG
 jU2+siyEPdYN5xlJRMfG6o73FYMXryVCIxCvIJ6baYKgsJuND+XBqeO5cEfUPt6NGt7r
 QnZHoW2hZBIPf4c9H1PCb0rtEkCmQQsM5grxfhY2+6wI2tF8i0jrLSgbw0QKQSXAEu0S
 TC6jL5x0k5twph89GcvFwYigoRadfXz/WCMfMIGnyVUOUOn5DaIntdOAvB/+yfgGzPzX ug== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cuhty9s1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 13:53:34 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B9DoG6i010109;
 Thu, 9 Dec 2021 13:53:34 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 3cqyyc7f4j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 13:53:34 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B9DrW9U59441422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 13:53:32 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D67F136060;
 Thu,  9 Dec 2021 13:53:32 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FE1E13605D;
 Thu,  9 Dec 2021 13:53:32 +0000 (GMT)
Received: from localhost (unknown [9.211.99.77])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  9 Dec 2021 13:53:31 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/pseries: read the lpar name from the firmware
In-Reply-To: <b6edbf96-4349-c39b-69ee-477b4fdef511@linux.ibm.com>
References: <20211203154321.13168-1-ldufour@linux.ibm.com>
 <87bl1so588.fsf@linux.ibm.com>
 <bbaa0d78-a09f-3ce3-25a9-67434039b741@linux.ibm.com>
 <878rwwny1l.fsf@linux.ibm.com>
 <21eb4749-42b1-da78-8833-00d360fa36e5@linux.ibm.com>
 <874k7jnmva.fsf@linux.ibm.com>
 <b6edbf96-4349-c39b-69ee-477b4fdef511@linux.ibm.com>
Date: Thu, 09 Dec 2021 07:53:31 -0600
Message-ID: <871r2lopes.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XBwauaLaJGyFMo57yK5ySV-8yheZrRmR
X-Proofpoint-ORIG-GUID: XBwauaLaJGyFMo57yK5ySV-8yheZrRmR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_04,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090075
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

Laurent Dufour <ldufour@linux.ibm.com> writes:
> On 08/12/2021, 16:21:29, Nathan Lynch wrote:
>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>> On 07/12/2021, 18:07:50, Nathan Lynch wrote:
>>>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>>>> On 07/12/2021, 15:32:39, Nathan Lynch wrote:
>>>>>> Is there a reasonable fallback for VMs where this parameter doesn't
>>>>>> exist? PowerVM partitions should always have it, but what do we want the
>>>>>> behavior to be on other hypervisors?
>>>>>
>>>>> In that case, there is no value displayed in the /proc/powerpc/lparcfg and
>>>>> the lparstat -i command will fall back to the device tree value. I can't
>>>>> see any valid reason to report the value defined in the device tree
>>>>> here.
>>>>
>>>> Here's a valid reason :-)
>>>>
>>>> lparstat isn't the only possible consumer of the interface, and the
>>>> 'ibm,partition-name' property and the dynamic system parameter clearly
>>>> serve a common purpose. 'ibm,partition-name' is provided by qemu.
>>>
>>> If the hypervisor is not providing this value, this is not the goal of this
>>> interface to fetch it from the device tree.
>>>
>>> Any consumer should be able to fall back on the device tree value, and
>>> there is no added value to do such a trick in the kernel when it can be
>>> done in the user space.
>> 
>> There is value in imposing a level of abstraction so that the semantics
>> are:
>> 
>> * Report the name assigned to the guest by the hosting environment, if
>>   available
>> 
>> as opposed to
>> 
>> * Return the string returned by a RTAS call to ibm,get-system-parameter
>>   with token 55, if implemented
>> 
>> The benefit is that consumers of lparcfg do not have to be coded with
>> the knowledge that "if a partition_name= line is absent, the
>> ibm,get-system-parameter RTAS call must have failed, so now I should
>> read /sys/firmware/devicetree/base/ibm,partition_name." That's the sort
>> of esoterica that is appropriate for the kernel to encapsulate.
>> 
>> And I'd say the effort involved (falling back to a root node property
>> lookup) is proportional to the benefit.
>> 
>
> I don't agree.
> From the kernel point of view, I can't see any benefit, this is adding more
> complexity to do in the kernel what can be done easily in user space.

Applying this logic, I don't see how adding this to lparcfg would be
justified at all, because user space can already get at the parameter
using the privileged rtas syscall. Publish it to unprivileged programs
over D-Bus or something. That would minimize complexity for the kernel.

