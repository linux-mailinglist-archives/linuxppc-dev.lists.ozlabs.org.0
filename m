Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A70633C1EBE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 07:03:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLgzt4Ddcz3bY1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 15:03:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ykwuec6O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ykwuec6O; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLgzP0Ym6z3bWZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jul 2021 15:03:28 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1694XjEw070478; Fri, 9 Jul 2021 01:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version :
 content-transfer-encoding : content-type : date : message-id : subject :
 from : to : cc : references : in-reply-to; s=pp1;
 bh=AMW7vvMa83iSUDo12nFgoC07huWNXPeFga9jLssQadE=;
 b=Ykwuec6OmyKEy963KrvmyPoKTx4/OgUQ/ckQB1uAq0Kxdnk4i0mgEmk1pJufWXv3jMMm
 QgYBK48F0I4rKF+gHT6TplWsfW7yWcOggn/iRj7ugzhrje4InYmKqRLuevzcc4a+yctH
 QJSyV8DMlALlPdAWPw1Lfdz+76pMwjIGT0H5JU23onnobhXgHejcrzmShoPWIiCDTP5F
 ta/ucuX/fshCFVXj9JEaDy51T8I8uvuck+KjS9bGzQVAns1R2pN7HGWNsdP7J1xrInco
 Mv9T7RuM+jijKxzfNgntVXl0RNF+FKFyh3RBMg6JqsFyj4Zo9WSTT+fygaS3lchHvZEm zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39pcsam48t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 01:03:22 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1694h6nS098835;
 Fri, 9 Jul 2021 01:03:22 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39pcsam485-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 01:03:22 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1694wBwh018523;
 Fri, 9 Jul 2021 05:03:21 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02wdc.us.ibm.com with ESMTP id 39jfhddv6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 05:03:20 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16953KW134865656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Jul 2021 05:03:20 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 666AF12405E;
 Fri,  9 Jul 2021 05:03:20 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B979A124052;
 Fri,  9 Jul 2021 05:03:19 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.163.19.100])
 by b01ledav002.gho.pok.ibm.com (Postfix) with SMTP;
 Fri,  9 Jul 2021 05:03:19 +0000 (GMT)
