Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3884A8FDB12
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 01:59:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ovBUShNE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvkw82qJcz3cVb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 09:59:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ovBUShNE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::92e; helo=mail-ua1-x92e.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvkvN4HDNz30W9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 09:58:55 +1000 (AEST)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-80ae09dce7eso117006241.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2024 16:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717631932; x=1718236732; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sf16gINAoan45PEw6aWCMW995aicLFXyStP7EDjqDE8=;
        b=ovBUShNEYE339OXN9rISIQ9K700B7+vbsyHhOlfW0fPqctzSZD6cpZBs6xZ8jMFuuI
         xXHvKzyA9QHWfzF4jE84VpvMR6KEzYO7jPYoGbs9s49NJbBbnoH/XWjyadW359QjqI1r
         R7EJQgJf7CNnflTbgGwr2U9ZILdJnZoAIX6JhbVi6k5QY3ZbgP40ugpxSeT9VT3/Jr6Q
         uAUiBuoJ3JpcJLn9/55o4ZRSgu+G9Vi5YKT/HLFeHtgMg10bHOhcDJdT8SH1kxPJ7ByQ
         xqb+D/cYn7kgJT6bYZBrQGepPzWHO1+jo654UNgAXJMblTP/Gz+krOysNHU4dTLUeI87
         1Xng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717631932; x=1718236732;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sf16gINAoan45PEw6aWCMW995aicLFXyStP7EDjqDE8=;
        b=fuo01sDsXoq726Lz9Ux9TS9kU0HBOgLDlN4D1fWz6JTzW2fO7Y61XUmCUey/CmU4HE
         OGllCSocZQtcfqICXLyv+lgV0lvTcAFZtqvrliT0XznLzVqfVuLMhtpTeBrnqW0St2ZB
         ZkqYSdXy8mVD0IPoC3VbGJ3NGOh7yrfOTCbh+H3hI72SN30uEdmbpzFoNcBOsB94rh4D
         ZQxfTprJepyY0mQCsyCd/slOLEsn3Rg5gkVFWA9DUrppRVTbel+pyRDlk9fRzVSAJwGW
         HpFL2dLkPGaUsI0AFkcOu2acIOZEhiM2GPILPwP4R567orV7CwskTiBJvhSKXC7XbZ8F
         Iytg==
X-Forwarded-Encrypted: i=1; AJvYcCUElBsfN3jebBioOUWWeDWzK300YXzIp//8RNKp7MSNnMOdMc1FeZ+H9UXByxcU5pqZq/lie3xJ/qrOPFP+cuRMzJXtVZsckgFxLxTPIg==
X-Gm-Message-State: AOJu0YxDFICN1PbEbp0dKZCSr+7slDNDe4Hphi+UgxlMscgRP2g6JhOB
	utpVX/UnbVqW4WF93hh3TRY5AisQxlALG0XSUtMkPBtE07nLINIwfeZGGevs19kwLVfwJSLn0Or
	NHyKKpb+Mv5nMnUtvgpAjxH2DUy0SzoZ5esSpmlgI4wLCqhSWVA+g
X-Google-Smtp-Source: AGHT+IHbHA0St5dI25tg2hHcg4EX0Nf8s65cWyX/QQ7AUSGrQyjJfHgyXWxF02+/PyYjZhft5J0qpp3TmAYsLBAeBIM=
X-Received: by 2002:a67:f58e:0:b0:47b:fe0b:a92e with SMTP id
 ada2fe7eead31-48c04924d62mr4753406137.16.1717631931930; Wed, 05 Jun 2024
 16:58:51 -0700 (PDT)
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
 <CAOUHufZ8BTTx1LoXHjHGnzJE9dzyv8EnvhpXMUm0NOt=P5KHVg@mail.gmail.com>
In-Reply-To: <CAOUHufZ8BTTx1LoXHjHGnzJE9dzyv8EnvhpXMUm0NOt=P5KHVg@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 5 Jun 2024 16:58:11 -0700
Message-ID: <CAJD7tkai+e39hFDJkQRZ_Zg_Yp8OWx2uQfawT28ZZTD=Jvh9EQ@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Yu Zhao <yuzhao@google.com>
Content-Type: multipart/mixed; boundary="00000000000029497e061a2d592e"
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

