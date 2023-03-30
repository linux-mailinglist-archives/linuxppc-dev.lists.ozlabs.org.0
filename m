Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4280C6CFA18
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 06:21:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pn9H81BR8z3fRD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 15:21:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TlGSRufn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TlGSRufn;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pn9GH1Q01z3cS4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 15:21:10 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32U3blMQ009091;
	Thu, 30 Mar 2023 04:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=m8b/i+398SAH8q8B6eZhvGo0Og8BAKaPM5bSdtMfqoE=;
 b=TlGSRufn35rcdiravXttf5FjXsb/xgrf/TtOiCkJIPAQDm67Cf3jycJ5DracKm7ZgZ35
 x8T2NG3w7SndxEOLm/OZ6mSod6Ixxw8Ow00rm9srpbqCgdgekYcuFaKAI8YmejEMA24v
 d8vPrA5Q+Sc5QZTo5JbEqNAykXnYD5K1UeR5KzPktZpQaluseAmIWm6KSpLq19ugtIVt
 D4Xn9InzV/qR5mDkEplge7ILAxFYdmyQDEK7S+WQZ6TbteJn3bUA+0LbJzOKddlGZLML
 AWrwh6RvAc/vHpbZ/i9i7pknF6G492SsZxGLm3QamPbAmOD+WeqPALYY7ry+fX+pbEoi tg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmnusw8pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 04:20:58 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32U4ECGk003639;
	Thu, 30 Mar 2023 04:20:58 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmnusw8nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 04:20:58 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32TLpeVR029355;
	Thu, 30 Mar 2023 04:20:55 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3phr7fnh3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 04:20:55 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32U4Kros22151742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Mar 2023 04:20:53 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 139BD20040;
	Thu, 30 Mar 2023 04:20:52 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F43720043;
	Thu, 30 Mar 2023 04:20:50 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.21.16])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 30 Mar 2023 04:20:49 +0000 (GMT)
Date: Thu, 30 Mar 2023 09:50:46 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] arch/powerpc/kvm: kvmppc_core_vcpu_create_hv: check for
 kzalloc failure
Message-ID: <ZCUOHj+TYNzPVT1L@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230323074718.2810914-1-kconsul@linux.vnet.ibm.com>
 <87pm8tcir3.fsf@mpe.ellerman.id.au>
 <ZCK96ohvWRY12zZ3@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <ZCLHFw1U4Mq/QK2A@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <87fs9pcce6.fsf@mpe.ellerman.id.au>
 <ZCLe2Jf0n6GR9Qhw@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <87tty3az3c.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tty3az3c.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sRPum71o_EdXwn_YyYfH8Ql21D0WR5GS
X-Proofpoint-ORIG-GUID: 71aLPHakSckviiKtYrujHH7qp-YfB3pC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_16,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2303300031
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

On 2023-03-30 10:59:19, Michael Ellerman wrote:
> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> > On 2023-03-28 23:02:09, Michael Ellerman wrote:
> >> Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> >> > On 2023-03-28 15:44:02, Kautuk Consul wrote:
> >> >> On 2023-03-28 20:44:48, Michael Ellerman wrote:
> >> >> > Kautuk Consul <kconsul@linux.vnet.ibm.com> writes:
> >> >> > > kvmppc_vcore_create() might not be able to allocate memory through
> >> >> > > kzalloc. In that case the kvm->arch.online_vcores shouldn't be
> >> >> > > incremented.
> >> >> > 
> >> >> > I agree that looks wrong.
> >> >> > 
> >> >> > Have you tried to test what goes wrong if it fails? It looks like it
> >> >> > will break the LPCR update, which likely will cause the guest to crash
> >> >> > horribly.
> >> > Also, are you referring to the code in kvmppc_update_lpcr()?
> >> > That code will not crash as it checks for the vc before trying to
> >> > dereference it.
> >> 
> >> Yeah that's what I was looking at. I didn't mean it would crash, but
> >> that it would bail out early when it sees a NULL vcore, leaving other
> >> vcores with the wrong LPCR value.
> >> 
> >> But as you say it doesn't happen because qemu quits on the first ENOMEM.
> >> 
> >> And regardless if qemu does something that means the guest is broken
> >> that's just a qemu bug, no big deal as far as the kernel is concerned.
> 
> > But there could be another user-mode application other than qemu that
> > actually tries to create a vcpu after it gets a -ENOMEM for another
> > vcpu. Shouldn't the kernel be independent of qemu?
> 
> Yes, the kernel is independent of qemu.
> 
> On P8 we had kvmtool, and there's several other VMMs these days, though
> most don't support Power.
> 
> I didn't mean qemu specifically above. If any VMM continues blindly
> after getting ENOMEM back from the KVM API then that's a bug in that
> VMM.
> 
> >> > But the following 2 places that utilize the arch.online_vcores will have
> >> > problems in logic if the usermode test-case doesn't pull down the
> >> > kvm context after the -ENOMEM vcpu allocation failure:
> >> > book3s_hv.c:3030:       if (!kvm->arch.online_vcores) {
> >> > book3s_hv_rm_mmu.c:44:  if (kvm->arch.online_vcores == 1 && local_paca->kvm_hstate.kvm_vcpu)
> >> 
> >> OK. Both of those look harmless to the host.
> 
> > Harmless to the host in terms of a crash, not in terms of behavior.
> > For example in the case of kvmhv_set_smt_mode:
> > If we got a kzalloc failure once (and online_vcores was wrongly incremented), 
> > then if kvmhv_set_smt_mode() is called after that then it would be
> > not be setting the arch.smt_mode and arch.emul_smt_mode correctly and it
> > would be wrongly returning with -EBUSY instead of 0.
> 
> But again that bug only affects that VM, which the VMM should have
> terminated when it got the ENOMEM back.
> 
> It's definitely a bug that we increment online_vcores incorrectly, but
> it only affects that VM, and a correctly operating VMM will terminate
> the VM anyway because of the ENOMEM.
Okay, I understand. I used to earlier try to contribute to other
mailing lists and they were very particular about correcting code
that was doing something wrong (just by code review) irrespective of whether
it would actually result in a bug/crash or misbehaviour. I guess maintainers
look at the generic part of the kernel in a different way than arch or
device specific kernel/driver code.
> 
> cheers
