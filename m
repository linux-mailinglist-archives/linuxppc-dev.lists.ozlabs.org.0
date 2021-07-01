Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDF83B8E06
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 09:02:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFq0Y23lvz309W
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 17:02:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cf1/5bv4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cf1/5bv4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFq056FRcz2yNP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 17:02:13 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1616XuQ6082511; Thu, 1 Jul 2021 03:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-transfer-encoding : content-type : date : message-id : cc :
 subject : from : to : references : in-reply-to; s=pp1;
 bh=QunyWFdTktDEn69TghXAFsk9C5gvRfGSVbMRpjGbCKs=;
 b=cf1/5bv47jYamciugzmxIiRZRPMGIyxlbCgs6zU73b2iGFjqwSt6RksDkYDB0T2FX4Mk
 CcRhWlJVqw1x0cWZMGuTu1b3CfXv6IrrZ6kaow4JLGLdT7FjOmDXzIx0MqIz1xn58PkT
 h0sz/VAfEcOJ6oiQbh7yup42c4TW9Hl2hNuRL0aPc9JO98+o3QdOlEeJepfD3iamGjLm
 M8Bk189mcgxEo5sJuahVVbKrxZOGHx/s+7G2EUM3YMzv1gAj2JmeiZpKRdwCOCQ3WFUL
 +I8p8QSANMxbuzvVaq9Dbo5vSeErRdQZtVL1uWC/SN2nSpilkI4mhyrtrC9vvifXoLnP ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39h8hv8ksw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 03:02:07 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1616YEJZ083193;
 Thu, 1 Jul 2021 03:02:07 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39h8hv8kse-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 03:02:07 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1616vO2F024628;
 Thu, 1 Jul 2021 07:02:06 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 39ekxdxq3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 07:02:06 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 161725J050463156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 07:02:05 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 179FE13604F;
 Thu,  1 Jul 2021 07:02:05 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE7D5136051;
 Thu,  1 Jul 2021 07:02:04 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.211.158.151])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with SMTP;
 Thu,  1 Jul 2021 07:02:04 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id A92C8BC00D0;
 Thu,  1 Jul 2021 02:02:01 -0500 (CDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Jul 2021 02:02:01 -0500
Message-Id: <CCHLZVOEHBYN.JEOBW598P7K5@oc8246131445.ibm.com>
Subject: Re: [RESEND PATCH v4 08/11] powerpc: Initialize and use a temporary
 mm for patching
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: "Nicholas Piggin" <npiggin@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
References: <20210506043452.9674-1-cmr@linux.ibm.com>
 <20210506043452.9674-9-cmr@linux.ibm.com>
 <1625119517.e6kkvfphsh.astroid@bobo.none>
In-Reply-To: <1625119517.e6kkvfphsh.astroid@bobo.none>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JzWLxlcX6SrlITurj02gIS1T82izCquk
X-Proofpoint-GUID: ZvaqWPrUBnFQMloBnpOHa6sja88e7UYD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010044
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
Cc: tglx@linutronix.de, x86@kernel.org, keescook@chromium.org,
 linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Jul 1, 2021 at 1:12 AM CDT, Nicholas Piggin wrote:
> Excerpts from Christopher M. Riedl's message of May 6, 2021 2:34 pm:
> > When code patching a STRICT_KERNEL_RWX kernel the page containing the
> > address to be patched is temporarily mapped as writeable. Currently, a
> > per-cpu vmalloc patch area is used for this purpose. While the patch
> > area is per-cpu, the temporary page mapping is inserted into the kernel
> > page tables for the duration of patching. The mapping is exposed to CPU=
s
> > other than the patching CPU - this is undesirable from a hardening
> > perspective. Use a temporary mm instead which keeps the mapping local t=
o
> > the CPU doing the patching.
> >=20
> > Use the `poking_init` init hook to prepare a temporary mm and patching
> > address. Initialize the temporary mm by copying the init mm. Choose a
> > randomized patching address inside the temporary mm userspace address
> > space. The patching address is randomized between PAGE_SIZE and
> > DEFAULT_MAP_WINDOW-PAGE_SIZE. The upper limit is necessary due to how
> > the Book3s64 Hash MMU operates - by default the space above
> > DEFAULT_MAP_WINDOW is not available. For now, the patching address for
> > all platforms/MMUs is randomized inside this range.  The number of
> > possible random addresses is dependent on PAGE_SIZE and limited by
> > DEFAULT_MAP_WINDOW.
> >=20
> > Bits of entropy with 64K page size on BOOK3S_64:
> >=20
> >         bits of entropy =3D log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)
> >=20
> >         PAGE_SIZE=3D64K, DEFAULT_MAP_WINDOW_USER64=3D128TB
> >         bits of entropy =3D log2(128TB / 64K) bits of entropy =3D 31
> >=20
> > Randomization occurs only once during initialization at boot.
> >=20
> > Introduce two new functions, map_patch() and unmap_patch(), to
> > respectively create and remove the temporary mapping with write
> > permissions at patching_addr. The Hash MMU on Book3s64 requires mapping
> > the page for patching with PAGE_SHARED since the kernel cannot access
> > userspace pages with the PAGE_PRIVILEGED (PAGE_KERNEL) bit set.
> >=20
> > Also introduce hash_prefault_mapping() to preload the SLB entry and HPT=
E
> > for the patching_addr when using the Hash MMU on Book3s64 to avoid
> > taking an SLB and Hash fault during patching.
>
> What prevents the SLBE or HPTE from being removed before the last
> access?

