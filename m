Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 603E37B7C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 03:48:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yxD21JgnzDqbC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 11:48:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yx8l4pYQzDqNk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 11:45:59 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6V1fhR0190356
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 21:45:57 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u3172rq31-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 21:45:56 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Wed, 31 Jul 2019 02:45:55 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 31 Jul 2019 02:45:52 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6V1jphJ40960378
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Jul 2019 01:45:51 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B678FA405C;
 Wed, 31 Jul 2019 01:45:51 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 637C0A4054;
 Wed, 31 Jul 2019 01:45:51 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 31 Jul 2019 01:45:51 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 58DB3A0224;
 Wed, 31 Jul 2019 11:45:50 +1000 (AEST)
Subject: Re: [PATCH v2 5/5] powerpc/configs: Disable SCOM_DEBUGFS in
 powernv_defconfig
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190509051119.7694-1-ajd@linux.ibm.com>
 <20190509051119.7694-5-ajd@linux.ibm.com>
 <1557380130.bkras9z1l5.astroid@bobo.none>
 <316fb28d-b18b-c236-3063-27837b53e0d3@linux.ibm.com>
Date: Wed, 31 Jul 2019 11:45:50 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <316fb28d-b18b-c236-3063-27837b53e0d3@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19073101-0008-0000-0000-000003026DCA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19073101-0009-0000-0000-000022701164
Message-Id: <f6c744a6-3c25-c7a0-f4bf-b3ca239068f9@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-31_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=698 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907310015
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/5/19 3:54 pm, Andrew Donnellan wrote:
> On 9/5/19 3:37 pm, Nicholas Piggin wrote:
>> Andrew Donnellan's on May 9, 2019 3:11 pm:
>>> SCOM_DEBUGFS is really not needed for anything other than low-level
>>> hardware debugging.
>>>
>>> opal-prd uses its own interface (/dev/prd) for SCOM access, so it 
>>> doesn't
>>> need SCOM_DEBUGFS.
>>>
>>> At some point in the future we'll introduce a debug config fragment 
>>> where
>>> this can go instead.
>>
>> That doesn't really explain why you want to disable it. It is useful
>> for low level hardware debugging, I added it.
>>
>> obscurity^Wsecurity?
> 
> Mostly just a general feeling that it's not something we need to have by 
> default. Security-wise, PRD still provides SCOM access, though we are 
> going to look at how we can further lock that down. Shrinks the build by 
> only a few kilobytes...
> 
> mpe said he's planning on adding a debug.config where we can shift stuff 
> like this, and if/when we do that I would like to see this moved there, 
> but perhaps this patch can wait until then. I'll let mpe decide.
> 

mpe do you have thoughts on this? I would like to see at least the rest 
of this series merged.


Andrew


> 
> Andrew
> 
> 
>>
>>>
>>> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
>>> ---
>>> v1->v2:
>>> - new patch
>>> ---
>>>   arch/powerpc/configs/powernv_defconfig | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/configs/powernv_defconfig 
>>> b/arch/powerpc/configs/powernv_defconfig
>>> index ef2ef98d3f28..d5a6608cb2e0 100644
>>> --- a/arch/powerpc/configs/powernv_defconfig
>>> +++ b/arch/powerpc/configs/powernv_defconfig
>>> @@ -38,7 +38,7 @@ CONFIG_MODULE_UNLOAD=y
>>>   CONFIG_MODVERSIONS=y
>>>   CONFIG_MODULE_SRCVERSION_ALL=y
>>>   CONFIG_PARTITION_ADVANCED=y
>>> -CONFIG_SCOM_DEBUGFS=y
>>> +# CONFIG_SCOM_DEBUGFS is not set
>>>   CONFIG_OPAL_PRD=y
>>>   CONFIG_PPC_MEMTRACE=y
>>>   # CONFIG_PPC_PSERIES is not set
>>> -- 
>>> 2.20.1
>>>
>>>
>>
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

