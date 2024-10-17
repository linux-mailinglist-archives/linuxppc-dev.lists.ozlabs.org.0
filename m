Return-Path: <linuxppc-dev+bounces-2352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EE29A2B27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 19:40:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTw8t6Gmsz3bdV;
	Fri, 18 Oct 2024 04:40:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729186830;
	cv=none; b=WvLxab/wmULIsCwv2N1l/fnhhCRIpJokB8AiPEqK8akvn2MhFyH4hOhX+3oW7uxVqYiUDTz1hE6767F89nMgXg2XdB2tppbrc7ZJlC5+QLxxbyRkp8D9w+pZnGI07PrksBJiUv4hQtyYVqGah2KXyBrOnotkC55Y86MGef15lK75u7DWI9Wpe7MYruWuIvx+Ra1wn+JXnRbkyRVqIr4g+wjjx/2c2EhRC2lrCTnk8pdQauRWOOG7Dful1TKW2ag5/V71rJm7zqiuzLpJjRGwNy0INzbZDV0vc/mvLmzhgGKYaDqm4pVCjEs0cxiSLO3R0Wt7Z7rXGN1Ua/Hkln9WKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729186830; c=relaxed/relaxed;
	bh=Me+6kqYD5L+igZgkevVfUHfhQZBz6G5zZyQw2Dfa0gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CNtspeA4pyiz7uFQF2FY1oFntKzeU4rfd7OJ0Q6lLrC2M2F61dASRx8SvwA58obZY70ThvTsUKGTtKmfvCVNjyoZXIJfxk2TR4hX3LRLczxkHKfcSxX+FxYm3vOt4wZAv8tB4QCr4pYapwzJSxgRzdWWJtTqghNyBzBryXKVDNOv1oAGT36ZHeLGZO2zUgJsWjT+G9TFBe8e80OId2IU9qEXcJRJlsRgr4Os1nvSikiBsbiiMKC/TGrhLFK42TWhlpkMYevK8xTVvCvVQ/ZMFwEgmR5iuZQomBFBCjihl+kNrNqqFD3hVHtYHy+4TKr7Fytky3Rz7ijCdY3C5nnCkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JfDKBTN7; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JfDKBTN7; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JfDKBTN7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JfDKBTN7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTw8p3N4pz2yZZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 04:40:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729186820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Me+6kqYD5L+igZgkevVfUHfhQZBz6G5zZyQw2Dfa0gs=;
	b=JfDKBTN7EKK/7g00ZbFVAOFGAj+sX09EJtPKbT1THPVZu04ZswRCfPXhcSzgAHfWsJdEmo
	+7We6LKORBxOOwyFJOnzKJqG4ivYQ08lR1n3IEFl+JuOni0sHCZqcDyWTjNRj2eVqB6vOa
	xwMQ/v1Rer+86A6jIrUtOByGNFJNPmQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729186820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Me+6kqYD5L+igZgkevVfUHfhQZBz6G5zZyQw2Dfa0gs=;
	b=JfDKBTN7EKK/7g00ZbFVAOFGAj+sX09EJtPKbT1THPVZu04ZswRCfPXhcSzgAHfWsJdEmo
	+7We6LKORBxOOwyFJOnzKJqG4ivYQ08lR1n3IEFl+JuOni0sHCZqcDyWTjNRj2eVqB6vOa
	xwMQ/v1Rer+86A6jIrUtOByGNFJNPmQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-FKqTcMnzNTyjU3Lb9bRdNg-1; Thu, 17 Oct 2024 13:40:18 -0400
X-MC-Unique: FKqTcMnzNTyjU3Lb9bRdNg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4314a22ed8bso8402175e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 10:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729186817; x=1729791617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Me+6kqYD5L+igZgkevVfUHfhQZBz6G5zZyQw2Dfa0gs=;
        b=CpoW1ULfaL0qid2xhkPBfb5Ug/uDeZX9BwN9MpUZNDh1mj4h4oTKEPwQOI/51AMOku
         ow/jfeom2wdCNVX2xStmelZQeC6CCTD0OKpXxja5sFTa+J1hzVBkARaPAcHvGy9+NK2f
         kMHJ6TRVihKVVkDsFOHK+c3UWI+sfAjzRTZOD6qyIJJ00OxXOjy3iv4Q2sk+C28sdB7G
         3atm3767txpnzbArUeWTyLJel3W7ybIpxD9k/c1ttqvnAzwykrFZp9JqyDnaDhXePlcr
         Y2MkS47l0loRjWixZ/QeyLbwzSIBeIKiFvQKr3RapH0DfgxPXv9Kb+j6quKH6U3GFSHN
         LrDA==
