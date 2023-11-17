Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 872FC7EEC0E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 06:44:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dBa0R3/e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWm7b3L2mz3dH4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 16:44:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dBa0R3/e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWm6g29nCz3c5S
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 16:43:54 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH5SLOP016958;
	Fri, 17 Nov 2023 05:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xRr+6qA9Z1RDTad+wGfNeUVPXdc47lIg7l/aN9RatAc=;
 b=dBa0R3/eWYWHSzAq9d5dWtLZDchHPhd5D8jN5IWbgIfH6N83IvEGX2POmnnzTu3vSoDx
 KoL5pbN8edPhISsMbzpV+VpYGSlZbp0De4XbEBVMrNqQldyNWtDwLaao/plgbICgqnRP
 tDhDl3mVQYgbLhfhTFcpzhegJKcX3CYImhLB5o+mMTjO2LAH04FhXCWhVDN5rSIZPq4Z
 B3gblxRsiS/bv+MrPik0877eKPGubwL2BlqwFJmHwHuF8IH1LG8iVPjYxzgecYhZLWc5
 6Cdeh33IYen/MMeKpo5qEdpcpyan3R1PpxtlTwrXasxD3l1+kDQ95LoBU7ejIij2W+Xs FQ== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ue1fc14uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 05:43:45 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH346l4026247;
	Fri, 17 Nov 2023 05:43:40 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uapn239mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 05:43:37 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AH5hZG114942776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Nov 2023 05:43:35 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E1C620043;
	Fri, 17 Nov 2023 05:43:35 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4909920040;
	Fri, 17 Nov 2023 05:43:33 +0000 (GMT)
Received: from [9.171.36.107] (unknown [9.171.36.107])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 Nov 2023 05:43:33 +0000 (GMT)
Message-ID: <83a30b63-4ce2-30b4-4c94-811af6ad0186@linux.ibm.com>
Date: Fri, 17 Nov 2023 11:13:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] powerpc/hv-gpxi: Fix access permission of hv-gpci
 interface files
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20231116122033.160964-1-kjain@linux.ibm.com>
 <20231116122033.160964-2-kjain@linux.ibm.com> <87msvd72ck.fsf@mail.lhotse>
Content-Language: en-US
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <87msvd72ck.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: X-j2qFk4l4zRAx6dln7m4KB8yq3zxmUH
X-Proofpoint-GUID: X-j2qFk4l4zRAx6dln7m4KB8yq3zxmUH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_03,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170039
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
Cc: disgoel@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Disha Goel <disgoel@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/17/23 04:06, Michael Ellerman wrote:
> Kajol Jain <kjain@linux.ibm.com> writes:
>> Fix access permission of the hv-gpci topology information
>> interface files from 0444 to 0400 (admin read only).
> 
> Please explain why they should be 0400.
> 
> Also typo in subject, "hv-gpxi".

Hi Michael,
  Thanks for reviewing it. Will add the details in next version of the
patch.

Thanks,
Kajol Jain

> 
> cheers
> 
>> Fixes: 71f1c39647d8 ("powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show processor bus topology information")
>> Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  arch/powerpc/perf/hv-gpci.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
>> index 27f18119fda1..303d160319e8 100644
>> --- a/arch/powerpc/perf/hv-gpci.c
>> +++ b/arch/powerpc/perf/hv-gpci.c
>> @@ -890,7 +890,7 @@ static struct device_attribute *sysinfo_device_attr_create(int
>>  			return NULL;
>>  
>>  		sysfs_attr_init(&attr->attr);
>> -		attr->attr.mode = 0444;
>> +		attr->attr.mode = 0400;
>>  
>>  		switch (sysinfo_interface_group_index) {
>>  		case INTERFACE_PROCESSOR_BUS_TOPOLOGY_ATTR:
>> -- 
>> 2.39.3
