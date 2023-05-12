Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE3F6FFF36
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 05:21:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHYty5CpXz3fP6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 13:20:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=okVRXwU5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=okVRXwU5;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHYt40hQLz3bjW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 13:20:11 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34C38mum005682;
	Fri, 12 May 2023 03:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Jm4AHPNL/KA4jyhOtqpTMdir0fVsHq+zCicjk1+//sQ=;
 b=okVRXwU5ISLlnqjg7Si5gwaboVrRBOxfuE5MAe07xITJK9ZVXbFzMW2EQ/EPgQPajUpY
 C4eHLqFQPJJ+NAX6hTy6cVFqWF+TRbNdKvEPw0RwstLqBI4xp2p2AIiuijMi7YjMxDE4
 XNJ1iPCqDQ2fa2g8xMVpz7PW0HcAvWh5KeEhTFhsX7s0VFtZu8eA4cJBXLqE+sOhOm+e
 vmyg2V1+ZXTTw7+8tV0es9ktZYDtsiFtid436mftkl3/zKtiki0Gyzm6Ap22TQqQ9HY2
 x/u/qq5Xl8MH9iUPDTrsfB/U3CAgim6uler09c4UF/j/Qv+OpH00eoVOwD6Bh1oXRHlD sA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qhd3wge0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 03:20:05 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34C0Yo7g002499;
	Fri, 12 May 2023 03:20:04 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3qf88ujxff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 03:20:04 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34C3K3uu787138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 May 2023 03:20:03 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 052CB58061;
	Fri, 12 May 2023 03:20:03 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 741CB58057;
	Fri, 12 May 2023 03:20:02 +0000 (GMT)
Received: from [9.65.223.164] (unknown [9.65.223.164])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 May 2023 03:20:02 +0000 (GMT)
Message-ID: <ad7517b3-02f2-436a-4c31-878031630c25@linux.vnet.ibm.com>
Date: Thu, 11 May 2023 22:20:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH] powerpc/iommu: limit number of TCEs to 512 for
 H_STUFF_TCE hcall
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20230509220549.23946-1-gbatra@linux.vnet.ibm.com>
 <875y8yl1k5.fsf@mail.lhotse>
From: Gaurav Batra <gbatra@linux.vnet.ibm.com>
In-Reply-To: <875y8yl1k5.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: D1i_9tnlCrQYLNf5Z0C6Biu2nG7ThuPV
X-Proofpoint-GUID: D1i_9tnlCrQYLNf5Z0C6Biu2nG7ThuPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_19,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120026
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, gjoyce@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michael,

System test hit the crash. I believe, it was PHYP that resulted in it 
due to number of TCEs passed in to be >512.

I was wondering about the Fixes tag as well. But, this interface, in 
it's current form, is there from the day the file was created. So, in 
this case, should I mention the first commit which created this source file?

Thanks a lot for looking into it.

Gaurav

On 5/11/23 9:35 PM, Michael Ellerman wrote:
> Gaurav Batra <gbatra@linux.vnet.ibm.com> writes:
>> As of now, in tce_freemulti_pSeriesLP(), there is no limit on how many TCEs
>> are passed to H_STUFF_TCE hcall. PAPR is enforcing this to be limited to
>> 512 TCEs.
> Did you actually hit a bug here, or just noticed via code inspection?
>
> Can you provide a Fixes: tag ?
>
> cheers
>
>> Signed-off-by: Gaurav Batra <gbatra@linux.vnet.ibm.com>
>> Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
>> ---
>>   arch/powerpc/platforms/pseries/iommu.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>> index c74b71d4733d..1b134b1b795a 100644
>> --- a/arch/powerpc/platforms/pseries/iommu.c
>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>> @@ -306,13 +306,21 @@ static void tce_free_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
>>   static void tce_freemulti_pSeriesLP(struct iommu_table *tbl, long tcenum, long npages)
>>   {
>>   	u64 rc;
>> +	long limit, rpages = npages;
>    
> I don't know why npages is signed, but we don't ever want limit to be
> negative, so it'd be better of as unsigned long wouldn't it?
>
>>   	if (!firmware_has_feature(FW_FEATURE_STUFF_TCE))
>>   		return tce_free_pSeriesLP(tbl->it_index, tcenum,
>>   					  tbl->it_page_shift, npages);
>>   
>> -	rc = plpar_tce_stuff((u64)tbl->it_index,
>> -			     (u64)tcenum << tbl->it_page_shift, 0, npages);
>> +	do {
>> +		limit = min_t(long, rpages, 512);
> And here'd we'd use unsigned long.
>
>> +		rc = plpar_tce_stuff((u64)tbl->it_index,
>> +			     	(u64)tcenum << tbl->it_page_shift, 0, limit);
>> +
>> +		rpages -= limit;
>> +		tcenum += limit;
>> +	} while (rpages > 0 && !rc);
>>   
>>   	if (rc && printk_ratelimit()) {
>>   		printk("tce_freemulti_pSeriesLP: plpar_tce_stuff failed\n");
>> -- 
> cheers