X-Forwarded-Encrypted: i=1; AJvYcCVU0QZQPadPZINnAIp9DTFINNuP+uAnTkf+DNO2dlwone0282SOVrAQQXpSFXxIgP2fHchc+79jw8YmVwQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1Ux5wyoXN04kETvO/vaTSFGrGCIhj/uEziLSJ2MY8L6URMFwA
	WdZb36Fan04jo/yzTKNiHuNYH6XDPfLAWsmjy84GwZKZbnQ3uRDi0G+n0olSsQJAfmZK4Xtx/dh
	jxejYEEx9rQ+L4mPYs+lw1oa3cjAPcd3goDOMBsy1OysgReQobfrcIbX3Un4DMH+FVexMXVBbKa
	eJs+kdF5gF0Rg+3ozUU+3n3ZkwGHATmR0M7OXAeQ==
X-Received: by 2002:a05:600c:1d8e:b0:431:57d2:d7b4 with SMTP id 5b1f17b1804b1-43157d2d7b9mr36507075e9.26.1729186817335;
        Thu, 17 Oct 2024 10:40:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJXjIUBFBzWhc81QoCH/SVoEivw8XmjKVFXrcy86zA+s4Bvx/9zH7hnQ9Z4/zbRof1LT4xgUF82luj5UeBHDI=
X-Received: by 2002:a05:600c:1d8e:b0:431:57d2:d7b4 with SMTP id
 5b1f17b1804b1-43157d2d7b9mr36506735e9.26.1729186816975; Thu, 17 Oct 2024
 10:40:16 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 17 Oct 2024 19:40:04 +0200
Message-ID: <CABgObfbQW-3vp=mNcR4giUGZ_gxhuRykvKj8gzBDY7pOg6xdBQ@mail.gmail.com>
Subject: Re: [PATCH v13 00/85] KVM: Stop grabbing references to PFNMAP'd pages
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Yan Zhao <yan.y.zhao@intel.com>, David Matlack <dmatlack@google.com>, 
	David Stevens <stevensd@chromium.org>, Andrew Jones <ajones@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 8:24=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
> v13:
>  - Rebased onto v6.12-rc2
>  - Collect reviews. [Alex and others]
>  - Fix a transient bug in arm64 and RISC-V where KVM would leak a page
>    refcount. [Oliver]
>  - Fix a dangling comment. [Alex]
>  - Drop kvm_lookup_pfn(), as the x86 that "needed" it was stupid and is (=
was?)
>    eliminated in v6.12.
>  - Drop check_user_page_hwpoison(). [Paolo]
>  - Drop the arm64 MTE fixes that went into 6.12.
>  - Slightly redo the guest_memfd interaction to account for 6.12 changes.

Here is my own summary of the changes:

patches removed from v12:
01/02 - already upstream
09 - moved to separate A/D series [1]
34 - not needed due to new patch 36
35 - gone after 620525739521376a65a690df899e1596d56791f8

patches added or substantially changed in v13:
05/06/07 - new, suggested by Yan Zhao
08 - code was folded from mmu_spte_age into kvm_rmap_age_gfn_range
14 - new, suggested by me in reply to 84/84 (yuck)
15 - new, suggested by me in reply to 84/84
19 - somewhat rewritten for new follow_pfnmap API
27 - smaller changes due to new follow_pfnmap API
36 - rewritten, suggested by me
45 - new, cleanup
46 - much simplified due to new patch 45

Looks good to me, thanks and congratulations!! Should we merge it in
kvm/next asap?

Paolo

[1] https://patchew.org/linux/20241011021051.1557902-1-seanjc@google.com/20=
241011021051.1557902-5-seanjc@google.com/


