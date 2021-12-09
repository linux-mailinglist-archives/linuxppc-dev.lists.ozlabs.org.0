Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE4346E4A8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 09:54:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8nss3TPvz3c7R
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 19:54:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IfM7sNXC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IfM7sNXC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8ns25Xgdz2yNw
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 19:54:14 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B98Sn17002214; 
 Thu, 9 Dec 2021 08:54:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VmKUvcSOlDKYgtvHEH1mC9xCaRoQCxwASXycEo/RWbo=;
 b=IfM7sNXCZZttwY5C6rKINPJrksVL0qhAq7VKP/v5aZ5QN80fN96v+CrKXLe/Vd2PW/Uk
 2Pg/oIbMOiRcj7U2C0o+xy7lrm8oaiUCEWxJRoZ6OLYfYvbmq4JiWnrr1CvpuUzlmTNz
 T61ptsG1Zpm6a8D2MPdwUEDzPcLVql37Gh6///Y4ZAnRVgySi+FWQ/Cd205gq1iMjOp8
 +Blbxq/pWjkmPvkG9gVQzikIxlZmYCwvCgkLnNNL0lyqhw5onmNS9F4nvJ5sRyeSFXTv
 PzyTo+/g/aznAcWUvKmHXIFWNlYUSS6Du1RBdLqKEp4m/+wG9J20CxKiAnpcTh5AjPBE BA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cueax0f1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 08:54:11 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B98qWMT016144;
 Thu, 9 Dec 2021 08:54:09 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3cqyy9w666-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 08:54:08 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B98kK8I18350578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 08:46:20 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B16DAE05D;
 Thu,  9 Dec 2021 08:54:05 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61A37AE058;
 Thu,  9 Dec 2021 08:54:05 +0000 (GMT)
Received: from [9.145.152.236] (unknown [9.145.152.236])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 Dec 2021 08:54:05 +0000 (GMT)
Message-ID: <b6edbf96-4349-c39b-69ee-477b4fdef511@linux.ibm.com>
Date: Thu, 9 Dec 2021 09:54:05 +0100
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
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <874k7jnmva.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nvGaBsQb1vQFqX4oMFyP5Gyw7O2-UVSu
X-Proofpoint-GUID: nvGaBsQb1vQFqX4oMFyP5Gyw7O2-UVSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_03,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090045
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

On 08/12/2021, 16:21:29, Nathan Lynch wrote:
> Laurent Dufour <ldufour@linux.ibm.com> writes:
>> On 07/12/2021, 18:07:50, Nathan Lynch wrote:
>>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>>> On 07/12/2021, 15:32:39, Nathan Lynch wrote:
>>>>> Is there a reasonable fallback for VMs where this parameter doesn't
>>>>> exist? PowerVM partitions should always have it, but what do we want the
>>>>> behavior to be on other hypervisors?
>>>>
>>>> In that case, there is no value displayed in the /proc/powerpc/lparcfg and
>>>> the lparstat -i command will fall back to the device tree value. I can't
>>>> see any valid reason to report the value defined in the device tree
>>>> here.
>>>
>>> Here's a valid reason :-)
>>>
>>> lparstat isn't the only possible consumer of the interface, and the
>>> 'ibm,partition-name' property and the dynamic system parameter clearly
>>> serve a common purpose. 'ibm,partition-name' is provided by qemu.
>>
>> If the hypervisor is not providing this value, this is not the goal of this
>> interface to fetch it from the device tree.
>>
>> Any consumer should be able to fall back on the device tree value, and
>> there is no added value to do such a trick in the kernel when it can be
>> done in the user space.
> 
> There is value in imposing a level of abstraction so that the semantics
> are:
> 
> * Report the name assigned to the guest by the hosting environment, if
>   available
> 
> as opposed to
> 
> * Return the string returned by a RTAS call to ibm,get-system-parameter
>   with token 55, if implemented
> 
> The benefit is that consumers of lparcfg do not have to be coded with
> the knowledge that "if a partition_name= line is absent, the
> ibm,get-system-parameter RTAS call must have failed, so now I should
> read /sys/firmware/devicetree/base/ibm,partition_name." That's the sort
> of esoterica that is appropriate for the kernel to encapsulate.
> 
> And I'd say the effort involved (falling back to a root node property
> lookup) is proportional to the benefit.
> 

I don't agree.
From the kernel point of view, I can't see any benefit, this is adding more
complexity to do in the kernel what can be done easily in user space.

This is typically what should be implemented in a user space shared library.
