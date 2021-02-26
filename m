Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF00326A86
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 00:52:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnRKG6X2kz3d28
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 10:52:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mD3B2eHe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mD3B2eHe; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnRJs0sxxz30N0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 10:51:57 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id o10so7172002pgg.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 15:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=zVCQxsICbHOyHh30iPPaVoEQs8OioKHBSxz33rSHcf4=;
 b=mD3B2eHeDq/3NzRnAestA7yjVEPuvNOzLGGpB6ngH8PMpjFbJRWc1+pQSN+8AiSqsP
 DgUAp/1Ms0fEby5Px3CAjG/vPmkcMvmbbqk5y0egLrxKYlc9X8ClhqNWG7MmcU9UcG/J
 3qo6vhx7Pp2VjVpktDYOP+jqwqyhWFbudqr3dwDL/lMGWT+09TiDIKw492KItrQxhx3v
 PEbT0cdoqHvkGaQemT1jufxFZgpNiTPLDuFgWeQKJNG3+H6dHKqKDl9lI74I0bHgx59C
 ugyhzt5D2IwVWPo7y9tQY/0uvXzWyquvK2CKigQq1RMCRA1mvGEwFzceRkMpsmpCCgCo
 WhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=zVCQxsICbHOyHh30iPPaVoEQs8OioKHBSxz33rSHcf4=;
 b=EgP/vKmw8V4Ir5VO51tSZw5JmLfPeswUgJ9IR9FNgb8GV+rbc58SwnHcE4J7cWgI3l
 q7+UPIr40vC4Ei2LysX1VPwlYWI05kh7WOpjISPH48ekAJmgWL+v3dshLyAANr8ZtVFL
 xBRFDHk3QElUWHTIpmw91hKKX2+4SmA4Ka1iQl39BBLB7Z7Bld8NMc1FTJtsA7cTp2Yn
 mEOi4G1uwxG8Gi/DvM+ZPgoMKvKcCIWxMTo2IRGWuVqvGK5rP7F1t6pLIDZ41ueUMVQE
 /vxtIq5yQmiCEr9rhOMGA+69eGPAsoi2eBiDJHPgRNseJJwL85WEFdgKSxmi7mZAbCGn
 LYZQ==
X-Gm-Message-State: AOAM532+DT0ZFDtjy1AYxWWDaudnYRlyjkDDUpUlwuMHq4hYEdIyS+In
 hXgidT3PCWzGa0mxT19DRxk=
X-Google-Smtp-Source: ABdhPJwZY6m/MjM2b//hidlAPFT6ke+QB6OZJd+f2tGf9SMVLmRqQADn3ixWL0gPxAHUboju5VG5+Q==
X-Received: by 2002:a63:4c2:: with SMTP id 185mr4857054pge.75.1614383513772;
 Fri, 26 Feb 2021 15:51:53 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id o23sm10796887pfp.89.2021.02.26.15.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 15:51:53 -0800 (PST)
Date: Sat, 27 Feb 2021 09:51:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 04/37] powerpc/64s: remove KVM SKIP test from
 instruction breakpoint handler
To: Daniel Axtens <dja@axtens.net>, kvm-ppc@vger.kernel.org
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-5-npiggin@gmail.com>
 <8735xj9yd4.fsf@linkitivity.dja.id.au>
In-Reply-To: <8735xj9yd4.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Message-Id: <1614383420.qkrnr8p53z.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Daniel Axtens's message of February 26, 2021 3:44 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> The code being executed in KVM_GUEST_MODE_SKIP is hypervisor code with
>> MSR[IR]=3D0, so the faults of concern are the d-side ones caused by acce=
ss
>> to guest context by the hypervisor.
>>
>> Instruction breakpoint interrupts are not a concern here. It's unlikely
>> any good would come of causing breaks in this code, but skipping the
>> instruction that caused it won't help matters (e.g., skip the mtmsr that
>> sets MSR[DR]=3D0 or clears KVM_GUEST_MODE_SKIP).
>=20
> I'm not entirely clear on the example here, but the patch makes sense
> and I can follow your logic for removing the IKVM_SKIP handler from the
> instruction breakpoint exception.

The example just means that a breakpoint interrupt on any instruction=20
inside the guest mode skip region would be skipped, and skipping one of=20
those (mtmsrd or store that gets us out of guest mode skip) would cause=20
a crash.

Thanks,
Nick

>=20
> On that basis:
> Reviewed-by: Daniel Axtens <dja@axtens.net>
>=20
> Kind regards,
> Daniel
>=20
>>
>> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kernel/exceptions-64s.S | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/=
exceptions-64s.S
>> index a027600beeb1..0097e0676ed7 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -2553,7 +2553,6 @@ EXC_VIRT_NONE(0x5200, 0x100)
>>  INT_DEFINE_BEGIN(instruction_breakpoint)
>>  	IVEC=3D0x1300
>>  #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>> -	IKVM_SKIP=3D1
>>  	IKVM_REAL=3D1
>>  #endif
>>  INT_DEFINE_END(instruction_breakpoint)
>> --=20
>> 2.23.0
>=20
