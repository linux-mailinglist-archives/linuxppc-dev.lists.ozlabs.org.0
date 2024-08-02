Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C842945D11
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 13:16:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QEoL7TlH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wb3FL1dkPz3dXP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 21:16:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QEoL7TlH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=alex.bennee@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wb3Df4qXXz3dLS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 21:16:16 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5a79df5af51so5540975a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2024 04:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722597373; x=1723202173; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+a+YbUYnYp2O9o3vDX++ZHVr+zNy81A/L7Ak8HFY0M=;
        b=QEoL7TlHEG+rmV1LW85hwpBZx9frK2g986MdbhZTINtfQU0FZgqZFhzECNOpsHeG24
         OvgUlwlzfNLTxnaVJIiXJjpr2JdQYXwylNRjpLzXIyQXYP0sTZpHK/e3ErpxI7olS+sr
         gN42RAESlZii37Mt+6+psWinw+14PJObywe5B4Os2OeMe5clb/HjJ9uMYTsYKTsU2Kph
         h6tn8U7PqgZhVyizPXV4MyDvU0ZR1yD3YeWm4a7xJdUW1mT8zu9HgI1OEx91D9bGfz68
         DccS/bAPepxOFaQlE/zY9xOSw1a75F02cWha3EnswRfvbUfjDrAKlbhI5d/qA0oNtz+U
         Rryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722597373; x=1723202173;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+a+YbUYnYp2O9o3vDX++ZHVr+zNy81A/L7Ak8HFY0M=;
        b=bHqoUbSeJ1us/YX0NHg/j+itnxwrUQUaGWoiTgjM9nrHjiew2E4JrY2eW+Dc/WXX+s
         qFW59+8Bg7axKwzjgWllU0+CfgIZAc/gTuPI6wzLqRaQCIJL0ZT8ovxC/Stu1PHHVUJS
         rhd8pW06U0IHfiTCY3I3/KhZiSN0Pkauc1Qm1OZRFIbKkd0zpmnw7AfThTJilyy1B9m1
         a7k35DcNjObNriOC30G4tNjcmjZE1pvn2eRZiAF/LpiJqvER22Y6youZzQNeaf3QJFvc
         5JAp2HoQCqy3ol9e3b97NvPyhkI9qy8qSdd2psBUk2YUs5SKCozjG2oSJPztJREW6Q6J
         9HFg==
X-Forwarded-Encrypted: i=1; AJvYcCXkRVJc00zZjXx3L2m4ofIOwZGcFJ4T3/I9qoraZ6GXIKu95x/VZ0lUxhqNN0TALhkubelmTVcIMH+w6nvKwDit+l/c5Jj3pjrMdwWokw==
X-Gm-Message-State: AOJu0YxRAl/Dv6gKbz9VDBpfQRPdHxatf7sEkS02XJdBZI1hQZZH05TY
	0SnPgURqh1lD/q5OhNY2+rZQvqLgTCATFvLXYShMxHDRAkZRV8tzQ/3m40utq+o=
X-Google-Smtp-Source: AGHT+IHUr2+eigMQMyKiFV2SC/+LcUpbtIeuSXGg+vhEQqD67tJuIK6amWVCFT4RRO+CzEGYIGxtXA==
X-Received: by 2002:a17:907:25c5:b0:a7a:acae:340b with SMTP id a640c23a62f3a-a7dc628bf8fmr256404766b.31.1722597372903;
        Fri, 02 Aug 2024 04:16:12 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bcb19csm87224666b.42.2024.08.02.04.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 04:16:08 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 91DEE5F8A9;
	Fri,  2 Aug 2024 12:16:04 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v12 11/84] KVM: Rename gfn_to_page_many_atomic() to
 kvm_prefetch_pages()
In-Reply-To: <20240726235234.228822-12-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:20 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-12-seanjc@google.com>
Date: Fri, 02 Aug 2024 12:16:04 +0100
Message-ID: <87frrncgzv.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:

> Rename gfn_to_page_many_atomic() to kvm_prefetch_pages() to try and
> communicate its true purpose, as the "atomic" aspect is essentially a
> side effect of the fact that x86 uses the API while holding mmu_lock.

It's never too late to start adding some kdoc annotations to a function
and renaming a kvm_host API call seems like a good time to do it.

> E.g. even if mmu_lock weren't held, KVM wouldn't want to fault-in pages,
> as the goal is to opportunistically grab surrounding pages that have
> already been accessed and/or dirtied by the host, and to do so quickly.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
<snip>

/**
 * kvm_prefetch_pages() - opportunistically grab previously accessed pages
 * @slot: which @kvm_memory_slot the pages are in
 * @gfn: guest frame
 * @pages: array to receives page pointers
 * @nr_pages: number of pages
 *
 * Returns the number of pages actually mapped.
 */

?

>=20=20
> -int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
> -			    struct page **pages, int nr_pages)
> +int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
> +		       struct page **pages, int nr_pages)
>  {
>  	unsigned long addr;
>  	gfn_t entry =3D 0;
> @@ -3075,7 +3075,7 @@ int gfn_to_page_many_atomic(struct kvm_memory_slot =
*slot, gfn_t gfn,
>=20=20
>  	return get_user_pages_fast_only(addr, nr_pages, FOLL_WRITE, pages);
>  }
> -EXPORT_SYMBOL_GPL(gfn_to_page_many_atomic);
> +EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
>=20=20
>  /*
>   * Do not use this helper unless you are absolutely certain the gfn _mus=
t_ be

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
