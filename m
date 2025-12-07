Return-Path: <linuxppc-dev+bounces-14673-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DF5CAB1A4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 07 Dec 2025 06:14:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dPCwD0xmhz2xQK;
	Sun, 07 Dec 2025 16:14:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c2d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765084476;
	cv=none; b=YsMvsw4/wzxVgwt6Hg8cHWUmJCupqz5ZiDqU33z0OOU1xw5nGG1xn9a8fgQqUlp2lhcQDvS/WW6MSRfEGbTlB9+rzAPVTb4HF8r3fu9Ivno0OtL7FBQ49ng4qDHI89yL416Px6Cz/Z8OWl/iWiuHk2DPYi6PFVXeWf3Rz+YCxRWz6MUKaaFwDHCR3tEEe5c/nf/iBgYURT9ChSOHb8A/MpAvkp+A3qK+oVr4PiAWsWiRW9T5m6K8EIyy4UiMITLqCJx+VEmH00mJOVn+/IUIhJuIM3Blen3yYkm6f2RxQl9jmcZ70CUcbsWhOhDZku1Shb0pUvMQykV4xKm5t1+veA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765084476; c=relaxed/relaxed;
	bh=gIr6vMU+1WXTpE+kuQ5XIOvR7lhOKuME2h0aehuNw7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZkrbrUDokLCk3ynb56txkfOilWgs6bmky7byEH6ypN4jJk9f20lVb5fb86L1KxmFAskLX29XPB0HZ+zNAPzpeSTObAaLMH65cQDLcNEu9vbtPZ7BcO/9ASXBRDQOkz3mIhQNkPlAWPVz1RNx4Nfxz1HRD5nIjLUw0OGq9OGQfszSoWZ0TUomBLo2M/ectkn89qUcLJcyRJC4ajhyYrrCAkbGD5/MV2ll/a4/ftRxrGhedTBHMILWx7RZowbsbjlPOA9DOJJNM/tVoNoFTIzajnI7gSfNnVXwrWSdJ2aJu4EXGfyRxcjU1RoaScIpHly3TbD4RoV0fO6Nmx8an4e9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=brainfault.org; dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=phrkxkMd; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com; envelope-from=anup@brainfault.org; receiver=lists.ozlabs.org) smtp.mailfrom=brainfault.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=phrkxkMd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com; envelope-from=anup@brainfault.org; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPCw96R5bz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Dec 2025 16:14:31 +1100 (AEDT)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-657c68a08a7so1790157eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 21:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765084464; x=1765689264; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIr6vMU+1WXTpE+kuQ5XIOvR7lhOKuME2h0aehuNw7U=;
        b=phrkxkMdxezlXcCdgRSSwtFrvoGJRvYBZYbuqLrmqzzovr2WSUum7mn+Wq15OPVsMr
         NjkiouPHZ3IntEUwK14Ol+g3MipmNpaRaxHCQBSMkHKxpcaONaUhavk7TaC3l99wQgA5
         VOXCfetdBmSNEZevGi80NTSYcg+8xq/E133i2FGJ90wMyQRDoa6Axpw811ITTPxSK0tI
         g+2fIZijbtd7q1F9e/8OfZPcPV2pwhN69crwKp4J9tJPCNK8FWq87xC65uH4yMPnSYo5
         HtmtTLtl6LH8SIQpQy5Etv+OhwYircJuTaU3+gtelsjyZgLfclsk423QwdxSqhU9Oad1
         4AWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765084464; x=1765689264;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gIr6vMU+1WXTpE+kuQ5XIOvR7lhOKuME2h0aehuNw7U=;
        b=m0BC7GeOQWZSIddfvfdhF0IRqRi4b1z1hBilAdSr1mlAui0rnSM/cHkVXwi7aWbnui
         J5H+hHfDeECFPVQ0pczAreSQ3uIQJIYMXuR4nCpO8TWLRUdD2FgtHjhjfkpAdKN4IEIJ
         wOeB1Cj8GtDpuo0DZa47kQ3+ylOMz1d4eT42HTUYUUtaQZ9l4PuSTLQ1LsVhOQcqg7e2
         17OAar6PSDEQCqaytP3H3uHjXVPdif/Fl5GUh9yjuI+yVnEhVxTiFouZxPNHHYMcWVp1
         cvTydyUUT9VF/dR4rUfqdqGbJjF1/qM/9qeCDSxo7cqH0QL7nlucWVl81fM8Rij9cXvg
         jHNw==
