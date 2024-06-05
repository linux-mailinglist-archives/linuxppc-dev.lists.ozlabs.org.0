Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FA68FDAF7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 01:54:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KRUu6a9e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvknh0JZ3z3cVx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 09:54:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=KRUu6a9e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vvkmv4w0Kz30WG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 09:53:18 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4215bfce9e1so16895e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2024 16:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717631592; x=1718236392; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odPagFywCeLVckyJ7u7Ej1gNPxTHuemqTZ9yer+TyAs=;
        b=KRUu6a9eaf3WVfrKYj95grADXNKiG8i/eRfDykIl2ZkajKY7msJ/McFKdTYMuQ51Xm
         jXmBUbZ2g5sugMszR00MOXoQD0kTX7E2Jo/whA7h+iFcZDNIvo4iHLTXtT6aXCuWaO4U
         ZLp+7Lme6fe2q6TXJ3/P6g1rs/Ph6fWDiRYHr7zBLu7hf7mBMgDPtlkSZtrx5a2/f/Fz
         gK6ZX0Mmc8DYqYMZxaBBkYGirzBxG37WdVvH5izYQWwu5q1JZavrmFhVfHPobK/3k1zs
         PlVY/qrf6POBisE6rOUKDCTC+sHHNaq7P1NAMV3xfDOtb9jL1er2fICKVbLCC5VJyc4l
         ROpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717631592; x=1718236392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odPagFywCeLVckyJ7u7Ej1gNPxTHuemqTZ9yer+TyAs=;
        b=omY/N2j99bGrtBJMk+6NYW9ik5jyuOx3rKas+5ClsUzroIS2ncI1RY/dd7d6BNVfQ0
         jkedbT9/XTOGgw2InrBamR2xauc5cbC4IsPAn5pUVxpRYKLH6tAuSHgAfs5yyiBlr0tS
         cgNNJCZmo1wA7Q8GzGD3iPRGDwHAF5ABvtKKoLM/rWA3AhLOZiHGcNUcwmYCd8d6zebV
         Y/U4dzzVN3J+w6DsCVrxVISNdpLpldHwQAOjvLs1X/f16XnjcMICKz7L3KqKTlr/7E2O
         MWplqgyi9wo4pq79tLw56Qeg1eReouIU5YAjXhHny5l6KdvPP3EUi18phjdGXka+VyBG
         g/1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtOyH0cGYswnZSU2gfKFiZH1C3seDlxqimb/AcL7A435VXur09XAN24+54J9Mmf7//uCsZpOKgq3YLhyCnKRirt4qGQ4zVVjiehQJhfg==
X-Gm-Message-State: AOJu0YwEIlXKSOk+8BeLYa7SylbNAViSd3IJRcW0KuG3V56I/1zws/ZY
	MthGEPeM77uhsivuMRyWOwyKHQWl0Jo3aqYPqHXpieJwVMkdpmoKjcAMKG0TJ1Q9U0lyvxi7och
	odLOU+dEsDjajGrQcRhRJRgdmoVcEmHZ0J/9D
