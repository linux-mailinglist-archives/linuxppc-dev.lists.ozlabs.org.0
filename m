Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 300613B2C4D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 12:18:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9bgs0NbYz3c3V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 20:18:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sFF5ZYvJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sFF5ZYvJ; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9bg44NWgz309F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 20:17:51 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso3162265pjp.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 03:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ufPcep0sp8fFam4s8EQWkn+673yXecgGkFHNTHQONWw=;
 b=sFF5ZYvJivSW9geCDpAWHQIXJqy0TaWKJDeCWyf+SN8sC0zvAWOqxE0kDzVGrlqH0T
 tmnXDqy/vMEUI/QT1fg3tuAhH6y/WaFDv0bhKrmNY65hIUEPGulyXJKnytExJVEwigXZ
 EEgjb92CecGE/1ZNSefvvxGTeh5Bu3j4pd19HStH0J6gJv+4gmTPMVXvpU/FEf57f6Z1
 yZZLHMoK9YK0EH+XiEgmNblrEYdl95qc0I5aDyKhqYAvytW6+/07zmQXw9lEc1D57uv2
 sPH/vR/v0oM7LuQHI7hajV/RDoziumHUY8ZgFdgAAJLR7DiFovRTgo8M2LsLunQ7LnIe
 UNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ufPcep0sp8fFam4s8EQWkn+673yXecgGkFHNTHQONWw=;
 b=FB3MYpd9pN/2xaSs2+2hcyzoAI+C6tEmXeXPSWt38zlnzP0vaZxdh95TFFdB0lpSus
 yBNlCtwCN+O9+BlBxNmhPG3Mla83u0NfQMfxeI4XATL4aOd+cfO8Ae+H9fI5hYhm8Aiy
 /fMVZSZzDssSg5b1PI83GUm7fedsVJt1dHZXfiF7ZPoQz1p8XgtBsIaRhyz9AKKjw28Z
 xM4wkuTfdlw2KdR20ZCKgj+h/z/UYrxcowphksnS1Ncwzl3Ay7FCH/tN7HPe9NQVTJ+N
 h67RbkDQbtODozUAmRS2C/2F3y4DyiwfTTBN9rmLUEt+QZwIyE+8PtyFbluQSdLQ7s7W
 j4Yg==
X-Gm-Message-State: AOAM533L0ZevenSbvROI09+G5d8X5AeZF38P3GRTjuIyYcDiOSfe8YZ7
 wnjQo3bg7NXV1B3Ny5bB7dQ=
X-Google-Smtp-Source: ABdhPJzBDdHKwzOfU1IGTH+/PPCRK2jVsTxYoY95EuRzqDADJIdiFOBloV8Ki52/MFkR99nX/DL1Xg==
X-Received: by 2002:a17:90a:7401:: with SMTP id
 a1mr14554343pjg.57.1624529868549; 
 Thu, 24 Jun 2021 03:17:48 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id o20sm2094410pjq.57.2021.06.24.03.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 03:17:48 -0700 (PDT)
Date: Thu, 24 Jun 2021 20:17:42 +1000
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
 <1624528342.s2ezcyp90x.astroid@bobo.none>
In-Reply-To: <1624528342.s2ezcyp90x.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1624529635.75a1ann91v.astroid@bobo.none>
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

Excerpts from Nicholas Piggin's message of June 24, 2021 7:57 pm:
> Excerpts from Paolo Bonzini's message of June 24, 2021 7:42 pm:
>> On 24/06/21 10:52, Nicholas Piggin wrote:
>>>> For now, wrap all calls to gfn_to_pfn functions in the new helper
>>>> function. Callers which don't need the page struct will be updated in
>>>> follow-up patches.
>>> Hmm. You mean callers that do need the page will be updated? Normally
>>> if there will be leftover users that don't need the struct page then
>>> you would go the other way and keep the old call the same, and add a ne=
w
>>> one (gfn_to_pfn_page) just for those that need it.
>>=20
>> Needing kvm_pfn_page_unwrap is a sign that something might be buggy, so=20
>> it's a good idea to move the short name to the common case and the ugly=20
>> kvm_pfn_page_unwrap(gfn_to_pfn(...)) for the weird one.  In fact I'm not=
=20
>> sure there should be any kvm_pfn_page_unwrap in the end.
>=20
> If all callers were updated that is one thing, but from the changelog
> it sounds like that would not happen and there would be some gfn_to_pfn
> users left over.
>=20
> But yes in the end you would either need to make gfn_to_pfn never return
> a page found via follow_pte, or change all callers to the new way. If=20
> the plan is for the latter then I guess that's fine.

Actually in that case anyway I don't see the need -- the existence of
gfn_to_pfn is enough to know it might be buggy. It can just as easily
be grepped for as kvm_pfn_page_unwrap. And are gfn_to_page cases also
vulernable to the same issue?

So I think it could be marked deprecated or something if not everything=20
will be converted in the one series, and don't need to touch all that=20
arch code with this patch.

Thanks,
Nick
