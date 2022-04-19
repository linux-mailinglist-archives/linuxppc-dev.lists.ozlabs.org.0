Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 554575066D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 10:21:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjGwr2cm2z3bZs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 18:21:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sOMDUgwX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjGw465ddz2xDw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 18:20:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sOMDUgwX; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KjGw13nQVz4xNl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 18:20:49 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KjGw13kRdz4xXS; Tue, 19 Apr 2022 18:20:49 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sOMDUgwX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KjGw11PnYz4xNl
 for <linuxppc-dev@ozlabs.org>; Tue, 19 Apr 2022 18:20:49 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23J5M3xN020092; 
 Tue, 19 Apr 2022 08:20:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ko2uVWpXbj0mqFmstcjwwBnFsBgxrG3XNyXNAn2LKa8=;
 b=sOMDUgwXF0Bi6ZB32KlkJs8P1V11fV0biixsdoMemb1c7IHIgZEIyyVMjUwJQK+0P7M3
 qUJGTKIxG7lLAIvZ31hJRJCY8YWEh6TxoZn9OMJPDPLnzVSF7K/hg5oD2YmC0iit0L49
 x0Vecv3ZgwsQxOqumVRPNFjsJn54t0YFE2DWP7ogRX44ghA2YzhAd5ylVTyoOexd0kwO
 YjEzg6l941yunQJ+2k5iykfBQjyhgnc7UY2hlDXInKrd9Nu9X7c3/6u9+aFtThQiH8Eo
 7i0ddpxZhkXs3KVAwNodbAcfjDv116aUAQwGG1bydFgBOMqSq/nC1mREj76nXFT+FeI+ gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7bt1gfs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 08:20:37 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23J7pPx1002180;
 Tue, 19 Apr 2022 08:20:37 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fg7bt1gep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 08:20:36 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23J8DpgR021817;
 Tue, 19 Apr 2022 08:20:34 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3ffn2huxn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 08:20:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23J8KV9051708336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 08:20:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04E4CAE051;
 Tue, 19 Apr 2022 08:20:31 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FE42AE045;
 Tue, 19 Apr 2022 08:20:28 +0000 (GMT)
Received: from [9.43.16.51] (unknown [9.43.16.51])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 19 Apr 2022 08:20:28 +0000 (GMT)
Message-ID: <fbdea21b-5315-b334-da83-16c439d972d5@linux.ibm.com>
Date: Tue, 19 Apr 2022 13:50:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC v4 PATCH 2/5] powerpc/crash hp: introduce a new config
 option CRASH_HOTPLUG
Content-Language: en-US
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220411084357.157308-1-sourabhjain@linux.ibm.com>
 <20220411084357.157308-3-sourabhjain@linux.ibm.com>
 <bb14b849-0fbb-072e-bb26-266da0756e17@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <bb14b849-0fbb-072e-bb26-266da0756e17@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HGrCLAn3leiBmuVZlEvSmfukwT5Vk4J0
X-Proofpoint-GUID: I_tt_v1cFQzc0J8CR9x1CwWkggvB5_Pe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204190045
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com,
 kexec@lists.infradead.org, hbathini@linux.ibm.com, bhe@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 14/04/22 22:10, Laurent Dufour wrote:
> On 11/04/2022, 10:43:54, Sourabh Jain wrote:
>> The option CRASH_HOTPLUG enables, in kernel update to kexec segments on
>> hotplug events.
>>
>> All the updates needed on the capture kernel load path in the kernel for
>> both kexec_load and kexec_file_load system will be kept under this config.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Reviewed-by: Eric DeVolder <eric.devolder@oracle.com>
> Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

Thanks for the review.

- Sourabh Jain

>
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
>> +
>>   config PRESERVE_FA_DUMP
>>   	bool "Preserve Firmware-assisted dump"
>>   	depends on PPC64 && PPC_POWERNV && !FA_DUMP
