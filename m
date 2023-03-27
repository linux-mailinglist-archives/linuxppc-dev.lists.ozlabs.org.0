Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C93AA6C9FD6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 11:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlSNf4S43z3cXX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 20:35:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D3uGXRv3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D3uGXRv3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlSMl5280z3bg1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 20:34:59 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32R8h5oW025648;
	Mon, 27 Mar 2023 09:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=5tLc3N+tXasD65FrBkvNWqUCi2ynBq9lCve99NLg2Mw=;
 b=D3uGXRv3Sp0Gy/Odsnn8B6dWxQfBLVTPMSzqhMCzdDBwvUG37H6Ovnc3sbnlb7KbeScg
 LGUG92flAIQ2apotLVC+Sev9siY4C2BBNUkscWzWqUtRoS9tkviqOnTEKgpNd3h+tz2h
 WDP1tBwDrfWQiiRlTK0WBjG9KBp2jnjCaFrLLQNSNoU7ElbW7ZxDD/WeomF3cxsrjF5X
 eMB4TdWEjhLtjIGxkDKQDMxa1cLnpdMZ0pA1q+9AUWKkzK3zG21Nffc3mmislE1kwQl7
 n8nsyqvEimIJ6h8nJm2894Qz70jM4L6pQPDOJJvyEj28euumsKGcCYU2BQuZ8VAfSWqU LA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjadkusat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 09:34:47 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32R8tlSY007396;
	Mon, 27 Mar 2023 09:34:46 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pjadkus9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 09:34:46 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32QGk4NH009599;
	Mon, 27 Mar 2023 09:34:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3phrk6jk1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Mar 2023 09:34:42 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32R9Ycbm24117974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Mar 2023 09:34:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 84EC520043;
	Mon, 27 Mar 2023 09:34:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 840DF20040;
	Mon, 27 Mar 2023 09:34:35 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.40.181])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 27 Mar 2023 09:34:35 +0000 (GMT)
Date: Mon, 27 Mar 2023 15:04:31 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 1/2] arch/powerpc/kvm: kvmppc_hv_entry: remove .global
 scope
Message-ID: <ZCFjJ1sMuLMUkBWc@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230316051025.1424093-1-kconsul@linux.vnet.ibm.com>
 <20230316051025.1424093-2-kconsul@linux.vnet.ibm.com>
 <CRH1YM72SK4L.QU56WGVQQ2GE@bobo>
 <ZCFhnNPrMr3D5+rZ@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCFhnNPrMr3D5+rZ@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: p_00OSJ9vfcci-w7O4qYHB6KEjjmwBdS
X-Proofpoint-ORIG-GUID: hQmUzdl_m5Vw6UqUFmBcunNjm5nn-NCx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

On 2023-03-27 14:58:03, Kautuk Consul wrote:
> On 2023-03-27 19:19:37, Nicholas Piggin wrote:
> > On Thu Mar 16, 2023 at 3:10 PM AEST, Kautuk Consul wrote:
> > > kvmppc_hv_entry isn't called from anywhere other than
> > > book3s_hv_rmhandlers.S itself. Removing .global scope for
> > > this function and annotating it with SYM_INNER_LABEL.
> > >
> > > Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> > > ---
> > >  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > index acf80915f406..b81ba4ee0521 100644
> > > --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> > > @@ -502,8 +502,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
> > >   *                                                                            *
> > >   *****************************************************************************/
> > >  
> > > -.global kvmppc_hv_entry
> > 
> > I think this is okay.
> > 
> > > -kvmppc_hv_entry:
> > > +SYM_INNER_LABEL(kvmppc_hv_entry, SYM_L_LOCAL)
> > 
> > The documentation for SYM_INNER_LABEL says it for labels inside a SYM
> > function block, is that a problem? This is a function but doesn't have
> > C calling convention, so asm annotation docs say that it should use
> > SYM_CODE_START_LOCAL?
> That is correct. Will create a v4 patch for this and send it.
But using SYM_CODE_START_LOCAL again causes a warning in the build
(which we were trying to avoid):
arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x48: unannotated intra-function call
> > 
> > BTW. why don't our _GLOBAL() macros use these SYM annotations? I haven't
> > really looked into them.
> Not sure. Was mostly just concentrating on the kvmppc_hv_entry code.
> > 
> > Thanks,
> > Nick