This code runs with local IRQs disabled - we also don't access anything
else in userspace so I'm not sure what else could cause the entries to
be removed TBH.

>
>
> > +#ifdef CONFIG_PPC_BOOK3S_64
> > +
> > +static inline int hash_prefault_mapping(pgprot_t pgprot)
> >  {
> > -	struct vm_struct *area;
> > +	int err;
> > =20
> > -	area =3D get_vm_area(PAGE_SIZE, VM_ALLOC);
> > -	if (!area) {
> > -		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
> > -			cpu);
> > -		return -1;
> > -	}
> > -	this_cpu_write(text_poke_area, area);
> > +	if (radix_enabled())
> > +		return 0;
> > =20
> > -	return 0;
> > -}
> > +	err =3D slb_allocate_user(patching_mm, patching_addr);
> > +	if (err)
> > +		pr_warn("map patch: failed to allocate slb entry\n");
> > =20
> > -static int text_area_cpu_down(unsigned int cpu)
> > -{
> > -	free_vm_area(this_cpu_read(text_poke_area));
> > -	return 0;
> > +	err =3D hash_page_mm(patching_mm, patching_addr, pgprot_val(pgprot), =
0,
> > +			   HPTE_USE_KERNEL_KEY);
> > +	if (err)
> > +		pr_warn("map patch: failed to insert hashed page\n");
> > +
> > +	/* See comment in switch_slb() in mm/book3s64/slb.c */
> > +	isync();
>
> I'm not sure if this is enough. Could we context switch here? You've
> got the PTL so no with a normal kernel but maybe yes with an RT kernel
> How about taking an machine check that clears the SLB? Could the HPTE
> get removed by something else here?

All of this happens after a local_irq_save() which should at least
prevent context switches IIUC. I am not sure what else could cause the
HPTE to get removed here.

>
> You want to prevent faults because you might be patching a fault
> handler?

In a more general sense: I don't think we want to take page faults every
time we patch an instruction with a STRICT_RWX kernel. The Hash MMU page
fault handler codepath also checks `current->mm` in some places which
won't match the temporary mm. Also `current->mm` can be NULL which
caused problems in my earlier revisions of this series.

>
> Thanks,
> Nick

