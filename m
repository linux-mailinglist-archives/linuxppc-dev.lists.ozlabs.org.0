Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C11818EEDE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 05:23:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m1TS6BV2zDq96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 15:23:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m1RB55g1zDqv1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 15:21:26 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02N43OKt039371
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 00:21:24 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywet16k7f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 00:21:23 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Mon, 23 Mar 2020 04:21:22 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 23 Mar 2020 04:21:18 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02N4LI7c54526146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Mar 2020 04:21:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFDE4AE045;
 Mon, 23 Mar 2020 04:21:17 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1AFCAE053;
 Mon, 23 Mar 2020 04:21:16 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.43.35])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 23 Mar 2020 04:21:16 +0000 (GMT)
Date: Mon, 23 Mar 2020 09:51:14 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH 2/2] KVM: PPC: Book3S HV: H_SVM_INIT_START must call
 UV_RETURN
References: <20200320102643.15516-1-ldufour@linux.ibm.com>
 <20200320102643.15516-3-ldufour@linux.ibm.com>
 <20200320112403.GG26049@in.ibm.com>
 <f6a71da6-6363-8cba-8215-78b23a046443@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6a71da6-6363-8cba-8215-78b23a046443@linux.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 20032304-4275-0000-0000-000003B138A4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032304-4276-0000-0000-000038C66D81
Message-Id: <20200323042114.GH26049@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-22_08:2020-03-21,
 2020-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=2
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003230024
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
Reply-To: bharata@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 20, 2020 at 03:36:05PM +0100, Laurent Dufour wrote:
> Le 20/03/2020 à 12:24, Bharata B Rao a écrit :
> > On Fri, Mar 20, 2020 at 11:26:43AM +0100, Laurent Dufour wrote:
> > > When the call to UV_REGISTER_MEM_SLOT is failing, for instance because
> > > there is not enough free secured memory, the Hypervisor (HV) has to call
> > > UV_RETURN to report the error to the Ultravisor (UV). Then the UV will call
> > > H_SVM_INIT_ABORT to abort the securing phase and go back to the calling VM.
> > > 
> > > If the kvm->arch.secure_guest is not set, in the return path rfid is called
> > > but there is no valid context to get back to the SVM since the Hcall has
> > > been routed by the Ultravisor.
> > > 
> > > Move the setting of kvm->arch.secure_guest earlier in
> > > kvmppc_h_svm_init_start() so in the return path, UV_RETURN will be called
> > > instead of rfid.
> > > 
> > > Cc: Bharata B Rao <bharata@linux.ibm.com>
> > > Cc: Paul Mackerras <paulus@ozlabs.org>
> > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> > > ---
> > >   arch/powerpc/kvm/book3s_hv_uvmem.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > index 79b1202b1c62..68dff151315c 100644
> > > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > > @@ -209,6 +209,8 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
> > >   	int ret = H_SUCCESS;
> > >   	int srcu_idx;
> > > +	kvm->arch.secure_guest = KVMPPC_SECURE_INIT_START;
> > > +
> > >   	if (!kvmppc_uvmem_bitmap)
> > >   		return H_UNSUPPORTED;
> > > @@ -233,7 +235,6 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
> > >   			goto out;
> > >   		}
> > >   	}
> > > -	kvm->arch.secure_guest |= KVMPPC_SECURE_INIT_START;
> > 
> > There is an assumption that memory slots would have been registered with UV
> > if KVMPPC_SECURE_INIT_START has been done. KVM_PPC_SVM_OFF ioctl will skip
> > unregistration and other steps during reboot if KVMPPC_SECURE_INIT_START
> > hasn't been done.
> > 
> > Have you checked if that path isn't affected by this change?
> 
> I checked that and didn't find any issue there.
> 
> My only concern was that block:
> 	kvm_for_each_vcpu(i, vcpu, kvm) {
> 		spin_lock(&vcpu->arch.vpa_update_lock);
> 		unpin_vpa_reset(kvm, &vcpu->arch.dtl);
> 		unpin_vpa_reset(kvm, &vcpu->arch.slb_shadow);
> 		unpin_vpa_reset(kvm, &vcpu->arch.vpa);
> 		spin_unlock(&vcpu->arch.vpa_update_lock);
> 	}
> 
> But that seems to be safe.

Yes, looks like.

> 
> However I'm not a familiar with the KVM's code, do you think an additional
> KVMPPC_SECURE_INIT_* value needed here?

May be not as long as UV can handle the unexpected uv_unregister_mem_slot()
calls, we are good.

Regards,
Bharata.

