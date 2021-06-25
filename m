Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B987E3B3A25
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 02:21:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9yN44QJVz3bs1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 10:21:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=esFkhH15;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=esFkhH15; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9yMb6Lrzz2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 10:20:41 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id d12so6130139pgd.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 17:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=QS1Ns1WqNL5is+0vi/ZTUFuxlVcqVbsqm8g6SHrti5w=;
 b=esFkhH15NMc8wS4V/cwcupYK/DM+pO31de2/rn7330Vbdh9CSH9nvb+7DxAuWpBq5q
 I7HhRjIAf3sfraAsSUg5Y3qXSa9eVE9+YVQ00KJALtXy9kkDyH52E89nrtf01dGKriH8
 b00IMLN+V/HOLpi8TtU0LZ1hk9cAx0kkRlMaPdbbDzt+jClVFu+NXDMdkVwZY7xsN+Pb
 tP4yZoVaJBNxRaG8tctEZTIYWsIItqZBewSg9WSZ8LdCnbR+ioG4SZD7hACLKDcVik91
 hFNd/jFL7BVxEVmattHQ7LktCFlqiNNlX/MEUpDQB/QeQIQwm0YNoc++AkYkd7w7Rqkx
 Ypjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=QS1Ns1WqNL5is+0vi/ZTUFuxlVcqVbsqm8g6SHrti5w=;
 b=gJqqpS58gQsqFoR7N3zgLjmPpyykNoUV4OCcmOmxd3HT3FNJNpwhahlgfHBkI1VG1k
 6f8OJkYRNfm+X3RHwDpY551jRB/X86skqQFpxLUyvgpPmjWXw/XF3gW2SglOKTHiRulK
 q6B0nD0urqnMroRP1BPJdksRdS+me6nIuJPJG7NYxpxT9H6WovTdNeHSIHwAblrWkEpm
 MGr89wp7D3aQDZzzg8mAzXHXS8BNgYlaAnmfs8+hz5ypRWsfvJ2s4rQIy00ujjd0eOT6
 8PNO+tSht9q/AAuF8519SVJgTQpXlE8sEcbg6x7kSVlNMMX+/3McI7bGirdVn7+WPQbz
 dQHQ==
X-Gm-Message-State: AOAM532jhIpWdDUoHrZgtQmvzV4rsh70Rtg+TutuQvd2UYzhHqPgizr2
 M+YrzJByF0B0t4mOA4y2TPo=
X-Google-Smtp-Source: ABdhPJxQU7+bPuGhEylfTnovn9GkVLr4KlmlOjHYTX0Un3AOHd4dWxP2gfr/obThDIjB30qffkhRJQ==
X-Received: by 2002:a62:2fc1:0:b029:305:fd1e:e3f4 with SMTP id
 v184-20020a622fc10000b0290305fd1ee3f4mr4774381pfv.17.1624580437511; 
 Thu, 24 Jun 2021 17:20:37 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id z18sm3630623pfe.214.2021.06.24.17.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 17:20:37 -0700 (PDT)
Date: Fri, 25 Jun 2021 10:20:32 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/6] KVM: Remove uses of struct page from x86 and arm64 MMU
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>, Paul Mackerras
 <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>, David Stevens
 <stevensd@chromium.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <1624530624.8jff1f4u11.astroid@bobo.none>
 <1624534759.nj0ylor2eh.astroid@bobo.none>
 <0d3a699a-15eb-9f1b-0735-79d14736f38c@redhat.com>
 <1624539354.6zggpdrdbw.astroid@bobo.none>
 <81d99029-ec40-19c5-5647-20607d78dab0@redhat.com>
In-Reply-To: <81d99029-ec40-19c5-5647-20607d78dab0@redhat.com>
MIME-Version: 1.0
Message-Id: <1624580015.hf7udh0vc3.astroid@bobo.none>
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

Excerpts from Paolo Bonzini's message of June 25, 2021 1:35 am:
> On 24/06/21 14:57, Nicholas Piggin wrote:
>> KVM: Fix page ref underflow for regions with valid but non-refcounted pa=
ges
>=20
> It doesn't really fix the underflow, it disallows mapping them in the=20
> first place.  Since in principle things can break, I'd rather be=20
> explicit, so let's go with "KVM: do not allow mapping valid but=20
> non-reference-counted pages".
>=20
>> It's possible to create a region which maps valid but non-refcounted
>> pages (e.g., tail pages of non-compound higher order allocations). These
>> host pages can then be returned by gfn_to_page, gfn_to_pfn, etc., family
>> of APIs, which take a reference to the page, which takes it from 0 to 1.
>> When the reference is dropped, this will free the page incorrectly.
>>=20
>> Fix this by only taking a reference on the page if it was non-zero,
>=20
> s/on the page/on valid pages/ (makes clear that invalid pages are fine=20
> without refcounting).

That seems okay, you can adjust the title or changelog as you like.

> Thank you *so* much, I'm awful at Linux mm.

Glad to help. Easy to see why you were taking this approach because the=20
API really does need to be improved and even a pretty intwined with mm=20
subsystem like KVM shouldn't _really_ be doing this kind of trick (and
it should go away when old API is removed).

Thanks,
Nick
