Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A767335124C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 11:33:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9yfB3LhGz30HQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 20:33:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=U2Sfk7Iy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U2Sfk7Iy; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9ydk2V9Sz2yRX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 20:32:41 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so732513pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 02:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=luTQUHifrHnpdtbLI7RXY3Sg49M9JDmTNAl2wiUsM/Y=;
 b=U2Sfk7Iyt0AJQFnp46JtB527hI5ws8C5B+iGnNYXtOVMlJ6sRnME3pCqfzQpNUPP8r
 QjpiMlqW7ZPsXBgSe0jGgAQv6TJC2DpbM8nhX37osal26NIgtvQM2nLdxTcjOqYLE17O
 QkMIfGPxTfY9tJpXf/CbUn/WExdU28LaoVkBxMDBo9v0l8hS8V3HNAwzZHIvN83CRUVU
 4aG/nCwmsQdGCTYU1FVOkPdaYgTDglMBBAZPoXd7j+UdN7FUGLvTpl2TntNiyubZj+9U
 LyMBpx4C5MsD23Zv727rqjc2Kmbvn1Iufcxchy9+gc+GluJLIMscWynWFpOTwBmJbBby
 zQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=luTQUHifrHnpdtbLI7RXY3Sg49M9JDmTNAl2wiUsM/Y=;
 b=mxsUgMXbi7IooANRQJirVl8l/yZ6977bzitljcWEmDNUzE1pduzMw0NHyMAI07yzm9
 bLLe+u6MufIsUU8ZPjuP/BaVu8HZCSHQqh05yiL5fn5yAsAZX6i5VUex128kKQEziUax
 Pefk+WFoPnW38THeUVFKPvrM90vSrVUl4Wfwwqm5CQNjxlMeA3Kxy5JCr2rdqw/7JTpi
 6r+29bpc5K0YraftUu04V8+xrPO7s2hBB29RyWLoxuFO5Y1hWKTl98eGfJIOZ1tUdB9+
 9EZCn7bH8KRZYMr5m9e0iPsGrpU2cCEYI7Npw9lQpDDwdJAvajguqGFRtDMm2uZy3Ki9
 7yUg==
X-Gm-Message-State: AOAM533OkYSjwAAfGdyaMSYv5CcN0U+otfnuSFMkImA58vNZKGg9u9L2
 ukg2n8/cpVLmdGVl3VTCPw4=
X-Google-Smtp-Source: ABdhPJzhWFv4wuxxWdGEZnVivQC26z7reqle1AE0mUUja4SZ5XFGYQ6o1IiZM69HlC2yPpUyi/4uxg==
X-Received: by 2002:a17:902:7585:b029:e6:cc10:61fe with SMTP id
 j5-20020a1709027585b02900e6cc1061femr7126563pll.23.1617269557932; 
 Thu, 01 Apr 2021 02:32:37 -0700 (PDT)
Received: from localhost ([1.128.218.227])
 by smtp.gmail.com with ESMTPSA id i7sm4771210pgq.16.2021.04.01.02.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 02:32:37 -0700 (PDT)
Date: Thu, 01 Apr 2021 19:32:32 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 02/46] KVM: PPC: Book3S HV: Add a function to filter
 guest LPCR bits
To: Paul Mackerras <paulus@ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-3-npiggin@gmail.com>
 <YGP1uXH5q72auwP7@thinks.paulus.ozlabs.org>
In-Reply-To: <YGP1uXH5q72auwP7@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1617269036.86nd07dbhp.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of March 31, 2021 2:08 pm:
> On Tue, Mar 23, 2021 at 11:02:21AM +1000, Nicholas Piggin wrote:
>> Guest LPCR depends on hardware type, and future changes will add
>> restrictions based on errata and guest MMU mode. Move this logic
>> to a common function and use it for the cases where the guest
>> wants to update its LPCR (or the LPCR of a nested guest).
>=20
> [snip]
>=20
>> @@ -4641,8 +4662,9 @@ void kvmppc_update_lpcr(struct kvm *kvm, unsigned =
long lpcr, unsigned long mask)
>>  		struct kvmppc_vcore *vc =3D kvm->arch.vcores[i];
>>  		if (!vc)
>>  			continue;
>> +
>>  		spin_lock(&vc->lock);
>> -		vc->lpcr =3D (vc->lpcr & ~mask) | lpcr;
>> +		vc->lpcr =3D kvmppc_filter_lpcr_hv(vc, (vc->lpcr & ~mask) | lpcr);
>=20
> This change seems unnecessary, since kvmppc_update_lpcr is called only
> to update MMU configuration bits, not as a result of any action by
> userspace or a nested hypervisor.  It's also beyond the scope of what
> was mentioned in the commit message.

I didn't think it was outside the spirit of the patch, but yes
only the guest update LPCR case was enumerated. Would it be more=20
consistent to add it to the changelog and leave it in here or would
you prefer it left out until there is a real use?

The intention is a single location to add some of these things
(handwaving: say tlbie doesn't work on some chip and we want to=20
emulate it for old guests we could clear GTSE).

Thanks,
Nick
