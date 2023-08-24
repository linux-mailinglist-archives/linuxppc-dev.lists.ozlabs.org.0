Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 775B5786A29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 10:34:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FT/XVGxn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWbx93R2Bz3cCS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 18:34:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FT/XVGxn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWbwD68vFz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 18:34:04 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37O8VTbO001260;
	Thu, 24 Aug 2023 08:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=KOHfq7yE34oHMF/DBtgsNugut3nvnkYP0hCTO74X1m8=;
 b=FT/XVGxnbV1yJLUcavz1X/DkKtrpIYKPgr7jA1kh6yoIjCakGbzElNg/24Nfr13mm730
 SrhuxUerPl7q/HjUfJZ0Ej4u4HAY/sWOC/NdESVVU9VmqzuIyh259ikz04aj2G65g47g
 HHhGvubKmqQKVegkU2xZLlKLmFGNuSJyhlVtUWOJiR03Z6SpMyRRfFkNl+5G1mNyUqRJ
 FEUGKLtnH7mhnpL7eYHKA7Kv7pp3XTlIppw48EJbMU7T5WHUp6uMTg6i04y0Oo9qEeAz
 O8n6orMoY88sg/d0Q0WE2Xh61CpMTrcID83QRdE2XgtJDBWrp+IkOIYYmVju1tZNRHiE Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sp3rwr0yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 08:33:18 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37O8WAYI003577;
	Thu, 24 Aug 2023 08:33:18 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sp3rwr0y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 08:33:18 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37O6ewPB026143;
	Thu, 24 Aug 2023 08:33:17 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3snqgt4ycw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 08:33:17 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37O8XEQm41288298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Aug 2023 08:33:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC7A42005A;
	Thu, 24 Aug 2023 08:33:13 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70D4620075;
	Thu, 24 Aug 2023 08:32:27 +0000 (GMT)
Received: from osiris (unknown [9.171.81.161])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 24 Aug 2023 08:32:27 +0000 (GMT)
Date: Thu, 24 Aug 2023 10:32:25 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH rfc v2 04/10] s390: mm: use try_vma_locked_page_fault()
Message-ID: <20230824083225.10112-A-hca@linux.ibm.com>
References: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
 <20230821123056.2109942-5-wangkefeng.wang@huawei.com>
 <ZOcR4Z1WnCy1vl9T@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOcR4Z1WnCy1vl9T@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _ptMvc4VMCcBQrtNKVMyLJnbnArvRQhH
X-Proofpoint-GUID: MMqKuJFCH130oxqzSHmDVw6sZHdPY5i-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_05,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=517 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1011 spamscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308240065
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, loongarch@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, "H . Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, willy@infradead.org, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, surenb@google.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>
 , Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 24, 2023 at 10:16:33AM +0200, Alexander Gordeev wrote:
> On Mon, Aug 21, 2023 at 08:30:50PM +0800, Kefeng Wang wrote:
> > Use new try_vma_locked_page_fault() helper to simplify code.
> > No functional change intended.
> > 
> > Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> > ---
> >  arch/s390/mm/fault.c | 66 ++++++++++++++++++--------------------------
> >  1 file changed, 27 insertions(+), 39 deletions(-)
...
> > -	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
> > -	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
> > -		vma_end_read(vma);
> > -	if (!(fault & VM_FAULT_RETRY)) {
> > -		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> > -		if (likely(!(fault & VM_FAULT_ERROR)))
> > -			fault = 0;
> 
> This fault fixup is removed in the new version.
...

> > +		vmf.vm_flags = VM_WRITE;
> > +	if (vmf.vm_flags == VM_WRITE)
> > +		vmf.flags |= FAULT_FLAG_WRITE;
> > +
> > +	fault = try_vma_locked_page_fault(&vmf);
> > +	if (fault == VM_FAULT_NONE)
> > +		goto lock_mm;
> 
> Because VM_FAULT_NONE is set to 0 it gets confused with
> the success code of 0 returned by a fault handler. In the
> former case we want to continue, while in the latter -
> successfully return. I think it applies to all archs.
...
> FWIW, this series ends up with kernel BUG at arch/s390/mm/fault.c:341!

Without having looked in detail into this patch: all of this is likely
because s390's fault handling is quite odd. Not only because fault is set
to 0, but also because of the private VM_FAULT values like
VM_FAULT_BADCONTEXT. I'm just cleaning up all of this, but it won't make it
for the next merge window.

Therefore I'd like to ask to drop the s390 conversion of this series, and
if this series is supposed to be merged the s390 conversion needs to be
done later. Let's not waste more time on the current implementation,
please.
