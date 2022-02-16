Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 404C84B7D71
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 03:22:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jz1vM5hTBz3cQx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 13:22:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DlZz0FMM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DlZz0FMM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jz1td1yjhz3bXg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 13:22:00 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21G1Bd7G002616; 
 Wed, 16 Feb 2022 02:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=TaUSjDQJxei8AvAUOzuKrDzZ/eiENrarNgb+ePwLd/Q=;
 b=DlZz0FMMHh/PRvDE9qhnCkN81sWGBHAeghQY9JXXulXJ0ooooHiRqXKEglrC+k79nfnH
 sGoXVo69NP4cNrVGYtvmMEwfOBzp4yLxKcqy+L651ghDemwQ59JBqMDTjxOnLTKqUli9
 i7fX0bCLeh4eYAddFLYDU6FFTyO2mzIgyjJkTXVqaCeu0BCgkcxAAcegWQXjtQ8YPcJs
 iS7LXH7vzuq2VwcT5uZPDQnUJdtbT2O2RXowLewJQJ5J4d7ZOEhOVnIXtdN6qlPzJG49
 wUTMIK1htY021SX5ou3nuvcDUkPBqFBvP45HPgEo7m6yb/r0UtgzN5cxq7ZF22JCBYp6 lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e8qcvh3rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 02:21:54 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21G2JuJs006947;
 Wed, 16 Feb 2022 02:21:54 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e8qcvh3rp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 02:21:54 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21G27pZk003064;
 Wed, 16 Feb 2022 02:21:53 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 3e64hbyh9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 02:21:53 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21G2LqRZ21365158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 02:21:52 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5DE5028060;
 Wed, 16 Feb 2022 02:21:52 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B67402805C;
 Wed, 16 Feb 2022 02:21:51 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 02:21:51 +0000 (GMT)
Message-ID: <e65e7d29ca28a01eb5806007177e4202271ad712.camel@linux.ibm.com>
Subject: Re: [PATCH v3 07/10] powerpc/vas: Add paste address mmap fault handler
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Tue, 15 Feb 2022 18:21:49 -0800
In-Reply-To: <1644808853.k17l68pv15.astroid@bobo.none>
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
 <d87bbb6c81e7b6c3d3b2d45f0549f27183172562.camel@linux.ibm.com>
 <1644808853.k17l68pv15.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dRrJef5TykAc3G_vAG6z0Oa2yOVTU86a
X-Proofpoint-GUID: IQqFppVpZqJyjs-LkSvcsid3lrf-Invh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_07,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202160008
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

On Mon, 2022-02-14 at 13:37 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of January 22, 2022 5:59 am:
> > The user space opens VAS windows and issues NX requests by pasting
> > CRB on the corresponding paste address mmap. When the system looses
> 
> s/loose/lose/g throughout the series.
> 
> > credits due to core removal, the kernel has to close the window in
> > the hypervisor
> 
> By the way what if the kernel does not close the window and we try
> to access the memory? The hypervisor will inject faults?

The requests on the already opened windows will be successful even the
LPAR lost credits (due to core removal). But the hypervisor expects the
LPAR to behave like good citizen and give up resources with core
removal. So we do not see any issue with current upstream code for
DLPAR removal.

But we will have an issue with the migration. The hypervisor knows the
actulal number of credits assigned to the source LPAR before migration.
So assigns the same number on the destination. 

