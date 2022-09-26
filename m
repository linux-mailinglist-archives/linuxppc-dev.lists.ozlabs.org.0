Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCFD5EB3B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 23:58:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbxTL1CHmz3bmP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 07:58:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nys6a6qt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nys6a6qt;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbxSd0V4tz3bXg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 07:57:36 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QLhcZn016961;
	Mon, 26 Sep 2022 21:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=TbiJ8HrG9l18ENV04BQKkz/ekhabBjw9EYNd2o+xDmg=;
 b=nys6a6qtblZ+9cGO8xt+F1zAKgnRAHyDZQGSp4eubQTG6IJrtchFQMN2OfQxoxumMcFP
 WfuZxAGqPiOsoUDJJ1KHwNMoyIiwHujm+67whlbit6NoCSZLidcKI2ya1wstR0J0zYp7
 hLgIoAZn5/ZWfDX9QlDx+90Oc9rFh9B2Aex73VBd98xj2wJnXHIHwG2Ph4ptX8ZmS6ax
 oyZ1wvEuIuFxUhqi60hNmYVpiRactxkVeSCE8BcHvkU+1ItL0DbkNnC3eCuBgiJqC+0b
 d2dCp/QayPQ3djik3TgYvyOeRvkVDJ73I7gyswDVOYXUyVIL35bsE8HmR+p0Ffx8gcF7 EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jum8g089t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 21:57:25 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28QLuoNN031690;
	Mon, 26 Sep 2022 21:57:25 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jum8g089m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 21:57:25 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28QLrHv5009473;
	Mon, 26 Sep 2022 21:57:24 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
	by ppma05wdc.us.ibm.com with ESMTP id 3jssh9gp0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 21:57:24 +0000
Received: from smtpav03.dal12v.mail.ibm.com ([9.208.128.129])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28QLvMUS20906446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Sep 2022 21:57:22 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40E0C5803F;
	Mon, 26 Sep 2022 21:57:23 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A37258056;
	Mon, 26 Sep 2022 21:57:22 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.36.35])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Sep 2022 21:57:22 +0000 (GMT)
Message-ID: <78bb26d080cc806ab5ef86d5cd7425f0a757c3e2.camel@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc: Ignore DSI error caused by the copy/paste
 instruction
From: Haren Myneni <haren@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "mpe@ellerman.id.au"
	 <mpe@ellerman.id.au>,
        "npiggin@gmail.com" <npiggin@gmail.com>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Mon, 26 Sep 2022 14:57:12 -0700
In-Reply-To: <fcc2792d-ece1-d01a-7591-c487dd4d7e1c@csgroup.eu>
References: <12b8c238593b835837dbb8ce664c50dcaf9ecb3d.camel@linux.ibm.com>
	 <fcc2792d-ece1-d01a-7591-c487dd4d7e1c@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JaOMTuO8Ua7kK8HPxvaqmgP_4prw8no6
X-Proofpoint-GUID: -8mTguiiJYFFeqVyCRs140IcvSilVIup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_09,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260132
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-09-26 at 05:55 +0000, Christophe Leroy wrote:
> 
> Le 25/09/2022 à 22:26, Haren Myneni a écrit :
> > DSI error will be generated when the paste operation is issued on
> > the suspended NX window due to NX state changes. The hypervisor
> > expects the partition to ignore this error during page pault
> > handling. To differentiate DSI caused by an actual HW configuration
> > or by the NX window, a new “ibm,pi-features” type value is defined.
> > Byte 0, bit 3 of pi-attribute-specifier-type is now defined to
> > indicate this DSI error. If this error is not ignored, the user
> > space can get SIGBUS when the NX request is issued.
> 
> Would be nice to mention at least one time in the message that NX
> stands 
> to nest accelerator.
> 
> Otherwise, that's confusing with for exemple:
> Commit 2e602847d9c2 ("KVM: PPC: Don't flush PTEs on NX/RO hit")
> Commit c49643319715 ("powerpc/32s: Only leave NX unset on segments
> used 
> for modules")

Thanks. I did not realize since VAS/NX code is added before. I will add
the description as you suggested. 

> 
> 
> > This patch adds changes to read ibm,pi-features property and ignore
> > DSI error in the page fault handling if CPU_FTR_NX_DSI if defined.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> > v2: Code cleanup as suggested by Christophe Leroy
> > 
> >   arch/powerpc/include/asm/cputable.h |  5 ++--
> >   arch/powerpc/kernel/prom.c          | 36 +++++++++++++++++++++---
> > -----
> >   arch/powerpc/mm/fault.c             | 17 +++++++++++++-
> >   3 files changed, 45 insertions(+), 13 deletions(-)
> > 
> > diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> > index 014005428687..cb949f12baa9 100644
> > --- a/arch/powerpc/mm/fault.c
> > +++ b/arch/powerpc/mm/fault.c
> > @@ -367,7 +367,22 @@ static void sanity_check_fault(bool is_write,
> > bool is_user,
> >   #elif defined(CONFIG_PPC_8xx)
> >   #define page_fault_is_bad(__err)	((__err) & DSISR_NOEXEC_OR_G)
> >   #elif defined(CONFIG_PPC64)
> > -#define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_64S)
> > +static int page_fault_is_bad(unsigned long err)
> > +{
> > +	unsigned long flag = DSISR_BAD_FAULT_64S;
> > +
> > +	/*
> > +	 * PAPR 14.15.3.4.1
> > +	 * If byte 0, bit 3 of pi-attribute-specifier-type in
> > +	 * ibm,pi-features property is defined, ignore the DSI error
> > +	 * which is caused by the paste instruction on the
> > +	 * suspended NX window.
> > +	 */
> > +	if (cpu_has_feature(CPU_FTR_NX_DSI))
> > +		flag &= ~DSISR_BAD_COPYPASTE;
> > +
> > +	return (err & flag);
> 
> You don't need parenthesis ( )
> 
> > +}
> >   #else
> >   #define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_32S)
> >   #endif

