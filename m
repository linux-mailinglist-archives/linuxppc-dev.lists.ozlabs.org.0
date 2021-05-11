Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1230379CD8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 04:18:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfM6m4wgxz2yxN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 12:18:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qQnzLXjz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qQnzLXjz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfM6J46gBz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 12:18:31 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14B23fkl038075; Mon, 10 May 2021 22:18:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=3W6N2DzKH1mVkPYoHsYWsaj2or5TTnqhUSWWLjsgnp0=;
 b=qQnzLXjzVEKbTEIAitYym9ggkls8Tvj3e0HOET4MHjpIvUkRCsHmIISoxrNWLTtXV4Tt
 XotS93bVdkj1HWd13BvMgjqma0ZyQIBQhXVjV/wZCT7Y6HNmtFu/h8WbihvJWZV1jPCB
 j3XaUazcMdvqMXyjTz9s8h/f7g5fJ0bxIxvFXu5r+dC58/hCCZUJghFRmVOt9sm8ts9Y
 fLvP6ZADg7jfNlKW31ArZT0H/E2I4atpYnBzAOi4kjsHO5k5t26f4kLs2RXeVYO3Cyg8
 IDojr8biOpstpSeZnosB/JUqh0DDutgw62VDcBVqcLKW7paa+weUrpcDgoQLSTIYDie9 /A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38fg64h2ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 22:18:23 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14B23ngw038392;
 Mon, 10 May 2021 22:18:23 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38fg64h2ek-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 22:18:23 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14B2I7UW019429;
 Tue, 11 May 2021 02:18:22 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 38dj99an61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 May 2021 02:18:22 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14B2IL4D5440454
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 May 2021 02:18:21 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97DC3124053;
 Tue, 11 May 2021 02:18:21 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD363124052;
 Tue, 11 May 2021 02:18:20 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.194.217])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 11 May 2021 02:18:20 +0000 (GMT)
Message-ID: <0a255c4490c7bf129dbc5e13ec5741f850a6a982.camel@linux.ibm.com>
Subject: Re: [V3 PATCH 06/16] powerpc/pseries/vas: Define VAS/NXGZIP HCALLs
 and structs
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Mon, 10 May 2021 19:18:19 -0700
In-Reply-To: <1620625091.ey2jdts2en.astroid@bobo.none>
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <286ae5f4fdc4fd5620470cb0bf452e827e1f3864.camel@linux.ibm.com>
 <1620625091.ey2jdts2en.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DaF124eJ_IzbV56KlJT1rw-nBJJqbq9i
X-Proofpoint-ORIG-GUID: tcmU-LSdcrF-gIUQ4t-eKD-JG7oMp5zQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-10_14:2021-05-10,
 2021-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105110013
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

