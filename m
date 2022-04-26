Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C04450EF9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 06:11:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnT340Z0xz3bdq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 14:11:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c8n77NWB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnT2K4CvDz2xrf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 14:10:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=c8n77NWB; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KnT2H0X82z4x7Y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 14:10:47 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KnT2H0Snpz4xLb; Tue, 26 Apr 2022 14:10:47 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=c8n77NWB; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KnT2G4Y3cz4x7Y
 for <linuxppc-dev@ozlabs.org>; Tue, 26 Apr 2022 14:10:46 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23Q2l18i002328;
 Tue, 26 Apr 2022 04:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=o3k73otNfbzFRhcwBcCyFlRlXw3yIB9k7juzf6K3dsY=;
 b=c8n77NWB4y6b4oWSnFLlZi2hlo6qQCQq5vasCpcJoCPdMWHgZwJjjBTgmVzvuyZPwjOP
 hIjbmr7zCWfnw61tOTTd9Py46auXfpCh0fb54eyCq4/2YqqF6eh8pSrORvkBH3wKTRP7
 70XiOPZ5NLzYWMRpsMTRBPg47b3mcvv2/ltZ+0Tkz7y9x46zwUgJT7x9+CBk4k3LrtDa
 XomNSQtgEwbk6hq/k6zGEgcvNUitD2mKMy6587ae0zJRUmO0H1VkixAa3MsDdSMUIu39
 C89fX9VAZbx3dKakhSxBY3vxN0SH8PMCvJziLpwB9nx2YlZpKpV7J2QljGxMpbwKtWsG Vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fp88s144y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 04:10:37 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23Q4AWls038753;
 Tue, 26 Apr 2022 04:10:37 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fp88s144p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 04:10:37 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23Q48O6d020302;
 Tue, 26 Apr 2022 04:10:35 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3fm8qj3d3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 04:10:35 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23Q4AiAL66716056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 04:10:44 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46F8811C050;
 Tue, 26 Apr 2022 04:10:32 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40ECF11C04A;
 Tue, 26 Apr 2022 04:10:30 +0000 (GMT)
Received: from [9.43.122.72] (unknown [9.43.122.72])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Apr 2022 04:10:29 +0000 (GMT)
Message-ID: <9bf9eccf-d689-463d-0af2-5b3c65da4aef@linux.ibm.com>
Date: Tue, 26 Apr 2022 09:40:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC v4 PATCH 2/5] powerpc/crash hp: introduce a new config
 option CRASH_HOTPLUG
Content-Language: en-US
To: Eric DeVolder <eric.devolder@oracle.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20220411084357.157308-1-sourabhjain@linux.ibm.com>
 <20220411084357.157308-3-sourabhjain@linux.ibm.com>
 <874k2mfz5t.fsf@mpe.ellerman.id.au>
 <35ccca7c-07c2-1fc4-70da-2cc581ba818a@oracle.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <35ccca7c-07c2-1fc4-70da-2cc581ba818a@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A6HpZtOCvS_pFgaVgPrW-M1yjjTpo1Uv
X-Proofpoint-ORIG-GUID: kk2tVV-VauJY7fZLejFc6v0xk81t4Qfk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_01,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204260024
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
Cc: ldufour@linux.ibm.com, kexec@lists.infradead.org, hbathini@linux.ibm.com,
 bhe@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 21/04/22 20:59, Eric DeVolder wrote:
>
>
> On 4/21/22 06:34, Michael Ellerman wrote:
>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>> The option CRASH_HOTPLUG enables, in kernel update to kexec segments on
>>> hotplug events.
>>>
>>> All the updates needed on the capture kernel load path in the kernel 
>>> for
>>> both kexec_load and kexec_file_load system will be kept under this 
>>> config.
>>>
>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>> Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
>>> ---
>>>   arch/powerpc/Kconfig | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index b779603978e1..777db33f75b5 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -623,6 +623,17 @@ config FA_DUMP
>>>         If unsure, say "y". Only special kernels like petitboot may
>>>         need to say "N" here.
>>>   +config CRASH_HOTPLUG
>>> +    bool "kernel updates of crash kexec segments"
>>> +    depends on CRASH_DUMP && (HOTPLUG_CPU) && KEXEC_FILE
>>> +    help
>>> +      An efficient way to keep the capture kernel up-to-date with CPU
>>> +      hotplug events. On CPU hotplug event the kexec segments of 
>>> capture
>>> +      kernel becomes stale and need to be updated with latest CPU 
>>> data.
>>> +      In this method the kernel performs minimal update to only 
>>> relevant
>>> +      kexec segments on CPU hotplug event, instead of triggering full
>>> +      capture kernel reload from userspace using udev rule.
>>
>> Why would a user ever want to turn this off?
>>
>> Seems to me we should just make it always behave this way, and not have
>> a CONFIG option at all.
>
> Sourabh,
>
> Borislav Petkov also requested I remove the config option, which will 
> be the
> case in upcoming v8.
>
> Where I was using CONFIG_CRASH_HOTPLUG, I've replaced it with the
> CONFIG_HOTPLUG_CPU || CONFIG_MEMORY_HOTPLUG.


Yes good idea. Even Michael suggested there is no need for new CONFIG
option. I will also remove CRASH_HOTPLUG config in the next version.

Thanks,
Sourabh Jain

