Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEB58165D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 05:56:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Uuojkkpe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4StnbP6TRKz3bqP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 15:56:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Uuojkkpe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4StnZT3YnVz30hF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 15:55:28 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BI4N57Z023466;
	Mon, 18 Dec 2023 04:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=dyjnPnZ3hP4sSdFpgG3DJYQ2s/6vp6EuYjygih2dsMg=;
 b=UuojkkpeSTUa96uz0iKtwW9xeJ9bWwfjqHejhQVn8xW4KwhknoZEfddghkNFa+FbkedV
 NRf1HAC/Dc568qYjtTN3+DAwO1P9AlYRVgPTaEEaB0EcOviU9ymCfe178FSLyeDxbcEy
 0OCzm3Nk08iOls+l7L3b5K1ouQFOeR0sDiBZBnFU0mYomR+13owlc1krLXmqmtYgUMLn
 dPpD9T5Q5TQY1JjANtneeUaEIDH43xIn/pAXnYN4VUDkBdnRQAC346ZB7SJhJsQpJyuc
 1bxiHMZUUWb+Av7wFespRuAyB+nO77M2FFi+bMJt8wzNA9h9o8ApBDVNe4W0OXNX5akq BQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v2f0p0nrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 04:55:14 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BI4jtBS016047;
	Mon, 18 Dec 2023 04:55:14 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v2f0p0nqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 04:55:13 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BI4F54l012308;
	Mon, 18 Dec 2023 04:55:13 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3v1rx1e7ns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 04:55:13 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BI4tAmW43188640
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 18 Dec 2023 04:55:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14F812004B;
	Mon, 18 Dec 2023 04:55:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B4D820040;
	Mon, 18 Dec 2023 04:54:55 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.67.88.179])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon, 18 Dec 2023 04:54:54 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 18 Dec 2023 10:24:51 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Subject: Re: [PATCH 01/12] KVM: PPC: Book3S HV nestedv2: Invalidate RPT
 before deleting a guest
In-Reply-To: <87r0jntpf8.fsf@kernel.org>
References: <20231201132618.555031-1-vaibhav@linux.ibm.com>
 <20231201132618.555031-2-vaibhav@linux.ibm.com>
 <878r66xtjt.fsf@kernel.org> <87jzpolsen.fsf@vajain21.in.ibm.com>
 <87r0jntpf8.fsf@kernel.org>
Date: Mon, 18 Dec 2023 10:24:51 +0530
Message-ID: <8734w0az50.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DXBkf98tLjwrV10hfZmzXMr0d_AhLKfF
X-Proofpoint-GUID: -7xeJE62nHDf_RxHV5bLL0UxTFZuCjhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-18_02,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxlogscore=700 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312180032
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, gautam@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@kernel.org> writes:

> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>
>> Hi Aneesh,
>>
>> Thanks for looking into this patch. My responses inline below:
>>
>> "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org> writes:
>>
>>> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>>>
>>>> From: Jordan Niethe <jniethe5@gmail.com>
>>>>
>>>> An L0 must invalidate the L2's RPT during H_GUEST_DELETE if this has not
>>>> already been done. This is a slow operation that means H_GUEST_DELETE
>>>> must return H_BUSY multiple times before completing. Invalidating the
>>>> tables before deleting the guest so there is less work for the L0 to do.
>>>>
>>>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>>>> ---
>>>>  arch/powerpc/include/asm/kvm_book3s.h | 1 +
>>>>  arch/powerpc/kvm/book3s_hv.c          | 6 ++++--
>>>>  arch/powerpc/kvm/book3s_hv_nested.c   | 2 +-
>>>>  3 files changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
>>>> index 4f527d09c92b..a37736ed3728 100644
>>>> --- a/arch/powerpc/include/asm/kvm_book3s.h
>>>> +++ b/arch/powerpc/include/asm/kvm_book3s.h
>>>> @@ -302,6 +302,7 @@ void kvmhv_nested_exit(void);
>>>>  void kvmhv_vm_nested_init(struct kvm *kvm);
>>>>  long kvmhv_set_partition_table(struct kvm_vcpu *vcpu);
>>>>  long kvmhv_copy_tofrom_guest_nested(struct kvm_vcpu *vcpu);
>>>> +void kvmhv_flush_lpid(u64 lpid);
>>>>  void kvmhv_set_ptbl_entry(u64 lpid, u64 dw0, u64 dw1);
>>>>  void kvmhv_release_all_nested(struct kvm *kvm);
>>>>  long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
>>>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>>>> index 1ed6ec140701..5543e8490cd9 100644
>>>> --- a/arch/powerpc/kvm/book3s_hv.c
>>>> +++ b/arch/powerpc/kvm/book3s_hv.c
>>>> @@ -5691,10 +5691,12 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
>>>>  			kvmhv_set_ptbl_entry(kvm->arch.lpid, 0, 0);
>>>>  	}
>>>>  
>>>> -	if (kvmhv_is_nestedv2())
>>>> +	if (kvmhv_is_nestedv2()) {
>>>> +		kvmhv_flush_lpid(kvm->arch.lpid);
>>>>  		plpar_guest_delete(0, kvm->arch.lpid);
>>>>
>>>
>>> I am not sure I follow the optimization here. I would expect the
>>> hypervisor to kill all the translation caches as part of guest_delete.
>>> What is the benefit of doing a lpid flush outside the guest delete?
>>>
>> Thats right. However without this optimization the H_GUEST_DELETE hcall
>> in plpar_guest_delete() returns H_BUSY multiple times resulting in
>> multiple hcalls to the hypervisor until it finishes. Flushing the guest
>> translation cache upfront reduces the number of HCALLs L1 guests has to
>> make to delete a L2 guest via H_GUEST_DELETE.
>>
>
> can we add that as a comment above that kvmhv_flush_lpid()?
Sure, I will put up a comment with that detail in v2 of the patch
series.

>
> -aneesh

-- 
Cheers
~ Vaibhav
