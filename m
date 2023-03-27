Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1A06CA1B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 12:52:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlV590M5zz3fS0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 21:52:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jcALzM1x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jcALzM1x;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlV4F6xL5z3cM3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 21:51:41 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32R8vYPf000724;
	Mon, 27 Mar 2023 10:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=e9XfZYA8crVMW3ByZsMbmlFkN3H8AwlKiONAqPcFWCU=;
 b=jcALzM1x6nMOrVUeYS2Aee7BvFOubWk5bzJucHXV9xG07jhxS8Fv7wBbhJ4VF9Fj9Oro
 nXSdsgYqpJ0g77Rul0XpLGqNkHxUaRUxjM6+U+jgPxIDa6veU26wVeLQ1XGkTK6Jy2OD
 wdU4RrIR2fHUYp/N57JpzhdtbpCuhZTbOLRhpbGw7lRdOjSiwtT6hZDJiL5a2H1woUWV
 I5nbr74q9yXyFdu1ZFYlMUyY2RyhRZELyEQKcW5V/ObZ64ahco3YenfjOj8Qtf+tOYa0
 k/BL2sDTPlDtVl3vmD9evIJ78fpELv72qqccT/hgy/EX5F43sqg/DdatEGNGxdvfAhcP rg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjaru57fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 10:51:32 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32RApWCp026327;
	Mon, 27 Mar 2023 10:51:32 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjaru57ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 10:51:31 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32QNnE5a015876;
	Mon, 27 Mar 2023 10:51:29 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3phr7ftb7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 10:51:29 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32RApPAR20120260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Mar 2023 10:51:26 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4B2E2004D;
	Mon, 27 Mar 2023 10:51:25 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C56320040;
	Mon, 27 Mar 2023 10:51:22 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.40.181])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 27 Mar 2023 10:51:21 +0000 (GMT)
Date: Mon, 27 Mar 2023 16:21:19 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4] arch/powerpc/kvm: kvmppc_hv_entry: remove .global
 scope
Message-ID: <ZCF1J7mzFBXBwmL5@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230327100411.3342194-1-kconsul@linux.vnet.ibm.com>
 <CRH3GJDNC4SF.2HBIHLLQSCWSI@bobo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CRH3GJDNC4SF.2HBIHLLQSCWSI@bobo>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: E3JJOQ2rOSLbt0wCg5BPivPNtXhdYEmg
X-Proofpoint-GUID: sxH-6zmZlqeQLVxAVZawt2VGlnbBsimr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270084
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org, Sathvika Vasireddy <sv@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-03-27 20:30:02, Nicholas Piggin wrote:
> On Mon Mar 27, 2023 at 8:04 PM AEST, Kautuk Consul wrote:
> > kvmppc_hv_entry isn't called from anywhere other than
> > book3s_hv_rmhandlers.S itself. Removing .global scope for
> > this function and annotating it with SYM_CODE_START_LOCAL
> > and SYM_CODE_END.
> 
> Does removing .global introduce the objtool warning, or was it already
> present? Just trying to understand if this is two changes or one (not
> that it really matters, maybe just for the purpose of the changelog).
Yes. Just removing .global introduces the objtool warning.
> 
> Since the patch only touches KVM, subject should follow arch/powerpc/kvm
> convention, which is not the same as the rest of arch/powerpc. KVM: PPC:
> Book3S HV:
Okay. Do you need me to send another patch in "KVM: PPC: Book3S HV:"
format ?
> 
> Otherwise seems okay
> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Thank you!
> 
> Thanks,
> Nick
> 
> >
> > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > index acf80915f406..0a9781192b86 100644
> > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > @@ -502,8 +502,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> >   *                                                                            *
> >   *****************************************************************************/
> >  
> > -.global kvmppc_hv_entry
> > -kvmppc_hv_entry:
> > +SYM_CODE_START_LOCAL(kvmppc_hv_entry)
> >  
> >  	/* Required state:
> >  	 *
> > @@ -940,6 +939,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> >  	ld	r4, VCPU_GPR(R4)(r4)
> >  	HRFI_TO_GUEST
> >  	b	.
> > +SYM_CODE_END(kvmppc_hv_entry)
> >  
> >  secondary_too_late:
> >  	li	r12, 0
> > -- 
> > 2.39.2
> 
