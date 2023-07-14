Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC2275327B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 09:03:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F9jCkLDw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2MrH4m96z3cDN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 17:03:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F9jCkLDw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2MqM343dz2xgv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 17:02:22 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36E6k8mC003711;
	Fri, 14 Jul 2023 07:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VSZ2cLwX/EHXnaRmoVY3Q/CXPd3lzNMShf9VQsHYbZM=;
 b=F9jCkLDwZECEsSzd4c6/nNh7238079QEjvVzPfQGvKY7NYKkJe6sHLh2yBuemM8yVbD5
 1OgIqxdFL3buUzxlRvmqAbO5SAOrv9Q6lHVT4FhLaNmgJdyoIVad8ymQCBkcGBaraZIE
 Q0YcddfEwR5OqccLNuwbPYgPmwmbfIKTTizg93pai56lKG8IoKTjbb3yooEm4WEniI4M
 XBAZdlPseoF3Sp/8JwOuiitNDZdKv83I2wE6rJ/rRKU2iYoTDiv7sTuZcsJGuXiYeatm
 bQC+7ESQqP2t1deFANp+x+mIRZeaPpqznkreVjBF5ocvnHzJHt9Sni2UMfZd3Up1DooA qQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ru1cjrbgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 07:02:09 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36E4xAPA007392;
	Fri, 14 Jul 2023 07:02:09 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rtpvs1420-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 07:02:09 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36E726BT20578820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jul 2023 07:02:06 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00AD52004E;
	Fri, 14 Jul 2023 07:02:06 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3CE12004B;
	Fri, 14 Jul 2023 07:02:03 +0000 (GMT)
Received: from [9.43.21.134] (unknown [9.43.21.134])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Jul 2023 07:02:03 +0000 (GMT)
Message-ID: <d91cee25-19d6-2eaa-1ad3-94718fa253cb@linux.ibm.com>
Date: Fri, 14 Jul 2023 12:32:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 02/10] docs: ABI:
 sysfs-bus-event_source-devices-hv_gpci: Document processor_bus_topology sysfs
 interface file
To: Randy Dunlap <rdunlap@infradead.org>, mpe@ellerman.id.au
References: <20230710092717.55317-1-kjain@linux.ibm.com>
 <20230710092717.55317-3-kjain@linux.ibm.com>
 <4418618a-ac75-f824-ec6d-984421dd5c6b@infradead.org>
Content-Language: en-US
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <4418618a-ac75-f824-ec6d-984421dd5c6b@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -6e-aaptf8lQBw9POaytQSMl9XXfYxQy
X-Proofpoint-ORIG-GUID: -6e-aaptf8lQBw9POaytQSMl9XXfYxQy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_03,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 spamscore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140059
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
Cc: atrajeev@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>











Thanks Randy for the review comments, I will do these updates
for all documentation patches in my next version of patchset.

Thanks,
Kajol Jain

On 7/12/23 02:22, Randy Dunlap wrote:
> Hi--
> 
> On 7/10/23 02:27, Kajol Jain wrote:
>> Add details of the new hv-gpci interface file called
>> "processor_bus_topology" in the ABI documentation.
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  .../sysfs-bus-event_source-devices-hv_gpci    | 32 +++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
>> index 12e2bf92783f..2eeeab9a20fa 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
>> +++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
>> @@ -80,3 +80,35 @@ Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
>>  Description:	read only
>>  		This sysfs file exposes the cpumask which is designated to make
>>  		HCALLs to retrieve hv-gpci pmu event counter data.
>> +
>> +What:		/sys/devices/hv_gpci/interface/processor_bus_topology
>> +Date:		July 2023
>> +Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
>> +Description:	admin read only
>> +		This sysfs file exposes the system topology information by making HCALL
>> +		H_GET_PERF_COUNTER_INFO. The HCALL is made with counter request value
>> +		PROCESSOR_BUS_TOPOLOGY(0xD0).
>> +
>> +		* This sysfs file will be created only for power10 and above platforms.
>> +
>> +		* User needs root privileges to read data from this sysfs file.
>> +
>> +		* This sysfs file will be created, only when the HCALL returns "H_SUCESS",
> 
> 		                                                                H_SUCCESS
> 
>> +		  "H_AUTHORITY" and "H_PARAMETER" as the return type.
> 
> 		            s/and/or/
> 
>> +
>> +		  HCALL with return error type "H_AUTHORITY", can be resolved during
> 
> 		                             Drop the comma ^
> 
>> +		  runtime by setting "Enable Performance Information Collection" option.
>> +
>> +		* The end user reading this sysfs file must decode the content as per
>> +		  underlying platform/firmware.
>> +
>> +		Possible error codes while reading this sysfs file:
>> +
>> +		* "-EPERM" : Partition is not permitted to retrieve performance information,
>> +			    required to set "Enable Performance Information Collection" option.
>> +
>> +		* "-EIO" : Can't retrieve system information because of invalid buffer length/invalid address
>> +			   or because of some hardware error. Refer getPerfCountInfo documentation for
> 
> 			                                      Refer to
> 
>> +			   more information.
>> +
>> +		* "-EFBIG" : System information exceeds PAGE_SIZE.
> 
