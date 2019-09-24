Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BD8BBFAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 03:24:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ck3w59XtzDqR2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 11:23:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ck271mLVzDqNy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2019 11:22:22 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8O1LTbT073040; Mon, 23 Sep 2019 21:22:12 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v794b8nu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2019 21:22:11 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8O1KDnh019706;
 Tue, 24 Sep 2019 01:22:10 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 2v5bg708kk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Sep 2019 01:22:10 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8O1M92f61931876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Sep 2019 01:22:09 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29704C605B;
 Tue, 24 Sep 2019 01:22:09 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5704C6055;
 Tue, 24 Sep 2019 01:22:06 +0000 (GMT)
Received: from LeoBras (unknown [9.85.133.81])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 24 Sep 2019 01:22:05 +0000 (GMT)
Message-ID: <26335319c18d082408a6ee5e10779c3ddc0f175c.camel@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc: kvm: Reduce calls to get current->mm by
 storing the value locally
From: Leonardo Bras <leonardo@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org
Date: Mon, 23 Sep 2019 22:22:03 -0300
In-Reply-To: <20190923213022.7740-1-leonardo@linux.ibm.com>
References: <20190923213022.7740-1-leonardo@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-+Y41az9LsIT4qs0rj54d"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-23_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=620 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909240011
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


--=-+Y41az9LsIT4qs0rj54d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have done a very simple comparison with gdb disassemble:
By applying this patch, there was a reduction in the function size from
882 to 878 instructions.

(It's a resend, due to not having all the correct lists on my previous
mail)=20

On Mon, 2019-09-23 at 18:30 -0300, Leonardo Bras wrote:
> Reduces the number of calls to get_current() in order to get the value of
> current->mm by doing it once and storing the value, since it is not
> supposed to change inside the same process).
>=20
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
> Re-sending to all lists involved. (I missed kvm ones)
>=20
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

--=-+Y41az9LsIT4qs0rj54d
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAl2Jb7sACgkQlQYWtz9S
ttRCKw/+OeErUppTnsIjp+7Zq869iTHdwvtlklWELhh2H0+Kd+VbRi+bCvQixE+G
oPE02fCYqlHXWiJzZwAwApZm183VHPKmuZj9/ZGzRckbgE8eU4gThdTeHvAFgLBG
XI6DJnZYV+7o844NpzpVUBCmo11Z3eRtwSNQpz7dPkKYib1KBbL8MhaTGAGUZ7Mf
jtBuqJsl1syekjBfdzsQnxZcBWSqoJFdlMAUj6uMbCCxZDggu+ZVScGRg5ul/ulN
/Kd8+tv2waR1Pn56TggXrK8/d8NEzw5I5wXoxDSfwbIWfFx30bAALzjscqfbM0cp
OS09u6aLR9HjdkQVnZQEPbdYzGXKqtF0R9r57N7oQekBzB+1VeiDt1BkfplloIdd
whHDE4bj5Yx5qKLMTmwhVDPk4vRC20CrDIzd6OHPh8Y01OMnFjSQ2AOv4tCDIDTm
TPfxncKrqa3jsXq8OmG5lp38RU1BHkcKEQ7bsMtcjUmKoZ/IC4ny9o7HgOxzRSIo
GU4j1PrYiTFkWysAZz2b1/irVyTJcRjKd4OSn9v19bCzoYgoIxg2TV7iLRUskAYM
ekja7TcMebodXVH/7PAEXSEvTFfkLd4bHbRcx/xh8CgUM3DYry6G3j+S313oeZgO
/oq7k7ObakMNmxkBkTxUYC/d8fcUjvwO3c5hqW8k+/t+tsGHa+Y=
=irWg
-----END PGP SIGNATURE-----

--=-+Y41az9LsIT4qs0rj54d--

