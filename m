Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A02085004FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 06:18:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kf5n64z2rz3bhR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 14:18:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=B9ixypu7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kf5mQ5TTWz2xfT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 14:18:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=B9ixypu7; 
 dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4Kf5mM5yCtz4xLV; Thu, 14 Apr 2022 14:18:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1649909891;
 bh=oSFTQN5XpimNXqsD08tupkvcuCmsZwu0RDa1OOcL13A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B9ixypu7Oy3JzGGzWMQcKwPzJdJFZ9xgg93g86u612qEnQyRsvTfBcnewpACCzPFe
 wO3uTo7gv6PmPT0qSg6MUTIIqc6T60mv3Soc2OxH/nUWtPN77E0byNknASaeO4swgc
 36XV2lK0m69Rdnehbai1NAsx081ycPvN91UtnTS4=
Date: Thu, 14 Apr 2022 14:18:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] KVM: PPC: Fix TCE handling for VFIO
Message-ID: <YlegeomEgsKk77aG@yekko>
References: <20220406040416.3608518-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GK8C8w0gKbIl6lLW"
Content-Disposition: inline
In-Reply-To: <20220406040416.3608518-1-aik@ozlabs.ru>
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
Cc: Daniel Barboza <dbarboza@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--GK8C8w0gKbIl6lLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 06, 2022 at 02:04:16PM +1000, Alexey Kardashevskiy wrote:
> At the moment the IOMMU page size in a pseries VM is 16MB (the biggest
> allowed by LoPAPR), this page size is used for an emulated TCE table.
> If there is a passed though PCI device, that there are hardware IOMMU
> tables with equal or smaller IOMMU page sizes so one emulated IOMMU pages
> is backed by power-of-two hardware pages.
>=20
> The code wrongly uses the emulated TCE index instead of hardware TCE
> index in error handling. The problem is easier to see on POWER8 with
> multi-level TCE tables (when only the first level is preallocated)
> as hash mode uses real mode TCE hypercalls handlers.
> The kernel starts using indirect tables when VMs get bigger than 128GB
> (depends on the max page order).
> The very first real mode hcall is going to fail with H_TOO_HARD as
> in the real mode we cannot allocate memory for TCEs (we can in the virtual
> mode) but on the way out the code attempts to clear hardware TCEs using
> emulated TCE indexes which corrupts random kernel memory because
> it_offset=3D=3D1<<59 is subtracted from those indexes and the resulting i=
ndex
> is out of the TCE table bounds.
>=20
> This fixes kvmppc_clear_tce() to use the correct TCE indexes.
>=20
> While at it, this fixes TCE cache invalidation which uses emulated TCE
> indexes instead of the hardware ones. This went unnoticed as 64bit DMA
> is used these days and VMs map all RAM in one go and only then do DMA
> and this is when the TCE cache gets populated.
>=20
> Potentially this could slow down mapping, however normally 16MB
> emulated pages are backed by 64K hardware pages so it is one write to
> the "TCE Kill" per 256 updates which is not that bad considering the size
> of the cache (1024 TCEs or so).
>=20
> Fixes: ca1fc489cfa0 ("KVM: PPC: Book3S: Allow backing bigger guest IOMMU =
pages with smaller physical pages")
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

In addition, I have confirmations from both our QE team and a customer
that they can no longer reproduce the problem with this patch.  So,

Tested-by: David Gibson <david@gibson.dropbear.id.au>

If we can merge this ASAP, that would be great.

> ---
>  arch/powerpc/kvm/book3s_64_vio.c    | 45 +++++++++++++++--------------
>  arch/powerpc/kvm/book3s_64_vio_hv.c | 44 ++++++++++++++--------------
>  2 files changed, 45 insertions(+), 44 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_6=
4_vio.c
> index d42b4b6d4a79..85cfa6328222 100644
> --- a/arch/powerpc/kvm/book3s_64_vio.c
> +++ b/arch/powerpc/kvm/book3s_64_vio.c
> @@ -420,13 +420,19 @@ static void kvmppc_tce_put(struct kvmppc_spapr_tce_=
table *stt,
>  	tbl[idx % TCES_PER_PAGE] =3D tce;
>  }
> =20
> -static void kvmppc_clear_tce(struct mm_struct *mm, struct iommu_table *t=
bl,
> -		unsigned long entry)
> +static void kvmppc_clear_tce(struct mm_struct *mm, struct kvmppc_spapr_t=
ce_table *stt,
> +		struct iommu_table *tbl, unsigned long entry)
>  {
> -	unsigned long hpa =3D 0;
> -	enum dma_data_direction dir =3D DMA_NONE;
> +	unsigned long i;
> +	unsigned long subpages =3D 1ULL << (stt->page_shift - tbl->it_page_shif=
t);
> +	unsigned long io_entry =3D entry << (stt->page_shift - tbl->it_page_shi=
ft);
> =20
> -	iommu_tce_xchg_no_kill(mm, tbl, entry, &hpa, &dir);
> +	for (i =3D 0; i < subpages; ++i) {
> +		unsigned long hpa =3D 0;
> +		enum dma_data_direction dir =3D DMA_NONE;
> +
> +		iommu_tce_xchg_no_kill(mm, tbl, io_entry + i, &hpa, &dir);
> +	}
>  }
> =20
>  static long kvmppc_tce_iommu_mapped_dec(struct kvm *kvm,
> @@ -485,6 +491,8 @@ static long kvmppc_tce_iommu_unmap(struct kvm *kvm,
>  			break;
>  	}
> =20
> +	iommu_tce_kill(tbl, io_entry, subpages);
> +
>  	return ret;
>  }
> =20
> @@ -544,6 +552,8 @@ static long kvmppc_tce_iommu_map(struct kvm *kvm,
>  			break;
>  	}
> =20
> +	iommu_tce_kill(tbl, io_entry, subpages);
> +
>  	return ret;
>  }
> =20
> @@ -590,10 +600,9 @@ long kvmppc_h_put_tce(struct kvm_vcpu *vcpu, unsigne=
d long liobn,
>  			ret =3D kvmppc_tce_iommu_map(vcpu->kvm, stt, stit->tbl,
>  					entry, ua, dir);
> =20
> -		iommu_tce_kill(stit->tbl, entry, 1);
> =20
>  		if (ret !=3D H_SUCCESS) {
> -			kvmppc_clear_tce(vcpu->kvm->mm, stit->tbl, entry);
> +			kvmppc_clear_tce(vcpu->kvm->mm, stt, stit->tbl, entry);
>  			goto unlock_exit;
>  		}
>  	}
> @@ -669,13 +678,13 @@ long kvmppc_h_put_tce_indirect(struct kvm_vcpu *vcp=
u,
>  		 */
>  		if (get_user(tce, tces + i)) {
>  			ret =3D H_TOO_HARD;
> -			goto invalidate_exit;
> +			goto unlock_exit;
>  		}
>  		tce =3D be64_to_cpu(tce);
> =20
>  		if (kvmppc_tce_to_ua(vcpu->kvm, tce, &ua)) {
>  			ret =3D H_PARAMETER;
> -			goto invalidate_exit;
> +			goto unlock_exit;
>  		}
> =20
>  		list_for_each_entry_lockless(stit, &stt->iommu_tables, next) {
> @@ -684,19 +693,15 @@ long kvmppc_h_put_tce_indirect(struct kvm_vcpu *vcp=
u,
>  					iommu_tce_direction(tce));
> =20
>  			if (ret !=3D H_SUCCESS) {
> -				kvmppc_clear_tce(vcpu->kvm->mm, stit->tbl,
> -						entry);
> -				goto invalidate_exit;
> +				kvmppc_clear_tce(vcpu->kvm->mm, stt, stit->tbl,
> +						 entry + i);
> +				goto unlock_exit;
>  			}
>  		}
> =20
>  		kvmppc_tce_put(stt, entry + i, tce);
>  	}
> =20
> -invalidate_exit:
> -	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
> -		iommu_tce_kill(stit->tbl, entry, npages);
> -
>  unlock_exit:
>  	srcu_read_unlock(&vcpu->kvm->srcu, idx);
> =20
> @@ -735,20 +740,16 @@ long kvmppc_h_stuff_tce(struct kvm_vcpu *vcpu,
>  				continue;
> =20
>  			if (ret =3D=3D H_TOO_HARD)
> -				goto invalidate_exit;
> +				return ret;
> =20
>  			WARN_ON_ONCE(1);
> -			kvmppc_clear_tce(vcpu->kvm->mm, stit->tbl, entry);
> +			kvmppc_clear_tce(vcpu->kvm->mm, stt, stit->tbl, entry + i);
>  		}
>  	}
> =20
>  	for (i =3D 0; i < npages; ++i, ioba +=3D (1ULL << stt->page_shift))
>  		kvmppc_tce_put(stt, ioba >> stt->page_shift, tce_value);
> =20
> -invalidate_exit:
> -	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
> -		iommu_tce_kill(stit->tbl, ioba >> stt->page_shift, npages);
> -
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(kvmppc_h_stuff_tce);
> diff --git a/arch/powerpc/kvm/book3s_64_vio_hv.c b/arch/powerpc/kvm/book3=
s_64_vio_hv.c
> index 870b7f0c7ea5..fdeda6a9cff4 100644
> --- a/arch/powerpc/kvm/book3s_64_vio_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_vio_hv.c
> @@ -247,13 +247,19 @@ static void iommu_tce_kill_rm(struct iommu_table *t=
bl,
>  		tbl->it_ops->tce_kill(tbl, entry, pages, true);
>  }
> =20
> -static void kvmppc_rm_clear_tce(struct kvm *kvm, struct iommu_table *tbl,
> -		unsigned long entry)
> +static void kvmppc_rm_clear_tce(struct kvm *kvm, struct kvmppc_spapr_tce=
_table *stt,
> +		struct iommu_table *tbl, unsigned long entry)
>  {
> -	unsigned long hpa =3D 0;
> -	enum dma_data_direction dir =3D DMA_NONE;
> +	unsigned long i;
> +	unsigned long subpages =3D 1ULL << (stt->page_shift - tbl->it_page_shif=
t);
> +	unsigned long io_entry =3D entry << (stt->page_shift - tbl->it_page_shi=
ft);
> =20
> -	iommu_tce_xchg_no_kill_rm(kvm->mm, tbl, entry, &hpa, &dir);
> +	for (i =3D 0; i < subpages; ++i) {
> +		unsigned long hpa =3D 0;
> +		enum dma_data_direction dir =3D DMA_NONE;
> +
> +		iommu_tce_xchg_no_kill_rm(kvm->mm, tbl, io_entry + i, &hpa, &dir);
> +	}
>  }
> =20
>  static long kvmppc_rm_tce_iommu_mapped_dec(struct kvm *kvm,
> @@ -316,6 +322,8 @@ static long kvmppc_rm_tce_iommu_unmap(struct kvm *kvm,
>  			break;
>  	}
> =20
> +	iommu_tce_kill_rm(tbl, io_entry, subpages);
> +
>  	return ret;
>  }
> =20
> @@ -379,6 +387,8 @@ static long kvmppc_rm_tce_iommu_map(struct kvm *kvm,
>  			break;
>  	}
> =20
> +	iommu_tce_kill_rm(tbl, io_entry, subpages);
> +
>  	return ret;
>  }
> =20
> @@ -420,10 +430,8 @@ long kvmppc_rm_h_put_tce(struct kvm_vcpu *vcpu, unsi=
gned long liobn,
>  			ret =3D kvmppc_rm_tce_iommu_map(vcpu->kvm, stt,
>  					stit->tbl, entry, ua, dir);
> =20
> -		iommu_tce_kill_rm(stit->tbl, entry, 1);
> -
>  		if (ret !=3D H_SUCCESS) {
> -			kvmppc_rm_clear_tce(vcpu->kvm, stit->tbl, entry);
> +			kvmppc_rm_clear_tce(vcpu->kvm, stt, stit->tbl, entry);
>  			return ret;
>  		}
>  	}
> @@ -561,7 +569,7 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vc=
pu,
>  		ua =3D 0;
>  		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce, &ua)) {
>  			ret =3D H_PARAMETER;
> -			goto invalidate_exit;
> +			goto unlock_exit;
>  		}
> =20
>  		list_for_each_entry_lockless(stit, &stt->iommu_tables, next) {
> @@ -570,19 +578,15 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *=
vcpu,
>  					iommu_tce_direction(tce));
> =20
>  			if (ret !=3D H_SUCCESS) {
> -				kvmppc_rm_clear_tce(vcpu->kvm, stit->tbl,
> -						entry);
> -				goto invalidate_exit;
> +				kvmppc_rm_clear_tce(vcpu->kvm, stt, stit->tbl,
> +						entry + i);
> +				goto unlock_exit;
>  			}
>  		}
> =20
>  		kvmppc_rm_tce_put(stt, entry + i, tce);
>  	}
> =20
> -invalidate_exit:
> -	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
> -		iommu_tce_kill_rm(stit->tbl, entry, npages);
> -
>  unlock_exit:
>  	if (!prereg)
>  		arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
> @@ -620,20 +624,16 @@ long kvmppc_rm_h_stuff_tce(struct kvm_vcpu *vcpu,
>  				continue;
> =20
>  			if (ret =3D=3D H_TOO_HARD)
> -				goto invalidate_exit;
> +				return ret;
> =20
>  			WARN_ON_ONCE_RM(1);
> -			kvmppc_rm_clear_tce(vcpu->kvm, stit->tbl, entry);
> +			kvmppc_rm_clear_tce(vcpu->kvm, stt, stit->tbl, entry + i);
>  		}
>  	}
> =20
>  	for (i =3D 0; i < npages; ++i, ioba +=3D (1ULL << stt->page_shift))
>  		kvmppc_rm_tce_put(stt, ioba >> stt->page_shift, tce_value);
> =20
> -invalidate_exit:
> -	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
> -		iommu_tce_kill_rm(stit->tbl, ioba >> stt->page_shift, npages);
> -
>  	return ret;
>  }
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--GK8C8w0gKbIl6lLW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEoULxWu4/Ws0dB+XtgypY4gEwYSIFAmJXoHIACgkQgypY4gEw
YSLS5xAAiqtRjKSR7GarA6lgAbcbA4fUZQZaeHI8kkI6CnTmVteHmYsxC7uIdBaz
YJ1CXUlwIjxpdeYzZMbwuwyBoKCDIkh+H1mOlolzqKd/MpG4wb+tSdrIF7gZ0GNR
wU/GjSILtOpUPc8Es99oU+pEooipKb5j6XflWAZ0UtS3re4Jrh6OD3ZtmBYjzBLf
/OWQ6qBu3u1ZadmxMYCHVIK2vW+R/mao9FeFf6TNAkeQcYHVX6FAx3hIEeqC0224
JV41eDXBigZ03bP2//jd0od+Dj4lGlGshGNkMZIB2kvIKU0hssFp16UXjV5VnszQ
MnGiACllrDmkk2h8I+mcr4bn0jx0LgPeSNDLR9rFwCjB+JfgExS8tqI9CYXn+bW8
5lx1mVt4rPhT6NoUrk3sAun0MRx7ed3TfyEG6j+3ziATzwIM9nKKwB4iTvKnJ23y
MSqcvp4Lhzw+pkL44ZSyYjJmM9hXWAs0HRhRoqN5M5IFxT1QY+1fAhrQtf7SRYHC
l/08oXabqZFyobsFy4uLwf+mkl6dLln0GcA5B+Mi/VwKUBLcEQrV9iJzLX9hCpxe
V5S+NdtBBQYdwQ8OVdhjdv8yGIBaRvByoge+gfgvZqyxy5M77crjLVg1YcizA1L9
37UmeQCulKGQt+LCLSKruoZkJBsp2F0JP599Xu7ZOiL50WI3520=
=WDJ8
-----END PGP SIGNATURE-----

--GK8C8w0gKbIl6lLW--
