Return-Path: <linuxppc-dev+bounces-146-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A372C9553E2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2024 01:45:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YTiFNcuD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WlzB72vJsz2ysc;
	Sat, 17 Aug 2024 09:45:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YTiFNcuD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WlpH02XFsz2xGt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2024 03:03:39 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47GEDxPV003524;
	Fri, 16 Aug 2024 17:03:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=N
	YwvZk+5mNAickrzJRjaPdeporeE+DX1soeB/tEeuDE=; b=YTiFNcuDrgh7nt7sd
	Yqy5qJ6I6GbODIxJwioeepF5jMx7wMG5t+9bbXo+iAHQgMH1wzqOPVmOflGRJbt8
	ltJkQn5sGeOsy/+tiKQdaF/E/aeSZD8FEk0RD+ESawsURGr7dTLoSpRipQly0kgx
	d827Ss2d5v66byk1/sHjZUyWlweQiSl5G/R0h4h0JuViqUmz28WtbIEr/T3xgwdK
	dkBd4Xmtev1RSktnpGdD98EY+4N+qcDwlXarEL6HjTD6lo3i6UVExusS/y1j2Uhu
	iB/HqLvgorCskb2kg5j4suf6icGzQM/u3DHm2QyiXPpa4qe9GehW8Oi/fs1X1htA
	+R67Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4111d6sdjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 17:03:31 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47GH3VLv026071;
	Fri, 16 Aug 2024 17:03:31 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4111d6sdjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 17:03:31 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 47GF2HvP010122;
	Fri, 16 Aug 2024 17:03:30 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40xjx14r1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 17:03:30 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47GH3OGR54264264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Aug 2024 17:03:26 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A12FB20043;
	Fri, 16 Aug 2024 17:03:24 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3692420040;
	Fri, 16 Aug 2024 17:03:23 +0000 (GMT)
Received: from [9.124.214.156] (unknown [9.124.214.156])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Aug 2024 17:03:23 +0000 (GMT)
Message-ID: <252ed56a-cec7-4d3e-b90e-fa8798856ee2@linux.ibm.com>
Date: Fri, 16 Aug 2024 22:33:22 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] powerpc/pseries: Add failure related checks for
 h_get_mpp and h_get_ppp
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: mpe@ellerman.id.au, nathanl@linux.ibm.com, tyreld@linux.ibm.com,
        npiggin@gmail.com, mahesh@linux.ibm.com, naveen.n.rao@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
References: <20240412092047.455483-1-sshegde@linux.ibm.com>
 <20240412092047.455483-3-sshegde@linux.ibm.com>
 <20240815195355.GW26466@kitsune.suse.cz>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20240815195355.GW26466@kitsune.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8XOM7eTpC-3Sr2cPZWVrG2eO6uFYi54U
X-Proofpoint-GUID: dlkRi8ghyCfWoAPWBYr_krDjUdhFuPMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_11,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408160120



On 8/16/24 01:23, Michal Suchánek wrote:
> On Fri, Apr 12, 2024 at 02:50:47PM +0530, Shrikanth Hegde wrote:
>> Couple of Minor fixes:
>>
>> - hcall return values are long. Fix that for h_get_mpp, h_get_ppp and
>> parse_ppp_data
>>
>> - If hcall fails, values set should be at-least zero. It shouldn't be
>> uninitialized values. Fix that for h_get_mpp and h_get_ppp
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/hvcall.h        | 2 +-
>>   arch/powerpc/platforms/pseries/lpar.c    | 6 +++---
>>   arch/powerpc/platforms/pseries/lparcfg.c | 6 +++---
>>   3 files changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
>> index a41e542ba94d..3d642139b900 100644
>> --- a/arch/powerpc/include/asm/hvcall.h
>> +++ b/arch/powerpc/include/asm/hvcall.h
>> @@ -570,7 +570,7 @@ struct hvcall_mpp_data {
>>   	unsigned long backing_mem;
>>   };
>>
>> -int h_get_mpp(struct hvcall_mpp_data *);
>> +long h_get_mpp(struct hvcall_mpp_data *mpp_data);
>>
>>   struct hvcall_mpp_x_data {
>>   	unsigned long coalesced_bytes;
>> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
>> index 4e9916bb03d7..c1d8bee8f701 100644
>> --- a/arch/powerpc/platforms/pseries/lpar.c
>> +++ b/arch/powerpc/platforms/pseries/lpar.c
>> @@ -1886,10 +1886,10 @@ notrace void __trace_hcall_exit(long opcode, long retval, unsigned long *retbuf)
>>    * h_get_mpp
>>    * H_GET_MPP hcall returns info in 7 parms
>>    */
>> -int h_get_mpp(struct hvcall_mpp_data *mpp_data)
>> +long h_get_mpp(struct hvcall_mpp_data *mpp_data)
>>   {
>> -	int rc;
>> -	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
>> +	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
>> +	long rc;
>>
>>   	rc = plpar_hcall9(H_GET_MPP, retbuf);
>>
>> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
>> index 5c2a3e802a02..ed2176d8a866 100644
>> --- a/arch/powerpc/platforms/pseries/lparcfg.c
>> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
>> @@ -113,8 +113,8 @@ struct hvcall_ppp_data {
>>    */
>>   static unsigned int h_get_ppp(struct hvcall_ppp_data *ppp_data)
> Hello,
> 
> Shouldn't the      ^^^ return value also be long?
> 
> Thanks
> 

Yes. You are right. missed to notice that. Thanks for pointing it out.

There might be other places where similar pattern maybe there.
Will fix it.

> Michal
>>   {
>> -	unsigned long rc;
>> -	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
>> +	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
>> +	long rc;
>>
>>   	rc = plpar_hcall9(H_GET_PPP, retbuf);
>>
>> @@ -197,7 +197,7 @@ static void parse_ppp_data(struct seq_file *m)
>>   	struct hvcall_ppp_data ppp_data;
>>   	struct device_node *root;
>>   	const __be32 *perf_level;
>> -	int rc;
>> +	long rc;
>>
>>   	rc = h_get_ppp(&ppp_data);
>>   	if (rc)
>> --
>> 2.39.3
>>


