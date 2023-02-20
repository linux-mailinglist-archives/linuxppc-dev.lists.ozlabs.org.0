Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 400F169C655
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 09:12:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKwC56YcJz3cDc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 19:12:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PZz2eoOx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PZz2eoOx;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKwB56Y5zz3bTs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 19:11:57 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K6DJf0011787
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 08:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=U3WuZFkkm8yuU+DGWGuEcVJXC06a48NA9C3goMAoEs8=;
 b=PZz2eoOxLT3wpS+ebdG1h8uAV36Uk16BCMUMDXNxbMsLxDOido4ELx8FbxM4gHNmZSqW
 J4y5feo48XQ9XuDP1v/yB4VlsKjPGLJ5NZdAixO5iz0DY9sXvg9a5wzy14DrehYr326x
 O6OI4PQiqmo4kc9xjz8Dr4DJy3Nh0zopMVrak3wafQJ8yyCN042woMXgl1scxWrj0qmY
 gPeZhexBvzeFNsyxCe2frNurnJUo28Vr3aVCH1QSOxigIpZ3+I33YwLSfdP0ais7vBt3
 2AJ1aM0JJwlIkdWJliQXh+Y/O2aTk7PLeFsAPwhwJiPstU+vdEHEO96llat0qHidlfaf 3g== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nv1ukcg0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 08:11:54 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31K5aXuf003267
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 08:11:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3ntnxf1tbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 08:11:53 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31K8BnYU39649704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Feb 2023 08:11:49 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 282162004D;
	Mon, 20 Feb 2023 08:11:49 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54B5820040;
	Mon, 20 Feb 2023 08:11:48 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.109.216.99])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 20 Feb 2023 08:11:48 +0000 (GMT)
Date: Mon, 20 Feb 2023 13:41:38 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH 1/2] arch/powerpc/kvm: kvmppc_hv_entry: remove .global
 scope
Message-ID: <Y/MrOjca/C+bPmn1@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230220052355.109033-1-kconsul@linux.vnet.ibm.com>
 <20230220052355.109033-2-kconsul@linux.vnet.ibm.com>
 <2fa8dd2a-1650-4adc-de2b-0f14dca683ed@linux.ibm.com>
 <Y/MhON/N6vG8wYWq@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <9ee1f333-9cb7-d7fe-4e3f-ded4990030de@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ee1f333-9cb7-d7fe-4e3f-ded4990030de@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FUa6W4SEqJ-Ayvl-8P0hC6S1Xdm3wjOm
X-Proofpoint-ORIG-GUID: FUa6W4SEqJ-Ayvl-8P0hC6S1Xdm3wjOm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_04,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=972 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200067
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

On Mon, Feb 20, 2023 at 01:31:40PM +0530, Sathvika Vasireddy wrote:
> Placing SYM_FUNC_END(kvmppc_hv_entry) before kvmppc_got_guest() should do:
> 
> @@ -502,12 +500,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> * *
> *****************************************************************************/
> 
> -.global kvmppc_hv_entry
> -kvmppc_hv_entry:
> +SYM_FUNC_START_LOCAL(kvmppc_hv_entry)
> 
>         /* Required state:
>          *
> -        * R4 = vcpu pointer (or NULL)
>          * MSR = ~IR|DR
>          * R13 = PACA
>          * R1 = host R1
> @@ -525,6 +521,8 @@ kvmppc_hv_entry:
>         li      r6, KVM_GUEST_MODE_HOST_HV
>         stb     r6, HSTATE_IN_GUEST(r13)
> 
> +       ld      r4, HSTATE_KVM_VCPU(r13)
> +
>  #ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
>         /* Store initial timestamp */
>         cmpdi   r4, 0
> @@ -619,6 +617,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
>         /* Do we have a guest vcpu to run? */
>  10:    cmpdi   r4, 0
>         beq     kvmppc_primary_no_guest
> +SYM_FUNC_END(kvmppc_hv_entry)
> +
>  kvmppc_got_guest:
>         /* Increment yield count if they have a VPA */
>         ld      r3, VCPU_VPA(r4)
> 

Thanks! Will send out a v2 after I get some response for
PATCH 2/2 with comments.
> 
> Thanks,
> Sathvika
