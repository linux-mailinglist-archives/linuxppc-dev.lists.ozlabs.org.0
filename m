Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C363B2AD9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 10:58:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9Yvd1FD2z309g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 18:58:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hr3gPiWS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hr3gPiWS; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9YvB0F42z2xZR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 18:58:11 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id y4so4581170pfi.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=tKGKGI76BKfQVO8CY1clLxpyySv3vaB3aNh7NWcPhFU=;
 b=hr3gPiWSs1kzsoT0RN4D0/9u1oAQb1rzWVWLp59xVCkmpZThGbP8ZZHdbz3ZoRByYE
 Q+bBx6g9vlzubm3xmDqrFRZB2+oF9y38fRVeD/lgeXJbzeuitriXAAYQ0N8Gc/HydmS9
 h/5/U9gCncS2FPi6hlzNOXRrtw9yomYF3Wegfa7y5BMTxxqMjVRS/4Rtc+vsfYrwyiXs
 LyEAUsbj+aFGjgwEVS9b0hjW6sOv/s+/X+xMkec2Brf1nwlIC4mUivbzM9KBmc/1CmOo
 TCEnNnCh1Rmp7Wm6gBzXbz6S+8yTRr+T+rSaRDpuwEYfFxSOn4uIuwntNiH62vmZwJdo
 +iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=tKGKGI76BKfQVO8CY1clLxpyySv3vaB3aNh7NWcPhFU=;
 b=LeS2uDW/1Foz57E97+mWUmrNABR5SJ3vQHvTvSPSUlGl6rmtNH8tLDCEsYpaayzsqB
 hRJLnPAaYdUViPCkcRJFivO683KQkd1ks6HZB/zufzRg/XfK7/gCGqEpr15X/C9zzKec
 lvW+qBYmvJNPRoxdI9zLhmohkqV7hp1cGZy9h9sRByc9aZ3z2zEEOJsDqowFRAIjqUzo
 J4k8etcUXFUY2/J4SPnZDyYYJIXk+pPifowfKmskPigjqPMFfUKKfN67X1hovINl9Zjl
 UW8ojH0gXjhIGvRLpsUJLwUCKgdRrSOOHuTac35U0+uz2Qk9BYozqEd1yKyCBX+S7Fzw
 eBFg==
X-Gm-Message-State: AOAM530QIDwNmuj5iGz15viRxFhvsVMoaXzQ49Jp0dRX+G/7c4IRdCQf
 +d+fw3vNd551hDPrCZZ8nyQ=
X-Google-Smtp-Source: ABdhPJw6tjizzTpMBwm3ffTzeTydtLNTRDVWzEX8o5A/u6n7JmgIJ0z9ctLYNOtrV24IDSrsfT+37Q==
X-Received: by 2002:a63:4e4c:: with SMTP id o12mr3895360pgl.95.1624525086186; 
 Thu, 24 Jun 2021 01:58:06 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id u12sm2003479pjc.0.2021.06.24.01.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 01:58:05 -0700 (PDT)
Date: Thu, 24 Jun 2021 18:58:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/6] KVM: x86/mmu: avoid struct page in MMU
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>, Paul Mackerras
 <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>, David Stevens
 <stevensd@chromium.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-4-stevensd@google.com>
In-Reply-To: <20210624035749.4054934-4-stevensd@google.com>
MIME-Version: 1.0
Message-Id: <1624524744.2sr7o7ix86.astroid@bobo.none>
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
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, intel-gfx@lists.freedesktop.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kvmarm@lists.cs.columbia.edu,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 kvm-ppc@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linux-mips@vger.kernel.org,
 intel-gvt-dev@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from David Stevens's message of June 24, 2021 1:57 pm:
> From: David Stevens <stevensd@chromium.org>
>  out_unlock:
>  	if (is_tdp_mmu_root(vcpu->kvm, vcpu->arch.mmu->root_hpa))
>  		read_unlock(&vcpu->kvm->mmu_lock);
>  	else
>  		write_unlock(&vcpu->kvm->mmu_lock);
> -	kvm_release_pfn_clean(pfn);
> +	if (pfnpg.page)
> +		put_page(pfnpg.page);
>  	return r;
>  }

How about

  kvm_release_pfn_page_clean(pfnpg);

Thanks,
Nick
