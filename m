Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDD16B8A33
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 06:19:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbMJY5Lqzz3cGr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 16:19:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FkSxB75a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbMHc0xlTz3c9L
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 16:18:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FkSxB75a;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4PbMHc0Q3Vz4xDp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 16:18:20 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4PbMHc0F5qz4x1f; Tue, 14 Mar 2023 16:18:20 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FkSxB75a;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4PbMHb4LQbz4xDp
	for <linuxppc-dev@ozlabs.org>; Tue, 14 Mar 2023 16:18:19 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32E4rVEM025005;
	Tue, 14 Mar 2023 05:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=0WKVQyVGQODDklV07F2FGkZYK48+pG1wbX0r3JV6WcA=;
 b=FkSxB75aiQT9z2rewsJlxDMs46xNBIw6PiqcM0Q4ZrRm9IAz3mYdZkVjT3/wymO86lbp
 x9JrovNWgvpQmupIVhTHjaDu9oYCShTui2fzCj6c33opm8wVzjxtATV6nN5RXG4Zgzdx
 AZpdQTSFk7PiDuhqqb5Efv0JfPNrxgGACknfUe///oSkW4aHaWdjUTM69HcoHKwn7STE
 dt+oPyRqnz6HA9gDMmKMgV2PnplpfcBxTN3Qyvi+kE3bht3cKD0A15GT4dl5oqhNLquk
 dUbdS04+rv2Ms9WtxOCsFvfkGNIZCvjLZq+AsRnOddgKU3ZcjngT01KarjnGdjksP1NL UA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3paj9sgf51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Mar 2023 05:18:04 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32E4tImC000995;
	Tue, 14 Mar 2023 05:18:04 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3paj9sgf4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Mar 2023 05:18:04 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32DEospZ001011;
	Tue, 14 Mar 2023 05:18:02 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3p8h96m8e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Mar 2023 05:18:02 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32E5Hw7V22217428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Mar 2023 05:17:58 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B47B22004D;
	Tue, 14 Mar 2023 05:17:58 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19BF820063;
	Tue, 14 Mar 2023 05:17:57 +0000 (GMT)
Received: from [9.43.46.246] (unknown [9.43.46.246])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Mar 2023 05:17:56 +0000 (GMT)
Message-ID: <9fdde88b-13e7-bf3e-d417-5479a60acb6a@linux.ibm.com>
Date: Tue, 14 Mar 2023 10:47:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 2/6] powerpc/crash: introduce a new config option
 CRASH_HOTPLUG
Content-Language: en-US
To: Eric DeVolder <eric.devolder@oracle.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
 <20230312181154.278900-3-sourabhjain@linux.ibm.com>
 <0269c298-d53c-7ad7-c718-3dbc1e225d0d@oracle.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <0269c298-d53c-7ad7-c718-3dbc1e225d0d@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DIr4LSZphKBCPpVXY24IvfRd6lF0k8US
X-Proofpoint-ORIG-GUID: OE5sumqNusd_JMJYzIhOSB3zVxFcF7m8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-13_13,2023-03-13_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140044
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
Cc: ldufour@linux.ibm.com, kexec@lists.infradead.org, hbathini@linux.ibm.com, bhe@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 13/03/23 21:16, Eric DeVolder wrote:
>
>
> On 3/12/23 13:11, Sourabh Jain wrote:
>> Due to CPU/Memory hotplug events the system resources changes. A similar
>> change should reflect in the loaded kdump kernel image that describes
>> the state of the CPU and memory of the running kernel.
>>
>> If the kdump kernel image is not updated after the CPU or Memory hotplug
>> events and it tries to collect the dump with the stale system resource
>> data this might lead to dump collection failure or an inaccurate dump
>> collection.
>>
>> The current method to keep the kdump kernel up to date is by triggering
>> reload (i.e unload and load) the entire kdump kernel image whenever a
>> CPU or Memory hotplug event is observed by udev in the userspace.
>> Reloading the complete kdump kernel image is an expensive task. It can
>> be easily avoided by doing the in-kernel updates to specific kdump
>> kernel image components which are responsible for describing CPU and
>> Memory resources of the running kernel to the kdump kernel.
>>
>> The kernel changes related to in-kernel update to the kdump kernel image
>> on CPU/Memory hotplug events are kept under the CRASH_HOTPLUG config
>> option.
>>
>> Later in the series, a powerpc crash hotplug handler is introduced to
>> update the kdump kernel image on CPU/Memory hotplug events. This arch
>> specific handler is trigger from a generic crash handler that registers
>> with the CPU and memory notifiers.
>>
>> The CRASH_HOTPLUG config option is enabled by default.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>>   arch/powerpc/Kconfig | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index a6c4407d3ec83..2f45b3f5175cb 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -681,6 +681,18 @@ config CRASH_DUMP
>>         The same kernel binary can be used as production kernel and dump
>>         capture kernel.
>>   +config CRASH_HOTPLUG
>> +    bool "Update crash capture system on CPU/Memory hotplug event"
> Fwiw, online/offline changes also flow through this infrastructure...
> eric
Yes I will update the CONFIG summary and commit message to convey
the same.

Thanks for the review.

Thanks,
Sourabh Jain
