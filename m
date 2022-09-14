Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944A75B888D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 14:47:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSKqb15zVz3bmc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 22:47:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iuGGGJQH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=disgoel@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iuGGGJQH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSHvm3Bqfz2yng
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 21:21:08 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28EB6d1r019603;
	Wed, 14 Sep 2022 11:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=VdaY1ss5jI1UueqF6enJdRxMbO+n35cZmvfPWiCNsI0=;
 b=iuGGGJQH9oPkNpEu6FT+qMkCEyGGfW4QM2nQ2xF0yC7stfBNR1GuZtZaOKL5EnwzQKVX
 d1lm4SyZWoyMHmqC+4PsHtesGc7p6qQkJkneXD7TDijygq4y9xes8KIWFaCbxcbptgIN
 kFCKsYzseoU3SUNZTG3KWoAM2UNhn2+wY5Q4L6L8HLaGKyzvPkMomUyRkTi50asHWF7x
 oxFQ0ehTuwry0I3SjlHNA8091mSnch/2Z1hShDSoDi8iu7qDalJhndAEy0NTUD8vFVT2
 Fnnci2I0j31oitpgAtmCr5SZCzE708/JSY3vVsZr0XawhnHZG1goSGABP8oMvxKsoBni eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkc7gbavt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Sep 2022 11:20:59 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28EBJphL032207;
	Wed, 14 Sep 2022 11:20:59 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jkc7gbaue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Sep 2022 11:20:58 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28EB55gN026413;
	Wed, 14 Sep 2022 11:20:56 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06fra.de.ibm.com with ESMTP id 3jjymmrnu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Sep 2022 11:20:56 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28EBKqxF36962668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Sep 2022 11:20:52 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0D20AE051;
	Wed, 14 Sep 2022 11:20:52 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D322AAE045;
	Wed, 14 Sep 2022 11:20:50 +0000 (GMT)
Received: from [9.43.66.254] (unknown [9.43.66.254])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 14 Sep 2022 11:20:50 +0000 (GMT)
Message-ID: <1ec61e92-3d7f-c74f-e5d5-50b93c48516d@linux.ibm.com>
Date: Wed, 14 Sep 2022 16:50:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 0/4] Remove unused macros from asm-offset
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Disha Goel <disgoel@linux.vnet.ibm.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>
References: <20220913074025.132160-1-disgoel@linux.vnet.ibm.com>
 <1fa0b040-a9ec-aa22-e928-55df91bad19a@csgroup.eu>
From: Disha Goel <disgoel@linux.ibm.com>
In-Reply-To: <1fa0b040-a9ec-aa22-e928-55df91bad19a@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rWg1mGF6DEKAHkFYM-aWybQ_kO11HFdg
X-Proofpoint-ORIG-GUID: nrWa3ylgy_jhc8AqUoGbBHDMsNhVtSka
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-14_03,2022-09-14_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2208220000 definitions=main-2209140054
X-Mailman-Approved-At: Wed, 14 Sep 2022 22:47:04 +1000
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
Cc: "kjain@linux.ibm.com" <kjain@linux.ibm.com>, "atrajeev@linux.vnet.ibm.com" <atrajeev@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 9/13/22 1:45 PM, Christophe Leroy wrote:
>
> Le 13/09/2022 à 09:40, Disha Goel a écrit :
>> There were commits which did code refactoring and converting some of kvm
>> assembly routines to C. When doing it, many of the asm-offset macro
>> definitions were missed to remove. Patchset here removes those.
>>
>> Patch1 removes usage of KVM_TLB_SETS macro from the asm-offset
>>
>> Patch2 removes KVM_RADIX macro from the asm-offset.c
>>
>> Patch3 removes a set of unused kvm vcpu and hstate macros from the
>> asm-offset.c
>>
>> Patch4 removes unused HSTATE/host_mmcr references for MMCR3/SIER2/SIER3
> I think you can squash all changes to asm-offsets.c into a single patch.
> The Fixes: tags are unrelevant, you are not fixing a real bug, it's just
> a cleanup.
>
> Then have a second patch that reduces the size of host_mmcr[] in
> kvmppc_host_state struct.

Hi Christophe,

Thanks for reviewing the patchset. I will send v2 patchset with 
mentioned changes.


Thanks

Disha

> Thanks
> Christophe
>
>> Link to the script used to get unused macro:
>> https://github.com/maddy-kerneldev/scripts/blob/master/check_asm-offset.sh
>>
>> Link to linux-ci job result:
>> https://github.com/disgoel/linux-ci/actions
>>
>> Disha Goel (3):
>>     powerpc/asm-offset: Remove unused KVM_TLB_SETS macros
>>     powerpc/asm-offset: Remove unused KVM_RADIX macros
>>     powerpc/kvm: Remove unused macros from asm-offset
>>
>> Kajol Jain (1):
>>     powerpc/kvm: Remove unused references for MMCR3/SIER2/SIER3 registers
>>
>>    arch/powerpc/include/asm/kvm_book3s_asm.h |  2 +-
>>    arch/powerpc/kernel/asm-offsets.c         | 25 -----------------------
>>    2 files changed, 1 insertion(+), 26 deletions(-)
