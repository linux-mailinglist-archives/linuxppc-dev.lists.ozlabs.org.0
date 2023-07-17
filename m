Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F583755EB5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 10:47:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256 header.s=google header.b=e52IJgo7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4G0x0hTxz3cXL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 18:47:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256 header.s=google header.b=e52IJgo7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=semihalf.com (client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com; envelope-from=jaz@semihalf.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4Fcy69q1z2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 18:29:52 +1000 (AEST)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-345ff33d286so22420995ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 01:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1689582586; x=1692174586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KrEcIar0BkfpmBL+8BCmNKqe2TUSK3LL+WBdNYsOjsM=;
        b=e52IJgo7nORao0Gl4I5dRpwwbrYRCXZTSuwaC/thRVodGrQS/Ih+iZx/Zsqn89WU3w
         pQgXUWQS+Vk59/Fh6rrIEqzCQJkEny2i0gy7zEPOvxwj9yUxhnNvrizRbt8YsZpplHpx
         RjVLFZyrzR9wafddakUgpMo5lLKlNumHP6uiacp/wGVyLbBbCgrHIUP/7snpf7XV2sof
         jlaeLm95LpwgAuzcjO7UCvT+e3bh2UJ0I6TbCUpKBOZvGLRTw6wJXY5zbY52dacz1/1P
         iPPOvh8ArwyYCroEOLn3Y8OJKVgd78PUACDF8tTPiPB+Om3hyy+66x8dhT2yU/74h83y
         v2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689582586; x=1692174586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KrEcIar0BkfpmBL+8BCmNKqe2TUSK3LL+WBdNYsOjsM=;
        b=eSDiT6kMhpbbMz0sd1bf0LTnCHvNlVY4r8IfBoqkguESadcVMIITdqJEhVssryHpvX
         /q2sTBEdWcd5bOkaI3ZlUnQVSK3DI1xMHwKSEq3r4WhEbrHSJtGMYcxviyeKfEuvKuRR
         dhw/hcr1rWCa4tXTBrravnDzUczthjDtRRUFUEKTLWvmQ4IsQ71JU0i/9Z7v7W6zYU4H
         +K82C4BoioIEvz4+7EGfd6sKBG4loMTTm4rX//b4yJ43TlAjFX7tIVu3mDN5nL9afmpW
         rklNQC41MjfOVeKyx0snK1wjauURJAhGahI+FtN61ygXC5bhCZQWes2ud9LgbPrxWVaR
         0qnQ==
X-Gm-Message-State: ABy/qLb9VMbraUQ6l/22/i7Vx9Dl9byyWqe2SPIUwmDrl+pi1l+ectfy
	NMAXLIGj4E2l4CWy4cZcWActuZU7PkP5uSS2Ti0UUQ==
X-Google-Smtp-Source: APBJJlGE7jn73weZAb7Q+GH4ouydfCd9ILtA9ynYfWdyB1I4k5TGE6qNhhrOJBaOwSkah9YrBoRDKcKZ9t95G975sJc=
X-Received: by 2002:a92:d4d2:0:b0:345:d470:baa6 with SMTP id
 o18-20020a92d4d2000000b00345d470baa6mr9664500ilm.29.1689582586220; Mon, 17
 Jul 2023 01:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230630155936.3015595-1-jaz@semihalf.com> <20230714-gauner-unsolidarisch-fc51f96c61e8@brauner>
In-Reply-To: <20230714-gauner-unsolidarisch-fc51f96c61e8@brauner>
From: Grzegorz Jaszczyk <jaz@semihalf.com>
Date: Mon, 17 Jul 2023 10:29:34 +0200
Message-ID: <CAH76GKPF4BjJLrzLBW8k12ATaAGADeMYc2NQ9+j0KgRa0pomUw@mail.gmail.com>
Subject: Re: [PATCH 0/2] eventfd: simplify signal helpers
To: Christian Brauner <brauner@kernel.org>, Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 17 Jul 2023 18:42:53 +1000
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
Cc: linux-aio@kvack.org, Muchun Song <muchun.song@linux.dev>, Tony Krowiak <akrowiak@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>, Tom Rix <trix@redhat.com>, Jason Wang <jasowang@redhat.com>, Roman Gushchin <roman.gushchin@linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, linux-mm@kvack.org, Kirti Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, Diana Craciun <diana.craciun@oss.nxp.com>, Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>, Fei Li <fei1.li@intel.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marcin Wojtas <mw@semihalf.com>, Arnd Bergmann <arnd@arndb.de>, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, x86@kernel.org, Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Moritz Fischer <mdf@kernel.org>, Frederic 
 Barrat <fbarrat@linux.ibm.com>, Xu Yilun <yilun.xu@intel.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-fpga@vger.kernel.org, Zhi Wang <zhi.a.wang@intel.com>, Wu Hao <hao.wu@intel.com>, Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andrew Donnellan <ajd@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org, Dominik Behr <dbehr@chromium.org>, intel-gfx@lists.freedesktop.org, Sean Christopherson <seanjc@google.com>, Eric Auger <eric.auger@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Harald Freudenberger <freude@linux.ibm.com>, kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, virtualization@lists.linux-foundation.org, intel-gvt-dev@lists.freedesktop.org, io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, netdev@vger.kernel.org, Oded Gabbay <ogabba
 y@kernel.org>, linux-usb@vger.kernel.org, Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>, "Michael S. Tsirkin" <mst@redhat.com>, Sven Schnelle <svens@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>, linuxppc-dev@lists.ozlabs.org, Pavel Begunkov <asml.silence@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pt., 14 lip 2023 o 09:05 Christian Brauner <brauner@kernel.org> napisa=C5=
=82(a):
>
> On Thu, Jul 13, 2023 at 11:10:54AM -0600, Alex Williamson wrote:
> > On Thu, 13 Jul 2023 12:05:36 +0200
> > Christian Brauner <brauner@kernel.org> wrote:
> >
> > > Hey everyone,
> > >
> > > This simplifies the eventfd_signal() and eventfd_signal_mask() helper=
s
> > > by removing the count argument which is effectively unused.
> >
> > We have a patch under review which does in fact make use of the
> > signaling value:
> >
> > https://lore.kernel.org/all/20230630155936.3015595-1-jaz@semihalf.com/
>
> Huh, thanks for the link.
>
> Quoting from
> https://patchwork.kernel.org/project/kvm/patch/20230307220553.631069-1-ja=
z@semihalf.com/#25266856
>
> > Reading an eventfd returns an 8-byte value, we generally only use it
> > as a counter, but it's been discussed previously and IIRC, it's possibl=
e
> > to use that value as a notification value.
>
> So the goal is to pipe a specific value through eventfd? But it is
> explicitly a counter. The whole thing is written around a counter and
> each write and signal adds to the counter.
>
> The consequences are pretty well described in the cover letter of
> v6 https://lore.kernel.org/all/20230630155936.3015595-1-jaz@semihalf.com/
>
> > Since the eventfd counter is used as ACPI notification value
> > placeholder, the eventfd signaling needs to be serialized in order to
> > not end up with notification values being coalesced. Therefore ACPI
> > notification values are buffered and signalized one by one, when the
> > previous notification value has been consumed.
>
> But isn't this a good indication that you really don't want an eventfd
> but something that's explicitly designed to associate specific data with
> a notification? Using eventfd in that manner requires serialization,
> buffering, and enforces ordering.
>
> I have no skin in the game aside from having to drop this conversion
> which I'm fine to do if there are actually users for this btu really,
> that looks a lot like abusing an api that really wasn't designed for
> this.

https://patchwork.kernel.org/project/kvm/patch/20230307220553.631069-1-jaz@=
semihalf.com/
was posted at the beginig of March and one of the main things we've
discussed was the mechanism for propagating acpi notification value.
We've endup with eventfd as the best mechanism and have actually been
using it from v2. I really do not want to waste this effort, I think
we are quite advanced with v6 now. Additionally we didn't actually
modify any part of eventfd support that was in place, we only used it
in a specific (and discussed beforehand) way.