Received: from localhost (localhost6 [IPv6:::1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 1688EBC0B0E;
 Fri,  9 Jul 2021 00:03:17 -0500 (CDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Jul 2021 00:03:17 -0500
Message-Id: <CCOCHBK9FCOF.1KLFA4IL2AJNE@oc8246131445.ibm.com>
Subject: Re: [RESEND PATCH v4 08/11] powerpc: Initialize and use a temporary
 mm for patching
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: "Nicholas Piggin" <npiggin@gmail.com>, <linuxppc-dev@lists.ozlabs.org>
References: <20210506043452.9674-1-cmr@linux.ibm.com>
 <20210506043452.9674-9-cmr@linux.ibm.com>
 <1625119517.e6kkvfphsh.astroid@bobo.none>
 <CCHLZVOEHBYN.JEOBW598P7K5@oc8246131445.ibm.com>
 <1625125043.re5l9zg4kg.astroid@bobo.none>
In-Reply-To: <1625125043.re5l9zg4kg.astroid@bobo.none>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Z9jiV9ZOQ55sniEJDspJ7dhpuUpULyRa
X-Proofpoint-GUID: I33Y9yXz3CD29QBdevJJEdWLcce9sL72
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_01:2021-07-09,
 2021-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107090020
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

On Thu Jul 1, 2021 at 2:51 AM CDT, Nicholas Piggin wrote:
> Excerpts from Christopher M. Riedl's message of July 1, 2021 5:02 pm:
> > On Thu Jul 1, 2021 at 1:12 AM CDT, Nicholas Piggin wrote:
> >> Excerpts from Christopher M. Riedl's message of May 6, 2021 2:34 pm:
> >> > When code patching a STRICT_KERNEL_RWX kernel the page containing th=
e
> >> > address to be patched is temporarily mapped as writeable. Currently,=
 a
> >> > per-cpu vmalloc patch area is used for this purpose. While the patch
> >> > area is per-cpu, the temporary page mapping is inserted into the ker=
nel
> >> > page tables for the duration of patching. The mapping is exposed to =
CPUs
> >> > other than the patching CPU - this is undesirable from a hardening
> >> > perspective. Use a temporary mm instead which keeps the mapping loca=
l to
> >> > the CPU doing the patching.
> >> >=20
> >> > Use the `poking_init` init hook to prepare a temporary mm and patchi=
ng
> >> > address. Initialize the temporary mm by copying the init mm. Choose =
a
> >> > randomized patching address inside the temporary mm userspace addres=
s
> >> > space. The patching address is randomized between PAGE_SIZE and
> >> > DEFAULT_MAP_WINDOW-PAGE_SIZE. The upper limit is necessary due to ho=
w
> >> > the Book3s64 Hash MMU operates - by default the space above
> >> > DEFAULT_MAP_WINDOW is not available. For now, the patching address f=
or
> >> > all platforms/MMUs is randomized inside this range.  The number of
> >> > possible random addresses is dependent on PAGE_SIZE and limited by
> >> > DEFAULT_MAP_WINDOW.
> >> >=20
> >> > Bits of entropy with 64K page size on BOOK3S_64:
> >> >=20
> >> >         bits of entropy =3D log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SI=
ZE)
> >> >=20
> >> >         PAGE_SIZE=3D64K, DEFAULT_MAP_WINDOW_USER64=3D128TB
> >> >         bits of entropy =3D log2(128TB / 64K) bits of entropy =3D 31
> >> >=20
> >> > Randomization occurs only once during initialization at boot.
> >> >=20
> >> > Introduce two new functions, map_patch() and unmap_patch(), to
> >> > respectively create and remove the temporary mapping with write
> >> > permissions at patching_addr. The Hash MMU on Book3s64 requires mapp=
ing
> >> > the page for patching with PAGE_SHARED since the kernel cannot acces=
s
> >> > userspace pages with the PAGE_PRIVILEGED (PAGE_KERNEL) bit set.
> >> >=20
> >> > Also introduce hash_prefault_mapping() to preload the SLB entry and =
HPTE
> >> > for the patching_addr when using the Hash MMU on Book3s64 to avoid
> >> > taking an SLB and Hash fault during patching.
> >>
> >> What prevents the SLBE or HPTE from being removed before the last
> >> access?
> >=20
> > This code runs with local IRQs disabled - we also don't access anything
> > else in userspace so I'm not sure what else could cause the entries to
> > be removed TBH.
> >=20
> >>
> >>
> >> > +#ifdef CONFIG_PPC_BOOK3S_64
> >> > +
> >> > +static inline int hash_prefault_mapping(pgprot_t pgprot)
> >> >  {
> >> > -	struct vm_struct *area;
> >> > +	int err;
> >> > =20
> >> > -	area =3D get_vm_area(PAGE_SIZE, VM_ALLOC);
> >> > -	if (!area) {
> >> > -		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
> >> > -			cpu);
> >> > -		return -1;
> >> > -	}
> >> > -	this_cpu_write(text_poke_area, area);
> >> > +	if (radix_enabled())
> >> > +		return 0;
> >> > =20
> >> > -	return 0;
> >> > -}
> >> > +	err =3D slb_allocate_user(patching_mm, patching_addr);
> >> > +	if (err)
> >> > +		pr_warn("map patch: failed to allocate slb entry\n");
> >> > =20
> >> > -static int text_area_cpu_down(unsigned int cpu)
> >> > -{
> >> > -	free_vm_area(this_cpu_read(text_poke_area));
> >> > -	return 0;
> >> > +	err =3D hash_page_mm(patching_mm, patching_addr, pgprot_val(pgprot=
), 0,
> >> > +			   HPTE_USE_KERNEL_KEY);
> >> > +	if (err)
> >> > +		pr_warn("map patch: failed to insert hashed page\n");
> >> > +
> >> > +	/* See comment in switch_slb() in mm/book3s64/slb.c */
> >> > +	isync();
> >>
> >> I'm not sure if this is enough. Could we context switch here? You've
> >> got the PTL so no with a normal kernel but maybe yes with an RT kernel
> >> How about taking an machine check that clears the SLB? Could the HPTE
> >> get removed by something else here?
> >=20
> > All of this happens after a local_irq_save() which should at least
> > prevent context switches IIUC.
>
> Ah yeah I didn't look that far back. A machine check can take out SLB
> entries.
>
> > I am not sure what else could cause the
> > HPTE to get removed here.
>
> Other CPUs?
>

Right because the HPTEs are "global".

> >> You want to prevent faults because you might be patching a fault
> >> handler?
> >=20
> > In a more general sense: I don't think we want to take page faults ever=
y
> > time we patch an instruction with a STRICT_RWX kernel. The Hash MMU pag=
e
> > fault handler codepath also checks `current->mm` in some places which
> > won't match the temporary mm. Also `current->mm` can be NULL which
> > caused problems in my earlier revisions of this series.
>
> Hmm, that's a bit of a hack then. Maybe doing an actual mm switch and
> setting current->mm properly would explode too much. Maybe that's
> okayish.
> But I can't see how the HPT code is up to the job of this in general
> (even if that current->mm issue was fixed).
>
> To do it without holes you would either have to get the SLB MCE handler
> to restore that particular SLB if it flushed it, or restart the patch
> code from a fixup location if it took an MCE after installing the SLB.
> And bolt a hash table entry.

We discussed this a bit off list and decided that it's not worth the
trouble implementing percpu temp mm support for Hash at this time.
Instead, I will post a new version of this series where we drop into
realmode to patch with the Hash MMU. This avoids the W+X mapping
altogether and so doesn't expose anything to other CPUs during patching.
We will keep the Radix support for a percpu temp mm since 1) it doesn't
require hacks like Hash and 2) it's overall preferable to dropping into
realmode.

>
> Thanks,
> Nick

