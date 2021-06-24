Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9278A3B2CB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 12:44:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9cFN2Yysz3bsv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 20:44:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Uzc43caE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Uzc43caE; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9cDp4Ylxz3bxC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 20:43:38 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so5643288pjs.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 03:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Ntmvbr4Rsn/lopxAADIIDgcNErNmU/zbadQcByBiYK4=;
 b=Uzc43caEhY2Ti31+lpHHW0AZ5sLCVj6W+n4t/ez5IgVzQkVZOibK2DIWQ0+CAuzt9U
 PpuIA4kDsyK3chDvHhxE+YawXhAPb2eWGecCvYilJeif5bW1AWaPBDm7W4vYjxTYq4eX
 vsAbVyUYfQJDK46zRrnjfoRU3RdSuUfndWfij+20vPjPzE9a8Ky+gzwBiWuGHYujrH97
 b1g8G9j+MqQ6oKRgvSqRRvZdf9oww+7IytooiBQtjKLAdCQfMAXpO/dc/FMWyHkr12JS
 ZqabhMCopqc94H8G+WPpptqvIqeO4Wfi2qlPKFQXomh5RWpLJ4WGRgIbJ4SL7OebaZ9b
 Cu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Ntmvbr4Rsn/lopxAADIIDgcNErNmU/zbadQcByBiYK4=;
 b=gz1gD7aOFa4JUJg6Tib2abMCvSScQusQ5yP5XWpHzEDeAB6yBK7LY9qO7RmxP77Tgb
 wIN/UALzmBVErb17u571fJEexknf2Yihintl0S7MPmUXeXyx5JtnNAsUR2bR5E0So5bp
 bpqRvdwKkXK6C552wcP94i3/33Ejm76UwuxUtIsnyMXjiEm67yLgL7kKKKqDHrHb20tX
 Aj13kpgWDER+gpSPhDn2FXX1+mu0cMlfsbHHddaR5HeGaIykh8HZ0aQsxRAC7o4kCJhH
 FAeGYeiHspZ/XCf3eT5BFu6HfNDFe5l659LcPcNeHwi/qkUIA8VQNV+JbXqoZuPmjxDJ
 ujPA==
X-Gm-Message-State: AOAM530M+F13et43AmdsVlTNTc9xSSNHRxkPWrzjbFD1pA6WcbX2Ij4z
 WdxVs58F/P9jnwKLUcJYrI4=
X-Google-Smtp-Source: ABdhPJwSbcPeLeFEknq5SPs1K9/7wAZ9//Y8XUJsBm0HOgxDXNJ+d8W1kIX2/TWCimMS0wf9W28w6Q==
X-Received: by 2002:a17:90a:ce87:: with SMTP id
 g7mr14492750pju.189.1624531415692; 
 Thu, 24 Jun 2021 03:43:35 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id n12sm2540624pfu.5.2021.06.24.03.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 03:43:35 -0700 (PDT)
Date: Thu, 24 Jun 2021 20:43:29 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/6] KVM: x86/mmu: avoid struct page in MMU
To: Marc Zyngier <maz@kernel.org>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-4-stevensd@google.com>
 <1624524744.2sr7o7ix86.astroid@bobo.none> <87mtrfinks.wl-maz@kernel.org>
In-Reply-To: <87mtrfinks.wl-maz@kernel.org>
MIME-Version: 1.0
Message-Id: <1624531381.4bht02wxsj.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Will Deacon <will@kernel.org>, kvmarm@lists.cs.columbia.edu,
 intel-gvt-dev@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 intel-gfx@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Zhenyu Wang <zhenyuw@linux.intel.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, David Stevens <stevensd@chromium.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Marc Zyngier's message of June 24, 2021 8:06 pm:
> On Thu, 24 Jun 2021 09:58:00 +0100,
> Nicholas Piggin <npiggin@gmail.com> wrote:
>>=20
>> Excerpts from David Stevens's message of June 24, 2021 1:57 pm:
>> > From: David Stevens <stevensd@chromium.org>
>> >  out_unlock:
>> >  	if (is_tdp_mmu_root(vcpu->kvm, vcpu->arch.mmu->root_hpa))
>> >  		read_unlock(&vcpu->kvm->mmu_lock);
>> >  	else
>> >  		write_unlock(&vcpu->kvm->mmu_lock);
>> > -	kvm_release_pfn_clean(pfn);
>> > +	if (pfnpg.page)
>> > +		put_page(pfnpg.page);
>> >  	return r;
>> >  }
>>=20
>> How about
>>=20
>>   kvm_release_pfn_page_clean(pfnpg);
>=20
> I'm not sure. I always found kvm_release_pfn_clean() ugly, because it
> doesn't mark the page 'clean'. I find put_page() more correct.
>=20
> Something like 'kvm_put_pfn_page()' would make more sense, but I'm so
> bad at naming things that I could just as well call it 'bob()'.

That seems like a fine name to me. A little better than bob.

Thanks,
Nick
