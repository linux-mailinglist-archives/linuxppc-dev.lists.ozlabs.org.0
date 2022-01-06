Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 602074861FA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 10:18:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JV14H33X1z30Lp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 20:18:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FpQdolhY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FpQdolhY; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JV13Z3BQsz2xDM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 20:18:01 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2068k8It032626; 
 Thu, 6 Jan 2022 09:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6mPRnE6+2xuMk0noay7O8DNg6N5oeLW8WKLFFk+4tc4=;
 b=FpQdolhYo/+dgp/hof0CAcMaK5EeOux4neugv6ZKMXMo8JcBjUKCoXdS2twXfHQSWxw3
 MLK+Onkvm3+FnjhDW86pQJjoPjWbPcSJgYnpNfCrALsFQuOwTTWLwDjNQDPybaZUndji
 ZUUZRCXUotdN8K4iQDXCodh/zeJwGhC5PzMFsYVMUMlhgavxxPXBIgSyuNzO3yF7YMaL
 rgH9s9JVTFCdMx79vCCRO1xZTfSwziIMf0kzOovOQpZfhqFEEGwMXwTEveAyF9SwV8Ul
 9SQSj4ukirestj7x1Uw447g/Yiog6nh62dGSFnWNLEWEGZlEKoPTKoB6y373EBaHtNbw Wg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ddw73rgaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 09:17:54 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2069E1PR001052;
 Thu, 6 Jan 2022 09:17:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3ddn4e3dad-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 09:17:52 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2069Hmrp46399748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 09:17:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF9C452065;
 Thu,  6 Jan 2022 09:17:48 +0000 (GMT)
Received: from [9.145.164.165] (unknown [9.145.164.165])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 771F95204F;
 Thu,  6 Jan 2022 09:17:48 +0000 (GMT)
Message-ID: <da130af8-5434-0768-661f-7a6a7e417567@linux.ibm.com>
Date: Thu, 6 Jan 2022 10:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH v4] powerpc/pseries: read the lpar name from the firmware
Content-Language: en-US
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <20211207171109.22793-1-ldufour@linux.ibm.com>
 <25527544-b0ac-596c-3876-560493b99f6b@linux.ibm.com>
 <8735m1ixd6.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
 <ac208963-d334-1f46-0db2-4a8d073b2963@linux.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <ac208963-d334-1f46-0db2-4a8d073b2963@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UCWffUqHUMm6qLy2yd-E9PoaJM5zEwib
X-Proofpoint-ORIG-GUID: UCWffUqHUMm6qLy2yd-E9PoaJM5zEwib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_03,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 phishscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2112160000 definitions=main-2201060065
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

On 06/01/2022, 02:17:21, Tyrel Datwyler wrote:
> On 1/5/22 3:19 PM, Nathan Lynch wrote:
>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>> On 07/12/2021, 18:11:09, Laurent Dufour wrote:
>>>> The LPAR name may be changed after the LPAR has been started in the HMC.
>>>> In that case lparstat command is not reporting the updated value because it
>>>> reads it from the device tree which is read at boot time.
>>>>
>>>> However this value could be read from RTAS.
>>>>
>>>> Adding this value in the /proc/powerpc/lparcfg output allows to read the
>>>> updated value.
>>>
>>> Do you consider taking that patch soon?
>>
>> This version prints an error on non-PowerVM guests the first time
>> lparcfg is read.
> 
> I assume because QEMU doesn't implement the LPAR_NAME token for get_sysparm.
> 
>>
>> And I still contend that having this function fall back to reporting the
>> partition name in the DT would provide a beneficial consistency in the
>> user-facing API, allowing programs to avoid hypervisor-specific branches
>> in their code. 
> 
> Agreed, if the get_sysparm fails just report the lpar-name from the device tree.

My aim is to not do in the kernel what can be easily done in user space but
avoiding user space program hypervisor-specific branches is a good point.

Note that if the RTAS call has been available to unprivileged user, all
that stuff would have been made in user space, so hypervisor-specific...

Anyway, I'll work on a new version fetching the DT value in the case the
RTAS call is failing.

Thanks,
Laurent.
