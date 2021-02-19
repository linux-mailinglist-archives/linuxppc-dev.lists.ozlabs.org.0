Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF7831F585
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 08:57:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhkSP6V0Mz3cP0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 18:57:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Gi5MGv/j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Gi5MGv/j; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhkRy4HNjz30N1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 18:56:46 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id t11so3256069pgu.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 23:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ekN9LvX9U4vH9o2/Vi7b1aPbiYReA5ZUdjZXvD4sZMo=;
 b=Gi5MGv/j19bl8CPKrFrt+coko0rqTE7rRZ7l5QZNtRAncoFGr+8Z1zS0D80OOqmPrc
 iqTSNj0UINOu6slBAjgAgUbEk/o/N4L+4vtU1+ipllJ25xmBUse170J/NeCmlFnRPyD1
 Erq4P7/6cp/HpCh9oSMpXfTW19ARnAvkuTCz7qRL9VTxulCHWsdS/WI4llOwGWI/c4Mc
 5EdzJfFw1+pxgBWOWoqI3OETuG2v2bJ0rOZArh8aKYOd+fV2sJvIbHHLHUVcH0rmvnKj
 tIHvg22b7lQxPuZx9//bfDjYqxR5g4kFfosJv4ArWTJNV1lzuq4F8Fn+dVr8thrx95u3
 89gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ekN9LvX9U4vH9o2/Vi7b1aPbiYReA5ZUdjZXvD4sZMo=;
 b=HOXsdWc6afrJT4sOtllX+sEUuZIpudCIpKCWnLuK1DoMJC4mEYzh1lTJDn2Gnbjhji
 09bJX4nFjoE4ebWIJ8GWGC2ns4Q/ELdeYO51xe2JttBS18JkNEEJNLDjcHPUioXA5NJV
 5/AdajumCsSyHNv4g7bC+dGsDz4CLukRYeAlt/fCYIp4w1agaRkfjm1GNe+RqFcjhZSf
 FGrYvnf2jyKWF49WoHgdZdPRBo3hM6BPZpbEPzaRXulOfqwMpBjmq3zDjlU4XvmjFoHu
 lM4Aq5b47OCU+eSBchKMMdQKadt8fU8X67J7ec6UaD7iWea4XzmC43iW+MeTr+5A/eQl
 32pA==
X-Gm-Message-State: AOAM532768T+IQcpjM55mQ+K57s1cC/3hToixcEadVxaCgxrxKWJuPBO
 YkAuykOzNC4gGDuG4uxAa/ZBiAPOL4M=
X-Google-Smtp-Source: ABdhPJyeEYhwz3HXafStRLIruvSHpF5DfTWUIN93WPwnvEKPZyW4kLt76K8f6uASxWBoQu0n3UtsNg==
X-Received: by 2002:a05:6a00:1582:b029:1bc:fb40:4bd7 with SMTP id
 u2-20020a056a001582b02901bcfb404bd7mr8663801pfk.41.1613721404626; 
 Thu, 18 Feb 2021 23:56:44 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id jt21sm7746034pjb.51.2021.02.18.23.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 23:56:44 -0800 (PST)
Date: Fri, 19 Feb 2021 17:56:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 2/9] KVM: PPC: Book3S 64: Move GUEST_MODE_SKIP test
 into KVM
To: Daniel Axtens <dja@axtens.net>, kvm-ppc@vger.kernel.org
References: <20210202030313.3509446-1-npiggin@gmail.com>
 <20210202030313.3509446-3-npiggin@gmail.com>
 <87lfbka92i.fsf@linkitivity.dja.id.au>
In-Reply-To: <87lfbka92i.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Message-Id: <1613721231.c2s9q2jqjt.astroid@bobo.none>
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

Excerpts from Daniel Axtens's message of February 19, 2021 4:03 pm:
> Hi Nick,
>=20
>> +maybe_skip:
>> +	cmpwi	r12,0x200
>> +	beq	1f
>> +	cmpwi	r12,0x300
>> +	beq	1f
>> +	cmpwi	r12,0x380
>> +	beq	1f
>> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>> +	/* XXX: cbe stuff? instruction breakpoint? */
>> +	cmpwi	r12,0xe02
>> +	beq	2f
>> +#endif
>> +	b	no_skip
>> +1:	mfspr	r9,SPRN_SRR0
>> +	addi	r9,r9,4
>> +	mtspr	SPRN_SRR0,r9
>> +	ld	r12,HSTATE_SCRATCH0(r13)
>> +	ld	r9,HSTATE_SCRATCH2(r13)
>> +	GET_SCRATCH0(r13)
>> +	RFI_TO_KERNEL
>> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>> +2:	mfspr	r9,SPRN_HSRR0
>> +	addi	r9,r9,4
>> +	mtspr	SPRN_HSRR0,r9
>> +	ld	r12,HSTATE_SCRATCH0(r13)
>> +	ld	r9,HSTATE_SCRATCH2(r13)
>> +	GET_SCRATCH0(r13)
>> +	HRFI_TO_KERNEL
>> +#endif
>=20
> If I understand correctly, label 1 is the kvmppc_skip_interrupt and
> label 2 is the kvmppc_skip_Hinterrupt. Would it be easier to understand
> if we used symbolic labels, or do you think the RFI_TO_KERNEL vs
> HRFI_TO_KERNEL and other changes are sufficient?

Yeah my thinking was it's okay this way because we've got all the=20
context there, whereas prior to this patch those were branched to from=20
far away places so the names helped more.

If the discontiguity or nesting was any larger then yes I would say=20
naming the labels is probably a good idea (e.g., maybe_skip / no_skip).

> Apart from that, I haven't checked the precise copy-paste to make sure
> nothing has changed by accident, but I am able to follow the general
> idea of the patch and am vigorously in favour of anything that
> simplifies our exception/interrupt paths!

Thanks,
Nick
