Return-Path: <linuxppc-dev+bounces-1156-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F0C970B48
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 03:35:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X28Xh6yQ7z2yGF;
	Mon,  9 Sep 2024 11:35:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1030"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725844404;
	cv=none; b=QJubteu/kproZq/xI7642yFczLEs3g5hIod+1RzixhlQJBmd/WpCXVCIEvoyBwm5sgJIDewySyySrSRrf5zInTN4D7PipL972I0OriLHoAN3evgAWXAxvPEge2sXYlV2ww66OhT/akVNh+dno0OinjanRuS5PxtqIYr9tio4slvgkn/qO1m3qR+VtH9BKG8rQbC/05AWCprFFVIO6UTcbNEaynpxZCD66UFdsIcSwkNVi3g8zJGqdCKKhOWq2M6rzbOfLb8lbFkdKwtAyoxjfeAjxkBQw79AcNrRAmCkqHcCY5jPORKv2W/0O0mRgrh1ZgZ7QCv8vka/z1P3ZVEsyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725844404; c=relaxed/relaxed;
	bh=lmqfjRgLjURaheeD9gs5xwILKCqZABC92txMpZWTQPU=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=ZiqR22bBYclBLNLZ/0oajfYC5Y2svsPuEW/AiH3J1H9Jgv+hbemKr73VKopm7SUgl++8lbU1U2LTfxUv//MVYjQa4SynCvjrqjoQVn/4pq3cAMxF5ONbTzJ+HbIWVbxYw/92UNIz8CrTgWAsTrXHQZDHGT0W6uDi45FMoQUDTAuxwufDcglFymcDI33FTWVXYIzcVjXiH0vEoVb+ZxkhQ1SUg9TIuZSkQ62AnMh4u1Cj420CtFO/rcjywhXWl8Cf71rNqZwtTwND9OOpOHjEfL5LvVUujccFnESSkeN0PB0qLRujUYguBix0JR2SjlyNIr3tLOYToQAM5dCntzkeAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zqc9i42k; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=andrii.nakryiko@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zqc9i42k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=andrii.nakryiko@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X283S0LD5z2xf2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 11:13:22 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2d86f713557so2483056a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Sep 2024 18:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725844398; x=1726449198; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmqfjRgLjURaheeD9gs5xwILKCqZABC92txMpZWTQPU=;
        b=Zqc9i42kNzjR+OIboduxNHgZd7P4/LF9gX6XAItVJDf6DUJkLNlCuCuYgjAVWQ8PMi
         FTqXS5nzcNik+HbSaVJVXtcJM/1+uVWlBnbq9MS8Flfvh6OEkaoRDOaUxVryfGHWGzUG
         Bj7pJcexUu8qOt87LHu+aXS45IueryYL9cagaOBLqRRpW17Y2uJKVllVKL0RKzH3IM8I
         irYZ8HqS3wqfzXlXspglVP2YqpW60EvWPmeol6NqX35YcGS/HGBKXXT9hA54nDUB1UDS
         oPxawwQRCH7lhdyfj6T1761x8GhTjE2qPk1W86XHdS6bqcAHCeP2d/up1RqZOxWDjZue
         Y4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725844398; x=1726449198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lmqfjRgLjURaheeD9gs5xwILKCqZABC92txMpZWTQPU=;
        b=T29Y1BYjlR81JiLtUh62fyItbImBZ7w82tcqTdnsxmEW4t/vth4JNgFknOvMCW0XJg
         sr5GjtaISEjZU2fI/U2Danum6uqe8acOyctuMJsZoMoIC32zE1bzmYn2qa2b3fncdrwk
         thCfkl5ib9TJp1+NfwfhphqPVn8LeD1DM5icKSFNcfJ+5OsuB01iBcOOyFl4USaWHEv+
         7gX6gc5svbxWmTvcPf4ht5jSNnhITyuErd/OI49clGhveIa8/+fQZ/lc7yEAUCSPZbyS
         BmP3aDhkNjcNaM/c0hky5e8PZGeWzenVMIPKv22Qg+n4Xd9smUZBd8LlCVI56eBEzRZ8
         vRvA==
X-Forwarded-Encrypted: i=1; AJvYcCUNkjhXUhBJTU1nlk3/YPRoCiuklMFHcTIfMwQ7GjhRBRJlywa5Kgq3i6Z0jYzKgQMU1QuJqr9NYcsa/j4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxQ60Ck+3U9ENayhNpORgcgkMYDvnJcl+9k0Y2ZaTbcv5gj1GeZ
	kYf65GATRcK4x7A94PensAhFRt3zYV1UCHQktYZNi1MVWw8t/sY6xJ2pole0xH6bjF/eiyKIiFZ
	uypzt8/JTDsSqWKDS/ZFmY9O5z/8=
X-Google-Smtp-Source: AGHT+IHZYNXjMZsWum9aNMwAXVkyySi4fNZopOCM8m2K8Y0jUQHJEBS+f4rW/0wV/KFyuaAT4zLceiHtrYtyy+xpawg=
X-Received: by 2002:a17:90b:204:b0:2c9:9eb3:8477 with SMTP id
 98e67ed59e1d1-2dad4efd2b3mr10783978a91.16.1725844397996; Sun, 08 Sep 2024
 18:13:17 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240830113131.7597-1-adubey@linux.ibm.com> <172562357215.467568.2172858907419105155.b4-ty@ellerman.id.au>
 <20240908221053.ad2ed73bf42db9273aac419c@kernel.org>
In-Reply-To: <20240908221053.ad2ed73bf42db9273aac419c@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Sun, 8 Sep 2024 18:13:06 -0700
Message-ID: <CAEf4BzbbVRGROtRn8PM4h1493avHMggz1kSDDJcaNZ1USO_eVw@mail.gmail.com>
Subject: Re: [PATCH v4 RESEND] powerpc: Replace kretprobe code with rethook on powerpc
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Michael Ellerman <patch-notifications@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	Abhishek Dubey <adubey@linux.ibm.com>, naveen@kernel.org, hbathini@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 8, 2024 at 6:11=E2=80=AFAM Masami Hiramatsu <mhiramat@kernel.or=
g> wrote:
>
> On Fri, 06 Sep 2024 21:52:52 +1000
> Michael Ellerman <patch-notifications@ellerman.id.au> wrote:
>
> > On Fri, 30 Aug 2024 07:31:31 -0400, Abhishek Dubey wrote:
> > > This is an adaptation of commit f3a112c0c40d ("x86,rethook,kprobes:
> > > Replace kretprobe with rethook on x86") to powerpc.
> > >
> > > Rethook follows the existing kretprobe implementation, but separates
> > > it from kprobes so that it can be used by fprobe (ftrace-based
> > > function entry/exit probes). As such, this patch also enables fprobe
> > > to work on powerpc. The only other change compared to the existing
> > > kretprobe implementation is doing the return address fixup in
> > > arch_rethook_fixup_return().
> > >
> > > [...]
> >
> > Applied to powerpc/next.
> >
> > [1/1] powerpc: Replace kretprobe code with rethook on powerpc
> >       https://git.kernel.org/powerpc/c/19f1bc3fb55452739dd3d56cfd06c29e=
cdbe3e9f
>
> Thanks, and sorry for late reply, but I don't have any objection.
>

It's weird that powerpc and a bunch of other arguably less popular
architectures have rethook implementation, but ARM64 doesn. Any reason
why that is the case, Masami?

> >
> > cheers
>
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
>

