Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF19B8988
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 04:49:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZJ8Q02jLzF3Cp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 12:49:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZJ6Y3VVSzF39S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 12:47:48 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8K2kRkV084893; Thu, 19 Sep 2019 22:47:44 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v4mdy2upv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 22:47:44 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8K2imak025454;
 Fri, 20 Sep 2019 02:47:43 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 2v3vbttfby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Sep 2019 02:47:43 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8K2lgpV53018918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Sep 2019 02:47:42 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E9D3AE060;
 Fri, 20 Sep 2019 02:47:42 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A223AE05C;
 Fri, 20 Sep 2019 02:47:41 +0000 (GMT)
Received: from LeoBras (unknown [9.85.172.122])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 20 Sep 2019 02:47:41 +0000 (GMT)
Message-ID: <5af478e1da6c0b847fbaf3aff6ccce5720e8a23c.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc: kvm: Reduce calls to get current->mm by
 storing the value locally
From: Leonardo Bras <leonardo@linux.ibm.com>
To: PaulMackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Thu, 19 Sep 2019 23:47:36 -0300
In-Reply-To: <20190919222748.20761-1-leonardo@linux.ibm.com>
References: <20190919222748.20761-1-leonardo@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-rctJ8lPs1EJcH0JFR0tD"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-19_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=849 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909200030
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


--=-rctJ8lPs1EJcH0JFR0tD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Paul,=20
I sent this patch, but I have a question:

On Thu, 2019-09-19 at 19:27 -0300, Leonardo Bras wrote:
> Reduces the number of calls to get_current() in order to get the value of
> current->mm by doing it once and storing the value, since it is not
> supposed to change inside the same process).
>=20
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_64_mmu_hv.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3=
s_64_mmu_hv.c
> index 9a75f0e1933b..f2b9aea43216 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -508,6 +508,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, =
struct kvm_vcpu *vcpu,
>  	struct vm_area_struct *vma;
>  	unsigned long rcbits;
>  	long mmio_update;
> +	struct mm_struct *mm;
> =20
>  	if (kvm_is_radix(kvm))
>  		return kvmppc_book3s_radix_page_fault(run, vcpu, ea, dsisr);
> @@ -584,6 +585,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, =
struct kvm_vcpu *vcpu,
>  	is_ci =3D false;
>  	pfn =3D 0;
>  	page =3D NULL;
> +	mm =3D current->mm;

Here, current->mm is not always the same as kvm->mm?=20

>  	pte_size =3D PAGE_SIZE;
>  	writing =3D (dsisr & DSISR_ISSTORE) !=3D 0;
>  	/* If writing !=3D 0, then the HPTE must allow writing, if we get here =
*/
> @@ -592,8 +594,8 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, =
struct kvm_vcpu *vcpu,
>  	npages =3D get_user_pages_fast(hva, 1, writing ? FOLL_WRITE : 0, pages)=
;
>  	if (npages < 1) {
>  		/* Check if it's an I/O mapping */
> -		down_read(&current->mm->mmap_sem);
> -		vma =3D find_vma(current->mm, hva);
> +		down_read(&mm->mmap_sem);
> +		vma =3D find_vma(mm, hva);
>  		if (vma && vma->vm_start <=3D hva && hva + psize <=3D vma->vm_end &&
>  		    (vma->vm_flags & VM_PFNMAP)) {
>  			pfn =3D vma->vm_pgoff +
> @@ -602,7 +604,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, =
struct kvm_vcpu *vcpu,
>  			is_ci =3D pte_ci(__pte((pgprot_val(vma->vm_page_prot))));
>  			write_ok =3D vma->vm_flags & VM_WRITE;
>  		}
> -		up_read(&current->mm->mmap_sem);
> +		up_read(&mm->mmap_sem);
>  		if (!pfn)
>  			goto out_put;
>  	} else {
> @@ -621,8 +623,7 @@ int kvmppc_book3s_hv_page_fault(struct kvm_run *run, =
struct kvm_vcpu *vcpu,
>  			 * hugepage split and collapse.
>  			 */
>  			local_irq_save(flags);
> -			ptep =3D find_current_mm_pte(current->mm->pgd,
> -						   hva, NULL, NULL);
> +			ptep =3D find_current_mm_pte(mm->pgd, hva, NULL, NULL);
>  			if (ptep) {
>  				pte =3D kvmppc_read_update_linux_pte(ptep, 1);
>  				if (__pte_write(pte))

Thanks !

--=-rctJ8lPs1EJcH0JFR0tD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2EPcgACgkQlQYWtz9S
ttT92xAAlU6n/TDflKWVfsQt5/FJ3oTfcdrylpi8GIMzLpx5L3G7XRquJ/JEDBKe
NyqID7oNkE1t3EV3jgazmSEnf6t03k33zM0K813pVGUhOXQMN7pHj3GMGtb7Tqji
3PC+wN3IB+lH1quvhChiRQYYKnVSHgVZSI8T+dnmCklJJ3kSmIkr2t6IrIqZIShO
24SJBGXSXtUspknpO3xkxs/CDMn7WoK24jIRrXkv/myInp2rrZG+9NCj1FnA7/4M
TUXQ2tFCNQk5LHzx0wPS73Z8DqMGGb/goPxs7ODlGLgS+k7sQvz6OLGdAB7/C2kB
CLDAHhUiSUArXjhv7hiigPZShnCQ0G0MWHjRY2CSHzP4kyoDnd9uQ9DW8zbuiY+D
YKTbpXS8fYfUKIN3M26BUBWu7HeT6XtJ3rueSQ50VzZDLXeqq765r0Kl4vNdWmCj
Vx4ZOazQG9OE8yPVfbzqIWAj+nCR9pHQIg98qqiaOw7sdjVyV9fuzuMO68/cAww5
msZHyag7vcDWxR60I/I9f5k26aoUO+AMokGoPNKUASUZB3+xiHJEWxxhB21QzJXD
K5STiGz0pyB7IOyGwoIItC/6mVTEIVLI4kqO0yYHbzigUtzWnr7rh9NsbvI5Yp4q
UA8U8xwvzq4Atc0B+oejql+s6v0cZ7qQG0ah78bmwMXPLfmnu+E=
=Hdjd
-----END PGP SIGNATURE-----

--=-rctJ8lPs1EJcH0JFR0tD--

