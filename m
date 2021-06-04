Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B4439AFB4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 03:31:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fx4wq1jqtz30Cc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 11:31:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gDnvElAF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gDnvElAF; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fx4wK6snjz2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 11:30:57 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15413TH1053742; Thu, 3 Jun 2021 21:30:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=5iHOf3RsNy3snFbI4vvbxRpN9FXMOx8yyJ30moMuxz4=;
 b=gDnvElAFHxETQiXTihpX5Nj0iGVAE4QuU/7sxy698+bwdOvxx/MstVmSdryAe0bMphqW
 1wxIc14pkqz0WrsACLYlA19/o2IpYUzdmlq1IIJBrdENnkZAxsary1Ac9aOyrPdqx9yE
 t39kQs5kMbkckilR+8m1jIJGtuGB8+9DSVF3rbgw949b8rjI8IfBf2QVbhmoduf+qtpr
 bUXhqszSAYRv1gBY25f6VLlrZUxAIbLNe4pDdZfj2AS1QBINES5wstk4JsQ6MYe6FHh+
 p81BKurq3sCG/Q5mgF8XL6DBXqAnQUY1IhTJnf6R9JA0DQ+sKy66MF7+1zDzrrUL2YS+ EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38y6v04hms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jun 2021 21:30:49 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15413VpJ053983;
 Thu, 3 Jun 2021 21:30:48 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38y6v04hmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jun 2021 21:30:48 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1541QWVV027501;
 Fri, 4 Jun 2021 01:30:48 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01wdc.us.ibm.com with ESMTP id 38ud89mc06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 01:30:48 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1541Ulfj15532506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Jun 2021 01:30:47 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24FB0136059;
 Fri,  4 Jun 2021 01:30:47 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84EFC136066;
 Fri,  4 Jun 2021 01:30:45 +0000 (GMT)
Received: from sig-9-77-136-17.ibm.com (unknown [9.77.136.17])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  4 Jun 2021 01:30:45 +0000 (GMT)
Message-ID: <ed2621061f694099c2fd3edf39d239686a84f517.camel@linux.ibm.com>
Subject: Re: [PATCH v4 07/16] powerpc/pseries/vas: Define VAS/NXGZIP HCALLs
 and structs
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Thu, 03 Jun 2021 18:30:43 -0700
In-Reply-To: <1622695206.q32wg4puuh.astroid@bobo.none>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <4d1a19311883c2ac6620633721ecc81d753f26c8.camel@linux.ibm.com>
 <1622695206.q32wg4puuh.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sSdKJbQnv-4hsQ7KrBXx-IthIqJvUqrg