> 
> > and make the window inactive by unmapping this paste
> > address. Also the OS has to handle NX request page faults if the
> > user
> > space issue NX requests.
> > 
> > This handler remap the new paste address with the same VMA when the
> > window is active again (due to core add with DLPAR). Otherwise
> > returns paste failure.
> 
> This patch should come before (or combined with) the patch that zaps 
> PTEs. Putting it afterwards is logically backward. Even if you don't
> really expect the series to half work in a half bisected state, it
> just makes the changes easier to follow.
> 
> Thanks,
> Nick
> 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/book3s/vas-api.c | 60
> > +++++++++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> > 
> > diff --git a/arch/powerpc/platforms/book3s/vas-api.c
> > b/arch/powerpc/platforms/book3s/vas-api.c
> > index 2d06bd1b1935..5ceba75c13eb 100644
> > --- a/arch/powerpc/platforms/book3s/vas-api.c
> > +++ b/arch/powerpc/platforms/book3s/vas-api.c
> > @@ -351,6 +351,65 @@ static int coproc_release(struct inode *inode,
> > struct file *fp)
> >  	return 0;
> >  }
> >  
> > +/*
> > + * This fault handler is invoked when the VAS/NX generates page
> > fault on
> > + * the paste address.
> 
> The core generates the page fault here, right? paste destination is 
> translated by the core MMU (the instruction is executed in the core,
> afterall).

correct. Will update. 
> 
> > Happens if the kernel closes window in hypervisor
> > + * (on PowerVM) due to lost credit or the paste address is not
> > mapped.
> 
> Call it pseries everywhere if you're talking about the API and Linux
> code, rather than some specific quirk or issue of of the PowerVM
> implementation.
> 
> > + */
> > +static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
> > +{
> > +	struct vm_area_struct *vma = vmf->vma;
> > +	struct file *fp = vma->vm_file;
> > +	struct coproc_instance *cp_inst = fp->private_data;
> > +	struct vas_window *txwin;
> > +	u64 paste_addr;
> > +	int ret;
> > +
> > +	/*
> > +	 * window is not opened. Shouldn't expect this error.
> > +	 */
> > +	if (!cp_inst || !cp_inst->txwin) {
> > +		pr_err("%s(): No send window open?\n", __func__);
> 
> Probably don't put PR_ERROR logs with question marks in them. The
> administrator knows less than you to answer the question.
> 
> "Unexpected fault on paste address with TX window closed" etc.
> 
> Then you don't need the comment either because the message explains
> it.
> 
> > +		return VM_FAULT_SIGBUS;
> > +	}
> > +
> > +	txwin = cp_inst->txwin;
> > +	/*
> > +	 * Fault is coming due to missing from the original mmap.
> 
> Rather than a vague comment like this (which we already know a fault 
> comes from a missing or insufficient PTE), you could point to exactly
> the code which zaps the PTEs.
> 
> > +	 * Can happen only when the window is closed due to lost
> > +	 * credit before mmap() or the user space issued NX request
> > +	 * without mapping.
> > +	 */
> > +	if (txwin->task_ref.vma != vmf->vma) {
> > +		pr_err("%s(): No previous mapping with paste
> > address\n",
> > +			__func__);
> > +		return VM_FAULT_SIGBUS;
> > +	}
> > +
> > +	mutex_lock(&txwin->task_ref.mmap_mutex);
> > +	/*
> > +	 * The window may be inactive due to lost credit (Ex: core
> > +	 * removal with DLPAR). When the window is active again when
> > +	 * the credit is available, remap with the new paste address.
> 
> Remap also typically means mapping the same physical memory at a 
> different virtual address. So when you say remap with the new paste
> address, in Linux mm terms that means you're mapping the same window
> at a different virtual address.
> 
> But you're faulting a different physical address into the same
> virtual.

Yes, we get different physical address and this handler maps the this
paste address at the existing virtual address. will update this
comment.
> 
> > +	 */
> > +	if (txwin->status == VAS_WIN_ACTIVE) {
> > +		paste_addr = cp_inst->coproc->vops->paste_addr(txwin);
> > +		if (paste_addr) {
> > +			ret = vmf_insert_pfn(vma, vma->vm_start,
> > +					(paste_addr >> PAGE_SHIFT));
> > +			mutex_unlock(&txwin->task_ref.mmap_mutex);
> > +			return ret;
> > +		}
> > +	}
> > +	mutex_unlock(&txwin->task_ref.mmap_mutex);
> 
> Here a comment about how userspace is supposed to handle the
> window-closed condition might be appropriate.
> 
> Thanks,
> Nick
> 
> > +
> > +	return VM_FAULT_SIGBUS;
> > +
> > +}
> > +static const struct vm_operations_struct vas_vm_ops = {
> > +	.fault = vas_mmap_fault,
> > +};
> > +
> >  static int coproc_mmap(struct file *fp, struct vm_area_struct
> > *vma)
> >  {
> >  	struct coproc_instance *cp_inst = fp->private_data;
> > @@ -417,6 +476,7 @@ static int coproc_mmap(struct file *fp, struct
> > vm_area_struct *vma)
> >  			paste_addr, vma->vm_start, rc);
> >  
> >  	txwin->task_ref.vma = vma;
> > +	vma->vm_ops = &vas_vm_ops;
> >  
> >  out:
> >  	mutex_unlock(&txwin->task_ref.mmap_mutex);
> > -- 
> > 2.27.0
> > 
> > 
> > 

