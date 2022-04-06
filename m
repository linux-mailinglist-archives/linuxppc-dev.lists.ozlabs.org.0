Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D534F5E61
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 14:50:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYPWQ35WDz3bcZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 22:50:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qfZALite;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qfZALite; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYPVf3lv6z2yS3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 22:50:01 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 236Bj71k022211; 
 Wed, 6 Apr 2022 12:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=f4IAqQiVHH8TYluvTBL6O+Ai/szmIFzwJZQt2AoQ5xY=;
 b=qfZALiteOSEJ7Gx26R21GK6+IaGG5C/QIwq/3QTvj1Y5PlteC3/ec8dPo8CHqMuEVtZa
 eur5CgqPNK9haeWBPtZd1TsCswJfRWxPboMVbVxO+LTi4NlSPcqWW6BWEBzc5MbOGhdY
 OghsejpTGw27Fd4Nb/i7Y00/+/5BA7drLpEwcIL65qD4LWyvT2N8QCVrL6Y9wTJwRZtb
 UlWS+Vwty3kxWXx3ebSAOHDlASDCwI6wt3KtTtk36O2uBbnPG/QV1OFeZ21hjil5j8n3
 52tw9a36SZjhdC7vkxIHUenaR7C0SmXEo+pSWcf8fG1j8hyczBFPW8D+L8hdqGXZuRXp PA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f96s7nqx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 12:49:53 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 236BtRKc014651;
 Wed, 6 Apr 2022 12:49:52 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f96s7nqwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 12:49:52 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 236ClIZP025929;
 Wed, 6 Apr 2022 12:49:50 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3f6drhqsq5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 12:49:50 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 236CnmRj35717582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Apr 2022 12:49:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67F3D11C04C;
 Wed,  6 Apr 2022 12:49:48 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19A0211C04A;
 Wed,  6 Apr 2022 12:49:48 +0000 (GMT)
Received: from [9.101.4.17] (unknown [9.101.4.17])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 Apr 2022 12:49:48 +0000 (GMT)
Message-ID: <0158864e-8d0b-c717-27f9-24fc0609d88b@linux.ibm.com>
Date: Wed, 6 Apr 2022 14:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH kernel] KVM: PPC: Fix TCE handling for VFIO
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20220406040416.3608518-1-aik@ozlabs.ru>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220406040416.3608518-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 14-mX4j4DTiSZhLn9k3kkgJr23G_n7HO
X-Proofpoint-ORIG-GUID: d3bOt1OrKk0mWySqJiWJc0KhUZ2tM8wO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_04,2022-04-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204060059
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/04/2022 06:04, Alexey Kardashevskiy wrote:
> At the moment the IOMMU page size in a pseries VM is 16MB (the biggest
> allowed by LoPAPR), this page size is used for an emulated TCE table.
> If there is a passed though PCI device, that there are hardware IOMMU
> tables with equal or smaller IOMMU page sizes so one emulated IOMMU pages
> is backed by power-of-two hardware pages.
> 
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
> it_offset==1<<59 is subtracted from those indexes and the resulting index
> is out of the TCE table bounds.
> 
> This fixes kvmppc_clear_tce() to use the correct TCE indexes.
> 
> While at it, this fixes TCE cache invalidation which uses emulated TCE
> indexes instead of the hardware ones. This went unnoticed as 64bit DMA
> is used these days and VMs map all RAM in one go and only then do DMA
> and this is when the TCE cache gets populated.
> 
> Potentially this could slow down mapping, however normally 16MB
> emulated pages are backed by 64K hardware pages so it is one write to
> the "TCE Kill" per 256 updates which is not that bad considering the size
> of the cache (1024 TCEs or so).
> 
> Fixes: ca1fc489cfa0 ("KVM: PPC: Book3S: Allow backing bigger guest IOMMU pages with smaller physical pages")
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---


FWIW:
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>



