Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFFE3B3DDB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 09:45:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GB8Ds4Fhrz3c2m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 17:45:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Nmb11u4f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=de.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=borntraeger@de.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Nmb11u4f; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GB8DD6bq4z2xZ2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 17:44:59 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15P7YTqX061945; Fri, 25 Jun 2021 03:44:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1RqvYvHqS+g8GAhL7EUAfBHKQHRxaUMGXuw/IwCXA00=;
 b=Nmb11u4f/JhMKk+ivMs7oA1Ku85DovZ4LdaLOgwfNrDLH0a/wz5mI0aLrLO3Altwv4N4
 LMTZyz/WDveZjxrU5tD5PPo68pDirAd4Gfrex52xiqR0TujC5LdTRYi0ri1ge/eDHmSN
 JQJ8rK/jOMjr3THp/ok9RkvIdn/4KtjecaWiJfeTOER6nglHE+EZicixc1c1BnhsB+1Y
 g5DWwvan20xvxygDIi3MEZQ7H/GwZDVcHzVEGz2iIjsiJgKnoZ7U+TUpyPDhD5O2Zekw
 xJiAEI7Z0lyxcZgGi3MCDrgB0acHr+cDdUAyjJoQ4I+2kOZz0Z9ex/2nv4xilwCqOw4H ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39d8cn51sy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jun 2021 03:44:39 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15P7YRo0061765;
 Fri, 25 Jun 2021 03:44:38 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39d8cn51s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jun 2021 03:44:38 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15P7g5SF017198;
 Fri, 25 Jun 2021 07:44:36 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3997uhaw6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jun 2021 07:44:35 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15P7h6UA14352728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Jun 2021 07:43:06 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6193DAE056;
 Fri, 25 Jun 2021 07:44:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D274AE051;
 Fri, 25 Jun 2021 07:44:31 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.31.44])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 25 Jun 2021 07:44:31 +0000 (GMT)
Subject: Re: [PATCH 0/6] KVM: Remove uses of struct page from x86 and arm64 MMU
To: Nicholas Piggin <npiggin@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Paul Mackerras <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Stevens <stevensd@chromium.org>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <1624530624.8jff1f4u11.astroid@bobo.none>
 <1624534759.nj0ylor2eh.astroid@bobo.none>
 <0d3a699a-15eb-9f1b-0735-79d14736f38c@redhat.com>
 <1624539354.6zggpdrdbw.astroid@bobo.none>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <19c4e392-fbab-ee2c-7039-c88d1ae5775d@de.ibm.com>
Date: Fri, 25 Jun 2021 09:44:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1624539354.6zggpdrdbw.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Xd2p2n2e6jxdPlNvwSbyIgmg3LPAQMfs
X-Proofpoint-ORIG-GUID: 6q0X_bUItmYJaGkAxPmmRfj9zzu6NsL2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-25_02:2021-06-24,
 2021-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106250043
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Stevens <stevensd@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, intel-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvmarm@lists.cs.columbia.edu,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Morse <james.morse@arm.com>, kvm-ppc@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linux-mips@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 24.06.21 14:57, Nicholas Piggin wrote:
> Excerpts from Paolo Bonzini's message of June 24, 2021 10:41 pm:
>> On 24/06/21 13:42, Nicholas Piggin wrote:
>>> Excerpts from Nicholas Piggin's message of June 24, 2021 8:34 pm:
>>>> Excerpts from David Stevens's message of June 24, 2021 1:57 pm:
>>>>> KVM supports mapping VM_IO and VM_PFNMAP memory into the guest by using
>>>>> follow_pte in gfn_to_pfn. However, the resolved pfns may not have
>>>>> assoicated struct pages, so they should not be passed to pfn_to_page.
>>>>> This series removes such calls from the x86 and arm64 secondary MMU. To
>>>>> do this, this series modifies gfn_to_pfn to return a struct page in
>>>>> addition to a pfn, if the hva was resolved by gup. This allows the
>>>>> caller to call put_page only when necessated by gup.
>>>>>
>>>>> This series provides a helper function that unwraps the new return type
>>>>> of gfn_to_pfn to provide behavior identical to the old behavior. As I
>>>>> have no hardware to test powerpc/mips changes, the function is used
>>>>> there for minimally invasive changes. Additionally, as gfn_to_page and
>>>>> gfn_to_pfn_cache are not integrated with mmu notifier, they cannot be
>>>>> easily changed over to only use pfns.
>>>>>
>>>>> This addresses CVE-2021-22543 on x86 and arm64.
>>>>
>>>> Does this fix the problem? (untested I don't have a POC setup at hand,
>>>> but at least in concept)
>>>
>>> This one actually compiles at least. Unfortunately I don't have much
>>> time in the near future to test, and I only just found out about this
>>> CVE a few hours ago.
>>
>> And it also works (the reproducer gets an infinite stream of userspace
>> exits and especially does not crash).  We can still go for David's
>> solution later since MMU notifiers are able to deal with this pages, but
>> it's a very nice patch for stable kernels.
> 
> Oh nice, thanks for testing. How's this?
> 
> Thanks,
> Nick
> 
> ---
> 
> KVM: Fix page ref underflow for regions with valid but non-refcounted pages
> 
> It's possible to create a region which maps valid but non-refcounted
> pages (e.g., tail pages of non-compound higher order allocations). These
> host pages can then be returned by gfn_to_page, gfn_to_pfn, etc., family
> of APIs, which take a reference to the page, which takes it from 0 to 1.
> When the reference is dropped, this will free the page incorrectly.
> 
> Fix this by only taking a reference on the page if it was non-zero,
> which indicates it is participating in normal refcounting (and can be
> released with put_page).
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   virt/kvm/kvm_main.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 6a6bc7af0e28..46fb042837d2 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2055,6 +2055,13 @@ static bool vma_is_valid(struct vm_area_struct *vma, bool write_fault)
>   	return true;
>   }
>   
> +static int kvm_try_get_pfn(kvm_pfn_t pfn)
> +{
> +	if (kvm_is_reserved_pfn(pfn))
> +		return 1;
> +	return get_page_unless_zero(pfn_to_page(pfn));
> +}
> +
>   static int hva_to_pfn_remapped(struct vm_area_struct *vma,
>   			       unsigned long addr, bool *async,
>   			       bool write_fault, bool *writable,
> @@ -2104,13 +2111,21 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
>   	 * Whoever called remap_pfn_range is also going to call e.g.
>   	 * unmap_mapping_range before the underlying pages are freed,
>   	 * causing a call to our MMU notifier.
> +	 *
> +	 * Certain IO or PFNMAP mappings can be backed with valid
> +	 * struct pages, but be allocated without refcounting e.g.,
> +	 * tail pages of non-compound higher order allocations, which
> +	 * would then underflow the refcount when the caller does the
> +	 * required put_page. Don't allow those pages here.
>   	 */
> -	kvm_get_pfn(pfn);
> +	if (!kvm_try_get_pfn(pfn))
> +		r = -EFAULT;
>   

Right. That should also take care of s390 (pin_guest_page in vsie.c
which calls gfn_to_page).
FWIW, the current API is really hard to follow as it does not tell
which functions take a reference and which dont.

Anyway, this patch (with cc stable?)

Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>

>   out:
>   	pte_unmap_unlock(ptep, ptl);
>   	*p_pfn = pfn;
> -	return 0;
> +
> +	return r;
>   }
>   
>   /*
> 
