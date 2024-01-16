Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E1382F75D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 21:21:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=loIWYCWf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TF0l810RBz3cX8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jan 2024 07:21:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=loIWYCWf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TF0kF5tcsz3bwj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jan 2024 07:20:20 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a28ab7ae504so978468166b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 12:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705436417; x=1706041217; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3E2Y2gGlsfMwMpgThK3AbQt/GlaabuQMTiIlyvqmJY=;
        b=loIWYCWfYKu85JtDsHkqD64lS+RfTvKnkOqiO3NOUAIgqIP+npYpJI5gtjuCr5hsNJ
         Xtwz5AwEDWFSj84n5uyypDr0tq64TGmvNcLVx/PgZTevVftRsHzTdaUE0MxZxU+Jzkko
         HzwOWfZo7s+2n6EjBne+2LbabT0Ab86UzNPvhb51vAzGo4HXoAyy47aj5UIF0aGF/fd+
         aaYmsl5pYxf3oNV0xek9uq/1I+S+OES8YSWUaDnpZyZKwAbgWvDHG4wU+DO2RjKYsnFg
         RXXhrGxdsfyjkvMAmaZxs5RMGneIAT5R2UOTMlsec/8+jOsKlEaGMoPGQFFnIxcAMR8J
         ULdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705436417; x=1706041217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3E2Y2gGlsfMwMpgThK3AbQt/GlaabuQMTiIlyvqmJY=;
        b=Hj/WVRTjs2o0831mU2Hk9OUS7ufAwFMYI/W7xLeUM2SnRNw+1ENeorI02D4jCCXXdN
         ECXgSib87birZNcjuksTacrVnfZ2NSQQ/3cHltHbDR+udVFaQJX00ylI0yvRN8o8fgJW
         7snI+F089Qx+txVbX7Tf9dVSYvOPxmach9iqlZbMEyTtNXUy21AZL0IaOggbakGuXJIg
         4Gcmlmli11SQwWl48dT7BywR1WdsPSM+2bfVJQbE7OL6Pd3LW33vdJHRSldfQVAXMfqd
         43it/9BbqWOgA9R6cHs5Fl7trjgaO8IEkYWPpU89sJJFh6EIjt8V/JMTczuE3Z0L60VG
         XiYg==
X-Gm-Message-State: AOJu0YyN50hesN9zrCLJ5K21wudPqg8ZxgPzFOjj2oRsPQctGCeh/G4n
	dh+WzmdcdBJXM3dgCIBuzKTaiM8zxoFzJ06CEU817EDhFuyf
X-Google-Smtp-Source: AGHT+IEPFQwqltvYgFxlysBjGHd+0u+L4kfWHJuGtRT3TShDlHV6JS9iDCNOLsEInB40YpGF+P8XDD4PBoRyi2p/qPg=
X-Received: by 2002:a17:906:1457:b0:a27:915e:a306 with SMTP id
 q23-20020a170906145700b00a27915ea306mr3648666ejc.136.1705436417121; Tue, 16
 Jan 2024 12:20:17 -0800 (PST)
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com>
 <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
 <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
 <CAKEwX=P21VvVyfmAADzXe0=Mqz3Htyx9nQuiivLchcDZRumh6Q@mail.gmail.com> <ZaajDheNtqKkCoeD@infradead.org>
In-Reply-To: <ZaajDheNtqKkCoeD@infradead.org>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 16 Jan 2024 12:19:39 -0800
Message-ID: <CAJD7tkaYu2+g-3y3k35KaiLEsrFVtfpSS=9uv+ic3Zwv6fTS3w@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Christoph Hellwig <hch@infradead.org>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org, Chris Li <chrisl@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>, Vitaly Wool <vitaly.wool@konsulko.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 16, 2024 at 7:39=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Fri, Jan 12, 2024 at 04:38:30PM -0800, Nhat Pham wrote:
> > >
> > > I thought deprecating z3fold is the low hanging fruit. Then, once we
> > > can sort out the MMU dependency in zsmalloc, we can go after zbud as
> > > well.
> >
> > Makes sense to me. Should we do the same thing to zbud? We probably
> > have even less of a case for it, no?
>
> Is there any user visible effect of switching the allocator?  If not it
> seems a bit pointless to deprecate them vs just removing them (or maybe
> making z3fold depend on !MMU for now).

Well, better compression ratios for one :)

I think a long time ago there were complaints that zsmalloc had higher
latency than zbud/z3fold, but since then a lot of things have changed
(including nice compaction optimization from Sergey, and compaction
was one of the main factors AFAICT). Also, recent experiments that
Chris Li conducted showed that (at least in our setup), the
decompression is only a small part of the fault latency with zswap
(i.e. not the main factor) -- so I am not sure if it actually matters
in practice.

That said, I have not conducted any experiments personally with z3fold
or zbud, which is why I proposed the conservative approach of marking
as deprecated first. However, if others believe this is unnecessary I
am fine with removal as well. Whatever we agree on is fine by me.
