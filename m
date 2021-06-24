Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B233B2ACA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 10:52:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9Yml43qWz306m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 18:52:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mEGHBnju;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mEGHBnju; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9YmJ5wFpz2xZJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 18:52:16 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id v13so2593518ple.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 01:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=9iS9TDXjHYeeO4p1tZR6e76NZxX4UTo0tHhJ02Bmyuc=;
 b=mEGHBnjuh74WaoNyT1eKb/VOfvVFvX3kwUneJ5AncMO10vay7V/YPF/SG5j7p8iYH1
 7gxNCDvNzDqb55aG0xXgAC1RA62Wj+bbizWaJDKEr0nn3qnuj2jXLdTdeiyFZgIkzbU6
 eUXYZQk6B3lHcCn/C7rK9Hfy2ewbGQ+QcUAXV5aikZlnmoVPOh+oFpMVHi12RR/PQruY
 Y7ojicHYDpa1rl6bybFrRzQg1WLQ4vvo9pySUIlXsW7HorWi3IZfqYmc1PUso5nJwGuX
 l372R3hUka0ng8Md0fedsRzdAZ1LxWh9MkI+AQUHTjtMJyFheflEYDzQL0UNZQwWosBs
 cQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=9iS9TDXjHYeeO4p1tZR6e76NZxX4UTo0tHhJ02Bmyuc=;
 b=UnurgBRd7cXq+uHXZP8CqNwLEi6K0Iaf0iQvwztfxjxUiWldazgEWUtRRlI3J9pZDS
 CdKwhb9MJbN9Z/BW83JTo+2sieVf60C9z9FWHcfrqwEUkmsFPqJGyUZySw7eOEiuMv24
 DemojjUFq8gOppR6tT7/KR+/3qZGTPslSeVcu6J01Fs7r5LBEmUH1f+BIhyVaUJEmHvg
 RKLWBdJKz3a6eSzEd6XtVlNQPeFxyEGQbRzEoCymERaggnFqFaPeED6Ebk6pxTmwx3Mb
 hCC8TtL1YvUxU9F+rybx94P+9JnBEaojiEwfz7Kn9kbQ1i4/xUHk5KlOrZ/mHIcAydNh
 Ig1A==
X-Gm-Message-State: AOAM531Q7u1zYp10v4dQ55hV7lOVHm+L26lgJMP2W2RZLD9bBDRL6Zre
 K9bSCOb4uus7LEoyMc9Iq6c=
X-Google-Smtp-Source: ABdhPJxZDp/SyGeLqZPtuw/I81jZ765tjN1eiDWxfb5Gw8s0EqtrDghio6LIVydktk8tQn/Q5HNfVQ==
X-Received: by 2002:a17:90a:6fc1:: with SMTP id
 e59mr4396347pjk.37.1624524732566; 
 Thu, 24 Jun 2021 01:52:12 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id c5sm2109274pfv.47.2021.06.24.01.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 01:52:12 -0700 (PDT)
Date: Thu, 24 Jun 2021 18:52:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/6] KVM: mmu: also return page from gfn_to_pfn
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>, Paul Mackerras
 <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>, David Stevens
 <stevensd@chromium.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-3-stevensd@google.com>
In-Reply-To: <20210624035749.4054934-3-stevensd@google.com>
MIME-Version: 1.0
Message-Id: <1624524331.zsin3qejl9.astroid@bobo.none>
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
>=20
> Return a struct kvm_pfn_page containing both a pfn and an optional
> struct page from the gfn_to_pfn family of functions. This differentiates
> the gup and follow_fault_pfn cases, which allows callers that only need
> a pfn to avoid touching the page struct in the latter case. For callers
> that need a struct page, introduce a helper function that unwraps a
> struct kvm_pfn_page into a struct page. This helper makes the call to
> kvm_get_pfn which had previously been in hva_to_pfn_remapped.
>=20
> For now, wrap all calls to gfn_to_pfn functions in the new helper
> function. Callers which don't need the page struct will be updated in
> follow-up patches.

Hmm. You mean callers that do need the page will be updated? Normally=20
if there will be leftover users that don't need the struct page then
you would go the other way and keep the old call the same, and add a new
one (gfn_to_pfn_page) just for those that need it.

Most kernel code I look at passes back multiple values by updating=20
pointers to struct or variables rather than returning a struct, I=20
suppose that's not really a big deal and a matter of taste.

Thanks,
Nick

