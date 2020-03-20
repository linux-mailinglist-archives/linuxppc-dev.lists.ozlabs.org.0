Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7396D18D15C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 15:44:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kRPw1RgkzDrHY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 01:44:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kRD32V72zDrGq
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 01:36:18 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02KEXQCU167052
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 10:36:13 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yvxn2jffu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 10:36:13 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ldufour@linux.ibm.com>;
 Fri, 20 Mar 2020 14:36:11 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 20 Mar 2020 14:36:08 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02KEZ6H634996734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 14:35:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88622AE05D;
 Fri, 20 Mar 2020 14:36:07 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14320AE051;
 Fri, 20 Mar 2020 14:36:07 +0000 (GMT)
Received: from pomme.local (unknown [9.145.63.10])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 Mar 2020 14:36:06 +0000 (GMT)
Subject: Re: [PATCH 2/2] KVM: PPC: Book3S HV: H_SVM_INIT_START must call
 UV_RETURN
To: bharata@linux.ibm.com
References: <20200320102643.15516-1-ldufour@linux.ibm.com>
 <20200320102643.15516-3-ldufour@linux.ibm.com>
 <20200320112403.GG26049@in.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Date: Fri, 20 Mar 2020 15:36:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320112403.GG26049@in.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20032014-0012-0000-0000-000003948596
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032014-0013-0000-0000-000021D16F34
Message-Id: <f6a71da6-6363-8cba-8215-78b23a046443@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-20_04:2020-03-20,
 2020-03-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 clxscore=1015 suspectscore=3 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003200059
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 20/03/2020 à 12:24, Bharata B Rao a écrit :
> On Fri, Mar 20, 2020 at 11:26:43AM +0100, Laurent Dufour wrote:
>> When the call to UV_REGISTER_MEM_SLOT is failing, for instance because
>> there is not enough free secured memory, the Hypervisor (HV) has to call
>> UV_RETURN to report the error to the Ultravisor (UV). Then the UV will call
>> H_SVM_INIT_ABORT to abort the securing phase and go back to the calling VM.
>>
>> If the kvm->arch.secure_guest is not set, in the return path rfid is called
>> but there is no valid context to get back to the SVM since the Hcall has
>> been routed by the Ultravisor.
>>
>> Move the setting of kvm->arch.secure_guest earlier in
>> kvmppc_h_svm_init_start() so in the return path, UV_RETURN will be called
>> instead of rfid.
>>
>> Cc: Bharata B Rao <bharata@linux.ibm.com>
>> Cc: Paul Mackerras <paulus@ozlabs.org>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>   arch/powerpc/kvm/book3s_hv_uvmem.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> index 79b1202b1c62..68dff151315c 100644
>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> @@ -209,6 +209,8 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
>>   	int ret = H_SUCCESS;
>>   	int srcu_idx;
>>   
>> +	kvm->arch.secure_guest = KVMPPC_SECURE_INIT_START;
>> +
>>   	if (!kvmppc_uvmem_bitmap)
>>   		return H_UNSUPPORTED;
>>   
>> @@ -233,7 +235,6 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
>>   			goto out;
>>   		}
>>   	}
>> -	kvm->arch.secure_guest |= KVMPPC_SECURE_INIT_START;
> 
> There is an assumption that memory slots would have been registered with UV
> if KVMPPC_SECURE_INIT_START has been done. KVM_PPC_SVM_OFF ioctl will skip
> unregistration and other steps during reboot if KVMPPC_SECURE_INIT_START
> hasn't been done.
> 
> Have you checked if that path isn't affected by this change?

I checked that and didn't find any issue there.

My only concern was that block:
	kvm_for_each_vcpu(i, vcpu, kvm) {
		spin_lock(&vcpu->arch.vpa_update_lock);
		unpin_vpa_reset(kvm, &vcpu->arch.dtl);
		unpin_vpa_reset(kvm, &vcpu->arch.slb_shadow);
		unpin_vpa_reset(kvm, &vcpu->arch.vpa);
		spin_unlock(&vcpu->arch.vpa_update_lock);
	}

But that seems to be safe.

However I'm not a familiar with the KVM's code, do you think an additional 
KVMPPC_SECURE_INIT_* value needed here?

Thanks,
Laurent.




