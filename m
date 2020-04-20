Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD911B06BB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 12:40:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495NWL71R3zDqpH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 20:40:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=frankja@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495LFP3vQPzDqgs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 18:58:00 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03K80xL0037634
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 04:25:33 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ghu5hbbr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 04:25:32 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <frankja@linux.ibm.com>;
 Mon, 20 Apr 2020 09:25:08 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Apr 2020 09:24:58 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03K8PJ1r43057442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 08:25:19 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED2F2A4054;
 Mon, 20 Apr 2020 08:25:18 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 578BDA405C;
 Mon, 20 Apr 2020 08:25:17 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.27.207])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Apr 2020 08:25:17 +0000 (GMT)
Subject: Re: [PATCH 1/7] KVM: s390: clean up redundant 'kvm_run' parameters
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, pbonzini@redhat.com,
 tsbogend@alpha.franken.de, paulus@ozlabs.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, david@redhat.com, cohuck@redhat.com,
 heiko.carstens@de.ibm.com, gor@linux.ibm.com,
 sean.j.christopherson@intel.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
 julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com
References: <20200419075106.16248-1-tianjia.zhang@linux.alibaba.com>
 <20200419075106.16248-2-tianjia.zhang@linux.alibaba.com>
 <7a783487-2f9b-08a6-0ff6-f57bb90495a1@de.ibm.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Mon, 20 Apr 2020 10:25:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <7a783487-2f9b-08a6-0ff6-f57bb90495a1@de.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="k9RSmBqTWYAbaP5rKw62ccEG7ES4hYhub"
X-TM-AS-GCONF: 00
x-cbid: 20042008-0012-0000-0000-000003A7CAB9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042008-0013-0000-0000-000021E513B5
Message-Id: <d6e522e2-187e-04f3-440d-62b9d6d3b71f@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_02:2020-04-17,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004200067
X-Mailman-Approved-At: Mon, 20 Apr 2020 20:38:33 +1000
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--k9RSmBqTWYAbaP5rKw62ccEG7ES4hYhub
Content-Type: multipart/mixed; boundary="7j45kMn58mnq4gXwEhb4vbWa5qGQ5JsDC"

