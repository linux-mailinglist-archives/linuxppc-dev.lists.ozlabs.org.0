Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D583C6B57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 09:38:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPCDY3tqKz3bWq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 17:38:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TJ/rKhyS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TJ/rKhyS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPCD54tHwz301j
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 17:38:13 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16D7YZrd103992; Tue, 13 Jul 2021 03:38:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=wk0SpEf762XmitIRvUvlwwCNxJLcU2ZLY2GAwxg46fA=;
 b=TJ/rKhySSeIuqRovbX6FJYB1m6323+Q+gQR+xDs+XgoTE5wu6HmdeoMFMp6D/bJFuNB/
 iCuf+3caXJXyVcfuLhmqcdq2IvgHnHOBfXwEIKUm72pm76JtMhkE713gpMpVoyihtgS4
 5kfC+jKeKqdmQ3fPuecwAfEerLSiKxU8QclGIPcYdNlHGhv/ID8Q4GzxvVCH2LIHnbgB
 Fd4gpoh0/gQFwM+mjhZlvJD5hpG1U4T9hMCczK95uGrlurY6Omljvt7R/TO5kQCxOEjX
 HfuLoEVRWpsaklGyMAtkR7wJyE8J2+jwF+33Bk2Ta9Uy9JcWnzQfbqJqtGRS7wvG/9p7 OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrj0ksej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 03:38:03 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16D7YkkR104871;
 Tue, 13 Jul 2021 03:38:03 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrj0ksdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 03:38:03 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16D7Y348000699;
 Tue, 13 Jul 2021 07:38:01 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03wdc.us.ibm.com with ESMTP id 39q36au9jd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 07:38:01 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16D7c09M47776246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 07:38:00 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E554C6069;
 Tue, 13 Jul 2021 07:38:00 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CEF2C6066;
 Tue, 13 Jul 2021 07:37:54 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.32.99])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Jul 2021 07:37:53 +0000 (GMT)
Subject: Re: [PATCH v2] fpga: dfl: fme: Fix cpu hotplug issue in performance
 reporting
To: "Wu, Hao" <hao.wu@intel.com>, "will@kernel.org" <will@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "Xu, Yilun"
 <yilun.xu@intel.com>
References: <20210709084319.33776-1-kjain@linux.ibm.com>
 <DM6PR11MB38197304C3BC02672304201A85159@DM6PR11MB3819.namprd11.prod.outlook.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <962ef143-024c-71e3-b781-b027154a12bd@linux.ibm.com>
Date: Tue, 13 Jul 2021 13:07:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <DM6PR11MB38197304C3BC02672304201A85159@DM6PR11MB3819.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Xy__ijGq2m11ovCDd3JcAkHjd1JPUSHG
X-Proofpoint-GUID: qFJQINNSSJs6FbNa6btPKOTIZVIYSCnk
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_03:2021-07-13,
 2021-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130047
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
Cc: "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
 "rnsastry@linux.ibm.com" <rnsastry@linux.ibm.com>,
 "trix@redhat.com" <trix@redhat.com>,
 "linux-fpga@vger.kernel.org" <linux-fpga@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 "atrajeev@linux.vnet.ibm.com" <atrajeev@linux.vnet.ibm.com>,
 "mdf@kernel.org" <mdf@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/12/21 7:57 AM, Wu, Hao wrote:
>> Subject: [PATCH v2] fpga: dfl: fme: Fix cpu hotplug issue in performance
>> reporting
>>
>> The performance reporting driver added cpu hotplug
>> feature but it didn't add pmu migration call in cpu
>> offline function.
>> This can create an issue incase the current designated
>> cpu being used to collect fme pmu data got offline,
>> as based on current code we are not migrating fme pmu to
>> new target cpu. Because of that perf will still try to
>> fetch data from that offline cpu and hence we will not
>> get counter data.
>>
>> Patch fixed this issue by adding pmu_migrate_context call
>> in fme_perf_offline_cpu function.
>>
>> Fixes: 724142f8c42a ("fpga: dfl: fme: add performance reporting support")
>> Tested-by: Xu Yilun <yilun.xu@intel.com>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> 
> Thanks for this fixing! And thanks Yilun for the verification too. : )
> 
>> Cc: stable@vger.kernel.org
>> ---
>>  drivers/fpga/dfl-fme-perf.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> ---
>> Changelog:
>> v1 -> v2:
>> - Add stable@vger.kernel.org in cc list
>>
>> RFC -> PATCH v1
>> - Remove RFC tag
>> - Did nits changes on subject and commit message as suggested by Xu Yilun
>> - Added Tested-by tag
>> - Link to rfc patch: https://lkml.org/lkml/2021/6/28/112
>> ---
>> diff --git a/drivers/fpga/dfl-fme-perf.c b/drivers/fpga/dfl-fme-perf.c
>> index 4299145ef347..b9a54583e505 100644
>> --- a/drivers/fpga/dfl-fme-perf.c
>> +++ b/drivers/fpga/dfl-fme-perf.c
>> @@ -953,6 +953,10 @@ static int fme_perf_offline_cpu(unsigned int cpu, struct
>> hlist_node *node)
>>  		return 0;
>>
>>  	priv->cpu = target;
>> +
>> +	/* Migrate fme_perf pmu events to the new target cpu */
> 
> Only one minor item, this line is not needed. : )
> 
> After remove it, 
> Acked-by: Wu Hao <hao.wu@intel.com>

Hi Wu Hao,
   Sure I will remove this comment and send new patch.

Thanks,
Kajol Jain

> 
> Thanks
> Hao
> 
>> +	perf_pmu_migrate_context(&priv->pmu, cpu, target);
>> +
>>  	return 0;
>>  }
>>
>> --
>> 2.31.1
> 