>   arch/powerpc/kvm/book3s_64_vio.c    | 45 +++++++++++++++--------------
>   arch/powerpc/kvm/book3s_64_vio_hv.c | 44 ++++++++++++++--------------
>   2 files changed, 45 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
> index d42b4b6d4a79..85cfa6328222 100644
> --- a/arch/powerpc/kvm/book3s_64_vio.c
> +++ b/arch/powerpc/kvm/book3s_64_vio.c
> @@ -420,13 +420,19 @@ static void kvmppc_tce_put(struct kvmppc_spapr_tce_table *stt,
>   	tbl[idx % TCES_PER_PAGE] = tce;
>   }
>   
> -static void kvmppc_clear_tce(struct mm_struct *mm, struct iommu_table *tbl,
> -		unsigned long entry)
> +static void kvmppc_clear_tce(struct mm_struct *mm, struct kvmppc_spapr_tce_table *stt,
> +		struct iommu_table *tbl, unsigned long entry)
>   {
> -	unsigned long hpa = 0;
> -	enum dma_data_direction dir = DMA_NONE;
> +	unsigned long i;
> +	unsigned long subpages = 1ULL << (stt->page_shift - tbl->it_page_shift);
> +	unsigned long io_entry = entry << (stt->page_shift - tbl->it_page_shift);
>   
> -	iommu_tce_xchg_no_kill(mm, tbl, entry, &hpa, &dir);
> +	for (i = 0; i < subpages; ++i) {
> +		unsigned long hpa = 0;
> +		enum dma_data_direction dir = DMA_NONE;
> +
> +		iommu_tce_xchg_no_kill(mm, tbl, io_entry + i, &hpa, &dir);
> +	}
>   }
>   
>   static long kvmppc_tce_iommu_mapped_dec(struct kvm *kvm,
> @@ -485,6 +491,8 @@ static long kvmppc_tce_iommu_unmap(struct kvm *kvm,
>   			break;
>   	}
>   
> +	iommu_tce_kill(tbl, io_entry, subpages);
> +
>   	return ret;
>   }
>   
> @@ -544,6 +552,8 @@ static long kvmppc_tce_iommu_map(struct kvm *kvm,
>   			break;
>   	}
>   
> +	iommu_tce_kill(tbl, io_entry, subpages);
> +
>   	return ret;
>   }
>   
> @@ -590,10 +600,9 @@ long kvmppc_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
>   			ret = kvmppc_tce_iommu_map(vcpu->kvm, stt, stit->tbl,
>   					entry, ua, dir);
>   
> -		iommu_tce_kill(stit->tbl, entry, 1);
>   
>   		if (ret != H_SUCCESS) {
> -			kvmppc_clear_tce(vcpu->kvm->mm, stit->tbl, entry);
> +			kvmppc_clear_tce(vcpu->kvm->mm, stt, stit->tbl, entry);
>   			goto unlock_exit;
>   		}
>   	}
> @@ -669,13 +678,13 @@ long kvmppc_h_put_tce_indirect(struct kvm_vcpu *vcpu,
>   		 */
>   		if (get_user(tce, tces + i)) {
>   			ret = H_TOO_HARD;
> -			goto invalidate_exit;
> +			goto unlock_exit;
>   		}
>   		tce = be64_to_cpu(tce);
>   
>   		if (kvmppc_tce_to_ua(vcpu->kvm, tce, &ua)) {
>   			ret = H_PARAMETER;
> -			goto invalidate_exit;
> +			goto unlock_exit;
>   		}
>   
>   		list_for_each_entry_lockless(stit, &stt->iommu_tables, next) {
> @@ -684,19 +693,15 @@ long kvmppc_h_put_tce_indirect(struct kvm_vcpu *vcpu,
>   					iommu_tce_direction(tce));
>   
>   			if (ret != H_SUCCESS) {
> -				kvmppc_clear_tce(vcpu->kvm->mm, stit->tbl,
> -						entry);
> -				goto invalidate_exit;
> +				kvmppc_clear_tce(vcpu->kvm->mm, stt, stit->tbl,
> +						 entry + i);
> +				goto unlock_exit;
>   			}
>   		}
>   
>   		kvmppc_tce_put(stt, entry + i, tce);
>   	}
>   
> -invalidate_exit:
> -	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
> -		iommu_tce_kill(stit->tbl, entry, npages);
> -
>   unlock_exit:
>   	srcu_read_unlock(&vcpu->kvm->srcu, idx);
>   
> @@ -735,20 +740,16 @@ long kvmppc_h_stuff_tce(struct kvm_vcpu *vcpu,
>   				continue;
>   
>   			if (ret == H_TOO_HARD)
> -				goto invalidate_exit;
> +				return ret;
>   
>   			WARN_ON_ONCE(1);
> -			kvmppc_clear_tce(vcpu->kvm->mm, stit->tbl, entry);
> +			kvmppc_clear_tce(vcpu->kvm->mm, stt, stit->tbl, entry + i);
>   		}
>   	}
>   
>   	for (i = 0; i < npages; ++i, ioba += (1ULL << stt->page_shift))
>   		kvmppc_tce_put(stt, ioba >> stt->page_shift, tce_value);
>   
> -invalidate_exit:
> -	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
> -		iommu_tce_kill(stit->tbl, ioba >> stt->page_shift, npages);
> -
>   	return ret;
>   }
>   EXPORT_SYMBOL_GPL(kvmppc_h_stuff_tce);
> diff --git a/arch/powerpc/kvm/book3s_64_vio_hv.c b/arch/powerpc/kvm/book3s_64_vio_hv.c
> index 870b7f0c7ea5..fdeda6a9cff4 100644
> --- a/arch/powerpc/kvm/book3s_64_vio_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_vio_hv.c
> @@ -247,13 +247,19 @@ static void iommu_tce_kill_rm(struct iommu_table *tbl,
>   		tbl->it_ops->tce_kill(tbl, entry, pages, true);
>   }
>   
> -static void kvmppc_rm_clear_tce(struct kvm *kvm, struct iommu_table *tbl,
> -		unsigned long entry)
> +static void kvmppc_rm_clear_tce(struct kvm *kvm, struct kvmppc_spapr_tce_table *stt,
> +		struct iommu_table *tbl, unsigned long entry)
>   {
> -	unsigned long hpa = 0;
> -	enum dma_data_direction dir = DMA_NONE;
> +	unsigned long i;
> +	unsigned long subpages = 1ULL << (stt->page_shift - tbl->it_page_shift);
> +	unsigned long io_entry = entry << (stt->page_shift - tbl->it_page_shift);
>   
> -	iommu_tce_xchg_no_kill_rm(kvm->mm, tbl, entry, &hpa, &dir);
> +	for (i = 0; i < subpages; ++i) {
> +		unsigned long hpa = 0;
> +		enum dma_data_direction dir = DMA_NONE;
> +
> +		iommu_tce_xchg_no_kill_rm(kvm->mm, tbl, io_entry + i, &hpa, &dir);
> +	}
>   }
>   
>   static long kvmppc_rm_tce_iommu_mapped_dec(struct kvm *kvm,
> @@ -316,6 +322,8 @@ static long kvmppc_rm_tce_iommu_unmap(struct kvm *kvm,
>   			break;
>   	}
>   
> +	iommu_tce_kill_rm(tbl, io_entry, subpages);
> +
>   	return ret;
>   }
>   
> @@ -379,6 +387,8 @@ static long kvmppc_rm_tce_iommu_map(struct kvm *kvm,
>   			break;
>   	}
>   
> +	iommu_tce_kill_rm(tbl, io_entry, subpages);
> +
>   	return ret;
>   }
>   
> @@ -420,10 +430,8 @@ long kvmppc_rm_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
>   			ret = kvmppc_rm_tce_iommu_map(vcpu->kvm, stt,
>   					stit->tbl, entry, ua, dir);
>   
> -		iommu_tce_kill_rm(stit->tbl, entry, 1);
> -
>   		if (ret != H_SUCCESS) {
> -			kvmppc_rm_clear_tce(vcpu->kvm, stit->tbl, entry);
> +			kvmppc_rm_clear_tce(vcpu->kvm, stt, stit->tbl, entry);
>   			return ret;
>   		}
>   	}
> @@ -561,7 +569,7 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
>   		ua = 0;
>   		if (kvmppc_rm_tce_to_ua(vcpu->kvm, tce, &ua)) {
>   			ret = H_PARAMETER;
> -			goto invalidate_exit;
> +			goto unlock_exit;
>   		}
>   
>   		list_for_each_entry_lockless(stit, &stt->iommu_tables, next) {
> @@ -570,19 +578,15 @@ long kvmppc_rm_h_put_tce_indirect(struct kvm_vcpu *vcpu,
>   					iommu_tce_direction(tce));
>   
>   			if (ret != H_SUCCESS) {
> -				kvmppc_rm_clear_tce(vcpu->kvm, stit->tbl,
> -						entry);
> -				goto invalidate_exit;
> +				kvmppc_rm_clear_tce(vcpu->kvm, stt, stit->tbl,
> +						entry + i);
> +				goto unlock_exit;
>   			}
>   		}
>   
>   		kvmppc_rm_tce_put(stt, entry + i, tce);
>   	}
>   
> -invalidate_exit:
> -	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
> -		iommu_tce_kill_rm(stit->tbl, entry, npages);
> -
>   unlock_exit:
>   	if (!prereg)
>   		arch_spin_unlock(&kvm->mmu_lock.rlock.raw_lock);
> @@ -620,20 +624,16 @@ long kvmppc_rm_h_stuff_tce(struct kvm_vcpu *vcpu,
>   				continue;
>   
>   			if (ret == H_TOO_HARD)
> -				goto invalidate_exit;
> +				return ret;
>   
>   			WARN_ON_ONCE_RM(1);
> -			kvmppc_rm_clear_tce(vcpu->kvm, stit->tbl, entry);
> +			kvmppc_rm_clear_tce(vcpu->kvm, stt, stit->tbl, entry + i);
>   		}
>   	}
>   
>   	for (i = 0; i < npages; ++i, ioba += (1ULL << stt->page_shift))
>   		kvmppc_rm_tce_put(stt, ioba >> stt->page_shift, tce_value);
>   
> -invalidate_exit:
> -	list_for_each_entry_lockless(stit, &stt->iommu_tables, next)
> -		iommu_tce_kill_rm(stit->tbl, ioba >> stt->page_shift, npages);
> -
>   	return ret;
>   }
>   