--7j45kMn58mnq4gXwEhb4vbWa5qGQ5JsDC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 4/20/20 9:07 AM, Christian Borntraeger wrote:
>=20
>=20
> On 19.04.20 09:51, Tianjia Zhang wrote:
>> In the current kvm version, 'kvm_run' has been included in the 'kvm_vc=
pu'
>> structure. Earlier than historical reasons, many kvm-related function
>> parameters retain the 'kvm_run' and 'kvm_vcpu' parameters at the same =
time.
>> This patch does a unified cleanup of these remaining redundant paramet=
ers.
>>
>> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
>> ---
>>  arch/s390/kvm/kvm-s390.c | 127 +++++++++++++++++++++-----------------=
-
>>  1 file changed, 67 insertions(+), 60 deletions(-)
>>
>> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
>> index 443af3ead739..cf420d013ba3 100644
>> --- a/arch/s390/kvm/kvm-s390.c
>> +++ b/arch/s390/kvm/kvm-s390.c
>> @@ -4173,24 +4173,25 @@ static int __vcpu_run(struct kvm_vcpu *vcpu)
>>  	return rc;
>>  }
>> =20
>> -static void sync_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kvm=
_run)
>> +static void sync_regs_fmt2(struct kvm_vcpu *vcpu)
>>  {
>> +	struct kvm_run *run =3D vcpu->run;
>=20
> Please use kvm_run as variable name. This makes all of the changes belo=
w go away.

Definitely

@Tianjia
This patch produces way to much churn to be picked up as is.
I do not want patches that touch so much for small cosmetic changes.

>=20
>=20
>>  	struct runtime_instr_cb *riccb;
>>  	struct gs_cb *gscb;
>> =20
>> -	riccb =3D (struct runtime_instr_cb *) &kvm_run->s.regs.riccb;
>> -	gscb =3D (struct gs_cb *) &kvm_run->s.regs.gscb;
>> -	vcpu->arch.sie_block->gpsw.mask =3D kvm_run->psw_mask;
>> -	vcpu->arch.sie_block->gpsw.addr =3D kvm_run->psw_addr;
>> -	if (kvm_run->kvm_dirty_regs & KVM_SYNC_ARCH0) {
>> -		vcpu->arch.sie_block->todpr =3D kvm_run->s.regs.todpr;
>> -		vcpu->arch.sie_block->pp =3D kvm_run->s.regs.pp;
>> -		vcpu->arch.sie_block->gbea =3D kvm_run->s.regs.gbea;
>> -	}
>> -	if (kvm_run->kvm_dirty_regs & KVM_SYNC_PFAULT) {
>> -		vcpu->arch.pfault_token =3D kvm_run->s.regs.pft;
>> -		vcpu->arch.pfault_select =3D kvm_run->s.regs.pfs;
>> -		vcpu->arch.pfault_compare =3D kvm_run->s.regs.pfc;
>> +	riccb =3D (struct runtime_instr_cb *) &run->s.regs.riccb;
>> +	gscb =3D (struct gs_cb *) &run->s.regs.gscb;
>> +	vcpu->arch.sie_block->gpsw.mask =3D run->psw_mask;
>> +	vcpu->arch.sie_block->gpsw.addr =3D run->psw_addr;
>> +	if (run->kvm_dirty_regs & KVM_SYNC_ARCH0) {
>> +		vcpu->arch.sie_block->todpr =3D run->s.regs.todpr;
>> +		vcpu->arch.sie_block->pp =3D run->s.regs.pp;
>> +		vcpu->arch.sie_block->gbea =3D run->s.regs.gbea;
>> +	}
>> +	if (run->kvm_dirty_regs & KVM_SYNC_PFAULT) {
>> +		vcpu->arch.pfault_token =3D run->s.regs.pft;
>> +		vcpu->arch.pfault_select =3D run->s.regs.pfs;
>> +		vcpu->arch.pfault_compare =3D run->s.regs.pfc;
>>  		if (vcpu->arch.pfault_token =3D=3D KVM_S390_PFAULT_TOKEN_INVALID)
>>  			kvm_clear_async_pf_completion_queue(vcpu);
>>  	}
>> @@ -4198,7 +4199,7 @@ static void sync_regs_fmt2(struct kvm_vcpu *vcpu=
, struct kvm_run *kvm_run)
>>  	 * If userspace sets the riccb (e.g. after migration) to a valid sta=
te,
>>  	 * we should enable RI here instead of doing the lazy enablement.
>>  	 */
>> -	if ((kvm_run->kvm_dirty_regs & KVM_SYNC_RICCB) &&
>> +	if ((run->kvm_dirty_regs & KVM_SYNC_RICCB) &&
>>  	    test_kvm_facility(vcpu->kvm, 64) &&
>>  	    riccb->v &&
>>  	    !(vcpu->arch.sie_block->ecb3 & ECB3_RI)) {
>> @@ -4209,7 +4210,7 @@ static void sync_regs_fmt2(struct kvm_vcpu *vcpu=
, struct kvm_run *kvm_run)
>>  	 * If userspace sets the gscb (e.g. after migration) to non-zero,
>>  	 * we should enable GS here instead of doing the lazy enablement.
>>  	 */
>> -	if ((kvm_run->kvm_dirty_regs & KVM_SYNC_GSCB) &&
>> +	if ((run->kvm_dirty_regs & KVM_SYNC_GSCB) &&
>>  	    test_kvm_facility(vcpu->kvm, 133) &&
>>  	    gscb->gssm &&
>>  	    !vcpu->arch.gs_enabled) {
>> @@ -4218,10 +4219,10 @@ static void sync_regs_fmt2(struct kvm_vcpu *vc=
pu, struct kvm_run *kvm_run)
>>  		vcpu->arch.sie_block->ecd |=3D ECD_HOSTREGMGMT;
>>  		vcpu->arch.gs_enabled =3D 1;
>>  	}
>> -	if ((kvm_run->kvm_dirty_regs & KVM_SYNC_BPBC) &&
>> +	if ((run->kvm_dirty_regs & KVM_SYNC_BPBC) &&
>>  	    test_kvm_facility(vcpu->kvm, 82)) {
>>  		vcpu->arch.sie_block->fpf &=3D ~FPF_BPBC;
>> -		vcpu->arch.sie_block->fpf |=3D kvm_run->s.regs.bpbc ? FPF_BPBC : 0;=

>> +		vcpu->arch.sie_block->fpf |=3D run->s.regs.bpbc ? FPF_BPBC : 0;
>>  	}
>>  	if (MACHINE_HAS_GS) {
>>  		preempt_disable();
>> @@ -4232,45 +4233,47 @@ static void sync_regs_fmt2(struct kvm_vcpu *vc=
pu, struct kvm_run *kvm_run)
>>  		}
>>  		if (vcpu->arch.gs_enabled) {
>>  			current->thread.gs_cb =3D (struct gs_cb *)
>> -						&vcpu->run->s.regs.gscb;
>> +						&run->s.regs.gscb;
>>  			restore_gs_cb(current->thread.gs_cb);
>>  		}
>>  		preempt_enable();
>>  	}
>> -	/* SIE will load etoken directly from SDNX and therefore kvm_run */
>> +	/* SIE will load etoken directly from SDNX and therefore run */
>>  }
>> =20
>> -static void sync_regs(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run)=

>> +static void sync_regs(struct kvm_vcpu *vcpu)
>>  {
>> -	if (kvm_run->kvm_dirty_regs & KVM_SYNC_PREFIX)
>> -		kvm_s390_set_prefix(vcpu, kvm_run->s.regs.prefix);
>> -	if (kvm_run->kvm_dirty_regs & KVM_SYNC_CRS) {
>> -		memcpy(&vcpu->arch.sie_block->gcr, &kvm_run->s.regs.crs, 128);
>> +	struct kvm_run *run =3D vcpu->run;
>> +
>> +	if (run->kvm_dirty_regs & KVM_SYNC_PREFIX)
>> +		kvm_s390_set_prefix(vcpu, run->s.regs.prefix);
>> +	if (run->kvm_dirty_regs & KVM_SYNC_CRS) {
>> +		memcpy(&vcpu->arch.sie_block->gcr, &run->s.regs.crs, 128);
>>  		/* some control register changes require a tlb flush */
>>  		kvm_make_request(KVM_REQ_TLB_FLUSH, vcpu);
>>  	}
>> -	if (kvm_run->kvm_dirty_regs & KVM_SYNC_ARCH0) {
>> -		kvm_s390_set_cpu_timer(vcpu, kvm_run->s.regs.cputm);
>> -		vcpu->arch.sie_block->ckc =3D kvm_run->s.regs.ckc;
>> +	if (run->kvm_dirty_regs & KVM_SYNC_ARCH0) {
>> +		kvm_s390_set_cpu_timer(vcpu, run->s.regs.cputm);
>> +		vcpu->arch.sie_block->ckc =3D run->s.regs.ckc;
>>  	}
>>  	save_access_regs(vcpu->arch.host_acrs);
>> -	restore_access_regs(vcpu->run->s.regs.acrs);
>> +	restore_access_regs(run->s.regs.acrs);
>>  	/* save host (userspace) fprs/vrs */
>>  	save_fpu_regs();
>>  	vcpu->arch.host_fpregs.fpc =3D current->thread.fpu.fpc;
>>  	vcpu->arch.host_fpregs.regs =3D current->thread.fpu.regs;
>>  	if (MACHINE_HAS_VX)
>> -		current->thread.fpu.regs =3D vcpu->run->s.regs.vrs;
>> +		current->thread.fpu.regs =3D run->s.regs.vrs;
>>  	else
>> -		current->thread.fpu.regs =3D vcpu->run->s.regs.fprs;
>> -	current->thread.fpu.fpc =3D vcpu->run->s.regs.fpc;
>> +		current->thread.fpu.regs =3D run->s.regs.fprs;
>> +	current->thread.fpu.fpc =3D run->s.regs.fpc;
>>  	if (test_fp_ctl(current->thread.fpu.fpc))
>>  		/* User space provided an invalid FPC, let's clear it */
>>  		current->thread.fpu.fpc =3D 0;
>> =20
>>  	/* Sync fmt2 only data */
>>  	if (likely(!kvm_s390_pv_cpu_is_protected(vcpu))) {
>> -		sync_regs_fmt2(vcpu, kvm_run);
>> +		sync_regs_fmt2(vcpu);
>>  	} else {
>>  		/*
>>  		 * In several places we have to modify our internal view to
>> @@ -4282,19 +4285,21 @@ static void sync_regs(struct kvm_vcpu *vcpu, s=
truct kvm_run *kvm_run)
>>  		 * do only accept the condition code from userspace.
>>  		 */
>>  		vcpu->arch.sie_block->gpsw.mask &=3D ~PSW_MASK_CC;
>> -		vcpu->arch.sie_block->gpsw.mask |=3D kvm_run->psw_mask &
>> +		vcpu->arch.sie_block->gpsw.mask |=3D run->psw_mask &
>>  						   PSW_MASK_CC;
>>  	}
>> =20
>> -	kvm_run->kvm_dirty_regs =3D 0;
>> +	run->kvm_dirty_regs =3D 0;
>>  }
>> =20
>> -static void store_regs_fmt2(struct kvm_vcpu *vcpu, struct kvm_run *kv=
m_run)
>> +static void store_regs_fmt2(struct kvm_vcpu *vcpu)
>>  {
>> -	kvm_run->s.regs.todpr =3D vcpu->arch.sie_block->todpr;
>> -	kvm_run->s.regs.pp =3D vcpu->arch.sie_block->pp;
>> -	kvm_run->s.regs.gbea =3D vcpu->arch.sie_block->gbea;
>> -	kvm_run->s.regs.bpbc =3D (vcpu->arch.sie_block->fpf & FPF_BPBC) =3D=3D=
 FPF_BPBC;
>> +	struct kvm_run *run =3D vcpu->run;
>> +
>> +	run->s.regs.todpr =3D vcpu->arch.sie_block->todpr;
>> +	run->s.regs.pp =3D vcpu->arch.sie_block->pp;
>> +	run->s.regs.gbea =3D vcpu->arch.sie_block->gbea;
>> +	run->s.regs.bpbc =3D (vcpu->arch.sie_block->fpf & FPF_BPBC) =3D=3D F=
PF_BPBC;
>>  	if (MACHINE_HAS_GS) {
>>  		__ctl_set_bit(2, 4);
>>  		if (vcpu->arch.gs_enabled)
>> @@ -4310,39 +4315,41 @@ static void store_regs_fmt2(struct kvm_vcpu *v=
cpu, struct kvm_run *kvm_run)
>>  	/* SIE will save etoken directly into SDNX and therefore kvm_run */
>>  }
>> =20
>> -static void store_regs(struct kvm_vcpu *vcpu, struct kvm_run *kvm_run=
)
>> +static void store_regs(struct kvm_vcpu *vcpu)
>>  {
>> -	kvm_run->psw_mask =3D vcpu->arch.sie_block->gpsw.mask;
>> -	kvm_run->psw_addr =3D vcpu->arch.sie_block->gpsw.addr;
>> -	kvm_run->s.regs.prefix =3D kvm_s390_get_prefix(vcpu);
>> -	memcpy(&kvm_run->s.regs.crs, &vcpu->arch.sie_block->gcr, 128);
>> -	kvm_run->s.regs.cputm =3D kvm_s390_get_cpu_timer(vcpu);
>> -	kvm_run->s.regs.ckc =3D vcpu->arch.sie_block->ckc;
>> -	kvm_run->s.regs.pft =3D vcpu->arch.pfault_token;
>> -	kvm_run->s.regs.pfs =3D vcpu->arch.pfault_select;
>> -	kvm_run->s.regs.pfc =3D vcpu->arch.pfault_compare;
>> -	save_access_regs(vcpu->run->s.regs.acrs);
>> +	struct kvm_run *run =3D vcpu->run;
>> +
>> +	run->psw_mask =3D vcpu->arch.sie_block->gpsw.mask;
>> +	run->psw_addr =3D vcpu->arch.sie_block->gpsw.addr;
>> +	run->s.regs.prefix =3D kvm_s390_get_prefix(vcpu);
>> +	memcpy(&run->s.regs.crs, &vcpu->arch.sie_block->gcr, 128);
>> +	run->s.regs.cputm =3D kvm_s390_get_cpu_timer(vcpu);
>> +	run->s.regs.ckc =3D vcpu->arch.sie_block->ckc;
>> +	run->s.regs.pft =3D vcpu->arch.pfault_token;
>> +	run->s.regs.pfs =3D vcpu->arch.pfault_select;
>> +	run->s.regs.pfc =3D vcpu->arch.pfault_compare;
>> +	save_access_regs(run->s.regs.acrs);
>>  	restore_access_regs(vcpu->arch.host_acrs);
>>  	/* Save guest register state */
>>  	save_fpu_regs();
>> -	vcpu->run->s.regs.fpc =3D current->thread.fpu.fpc;
>> +	run->s.regs.fpc =3D current->thread.fpu.fpc;
>>  	/* Restore will be done lazily at return */
>>  	current->thread.fpu.fpc =3D vcpu->arch.host_fpregs.fpc;
>>  	current->thread.fpu.regs =3D vcpu->arch.host_fpregs.regs;
>>  	if (likely(!kvm_s390_pv_cpu_is_protected(vcpu)))
>> -		store_regs_fmt2(vcpu, kvm_run);
>> +		store_regs_fmt2(vcpu);
>>  }
>> =20
>>  int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>>  {
>> -	struct kvm_run *kvm_run =3D vcpu->run;
>> +	struct kvm_run *run =3D vcpu->run;
>>  	int rc;
>> =20
>> -	if (kvm_run->immediate_exit)
>> +	if (run->immediate_exit)
>>  		return -EINTR;
>> =20
>> -	if (kvm_run->kvm_valid_regs & ~KVM_SYNC_S390_VALID_FIELDS ||
>> -	    kvm_run->kvm_dirty_regs & ~KVM_SYNC_S390_VALID_FIELDS)
>> +	if (run->kvm_valid_regs & ~KVM_SYNC_S390_VALID_FIELDS ||
>> +	    run->kvm_dirty_regs & ~KVM_SYNC_S390_VALID_FIELDS)
>>  		return -EINVAL;
>> =20
>>  	vcpu_load(vcpu);
>> @@ -4368,14 +4375,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *v=
cpu)
>>  		goto out;
>>  	}
>> =20
>> -	sync_regs(vcpu, kvm_run);
>> +	sync_regs(vcpu);
>>  	enable_cpu_timer_accounting(vcpu);
>> =20
>>  	might_fault();
>>  	rc =3D __vcpu_run(vcpu);
>> =20
>>  	if (signal_pending(current) && !rc) {
>> -		kvm_run->exit_reason =3D KVM_EXIT_INTR;
>> +		run->exit_reason =3D KVM_EXIT_INTR;
>>  		rc =3D -EINTR;
>>  	}
>> =20
>> @@ -4390,7 +4397,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcp=
u)
>>  	}
>> =20
>>  	disable_cpu_timer_accounting(vcpu);
>> -	store_regs(vcpu, kvm_run);
>> +	store_regs(vcpu);
>> =20
>>  	kvm_sigset_deactivate(vcpu);
>> =20
>>



--7j45kMn58mnq4gXwEhb4vbWa5qGQ5JsDC--

--k9RSmBqTWYAbaP5rKw62ccEG7ES4hYhub
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl6dXGwACgkQ41TmuOI4
ufjdvQ//YjHAPeQfGQn1w4S0yNXye7v/Jwl2Zaa5286dQDyhsMnYOKtrc3oz/cCM
tZjRocVRfjlExANAaEt6i1pOakrh6iAkTkyPnCEG1fhdC5eRqO9LYqTLBXWnXjhM
IBeJqoajbgCUN8FOJv02mjN52wmXhjxexJXZwtwE9tcGCNDUP+9yU5S6Qgw9Lqqi
R+N66U7na38EcizvZK+BJoJkiO1DnL2Jc+wyQssULWZiqCyGQEIGJNPkW7qvqRV1
IFMUnH5gryrF4tdbuoJk8N5EPkOoYbkMc5mWV/Y6opUuLgtKFaLul9m2eOAmZuKG
dYGsjp9exQq5SXJIDaJaL8n1jpQgmAOodN5420uvdIsOmoyh9GCJ01II3Y0+GUpM
rpMjbleasKzbQwWzGiZt7IGFZSgjo3PoA3JaqbGXrdJGUbtqUolPOWN3EJR4JDvr
37FLPFoXcoAN6hixxGwRv+JF516S9cpSzE6zEeNCcQRiMP/mzK14qUa/k4DSjBss
AdcafuOPOIaC5lfMyTXBJYCzik55V+swgAiI402SY0NFy/uJFEF+obIVA4vau50o
ynlo3RxdSx+oPN8T47PYG3F8F5XfbQIpwAfGmv2AQ42j5wMYWFNFZncacDV+YIhq
+hoIV+bKjILnW2x8yJhrbJnxnMPRQCke+jsqbxhYCCJiE6aPMo0=
=Ye8W
-----END PGP SIGNATURE-----

--k9RSmBqTWYAbaP5rKw62ccEG7ES4hYhub--

