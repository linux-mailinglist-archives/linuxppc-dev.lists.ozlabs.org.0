Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 685F1379CC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 04:12:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfLzf2t7sz308v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 12:12:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TsKGaGSV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TsKGaGSV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfLzB0Hvhz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 12:12:21 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14B23AxH019648; Mon, 10 May 2021 22:12:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=8bvtt7dycOgwp1HhwDEIBsdwwSSjjp+gkqijsCGqi2s=;
 b=TsKGaGSV+YSbCEiVyIS7IpRWhjWM004uLY+s1qiMjxbL7AKg9HM8E+j1ym5uKETcPBiK
 oKyPDNbE76+Nyw+og+DEDLkb6U7/g9ydoYbOiSqI9NJf+Y3l+4RT0ULAgDCyV1aX0/kx
 EGr/ysJvZa588K3kQoxW91nj05Xk6kB/hD80rhPOmVZ2ffX3fd42Q3Y+cS9pOGK8wY8j
 tXiICAYslWVSM4/CtYX1+L2iQGJvXBxFTo63lkjGIYMxE5dXpTPpOAt2B4seTYDaDdcV
 o+O2BqwBz5ZmcOjN4ip5KN6f/7wVTKfTjy87GDdEl+sY308dx1YF4gq87VKRRORZfPTr 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38ffdw1unr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 22:12:16 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14B23hCH023800;
 Mon, 10 May 2021 22:12:16 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38ffdw1unb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 22:12:16 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14B25bMG031153;
 Tue, 11 May 2021 02:12:15 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 38dj98jm5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 May 2021 02:12:15 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14B2CE2135062170
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 May 2021 02:12:14 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9FDFB2066;
 Tue, 11 May 2021 02:12:14 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71033B2065;
 Tue, 11 May 2021 02:12:13 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.194.217])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 11 May 2021 02:12:13 +0000 (GMT)
Message-ID: <567f8eb33e3d2d2d7be7a922aa22566534f9a28a.camel@linux.ibm.com>
Subject: Re: [V3 PATCH 07/16] powerpc/vas: Define QoS credit flag to
 allocate window
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Mon, 10 May 2021 19:12:11 -0700
In-Reply-To: <1620625758.4u2ddwmbaj.astroid@bobo.none>
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <90328d5aa92016434f3061ec7cadc812ea2c5dbc.camel@linux.ibm.com>
 <1620625758.4u2ddwmbaj.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bFgfPRlfyC_NxHIDcxrl3GvFjXUAZFOT
X-Proofpoint-GUID: M1WMR9-D-LZ6TpUr7E8Q9-KthzLFqWRV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-10_14:2021-05-10,
 2021-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105110013
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

On Mon, 2021-05-10 at 15:54 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of April 18, 2021 7:06 am:
> > pHyp introduces two different type of credits: Default and Quality
> > of service (QoS).
> > 
> > The total number of default credits available on each LPAR depends
> > on CPU resources configured. But these credits can be shared or
> > over-committed across LPARs in shared mode which can result in
> > paste command failure (RMA_busy). To avoid NX HW contention, phyp
> > introduces QoS credit type which makes sure guaranteed access to NX
> > resources. The system admins can assign QoS credits for each LPAR
> > via HMC.
> > 
> > Default credit type is used to allocate a VAS window by default as
> > on powerVM implementation. But the process can pass
> > VAS_WIN_QOS_CREDITS
> 
> There's some interchanging of pHyp and PowerVM in the series.
> 
> PowerVM is probably the better term to use, with uppercase P.
> Unless you mean PAPR or pseries etc.
> 
> I think you can say the PAPR VAS spec has two different types of 
> credits, rather than say a specific hypervisor is introducing them.

DEF and QoS credits types are introduced by the hypervisor, not VAS
PAPR. We did not have these types on powerNV. 

> 
> > flag with VAS_TX_WIN_OPEN ioctl to open QoS type window.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/include/uapi/asm/vas-api.h | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/include/uapi/asm/vas-api.h
> > b/arch/powerpc/include/uapi/asm/vas-api.h
> > index ebd4b2424785..eb7c8694174f 100644
> > --- a/arch/powerpc/include/uapi/asm/vas-api.h
> > +++ b/arch/powerpc/include/uapi/asm/vas-api.h
> > @@ -13,11 +13,15 @@
> >  #define VAS_MAGIC	'v'
> >  #define VAS_TX_WIN_OPEN	_IOW(VAS_MAGIC, 0x20, struct
> > vas_tx_win_open_attr)
> >  
> > +/* Flags to VAS TX open window ioctl */
> > +/* To allocate a window with QoS credit, otherwise default credit
> > is used */
> > +#define	VAS_WIN_QOS_CREDITS	0x0000000000000001
> > +
> >  struct vas_tx_win_open_attr {
> 
> Some consistency of naming might help, VAS_TX_WIN_FLAG_QOS_CREDIT.

Sure, will change.
> 
> >  	__u32	version;
> >  	__s16	vas_id;	/* specific instance of vas or -1 for
> > default */
> >  	__u16	reserved1;
> > -	__u64	flags;	/* Future use */
> > +	__u64	flags;
> >  	__u64	reserved2[6];
> >  };
> >  
> > -- 
> > 2.18.2
> > 
> > 
> > 

