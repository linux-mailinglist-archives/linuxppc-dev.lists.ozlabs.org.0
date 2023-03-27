Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A746CA09C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 11:56:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlSrc5H4Tz3cgR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 20:56:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dqqcEZFo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dqqcEZFo;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlSqk1ywTz3c6H
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 20:55:45 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32R8Onm7023006;
	Mon, 27 Mar 2023 09:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=YOHwegi0wpdiDLqFh6l1W+TSlyCS9wOn3odhe4w+G+Q=;
 b=dqqcEZFoqw5VGYnwdj6+ujwwbCybPcKgadOGmpsvuUBqvn31ouN4eMHK6afd4ZowHyJ2
 wLWwBFeumqRnXISNds5fh/L5PpNSYx8cLIiNSSr+KP2gIp+tPwiVfJ90e6oRKKIWFAWy
 8uuVSs/fjPZICqXp8wKGLihhSDjJIlgKdK9/M0tzkIrgttSMfdGkPz3emw+vonCUfjGD
 vp/RGrf0JerdcVBkn1f0xcKjDCYHDzPYuwgVtgMF/kpePDIsFYvo2ykHmyM1H/MfSWX8
 w4SX4i+bRN/yYhW5LmbGnmkNqeb32PffdbuBDcM2VTFT2XAlEiqp9qrwYrOzIItM2Z2R /g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjaqdkx2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 09:55:31 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32R9m7bg012687;
	Mon, 27 Mar 2023 09:55:31 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjaqdkx1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 09:55:30 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32QHgL0s019418;
	Mon, 27 Mar 2023 09:55:27 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3phrk6jm0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 09:55:27 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32R9tOHe9634436
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Mar 2023 09:55:24 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13D0B20043;
	Mon, 27 Mar 2023 09:55:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57F7F20040;
	Mon, 27 Mar 2023 09:55:21 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.40.181])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 27 Mar 2023 09:55:21 +0000 (GMT)
Date: Mon, 27 Mar 2023 15:25:18 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 1/2] arch/powerpc/kvm: kvmppc_hv_entry: remove .global
 scope
Message-ID: <ZCFoBqReJekPd7GI@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230316051025.1424093-1-kconsul@linux.vnet.ibm.com>
 <20230316051025.1424093-2-kconsul@linux.vnet.ibm.com>
 <CRH1YM72SK4L.QU56WGVQQ2GE@bobo>
 <ZCFhnNPrMr3D5+rZ@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <ZCFjJ1sMuLMUkBWc@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
 <CRH2N2UNMLQW.1W51OVV9ZES7L@bobo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CRH2N2UNMLQW.1W51OVV9ZES7L@bobo>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FOXdjVRH6UlThUfsvojV8t-LpxUxG3Wa
X-Proofpoint-ORIG-GUID: h-__z9cZB0ZMWPR99jqpnZ2lnb4CK3ZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303270078
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org, Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-03-27 19:51:34, Nicholas Piggin wrote:
> On Mon Mar 27, 2023 at 7:34 PM AEST, Kautuk Consul wrote:
> > On 2023-03-27 14:58:03, Kautuk Consul wrote:
> > > On 2023-03-27 19:19:37, Nicholas Piggin wrote:
> > > > On Thu Mar 16, 2023 at 3:10 PM AEST, Kautuk Consul wrote:
> > > > > kvmppc_hv_entry isn't called from anywhere other than
> > > > > book3s_hv_rmhandlers.S itself. Removing .global scope for
> > > > > this function and annotating it with SYM_INNER_LABEL.
> > > > >
> > > > > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > > > > ---
> > > > >  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 3 +--
> > > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > > > index acf80915f406..b81ba4ee0521 100644
> > > > > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > > > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > > > @@ -502,8 +502,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> > > > >   *                                                                            *
> > > > >   *****************************************************************************/
> > > > >  
> > > > > -.global kvmppc_hv_entry
> > > > 
> > > > I think this is okay.
> > > > 
> > > > > -kvmppc_hv_entry:
> > > > > +SYM_INNER_LABEL(kvmppc_hv_entry, SYM_L_LOCAL)
> > > > 
> > > > The documentation for SYM_INNER_LABEL says it for labels inside a SYM
> > > > function block, is that a problem? This is a function but doesn't have
> > > > C calling convention, so asm annotation docs say that it should use
> > > > SYM_CODE_START_LOCAL?
> > > That is correct. Will create a v4 patch for this and send it.
> > But using SYM_CODE_START_LOCAL again causes a warning in the build
> > (which we were trying to avoid):
> > arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x48: unannotated intra-function call
> 
> Are you using SYM_FUNC_END as well? Looks like you need that to
> annotate the type properly. It should be the same as SYM_INNER_LABEL
> in the end AFAIKS.

What about SYM_CODE_START_LOCAL and SYM_CODE_END ?
This seems to work fine for me without any build warnings from objtool.
> 
> > > > 
> > > > BTW. why don't our _GLOBAL() macros use these SYM annotations? I haven't
> > > > really looked into them.
> > > Not sure. Was mostly just concentrating on the kvmppc_hv_entry code.
> 
> Looks like it's because we have a .type @function annotation in those
> already. Not sure if we should end up converting all that over to use
> the SYM annotations or if it's okay to leave it as is.
> 
> Thanks,
> Nick
