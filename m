Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F318746F33C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 19:35:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J92lv5zQmz3cNV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 05:35:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=c3ECy+yx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530;
 helo=mail-ed1-x530.google.com; envelope-from=paolo.bonzini@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=c3ECy+yx; dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J92l11mFxz3cNT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 05:34:53 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id t5so22100045edd.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 10:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+zI/uY0HbhRQxbU0uDHdKiysuc/BimXIFXVd1mgbhUs=;
 b=c3ECy+yxCV+HPacayaTpJOgHPIHwef7ZJNvYQDpgYKf18CpWjfUTkVnWfQqn++/o10
 Fp3Xr36EmfHMBSPk84IPd5g4Yhe/gP5KzzIrO4F3p/AkP2/qm7MeQNy8eyZNAuLL5h/P
 fJOWgXvFlGIzamG9sRPW0HwPhw7FfV4qYg/m4VTx5oE8rSaKk16KDX0fWUkgcqKre3A2
 MmQshaP3JXfmbO4cXh5eNC1IEkpEJlGUeBn7FF9dRJKU/FVOwnzUIlt1sUli0icW5LsR
 3Vbgd+KFeP+zI91Omkntwb3DYSkKK7IBWJYW2omwyqo0LZhG74wb+VUPnNC36+FfsfG0
 tS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+zI/uY0HbhRQxbU0uDHdKiysuc/BimXIFXVd1mgbhUs=;
 b=s2weRzlhm9e0Zc4GSZA53xkT9ZuBlQLjXEqVV1+K+RBrziCpkL3+Ty7B0jfXcJBBd7
 gdzUJ567LytulVP0w6UyNXkt7TlA6Nq4u3XWikqvnIZKXwTzzburaRhjsYIocX90RgH6
 DbXX4Tqn5GW1LwNugduVtrcJUlNfGTVohr1l+/vMBgkY74T4ddwnhVU7GRVxOJvG6awq
 55ABgkLHeROn6oL2Nf8BKuzyXt9N5NP0Pw1qMVN4xdvAzXjXrOYSNAsSDGdwTwIMpJKr
 5oQdGQB58llU1BDjvVdTb5RrXPdZDmIIovFqTTH0aa/mdbpnQZiECebgNX2Q5FIpJPwI
 kemA==
X-Gm-Message-State: AOAM532GkiOqko8bvj5fdMvWcln+cD0ObsBSDFXWddDVCu58JF7kK+fi
 h3lRWoJmfszeQaURz9VGdbI=
X-Google-Smtp-Source: ABdhPJyzZnV4yIOIpx1yw9gOS9Nnuyioy0GPnW+twuf6B+q2BDrnhU8giByTdwbtnr3yemfopJ87vw==
X-Received: by 2002:a17:906:938f:: with SMTP id
 l15mr17905624ejx.302.1639074889734; 
 Thu, 09 Dec 2021 10:34:49 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id k16sm260233edq.77.2021.12.09.10.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 10:34:49 -0800 (PST)
Message-ID: <2617aea0-af09-5c0d-1fd7-65e2a814b516@redhat.com>
Date: Thu, 9 Dec 2021 19:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 00/12] KVM: x86/xen: Add in-kernel Xen event channel
 delivery
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, kvm <kvm@vger.kernel.org>
References: <20211121125451.9489-1-dwmw2@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211121125451.9489-1-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 butt3rflyh4ck <butterflyhuangxx@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "seanjc @ google . com" <seanjc@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, "vkuznets @ redhat . com" <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/21/21 13:54, David Woodhouse wrote:
> Introduce the basic concept of 2 level event channels for kernel delivery,
> which is just a simple matter of a few test_and_set_bit calls on a mapped
> shared info page.
> 
> This can be used for routing MSI of passthrough devices to PIRQ event
> channels in a Xen guest, and we can build on it for delivering IPIs and
> timers directly from the kernel too.
> 
> v1: Use kvm_map_gfn() although I didn't quite see how it works.
> 
> v2: Avoid kvm_map_gfn() and implement a safe mapping with invalidation
>      support for myself.
> 
> v3: Reinvent gfn_to_pfn_cache with sane invalidation semantics, for my
>      use case as well as nesting.
> 
> v4: Rework dirty handling, as it became apparently that we need an active
>      vCPU context to mark pages dirty so it can't be done from the MMU
>      notifier duing the invalidation; it has to happen on unmap.
> 
> v5: Fix sparse warnings reported by kernel test robot<lkp@intel.com>.
> 
>      Fix revalidation when memslots change but the resulting HVA stays
>      the same. We can use the same kernel mapping in that case, if the
>      HVA → PFN translation was valid before. So that probably means we
>      shouldn't unmap the "old_hva". Augment the test case to exercise
>      that one too.
> 
>      Include the fix for the dirty ring vs. Xen shinfo oops reported
>      by butt3rflyh4ck<butterflyhuangxx@gmail.com>.
> 
> 
> As in the previous two rounds, the last patch (this time patch 12) is
> included as illustration of how we*might*  use this for fixing the UAF
> bugs in nesting, but isn't intended to be applied as-is. Patches 1-11 are.

Queued 1-7, will be on kvm/next tomorrow though.

Paolo
