Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B16F237292C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 12:46:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZGjC5GKyz30CY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 20:46:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=p7DkYeio;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=p7DkYeio; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZGhm4lh4z2xYf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 20:45:43 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id m11so6994069pfc.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 03:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=NzulqpGXM5w5pbBDoWf6Zt2lL0qyQDu7glAD68APliU=;
 b=p7DkYeioViJvjMJTbrXN9jB35aFlGdkToMQwMRyApflylJ7Kektylvh18Y9Rrxinkt
 uzro21bu3tfZdhNM5XAL+BfnxNRL2KCEZuYFNo/pFyWIHWJM7+r0/xCjmi+VQGAY8Cm0
 7/ZbdIbCryQn/nG95MCHqbIBjk+HTn52+3tIZh57qSgRmbivYIDar6x5vasp/yR7jRdW
 JRbWi+543+b0L35YNApI5D/m1/4lQaZV/DV+V2hBGq4MDavU0bexh+N2GBofStPaJToe
 gWRdaeEmbhoxBJkeaRjqHlo3X+UseszgHsX/8zudmBjPRKlkmhT+1K5Elp/2NRHAUyYH
 8GZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=NzulqpGXM5w5pbBDoWf6Zt2lL0qyQDu7glAD68APliU=;
 b=EbS/MC/DRvjZHeIOCPaMbjiAlUuwx8wAANG6vsYQb/R9fa/Os8tZEFbpwdJYIINE4M
 V25GJy4jRQGiroVVb16B690N/hhewxg280hljHZUbsZZGtDGUhflS3FOJRrw1yifQ5GN
 6ZNphQKqSokVDAByIX5Bh6aH5+4p5mmWSk15YttyG0l7N/rjOpTmMKrk6gLMj6CV6ADM
 NkFDqwPFtvR3SHxS4/DjFc+gSC1QP2LMQIAgQTux9Hw06GEiCHa2ApIzgVhDJxkU9sIK
 YWANEvQHSZyu4CFMiRSw8JdM2odURL8DxNswr1KiiSWnOEBh3IOrkNu0rUv01UjrIyOe
 HARA==
X-Gm-Message-State: AOAM533r2cC+1llSorVGcH5p6gtS87SEhtGq0APVEhAV1eDRC+0M/oUE
 oQmUdFt5KN/+C0pywWnmOtbyCNw3GIA=
X-Google-Smtp-Source: ABdhPJy1My9LYPZ1e7JRoyVzM8wMjJUDPWR1LuYSSprisqfMmWBKMpJejj3b3nqOKsuRsbKyD3ECtA==
X-Received: by 2002:aa7:814c:0:b029:250:13db:3c6e with SMTP id
 d12-20020aa7814c0000b029025013db3c6emr23445626pfn.65.1620125140012; 
 Tue, 04 May 2021 03:45:40 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id ga1sm13446243pjb.5.2021.05.04.03.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:45:39 -0700 (PDT)
Date: Tue, 04 May 2021 20:45:34 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 4/4] powerpc/pseries: warn if recursing into the hcall
 tracing code
To: linuxppc-dev@lists.ozlabs.org, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>
References: <20210423031108.1046067-1-npiggin@gmail.com>
 <20210423031108.1046067-5-npiggin@gmail.com>
 <1619531703.lv0qigovgz.naveen@linux.ibm.com>
 <1619832142.gw4mrldjdp.astroid@bobo.none>
 <1620123377.d2jb7v70z0.naveen@linux.ibm.com>
In-Reply-To: <1620123377.d2jb7v70z0.naveen@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1620124973.i3ngst0czr.astroid@bobo.none>
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

Excerpts from Naveen N. Rao's message of May 4, 2021 8:25 pm:
> Nicholas Piggin wrote:
>> Excerpts from Naveen N. Rao's message of April 27, 2021 11:59 pm:
>>> Nicholas Piggin wrote:
>>>> + *
>>>> + * H_CONFER from spin locks must be treated separately though and use=
 _notrace
>>>> + * plpar_hcall variants, see yield_to_preempted().
>>>>   */
>>>>  static DEFINE_PER_CPU(unsigned int, hcall_trace_depth);
>>>>=20
>>>> @@ -1843,7 +1846,7 @@ notrace void __trace_hcall_entry(unsigned long o=
pcode, unsigned long *args)
>>>>=20
>>>>  	depth =3D this_cpu_ptr(&hcall_trace_depth);
>>>>=20
>>>> -	if (*depth)
>>>> +	if (WARN_ON_ONCE(*depth))
>>>>  		goto out;
>>>=20
>>> I don't think this will be helpful. The hcall trace depth tracking is=20
>>> for the tracepoint and I suspect that this warning will be triggered=20
>>> quite easily. Since we have recursion protection, I don't think we=20
>>> should warn here.
>>=20
>> What would trigger recursion?
>=20
> The trace code that this protects: trace_hcall_entry(). The tracing code=20
> itself can end up doing a hcall as we see in the first patch in this=20
> series:
>   plpar_hcall_norets_trace+0x34/0x8c (unreliable)
>   __pv_queued_spin_lock_slowpath+0x684/0x710
>   trace_clock_global+0x148/0x150
>   ring_buffer_lock_reserve+0x12c/0x630
>   trace_event_buffer_lock_reserve+0x80/0x220
>   trace_event_buffer_reserve+0x7c/0xd0
>   trace_event_raw_event_hcall_entry+0x68/0x150
>   __trace_hcall_entry+0x160/0x180
>=20
>=20
> There is also a comment aroung hcall_trace_depth that mentions this:
>=20
>   /*
>    * Since the tracing code might execute hcalls we need to guard against
>    * recursion. One example of this are spinlocks calling H_YIELD on
>    * shared processor partitions.
>    */

Right but since fixing those, my thought is we better not cause more
any recursion, so we should fix anything that does.

Thanks,
Nick
