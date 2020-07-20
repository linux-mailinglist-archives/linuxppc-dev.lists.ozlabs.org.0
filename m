Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A18DE2255A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 03:54:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B94YD6C8NzDqNg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 11:54:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Vr7Xzz4l; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B94WY0fKhzDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 11:53:27 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id c25so10997015otf.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jul 2020 18:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TOIR1xA5sY1eNWHjg5kE4RiFG7INhNHarb087xmB/Qw=;
 b=Vr7Xzz4lZf2QNsKHilp6aPXNyBihOJyQ57UBJMekVYFPGCH18uwWDtRpjBsQ3doXWk
 R4Is5gEIStBMRJLjmn4egcdpJevEcaVfTh7zPGXCl3dQJDQJKYGDuUGo0b1hjcFxD64w
 zVXTvUDPsduB6IHBS3EWobUl6DIA1XxWLuQoeJ16GR2qcsdq+PmHMWlnoduCNhKpUOEW
 i8kGCgrV0+RtGUWRyVzcRwaYgDRsIT4HOtZsQsmmaoZM7EHFqjsemvS7RQI5Bs92vD54
 j+QxWdYibN1TFDDmelzQpQloxLKTREuxYv+IIepOHdbnmLuDV95VvwPv94JW264ZZ+NF
 Q9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TOIR1xA5sY1eNWHjg5kE4RiFG7INhNHarb087xmB/Qw=;
 b=NUz/VrmGi75QyDtjf7x/JDoBUebXG1cX+AQAd7rG7A+3aOEWUPD4Pz83wbnXOrHKdq
 ImoH1kTvltUSUA1tcv6r1m8+7VzP/RSWo3H5iG8OsXdNwG6Wy/bATFZOynjC8r/EgxbB
 jH2L/3mRD+z9E/6/uuXi/Aqw5pXj9GhYOFLJcbhzaDdp9j9o7d/RfIrc8bvnUN0Ix/6h
 8AKBWSaoi9og+mXt6acTOvidb3+hSVYn5xu9IM9zl0eh7LMZfnpVbmliHZ3bHBJCsnla
 n6/YbUpxJ50OdD849oRW6hm63PQEHVA/9jIO47hXi6G2a/mXi8XvSpt94+14Yk4B/0l4
 GxyQ==
X-Gm-Message-State: AOAM533jt1lA8j22/NnM757CoxjjC8A8A2JbmRGgycsoOrNS/b5sqGp0
 6BMUhlBYb7GhHKPpmfdL2fbzENGMqYGfdAyibJs=
X-Google-Smtp-Source: ABdhPJwga60s4e0u6T7eKY/7B9Nxa7rDHN5XoJyiBMHq1oZKKPKs1R2I4rw4wnPeMaFvwI4glA2SNyW7iuqz5MNcVaw=
X-Received: by 2002:a9d:7f06:: with SMTP id j6mr17641938otq.51.1595210005246; 
 Sun, 19 Jul 2020 18:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200717040958.70561-1-ravi.bangoria@linux.ibm.com>
 <20200717040958.70561-8-ravi.bangoria@linux.ibm.com>
In-Reply-To: <20200717040958.70561-8-ravi.bangoria@linux.ibm.com>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 20 Jul 2020 11:50:07 +1000
Message-ID: <CACzsE9pipmQAYvYBtf13D+ZkM2jp2=os=ugi-28mjpwouM3Ahg@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] powerpc/watchpoint: Rename current H_SET_MODE
 DAWR macro
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, apopple@linux.ibm.com,
 mikey@neuling.org, miltonm@us.ibm.com, peterz@infradead.org, oleg@redhat.com,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, jolsa@kernel.org, fweisbec@gmail.com,
 pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 17, 2020 at 2:11 PM Ravi Bangoria
<ravi.bangoria@linux.ibm.com> wrote:
>
> Current H_SET_MODE hcall macro name for setting/resetting DAWR0 is
> H_SET_MODE_RESOURCE_SET_DAWR. Add suffix 0 to macro name as well.
>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Reviewed-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/include/asm/hvcall.h         | 2 +-
>  arch/powerpc/include/asm/plpar_wrappers.h | 2 +-
>  arch/powerpc/kvm/book3s_hv.c              | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index 43486e773bd6..b785e9f0071c 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -355,7 +355,7 @@
>
>  /* Values for 2nd argument to H_SET_MODE */
>  #define H_SET_MODE_RESOURCE_SET_CIABR          1
> -#define H_SET_MODE_RESOURCE_SET_DAWR           2
> +#define H_SET_MODE_RESOURCE_SET_DAWR0          2
>  #define H_SET_MODE_RESOURCE_ADDR_TRANS_MODE    3
>  #define H_SET_MODE_RESOURCE_LE                 4
>
> diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
> index 4293c5d2ddf4..d12c3680d946 100644
> --- a/arch/powerpc/include/asm/plpar_wrappers.h
> +++ b/arch/powerpc/include/asm/plpar_wrappers.h
> @@ -312,7 +312,7 @@ static inline long plpar_set_ciabr(unsigned long ciabr)
>
>  static inline long plpar_set_watchpoint0(unsigned long dawr0, unsigned long dawrx0)
>  {
> -       return plpar_set_mode(0, H_SET_MODE_RESOURCE_SET_DAWR, dawr0, dawrx0);
> +       return plpar_set_mode(0, H_SET_MODE_RESOURCE_SET_DAWR0, dawr0, dawrx0);
>  }
>
>  static inline long plpar_signal_sys_reset(long cpu)
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 6bf66649ab92..7ad692c2d7c7 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -764,7 +764,7 @@ static int kvmppc_h_set_mode(struct kvm_vcpu *vcpu, unsigned long mflags,
>                         return H_P3;
>                 vcpu->arch.ciabr  = value1;
>                 return H_SUCCESS;
> -       case H_SET_MODE_RESOURCE_SET_DAWR:
> +       case H_SET_MODE_RESOURCE_SET_DAWR0:
>                 if (!kvmppc_power8_compatible(vcpu))
>                         return H_P2;
>                 if (!ppc_breakpoint_available())
> --
> 2.26.2
>
