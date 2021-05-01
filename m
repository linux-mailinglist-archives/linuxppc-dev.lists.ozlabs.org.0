Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E993704AC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 03:25:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXBPh4K0Wz30Dq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 11:25:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OiKPSZok;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OiKPSZok; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FXBPG5mmyz2ysp
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 11:25:06 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id b27so295671pfp.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=dpQheuQGoyuMgJc1X6RQzAii14X/62nxE5nd+FBCsgE=;
 b=OiKPSZokU+s3sFa2gthsE8flLl8U8XnlzNPY3PV+N1pvyIr1bXfBk3OJg8ADsLlZTz
 7W1IoJYqg5yI5CEraafbFg6p2xSowaYvysqcSou4Iaxz6MLjD2DvNlVmmGmLxzHjGOWP
 +nGom1l7eOMfyvxxcZOjLo8dpHctBuTaov0e1tMdTINbdyAFbf3Q3gHurH4ZX4TB+6iX
 F/c2V/exBAtwX/e54TFSqUcyWkQOoU1404HTdD/jviayAF5gCc/AV9BOHdJX3kL0YmGI
 jw+eDzZPAV3J5pi28NLQ0B7BQdZXoou0Nf2EM9Y+B3XpNY2mrYhGFKfR1leKP4q7mJg8
 OhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=dpQheuQGoyuMgJc1X6RQzAii14X/62nxE5nd+FBCsgE=;
 b=ZIO0fQCkZ9DbE9copmmd19ntfx1poteaUzmu82nU9rvkN1VdceAIDe46QD88pPTXBY
 yS7yvNEQR8IGBCqVfnJZcUlZCQUs/5/WmAg+PBBJW2lmPqgto4RA2WPAntqDZKUTsnSG
 owcVtd0XhxW1vly67j32DAKgkl16K28Y+pTt+hvPB+KDkR/aFSzO41Y3hBXrswMhZq6Q
 rrxOhiRWxnxCqwX6Q6ucRvuqVtW95Ft+X34Zz3sS6zX/me+KW7Jxai2ToAwC6snekfhw
 JERuqwWy5VEmWyV9QRCmQlEMP5mHYYNF6he08Jg3wQxep5kIKtjeMr4HJOaqn5giXDA4
 KUcQ==
X-Gm-Message-State: AOAM530uDspb528FUteRPUTwg+xQhkKclVu+gSNYJmOAXwqGLLb8X1Cb
 2NvnWD75dEzZgZhoCU7fXdJUUFbNZTABIg==
X-Google-Smtp-Source: ABdhPJzchims3tIrkzmTIisgc1elos/EGfShHxAl0k/02UtNtqiPPUmYPq2ggTLecj4Tq8iWqqBAWA==
X-Received: by 2002:a63:5458:: with SMTP id e24mr7278949pgm.170.1619832303056; 
 Fri, 30 Apr 2021 18:25:03 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id 23sm4132092pgo.53.2021.04.30.18.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 18:25:02 -0700 (PDT)
Date: Sat, 01 May 2021 11:24:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 4/4] powerpc/pseries: warn if recursing into the hcall
 tracing code
To: linuxppc-dev@lists.ozlabs.org, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>
References: <20210423031108.1046067-1-npiggin@gmail.com>
 <20210423031108.1046067-5-npiggin@gmail.com>
 <1619531703.lv0qigovgz.naveen@linux.ibm.com>
In-Reply-To: <1619531703.lv0qigovgz.naveen@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1619832142.gw4mrldjdp.astroid@bobo.none>
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

Excerpts from Naveen N. Rao's message of April 27, 2021 11:59 pm:
> Nicholas Piggin wrote:
>> ---
>>  arch/powerpc/platforms/pseries/lpar.c | 11 +++++++----
>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platfo=
rms/pseries/lpar.c
>> index 835e7f661a05..a961a7ebeab3 100644
>> --- a/arch/powerpc/platforms/pseries/lpar.c
>> +++ b/arch/powerpc/platforms/pseries/lpar.c
>> @@ -1828,8 +1828,11 @@ void hcall_tracepoint_unregfunc(void)
>>=20
>>  /*
>>   * Since the tracing code might execute hcalls we need to guard against
>> - * recursion. H_CONFER from spin locks must be treated separately thoug=
h
>> - * and use _notrace plpar_hcall variants, see yield_to_preempted().
>> + * recursion, but this always seems risky -- __trace_hcall_entry might =
be
>> + * ftraced, for example. So warn in this case.
>=20
> __trace_hcall_[entry|exit] aren't traced anymore since they now have the=20
> 'notrace' annotation.

Yes that's true I went back and added the other patch, so I should fix=20
this comment.

>> + *
>> + * H_CONFER from spin locks must be treated separately though and use _=
notrace
>> + * plpar_hcall variants, see yield_to_preempted().
>>   */
>>  static DEFINE_PER_CPU(unsigned int, hcall_trace_depth);
>>=20
>> @@ -1843,7 +1846,7 @@ notrace void __trace_hcall_entry(unsigned long opc=
ode, unsigned long *args)
>>=20
>>  	depth =3D this_cpu_ptr(&hcall_trace_depth);
>>=20
>> -	if (*depth)
>> +	if (WARN_ON_ONCE(*depth))
>>  		goto out;
>=20
> I don't think this will be helpful. The hcall trace depth tracking is=20
> for the tracepoint and I suspect that this warning will be triggered=20
> quite easily. Since we have recursion protection, I don't think we=20
> should warn here.

What would trigger recursion?

Thanks,
Nick
