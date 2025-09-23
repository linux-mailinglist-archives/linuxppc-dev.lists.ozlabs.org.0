Return-Path: <linuxppc-dev+bounces-12536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D295DB960BE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 15:40:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWLhr0RvGz2yqg;
	Tue, 23 Sep 2025 23:40:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758634843;
	cv=none; b=oMtUc7DLK7CXAlBkC0qO1GomTJv58XqqoCssRJyP0kNt9xr40o94J3XYZhUyGE+021gT4fKRIMsaL4hn/vQUhJTpDiiPLWP3mdjAtQFv74ggUaXiIqQzug59nKiFIivu5dc6toeHu1gyD6vcx8xY0iqufCt6mYgpZ0aA4sIzacyV6BK2Z/LwU01Lhl+qWwOFjNKw61iMToFTO01UayZUqjFpT0ErUow51Vskms3yGQj7Y3j/Ec5AqXJqEY59zadTXdf+wdNNfy8/i13voYj2ogInQZgKW1CFO5mXL+5xbVoXATWnrKi28MCzMUg7yrIxPJtKtmaxaZV+76QQ0EtOxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758634843; c=relaxed/relaxed;
	bh=Q+q1ANiVdqE4PLX6BxhbC6Ed2UomSL/7PeR7UsDBlsI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=noSG4TrL638tDC1ex9IzzZcCyPtCdlKW67l/l5Bly5pDetrAaNEW8nxKx5GHGENokmTk/1NggoTyY5gmW2/7Go7DHrpRKWfVDYQTt9NDsTx+bmVx9GMcoBcR1sDtMCW2PWcRgAROwPU15t3kfjjH770zzkwvA/a/K7fNpFqBaiPKU+jCja7XrssRUNCQA/tpl2nTW8Ljj9MaQX7Hx/J+B8F1f9g9pH3zYqDP4eJy81DYAzivP3cG1lVgDLUmHOdduaFlsLh4y98oMR3CgRosITKSzV+9Z18oJNIbEG0pIkAqS2OjPJ/9MIT0ZZBS0YJPbun0lnyMXbx3F3+eQCjVyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Vla+XcsL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3v6psaaykddykwsfbuyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Vla+XcsL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3v6psaaykddykwsfbuyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWLhp2jzRz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 23:40:41 +1000 (AEST)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2681623f927so53965245ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 06:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758634839; x=1759239639; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+q1ANiVdqE4PLX6BxhbC6Ed2UomSL/7PeR7UsDBlsI=;
        b=Vla+XcsLkyvyZIuKyQtmq0y+gKzmTspdsp3RSDkVelbROeovWcr1jg4pd94H2i8fR/
         3RrCKgPEjGQOmk8w9Lg8n6zdcnxNTg9SI9k2JU5bathoc8Z4HUjIDXDBy818jE/8TQ+L
         Pv+YKTswzR3WCVkxLfTNo0WTSXMcJxJ1W7bhqnkwNUQ2Qg6Va+nElkRP5TMvYXM+zij/
         t3OnM2N6q9/LjGI3vFmzWRlfMkx+ZTSokAw/RZKg4xlfr22thDqk4/EanFpMvGP9Lpu8
         NuxFAzsT/GvRZyBMLJNgve7pPpd4M9lg/Pp6EOydvGkYVLxhplC0Jx3t6epS8+IceG5U
         xORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758634839; x=1759239639;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+q1ANiVdqE4PLX6BxhbC6Ed2UomSL/7PeR7UsDBlsI=;
        b=BjKpNTAUsp2a/2JGMvOVsM7/THmPcUWehVo0sssKdHXTblAM0BdNpVU82dKvg+uocc
         SqJVvg+yJd5HNVzLlScfe3nskOBMIrJOI7rlwt0jb3HvyvKQUbb24uTD16sGePTM8Zjh
         n64UNlGwdRtit8NXZ77rPlBXGf7kvYmcSU7bY/3nXfP0D7Ge9rDr1/BIwNNf9EIRmapX
         4O9t6++suLpiJt31hfZXr9dZD9Kw7/ra+r4E35d3ed7dJPG2rE8ekSkef+eYuQihf3JM
         KuIJZZ6hOFBxSfBel9Ld+VukDYN37dZIhO6UHmpQAiXeMNTuc3Fx1F9bu47MN3opBSFu
         UccQ==
