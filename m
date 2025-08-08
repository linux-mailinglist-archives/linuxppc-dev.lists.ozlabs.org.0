Return-Path: <linuxppc-dev+bounces-10768-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E0FB1ECF7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 18:27:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bz8ZG1rmXz303F;
	Sat,  9 Aug 2025 02:27:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754670438;
	cv=none; b=hjOVxadimWFZsgxSyqGg+gYtSBwnLYM/okbIpQYS61IUj7ZCqZXkftOdAzCVxDxlWq1/CVfCKvDl/vxwAKINdUdEr+a2gXNEnyjkH6pvZzczqdowCa47zN0478UYV+lQhlDF607hvqgmWzS7wqe/WViOJpYKvuTBaZWoC0MzBxRLiY6llfl2KdwZ+eT1oQ6n3l1y1B1dAMjQLZNPkmcbvLZA1wL6ZKCrrWGwWH2qarkoyOrqGWJtjR9JRt1332R3uPS8fC9azmOkpqt5FB90VhaVWqK3SSZG/KGJ+uOfdeWqGevvL/ln3TVF6HrnOPDNkllyog7h1NhakXfb6ogVog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754670438; c=relaxed/relaxed;
	bh=4KvPmLkGGbt5wH+Uu1Ks9PURZhNKr1xUfeioKrI5T5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q05nja+gTZb/FKoLc+KT9wPFAxgaAbjvDdEVhDS5ZHCy5bVrrLBgnbwW4m6PSwcRlS7Dbo8bZrkv2BJUnE2rDOhhdZmfVH9UvqMarJDQtgieOr3UlEXBs7q7LruFp5XwoH7RyXTvwZUL+s04Za5HcA3gh18s2IGgMKu19p/CK34qVX+jR1IqWBD7q1Z/KCjl4aHhVHRU3Tw75C5wPp6X8yTSKle5uGb5mu1x0O6QIxOYamA1Vr53qlS9fR5DGixzfD/GxXoVXPrkCZ9PeIn1vg158rNaLKJcFcP85B07OMgye/a3Zcq5m8s6YYs5MKayKe9VpgxuYM5K2oTji6gFvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TzsxEz/K; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TzsxEz/K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bz8ZD4phHz301K
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Aug 2025 02:27:15 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3b783ea502eso1838039f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Aug 2025 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754670432; x=1755275232; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KvPmLkGGbt5wH+Uu1Ks9PURZhNKr1xUfeioKrI5T5E=;
        b=TzsxEz/K1q0E9lyPEw2Zdk5/x1sITyfR2jmu1L7r+Lbw2sjOfapzUA49//MoGzmqJ6
         vL1GnycfI4yVKjF5J570VyDhBN5LzBRhNnNJbhgpRMSP1S4ijoNDyGNBFNjQUIFvKRKb
         I+BY5RjN/LrqkB3ZD94efzEFomMBrP9zOcmfi9r+bpaSCkDWErdruDkW9UymtWpyiKDH
         vMrP3FWZ7RoXT1ofZxgvsuZzCV323ORjPdTqEaAOqnmaL0isfRAdZMnnsPA0Grx3iCZl
         Sl5i7As6J7vLM1azoyVhVVOYzdM+co5zF69zuIfSIqtJDUYRWf4PN6DJDVW79mCxqRKf
         1E9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754670432; x=1755275232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KvPmLkGGbt5wH+Uu1Ks9PURZhNKr1xUfeioKrI5T5E=;
        b=Eyryo/XRRFwpr6LEnJ5/aPan/kXEeCsMS4dLVkMzPouVs0TUmRKyLg82ABBC3FQLD8
         CgwlDxO6EYy3Twr/QySoNhpsksLmjn3gEmaVdFlMZHI6mnTMb24xkY7Xcv3USxqmkM9H
         2ALO04gYHZzLUN5b6TZ2szvJFeWvYB1CbjokegXYhYsKd+xWjc16tymkBO6sR0A0VCsY
         wXMuyDNDK5wFj8OS58aUZjX3OqGudB3dV1YtArTcl5e+qEA70qePTGM+WYqrLNyDol9p
         blchWq3D6Zo2e3rP6Z+mtSq7q5XDGiHBQV7NJI+lEYTX/rO+qKqYo+mbbINt5xGUnEys
         Moxw==
X-Forwarded-Encrypted: i=1; AJvYcCXyKOA0rtux57cbTvER+uDSxT3q1tYkRvIBDOXLWcpuPDnigsUXhEhG2eGexi0DR/lAGWSfEhXnKpYH06o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwF1Fod53sHUU81AMMVtIKA9o7atTDOrpjvGOkx8RSwZLt2DZeq
	Iq7G0faQEMUSLTn1tYFhmiSRz6SEQmLlQQJ2DWa3uNNzSul7LqDzVHHcTroCXS0ba7xyyg9USI2
	YmO+LdFG2M9M8Nv4BjIG9cx1xJEHMBKg=
