Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C19546BF549
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 23:42:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdfJR53hjz3f5q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 09:41:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q4Pfdo1k;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q4Pfdo1k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q4Pfdo1k;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q4Pfdo1k;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdfHX18cfz3bgv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 09:41:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679092867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DTqXt+xo9t4MKZl9inPofpb9h7U7JlyPPD0kMbn7WHE=;
	b=Q4Pfdo1kJSbSszSDAfYu1UZhWlMfwJsTc+tsbSNCHGIyAf5PvQY3x1F6so/Zj11JTNmHQL
	pOIsSUzICrTuXlsSHiSgeyD5LdqLilnsU/pdkcMrgPOQd8wm7aFKAGs8rnht/WYwAMqSyC
	w3Fs7CexB8aT9uRZryIhR9gFFZhChAQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679092867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DTqXt+xo9t4MKZl9inPofpb9h7U7JlyPPD0kMbn7WHE=;
	b=Q4Pfdo1kJSbSszSDAfYu1UZhWlMfwJsTc+tsbSNCHGIyAf5PvQY3x1F6so/Zj11JTNmHQL
	pOIsSUzICrTuXlsSHiSgeyD5LdqLilnsU/pdkcMrgPOQd8wm7aFKAGs8rnht/WYwAMqSyC
	w3Fs7CexB8aT9uRZryIhR9gFFZhChAQ=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-9cy6m54SPuKm6Plwd3UQfQ-1; Fri, 17 Mar 2023 18:41:04 -0400
X-MC-Unique: 9cy6m54SPuKm6Plwd3UQfQ-1
Received: by mail-il1-f198.google.com with SMTP id q8-20020a92ca48000000b00320ed437f04so3072666ilo.19
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 15:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092863;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DTqXt+xo9t4MKZl9inPofpb9h7U7JlyPPD0kMbn7WHE=;
        b=A6MUro5zcWPCtncN3Gec/XsTjrQotcDKUbivqwzMCFvLM0an2/cjY7+SXud+WS/tlu
         xxgOhHXWspfz+KHGLAo/EIIcygIX3UA0pkSRUj0wmIJqhfUd9FJn2cIZtMA3m2fatgIo
         nGU0CEYPjevRxDzjSBh31mGMNo05jsx+KHj5S/rHh17t2v3/yQQjItPe9ciydqf0eqD5
         wbHSzAhdRfZPD3TVuQWGQGX4GdmyipbKeClQMWhhRGzf/PEiRJFhE7Zx2N8wmoZJJzDU
         9XOrxdKD+IQXTWu0wIMehHEZt9nVS5PgviZtfWv0zW2f8mrCeCqoCY/W/lKlA4quGeoS
         Slqg==
X-Gm-Message-State: AO0yUKXhhO4yl+TA3U7iGvdUVawH2HkXS58gIdJ1O6lkRbVdRr8X9xxN
	SgIrzQvjv8wmE3pvtMdDEorpgTeJxbwZTKaP6t4/RaMERW7kDSIHWJWq4EIOJfGgRY9EJaMedhQ
	Q4B9jW9zxM0OrCrZ6rLkRpjCKuQ==
X-Received: by 2002:a92:c6ca:0:b0:317:951d:1696 with SMTP id v10-20020a92c6ca000000b00317951d1696mr85619ilm.3.1679092863440;
        Fri, 17 Mar 2023 15:41:03 -0700 (PDT)
X-Google-Smtp-Source: AK7set87c1NIAKUmEpfr4tzQnIJXEdWv1u+znmZLZ35q/KPacnrvpXDdPzfrlB+0sZFBlBtfHyN/iw==
X-Received: by 2002:a92:c6ca:0:b0:317:951d:1696 with SMTP id v10-20020a92c6ca000000b00317951d1696mr85571ilm.3.1679092863136;
        Fri, 17 Mar 2023 15:41:03 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id x10-20020a92300a000000b0030c0dce44b1sm930381ile.15.2023.03.17.15.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:41:01 -0700 (PDT)
