Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A2A45398E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 19:44:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Htw2w1Cd5z2yw9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 05:44:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=NfWEHKgp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=NfWEHKgp; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Htw2B6n5yz2xT9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 05:44:00 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id t21so18199519plr.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 10:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=GcGOJgSWz7oEIbfl5QNUvPpuAyaNetXEQN0oWs9ap2w=;
 b=NfWEHKgpp9hvAVj4IrdvyWcutj+oRm5oA4DhrzE5j01yRw6SEr+OqI8zdgqPehlHuc
 lvLy/whsET41Ju6UmVvOInCo7Ww6t6yLH5qUrncwy6VAmxauCnt99O3r1yirLCVccCfN
 0Gay6uTBhe2zfp68q3FXHdSVfO1Z/lBlR6uw3b9mZM9XbPEBfKBoCa/a9sEvB1P9oZqk
 5YTcHvsnOOA5rsa3JP9041e/6BOvKA/Xr3X/sbaLIuC63lGrovFZ7b1eudI5InxTZkUr
 CdOzfVuUVUCDHbMPcWrZAb1YNJexcHENRayQEJiryVfwYQQPdJtpV9LDoK9LoF2MR12X
 8enQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GcGOJgSWz7oEIbfl5QNUvPpuAyaNetXEQN0oWs9ap2w=;
 b=v50IbyINhE676Bxe5dVs/HaY16RzhAKl6b9YOQBEoKeQ0u9ACpkcDzgvIhJV1xz1gK
 +KTb39mi+ouDzLU1iYCisnQjC/ep2ba8qxlJirczBDQX8DdLUWkbUE06NUFAnd7tVAjx
 a6t/HfTSegCIpLgs33xgISeerwGFanOGPcHV2BEdp6jkJmw5lymGWxHKz02V7PT5urug
 GXV7ecicHKOeWd6rb5l4jHq28S6C+/m/ogCpgwvSjM3gSrntofpEC9vXlBk4ftfSYxlA
 UGX+lkKhj6k1v9M5xINobdQ6WPO/ahhYP9DyLDVxu21mSELGBLhsvU5SLRQ0qwWqimni
 MULw==
X-Gm-Message-State: AOAM5316xfoPjsrz6gv/uuIkHFBWONEoVEL2U+tGBHvl0fqOM0o6Oy9v
 H7oBtZOtV4O37vpnh356WHjY3Q==
X-Google-Smtp-Source: ABdhPJy95F12FbARJJuG3RP+KItNypekR2/l+xifaD1kKSsYtJFW/+wQ/332xG0BY0Bxhx2ISOUtlQ==
X-Received: by 2002:a17:90b:4b46:: with SMTP id
 mi6mr1449604pjb.188.1637088237573; 
 Tue, 16 Nov 2021 10:43:57 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id r8sm15237754pgp.30.2021.11.16.10.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 10:43:56 -0800 (PST)
Date: Tue, 16 Nov 2021 18:43:53 +0000
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 6/7] KVM: powerpc: Use Makefile.kvm for common files
Message-ID: <YZP76Un0mip17E1K@google.com>
References: <5047c2591310e503491850ef683f251395247d50.camel@infradead.org>
 <20211116115051.119956-1-dwmw2@infradead.org>
 <20211116115051.119956-6-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211116115051.119956-6-dwmw2@infradead.org>
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
 "wanpengli @ tencent . com" <wanpengli@tencent.com>, kvm <kvm@vger.kernel.org>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Catalin Marinas <catalin.marinas@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "vkuznets @ redhat . com" <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 16, 2021, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> It's all fairly baroque but in the end, I don't think there's any reason
> for $(KVM)/irqchip.o to have been handled differently, as they all end
> up in $(kvm-y) in the end anyway, regardless of whether they get there
> via $(common-objs-y) and the CPU-specific object lists.
> 
> The generic Makefile.kvm uses HAVE_KVM_IRQCHIP for irqchip.o instead of
> HAVE_KVM_IRQ_ROUTING. That change is fine (and arguably correct) because
> they are both set together for KVM_MPIC, or neither is set.

Nope.

  Symbol: HAVE_KVM_IRQCHIP [=y]
  Type  : bool
  Defined at virt/kvm/Kconfig:7
  Selected by [m]:
    - KVM_XICS [=y] && VIRTUALIZATION [=y] && KVM_BOOK3S_64 [=m] && !KVM_MPIC [=n]
  Selected by [n]:
    - KVM_MPIC [=n] && VIRTUALIZATION [=y] && KVM [=y] && E500 [=n]

leads to this and a whole pile of other errors

arch/powerpc/kvm/../../../virt/kvm/irqchip.c: In function ‘kvm_irq_map_gsi’:
arch/powerpc/kvm/../../../virt/kvm/irqchip.c:31:35: error: invalid use of undefined type ‘struct kvm_irq_routing_table’
   31 |         if (irq_rt && gsi < irq_rt->nr_rt_entries) {
      |                                   ^~


Side topic, please don't post a new version/series in-reply-to a different series.
b4 also gets confused in this case, e.g. it tried to grab the original patch.  b4
has also made me really lazy, heaven forbid I actually had to manually grab these
from mutt :-)
