Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 750B5354B01
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 04:45:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDsMQ3khzz3bqq
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Apr 2021 12:45:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oCphvhss;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oCphvhss; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDsLv2PQfz2yjM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Apr 2021 12:44:54 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id 11so7695815pfn.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Apr 2021 19:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=FZm+EBfOQgvjiADT1DUFSfdKoGcbMkOWnvlGZD1PacI=;
 b=oCphvhssbO2PhWCoIEYdTMKhVBPzrOcf5Q1FqsvhvxRWcnDYtq0XgBjalhDMY5h9Xb
 3cJxpEeAasev85V5NiEyKb/EVco+G7H+S30R+jpmAaPp+cpgXao2ORhofp+dB7rhPFqT
 GwGbUkaVYkSj+aUwBrodEtqpp4SiDsC78ivNN4aBSjTZ+yCFL404XTxZCFQLpfxcMjvx
 wh3J5mNnc1ji8nE1zP+C7TRQVe/88lJICTSMt3CTrxQlqzuxerI6LlSVq8YPm6bJj8T1
 LDKJ4VSziJE3R6kfBNFbUFSLlpOyAERldgsr2acIrl+ofHSmz52jtkoAtP6FKBu8Znkc
 ST2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=FZm+EBfOQgvjiADT1DUFSfdKoGcbMkOWnvlGZD1PacI=;
 b=A7fuR81icm8Y4Z/txyhbZp69zPa7nffgEsSqYRTW+K5Tai0N70u5l3HE4DdyoPuuby
 RWg9GvOfV6BDG5+l9YwHsLli2PSLJlWCRVRYN1E2yMG/Y7S11bA+kqN9w/1r5uJ3NB4f
 1EO/4vI0/qSN7GlehY+nLdhEtmaX+MQMEbtqbb+QFpBOz6SWHfd9ia5hqo/qtKdnJYTZ
 RbfLMcdRDpMOFxq8RC3c+d8bTbeOy+Iw38fyNH9gjgjyMShTSAI3MzINigzhTTRuNm67
 1YiANy8M7R96MtmK+VH1VkmfFhcC8zFChJBHJhHZBmO2ZaEASMVvIQF2Iiht12iwGsJp
 IMIw==
X-Gm-Message-State: AOAM530ECqW/vQ0QbYxJh9fkeF38tb7+9jC+0zo+VjuJr8aDXBlSaGKt
 uZSykkTWcnjWw3S7spO6B3s=
X-Google-Smtp-Source: ABdhPJwoWEZ6RmYbFxqD+A+FedYJxC1i6ORbby/bSg+LA9ABSLcl1CSMJrsUm/JYBeyOugHVe82gZw==
X-Received: by 2002:a65:6559:: with SMTP id a25mr25361420pgw.106.1617677090871; 
 Mon, 05 Apr 2021 19:44:50 -0700 (PDT)
Received: from localhost ([144.130.156.129])
 by smtp.gmail.com with ESMTPSA id v13sm16045664pfu.54.2021.04.05.19.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 19:44:50 -0700 (PDT)
Date: Tue, 06 Apr 2021 12:44:45 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 09/48] powerpc/64s: remove KVM SKIP test from
 instruction breakpoint handler
To: kvm-ppc@vger.kernel.org
References: <20210405011948.675354-1-npiggin@gmail.com>
 <20210405011948.675354-10-npiggin@gmail.com>
In-Reply-To: <20210405011948.675354-10-npiggin@gmail.com>
MIME-Version: 1.0
Message-Id: <1617676583.kyex3nxmbg.astroid@bobo.none>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of April 5, 2021 11:19 am:
> The code being executed in KVM_GUEST_MODE_SKIP is hypervisor code with
> MSR[IR]=3D0, so the faults of concern are the d-side ones caused by acces=
s
> to guest context by the hypervisor.
>=20
> Instruction breakpoint interrupts are not a concern here. It's unlikely
> any good would come of causing breaks in this code, but skipping the
> instruction that caused it won't help matters (e.g., skip the mtmsr that
> sets MSR[DR]=3D0 or clears KVM_GUEST_MODE_SKIP).
>=20
>  [Paul notes: the 0x1300 interrupt was dropped from the architecture a
>   long time ago and is not generated by P7, P8, P9 or P10.]
>=20
> In fact it does not exist in ISA v2.01, which is the earliest supported
> now, but did exist in 600 series designs (some of the earliest 64-bit
> powerpcs), so it could probably be removed entirely.

Hmm, I looked at a 970 manual and that does have a 0x1300, but 2.01=20
(which it implements) does not, if I'm reading correctly. Seems strange
the interrupt would be taken out of the architecture then implemented,
but not mine to wonder why. Maybe I misread something.

We support G5 in Linux but not HV KVM, maybe PR KVM is supported though?

At any rate it can't be removed from Linux 64s yet, and may be relevant
for PR KVM, but that should still be okay according this reasoning they
should not be applicable to SKIP interrupts.

Thanks,
Nick

>=20
> Acked-by: Paul Mackerras <paulus@ozlabs.org>
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index a0515cb829c2..c9c446ccff54 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -2553,7 +2553,6 @@ EXC_VIRT_NONE(0x5200, 0x100)
>  INT_DEFINE_BEGIN(instruction_breakpoint)
>  	IVEC=3D0x1300
>  #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
> -	IKVM_SKIP=3D1
>  	IKVM_REAL=3D1
>  #endif
>  INT_DEFINE_END(instruction_breakpoint)
> --=20
> 2.23.0
>=20
>=20
