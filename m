Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A06B580C02E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 04:58:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P43UX1lQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpSdT1BNFz3vc0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 14:58:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P43UX1lQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpScc0wmrz3bWy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 14:57:19 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BB2hs1b007019;
	Mon, 11 Dec 2023 03:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=BLtsa918ZgRZFi2S//QKx1zCL7DoNzrZoa/U4m3OexI=;
 b=P43UX1lQXpe4kfJ0tfga7XoTX3fvANNCqUDzKFKmCeWaRtvG5Ey8AQjQ4LVuwgGwWd5X
 dOW1xFrtDgouAm5LFD1od16kzD8hE63iaYyMr5g44YyS4kVGMZcbDW2KVniD1WFrS4Wi
 dzNl/M/3Hf/SMcJWCTRe0fhRpnutnEGdZCd3g0mBOQvuF8JkGQD5K3zg3/kGlaik7xjb
 C8psJ6vv+oZhyp9sf7GdtalOXQipKnoDHji2HZQ9OuEMtGHP/fUn1V9wOdC2CmsOs0vf
 6q06BtCP8pXAlY546Tc8lX5vn8SiyR6oGIrwND1aUnlllQFEO2x7tuvhkiigOziJ7wVS QA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uwms7pu47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 03:57:08 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BB3moKi021678;
	Mon, 11 Dec 2023 03:57:07 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uwms7pu3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 03:57:07 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BB2mB8J004701;
	Mon, 11 Dec 2023 03:57:06 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw4sjxfhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 03:57:06 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BB3v3u465929626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Dec 2023 03:57:03 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A549F2004B;
	Mon, 11 Dec 2023 03:57:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81BDD20040;
	Mon, 11 Dec 2023 03:56:56 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.61.188.12])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 11 Dec 2023 03:56:56 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 11 Dec 2023 09:26:54 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Subject: Re: [PATCH 09/12] KVM: PPC: Book3S HV nestedv2: Do not call
 H_COPY_TOFROM_GUEST
In-Reply-To: <87sf4dun37.fsf@kernel.org>
References: <20231201132618.555031-1-vaibhav@linux.ibm.com>
 <20231201132618.555031-10-vaibhav@linux.ibm.com>
 <87sf4dun37.fsf@kernel.org>
Date: Mon, 11 Dec 2023 09:26:54 +0530
Message-ID: <87jzplmlx5.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7ARY0rvQH592Xv77s2wD2O4jIDK9sS4f
X-Proofpoint-GUID: dtwv7jACUynZ6lNyt-Zh0gMZnstqprYb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-10_16,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 mlxlogscore=655 clxscore=1015 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312110031
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Aneesh,

Thanks for looking into this patch. My responses inline:

"Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org> writes:

<snip>
> May be we should use
> firmware_has_feature(FW_FEATURE_H_COPY_TOFROM_GUEST))?
>
> the nestedv2 can end up using the above hcall if it is supported by the
> hypervisor right? In its absence we will have to translate the guest ea
> using xlate and then use kvm_guest_read to read location using the guest
> real address right? That xlate will also involves multiple kvm_guest_read.
>
>
Yes, Agreed and thats a nice suggestion. However ATM the hypervisor
supporting Nestedv2 doesnt have support for this hcall. In future once
we have support for this hcall for nestedv2 from the hypervisor we can
replace this branch with a firmware_has_feature() test.

>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>> ---
>>  arch/powerpc/kvm/book3s_64_mmu_radix.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
>> index 916af6c153a5..4a1abb9f7c05 100644
>> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
>> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
>> @@ -40,6 +40,9 @@ unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
>>  	unsigned long quadrant, ret = n;
>>  	bool is_load = !!to;
>>  
>> +	if (kvmhv_is_nestedv2())
>> +		return H_UNSUPPORTED;
>> +
>>  	/* Can't access quadrants 1 or 2 in non-HV mode, call the HV to do it */
>>  	if (kvmhv_on_pseries())
>>  		return plpar_hcall_norets(H_COPY_TOFROM_GUEST, lpid, pid, eaddr,
>> -- 
>> 2.42.0

-- 
Cheers
~ Vaibhav
