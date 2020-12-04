Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 285572CEFCB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 15:39:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cnb2K6XtVzDrRF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 01:39:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=UZXXb5Qn; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnZzX5xhjzDrRF
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 01:37:11 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id l11so3204771plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 06:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=MsPLvGvNf1bS+OcbC87Aqig/sgy85eIEfjyO8YBsPiY=;
 b=UZXXb5QnzDbiUmObhrI5+4AmF8IUYayIuqV+PYOsWzeVumt0pv+hpfTSPujXMvzxsg
 VE98zoWVezLv1/BweG0xNxMjuteXpdMc9E1H0CpA5qAHbUOpRBIDLOXg5xXFwyG4hPJF
 DatgzK3fAgnrUD8VF+DAOOoK+CatjFJtuKKKvrPgfumcFgOlu8FRfoBfzTgWSsL9ybKB
 CY5brTbzShCgh5IoMrRutefrxbAFCKO9JKGM8hYOix2tYmhtiAmxXRDia6kKIJc7rwHM
 vmZdMdrOJRtLdyxJlg9X/kONzYaAwZrajS4LoZEixlH8lMjxYJfzCdpJVXnp0K+Nzg/Q
 6zPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=MsPLvGvNf1bS+OcbC87Aqig/sgy85eIEfjyO8YBsPiY=;
 b=lVQ0aU6tA99DNU2XIDPthKUfXCrN/srzs0nsoqs0oObprHC5vWxYPhaJKc8jXt1VwW
 s1CnDTxfgiojD7+K4LRao+YpClw6mAbLUdofgDIU3xNnf+tk7Sx7YNZhDVfPKVabIMSf
 Fz1va3ScCa9rxXa4S9QlVV3aSOf9Z/acqkqJKMzNd8KMs2sILZi0N4GldzJB/udA774b
 poZMCCuLKyR132zLHF0JmATu/dtGJACB9JCEXVT+jR8hstL4QnqI9j80RNWTyibha8ed
 EpBjYAN2ZtI0Q/MSxGLYL6MLsBcNpDJSrGgJ25Bs76TWivQAHNxpKpj8meByn2rLgmcx
 CvSA==
X-Gm-Message-State: AOAM533Q3l/cMevDzlZ27M4idB1J7g8D/7Mi+lQwKoajyPCxQx5wooWn
 vF5AX/WcNJ4FzP2X87+hqZ/Hzg==
X-Google-Smtp-Source: ABdhPJyFshwViMl5DvUfYhVdp5U1ntZBiV4Ra0suBVd3IWlDwG2haGuTFka/aH2GIM6E+E1x/nbi3A==
X-Received: by 2002:a17:90a:8582:: with SMTP id
 m2mr4423222pjn.199.1607092627307; 
 Fri, 04 Dec 2020 06:37:07 -0800 (PST)
Received: from ?IPv6:2601:646:c200:1ef2:e89d:8a3d:645c:8fa4?
 ([2601:646:c200:1ef2:e89d:8a3d:645c:8fa4])
 by smtp.gmail.com with ESMTPSA id m3sm4133967pgh.5.2020.12.04.06.37.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 06:37:06 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC v2 2/2] [MOCKUP] sched/mm: Lightweight lazy mm refcounting
Date: Fri, 4 Dec 2020 06:37:04 -0800
Message-Id: <D9715BFE-744E-49B4-A10B-32735123BE6D@amacapital.net>
References: <1607065599.ecww2w3xq3.astroid@bobo.none>
In-Reply-To: <1607065599.ecww2w3xq3.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: iPhone Mail (18B121)
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



> On Dec 3, 2020, at 11:54 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> =EF=BB=BFExcerpts from Andy Lutomirski's message of December 4, 2020 3:26 p=
m:
>> This is a mockup.  It's designed to illustrate the algorithm and how the
>> code might be structured.  There are several things blatantly wrong with
>> it:
>>=20
>> The coding stype is not up to kernel standards.  I have prototypes in the=

>> wrong places and other hacks.
>>=20
>> There's a problem with mm_cpumask() not being reliable.
>=20
> Interesting, this might be a way to reduce those IPIs with fairly=20
> minimal fast path cost. Would be interesting to see how much performance=20=

> advantage it has over my dumb simple shoot-lazies.

My real motivation isn=E2=80=99t really performance per se. I think there=E2=
=80=99s considerable value in keeping the core algorithms the same across al=
l architectures, and I think my approach can manage that with only a single h=
int from the architecture as to which CPUs to scan.

With shoot-lazies, in contrast, enabling it everywhere would either malfunct=
ion or have very poor performance or even DoS issues on arches like arm64 an=
d s390x that don=E2=80=99t track mm_cpumask at all.  I=E2=80=99m sure we cou=
ld come up with some way to mitigate that, but I think that my approach may b=
e better overall for keeping the core code uniform and relatively straightfo=
rward.

>=20
> For powerpc I don't think we'd be inclined to go that way, so don't feel=20=

> the need to add this complexity for us alone -- we'd be more inclined to=20=

> move the exit lazy to the final TLB shootdown path, which we're slowly=20
> getting more infrastructure in place to do.
>=20


>=20
> There's a few nits but I don't think I can see a fundamental problem=20
> yet.

Thanks!

I can polish the patch, but I want to be sure the memory ordering parts are c=
lear.

>=20
> Thanks,
> Nick
