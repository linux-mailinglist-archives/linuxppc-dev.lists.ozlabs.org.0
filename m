Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C62269F21C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 10:48:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMBD23gZfz3c7X
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 20:48:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iuFFN3Jb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iuFFN3Jb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMBC65RYvz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 20:47:14 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31M9fWkK030100;
	Wed, 22 Feb 2023 09:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=Fvvcw+/bAPU7vRSEgRNSIDAcnpnbVVbqupbtRGK4M8M=;
 b=iuFFN3Jbwj7yVPLDYva2KPPaFrkV0Mp7AGgXiokxoWOjrov0pZFUC76MiJyzfXVAvjFp
 VI8GJ4Pjv7zmIly2AjLsHEtAV25xdCfqcGddg2w3ARNiq+EuT52BhoVDz4H5+QOcmxf1
 ywR3D0vPUn1zVOncbBkBXdIqJd4mtt5uTfcAwU9wXD3ALQbA5pgerXv4l0Sx1wdYEDfM
 9luHr3KVOQdnqJ4ZX0um1Rix4SlK/2B/atsFTCznQq9Ti3J4FrP4XVWQg1dPsOOJSKdQ
 bXxmEpJJXrZOSjImtgqQ12tfxsrYzuymZX6IPdXzYmZzagRfFgQWI99xSdmKJ1av8Ils VA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwgmtg4hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 09:47:06 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31M9faTL030209;
	Wed, 22 Feb 2023 09:47:05 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwgmtg4h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 09:47:05 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31LNZrWx007301;
	Wed, 22 Feb 2023 09:47:04 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3ntpa6d4ms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 09:47:04 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31M9l19D21103332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Feb 2023 09:47:01 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A04532004B;
	Wed, 22 Feb 2023 09:47:01 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23C6D20043;
	Wed, 22 Feb 2023 09:46:59 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.123.148])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Feb 2023 09:46:58 +0000 (GMT)
Date: Wed, 22 Feb 2023 15:16:54 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] arch/powerpc/include/asm/barrier.h: redefine rmb and
 wmb to lwsync
Message-ID: <Y/XkjobvDPFErM7J@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230222090344.189270-1-kconsul@linux.vnet.ibm.com>
 <c4dcf969-0836-cc78-63d9-db83b9ebfa1d@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4dcf969-0836-cc78-63d9-db83b9ebfa1d@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K8XLO_aaFrchVsDdF_7RO03vsbPRmZNd
X-Proofpoint-ORIG-GUID: 0Q0zMhpKo-mYBNkFeazeFDreMiSOiyTV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_04,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220083
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Thanks!
> 
> > ---
> >   arch/powerpc/include/asm/barrier.h | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
> > index b95b666f0374..e088dacc0ee8 100644
> > --- a/arch/powerpc/include/asm/barrier.h
> > +++ b/arch/powerpc/include/asm/barrier.h
> > @@ -36,8 +36,15 @@
> >    * heavy-weight sync, so smp_wmb() can be a lighter-weight eieio.
> >    */
> >   #define __mb()   __asm__ __volatile__ ("sync" : : : "memory")
> > +
> > +/* The sub-arch has lwsync. */
> > +#if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
> > +#define __rmb() __asm__ __volatile__ ("lwsync" : : : "memory")
> > +#define __wmb() __asm__ __volatile__ ("lwsync" : : : "memory")
> 
> I'd have preferred with 'asm volatile' though.
Sorry about that! That wasn't the intent of this patch.
Probably another patch series should change this manner of #defining
assembly.
