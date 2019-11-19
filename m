Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A79C91027DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 16:17:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HTvr5151zDqcX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 02:17:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HTsh3467zDqcR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 02:15:35 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAJF7xYm009457
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 10:15:33 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wbxncdtb8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 10:15:32 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Tue, 19 Nov 2019 15:15:30 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 19 Nov 2019 15:15:28 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAJFFREa56164448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Nov 2019 15:15:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 446C3A4064;
 Tue, 19 Nov 2019 15:15:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B706A4054;
 Tue, 19 Nov 2019 15:15:27 +0000 (GMT)
Received: from bali.tlslab.ibm.com (unknown [9.101.4.17])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 19 Nov 2019 15:15:26 +0000 (GMT)
Subject: Re: [PATCH 08/11] pci/hotplug/pnv-php: Register opencapi slots
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com, clombard@linux.ibm.com
References: <20190909154600.19917-1-fbarrat@linux.ibm.com>
 <20190909154600.19917-9-fbarrat@linux.ibm.com>
 <8ccc21bc-7154-d8a6-68ec-ac42a21de7ef@linux.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Tue, 19 Nov 2019 16:15:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <8ccc21bc-7154-d8a6-68ec-ac42a21de7ef@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19111915-0020-0000-0000-0000038AE4A8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19111915-0021-0000-0000-000021E111A2
Message-Id: <1ac2e3e6-06fe-b94c-98b4-2291256a3b42@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-19_04:2019-11-15,2019-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911190139
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
Cc: groug@kaod.org, alastair@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/11/2019 à 06:18, Andrew Donnellan a écrit :
> On 10/9/19 1:45 am, Frederic Barrat wrote:
>> Add the opencapi PHBs to the list of PHBs being scanned to look for
>> slots.
>>
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>> ---
>>   drivers/pci/hotplug/pnv_php.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/hotplug/pnv_php.c 
>> b/drivers/pci/hotplug/pnv_php.c
>> index 304bdbcdb77c..f0a7360154e7 100644
>> --- a/drivers/pci/hotplug/pnv_php.c
>> +++ b/drivers/pci/hotplug/pnv_php.c
>> @@ -954,7 +954,8 @@ static int __init pnv_php_init(void)
>>       pr_info(DRIVER_DESC " version: " DRIVER_VERSION "\n");
>>       for_each_compatible_node(dn, NULL, "ibm,ioda2-phb")
>>           pnv_php_register(dn);
>> -
>> +    for_each_compatible_node(dn, NULL, "ibm,ioda2-npu2-opencapi-phb")
>> +        pnv_php_register_one(dn);
>>       return 0;
>>   }
>> @@ -964,6 +965,8 @@ static void __exit pnv_php_exit(void)
>>       for_each_compatible_node(dn, NULL, "ibm,ioda2-phb")
>>           pnv_php_unregister(dn);
>> +    for_each_compatible_node(dn, NULL, "ibm,ioda2-npu2-opencapi-phb")
>> +        pnv_php_unregister(dn);
>>   }
> 
> 
> Why do we use register_one to register and unregister rather than 
> unregister_one to unregister?


Good catch! With the above, the slot was not removed. 
pnv_php_unregister() looks at the children only and was missing the 
opencapi slot, since it's directly under the PHB.

   Fred

