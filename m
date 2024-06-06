Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE598FF43A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 20:04:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KESRDLzs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwC0104DCz3frf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 04:04:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KESRDLzs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwBzJ1Fchz3dHj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 04:03:55 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3d205098e8cso625751b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2024 11:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717697032; x=1718301832; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmY9ClhcMnk3lfJDa8OPw7iQg8oOX8VXIGEoCMmXzxs=;
        b=KESRDLzsPV8xVnRXsSAezdQTglg0Y1d/27k0a6VoJtdvNAu8FCwx6GD8r1RLDY9lxr
         FVZ6av07cMJXIDt0744BN9AjcB6RF+OkpjoV6sa5oHrmxTBSg8YIwCdQjHiuwn/AuWg8
         ai60dnfY4PVlL/bNRYnGoTnOPu9NfIMvARsVKTtWdQrBVcdE9cCx6MWA+LHjtAiS2kb6
         QqwEAAQh+ze4qenS/TR9UBhJzE+/c9pqajrk6PwAxqAzUZ60W1JCRtcflxIb3Uw3L4IC
         JE3XBerNsv3wKTWTdWTfWF5+QOGrMvGuxvm2OkpOTrJsYfFYzqtBoyoa75EHVRXZz38I
         kPIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717697032; x=1718301832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmY9ClhcMnk3lfJDa8OPw7iQg8oOX8VXIGEoCMmXzxs=;
        b=nSW01BJWHj2bSOWzZjUJHEY6fILhgLxM2tvP7/l1PwYUD3aC2y1dv/CHpkzxFy1RoG
         XlAX2AacrCNI94+uB7wbPA3TCW3/GAIG9ASyI8CHQR1VcSmXUIGQ91UqM7tb8LTGG/iC
         rJFp5JGKCb834jsQ35EVEW+c2X+iGj7fjYDDCwZhnd4oHNsQ5dp6GphlbMpoBDyokxx7
         +dgvw9efec+Odob+gmX+gmycSmya+DH2dYQxpME+K3UblsDi9TnbEIrbYW4GFrnkvwY8
         cmikRLzGW2TJeY1Ai8mIRqxbkp+7nafvg99xiAIYLSY95U4FHbUQrkTbz3XEVGoVeLQ/
         KJFA==
X-Forwarded-Encrypted: i=1; AJvYcCUcEFZ/8CPaxKmWu9z+nXmN3nl9xet6W7WTCXE2ZKzXPFQ7c1/jfRoMaKdqsbl866TjnymOmhWB4RqQ+MbxDdtYQmTID+FhFfJcg9NgqA==
X-Gm-Message-State: AOJu0YyAzppw2wPDKfXGBQFxSnRRcAygLyJqmH22uXjkofWfcIGo3qmV
	yu0W46w3o2YbQImGdWCO4eVa0EeTFalf8LDXzj6D2+iZPqiXv0drnwNe2goP/bUqZ0Hr9JVxd4o
	egmSiBSkL4LUdkJcbuQg1Yuxfwhr6mvaN3SV5eMK8vw/06N2VVfBn
X-Google-Smtp-Source: AGHT+IGB4znCbBR8zUXjogqePqqiINLBxrZ4BZNRbTT6dQK52MxMOJB+MSnUdj/K2GhLRkzuaQLVnFWonw/plNYoJYA=
X-Received: by 2002:aca:130b:0:b0:3c7:50ac:c570 with SMTP id
 5614622812f47-3d210f072b9mr155114b6e.44.1717697031595; Thu, 06 Jun 2024
 11:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240508202111.768b7a4d@yea> <20240515224524.1c8befbe@yea>
 <CAOUHufZ-9NmzOKjLedvZFp0=N0LvRZn77qC6k1WXK+NHtKr=0w@mail.gmail.com>
 <CAOUHufZ36rQc8AfLtRv2QrEareysdvbprAEO5XkcG-FeDOxFLA@mail.gmail.com>
 <20240602200332.3e531ff1@yea> <20240604001304.5420284f@yea>
 <CAJD7tkbCRLdy0vD2Pd17fNrxHgkzW1VucN4qMkohLFLBLaaeCQ@mail.gmail.com>
 <20240604134458.3ae4396a@yea> <CAJD7tkYjJJGthQ_8NukGw6Q9EYbLA=8sAH_7=B90KXEL6HWdSw@mail.gmail.com>
 <CAOUHufa0Fpj6SjNgB-z0n5Jg63q1ewkbOAU65forpDwQVs45qg@mail.gmail.com>
 <CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com>
 <CAOUHufb6zXr14Wm3T-4-OJh7iAq+vzDKwVYfHLhMMt96SpiZXg@mail.gmail.com>
 <CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com>
 <20240604231019.18e2f373@yea> <CAJD7tkYq5u7B+0UH2XKpeWJnUxoO2kJ1_XZ2JOgYpyNEVR7u0g@mail.gmail.com>
 <20240606010431.2b33318c@yea> <CAJD7tkbhWYzx=6YmzAh0F+cK-_Bn8mPOH7gMbQS7YVXmaFSgFg@mail.gmail.com>
 <CAPpoddc2vOLdQJ7HwG7x+=oZsTz221+YJcNbUtKvPjA9AyeY2w@mail.gmail.com>
 <CAJD7tkb2b0+4_m0gb8DKSTtRwtC2GMa9NF5RuGKhXJARYHK0gw@mail.gmail.com> <CAOUHufZ_dKpts4uW4Xg3jVYnX5Z5MN9U9icxhP0Nmz7QnqurBQ@mail.gmail.com>
