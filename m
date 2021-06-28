Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 180BD3B5C14
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 12:04:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD3BG70Bcz3bTZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 20:04:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A1kB3tsG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=A1kB3tsG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD39n5zCxz2yQm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 20:04:29 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15S9h6Ti064047; Mon, 28 Jun 2021 06:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JnWQwxx4vbeSTGAh350Q9LidqsdxePHYvyif0pUm0ps=;
 b=A1kB3tsG3Xgk7obXBX7rTM25O3rPYjYOlMIJMkMxup7IME+B2fh6GYjnQcfhszVWAPfV
 wzDSjx34nPCxiinHjIGNOQdGWuJ7YisrQJn4QoBZKMIKu8QG6rqRGpsPR2IXKVtyyYHb
 mvki25Opkg+ykrLyQjN3nnVxA5+y1msn4ajQrXn2K/bq2AKJoVT8DqXAVBwrtSjDBCkP
 YeRolQ1AxN5WmNxbz8FACFiagCUsbYygNvyAEXzp/8tsrUnJZ0ArThFaDywTWqBDAYxv
 buO1J9SMNnZeoECabqQis5nVG/UsEwkZ1qc5wDnpFoZb48SyVknL7m/qUnWQl8hSWs7N hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39fc1q8jnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 06:04:20 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15S9hOF2065113;
 Mon, 28 Jun 2021 06:04:20 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39fc1q8jng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 06:04:20 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15SA4F3c027024;
 Mon, 28 Jun 2021 10:04:19 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 39duvaj0g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jun 2021 10:04:19 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15SA4Ihh31981834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Jun 2021 10:04:18 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 148BBC6A08;
 Mon, 28 Jun 2021 10:04:18 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E4FAC69C9;
 Mon, 28 Jun 2021 10:04:13 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.42.117])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 28 Jun 2021 10:04:13 +0000 (GMT)
Subject: Re: [RFC] fpga: dfl: fme: Fix cpu hotplug code
To: Xu Yilun <yilun.xu@intel.com>
References: <20210628071546.167088-1-kjain@linux.ibm.com>
 <20210628090146.GA80012@yilunxu-OptiPlex-7050>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <af163fb4-6b0e-a5d0-2f86-492bc805c161@linux.ibm.com>
Date: Mon, 28 Jun 2021 15:34:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210628090146.GA80012@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6e4aB4koxTDx5DcvT3lWaHdGCEbMaZxG
X-Proofpoint-ORIG-GUID: z2WDZVzUF19eBT3mo0x4PImzcs86ThuA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_07:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106280066
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, luwei.kang@intel.com,
 rnsastry@linux.ibm.com, trix@redhat.com, linux-fpga@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 atrajeev@linux.vnet.ibm.com, mdf@kernel.org, will@kernel.org, hao.wu@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/28/21 2:31 PM, Xu Yilun wrote:
> It's a good fix, you can drop the RFC in commit title. :)
> 
> The title could be more specific, like:
> 
>     fpga: dfl: fme: Fix cpu hotplug issue in performance reporting
> 
> So we know it is for performance reporting feature at first glance.
> 
> On Mon, Jun 28, 2021 at 12:45:46PM +0530, Kajol Jain wrote:
> 
>> Commit 724142f8c42a ("fpga: dfl: fme: add performance
>> reporting support") added performance reporting support
>> for FPGA management engine via perf.
> 
> May drop this section, it is indicated in the Fixes tag.
> 

Hi Yilun,
    Thanks for testing the patch. I will make mentioned changes and send
new patch.

Thanks,
Kajol Jain
>>
>> It also added cpu hotplug feature but it didn't add
> 
> The performance reporting driver added cpu hotplug ...
> 
>> pmu migration call in cpu offline function.
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
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> 
> Tested-by: Xu Yilun <yilun.xu@intel.com>
> 
> Thanks,
> Yilun
> 
>> ---
>>  drivers/fpga/dfl-fme-perf.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> ---
>> - This fix patch is not tested (as I don't have required environment).
>>   But issue mentioned in the commit msg can be re-created, by starting any
>>   fme_perf event and while its still running, offline current designated
>>   cpu pointed by cpumask file. Since current code didn't migrating pmu,
>>   perf gonna try getting counts from that offlined cpu and hence we will
>>   not get event data.
>> ---
>> diff --git a/drivers/fpga/dfl-fme-perf.c b/drivers/fpga/dfl-fme-perf.c
>> index 4299145ef347..b9a54583e505 100644
>> --- a/drivers/fpga/dfl-fme-perf.c
>> +++ b/drivers/fpga/dfl-fme-perf.c
>> @@ -953,6 +953,10 @@ static int fme_perf_offline_cpu(unsigned int cpu, struct hlist_node *node)
>>  		return 0;
>>  
>>  	priv->cpu = target;
>> +
>> +	/* Migrate fme_perf pmu events to the new target cpu */
>> +	perf_pmu_migrate_context(&priv->pmu, cpu, target);
>> +
>>  	return 0;
>>  }
>>  
>> -- 
>> 2.31.1
