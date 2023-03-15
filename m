Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B29876BA734
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 06:38:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbzhH4LRhz3cfj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 16:38:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hBpMJBjG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hBpMJBjG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbzgH3ZsHz3c6v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 16:37:30 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32F3n54D012678;
	Wed, 15 Mar 2023 05:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=7AbFI77fyXIqtPy/Xk+3LQmignTXCQoMAXq+jL3GaOw=;
 b=hBpMJBjG6khXPDpwXBHakBXxRXdYxwoABt5ysiRBCUX9wJ2Kvv1nfcielkLTY3CTz0rH
 f3qbVNUqRHuNX5nM+QwT2jfjeLSczwegj4oWO/7NouXAP6W5XgXIToh/BFDb9r24EOZa
 BKe0eIITARJozi3FuwEbEyC/3vwFPZPuP5rCWosWtPlhC5o0JWNhGgYkuGMsoCgKl/m3
 Bgw2wGDRo8HwlS4WPutaTFnr8a5VkWUZClihAD3VpDBtqwKkubMC7s8z4A06lg2J+RjY
 n7gRGEYYS4jjCk0r1RwnAAXsb5SSkJZLdbkYTUxU2LQKL3OICl/ahr7zN2/NSxGr7QCj Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb6eua3xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 05:37:22 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32F5bMwR022217;
	Wed, 15 Mar 2023 05:37:22 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pb6eua3x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 05:37:21 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32EN63kA032335;
	Wed, 15 Mar 2023 05:37:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3pb29u8ava-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 05:37:19 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32F5bFgc24904336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Mar 2023 05:37:16 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D563B20043;
	Wed, 15 Mar 2023 05:37:15 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B4772004D;
	Wed, 15 Mar 2023 05:37:13 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.57.144])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 15 Mar 2023 05:37:13 +0000 (GMT)
Date: Wed, 15 Mar 2023 11:07:10 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 2/2] arch/powerpc/kvm: kvmppc_hv_entry: remove r4
 argument
Message-ID: <ZBFZhh1EHha1E66H@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230306123740.3648841-1-kconsul@linux.vnet.ibm.com>
 <20230306123740.3648841-3-kconsul@linux.vnet.ibm.com>
 <875yb2oc0a.fsf@mpe.ellerman.id.au>
 <ZBFVAxAFsUJtuzEy@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBFVAxAFsUJtuzEy@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cpQvR2FHc3OWmV2KlDrKG_seNWK4TZHE
X-Proofpoint-ORIG-GUID: lQVIn8qctHt85d6bGd6Xxm5KJwTXg5Mj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_02,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150048
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

On 2023-03-15 10:48:01, Kautuk Consul wrote:
> On 2023-03-15 15:48:53, Michael Ellerman wrote:
> > Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> > > kvmppc_hv_entry is called from only 2 locations within
> > > book3s_hv_rmhandlers.S. Both of those locations set r4
> > > as HSTATE_KVM_VCPU(r13) before calling kvmppc_hv_entry.
> > > So, shift the r4 load instruction to kvmppc_hv_entry and
> > > thus modify the calling convention of this function.
> > >
> > > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > > ---
> > >  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 9 ++++-----
> > >  1 file changed, 4 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > index b81ba4ee0521..da9a15db12fe 100644
> > > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > @@ -85,7 +85,7 @@ _GLOBAL_TOC(kvmppc_hv_entry_trampoline)
> > >  	RFI_TO_KERNEL
> > >  
> > >  kvmppc_call_hv_entry:
> > > -	ld	r4, HSTATE_KVM_VCPU(r13)
> > > +	/* Enter guest. */
> > >  	bl	kvmppc_hv_entry
> > >  
> > >  	/* Back from guest - restore host state and return to caller */
> > > @@ -352,9 +352,7 @@ kvm_secondary_got_guest:
> > >  	mtspr	SPRN_LDBAR, r0
> > >  	isync
> > >  63:
> > > -	/* Order load of vcpu after load of vcore */
> > > -	lwsync
> > 
> > Where did this barrier go?
> > 
> > I don't see that it's covered by any existing barriers in
> > kvmppc_hv_entry, and you don't add it back anywhere. 
> 
> My concept about this is that since now the call to kvmppc_hv_entry
> is first taken before the load to r4 shouldn't the pending load in the
> pipeline of the HSTATE_KVM_VCORE as per the earlier comment be ordered anyway
> before-hand ? Or do you mesn to say that pending loads may not be
> cleared/flushed across the "bl <funcname>" boundary ?
Sorry, I mean: " shouldn't the pending load in the pipeline (of the
HSTATE_KVM_VCORE) as per the earlier comment be ordered anyway
before-hand?"

Forgot the paranthesis.
> > 
> > > -	ld	r4, HSTATE_KVM_VCPU(r13)
> > > +	/* Enter guest. */
> > >  	bl	kvmppc_hv_entry
> > >  
> > >  	/* Back from the guest, go back to nap */
> > > @@ -506,7 +504,6 @@ SYM_INNER_LABEL(kvmppc_hv_entry, SYM_L_LOCAL)
> > >  
> > >  	/* Required state:
> > >  	 *
> > > -	 * R4 = vcpu pointer (or NULL)
> > >  	 * MSR = ~IR|DR
> > >  	 * R13 = PACA
> > >  	 * R1 = host R1
> > > @@ -524,6 +521,8 @@ SYM_INNER_LABEL(kvmppc_hv_entry, SYM_L_LOCAL)
> > >  	li	r6, KVM_GUEST_MODE_HOST_HV
> > >  	stb	r6, HSTATE_IN_GUEST(r13)
> > >  
> > > +	ld	r4, HSTATE_KVM_VCPU(r13)
> > > +
> > >  #ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
> > >  	/* Store initial timestamp */
> > >  	cmpdi	r4, 0
> > 
> > cheers
