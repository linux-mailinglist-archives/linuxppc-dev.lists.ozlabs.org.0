Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D6280A4AC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 14:46:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tosq5VHr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Smsqf1scPz3cfQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 00:46:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tosq5VHr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Smspp3PBFz3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Dec 2023 00:45:37 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8DW9P5007074;
	Fri, 8 Dec 2023 13:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Qx9R9+DTlQaKkym29SDOcUwTWtQZtP+au1dCPXcNuhs=;
 b=Tosq5VHrYoVkZVD+323lAXW4JnaqfT3YQT8K/2nI3OGC4Vq5ic3ybb04ci1TZO6OYtdy
 rBg/V1kWPV5j4MxSWdrYmTjc0ZSJtJ24y8yfUj3VK8JU6qaqq4DYNaxSmt3Bk+vQipcj
 0N7o6vGMN+hIrpHcpDiSD1liVgf0zns4YYUfrezMJxTFhFavRHtNFXM85K5I0sp0d9X9
 JIPqkLP5JvAKQqLmsySJ9H9gXRGtQYXr+GrtTTflDwCgNfuwy1Zt32hp036jvXnV8E+i
 SfqX5KPYG9U+UVFpnz3vvB7xB3VPaf9Epny2RcnJqu4oSHW2FhfY3UzXe1rR1bqE1WZK MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uv4400aw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 13:45:29 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B8DYJsu014358;
	Fri, 8 Dec 2023 13:45:29 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uv4400avq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 13:45:28 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B8DNTIV027021;
	Fri, 8 Dec 2023 13:45:28 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3utav39s65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 13:45:27 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B8DjP1h4129434
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Dec 2023 13:45:25 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EED32004D;
	Fri,  8 Dec 2023 13:45:25 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9003120043;
	Fri,  8 Dec 2023 13:45:21 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.171.39.24])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri,  8 Dec 2023 13:45:21 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Fri, 08 Dec 2023 19:15:20 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Subject: Re: [PATCH 01/12] KVM: PPC: Book3S HV nestedv2: Invalidate RPT
 before deleting a guest
In-Reply-To: <878r66xtjt.fsf@kernel.org>
References: <20231201132618.555031-1-vaibhav@linux.ibm.com>
 <20231201132618.555031-2-vaibhav@linux.ibm.com>
 <878r66xtjt.fsf@kernel.org>
Date: Fri, 08 Dec 2023 19:15:20 +0530
Message-ID: <87jzpolsen.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fRpi75ehNiBfjVix_9KQOJvP1cMcR-o6
X-Proofpoint-GUID: TQZEjuibjHeH_Fz5TXGn_UPQQh1bKHZF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-08_09,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=699 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 phishscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312080114
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


Hi Aneesh,

Thanks for looking into this patch. My responses inline below:

"Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org> writes:

> Vaibhav Jain <vaibhav@linux.ibm.com> writes:
>
>> From: Jordan Niethe <jniethe5@gmail.com>
>>
>> An L0 must invalidate the L2's RPT during H_GUEST_DELETE if this has not
>> already been done. This is a slow operation that means H_GUEST_DELETE
>> must return H_BUSY multiple times before completing. Invalidating the
>> tables before deleting the guest so there is less work for the L0 to do.
>>
>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>> ---
>>  arch/powerpc/include/asm/kvm_book3s.h | 1 +
>>  arch/powerpc/kvm/book3s_hv.c          | 6 ++++--
>>  arch/powerpc/kvm/book3s_hv_nested.c   | 2 +-
>>  3 files changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
>> index 4f527d09c92b..a37736ed3728 100644
>> --- a/arch/powerpc/include/asm/kvm_book3s.h
>> +++ b/arch/powerpc/include/asm/kvm_book3s.h
>> @@ -302,6 +302,7 @@ void kvmhv_nested_exit(void);
>>  void kvmhv_vm_nested_init(struct kvm *kvm);
>>  long kvmhv_set_partition_table(struct kvm_vcpu *vcpu);
>>  long kvmhv_copy_tofrom_guest_nested(struct kvm_vcpu *vcpu);
>> +void kvmhv_flush_lpid(u64 lpid);
>>  void kvmhv_set_ptbl_entry(u64 lpid, u64 dw0, u64 dw1);
>>  void kvmhv_release_all_nested(struct kvm *kvm);
>>  long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu);
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 1ed6ec140701..5543e8490cd9 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -5691,10 +5691,12 @@ static void kvmppc_core_destroy_vm_hv(struct kvm *kvm)
>>  			kvmhv_set_ptbl_entry(kvm->arch.lpid, 0, 0);
>>  	}
>>  
>> -	if (kvmhv_is_nestedv2())
>> +	if (kvmhv_is_nestedv2()) {
>> +		kvmhv_flush_lpid(kvm->arch.lpid);
>>  		plpar_guest_delete(0, kvm->arch.lpid);
>>
>
> I am not sure I follow the optimization here. I would expect the
> hypervisor to kill all the translation caches as part of guest_delete.
> What is the benefit of doing a lpid flush outside the guest delete?
>
Thats right. However without this optimization the H_GUEST_DELETE hcall
in plpar_guest_delete() returns H_BUSY multiple times resulting in
multiple hcalls to the hypervisor until it finishes. Flushing the guest
translation cache upfront reduces the number of HCALLs L1 guests has to
make to delete a L2 guest via H_GUEST_DELETE.

>> -	else
>> +	} else {
>>  		kvmppc_free_lpid(kvm->arch.lpid);
>> +	}
>>  
>>  	kvmppc_free_pimap(kvm);
>>  }
>> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
>> index 3b658b8696bc..5c375ec1a3c6 100644
>> --- a/arch/powerpc/kvm/book3s_hv_nested.c
>> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
>> @@ -503,7 +503,7 @@ void kvmhv_nested_exit(void)
>>  	}
>>  }
>>  
>> -static void kvmhv_flush_lpid(u64 lpid)
>> +void kvmhv_flush_lpid(u64 lpid)
>>  {
>>  	long rc;
>>  
>> -- 
>> 2.42.0

-- 
Cheers
~ Vaibhav