X-Google-Smtp-Source: AGHT+IFaz0i8cgEfY0DYlrzEKrDKTNo5RklXtakhOCYBmYhqAaimHaovnYvcnFQZUHdgJHAfZ9A9l/1Vg2XhMu6EH+c=
X-Received: by 2002:a05:600c:3ba9:b0:41c:ab7:f9af with SMTP id
 5b1f17b1804b1-4215c0da3e7mr514005e9.3.1717631592034; Wed, 05 Jun 2024
 16:53:12 -0700 (PDT)
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
In-Reply-To: <CAJD7tkbhWYzx=6YmzAh0F+cK-_Bn8mPOH7gMbQS7YVXmaFSgFg@mail.gmail.com>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 5 Jun 2024 17:52:34 -0600
Message-ID: <CAOUHufZ8BTTx1LoXHjHGnzJE9dzyv8EnvhpXMUm0NOt=P5KHVg@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Yosry Ahmed <yosryahmed@google.com>
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Nhat Pham <nphamcs@gmail.com>, "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Chengming Zhou <chengming.zhou@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 5, 2024 at 5:42=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com> =
wrote:
>
> On Wed, Jun 5, 2024 at 4:04=E2=80=AFPM Erhard Furtner <erhard_f@mailbox.o=
rg> wrote:
> >
> > On Tue, 4 Jun 2024 20:03:27 -0700
> > Yosry Ahmed <yosryahmed@google.com> wrote:
> >
> > > Could you check if the attached patch helps? It basically changes the
> > > number of zpools from 32 to min(32, nr_cpus).
> >
> > Thanks! The patch does not fix the issue but it helps.
> >
> > Means I still get to see the 'kswapd0: page allocation failure' in the =
dmesg, a 'stress-ng-vm: page allocation failure' later on, another kswapd0 =
error later on, etc. _but_ the machine keeps running the workload, stays us=
able via VNC and I get no hard crash any longer.
> >
> > Without patch kswapd0 error and hard crash (need to power-cycle) <3min.=
 With patch several kswapd0 errors but running for 2 hrs now. I double chec=
ked this to be sure.
>
> Thanks for trying this out. This is interesting, so even two zpools is
> too much fragmentation for your use case.

Now I'm a little bit skeptical that the problem is due to fragmentation.

> I think there are multiple ways to go forward here:
> (a) Make the number of zpools a config option, leave the default as
> 32, but allow special use cases to set it to 1 or similar. This is
> probably not preferable because it is not clear to users how to set
> it, but the idea is that no one will have to set it except special use
> cases such as Erhard's (who will want to set it to 1 in this case).
>
> (b) Make the number of zpools scale linearly with the number of CPUs.
> Maybe something like nr_cpus/4 or nr_cpus/8. The problem with this
> approach is that with a large number of CPUs, too many zpools will
> start having diminishing returns. Fragmentation will keep increasing,
> while the scalability/concurrency gains will diminish.
>
> (c) Make the number of zpools scale logarithmically with the number of
> CPUs. Maybe something like 4log2(nr_cpus). This will keep the number
> of zpools from increasing too much and close to the status quo. The
> problem is that at a small number of CPUs (e.g. 2), 4log2(nr_cpus)
> will actually give a nr_zpools > nr_cpus. So we will need to come up
> with a more fancy magic equation (e.g. 4log2(nr_cpus/4)).
>
> (d) Make the number of zpools scale linearly with memory. This makes
> more sense than scaling with CPUs because increasing the number of
> zpools increases fragmentation, so it makes sense to limit it by the
> available memory. This is also more consistent with other magic
> numbers we have (e.g. SWAP_ADDRESS_SPACE_SHIFT).
>
> The problem is that unlike zswap trees, the zswap pool is not
> connected to the swapfile size, so we don't have an indication for how
> much memory will be in the zswap pool. We can scale the number of
> zpools with the entire memory on the machine during boot, but this
> seems like it would be difficult to figure out, and will not take into
> consideration memory hotplugging and the zswap global limit changing.
>
> (e) A creative mix of the above.
>
> (f) Something else (probably simpler).
>
> I am personally leaning toward (c), but I want to hear the opinions of
> other people here. Yu, Vlastimil, Johannes, Nhat? Anyone else?

I double checked that commit and didn't find anything wrong. If we are
all in the mood of getting to the bottom, can we try using only 1
zpool while there are 2 available? I.e.,

static struct zpool *zswap_find_zpool(struct zswap_entry *entry)
{
 - return entry->pool->zpools[hash_ptr(entry, ilog2(ZSWAP_NR_ZPOOLS))];
 + return entry->pool->zpools[0];
}

> In the long-term, I think we may want to address the lock contention
> in zsmalloc itself instead of zswap spawning multiple zpools.
>
> >
> > The patch did not apply cleanly on v6.9.3 so I applied it on v6.10-rc2.=
 dmesg of the current v6.10-rc2 run attached.
> >
> > Regards,
> > Erhard
