Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EB06CBCE5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 12:54:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm64z52Npz3cMT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 21:54:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G+rFcHfu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G+rFcHfu;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm6411k2sz3cF8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 21:53:36 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SAdINF032511;
	Tue, 28 Mar 2023 10:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=qUuaGzd2HTTYHnpTlKUy0pzQVfqheA6W0M9BKg+Btmg=;
 b=G+rFcHfuW/eLa1Fadd+hmng+rgKobwk8zxs21sp/VP0LUSNZJqrqHl05YZn8/ng2g67m
 QSQ720sm+gjPnjyaFZaH6gin2em6HINOP70mjJGuSkP4QMiOXTIJZh8rDaT88+CmT1FK
 70N1A3zQPspRDsOhI9I0BKJKATL1KmegVb5n3SlrIwzc0q5G9a1ofITsyedk2eHkOB65
 Si0qtCbOgczautF68xYMRn39J2fl46ZMX++Emxaq/cdotNm60NvdxAUPckiAO5JSnlIu
 DWnKHVuPpiDUmFoKYhXlVg0Cmy2DokI/+Vg3/lSMAeMUbamH1Dma/tyrhKAsb25yVHJy uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pktdh6y1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 10:53:29 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32SAev87004722;
	Tue, 28 Mar 2023 10:53:28 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pktdh6y0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 10:53:28 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32REGwSU029537;
	Tue, 28 Mar 2023 10:53:22 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3phrk6k9wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 10:53:21 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32SArJJt42074416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 10:53:19 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A58220040;
	Tue, 28 Mar 2023 10:53:19 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B8AD2004B;
	Tue, 28 Mar 2023 10:53:16 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.75.27])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 28 Mar 2023 10:53:16 +0000 (GMT)
Date: Tue, 28 Mar 2023 16:23:11 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] arch/powerpc/kvm: kvmppc_core_vcpu_create_hv: check for
 kzalloc failure
Message-ID: <ZCLHFw1U4Mq/QK2A@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230323074718.2810914-1-kconsul@linux.vnet.ibm.com>
 <87pm8tcir3.fsf@mpe.ellerman.id.au>
 <ZCK96ohvWRY12zZ3@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCK96ohvWRY12zZ3@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sj5XlBHTvz7fA6hTBFW1T6wXX0D09sQ1
X-Proofpoint-GUID: 3Gg4nMwVdxJLi1kOVwCs4NnOJ651YcQe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 suspectscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303280087
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-03-28 15:44:02, Kautuk Consul wrote:
> On 2023-03-28 20:44:48, Michael Ellerman wrote:
> > Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> > > kvmppc_vcore_create() might not be able to allocate memory through
> > > kzalloc. In that case the kvm->arch.online_vcores shouldn't be
> > > incremented.
> > 
> > I agree that looks wrong.
> > 
> > Have you tried to test what goes wrong if it fails? It looks like it
> > will break the LPCR update, which likely will cause the guest to crash
> > horribly.
Also, are you referring to the code in kvmppc_update_lpcr()?
That code will not crash as it checks for the vc before trying to
dereference it.
But the following 2 places that utilize the arch.online_vcores will have
problems in logic if the usermode test-case doesn't pull down the
kvm context after the -ENOMEM vcpu allocation failure:
book3s_hv.c:3030:       if (!kvm->arch.online_vcores) {
book3s_hv_rm_mmu.c:44:  if (kvm->arch.online_vcores == 1 && local_paca->kvm_hstate.kvm_vcpu)

> Not sure about LPCR update, but with and without the patch qemu exits
> and so the kvm context is pulled down fine.
> > 
> > You could use CONFIG_FAIL_SLAB and fail-nth etc. to fail just one
> > allocation for a guest. Or probably easier to just hack the code to fail
> > the 4th time it's called using a static counter.
> I am using live debug and I set the r3 return value to 0x0 after the
> call to kzalloc.
> > 
> > Doesn't really matter but could be interesting.
> With and without this patch qemu quits with:
> qemu-system-ppc64: kvm_init_vcpu: kvm_get_vcpu failed (0): Cannot allocate memory
> 
> That's because qemu will shut down when any vcpu is not able
> to be allocated.
> > 
> > > Add a check for kzalloc failure and return with -ENOMEM from
> > > kvmppc_core_vcpu_create_hv().
> > >
> > > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > > ---
> > >  arch/powerpc/kvm/book3s_hv.c | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> > > index 6ba68dd6190b..e29ee755c920 100644
> > > --- a/arch/powerpc/kvm/book3s_hv.c
> > > +++ b/arch/powerpc/kvm/book3s_hv.c
> > > @@ -2968,13 +2968,17 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
> > >  			pr_devel("KVM: collision on id %u", id);
> > >  			vcore = NULL;
> > >  		} else if (!vcore) {
> > > +			vcore = kvmppc_vcore_create(kvm,
> > > +					id & ~(kvm->arch.smt_mode - 1));
> > 
> > That line doesn't need to be wrapped, we allow 90 columns.
> > 
> > > +			if (unlikely(!vcore)) {
> > > +				mutex_unlock(&kvm->lock);
> > > +				return -ENOMEM;
> > > +			}
> > 
> > Rather than introducing a new return point here, I think it would be
> > preferable to use the existing !vcore case below.
> > 
> > >  			/*
> > >  			 * Take mmu_setup_lock for mutual exclusion
> > >  			 * with kvmppc_update_lpcr().
> > >  			 */
> > > -			err = -ENOMEM;
> > > -			vcore = kvmppc_vcore_create(kvm,
> > > -					id & ~(kvm->arch.smt_mode - 1));
> > 
> > So leave that as is (maybe move the comment down).
> > 
> > And wrap the below in:
> > 
> >  +                      if (vcore) {
> > 
> > >  			mutex_lock(&kvm->arch.mmu_setup_lock);
> > >  			kvm->arch.vcores[core] = vcore;
> > >  			kvm->arch.online_vcores++;
> >  			
> >  			mutex_unlock(&kvm->arch.mmu_setup_lock);
> >  +                      }
> > 		}
> > 	}
> > 
> > Meaning the vcore == NULL case will fall through to here and return via
> > this existing path:
> > 
> > 	mutex_unlock(&kvm->lock);
> > 
> > 	if (!vcore)
> > 		return err;
> > 
> > 
> > cheers