X-Forwarded-Encrypted: i=1; AJvYcCW91VTg7VJPMmhJ5Tax3vWzmn+04AIzLXnPPVrdm23E28PTTi8q88+D4MpPCH6XhoDqSBDPQAdH4FfU+BI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YztljlN4bZ/VUx6hGAUd2C+BQ0XUJj27EfrkC1eKwOeOLLVcZsi
	KBwPpRjEY0R5yh0Rl3iQOzUkJKtmmHAkNsZH2W6jmTz1OIH40z+05K8xicqg2SwGax37mbJdu63
	J2Z8hPg==
X-Google-Smtp-Source: AGHT+IH1umU0hviOHL6mfJrfC/KblA1ofkjZSfEzaisGwPHRVVBGNbnvXRYWg5KI7SU4qrTt9g98pjrjG4g=
X-Received: from pjbnd17.prod.google.com ([2002:a17:90b:4cd1:b0:32e:b34b:92eb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2446:b0:275:2328:5d3e
 with SMTP id d9443c01a7336-27cc3eee458mr34116465ad.18.1758634839306; Tue, 23
 Sep 2025 06:40:39 -0700 (PDT)
Date: Tue, 23 Sep 2025 06:40:36 -0700
In-Reply-To: <20250923012738.GA4102030@ax162>
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
Precedence: list
Mime-Version: 1.0
References: <20250919003303.1355064-1-seanjc@google.com> <20250919003303.1355064-3-seanjc@google.com>
 <20250923012738.GA4102030@ax162>
Message-ID: <aNKjVLpajXCKfqr_@google.com>
Subject: Re: [PATCH v2 2/5] KVM: Export KVM-internal symbols for sub-modules only
From: Sean Christopherson <seanjc@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Holger Dengler <dengler@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 22, 2025, Nathan Chancellor wrote:
> Hi Sean,
> 
> On Thu, Sep 18, 2025 at 05:33:00PM -0700, Sean Christopherson wrote:
> > diff --git a/arch/powerpc/include/asm/kvm_types.h b/arch/powerpc/include/asm/kvm_types.h
> > new file mode 100644
> > index 000000000000..656b498ed3b6
> > --- /dev/null
> > +++ b/arch/powerpc/include/asm/kvm_types.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_PPC_KVM_TYPES_H
> > +#define _ASM_PPC_KVM_TYPES_H
> > +
> > +#if IS_MODULE(CONFIG_KVM_BOOK3S_64_PR) && IS_MODULE(CONFIG_KVM_BOOK3S_64_HV)
> > +#define KVM_SUB_MODULES kvm-pr,kvm-hv
> > +#elif IS_MODULE(CONFIG_KVM_BOOK3S_64_PR)
> > +#define KVM_SUB_MODULES kvm-pr
> > +#elif IS_MODULE(CONFIG_KVM_INTEL)
> 
> Typo :) which obviously breaks the ppc64_guest_defconfig build.
> Changing that to CONFIG_KVM_BOOK3S_64_HV fixes it.

Argh, so many flavors of PPC KVM (says the x86 person :-D).

> > +#define KVM_SUB_MODULES kvm-hv
> > +#else
> > +#undef KVM_SUB_MODULES
> > +#endif
> > +
> > +#endif
> 
> Also, you'll want to drop kvm_types.h from generic-y to avoid
> 
>   scripts/Makefile.asm-headers:39: redundant generic-y found in arch/powerpc/include/asm/Kbuild: kvm_types.h
> 
> diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
> index e5fdc336c9b2..2e23533b67e3 100644
> --- a/arch/powerpc/include/asm/Kbuild
> +++ b/arch/powerpc/include/asm/Kbuild
> @@ -3,7 +3,6 @@ generated-y += syscall_table_32.h
>  generated-y += syscall_table_64.h
>  generated-y += syscall_table_spu.h
>  generic-y += agp.h
> -generic-y += kvm_types.h

Thanks much!

>  generic-y += mcs_spinlock.h
>  generic-y += qrwlock.h
>  generic-y += early_ioremap.h
> --
> 
> Cheers,
> Nathan

