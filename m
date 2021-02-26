Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E846B326A89
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 00:56:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnRPz5sPfz3ckd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 10:56:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Q1fLeF3l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Q1fLeF3l; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnRPZ6l6lz30N4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 10:56:01 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id b145so7321550pfb.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 15:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=0iWVAUcrQ7hjmdJNydWlz82tvQ4nt8XRr82kvlydDIA=;
 b=Q1fLeF3lqbYpiR5g0v0wdeHI8aoqRL1oLCUzJBCXzZ8QKR/7DkZEOQLaPewS4wLwV/
 UCVzlB161Mp7m0TqJCF6r66V5Z5CcxTGT8fnQrtPL/XsIjFJptbOlm6NrdiALNs6Me7s
 8yEgqqQOUL67Wy0oMe/KdzzOQSLgKXKpLRGznrdm7PwCmxSyRV8oQkdk+zxayzJ/zfg+
 IuVwvQWBesGEWJfVqZp2nEoSa/MHRuEabYQBE6+rWCagIheV2gTBADnT3Gfc8UOLSVmf
 VAITd34CEiZuIgcKQXkUsBo9c3JJ9hqJQTdkN0ljvpi0Rc9Jkt8Om1m5CFQlCSltY2XH
 le9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=0iWVAUcrQ7hjmdJNydWlz82tvQ4nt8XRr82kvlydDIA=;
 b=kTVJNbOSjhF6CxynRleL9xFoDCeA+Kab0oxeJ1uLp2+x7wDcRtmuGQRg5cCeMaCLeV
 jVv5hCz+9Gd3zByT7ozZ8oYPWJta7F4ziAFzLej2pu64DD/e4cq2JjMBLLbD9uqPUgBi
 TxyZ1U0xjHCntbDaC7kKpo5zDdYWW55KPRAwpUWmfU6z7gNh4Sd1q+gQ2lnQxKrkoTcd
 rw7g9xK7d74CoqN0d2nECVMgdQDF7GTpjCuwAN805fmNScCFDxLy/GiUQkL3qPaHAr2N
 yHwDkdOKbcDtM8vLs8QqRCgC39HTkVOWB9Zzn6lLhLStEGhzTIZ9AXTWabI362nOgSdT
 jD8g==
X-Gm-Message-State: AOAM532hHYDHDtTAEOIJYmlhXLZOepfPiZPNYV1yiifO2htZOezkqajs
 UcMvZPZlMWWIiW8tSSUpGCfxHoXryrc=
X-Google-Smtp-Source: ABdhPJy1nC9H0MWkQjtzqChMteHynP/Gcsj+WZiio4QgAAraqoxOhhNEGze8PfMNMmkGnCVzEJk3XA==
X-Received: by 2002:a63:cb52:: with SMTP id m18mr5007435pgi.358.1614383758468; 
 Fri, 26 Feb 2021 15:55:58 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m12sm9398356pjk.47.2021.02.26.15.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 15:55:57 -0800 (PST)
Date: Sat, 27 Feb 2021 09:55:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 05/37] KVM: PPC: Book3S HV: Ensure MSR[ME] is always
 set in guest MSR
To: Daniel Axtens <dja@axtens.net>, kvm-ppc@vger.kernel.org
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-6-npiggin@gmail.com>
 <87zgzr8is2.fsf@linkitivity.dja.id.au>
In-Reply-To: <87zgzr8is2.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Message-Id: <1614383549.rxe6rxw7w8.astroid@bobo.none>
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

Excerpts from Daniel Axtens's message of February 26, 2021 4:06 pm:
> Hi Nick,
>=20
>>  void kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 msr)
>>  {
>> +	/*
>> +	 * Guest must always run with machine check interrupt
>> +	 * enabled.
>> +	 */
>> +	if (!(msr & MSR_ME))
>> +		msr |=3D MSR_ME;
>=20
> This 'if' is technically redundant but you mention a future patch warning
> on !(msr & MSR_ME) so I'm holding off on any judgement about the 'if' unt=
il
> I get to that patch :)

That's true. The warning is actually further down when we're setting up=20
the msr to run in guest mode. At this point the MSR I think comes from
qemu (and arguably the guest setup code shouldn't need to know about HV
specific MSR bits) so a warning here wouldn't be appropriate.

I could remove the if, although the compiler might already do that.

>=20
> The patch seems sane to me, I agree that we don't want guests running wit=
h
> MSR_ME=3D0 and kvmppc_set_msr_hv already ensures that the transactional s=
tate is
> sane so this is another sanity-enforcement in the same sort of vein.
>=20
> All up:
> Reviewed-by: Daniel Axtens <dja@axtens.net>

Thanks,
Nick
