Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B04C969C78B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 10:18:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKxfP2XRgz3cFw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 20:18:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k5AZeJtF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k5AZeJtF;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKxdS4TSpz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 20:17:16 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K7RIp6009147
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 09:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=FDj0bIr0cUAEsTTNqHDF4mnUO8F3EZovzUcHyR7Z9Hw=;
 b=k5AZeJtFXQ/xD63TsoOc5nif/2xMl5hkYReGMen2+5MfnFfSflA7zobJrp1qaEpnbDga
 qlwc/HYCAdNnM0nmx8nYo9OydHuRSuSI78sKMfqxooeRJsSQIGD0lFd+7aPP3x2v7iEi
 0XRe10bIVnKhAHlgmLJq9M9NjA6D4RouvrXgfnaCKcBYFn7aB2WsK+VjvHQ4gYUZTBpe
 g78zGsZvakO0RiUF/xsX7xgVFPR3a7tFslrPF03CDEihvwXEEgWhIp+nceKY/8eqOoiT
 mvFsjFoU599zXBlVHGttAax+dP/s2l6QbAfwXPR9qNLXRxOPbLB+VX67sXisMIa3X6tz nA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nuyk6gqss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 09:17:13 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31JBeXWN023934
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 09:17:11 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3ntpa69uma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 09:17:11 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31K9H7Oc25821932
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Feb 2023 09:17:07 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C9AD720043;
	Mon, 20 Feb 2023 09:17:07 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A04B20040;
	Mon, 20 Feb 2023 09:17:07 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.109.216.99])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 20 Feb 2023 09:17:06 +0000 (GMT)
Date: Mon, 20 Feb 2023 14:47:04 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH 1/2] arch/powerpc/kvm: kvmppc_hv_entry: remove .global
 scope
Message-ID: <Y/M6kFeUsLBwcbP0@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230220052355.109033-1-kconsul@linux.vnet.ibm.com>
 <20230220052355.109033-2-kconsul@linux.vnet.ibm.com>
 <2fa8dd2a-1650-4adc-de2b-0f14dca683ed@linux.ibm.com>
 <Y/MhON/N6vG8wYWq@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <9ee1f333-9cb7-d7fe-4e3f-ded4990030de@linux.ibm.com>
 <Y/MrOjca/C+bPmn1@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/MrOjca/C+bPmn1@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Tuzv1pUhK3wIBW_z_pmmcN7x_Qd1lqVL
X-Proofpoint-ORIG-GUID: Tuzv1pUhK3wIBW_z_pmmcN7x_Qd1lqVL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_05,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxscore=0 phishscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200081
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 20, 2023 at 01:41:38PM +0530, Kautuk Consul wrote:
> On Mon, Feb 20, 2023 at 01:31:40PM +0530, Sathvika Vasireddy wrote:
> > Placing SYM_FUNC_END(kvmppc_hv_entry) before kvmppc_got_guest() should do:
> > 
> > @@ -502,12 +500,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> > * *
> > *****************************************************************************/
> > 
> > -.global kvmppc_hv_entry
> > -kvmppc_hv_entry:
> > +SYM_FUNC_START_LOCAL(kvmppc_hv_entry)
> > 
> >         /* Required state:
> >          *
> > -        * R4 = vcpu pointer (or NULL)
> >          * MSR = ~IR|DR
> >          * R13 = PACA
> >          * R1 = host R1
> > @@ -525,6 +521,8 @@ kvmppc_hv_entry:
> >         li      r6, KVM_GUEST_MODE_HOST_HV
> >         stb     r6, HSTATE_IN_GUEST(r13)
> > 
> > +       ld      r4, HSTATE_KVM_VCPU(r13)
> > +
> >  #ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
> >         /* Store initial timestamp */
> >         cmpdi   r4, 0
> > @@ -619,6 +617,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> >         /* Do we have a guest vcpu to run? */
> >  10:    cmpdi   r4, 0
> >         beq     kvmppc_primary_no_guest
> > +SYM_FUNC_END(kvmppc_hv_entry)

Just one question though. Went through the code again and I think
that this place shouldn't be proper to insert a SYM_FUNC_END
because we haven't entered the guest at this point and the name
of the function is kvmppc_hv_entry which  I think implies that
this SYM_FUNC_END should be at some place after the HRFI_TO_GUEST.

What do you think ?

> > +
> >  kvmppc_got_guest:
> >         /* Increment yield count if they have a VPA */
> >         ld      r3, VCPU_VPA(r4)
> > 
> 
> Thanks! Will send out a v2 after I get some response for
> PATCH 2/2 with comments.
> > 
> > Thanks,
> > Sathvika