X-Forwarded-Encrypted: i=1; AJvYcCV6G05pZzDT/JuXnadY5Q6Agw4RghVwyOnTbzlt+pUOqqDSrIyW9tpnwYdjfRjnDNrK4NuQutloXvCUx+A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz/FRZNGgufe+lMXSJ2s+kAIHjWmb5C89XkZVZ5L7BDCqdF52kr
	vpW1ED0Wyt4i4AU3nGUWqEXy8w2iiedZktXX77KUIOOm94fjcWLyfKlZdrEsSjePcBoiif3IoHA
	3IX5tdBer5+OJ4O34aMFHarkUhenbe8exaG/vogauhw==
X-Gm-Gg: ASbGncuni9WxHNQK1eMBPWeYBot3nUDaipv6DL7+R1tc6OzMZ6uprBvkdzjGcJfqlTU
	7R0XFn+nIjLTjRzXfUtj0KI0Em9jA7JzzlAxClZktByoVYmMKhCY3GLat2Zw1U/psqkTpVqLTVF
	ImMMvKNWwNSHzFAWb2ZdZebs6emIRGcP6l1UqTOAPH7Q9pq3lDVe3K8rG/mZoi+acuNNMLLNx5w
	lufqRIZqJ7IdQE3G9MkSdRaxRwEHEfnfzhm7pzN4j+036iCPe1s4Yau+RAjWS6AtAJg26iP
X-Google-Smtp-Source: AGHT+IH3teezYiglKMW0l9sCwPDXKzHK/uYMVzLl99zBL+8tY4BEmXzPQzc7f6ucWRYnVm2fOg07KrRcgASdUHrgci4=
X-Received: by 2002:a05:6820:f030:b0:659:9a49:8f73 with SMTP id
 006d021491bc7-6599a973da4mr2018657eaf.56.1765084463840; Sat, 06 Dec 2025
 21:14:23 -0800 (PST)
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
MIME-Version: 1.0
References: <20251205232655.445294-1-seanjc@google.com>
In-Reply-To: <20251205232655.445294-1-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 7 Dec 2025 10:44:13 +0530
X-Gm-Features: AQt7F2qP99gde5P8lRQoinF2DOSDMpaUpigWBx6hvnDvXPL66vGpk9e2egXMZ2I
Message-ID: <CAAhSdy1cPnxjntaR=cwZqG+oVgFpZKM0rKYAEdkHUCToMvN0Ag@mail.gmail.com>
Subject: Re: [PATCH] KVM: Remove subtle "struct kvm_stats_desc" pseudo-overlay
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Dec 6, 2025 at 4:57=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> Remove KVM's internal pseudo-overlay of kvm_stats_desc, which subtly
> aliases the flexible name[] in the uAPI definition with a fixed-size arra=
y
> of the same name.  The unusual embedded structure results in compiler
> warnings due to -Wflex-array-member-not-at-end, and also necessitates an
> extra level of dereferencing in KVM.  To avoid the "overlay", define the
> uAPI structure to have a fixed-size name when building for the kernel.
>
> Opportunistically clean up the indentation for the stats macros, and
> replace spaces with tabs.
>
> No functional change intended.
>
> Reported-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Closes: https://lore.kernel.org/all/aPfNKRpLfhmhYqfP@kspp
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