X-Gm-Gg: ASbGncsw7o0iBZjN0H9fRhMqc5g/UBhLH+qSJriUSGNnh4kQrTtYPdpwmlDdNb0tIcg
	kkCyAvknVjS0h4NuCl3gByVfAEVzFo/KS2y6MQhCHV8eaCOMcdFesAmIJYvTNOuWPrOrblE4MXy
	tZa0iiSJf0ApaRjOHRn3uIHKBIPNHnBVt4WkFa5QVk4f3RKN6WiSUFYXKrv5leCRqIA8z0A4r2H
	2LoougCTePmV2uRerhS1kqi55ydR/k3ex6G90vsN6lGTmY=
X-Google-Smtp-Source: AGHT+IG9Evme4aHcdd6nrYR5lZeD6wADDRvFIyfNrpJoFoo1P/bytzRZ+hiKKbt7rFJTSNZ0YmLP6QuxRsz+uT1OYSE=
X-Received: by 2002:a05:6000:18a6:b0:3a4:f7dd:6fad with SMTP id
 ffacd0b85a97d-3b900fdd6femr2888237f8f.14.1754670432326; Fri, 08 Aug 2025
 09:27:12 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250805062747.3479221-1-skb99@linux.ibm.com> <20250805062747.3479221-7-skb99@linux.ibm.com>
 <CAADnVQ+BoEMQ3i01YpzdNPAaL_mdNogkvHp0Ef73TBG8w726Zw@mail.gmail.com> <aJYXs90cMv/HC9A1@linux.ibm.com>
In-Reply-To: <aJYXs90cMv/HC9A1@linux.ibm.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 8 Aug 2025 09:27:01 -0700
X-Gm-Features: Ac12FXyUvmh7-9ppO5lCcBpJ1aArsrK9_eldp5dwMUa-0rnnH5koo3huzlHvDh4
Message-ID: <CAADnVQLnHSHker4S+tCyUyM4kFCMiH+ugHM0eWVOHhP1cuC-BQ@mail.gmail.com>
Subject: Re: [bpf-next 6/6] selftests/bpf: Fix arena_spin_lock selftest failure
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>
Cc: bpf <bpf@vger.kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Hari Bathini <hbathini@linux.ibm.com>, sachinpb@linux.ibm.com, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Andrii Nakryiko <andrii@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Mykola Lysenko <mykolal@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Naveen N. Rao" <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 8, 2025 at 8:29=E2=80=AFAM Saket Kumar Bhaskar <skb99@linux.ibm=
.com> wrote:
>
> On Thu, Aug 07, 2025 at 03:21:42PM -0700, Alexei Starovoitov wrote:
> > On Mon, Aug 4, 2025 at 11:29=E2=80=AFPM Saket Kumar Bhaskar <skb99@linu=
x.ibm.com> wrote:
> > >
> > > @@ -60,9 +65,16 @@ static void test_arena_spin_lock_size(int size)
> > >                 return;
> > >         }
> > >
> > > -       skel =3D arena_spin_lock__open_and_load();
> > > -       if (!ASSERT_OK_PTR(skel, "arena_spin_lock__open_and_load"))
> > > +       skel =3D arena_spin_lock__open();
> > > +       if (!ASSERT_OK_PTR(skel, "arena_spin_lock__open"))
> > >                 return;
> > > +
> > > +       skel->rodata->nr_cpus =3D get_nprocs();
> >
> > ...
> >
> > > --- a/tools/testing/selftests/bpf/progs/bpf_arena_spin_lock.h
> > > +++ b/tools/testing/selftests/bpf/progs/bpf_arena_spin_lock.h
> > > @@ -20,8 +20,6 @@
> > >  #define __arena __attribute__((address_space(1)))
> > >  #endif
> > >
> > > -extern unsigned long CONFIG_NR_CPUS __kconfig;
> > > -
> > >  /*
> > >   * Typically, we'd just rely on the definition in vmlinux.h for qspi=
nlock, but
> > >   * PowerPC overrides the definition to define lock->val as u32 inste=
ad of
> > > @@ -494,7 +492,7 @@ static __always_inline int arena_spin_lock(arena_=
spinlock_t __arena *lock)
> > >  {
> > >         int val =3D 0;
> > >
> > > -       if (CONFIG_NR_CPUS > 1024)
> > > +       if (nr_cpus > 1024)
> > >                 return -EOPNOTSUPP;
> >
> > We cannot do this. It will make arena_spin_lock much harder to use.
> > BPF CI doesn't run on powerpc anyway, but you can document that this
> > test is disable by creating selftests/bpf/DENYLIST.powerpc.
> Hi Alexie,
> Sorry, I did not get it. Can you please help me to understand why it
> makes arena_spin_lock harder to use.

because requiring user space to do
skel->rodata->nr_cpus =3D get_nprocs()
is a headache.

