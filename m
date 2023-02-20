Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 034B169C5FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 08:30:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKvFj5ywRz3cFT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 18:30:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R2ewQoXh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R2ewQoXh;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKvDm3kssz3bT1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 18:29:12 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K77RO1019802
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 07:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=1RwUGo8gCda3mGZSv1GV+2cakUS7mB6ClpihcTl8cUU=;
 b=R2ewQoXhq7jQ1OKx6Q+s3NuzWqG96Ptj7kpi4M83o1XXZyid5ZUVBP4/8wFzScZS2AbG
 ikqNVga0UfnmU94Oi6vJPkDNNk1D0g6J4vJLaCOHT2OXGbqvOB1U4TSyYD0idVvR9cHl
 2G24FK2RbqMoTEvUoNUfss5zepxu3VgqcOQJiwUdJOzibfavPEgQ60j4mh4VVGMHtBP+
 D6kE/P13i2gdVYlde+E7SwebLIngDrNQNJAMFgnjAw6sbRt6TbiGw4gF5qxB9g3vZ4Pi
 q0qpxALNmmNtrQpjKeoJ3FGAn5mcyZerrKKte9Ki+XRxyL/CMwmC4W74Qmsl0fbhsXNq 9Q== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nv0wfmhs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 07:29:09 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31JIk831004758
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 07:29:07 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3ntpa69rge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 07:29:07 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31K7T3hi7209316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Feb 2023 07:29:03 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FACE20040;
	Mon, 20 Feb 2023 07:29:03 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA7EA2004E;
	Mon, 20 Feb 2023 07:29:02 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.109.216.99])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 20 Feb 2023 07:29:02 +0000 (GMT)
Date: Mon, 20 Feb 2023 12:58:56 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH 1/2] arch/powerpc/kvm: kvmppc_hv_entry: remove .global
 scope
Message-ID: <Y/MhON/N6vG8wYWq@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230220052355.109033-1-kconsul@linux.vnet.ibm.com>
 <20230220052355.109033-2-kconsul@linux.vnet.ibm.com>
 <2fa8dd2a-1650-4adc-de2b-0f14dca683ed@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fa8dd2a-1650-4adc-de2b-0f14dca683ed@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UB6xyZOAwy_YMeFFjB0bZXqgTX_8_5DC
X-Proofpoint-ORIG-GUID: UB6xyZOAwy_YMeFFjB0bZXqgTX_8_5DC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_04,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302200062
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

Hi Sathvika,

(Sorry didn't include list in earlier email.)

On Mon, Feb 20, 2023 at 12:35:09PM +0530, Sathvika Vasireddy wrote:
> Hi Kautuk,
> 
> On 20/02/23 10:53, Kautuk Consul wrote:
> > kvmppc_hv_entry isn't called from anywhere other than
> > book3s_hv_rmhandlers.S itself. Removing .global scope for
> > this function.
> > 
> > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > ---
> >   arch/powerpc/kvm/book3s_hv_rmhandlers.S | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > index acf80915f406..7e063fde7adc 100644
> > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > @@ -502,7 +502,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> >    *                                                                            *
> >    *****************************************************************************/
> > -.global kvmppc_hv_entry
> >   kvmppc_hv_entry:
> >   	/* Required state:
> I see the following objtool warning with this patch applied.
> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x48:
> unannotated intra-function call
> 
> Annotating kvmppc_hv_entry symbol with SYM_FUNC_START_LOCAL and SYM_FUNC_END
> macros should help fix this warning.

Not sure where to put the SYM_FUNC_END annotation.
Will the following do:
<snip>
    ld  r0, VCPU_GPR(R0)(r4)
    ld  r2, VCPU_GPR(R2)(r4)
    ld  r3, VCPU_GPR(R3)(r4)
    ld  r4, VCPU_GPR(R4)(r4)
    HRFI_TO_GUEST
    b   .

SYM_FUNC_END(kvmppc_hv_entry)

secondary_too_late:
    li  r12, 0

?

Thanks.

> 
> Thanks,
> Sathvika
> 
> 