In-Reply-To: <CAOUHufZ_dKpts4uW4Xg3jVYnX5Z5MN9U9icxhP0Nmz7QnqurBQ@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Thu, 6 Jun 2024 11:03:13 -0700
Message-ID: <CAJD7tkbkDhDhDejVPWNxiCs-9WmFm_gvA2zX9ztF+tDgWLXpTg@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Nhat Pham <nphamcs@gmail.com>, "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Takero Funaki <flintglass@gmail.com>, Chengming Zhou <chengming.zhou@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 6, 2024 at 10:55=E2=80=AFAM Yu Zhao <yuzhao@google.com> wrote:
>
> On Thu, Jun 6, 2024 at 11:42=E2=80=AFAM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > On Thu, Jun 6, 2024 at 10:14=E2=80=AFAM Takero Funaki <flintglass@gmail=
.com> wrote:
> > >
> > > 2024=E5=B9=B46=E6=9C=886=E6=97=A5(=E6=9C=A8) 8:42 Yosry Ahmed <yosrya=
hmed@google.com>:
> > >
> > > > I think there are multiple ways to go forward here:
> > > > (a) Make the number of zpools a config option, leave the default as
> > > > 32, but allow special use cases to set it to 1 or similar. This is
> > > > probably not preferable because it is not clear to users how to set
> > > > it, but the idea is that no one will have to set it except special =
use
> > > > cases such as Erhard's (who will want to set it to 1 in this case).
> > > >
> > > > (b) Make the number of zpools scale linearly with the number of CPU=
s.
> > > > Maybe something like nr_cpus/4 or nr_cpus/8. The problem with this
> > > > approach is that with a large number of CPUs, too many zpools will
> > > > start having diminishing returns. Fragmentation will keep increasin=
g,
> > > > while the scalability/concurrency gains will diminish.
> > > >
> > > > (c) Make the number of zpools scale logarithmically with the number=
 of
> > > > CPUs. Maybe something like 4log2(nr_cpus). This will keep the numbe=
r
> > > > of zpools from increasing too much and close to the status quo. The
> > > > problem is that at a small number of CPUs (e.g. 2), 4log2(nr_cpus)
> > > > will actually give a nr_zpools > nr_cpus. So we will need to come u=
p
> > > > with a more fancy magic equation (e.g. 4log2(nr_cpus/4)).
> > > >
> > >
> > > I just posted a patch to limit the number of zpools, with some
> > > theoretical background explained in the code comments. I believe that
> > > 2 * CPU linearly is sufficient to reduce contention, but the scale ca=
n
> > > be reduced further. All CPUs are trying to allocate/free zswap is
> > > unlikely to happen.
> > >  How many concurrent accesses were the original 32 zpools supposed to
> > > handle? I think it was for 16 cpu or more. or nr_cpus/4 would be
> > > enough?
> >
> > We use 32 zpools on machines with 100s of CPUs. Two zpools per CPU is
> > an overkill imo.
>
> Not to choose a camp; just a friendly note on why I strongly disagree
> with the N zpools per CPU approach:
> 1. It is fundamentally flawed to assume the system is linear;
> 2. Nonlinear systems usually have diminishing returns.
>
> For Google data centers, using nr_cpus as the scaling factor had long
> passed the acceptable ROI threshold. Per-CPU data, especially when
> compounded per memcg or even per process, is probably the number-one
> overhead in terms of DRAM efficiency.

100% agreed. If you look at option (b) above, I specifically called
out that scaling the number of zpools linearly with the number with
CPUs have diminishing returns :)
