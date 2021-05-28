Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE189393E46
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 09:57:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrxqZ5N17z2yyv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 17:57:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k0Q/N+F3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k0Q/N+F3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Frxq62x11z2xvc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 17:57:06 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14S7XTko150171; Fri, 28 May 2021 03:56:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=I9GSDxLw2OFjMZjZL+4Nucr6EUSKF2Q6aOelYfQQvrI=;
 b=k0Q/N+F3jYfTSDmZwyewZyg7MakiVePgG7qx2BkNMZtyrjqVbgTHeFDBS+42bhkU74WW
 vBOA9cOGvhj3LQ6/Nm19LVxrDOQS8yo3w25JCpZo58s/3AQZZAD72pYcxn1evtXBuPKU
 qrDJXt8iaG3aGaFP94azt53b6fH90CrRK4VJl6PIC+suI2Riugt6DCJQkAinTVPjwZWQ
 dIh37mAa10sND8zLJVawiBcq7YuYZeTOI4gMsSXMftP0/2rmsJyidTY61z49F7V9zhMi
 NBtalImLYaf0nCFxEe8ddBPGBkSGt4QE2nUYaN/gZpKQbL1AH/85VSlaM+1yBh7T+ffx PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38tuj7hra1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 03:56:58 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14S7YT46153142;
 Fri, 28 May 2021 03:56:58 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38tuj7hr9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 03:56:58 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14S7mjbs019817;
 Fri, 28 May 2021 07:56:57 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 38s1ggw5du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 07:56:57 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14S7utlJ36831556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 07:56:55 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9369BE051;
 Fri, 28 May 2021 07:56:55 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 096B1BE04F;
 Fri, 28 May 2021 07:56:52 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.32.139])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 28 May 2021 07:56:51 +0000 (GMT)
Subject: Re: [PATCH] perf vendor events: Fix eventcode of power10 json events
To: Nageswara Sastry <rnsastry@linux.ibm.com>, "Paul A. Clarke" <pc@us.ibm.com>
References: <20210525063723.1191514-1-kjain@linux.ibm.com>
 <20210525144215.GA2135213@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
 <20210525152736.GB2135213@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
 <5960AF7C-64BD-4E57-BA6D-08AA9932B063@linux.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <da7617f8-050e-c597-ec3d-5e803775252c@linux.ibm.com>
Date: Fri, 28 May 2021 13:26:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5960AF7C-64BD-4E57-BA6D-08AA9932B063@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZSdboY5I7P0ZuRjbV59BiYfJTgz4Aqwv
X-Proofpoint-GUID: ZKg8vDmluwCrGnYCIOS6qImFI73e-oEB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_03:2021-05-27,
 2021-05-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105280049
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
Cc: ravi.bangoria@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, acme@kernel.org,
 linux-perf-users@vger.kernel.org, maddy@linux.vnet.ibm.com, jolsa@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/26/21 11:42 AM, Nageswara Sastry wrote:
> 
> 
>> On 25-May-2021, at 8:57 PM, Paul A. Clarke <pc@us.ibm.com> wrote:
>>>
>> I lost the original message, but Nageswara Sastry said:
>>> 1. Extracted all the 244 events from the patch.
>>> 2. Check them in 'perf list' - all 244 events found
>>> 3. Ran all the events with 'perf stat -e "event name" sleep 1', all ran fine.
>>>    No errors were seen in 'dmesg'
>>
>> I count 255 events.
>>
>> PC
> 
> Seems while extracting I filtered out newly added ones, so I got 244(255-11). 
> Now checked with all 255 events. Thanks for pointing out.
> 
> Thanks!!
> R.Nageswara Sastry
> 

Hi Paul/Nageswara,
   Yes we currently have 255 power10 json events which is updated in this patch. 
Thanks for reviewing the patch.

Arnaldo can you pull this patch if changes looks fine to you.

Thanks,
Kajol Jain

