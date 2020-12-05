Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5975E2CF95B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 05:53:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cnxz74nqxzDqLj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 15:53:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hYrtKqID; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cnxtd0T0HzDqXG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 15:49:12 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id x15so4291524pll.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 20:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=8K5w8jDXkKIlAngW/XG7feDMYwmdKQNqo3uNmj5tiHg=;
 b=hYrtKqIDsBey9XtGHSIn0Bg7onNveij1HRFaHy9NAT8RO52Hqr03V26BGscp7X7CN+
 yd8n/Zyn0Umq/3pX7RhQIKWuCYjKZwO48ER0FE07sfBRLKZO8pbMUWpMA6O98+eFyGm+
 RXFHC3/u1Vi82UHwVdkjVhC5qnvJa/xn7RUpM+ytoWsqMa/zo+5rH4A8NXU3H+jrBO2V
 ODKk31Gfzzq4v622z7u+bLuqoFNUe/5RydNnSz3bWku7+Grocps27gRlbTEx6RhCdG6f
 cX1hU41DTIG/zzPiDOHGcoEx5siB5+6BI/RQp/Mw44cS6if02xsNGtcme+Gjq041HeQV
 xf7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=8K5w8jDXkKIlAngW/XG7feDMYwmdKQNqo3uNmj5tiHg=;
 b=e24e1dMAZwmb5bFOlE+IQ1HHpEMB+TclQpKdd+jC66k8Mjpp0f5nb3Dxnu4C2dp5Z4
 p8rySarEtYM7C55CM47RO+nOTPRTkbJCvGddr2ua9k37TCexQz/SOMcr+0UpWhspw8JR
 pD8cPiE0Ha6cRwapDPO3LtJqdoGukh8ooEBqcZdXviQ14H/Rva3D7CD7O0nflxGaelka
 qZ0j0QHwYixCkwY5xlPoiNL8hrw/KcFZ9TtWGZ/B9z4v3AIVUpiGv9xb2ytf8jSpMtSK
 aMFAdn4lU1WGTuP84oJvFMK6S+RMMUyQgkIn0OLtg78LKyv4KykzHrq8VUy1Wu98aOn8
 Mj1w==
X-Gm-Message-State: AOAM530ga2yDlTiKnLVa23bgzmexN+ltxBxeQOqAG3v1m+MZY6AOR6Wd
 I0xhmRqVhlTPOVBvlcmagk4=
X-Google-Smtp-Source: ABdhPJw/E26yjJEohaTP7ApEdDRtaSfWTjVTMQOkzfNuPiHlz5TFw2OnaE0hnGXZ8o7aQSs7ynbtnA==
X-Received: by 2002:a17:90a:9289:: with SMTP id
 n9mr4238282pjo.67.1607143750294; 
 Fri, 04 Dec 2020 20:49:10 -0800 (PST)
Received: from localhost ([1.129.238.242])
 by smtp.gmail.com with ESMTPSA id 126sm5352861pgg.46.2020.12.04.20.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 20:49:09 -0800 (PST)
Date: Sat, 05 Dec 2020 14:49:04 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC v2 2/2] [MOCKUP] sched/mm: Lightweight lazy mm refcounting
To: Andy Lutomirski <luto@amacapital.net>
References: <1607065599.ecww2w3xq3.astroid@bobo.none>
 <D9715BFE-744E-49B4-A10B-32735123BE6D@amacapital.net>
In-Reply-To: <D9715BFE-744E-49B4-A10B-32735123BE6D@amacapital.net>
MIME-Version: 1.0
Message-Id: <1607141044.0ibmnpwoeq.astroid@bobo.none>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Nadav Amit <nadav.amit@gmail.com>,
 X86 ML <x86@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Rik van Riel <riel@surriel.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Dave Hansen <dave.hansen@intel.com>,
 Will Deacon <will@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Andy Lutomirski's message of December 5, 2020 12:37 am:
>=20
>=20
>> On Dec 3, 2020, at 11:54 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>>=20
>> =EF=BB=BFExcerpts from Andy Lutomirski's message of December 4, 2020 3:2=
6 pm:
>>> This is a mockup.  It's designed to illustrate the algorithm and how th=
e
>>> code might be structured.  There are several things blatantly wrong wit=
h
>>> it:
>>>=20
>>> The coding stype is not up to kernel standards.  I have prototypes in t=
he
>>> wrong places and other hacks.
>>>=20
>>> There's a problem with mm_cpumask() not being reliable.
>>=20
>> Interesting, this might be a way to reduce those IPIs with fairly=20
>> minimal fast path cost. Would be interesting to see how much performance=
=20
>> advantage it has over my dumb simple shoot-lazies.
>=20
> My real motivation isn=E2=80=99t really performance per se. I think there=
=E2=80=99s considerable value in keeping the core algorithms the same acros=
s all architectures, and I think my approach can manage that with only a si=
ngle hint from the architecture as to which CPUs to scan.
>=20
> With shoot-lazies, in contrast, enabling it everywhere would either malfu=
nction or have very poor performance or even DoS issues on arches like arm6=
4 and s390x that don=E2=80=99t track mm_cpumask at all.  I=E2=80=99m sure w=
e could come up with some way to mitigate that, but I think that my approac=
h may be better overall for keeping the core code uniform and relatively st=
raightforward.

I'd go the other way. The mm_cpumark, TLB, and lazy maintainence is=20
different between architectures anyway. I'd keep the simple refcount,
and the pretty simple shoot-lazies approaches for now at least until
a bit more is done on other fronts. If x86 is shooting down lazies on=20
the final TLB flush as well, then I might be inclined to think that's
the better way to go in the long term. Shoot-lazies would be a bit of
a bolted on hack for powerpc/hash but it has ~zero impact to core code
really.

Thanks,
Nick