On Mon, 2021-05-10 at 15:49 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of April 18, 2021 7:05 am:
> > This patch adds HCALLs and other definitions. Also define structs
> > that are used in VAS implementation on powerVM.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/hvcall.h    |  7 ++
> >  arch/powerpc/include/asm/vas.h       | 28 ++++++++
> >  arch/powerpc/platforms/pseries/vas.h | 96
> > ++++++++++++++++++++++++++++
> >  3 files changed, 131 insertions(+)
> >  create mode 100644 arch/powerpc/platforms/pseries/vas.h
> > 
> > diff --git a/arch/powerpc/include/asm/hvcall.h
> > b/arch/powerpc/include/asm/hvcall.h
> > index ed6086d57b22..accbb7f6f272 100644
> > --- a/arch/powerpc/include/asm/hvcall.h
> > +++ b/arch/powerpc/include/asm/hvcall.h
> > @@ -294,6 +294,13 @@
> >  #define H_RESIZE_HPT_COMMIT	0x370
> >  #define H_REGISTER_PROC_TBL	0x37C
> >  #define H_SIGNAL_SYS_RESET	0x380
> > +#define	H_ALLOCATE_VAS_WINDOW	0x388
> > +#define	H_MODIFY_VAS_WINDOW	0x38C
> > +#define	H_DEALLOCATE_VAS_WINDOW	0x390
> > +#define	H_QUERY_VAS_WINDOW	0x394
> > +#define	H_QUERY_VAS_CAPABILITIES	0x398
> > +#define	H_QUERY_NX_CAPABILITIES	0x39C
> > +#define	H_GET_NX_FAULT		0x3A0
> 
> These should be spaces.
> 
> >  #define H_INT_GET_SOURCE_INFO   0x3A8
> >  #define H_INT_SET_SOURCE_CONFIG 0x3AC
> >  #define H_INT_GET_SOURCE_CONFIG 0x3B0
> > diff --git a/arch/powerpc/include/asm/vas.h
> > b/arch/powerpc/include/asm/vas.h
> > index f928bf4c7e98..d15784506a54 100644
> > --- a/arch/powerpc/include/asm/vas.h
> > +++ b/arch/powerpc/include/asm/vas.h
> > @@ -179,6 +179,7 @@ struct vas_tx_win_attr {
> >  	bool rx_win_ord_mode;
> >  };
> >  
> > +#ifdef CONFIG_PPC_POWERNV
> >  /*
> >   * Helper to map a chip id to VAS id.
> >   * For POWER9, this is a 1:1 mapping. In the future this maybe a
> > 1:N
> > @@ -243,6 +244,33 @@ int vas_paste_crb(struct vas_window *win, int
> > offset, bool re);
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
> > +#define VAS_GZIP_QOS_FEAT_BIT	(1UL << (63 -
> > VAS_GZIP_QOS_FEAT)) /* Bit 1 */
> > +#define VAS_GZIP_DEF_FEAT_BIT	(1UL << (63 -
> > VAS_GZIP_DEF_FEAT)) /* Bit 2 */
> 
> Use PPC_BIT for these.
> 
> > +
> > +/* NX Capabilities */
> > +#define	VAS_NX_GZIP_FEAT	0x1
> > +#define	VAS_NX_GZIP_FEAT_BIT	(1UL << (63 -
> > VAS_NX_GZIP_FEAT)) /* Bit 1 */
> > +#define	VAS_DESCR_LEN		8
> > +
> > +struct vas_all_capabs_be {
> > +		__be64  descriptor;
> > +		__be64  feat_type;
> > +} __packed __aligned(0x1000);
> > +
> > +struct vas_all_capabs {
> > +	char	name[VAS_DESCR_LEN + 1];
> > +	u64     descriptor;
> > +	u64     feat_type;
> > +};
> 
> You're using _be for the struct that is passed to the hcall, and a 
> non-postfixed one for something the driver uses internally? It seems
> like buf or buffer, or hv_ prefix is typically used rather than be
> (host 
> kernel could be BE).
> 
> struct hv_query_vas_capabilities_buffer for example.

Can I add like "hv_vas_all_caps_buf" instead of vas_all_capabs_be
> 
> Does the hcall really require 0x1000 alignment?

