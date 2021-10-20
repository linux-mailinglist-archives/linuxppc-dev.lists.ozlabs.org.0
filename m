Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 778BF4344AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 07:27:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYzdK6ThVz3c9S
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 16:27:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NMi4ITa5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NMi4ITa5; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYzch2S6lz2yPN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 16:26:43 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id m26so1947894pff.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 22:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=6qWZfrGs7oeJrH8rUBe+od/K5rWX/np8V/rd+gFV3vc=;
 b=NMi4ITa5qstI/mFhZpzOKZO+q03++HJxWYwrh6VPKQxyclL/d0fGA4dDYmiZToHXdv
 fiiIafYGbn7LQd0OuEOj2+U6pWQOK4pVcLR2xdqfKMDtSgHetX+aIBFaScjRjxICinVI
 jB67w/Ghc4HxD3Ks0iTiFsl0HDk/lUUehDD7t3za8sj/nWSJfRcDluNTgHDc1xTWLUjx
 2YKjtdpGOxrH+MLYWW0P7aGHHSct88IJLYI3hZODPbnefYBi33qdle3LlrSRD75MNYCN
 G3/3QDEOL/4C9NINLEIHvJFJNzXqZVgpAYrQAfL0UPyOmg8qdiNaKZ8POmbYFwOZQ/fE
 8+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=6qWZfrGs7oeJrH8rUBe+od/K5rWX/np8V/rd+gFV3vc=;
 b=BEgDaHdS82Bkz4I/tmi2pwdui4ngycyNHfdA7e9FD/QGFZF6uPoU2xQhAlbfLHos6/
 KrXyaugGUf120mgF+g2KA1hdRvQG737iCdEsV1Z6G7smv01eH/KbLQvxDgydTfbIsJP6
 8UzJHVmKTvN5d+9iF8L5McAPzhCcmnbJhrhUMGnQXYJV/UnN5J9AbNyA8JjmniS2hLOY
 NhXesVH3e+mDKNRqF7lb3yoCRliJJcdKItfp5goFv7papCPhWYfimVpK1d4PagEAy3KU
 PhVhCUKIlTvXIhT/iYekl2cA2KdKPuWhOd17F27VJzEhDADnKqJhtC+RmSE9DChK522+
 CcdA==
X-Gm-Message-State: AOAM530GI0EzvFsvhgbzLFgCVeKIf51LNQWmyEg6PSlAruc6GcrufEEV
 0sY47X7f2hVJGfEWlPX4I8eehDQSqsI=
X-Google-Smtp-Source: ABdhPJyhdt5eR6Y5Y7k4CuwOlG7GPT4/03CZ77FtCzpWxAEqCQw4YTOWJ+ldivqr2o0PUy6SgHI6VQ==
X-Received: by 2002:aa7:9ec6:0:b0:44d:6650:c1ff with SMTP id
 r6-20020aa79ec6000000b0044d6650c1ffmr4159417pfq.15.1634707600104; 
 Tue, 19 Oct 2021 22:26:40 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 c8sm887520pjr.38.2021.10.19.22.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 22:26:39 -0700 (PDT)
Date: Wed, 20 Oct 2021 15:26:35 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 10/52] KVM: PPC: Book3S HV: Don't always save PMU for
 guest capable of nesting
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20211004160049.1338837-1-npiggin@gmail.com>
 <20211004160049.1338837-11-npiggin@gmail.com> <87zgr9w3dp.fsf@linux.ibm.com>
In-Reply-To: <87zgr9w3dp.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1634707495.9zbufpkpoy.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of October 16, 2021 10:38 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Provide a config option that controls the workaround added by commit
>> 63279eeb7f93 ("KVM: PPC: Book3S HV: Always save guest pmu for guest
>> capable of nesting"). The option defaults to y for now, but is expected
>> to go away within a few releases.
>>
>> Nested capable guests running with the earlier commit ("KVM: PPC: Book3S
>> HV Nested: Indicate guest PMU in-use in VPA") will now indicate the PMU
>=20
> I think the commit reference is now: 178266389794 (KVM: PPC: Book3S HV
> Nested: Reflect guest PMU in-use to L0 when guest SPRs are live)

Ah yes good point, would be good to that in the changelog. I guess we
can add a References: tag as well, just in case anybody mines this=20
stuff.

>=20
>> in-use status of their guests, which means the parent does not need to
>> unconditionally save the PMU for nested capable guests.
>>
>> After this latest round of performance optimisations, this option costs
>> about 540 cycles or 10% entry/exit performance on a POWER9 nested-capabl=
e
>> guest.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kvm/Kconfig     | 15 +++++++++++++++
>>  arch/powerpc/kvm/book3s_hv.c | 10 ++++++++--
>>  2 files changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
>> index ff581d70f20c..1e7aae522be8 100644
>> --- a/arch/powerpc/kvm/Kconfig
>> +++ b/arch/powerpc/kvm/Kconfig
>> @@ -130,6 +130,21 @@ config KVM_BOOK3S_HV_EXIT_TIMING
>>
>>  	  If unsure, say N.
>>
>> +config KVM_BOOK3S_HV_NESTED_PMU_WORKAROUND
>> +	bool "Nested L0 host workaround for L1 KVM host PMU handling bug" if E=
XPERT
>> +	depends on KVM_BOOK3S_HV_POSSIBLE
>> +	default !EXPERT
>> +	help
>> +	  Old nested HV capable Linux guests have a bug where the don't
>=20
> s/the/they/
>=20
> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
>=20

Good catch.

Thanks,
Nick
