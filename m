Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE29446EC6B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 17:00:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8zJT5BJNz3cN9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 03:00:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f6d6ZJv0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=f6d6ZJv0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8zHm1Bzsz2yNw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 02:59:31 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9FvwtI004239; 
 Thu, 9 Dec 2021 15:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MFHY0V0tY36pni901pqm/AEd5XhOlwZ+lL9Yvdmqi8c=;
 b=f6d6ZJv046A99HUXnD8A3VNvSecou8N5Kb/NLB0B8LWNkxClK834b9xbXuQ+PrxXgAs9
 iEOT7hIPzLT9dKMdonNCKsNrLYnzLWq2T4n64R7dbnOCYTt7ks139xLz+xieehW96SAY
 ekalMgQUKYvutbZ6Wk8uuFfg2qYDnYJ9KOWHM66zeLZYU502uTQ99F352wnBZuACcg3F
 Og/lqkGsF6z6v+M0tgV2H/pOgE3aW4A3AOwhQby8KU2qxrmgwg64M8JGqDaS1ZSsi10I
 pB7E123DypGbmHOPyPgp0Bw6e4BqIKRy6YfDOeDjtc/qNLQduNhvYyxOQtNLQmgAMwPx iw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cumwgg0r8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 15:59:27 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B9FsY9Q029098;
 Thu, 9 Dec 2021 15:59:25 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3cqyya19n1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 15:59:25 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B9FxLIp17433034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 15:59:21 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD66952067;
 Thu,  9 Dec 2021 15:59:21 +0000 (GMT)
Received: from [9.145.152.236] (unknown [9.145.152.236])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 94C145205A;
 Thu,  9 Dec 2021 15:59:21 +0000 (GMT)
Message-ID: <d0c9ac16-eb91-95cc-77bd-08e853e31bd5@linux.ibm.com>
Date: Thu, 9 Dec 2021 16:59:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v3] powerpc/pseries: read the lpar name from the firmware
Content-Language: en-US
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20211203154321.13168-1-ldufour@linux.ibm.com>
 <87bl1so588.fsf@linux.ibm.com>
 <bbaa0d78-a09f-3ce3-25a9-67434039b741@linux.ibm.com>
 <878rwwny1l.fsf@linux.ibm.com>
 <21eb4749-42b1-da78-8833-00d360fa36e5@linux.ibm.com>
 <874k7jnmva.fsf@linux.ibm.com>
 <b6edbf96-4349-c39b-69ee-477b4fdef511@linux.ibm.com>
 <871r2lopes.fsf@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <871r2lopes.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mcmVI1m8o9yneMPQcHaSeOKW0XKOBi5s
X-Proofpoint-GUID: mcmVI1m8o9yneMPQcHaSeOKW0XKOBi5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_07,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090084
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

On 09/12/2021, 14:53:31, Nathan Lynch wrote:
> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> On 08/12/2021, 16:21:29, Nathan Lynch wrote:
>>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>>> On 07/12/2021, 18:07:50, Nathan Lynch wrote:
>>>>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>>>>> On 07/12/2021, 15:32:39, Nathan Lynch wrote:
>>>>>>> Is there a reasonable fallback for VMs where this parameter doesn't
>>>>>>> exist? PowerVM partitions should always have it, but what do we want the
>>>>>>> behavior to be on other hypervisors?
>>>>>>
>>>>>> In that case, there is no value displayed in the /proc/powerpc/lparcfg and
>>>>>> the lparstat -i command will fall back to the device tree value. I can't
>>>>>> see any valid reason to report the value defined in the device tree
>>>>>> here.
>>>>>
>>>>> Here's a valid reason :-)
>>>>>
>>>>> lparstat isn't the only possible consumer of the interface, and the
>>>>> 'ibm,partition-name' property and the dynamic system parameter clearly
>>>>> serve a common purpose. 'ibm,partition-name' is provided by qemu.
>>>>
>>>> If the hypervisor is not providing this value, this is not the goal of this
>>>> interface to fetch it from the device tree.
>>>>
>>>> Any consumer should be able to fall back on the device tree value, and
>>>> there is no added value to do such a trick in the kernel when it can be
>>>> done in the user space.
>>>
>>> There is value in imposing a level of abstraction so that the semantics
>>> are:
>>>
>>> * Report the name assigned to the guest by the hosting environment, if
>>>   available
>>>
>>> as opposed to
>>>
>>> * Return the string returned by a RTAS call to ibm,get-system-parameter
>>>   with token 55, if implemented
>>>
>>> The benefit is that consumers of lparcfg do not have to be coded with
>>> the knowledge that "if a partition_name= line is absent, the
>>> ibm,get-system-parameter RTAS call must have failed, so now I should
>>> read /sys/firmware/devicetree/base/ibm,partition_name." That's the sort
>>> of esoterica that is appropriate for the kernel to encapsulate.
>>>
>>> And I'd say the effort involved (falling back to a root node property
>>> lookup) is proportional to the benefit.
>>>
>>
>> I don't agree.
>> From the kernel point of view, I can't see any benefit, this is adding more
>> complexity to do in the kernel what can be done easily in user space.
> 
> Applying this logic, I don't see how adding this to lparcfg would be
> justified at all, because user space can already get at the parameter
> using the privileged rtas syscall. Publish it to unprivileged programs
> over D-Bus or something. That would minimize complexity for the kernel.

As you know, there is a need for unprivileged user to read that value.
Adding this to lparcfg solves this issue. Also, this makes it easy to read
from user space, without the need to get plumbing like D-Bus in the
picture. This is simple, working fine, and user space can easily make the
choice to read the DT value if needed. Please keep in mind that most of the
time the hypervisor is providing that value.

