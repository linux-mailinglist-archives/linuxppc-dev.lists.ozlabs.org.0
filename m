Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA7C6099BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 07:23:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mwk4G6QRGz2xy6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 16:23:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hNx44WIR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hNx44WIR;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mwk3K2HNHz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 16:22:20 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29O58Jod001302;
	Mon, 24 Oct 2022 05:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=SH+MxxNv5WOIAlR9u2YYihqT521I5PqrD33akQCsBak=;
 b=hNx44WIRfGeyswRs3qGa/7Fj7b827BR9NWN4sAnvuI/HWMN5CpVHhgPVfILomAUNGaU6
 h3Kjs3fMYwWRmqksz4OBOwhmpHAsTldeElYIBz5ibvimXc08PUryjw3pAojW6RUTAz5C
 ykhCqfwznZYB/vH2I4oHoiDhrhJc8ekRfJFj4TTVg/618LdaOJV1HX+4EglySFOwEnUp
 WufAxG4UomETk0yF2zKuYjLTzjyFKBgN8w8eRWB16Uq6DAzgBFvSwnCiCvWiqXMyqHyA
 UKvrfOKVe+iXqvbHOCm2K8o/6Q2rdqVWp6i17LlP6MjYeukaxS8lxHhAH2ssnXswCNWy iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kctjter12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Oct 2022 05:22:12 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29O5ICEP034808;
	Mon, 24 Oct 2022 05:22:12 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kctjter0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Oct 2022 05:22:12 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29O5LTeU027129;
	Mon, 24 Oct 2022 05:22:10 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03ams.nl.ibm.com with ESMTP id 3kc8592pw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Oct 2022 05:22:10 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29O5M8221704612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Oct 2022 05:22:08 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09A0F4C04A;
	Mon, 24 Oct 2022 05:22:08 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7A834C044;
	Mon, 24 Oct 2022 05:22:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 24 Oct 2022 05:22:07 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 734D6600BA;
	Mon, 24 Oct 2022 16:22:01 +1100 (AEDT)
Message-ID: <36caf90fe6df4cea3b719913856e3d080c2ca31f.camel@linux.ibm.com>
Subject: Re: [PATCH v8 4/6] powerpc/tlb: Add local flush for page given
 mm_struct and psize
From: Benjamin Gray <bgray@linux.ibm.com>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 24 Oct 2022 16:22:01 +1100
In-Reply-To: <491120551489673b614d2f058ea580dc9a1534f0.camel@russell.cc>
References: <20221021052238.580986-1-bgray@linux.ibm.com>
	 <20221021052238.580986-5-bgray@linux.ibm.com>
	 <491120551489673b614d2f058ea580dc9a1534f0.camel@russell.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IU7OsxDVGaa6jsHbByuPH-SGoInhRugX
X-Proofpoint-ORIG-GUID: j-hRWsPp9bU7NtgHgodD2mGPIu7nHlAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-23_02,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=962 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210240032
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
Cc: jniethe5@gmail.com, npiggin@gmail.com, cmr@bluescreens.de, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-10-24 at 14:30 +1100, Russell Currey wrote:
> On Fri, 2022-10-21 at 16:22 +1100, Benjamin Gray wrote:
> > Adds a local TLB flush operation that works given an mm_struct, VA
> > to
> > flush, and page size representation.
> >=20
> > This removes the need to create a vm_area_struct, which the
> > temporary
> > patching mm work does not need.
> >=20
> > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> > ---
> > =C2=A0arch/powerpc/include/asm/book3s/32/tlbflush.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 9 +++++++++
> > =C2=A0arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 5 +++++
> > =C2=A0arch/powerpc/include/asm/book3s/64/tlbflush.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 8 ++++++++
> > =C2=A0arch/powerpc/include/asm/nohash/tlbflush.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 1 +
> > =C2=A04 files changed, 23 insertions(+)
> >=20
> > diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h
> > b/arch/powerpc/include/asm/book3s/32/tlbflush.h
> > index ba1743c52b56..e5a688cebf69 100644
> > --- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
> > +++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
> > @@ -2,6 +2,8 @@
> > =C2=A0#ifndef _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H
> > =C2=A0#define _ASM_POWERPC_BOOK3S_32_TLBFLUSH_H
> > =C2=A0
> > +#include <linux/build_bug.h>
> > +
> > =C2=A0#define MMU_NO_CONTEXT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (0)
> > =C2=A0/*
> > =C2=A0 * TLB flushing for "classic" hash-MMU 32-bit CPUs, 6xx, 7xx, 7xx=
x
> > @@ -74,6 +76,13 @@ static inline void local_flush_tlb_page(struct
> > vm_area_struct *vma,
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0flush_tlb_page(vma, vma=
ddr);
> > =C2=A0}
> > +
> > +static inline void local_flush_tlb_page_psize(struct mm_struct
> > *mm,
> > unsigned long vmaddr, int psize)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BUILD_BUG_ON(psize !=3D MMU_=
PAGE_4K);
>=20
> Is there any utility in adding this for 32bit if the following
> patches
> are only for Radix?

It needs some kind of definition to avoid #ifdef's. I figured I may as
well provide a correct implementation, given the functions around it
are implemented. The BUILD_BUG_ON specifically is just defensive in
case my assumptions are wrong. I don't know anything about these
machines, just what the kernel defines. I can remove the check, or
replace the whole implementation with a BUILD_BUG?
