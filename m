Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D133B2C04
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 11:58:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9bDm39Nfz3bsW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 19:58:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=EhX2h/EG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EhX2h/EG; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9bDH0PcJz2yyG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 19:58:05 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id 21so4732283pfp.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 02:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=2/FXkDvvz78LZzi8vEuw9P0gxvIPqn8+9Qh994D56qo=;
 b=EhX2h/EGnTWqdqRQbpZlpJcgT0oJJ6o7Nef8q7EtPvI99smF5fr4TIG1Xp5CmTthMl
 XHQzIJWggbxJUXpq8OIPTnYOso57K6OBKZR9lvcFT5+8SBJA9849ahv3W1ndrCYtoccT
 yygIYTNJlnGOy5EhAkMecjcGkX/PpQmk6jKwKuAM0vg6/CjPiKQtp4B/woWoN5Oxyu7M
 ua8ZUETzbjTOqOpCOLZ+ZXZ4cbXcI88NdWfpPkU+Dnz/3z1CLTZvVnhoG0DpsDAi9bV1
 nK9pW2bxw2DMCvsnbAXlJB/lKwAPvP15NgJgI5cnQ6vQYvzhGuulMUnoZMx6s+4VaanO
 Eqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=2/FXkDvvz78LZzi8vEuw9P0gxvIPqn8+9Qh994D56qo=;
 b=mLk4AChn3PFHZt8VKKzkwd+kXCTTnFDDsZk1fEnZ/EWMEU3Jf2WLelcEVVL18g4vKD
 KThYUDYkr9Ck2N6k0vq4tv5AxAnP0vsQKexJ21hFsdP4jKd+I0GASzcwIGD261Z/VNYp
 fP9u/1XjRM8Coq7Avc9yxRElk0Uj45qPJNRG/8ZU+DSAZd834FBB7KAI7zYFn33166DG
 MiuPuffBhUpEdJKbNQ2FCVOwkYsjoJoo2QEWEVpyJphnsMPa2rgjhJUMhb6lFe9D1kvV
 V/0U4xSnMg6hBQHmADfSjUscel+w4EzaqzU8S2dKS5DzaRg+vZ/moG8JgsR+Kg6lQ/YH
 qZFw==
X-Gm-Message-State: AOAM5332ib7bHh+xBdLjkWltWn/r1QpxPTLjfSzKzNcSN9iQjfhWTSEN
 uP/ojC91CD+Zl64JXzjBzgg=
X-Google-Smtp-Source: ABdhPJzzKwhLHCAEARj7N7XbHWSLsSDNrl/BU7M36fXftqZpKf9BHg/7Rmx6MuG9ZeVpPhgC2xWSpQ==
X-Received: by 2002:a62:1857:0:b029:302:fb56:df52 with SMTP id
 84-20020a6218570000b0290302fb56df52mr4317733pfy.3.1624528683047; 
 Thu, 24 Jun 2021 02:58:03 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id y20sm2759510pfb.207.2021.06.24.02.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 02:58:02 -0700 (PDT)
Date: Thu, 24 Jun 2021 19:57:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/6] KVM: mmu: also return page from gfn_to_pfn
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Huacai Chen
 <chenhuacai@kernel.org>, Marc Zyngier <maz@kernel.org>, Paul Mackerras
 <paulus@ozlabs.org>, Paolo Bonzini <pbonzini@redhat.com>, David Stevens
 <stevensd@chromium.org>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
References: <20210624035749.4054934-1-stevensd@google.com>
 <20210624035749.4054934-3-stevensd@google.com>
 <1624524331.zsin3qejl9.astroid@bobo.none>
 <201b68a7-10ea-d656-0c1e-5511b1f22674@redhat.com>
In-Reply-To: <201b68a7-10ea-d656-0c1e-5511b1f22674@redhat.com>
MIME-Version: 1.0
Message-Id: <1624528342.s2ezcyp90x.astroid@bobo.none>
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

Excerpts from Paolo Bonzini's message of June 24, 2021 7:42 pm:
> On 24/06/21 10:52, Nicholas Piggin wrote:
>>> For now, wrap all calls to gfn_to_pfn functions in the new helper
>>> function. Callers which don't need the page struct will be updated in
>>> follow-up patches.
>> Hmm. You mean callers that do need the page will be updated? Normally
>> if there will be leftover users that don't need the struct page then
>> you would go the other way and keep the old call the same, and add a new
>> one (gfn_to_pfn_page) just for those that need it.
>=20
> Needing kvm_pfn_page_unwrap is a sign that something might be buggy, so=20
> it's a good idea to move the short name to the common case and the ugly=20
> kvm_pfn_page_unwrap(gfn_to_pfn(...)) for the weird one.  In fact I'm not=20
> sure there should be any kvm_pfn_page_unwrap in the end.

If all callers were updated that is one thing, but from the changelog
it sounds like that would not happen and there would be some gfn_to_pfn
users left over.

But yes in the end you would either need to make gfn_to_pfn never return
a page found via follow_pte, or change all callers to the new way. If=20
the plan is for the latter then I guess that's fine.

Thanks,
Nick
