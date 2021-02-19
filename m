Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 033F631F596
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 09:03:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dhkc00hCbz3cRC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 19:03:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=tG6Rby36;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tG6Rby36; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhkbZ3nnCz30Q8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 19:03:20 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id b8so2913634plh.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 00:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=JQX1BGNeD8Fpdj6eenxDBcFHyQY3bVVigApTih5grCs=;
 b=tG6Rby36uL2jzdv2wp0h+OcUEsu10rvV1dOILRDLzmYq85TakGeY+08iKqAbDqrTRv
 erfA291+Wkz+3JdAuXk7+xTHSjNEK0swqdX6ZpIAEGfwuHEmi3r0S96ImXiqvbosFPlv
 inJ37GO0aN6q4Mv75+7y2gy3tlt/eK5o9aTtLmp7NQVuufJkaQzHvWBLazTA1IIhCOYz
 gM3usqbxAyHCV+M6bpO9SBKSO+ghV3CB6wydNE+a0pG3GqNVkKLqoG+n8NWBV34QzYcn
 2yKsvJBBbZq0JkFeqj49d/fxUZe9AvHfNZflql7OwkPxByXvG/SLzr8tZZiYo84e7oNN
 ohhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=JQX1BGNeD8Fpdj6eenxDBcFHyQY3bVVigApTih5grCs=;
 b=nhWDTJEzYNar8zefP3HYN7KxXAHPAAMIdrJFZs7vr1kkUm6Wzo64qzhtv3kXJVdzZh
 ErxT6lI37fnQdO4nRr4IaucBb6oRfQkL737/2BE5EenEvuQBd7WenI+3eIpGvLO3RKNT
 xkLdWef1FWu+1kUULrQK4JIYHjDDdCiijulk76uQ7pLm9NOfwa3EFV7HDXSLi4nNoJ/c
 dK908kRTSrJlgdKIHQ0fdG5Qj42GJ5OWjSns0qrEU3aeo98CVnvqvGd66UuE/X7IWNYN
 IkztRSq2jRzZtjoVzGA3qrCx2xtLMwdUwxUIYRzzP3UVhyW6EDCqG8wKvc19OnliMmAA
 h/2g==
X-Gm-Message-State: AOAM5315OWHPFqkAiVqzZMA0fSUKFLBz81p2+ZopwZF7MCGvxq7qA5PM
 bU8BooU+g0xhMmncbSKLKuWhxMSMDT0=
X-Google-Smtp-Source: ABdhPJxxZ8ie7QAdeAbFf6eX3Q7TwmrmzCVG3hnA1gi2NL84R0Lu2NWEZmoHO98lwPIQjWdom1DB4Q==
X-Received: by 2002:a17:90b:80f:: with SMTP id
 bk15mr7997174pjb.76.1613721798483; 
 Fri, 19 Feb 2021 00:03:18 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id w3sm7624044pjb.2.2021.02.19.00.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 00:03:17 -0800 (PST)
Date: Fri, 19 Feb 2021 18:03:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 1/9] KVM: PPC: Book3S 64: move KVM interrupt entry to
 a common entry point
To: Daniel Axtens <dja@axtens.net>, kvm-ppc@vger.kernel.org
References: <20210202030313.3509446-1-npiggin@gmail.com>
 <20210202030313.3509446-2-npiggin@gmail.com>
 <87o8ggab50.fsf@linkitivity.dja.id.au>
In-Reply-To: <87o8ggab50.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Message-Id: <1613721408.9e7tf7vuqz.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Daniel Axtens's message of February 19, 2021 3:18 pm:
> Hi Nick,
>=20
>> +++ b/arch/powerpc/kvm/book3s_64_entry.S
>> @@ -0,0 +1,34 @@
>> +#include <asm/cache.h>
>> +#include <asm/ppc_asm.h>
>> +#include <asm/kvm_asm.h>
>> +#include <asm/reg.h>
>> +#include <asm/asm-offsets.h>
>> +#include <asm/kvm_book3s_asm.h>
>> +
>> +/*
>> + * We come here from the first-level interrupt handlers.
>> + */
>> +.global	kvmppc_interrupt
>> +.balign IFETCH_ALIGN_BYTES
>> +kvmppc_interrupt:
>> +	/*
>> +	 * Register contents:
>=20
> Clearly r9 contains some data at this point, and I think it's guest r9
> because of what you say later on in
> book3s_hv_rmhandlers.S::kvmppc_interrupt_hv. Is that right?

Yes I hope so.

> Should that
> be documented in this comment as well?

Normally it can be assumed the registers not explicitly enumerated would=20
be unchanged from the interrupted context, so they would all contain=20
guest values. I added the R9 contents comment later because I changed
it later.

>=20
>> +	 * R12		=3D (guest CR << 32) | interrupt vector
>> +	 * R13		=3D PACA
>> +	 * guest R12 saved in shadow VCPU SCRATCH0
>> +	 * guest R13 saved in SPRN_SCRATCH0
>> +	 */
>> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>> +	std	r9, HSTATE_SCRATCH2(r13)
>> +	lbz	r9, HSTATE_IN_GUEST(r13)
>> +	cmpwi	r9, KVM_GUEST_MODE_HOST_HV
>> +	beq	kvmppc_bad_host_intr
>> +#ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>> +	cmpwi	r9, KVM_GUEST_MODE_GUEST
>> +	ld	r9, HSTATE_SCRATCH2(r13)
>> +	beq	kvmppc_interrupt_pr
>> +#endif
>> +	b	kvmppc_interrupt_hv
>> +#else
>> +	b	kvmppc_interrupt_pr
>> +#endif
>=20
> Apart from that I had a look and convinced myself that the code will
> behave the same as before. On that basis:
>=20
> Reviewed-by: Daniel Axtens <dja@axtens.net>
>=20
> Kind regards,
> Daniel

Thanks,
Nick
>=20
