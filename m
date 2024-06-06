Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4B08FF3FA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 19:43:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=GRGGWtCG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwBWd2rKjz3fqT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 03:43:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=GRGGWtCG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwBVr6F3pz3dXP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 03:42:43 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a6266ffdba8so120227766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2024 10:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717695751; x=1718300551; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1Ut3Dkh+dW6ZjfW0SAbH75TKykJw59snMxcOhxXPyw=;
        b=GRGGWtCG6kxuLupTCZ5SIOt+KQJX5kH97VgT1HPfQIdGtT0da7mL+XHZ172DN++DJD
         mRqcI5QbpmBAwLFWU5oGcoVBhDbbRU+mM0ZBdbh2G4e7iJxN20OWHHz9yywBnNfLxe9O
         jxic5TCVx19cIPh3a7eX3qE/txK3EoiRmQBN3c0d/zgG8qf7pL2GuH9Yc9pWf8C9cqJ6
         Rs5Y8oKwXF4HAET1A+DzkCEi1Xb78dm5wWR/4N08y2IWHvkUEJMwVx4MosrhiFS01niW
         vVZarc6moH3r80Wjoh8lzA1ynfxHqYkv5dbMLNptyWnZ8RYyz64byhfdmEE9CqlCHMOu
         NZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717695751; x=1718300551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1Ut3Dkh+dW6ZjfW0SAbH75TKykJw59snMxcOhxXPyw=;
        b=bRx6L8VXW2GqGep8ju0OU7nvbX5MHT7zbxIFMtRBBJhSKINEGX8Lol444UZyM/fgJJ
         kY17btzp8C0J9wPG5VypOgo0vU57/EFzzZmQlyAmFey9wwVBvFXjtC7CA13yjMs8/GnZ
         64X8Gog/ogkNGDhCa/02jAwCwncsz8i268xyi9UInwJwpUd938cRZqDeyGwkjGQ1YXtL
         LQOjQwbTOsAkxes+aOYH5QHUBGT3qLcGb/H3PPd8qoqX1CO0HAcN8TWAR6jp6ZkO0kBS
         vCrK38pbfnu4sG/KGdVxup23kWHB6aFIgI1BhY6I66gd9wEtj3T8cEhxjueOoiHeb72Y
         +Uhw==
X-Forwarded-Encrypted: i=1; AJvYcCWaJ5k5+xFSOnznkirkRCAuhJSeTnLzWEM8FJ31OiZ9TICp1SY1jsFsDitr4KM81XdWoM45baVhJUOPZD28EDLQ8AaqEVCazQmBjZ6KXg==
X-Gm-Message-State: AOJu0Yw66JX4oLp5fKT4FkdZF8suEnVXxDa35KUk1feZQpI/UwxIY36f
	wBF/Papkcohg4IMK7EEPtSRaBZ0fa7eeYbT+QGndAWF7VBx04o5Rvzsb4wwPlirEqSHGEM8dDae
	VsErQoKKpqBJ2zEqDS11vZXoF6HFH1sL+0tBd
X-Google-Smtp-Source: AGHT+IEGBdWWUZC+WrQXxIBv4KOZPlFFbVSfkIEVyzAaxtZJ4s8YMZ9cpHiZkAazV4knO5rL7j2QTzt4B0g4tFKtZN8=
X-Received: by 2002:a17:906:fb11:b0:a68:c5b0:9890 with SMTP id
 a640c23a62f3a-a6cd7a80f9dmr20626266b.42.1717695751357; Thu, 06 Jun 2024
 10:42:31 -0700 (PDT)
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
In-Reply-To: <CAPpoddc2vOLdQJ7HwG7x+=oZsTz221+YJcNbUtKvPjA9AyeY2w@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Thu, 6 Jun 2024 10:41:52 -0700
Message-ID: <CAJD7tkb2b0+4_m0gb8DKSTtRwtC2GMa9NF5RuGKhXJARYHK0gw@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Takero Funaki <flintglass@gmail.com>
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Nhat Pham <nphamcs@gmail.com>, Yu Zhao <yuzhao@google.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Chengming Zhou <chengming.zhou@linux.dev>, linuxppc-dev@lists.ozlabs.org, "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 6, 2024 at 10:14=E2=80=AFAM Takero Funaki <flintglass@gmail.com=
> wrote:
>
> 2024=E5=B9=B46=E6=9C=886=E6=97=A5(=E6=9C=A8) 8:42 Yosry Ahmed <yosryahmed=
@google.com>:
>
> > I think there are multiple ways to go forward here:
> > (a) Make the number of zpools a config option, leave the default as
> > 32, but allow special use cases to set it to 1 or similar. This is
> > probably not preferable because it is not clear to users how to set
> > it, but the idea is that no one will have to set it except special use
> > cases such as Erhard's (who will want to set it to 1 in this case).
> >
> > (b) Make the number of zpools scale linearly with the number of CPUs.
> > Maybe something like nr_cpus/4 or nr_cpus/8. The problem with this
> > approach is that with a large number of CPUs, too many zpools will
> > start having diminishing returns. Fragmentation will keep increasing,
> > while the scalability/concurrency gains will diminish.
> >
> > (c) Make the number of zpools scale logarithmically with the number of
> > CPUs. Maybe something like 4log2(nr_cpus). This will keep the number
> > of zpools from increasing too much and close to the status quo. The
> > problem is that at a small number of CPUs (e.g. 2), 4log2(nr_cpus)
> > will actually give a nr_zpools > nr_cpus. So we will need to come up
> > with a more fancy magic equation (e.g. 4log2(nr_cpus/4)).
> >
>
> I just posted a patch to limit the number of zpools, with some
> theoretical background explained in the code comments. I believe that
> 2 * CPU linearly is sufficient to reduce contention, but the scale can
> be reduced further. All CPUs are trying to allocate/free zswap is
> unlikely to happen.
>  How many concurrent accesses were the original 32 zpools supposed to
> handle? I think it was for 16 cpu or more. or nr_cpus/4 would be
> enough?

We use 32 zpools on machines with 100s of CPUs. Two zpools per CPU is
an overkill imo.

I have further comments that I will leave on the patch, but I mainly
think this should be driven by real data, not theoretical possibility
of lock contention.

>
> --
>
> <flintglass@gmail.com>
