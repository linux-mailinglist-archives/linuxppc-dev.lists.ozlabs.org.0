Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2746CBF3B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 14:35:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm8Kq0tmxz3f4k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 23:35:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SPZTHfB5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SPZTHfB5;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm8Jr2bvCz3cKk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 23:34:51 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SBtjoi034531;
	Tue, 28 Mar 2023 12:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=ptrMgdbQXSvBhMRQTtIdeTo823uJitfr4NbX+3nTZUs=;
 b=SPZTHfB5BjjKrn/iI/c0sAghsgpJgq9wN0rNzyY8YuNaWDW0J/IYSQRF/IH+6vXBRPei
 ZhQvcCzfAPmpzPXRPA4RQfQrUGpLE4JrPZGjEgg+nAUTMopevSAsc5i+fcJheDKIZjI7
 F5HJdatS7BbJb/L1eMC0gg4PkeDNEWy3Y3Z8elVO4pP5m/Q0kdvqJsz/8csDC3qE0HPB
 NTwa6t6pRiHcLvhQfX1lq5KmGRqVVhUzfI+cizhrGloh3cFdaBiZuS1x5k6cZsnsTI4M
 iriYSsWiRvfySdUyXyywl2DQYB90wBSoakvghe8gTMOFuKDr94rRTmBRuYI6mz9vwPj4 LA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkysyh189-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 12:34:43 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32SC0KHB011094;
	Tue, 28 Mar 2023 12:34:42 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pkysyh173-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 12:34:42 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32S4aLk7028880;
	Tue, 28 Mar 2023 12:34:40 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3phr7fkyg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 12:34:40 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32SCYcf646531042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Mar 2023 12:34:38 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 463432005A;
	Tue, 28 Mar 2023 12:34:38 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C4812004B;
	Tue, 28 Mar 2023 12:34:35 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.75.27])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 28 Mar 2023 12:34:35 +0000 (GMT)
Date: Tue, 28 Mar 2023 18:04:32 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] arch/powerpc/kvm: kvmppc_core_vcpu_create_hv: check for
 kzalloc failure
Message-ID: <ZCLe2Jf0n6GR9Qhw@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230323074718.2810914-1-kconsul@linux.vnet.ibm.com>
 <87pm8tcir3.fsf@mpe.ellerman.id.au>
 <ZCK96ohvWRY12zZ3@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <ZCLHFw1U4Mq/QK2A@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <87fs9pcce6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87fs9pcce6.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t9Wx0sulOkQ6-G24PekGAA78tuIhDZfX
X-Proofpoint-ORIG-GUID: UhKF6mdPPRkSUFZ7iopmH-7mHoELxdO_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 adultscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280100
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

On 2023-03-28 23:02:09, Michael Ellerman wrote:
> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> > On 2023-03-28 15:44:02, Kautuk Consul wrote:
> >> On 2023-03-28 20:44:48, Michael Ellerman wrote:
> >> > Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> >> > > kvmppc_vcore_create() might not be able to allocate memory through
> >> > > kzalloc. In that case the kvm->arch.online_vcores shouldn't be
> >> > > incremented.
> >> > 
> >> > I agree that looks wrong.
> >> > 
> >> > Have you tried to test what goes wrong if it fails? It looks like it
> >> > will break the LPCR update, which likely will cause the guest to crash
> >> > horribly.
> > Also, are you referring to the code in kvmppc_update_lpcr()?
> > That code will not crash as it checks for the vc before trying to
> > dereference it.
> 
> Yeah that's what I was looking at. I didn't mean it would crash, but
> that it would bail out early when it sees a NULL vcore, leaving other
> vcores with the wrong LPCR value.
> 
> But as you say it doesn't happen because qemu quits on the first ENOMEM.
> 
> And regardless if qemu does something that means the guest is broken
> that's just a qemu bug, no big deal as far as the kernel is concerned.
But there could be another user-mode application other than qemu that
actually tries to create a vcpu after it gets a -ENOMEM for another
vcpu. Shouldn't the kernel be independent of qemu?
> 
> > But the following 2 places that utilize the arch.online_vcores will have
> > problems in logic if the usermode test-case doesn't pull down the
> > kvm context after the -ENOMEM vcpu allocation failure:
> > book3s_hv.c:3030:       if (!kvm->arch.online_vcores) {
> > book3s_hv_rm_mmu.c:44:  if (kvm->arch.online_vcores == 1 && local_paca->kvm_hstate.kvm_vcpu)
> 
> OK. Both of those look harmless to the host.
Harmless to the host in terms of a crash, not in terms of behavior.
For example in the case of kvmhv_set_smt_mode:
If we got a kzalloc failure once (and online_vcores was wrongly incremented), 
then if kvmhv_set_smt_mode() is called after that then it would be
not be setting the arch.smt_mode and arch.emul_smt_mode correctly and it
would be wrongly returning with -EBUSY instead of 0.
Isn't that incorrect with respect to the intent of the code ?
I agree that applications like qemu might not do that but don't we need
to have some integrity with respect to the intent and value of variable
use ? What about good code and logic quality ?
> 
> If we find a case where a misbehaving qemu can crash the host then we
> need to be a bit more careful and treat it at least as a
> denial-of-service bug. But looks like this is not one of those.
> 
> cheers
beers
