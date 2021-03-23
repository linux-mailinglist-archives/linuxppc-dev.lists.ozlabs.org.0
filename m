Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 699F9345B53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 10:49:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4RRD2zZQz30gg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 20:49:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dCwBg30e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dCwBg30e; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4RQp4lt4z302s
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 20:49:05 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso9877374pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 02:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=c1kuMFGWEbTOeFhDqSYJCZMejdonWc5t7uysZdJ61Xg=;
 b=dCwBg30eq7kvsgo/KtoSqLNtbWKmVgtrpPAwvBXo1gnVhDObcOBvp0TsB/tXB0WKsG
 N9F1Y4uCPGm5Tw/mj409OgYFHHwqIzbjT97f4zKHRPierYL5pOYvT/6dGbSgE0xCRJuR
 t1lA0LJYXBwyFqgppJh3iQLkTaxJmDfOUKDCDVZ2vgtzB1vSp6IQSDrhjdlZxlE/USAs
 XDXZcoWoyMO27OuvBRHFCLl+qwv+C+82ZmNrW/V+7GXBC9EOQcznUmmtdT1dBAUE16Ds
 mDCi2IICdzBPz/4Nj9yOse0QbsugBJyvZEdMI3yGMH3rxn/08FS3FrYsrHUDBNCzH0Zk
 BX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=c1kuMFGWEbTOeFhDqSYJCZMejdonWc5t7uysZdJ61Xg=;
 b=TKbli1YesKQL0Ds1T5DaLE987PitQdiFg7vWFejSgFXaAa8TMkY3RuS193Jc4xkP4h
 9BRh+uSvGkRFcCQU6NOlXGAJnqJzIRA+fbcNMbuMxLYvdey0f6MzNaiW/nL2KQHRQPY4
 3sSRLvlOLmfsKFp2WcZ/pEhXFyPjAijVbe59eINFANgAPOlN0RFlxJoSKtg0FZZQYoRd
 pHS3noVBo4wUeRrIygjqKNSEThBTPvUSbDzbr9tbMVGmDVe+mAFrmORXE7+i2UpSwzS2
 Q0hWZqlLb5solCmFFHNqRTuAg05oN3QcFV4op/ZY/cV91G0suSOaq/5aLBptzDXIrzSl
 kt8w==
X-Gm-Message-State: AOAM533ticFOhKCSmhA1fAOSpmg2AkNxSSySPsPkz6bCWr+dBSBguvu5
 UoF3sZQAonPGThnMxkMOwQk=
X-Google-Smtp-Source: ABdhPJwTA/SMB23drVhANK+kBQOX7U1rMdAEfO8vZlCydkn8E2Fd4H7asUOKskWbdhNlVCco9RxEkg==
X-Received: by 2002:a17:90a:d801:: with SMTP id
 a1mr3761057pjv.84.1616492943289; 
 Tue, 23 Mar 2021 02:49:03 -0700 (PDT)
Received: from localhost ([1.132.174.211])
 by smtp.gmail.com with ESMTPSA id q95sm2255130pjq.20.2021.03.23.02.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 02:49:02 -0700 (PDT)
Date: Tue, 23 Mar 2021 19:48:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 22/46] KVM: PPC: Book3S HV P9: Stop handling hcalls in
 real-mode in the P9 path
To: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-23-npiggin@gmail.com>
 <6901d698-f3d8-024b-3aa1-47b157bbd57d@ozlabs.ru>
 <1616490842.v369xyk7do.astroid@bobo.none>
 <994fb056-4445-4301-faca-b53394fb6b35@ozlabs.ru>
In-Reply-To: <994fb056-4445-4301-faca-b53394fb6b35@ozlabs.ru>
MIME-Version: 1.0
Message-Id: <1616492251.gsmvgdqq5o.astroid@bobo.none>
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

Excerpts from Alexey Kardashevskiy's message of March 23, 2021 7:24 pm:
>=20
>=20
> On 23/03/2021 20:16, Nicholas Piggin wrote:
>> Excerpts from Alexey Kardashevskiy's message of March 23, 2021 7:02 pm:
>>>
>>>
>>> On 23/03/2021 12:02, Nicholas Piggin wrote:
>>>> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kv=
m/book3s_hv_rmhandlers.S
>>>> index c11597f815e4..2d0d14ed1d92 100644
>>>> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>>>> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>>>> @@ -1397,9 +1397,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>>>>    	mr	r4,r9
>>>>    	bge	fast_guest_return
>>>>    2:
>>>> +	/* If we came in through the P9 short path, no real mode hcalls */
>>>> +	lwz	r0, STACK_SLOT_SHORT_PATH(r1)
>>>> +	cmpwi	r0, 0
>>>> +	bne	no_try_real
>>>
>>>
>>> btw is mmu on at this point? or it gets enabled by rfid at the end of
>>> guest_exit_short_path?
>>=20
>> Hash guest it's off. Radix guest it can be on or off depending on the
>> interrupt type and MSR and LPCR[AIL] values.
>=20
> What I meant was - what do we expect here on p9? mmu on? ^w^w^w^w^w^w^w^w=
^w

P9 radix can be on or off. If the guest had MSR[IR] or MSR[DR] clear, or=20
if the guest is running AIL=3D0 mode, or if this is a machine check,=20
system reset, or HMI interrupt then the MMU will be off here.

> I just realized - it is radix so there is no problem with vmalloc=20
> addresses in real mode as these do not use top 2 bits as on hash and the=20
> exact mmu state is less important here. Cheers.

We still can't use vmalloc addresses in real mode on radix because they=20
don't translate with the page tables.

Thanks,
Nick