--00000000000029497e061a2d592e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 4:53=E2=80=AFPM Yu Zhao <yuzhao@google.com> wrote:
>
> On Wed, Jun 5, 2024 at 5:42=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com=
> wrote:
> >
> > On Wed, Jun 5, 2024 at 4:04=E2=80=AFPM Erhard Furtner <erhard_f@mailbox=
.org> wrote:
> > >
> > > On Tue, 4 Jun 2024 20:03:27 -0700
> > > Yosry Ahmed <yosryahmed@google.com> wrote:
> > >
> > > > Could you check if the attached patch helps? It basically changes t=
he
> > > > number of zpools from 32 to min(32, nr_cpus).
> > >
> > > Thanks! The patch does not fix the issue but it helps.
> > >
> > > Means I still get to see the 'kswapd0: page allocation failure' in th=
e dmesg, a 'stress-ng-vm: page allocation failure' later on, another kswapd=
0 error later on, etc. _but_ the machine keeps running the workload, stays =
usable via VNC and I get no hard crash any longer.
> > >
> > > Without patch kswapd0 error and hard crash (need to power-cycle) <3mi=
n. With patch several kswapd0 errors but running for 2 hrs now. I double ch=
ecked this to be sure.
> >
> > Thanks for trying this out. This is interesting, so even two zpools is
> > too much fragmentation for your use case.
>
> Now I'm a little bit skeptical that the problem is due to fragmentation.
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
> > (d) Make the number of zpools scale linearly with memory. This makes
> > more sense than scaling with CPUs because increasing the number of
> > zpools increases fragmentation, so it makes sense to limit it by the
> > available memory. This is also more consistent with other magic
> > numbers we have (e.g. SWAP_ADDRESS_SPACE_SHIFT).
> >
> > The problem is that unlike zswap trees, the zswap pool is not
> > connected to the swapfile size, so we don't have an indication for how
> > much memory will be in the zswap pool. We can scale the number of
> > zpools with the entire memory on the machine during boot, but this
> > seems like it would be difficult to figure out, and will not take into
> > consideration memory hotplugging and the zswap global limit changing.
> >
> > (e) A creative mix of the above.
> >
> > (f) Something else (probably simpler).
> >
> > I am personally leaning toward (c), but I want to hear the opinions of
> > other people here. Yu, Vlastimil, Johannes, Nhat? Anyone else?
>
> I double checked that commit and didn't find anything wrong. If we are
> all in the mood of getting to the bottom, can we try using only 1
> zpool while there are 2 available? I.e.,

Erhard, do you mind checking if Yu's diff below to use a single zpool
fixes the problem completely? There is also an attached patch that
does the same thing if this is easier to apply for you.

>
> static struct zpool *zswap_find_zpool(struct zswap_entry *entry)
> {
>  - return entry->pool->zpools[hash_ptr(entry, ilog2(ZSWAP_NR_ZPOOLS))];
>  + return entry->pool->zpools[0];
> }
>
> > In the long-term, I think we may want to address the lock contention
> > in zsmalloc itself instead of zswap spawning multiple zpools.
> >
> > >
> > > The patch did not apply cleanly on v6.9.3 so I applied it on v6.10-rc=
2. dmesg of the current v6.10-rc2 run attached.
> > >
> > > Regards,
> > > Erhard

--00000000000029497e061a2d592e
Content-Type: application/octet-stream; 
	name="0001-mm-zswap-set-ZSWAP_NR_ZPOOLS-to-1.patch"
Content-Disposition: attachment; 
	filename="0001-mm-zswap-set-ZSWAP_NR_ZPOOLS-to-1.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lx2ho9sj0>
X-Attachment-Id: f_lx2ho9sj0

RnJvbSBjNmM0NzdkYWU5Y2I4YmNkZWZhZjFjMWEwZTg4NjllZmE4YmZlM2Y5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZb3NyeSBBaG1lZCA8eW9zcnlhaG1lZEBnb29nbGUuY29tPgpE
YXRlOiBXZWQsIDUgSnVuIDIwMjQgMjM6NTY6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBtbTog
enN3YXA6IHNldCBaU1dBUF9OUl9aUE9PTFMgdG8gMQoKU2lnbmVkLW9mZi1ieTogWW9zcnkgQWht
ZWQgPHlvc3J5YWhtZWRAZ29vZ2xlLmNvbT4KLS0tCiBtbS96c3dhcC5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbW0v
enN3YXAuYyBiL21tL3pzd2FwLmMKaW5kZXggYTUwZTI5ODZjZDJmYS4uMmJmYTkxNTE4ZDQwNSAx
MDA2NDQKLS0tIGEvbW0venN3YXAuYworKysgYi9tbS96c3dhcC5jCkBAIC0xMjQsNyArMTI0LDcg
QEAgbW9kdWxlX3BhcmFtX25hbWVkKGFjY2VwdF90aHJlc2hvbGRfcGVyY2VudCwgenN3YXBfYWNj
ZXB0X3Rocl9wZXJjZW50LAogCQkgICB1aW50LCAwNjQ0KTsKIAogLyogTnVtYmVyIG9mIHpwb29s
cyBpbiB6c3dhcF9wb29sIChlbXBpcmljYWxseSBkZXRlcm1pbmVkIGZvciBzY2FsYWJpbGl0eSkg
Ki8KLSNkZWZpbmUgWlNXQVBfTlJfWlBPT0xTIDMyCisjZGVmaW5lIFpTV0FQX05SX1pQT09MUyAx
CiAKIC8qIEVuYWJsZS9kaXNhYmxlIG1lbW9yeSBwcmVzc3VyZS1iYXNlZCBzaHJpbmtlci4gKi8K
IHN0YXRpYyBib29sIHpzd2FwX3Nocmlua2VyX2VuYWJsZWQgPSBJU19FTkFCTEVEKAotLSAKMi40
NS4xLjQ2Ny5nYmFiMTU4OWZjMC1nb29nCgo=
--00000000000029497e061a2d592e--
