Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4669B6BC4F6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 04:50:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcYFV0ZCKz3chb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 14:50:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E8I6E0yr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E8I6E0yr;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcYDW4BsBz3cMS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 14:49:46 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32G29T8C022807;
	Thu, 16 Mar 2023 03:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=okTqX7/K87amaPl71PbrDa+8Kx5H1wlOeJsECF458Do=;
 b=E8I6E0yrX5CD10VU3iNjBkM6Q/ACejm9r+r8IQKEL9hbJMhwz4coJLFtPAe2H55a2mpM
 GLF80QEpPVkB9X1Ijw1AgYJn0UviLHXbQO/Hsg6QiyWJ1sLGYwyoOzmsRG98fMy7ze2I
 AWoU4vij+Nhr+VVC+r+aiGxbSKEyRnvm33gLRKa1T5lrJtiy3CaMrxcQU8bo8cQGFtDv
 Dw1Nu8nUFsww1Iu1b5y1jxLvTxeYSePuRxH1igRcETHp9GgkvDbuwdxo6OIOjoj79alm
 2UeR0O63ChCFuOSdf8qsQhQbE3ztb03whTeVAEqmJwb18X/hsotGdDMxBjY2hcHdYUx1 Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbt33swb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 03:49:37 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32G2fKom004608;
	Thu, 16 Mar 2023 03:49:37 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pbt33swaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 03:49:37 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32G1qbjD007748;
	Thu, 16 Mar 2023 03:49:34 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3pbsu7g2se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Mar 2023 03:49:34 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32G3nVOH25887464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Mar 2023 03:49:31 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2FB1A20043;
	Thu, 16 Mar 2023 03:49:31 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91C0720040;
	Thu, 16 Mar 2023 03:49:28 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.10.92])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 16 Mar 2023 03:49:28 +0000 (GMT)
Date: Thu, 16 Mar 2023 09:19:25 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 2/2] arch/powerpc/kvm: kvmppc_hv_entry: remove r4
 argument
Message-ID: <ZBKRxaAynPq2xkKi@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230306123740.3648841-1-kconsul@linux.vnet.ibm.com>
 <20230306123740.3648841-3-kconsul@linux.vnet.ibm.com>
 <875yb2oc0a.fsf@mpe.ellerman.id.au>
 <ZBFVAxAFsUJtuzEy@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <87wn3hmkkj.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wn3hmkkj.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QoRVa-eYUABsZ98ajVoUHZE8n9y-m6TY
X-Proofpoint-ORIG-GUID: mW5hBtcW1qpjP7R5x0xLduWCj6mJE_ef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_02,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303160029
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org, Sathvika Vasireddy <sv@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2023-03-16 14:39:08, Michael Ellerman wrote:
> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> > On 2023-03-15 15:48:53, Michael Ellerman wrote:
> >> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> >> > kvmppc_hv_entry is called from only 2 locations within
> >> > book3s_hv_rmhandlers.S. Both of those locations set r4
> >> > as HSTATE_KVM_VCPU(r13) before calling kvmppc_hv_entry.
> >> > So, shift the r4 load instruction to kvmppc_hv_entry and
> >> > thus modify the calling convention of this function.
> >> >
> >> > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> >> > ---
> >> >  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 9 ++++-----
> >> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >> >
> >> > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> >> > index b81ba4ee0521..da9a15db12fe 100644
> >> > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> >> > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> >> > @@ -85,7 +85,7 @@ _GLOBAL_TOC(kvmppc_hv_entry_trampoline)
> >> >  	RFI_TO_KERNEL
> >> >  
> >> >  kvmppc_call_hv_entry:
> >> > -	ld	r4, HSTATE_KVM_VCPU(r13)
> >> > +	/* Enter guest. */
> >> >  	bl	kvmppc_hv_entry
> >> >  
> >> >  	/* Back from guest - restore host state and return to caller */
> >> > @@ -352,9 +352,7 @@ kvm_secondary_got_guest:
> >> >  	mtspr	SPRN_LDBAR, r0
> >> >  	isync
> >> >  63:
> >> > -	/* Order load of vcpu after load of vcore */
> >> > -	lwsync
> >> 
> >> Where did this barrier go?
> >> 
> >> I don't see that it's covered by any existing barriers in
> >> kvmppc_hv_entry, and you don't add it back anywhere. 
> >
> > My concept about this is that since now the call to kvmppc_hv_entry
> > is first taken before the load to r4 shouldn't the pending load in the
> > pipeline of the HSTATE_KVM_VCORE as per the earlier comment be ordered anyway
> > before-hand ?
> 
> No.
> 
> > Or do you mean to say that pending loads may not be
> > cleared/flushed across the "bl <funcname>" boundary ?
> 
> Right.
> 
> The "bl" imposes no ordering on loads before or after it.
> 
> In general nothing orders two independant loads, other than a barrier.
> 
> cheers

Okay, I will post a patch v3 with lwsync before the load to r4 in
kvmppc_hv_entry.

Thanks.