pAPR user mode NX says "resultBuffer : The logical real address of a
size-aligned 4K buffer to store VAS capabilities in" (Section:
H_QUERY_VAS_CAPABILITIES HCALL)
> 
> > +
> > +#endif
> >  
> >  /*
> >   * Register / unregister coprocessor type to VAS API which will be
> > exported
> > diff --git a/arch/powerpc/platforms/pseries/vas.h
> > b/arch/powerpc/platforms/pseries/vas.h
> > new file mode 100644
> > index 000000000000..208682fffa57
> > --- /dev/null
> > +++ b/arch/powerpc/platforms/pseries/vas.h
> > @@ -0,0 +1,96 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Copyright 2020-21 IBM Corp.
> > + */
> > +
> > +#ifndef _VAS_H
> > +#define _VAS_H
> > +#include <asm/vas.h>
> > +#include <linux/mutex.h>
> > +#include <linux/stringify.h>
> > +
> > +/*
> > + * VAS window modify flags
> > + */
> > +#define	VAS_MOD_WIN_CLOSE	(1UL << 63)
> > +#define	VAS_MOD_WIN_JOBS_KILL	(1UL << (63 - 1))
> > +#define	VAS_MOD_WIN_DR		(1UL << (63 - 3))
> > +#define	VAS_MOD_WIN_PR		(1UL << (63 - 4))
> > +#define	VAS_MOD_WIN_SF		(1UL << (63 - 5))
> > +#define	VAS_MOD_WIN_TA		(1UL << (63 - 6))
> > +#define	VAS_MOD_WIN_FLAGS	(VAS_MOD_WIN_JOBS_KILL |
> > VAS_MOD_WIN_DR | \
> > +				VAS_MOD_WIN_PR | VAS_MOD_WIN_SF)
> > +
> > +#define	VAS_WIN_ACTIVE		0x0
> > +#define	VAS_WIN_CLOSED		0x1
> > +#define	VAS_WIN_INACTIVE	0x2	/* Inactive due to HW
> > failure */
> > +/* Process of being modified, deallocated, or quiesced */
> > +#define	VAS_WIN_MOD_IN_PROCESS	0x3
> > +
> > +#define	VAS_COPY_PASTE_USER_MODE	0x00000001
> > +#define	VAS_COP_OP_USER_MODE		0x00000010
> > +
> > +/*
> > + * Co-processor feature - GZIP QoS windows or GZIP default windows
> > + */
> > +enum vas_cop_feat_type {
> > +	VAS_GZIP_QOS_FEAT_TYPE,
> > +	VAS_GZIP_DEF_FEAT_TYPE,
> > +	VAS_MAX_FEAT_TYPE,
> > +};
> > +
> > +struct vas_ct_capabs_be {
> > +	__be64	descriptor;
> > +	u8	win_type;		/* Default or QoS type */
> > +	u8	user_mode;
> > +	__be16	max_lpar_creds;
> > +	__be16	max_win_creds;
> > +	union {
> > +		__be16	reserved;
> > +		__be16	def_lpar_creds; /* Used for default
> > capabilities */
> > +	};
> > +	__be16	target_lpar_creds;
> > +} __packed __aligned(0x1000);
> > +
> > +struct vas_ct_capabs {
> > +	char		name[VAS_DESCR_LEN + 1];
> > +	u64		descriptor;
> > +	u8		win_type;	/* Default or QoS type */
> > +	u8		user_mode;	/* User mode copy/paste or COP
> > HCALL */
> > +	u16		max_lpar_creds;	/* Max credits available in LPAR */
> > +	/* Max credits can be assigned per window */
> > +	u16		max_win_creds;
> > +	union {
> > +		u16	reserved;	/* Used for QoS credit type */
> > +		u16	def_lpar_creds; /* Used for default credit type */
> > +	};
> > +	/* Total LPAR available credits. Can be different from max LPAR
> > */
> > +	/* credits due to DLPAR operation */
> > +	atomic_t	target_lpar_creds;
> > +	atomic_t	used_lpar_creds; /* Used credits so far */
> > +	u16		avail_lpar_creds; /* Remaining available credits */
> > +};
> > +
> > +struct vas_capabs {
> > +	struct vas_ct_capabs capab;
> > +	struct list_head list;
> > +};
> > +
> > +struct vas_win_lpar_be {
> > +	__be16	version;
> > +	u8	win_type;
> > +	u8	status;
> > +	__be16	credits;	/* No of credits assigned to this
> > window */
> > +	__be16	reserved;
> > +	__be32	pid;		/* LPAR Process ID */
> > +	__be32	tid;		/* LPAR Thread ID */
> > +	__be64	win_addr;
> > +	__be32	interrupt;	/* Interrupt when NX request
> > completes */
> > +	__be32	fault;		/* Interrupt when NX sees fault */
> > +	/* Associativity Domain Identifiers as returned in */
> > +	/* H_HOME_NODE_ASSOCIATIVITY */
> > +	__be64	domain[6];
> > +	__be64	win_util;	/* Number of bytes processed */
> > +} __packed __aligned(0x1000);
> > +
> > +#endif /* _VAS_H */
> > -- 
> > 2.18.2
> > 
> > 
> > 

