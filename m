Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90783945901
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 09:37:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lists.ozlabs.org;
	s=201707; t=1722584245;
	bh=Xzh64qwaa45Hvg89XOCE6AV0anqJ3OLRAHsZ6IZXMqM=;
	h=Subject:To:References:Date:In-Reply-To:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=aCS+E0Frka7M0Pkdo7Ol7XtLY2LcBJDC/enxRRbrgq67wNXBXUmc1C5+w4qLXtgjG
	 citVaND8uxdZ8V3P91VzJekYpQKpZxSyzZUUHK5VTylzxh8W00G11ynodWA5hUyKjh
	 JIttUW/1W77VaUz8OdXjMuD2eQ8zQo0eGodm6iIsDBV1JojkmFsorj8sBEfmkwquKD
	 fiVrw2GJCCL6Ato+N0uRAsD4ds2kuo5rF/IEwldYWsIXkerUzw/vGt+E8qoDvy+1QG
	 t4YdIO+1w5vS7+JIFTP1JApMJVk1i1o7c9sAzVOrWOHURR0uS1QRu9685IM1kY0Ob/
	 bohplmFpEkvgA==
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZyN53tc4z3dVR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 17:37:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=maobibo@loongson.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 119 seconds by postgrey-1.37 at boromir; Fri, 02 Aug 2024 17:36:47 AEST
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZyMM2wrBz3c9c
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 17:36:47 +1000 (AEST)
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxSuoQjKxmA1oGAA--.22230S3;
	Fri, 02 Aug 2024 15:34:40 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMCxbuUPjKxm0GILAA--.55848S3;
	Fri, 02 Aug 2024 15:34:39 +0800 (CST)
Subject: Re: [PATCH v12 65/84] KVM: LoongArch: Mark "struct page" pfns
 accessed only in "slow" page fault path
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-66-seanjc@google.com>
Message-ID: <d5405245-edd3-9bc5-0c40-282a30e46fae@loongson.cn>
Date: Fri, 2 Aug 2024 15:34:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20240726235234.228822-66-seanjc@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMCxbuUPjKxm0GILAA--.55848S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WFWUJw1rKF47AFWUZFWfCrX_yoW8ZF1xpF
	ZxCwsrtr4rtrn093srta4qvF17Gw4DKr1xX3W2q34FkFnIqw1Y93W8W397WFyUJ392ya1S
	vF1rt3WUWan0vacCm3ZEXasCq-sJn29KB7ZKAUJUUUUP529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vI
	r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUShiSDU
	UUU
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
From: maobibo via Linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Reply-To: maobibo <maobibo@loongson.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2024/7/27 上午7:52, Sean Christopherson wrote:
> Mark pages accessed only in the slow path, before dropping mmu_lock when
> faulting in guest memory so that LoongArch can convert to
> kvm_release_faultin_page() without tripping its lockdep assertion on
> mmu_lock being held.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/loongarch/kvm/mmu.c | 20 ++------------------
>   1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> index 364dd35e0557..52b5c16cf250 100644
> --- a/arch/loongarch/kvm/mmu.c
> +++ b/arch/loongarch/kvm/mmu.c
> @@ -552,12 +552,10 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>   static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
>   {
>   	int ret = 0;
> -	kvm_pfn_t pfn = 0;
>   	kvm_pte_t *ptep, changed, new;
>   	gfn_t gfn = gpa >> PAGE_SHIFT;
>   	struct kvm *kvm = vcpu->kvm;
>   	struct kvm_memory_slot *slot;
> -	struct page *page;
>   
>   	spin_lock(&kvm->mmu_lock);
>   
> @@ -570,8 +568,6 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
>   
>   	/* Track access to pages marked old */
>   	new = kvm_pte_mkyoung(*ptep);
> -	/* call kvm_set_pfn_accessed() after unlock */
> -
>   	if (write && !kvm_pte_dirty(new)) {
>   		if (!kvm_pte_write(new)) {
>   			ret = -EFAULT;
> @@ -595,23 +591,11 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
>   	}
>   
>   	changed = new ^ (*ptep);
> -	if (changed) {
> +	if (changed)
>   		kvm_set_pte(ptep, new);
> -		pfn = kvm_pte_pfn(new);
> -		page = kvm_pfn_to_refcounted_page(pfn);
> -		if (page)
> -			get_page(page);
> -	}
> +
>   	spin_unlock(&kvm->mmu_lock);
>   
> -	if (changed) {
> -		if (kvm_pte_young(changed))
> -			kvm_set_pfn_accessed(pfn);
> -
> -		if (page)
> -			put_page(page);
> -	}
> -
>   	if (kvm_pte_dirty(changed))
>   		mark_page_dirty(kvm, gfn);
>   
> 
Reviewed-by: Bibo Mao <maobibo@loongson.cn>

