Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D599950EF67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 05:48:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnSY25dLmz3bYT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 13:48:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DIQ0EvII;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnSXF0gBnz2xD3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 13:48:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DIQ0EvII; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KnSXD4VhHz4xTX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 13:48:12 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KnSXD4RVMz4xXW; Tue, 26 Apr 2022 13:48:12 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DIQ0EvII; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KnSXD2BNZz4xTX
 for <linuxppc-dev@ozlabs.org>; Tue, 26 Apr 2022 13:48:12 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23Q2Dghx010338;
 Tue, 26 Apr 2022 03:47:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/AFMUXLgYJBysPrahXdqKjJFTfOkPd3IT+UoCTAMPzc=;
 b=DIQ0EvIIhjlhKLfCjWYLcSvYYzLFEWjOPpp0iMF2NpO3bXOF+tgXcuV35uLBXg+0aKfr
 qHC27z3A55AEnXKMm+IqBSFl0N7uUpsyULZoFvg1WGtGOEo1acYResbAIvY+/glY3kKr
 b9itP0PymmdxLbmEkDkcqsUVsBw5kH5gnYNVhuxjTP7iWuHyvUNry1ypt4lPO1FWcbJ8
 l9Ri5A1LgMbH95eYGJdZRQOpxk9QO/Dz6ZykUxsYwTUNFmvFTjZsEqMOj37nHl/vjKCo
 FJP34SEPB00NNN3q1l4QxnsScbt1wca71VmteIbvrD5YyFjXdmV+18AoYSj+Vbop85Lr Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fp7s4s6x6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 03:47:56 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23Q3ctpx008901;
 Tue, 26 Apr 2022 03:47:55 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fp7s4s6wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 03:47:55 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23Q3YZTG012495;
 Tue, 26 Apr 2022 03:47:53 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3fm938tpcw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Apr 2022 03:47:52 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23Q3lnQp40108508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 03:47:49 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99F9E11C04A;
 Tue, 26 Apr 2022 03:47:49 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A583411C04C;
 Tue, 26 Apr 2022 03:47:47 +0000 (GMT)
Received: from [9.43.122.72] (unknown [9.43.122.72])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 Apr 2022 03:47:47 +0000 (GMT)
Message-ID: <3cbf4010-cbbc-e357-21a0-f50f829097b4@linux.ibm.com>
Date: Tue, 26 Apr 2022 09:17:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC v4 PATCH 2/5] powerpc/crash hp: introduce a new config
 option CRASH_HOTPLUG
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20220411084357.157308-1-sourabhjain@linux.ibm.com>
 <20220411084357.157308-3-sourabhjain@linux.ibm.com>
 <874k2mfz5t.fsf@mpe.ellerman.id.au>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <874k2mfz5t.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bovgfUgSzOxU88fBgSciTxOETVTezNET
X-Proofpoint-GUID: 9KgeVuKikEnWq1gE99ZMzRzlpKKxe8GN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_01,2022-04-25_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260021
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
Cc: ldufour@linux.ibm.com, eric.devolder@oracle.com, kexec@lists.infradead.org,
 hbathini@linux.ibm.com, bhe@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 21/04/22 17:04, Michael Ellerman wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>> The option CRASH_HOTPLUG enables, in kernel update to kexec segments on
>> hotplug events.
>>
>> All the updates needed on the capture kernel load path in the kernel for
>> both kexec_load and kexec_file_load system will be kept under this config.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   arch/powerpc/Kconfig | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index b779603978e1..777db33f75b5 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -623,6 +623,17 @@ config FA_DUMP
>>   	  If unsure, say "y". Only special kernels like petitboot may
>>   	  need to say "N" here.
>>   
>> +config CRASH_HOTPLUG
>> +	bool "kernel updates of crash kexec segments"
>> +	depends on CRASH_DUMP && (HOTPLUG_CPU) && KEXEC_FILE
>> +	help
>> +	  An efficient way to keep the capture kernel up-to-date with CPU
>> +	  hotplug events. On CPU hotplug event the kexec segments of capture
>> +	  kernel becomes stale and need to be updated with latest CPU data.
>> +	  In this method the kernel performs minimal update to only relevant
>> +	  kexec segments on CPU hotplug event, instead of triggering full
>> +	  capture kernel reload from userspace using udev rule.
> Why would a user ever want to turn this off?
>
> Seems to me we should just make it always behave this way, and not have
> a CONFIG option at all.


Yes, we don't need a new CONFIG option. Thanks for the suggestion.


Thanks,
Sourabh Jain
