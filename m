Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BD63B8D55
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 07:12:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFmYb2sZ6z3bXD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:12:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=meoFKDkd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=meoFKDkd; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFmY40dNjz2yNm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 15:12:07 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16154QiH054626; Thu, 1 Jul 2021 01:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-transfer-encoding : content-type : date : message-id : cc :
 subject : from : to : references : in-reply-to; s=pp1;
 bh=YLgQpRPJ1GRRmxVP4o36eN2IpqUWvL/lgTF0esteDeo=;
 b=meoFKDkd6M8baV4eg78h5G4g3nhUvxQ7kY9o8mp4eRDnjz1eDt5jz5zMZGVxOSceBS75
 e8PmANFNg4iMj+0LCNrKqt3ajX5TFoVh98aB97XGOIsePx7SpXrmB2q0KwCNyWIhhlhc
 IdEZ04bPAVLXd0xHOL3E30ZgF+6+EFuH16jWf3eA+El0vH5de161f+6/Ww5OAc/tfL91
 rnXx8BBhlYOKG2lmOG4EfZ8FPvduvHvF4bpOiwRlP7bCgx5/ybpStFPk+e/ikiFwDtwF
 Q/2xedxIqgfEZhD9eGPiMZjIo07+3GdtX8p+MZBQB1OLEzLgFKU9ZKHbAnnSGkLv1qs6 3w== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gntsdaav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 01:12:00 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16157ZUJ028690;
 Thu, 1 Jul 2021 05:11:59 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01dal.us.ibm.com with ESMTP id 39duvf52pf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 05:11:59 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1615BxoO41353590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 05:11:59 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26DCBAC05F;
 Thu,  1 Jul 2021 05:11:59 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60266AC059;
 Thu,  1 Jul 2021 05:11:58 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.211.158.151])
 by b01ledav006.gho.pok.ibm.com (Postfix) with SMTP;
 Thu,  1 Jul 2021 05:11:58 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id CC816BC00D0;
 Thu,  1 Jul 2021 00:11:55 -0500 (CDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Jul 2021 00:11:55 -0500
Message-Id: <CCHJNKZMJY5Q.3PK2V6112U5CG@oc8246131445.ibm.com>
Subject: Re: [RESEND PATCH v4 08/11] powerpc: Initialize and use a temporary
 mm for patching
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: "Daniel Axtens" <dja@axtens.net>, <linuxppc-dev@lists.ozlabs.org>
References: <20210506043452.9674-1-cmr@linux.ibm.com>
 <20210506043452.9674-9-cmr@linux.ibm.com>
 <87r1gvj45t.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87r1gvj45t.fsf@dja-thinkpad.axtens.net>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RFQifFxCDlIYAhTckoHBQp21RS--prpB
X-Proofpoint-ORIG-GUID: RFQifFxCDlIYAhTckoHBQp21RS--prpB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010034
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun Jun 20, 2021 at 10:19 PM CDT, Daniel Axtens wrote:
> Hi Chris,
>
> > +	/*
> > +	 * Choose a randomized, page-aligned address from the range:
> > +	 * [PAGE_SIZE, DEFAULT_MAP_WINDOW - PAGE_SIZE]
> > +	 * The lower address bound is PAGE_SIZE to avoid the zero-page.
> > +	 * The upper address bound is DEFAULT_MAP_WINDOW - PAGE_SIZE to stay
> > +	 * under DEFAULT_MAP_WINDOW with the Book3s64 Hash MMU.
> > +	 */
> > +	patching_addr =3D PAGE_SIZE + ((get_random_long() & PAGE_MASK)
> > +			% (DEFAULT_MAP_WINDOW - 2 * PAGE_SIZE));
>
> I checked and poking_init() comes after the functions that init the RNG,
> so this should be fine. The maths - while a bit fiddly to reason about -
> does check out.

Thanks for double checking.

>
> > +
> > +	/*
> > +	 * PTE allocation uses GFP_KERNEL which means we need to pre-allocate
> > +	 * the PTE here. We cannot do the allocation during patching with IRQ=
s
> > +	 * disabled (ie. "atomic" context).
> > +	 */
> > +	ptep =3D get_locked_pte(patching_mm, patching_addr, &ptl);
> > +	BUG_ON(!ptep);
> > +	pte_unmap_unlock(ptep, ptl);
> > +}
> > =20
> >  #if IS_BUILTIN(CONFIG_LKDTM)
> >  unsigned long read_cpu_patching_addr(unsigned int cpu)
> >  {
> > -	return (unsigned long)(per_cpu(text_poke_area, cpu))->addr;
> > +	return patching_addr;
> >  }
> >  #endif
> > =20
> > -static int text_area_cpu_up(unsigned int cpu)
> > +struct patch_mapping {
> > +	spinlock_t *ptl; /* for protecting pte table */
> > +	pte_t *ptep;
> > +	struct temp_mm temp_mm;
> > +};
> > +
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
>
> Here if slb_allocate_user() fails, you'll print a warning and then fall
> through to the rest of the function. You do return err, but there's a
> later call to hash_page_mm() that also sets err. Can slb_allocate_user()
> fail while hash_page_mm() succeeds, and would that be a problem?

Hmm, yes I think this is a problem. If slb_allocate_user() fails then we
could potentially mask that error until the actual patching
fails/miscompares later (and that *will* certainly fail in this case). I
will return the error and exit the function early in v5 of the series.
Thanks!

>
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
> > +
>
> The comment reads:
>
> /*
> * Synchronize slbmte preloads with possible subsequent user memory
> * address accesses by the kernel (user mode won't happen until
> * rfid, which is safe).
> */
> isync();
>
> I have to say having read the description of isync I'm not 100% sure why
> that's enough (don't we also need stores to complete?) but I'm happy to
> take commit 5434ae74629a ("powerpc/64s/hash: Add a SLB preload cache")
> on trust here!
>
> I think it does make sense for you to have that barrier here: you are
> potentially about to start poking at the memory mapped through that SLB
> entry so you should make sure you're fully synchronised.
>
> > +	return err;
> >  }
> > =20
>
> > +	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
> > +	use_temporary_mm(&patch_mapping->temp_mm);
> > =20
> > -	pmdp =3D pmd_offset(pudp, addr);
> > -	if (unlikely(!pmdp))
> > -		return -EINVAL;
> > +	/*
> > +	 * On Book3s64 with the Hash MMU we have to manually insert the SLB
> > +	 * entry and HPTE to prevent taking faults on the patching_addr later=
.
> > +	 */
> > +	return(hash_prefault_mapping(pgprot));
>
> hmm, `return hash_prefault_mapping(pgprot);` or
> `return (hash_prefault_mapping((pgprot));` maybe?

Yeah, I noticed I left the extra parentheses here after the RESEND. I
think this is left-over when I had another wrapper here... anyway, I'll
clean it up for v5.

>
> Kind regards,
> Daniel