Date: Fri, 17 Mar 2023 16:40:59 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 0/7] introduce vm_flags modifier functions
Message-ID: <20230317164059.466d1c70.alex.williamson@redhat.com>
In-Reply-To: <CAJuCfpFkKuyBJkk8OzWEu2YCg-UYooS4bHuDaXvnCbeR-cBdVw@mail.gmail.com>
References: <20230126193752.297968-1-surenb@google.com>
	<20230314141144.6a0892e6.alex.williamson@redhat.com>
	<CAJuCfpFkKuyBJkk8OzWEu2YCg-UYooS4bHuDaXvnCbeR-cBdVw@mail.gmail.com>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, Jason Wang <jasowang@redhat.com>, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, dimitri.sivanich@hpe.com, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, k
 ent.overstreet@linux.dev, linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 Mar 2023 12:08:32 -0700
Suren Baghdasaryan <surenb@google.com> wrote:

> On Tue, Mar 14, 2023 at 1:11=E2=80=AFPM Alex Williamson
> <alex.williamson@redhat.com> wrote:
> >
> > On Thu, 26 Jan 2023 11:37:45 -0800
> > Suren Baghdasaryan <surenb@google.com> wrote:
> > =20
> > > This patchset was originally published as a part of per-VMA locking [=
1] and
> > > was split after suggestion that it's viable on its own and to facilit=
ate
> > > the review process. It is now a preprequisite for the next version of=
 per-VMA
> > > lock patchset, which reuses vm_flags modifier functions to lock the V=
MA when
> > > vm_flags are being updated.
> > >
> > > VMA vm_flags modifications are usually done under exclusive mmap_lock
> > > protection because this attrubute affects other decisions like VMA me=
rging
> > > or splitting and races should be prevented. Introduce vm_flags modifi=
er
> > > functions to enforce correct locking.
> > >
> > > The patchset applies cleanly over mm-unstable branch of mm tree. =20
> >
> > With this series, vfio-pci developed a bunch of warnings around not
> > holding the mmap_lock write semaphore while calling
> > io_remap_pfn_range() from our fault handler, vfio_pci_mmap_fault().
> >
> > I suspect vdpa has the same issue for their use of remap_pfn_range()
> > from their fault handler, JasonW, MST, FYI.
> >
> > It also looks like gru_fault() would have the same issue, Dimitri.
> >
> > In all cases, we're preemptively setting vm_flags to what
> > remap_pfn_range_notrack() uses, so I thought we were safe here as I
> > specifically remember trying to avoid changing vm_flags from the
> > fault handler.  But apparently that doesn't take into account
> > track_pfn_remap() where VM_PAT comes into play.
> >
> > The reason for using remap_pfn_range() on fault in vfio-pci is that
> > we're mapping device MMIO to userspace, where that MMIO can be disabled
> > and we'd rather zap the mapping when that occurs so that we can sigbus
> > the user rather than allow the user to trigger potentially fatal bus
> > errors on the host.
> >
> > Peter Xu has suggested offline that a non-lazy approach to reinsert the
> > mappings might be more inline with mm expectations relative to touching
> > vm_flags during fault.  What's the right solution here?  Can the fault
> > handling be salvaged, is proactive remapping the right approach, or is
> > there something better?  Thanks, =20
>=20
> Hi Alex,
> If in your case it's safe to change vm_flags without holding exclusive
> mmap_lock, maybe you can use __vm_flags_mod() the way I used it in
> https://lore.kernel.org/all/20230126193752.297968-7-surenb@google.com,
> while explaining why this should be safe?

Hi Suren,

Thanks for the reply, but I'm not sure I'm following.  Are you
suggesting a bool arg added to io_remap_pfn_range(), or some new
variant of that function to conditionally use __vm_flags_mod() in place
of vm_flags_set() across the call chain?  Thanks,

Alex