X-Proofpoint-ORIG-GUID: vsocVBr1n8yHem9DEwdHwBEDaNTBxNhg
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-03_15:2021-06-03,
 2021-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 mlxscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106040005
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2021-06-03 at 14:47 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of May 21, 2021 7:34 pm:
> > This patch adds HCALLs and other definitions. Also define structs
> > that are used in VAS implementation on powerVM.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/hvcall.h    |   7 ++
> >  arch/powerpc/include/asm/vas.h       |  32 ++++++++
> >  arch/powerpc/platforms/pseries/vas.h | 110
> > +++++++++++++++++++++++++++
> >  3 files changed, 149 insertions(+)
> >  create mode 100644 arch/powerpc/platforms/pseries/vas.h
> > 
> > diff --git a/arch/powerpc/include/asm/hvcall.h
> > b/arch/powerpc/include/asm/hvcall.h
> > index e3b29eda8074..7c3418d1b5e9 100644
> > --- a/arch/powerpc/include/asm/hvcall.h
> > +++ b/arch/powerpc/include/asm/hvcall.h
> > @@ -294,6 +294,13 @@
> >  #define H_RESIZE_HPT_COMMIT	0x370
> >  #define H_REGISTER_PROC_TBL	0x37C
> >  #define H_SIGNAL_SYS_RESET	0x380
> > +#define H_ALLOCATE_VAS_WINDOW	0x388
> > +#define H_MODIFY_VAS_WINDOW	0x38C
> > +#define H_DEALLOCATE_VAS_WINDOW	0x390
> > +#define H_QUERY_VAS_WINDOW	0x394
> > +#define H_QUERY_VAS_CAPABILITIES	0x398
> > +#define H_QUERY_NX_CAPABILITIES	0x39C
> > +#define H_GET_NX_FAULT		0x3A0
> >  #define H_INT_GET_SOURCE_INFO   0x3A8
> >  #define H_INT_SET_SOURCE_CONFIG 0x3AC
> >  #define H_INT_GET_SOURCE_CONFIG 0x3B0
> > diff --git a/arch/powerpc/include/asm/vas.h
> > b/arch/powerpc/include/asm/vas.h
> > index 49bfb5be896d..371f62d99174 100644
> > --- a/arch/powerpc/include/asm/vas.h
> > +++ b/arch/powerpc/include/asm/vas.h
> > @@ -181,6 +181,7 @@ struct vas_tx_win_attr {
> >  	bool rx_win_ord_mode;
> >  };
> >  
> > +#ifdef CONFIG_PPC_POWERNV
> >  /*
> >   * Helper to map a chip id to VAS id.
> >   * For POWER9, this is a 1:1 mapping. In the future this maybe a
> > 1:N
> > @@ -248,6 +249,37 @@ void vas_win_paste_addr(struct vas_window
> > *window, u64 *addr,
> >  int vas_register_api_powernv(struct module *mod, enum vas_cop_type
> > cop_type,
> >  			     const char *name);
> >  void vas_unregister_api_powernv(void);
> > +#endif
> > +
> > +#ifdef CONFIG_PPC_PSERIES
> > +
> > +/* VAS Capabilities */
> > +#define VAS_GZIP_QOS_FEAT	0x1
> > +#define VAS_GZIP_DEF_FEAT	0x2
> > +#define VAS_GZIP_QOS_FEAT_BIT	PPC_BIT(VAS_GZIP_QOS_FEAT) /*
> > Bit 1 */
> > +#define VAS_GZIP_DEF_FEAT_BIT	PPC_BIT(VAS_GZIP_DEF_FEAT) /*
> > Bit 2 */
> > +
> > +/* NX Capabilities */
> > +#define VAS_NX_GZIP_FEAT	0x1
> > +#define VAS_NX_GZIP_FEAT_BIT	PPC_BIT(VAS_NX_GZIP_FEAT) /*
> > Bit 1 */
> > +#define VAS_DESCR_LEN		8
> > +
> > +/*
> > + * These structs are used to retrieve overall VAS capabilities
> > that
> > + * the hypervisor provides.
> > + */
> > +struct hv_vas_all_caps {
> 
> ...
> 
> > +
> > +/*
> > + * Use to get feature specific capabilities from the
> > + * hypervisor.
> > + */
> > +struct hv_vas_ct_caps {
> 
> ...
> 
> > +/*
> > + * To get window information from the hypervisor.
> > + */
> > +struct hv_vas_win_lpar {
> 
> Are any of these names coming from PAPR? If not, then typically we
> don't 
> use hv_ kind of prefixes for something we got from the hypervisor,
> but
> rather something that's hypervisor privileged or specific information
> about the hypervisor perhaps (which is not the same as what the 
> hypervisor may or may not advertise to the guest).
> 
> So if these are all capabilities and features the hypervisor
> advertises 
> to the LPAR, I think the hv_ should be dropped.

The hypervisor advertises the available capabalities and the LPAR
passes buffer to HCALLs to retrieve these capabilties / features (in
BE). 

I was using *_be in the previous version. So can I use like 'struct
vas_ct_caps_be'  

> 
> Otherwise seems okay. I would be careful of the "lpar" name. I think 
> it's okay in this situation where the hypervisor advertises features
> to 
> the partition, but in other parts of the vas code you call it
> pseries_
> but you also have some lpar_ bits. So aside from interacting with
> PAPR
> APIs, it would be safe to consistently use pseries for your driver
> and
> type names.

I can use 'struct hv_vas_win_pseries' or 'struct vas_win_pseries_be'

> 
> Thanks,
> Nick

