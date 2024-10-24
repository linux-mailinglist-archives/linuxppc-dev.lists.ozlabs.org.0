Return-Path: <linuxppc-dev+bounces-2535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 684E69ADAB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 05:53:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYsTH34Hcz2xt7;
	Thu, 24 Oct 2024 14:53:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=136.143.188.112 arc.chain=zohomail.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729742003;
	cv=pass; b=L1DkPwXSw9wgJwcQl7yZnyp8ysNFQwBDKjjyrKmf6UenkQQSkXfOTjNraU/8kmN/SENSKWyWEDHjqvy/zJAawhr5nHRCMFJnIFaUrPF15cHXMZ/pY6jNGgMnsqkaqbW09Tph0vA541yCbnkhGzXb2u57TvkfpvHU5yas3DJnnsTBShkgoARo8sDBqXfzEky5/7OcBm+8SRHuyTrc076mYI0Cob7LUlg+04j5Bm3eAVInW03LDhDdNMrUIZ11jZPufUcYkUcSwbIeHhIiHd+Vo1Td4uYY6vwp2vNs5XVZZ8LcEsgCcV0I7omLgvrwfBKMziMICPNY3iojBMSBxwSTeg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729742003; c=relaxed/relaxed;
	bh=4wf2lEGNiKikemuz3JoVmC7ikUs3mn2DyQw2oAk/xb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hjlb6uYailpZgwh067RKBp0JkYSUW1lvwqcjBvNIBPbJmdp3sIldXGgGZwTyGqSqi/duXjErKndnu5QAg+UibuIJN1YlP1w0/eqIl0ruU3nqxFaP7As1PfyGCKnd+Gk8itnf08DNRz/U1pzDGRKcB59Lc38ZE8smlrSulvcYH40Bb2mu/AqUdsBn63rXHWKVw4RNhIQS4V8BIMLiRRy1xl6J9eTjqqNTJrzJxUkbRSK4onsBj26O8Tkj39iHec4hswOyqndE0JHmcRiPoZ/2JdmWv8ISurDI0hiu4rlVGIvvn5JM79V0IF09Avn5kxxuzEWWuA2VFgabB2T6dB7ybw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=collabora.com; dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=cQ8vcj5j; dkim-atps=neutral; spf=pass (client-ip=136.143.188.112; helo=sender4-pp-f112.zoho.com; envelope-from=dmitry.osipenko@collabora.com; receiver=lists.ozlabs.org) smtp.mailfrom=collabora.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=cQ8vcj5j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=collabora.com (client-ip=136.143.188.112; helo=sender4-pp-f112.zoho.com; envelope-from=dmitry.osipenko@collabora.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 908 seconds by postgrey-1.37 at boromir; Thu, 24 Oct 2024 14:53:22 AEDT
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYsTG0y8zz2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 14:53:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729741060; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nX8OPXDW2cthIEqTMyQQblZpQUeRm1tlYext1Oo30sTtYHYcktbP6QkNaRaRkvMdBZhtUx8VMyuOZ1yo+FGGeGS0iCscen2p3GnJ1SyL8u2H85tjngG+AQ708fA/Wbe6xOriUcybgk3FqcZLV5d+YhhpIyUQHTpiQ1V0GZwo2ow=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729741060; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4wf2lEGNiKikemuz3JoVmC7ikUs3mn2DyQw2oAk/xb4=; 
	b=XjLhS44GYUwiRMfeiBLSXehbyRQHvo6kaknTjIG114GAewi+zh78rAsKEHBbblqZNUaD0HYnVdKY6QBZ6HfPRPHw1RR+8ptBY9I6yekRvVWAnJN/gZfNwiXZ1CivAP7+qd4eraONzUwIs+Q/hbulsRZ56dZh8+L2v3nWUBAIzd4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729741060;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4wf2lEGNiKikemuz3JoVmC7ikUs3mn2DyQw2oAk/xb4=;
	b=cQ8vcj5jczCZFZamwVhgcpKC2ZP4/1MdOILVTF2hjwXwseYRu8QXQXCHBGN8Z7WZ
	5WRt1sT0vEYnud2HTzfxLFosZXJPwKulFSBtZYX0ZqRX2NJ5tO7GS2OAuoHhYA9KkpX
	kVPN3Qtgq2O/ILYUE5VKlxxBj81B828bnHdKV/qo=
Received: by mx.zohomail.com with SMTPS id 1729741058928285.49991825731297;
	Wed, 23 Oct 2024 20:37:38 -0700 (PDT)
Message-ID: <03c316c7-5268-40cd-af1c-4c8454506ab2@collabora.com>
Date: Thu, 24 Oct 2024 06:37:28 +0300
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/85] KVM: Stop grabbing references to PFNMAP'd pages
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>,
 David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20241010182427.1434605-1-seanjc@google.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 10/10/24 21:23, Sean Christopherson wrote:
> TL;DR: Eliminate KVM's long-standing (and heinous) behavior of essentially
> guessing which pfns are refcounted pages (see kvm_pfn_to_refcounted_page()).
> 
> Getting there requires "fixing" arch code that isn't obviously broken.
> Specifically, to get rid of kvm_pfn_to_refcounted_page(), KVM needs to
> stop marking pages/folios dirty/accessed based solely on the pfn that's
> stored in KVM's stage-2 page tables.
> 
> Instead of tracking which SPTEs correspond to refcounted pages, simply
> remove all of the code that operates on "struct page" based ona the pfn
> in stage-2 PTEs.  This is the back ~40-50% of the series.
>  
> For x86 in particular, which sets accessed/dirty status when that info
> would be "lost", e.g. when SPTEs are zapped or KVM clears the dirty flag
> in a SPTE, foregoing the updates provides very measurable performance
> improvements for related operations.  E.g. when clearing dirty bits as
> part of dirty logging, and zapping SPTEs to reconstitue huge pages when
> disabling dirty logging.
> 
> The front ~40% of the series is cleanups and prep work, and most of it is
> x86 focused (purely because x86 added the most special cases, *sigh*).
> E.g. several of the inputs to hva_to_pfn() (and it's myriad wrappers),
> can be removed by cleaning up and deduplicating x86 code.
> 
> v13:
>  - Rebased onto v6.12-rc2
>  - Collect reviews. [Alex and others]
>  - Fix a transient bug in arm64 and RISC-V where KVM would leak a page
>    refcount. [Oliver]
>  - Fix a dangling comment. [Alex]
>  - Drop kvm_lookup_pfn(), as the x86 that "needed" it was stupid and is (was?)
>    eliminated in v6.12.
>  - Drop check_user_page_hwpoison(). [Paolo]
>  - Drop the arm64 MTE fixes that went into 6.12.
>  - Slightly redo the guest_memfd interaction to account for 6.12 changes.

Thanks a lot for working on this patchset! I tested it with native
amdgpu/intel contexts and venus/virgl with dGPU and iGPU, no problems
spotted. Please merge sooner, this will unblock lots of new virtio-gpu
features.

Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry


