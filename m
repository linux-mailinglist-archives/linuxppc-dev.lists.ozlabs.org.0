Return-Path: <linuxppc-dev+bounces-12033-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C19FDB53609
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 16:44:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cN0h13R9kz2ykc;
	Fri, 12 Sep 2025 00:44:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757601873;
	cv=none; b=JKctv4hg+LiMOQqWqqd7Sh9PEpJ/x50iG4Rcp8LJSEfxzFQgUi/1k56fsG6e//zSnWUajwni1oG/lAdQBWSkfZjlLO9wm9SH3FWQclfnSiUFeq+oTX775Tt8wxrcTBDK1pYE06giUYCTypBeQxsC9H2d0Vy5eaXZecSVJUs6f5xKBfJwpScUEBw8glwEEsdRut7M7tMj5jPgp8Ch5+l6HHd17pySqk1WXQW5Zm+qV4FaDrFzVbNd6FBN10fer04pWbniTyU29CJMPZXyDqbgr8AO/Rcedyaj8swJWuqayBWHa+9d4P0bQ68b87NbGDx4amA+qwymri2j6KdWmjfQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757601873; c=relaxed/relaxed;
	bh=A300undj5JOdmDlmkCy6sIqnoWKox9OnCXUJSWKyxoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/FygoW5CgdY2CFgA3f2f1zdjJqYbzZkSrTm1dRtazl7GTebLn3XSEXx6mFDBghEc3yHcbbsaEkKyJxoV52Gd08fOMFDD/FaNKA4Ihmwjf/USArlOrb6/Qmdgv2E7LFLL6qBJKnDMBfl6WA2gctwQFqsOei2Temqj2dfQcbrgudTve8GHgwQ94iu/c8kBVWcI+j0RB+DiYt+VP8aUciFVPGjT0Z5Hw5aHwp802DnzXo+o61iST0pPi6gYRmg6+0ghS99zDPNh0oBxMHBKFtWep8bnaA1OXX3HMqkWI14WJKnaHAZB2NswinLnx2mUnGtIQg6iXr+ZqPjRmBgCleTJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NouSvw2Q; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NouSvw2Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cN0h03rZTz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 00:44:32 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BA1aGq013271;
	Thu, 11 Sep 2025 14:44:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=A300un
	dj5JOdmDlmkCy6sIqnoWKox9OnCXUJSWKyxoE=; b=NouSvw2QNnkeTHsrI5jAJw
	89dk4CCXz90GZRSdqeVFQCFqwUpVdbjrWwVN+6Dq9L+Nm/1B/OOBBFyFeWrrHvUv
	ufW5IzZIlPgW7HQTXTD5QR5VVzskKUr00TBgR09+BwUcSYUiROTi5f7Y5aDQLj1a
	OEs6y+J1BFINkGG6EV3+Q/PvMcLD8fcjR+3BnUy/O4ZR6pWgLOirpHA3aquOzcz3
	g5qdrNiwgJceHg8+Cb3zJaOhK1PuLY4K7mMOicI1BMEdpB+qWeHJkAWxM5qMo7mo
	zJgFQSJbAmY0mUlJQm2uvUXN1IyM1hi9qI+7tdmak0A0gzi870xoO99chx13RwoA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xyda5mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 14:44:18 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58BETAKo010487;
	Thu, 11 Sep 2025 14:44:18 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xyda5m7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 14:44:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58BCumPp020495;
	Thu, 11 Sep 2025 14:44:16 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 490yp16evb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 14:44:16 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58BEiAKV53215604
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Sep 2025 14:44:10 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF5CC20040;
	Thu, 11 Sep 2025 14:44:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11E5120043;
	Thu, 11 Sep 2025 14:44:02 +0000 (GMT)
Received: from [9.61.95.215] (unknown [9.61.95.215])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 Sep 2025 14:44:01 +0000 (GMT)
Message-ID: <c9ab1c85-f868-4a4a-ada9-58df502ffe3d@linux.ibm.com>
Date: Thu, 11 Sep 2025 20:14:00 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 04/10] sched/core: Dont allow to use CPU marked as
 paravirt
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com,
        rostedt@goodmis.org, dietmar.eggemann@arm.com, vineeth@bitbyteword.org,
        jgross@suse.com, pbonzini@redhat.com, seanjc@google.com,
        mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
 <20250910174210.1969750-5-sshegde@linux.ibm.com>
 <d5605402-b37a-411a-aabc-842b5a924dbe@amd.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <d5605402-b37a-411a-aabc-842b5a924dbe@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SkhAT8dwWp3xYdrSKglBLTnRj3rEx9CF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIzNSBTYWx0ZWRfX0WPEwdPIlM/h
 3C8gF6nm0Xt2OivrMr40D+CwrQoEKG3xQ679XIspDjcalc79FIPMR7Fl6NuVT6dKEVpndRPbrvk
 L573ASuh+rwL50MVCHjVqiqNfQ6gmyXwRU/5hy7RjKU57KUKdM2RuqoRyqCALHrzgpfPMoZDEFV
 vnEdFYRtA/hg7UCOphkSNvG+ob94oT19Uz/Vxsdgw/r3+18izq8P2Y3LFcbhmVN7QVhJHCizEhX
 +gtq9h197gXtKiPFJqsNIZe2wxbfELY0iW+CGyPEZYugwJvZVMeaGQp2FYrswwwMLK8UKQGMOEZ
 0x9GJdtPwgslDbLQfaCClnyZw3T41FI5nOFDdPtt7rPox4I6HTP7v2V/hzu75ENi3z0b1gnBpnr
 8DXK0Uc4
X-Proofpoint-GUID: 5WcYnnhw3T4zSrOOSNGH9LPLvv8uTT_t
X-Authority-Analysis: v=2.4 cv=F59XdrhN c=1 sm=1 tr=0 ts=68c2e042 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=uXBPIk7YWzXHA4pK:21 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=Bjl5kDSpjRqkKk4bOxUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060235
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 9/11/25 10:46 AM, K Prateek Nayak wrote:
> Hello Shrikanth,
> 

Hi Prateek, Thanks for looking into this.

> On 9/10/2025 11:12 PM, Shrikanth Hegde wrote:
>> @@ -2462,8 +2462,13 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>>   		return cpu_online(cpu);
>>   
>>   	/* Non kernel threads are not allowed during either online or offline. */
>> -	if (!(p->flags & PF_KTHREAD))
>> -		return cpu_active(cpu);
>> +	if (!(p->flags & PF_KTHREAD)) {
>> +		/* A user thread shouldn't be allowed on a paravirt cpu */
>> +		if (is_cpu_paravirt(cpu))
>> +			return false;
>> +		else
> 
> nit. redundant "else". I think this can be simplified as:
>

alright.
>      return !is_cpu_paravirt(cpu) && cpu_active(cpu);
> 
>> +			return cpu_active(cpu);
>> +	}
> 


