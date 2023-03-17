Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 607676BF5EF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 00:05:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pdfq81Ys3z3f3r
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 10:05:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qadP/ybP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qadP/ybP;
	dkim-atps=neutral
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdfpG23F4z3bhX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 10:04:21 +1100 (AEDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-544b959a971so86960697b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 16:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679094256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2C+V/8voXxzsC2KICa9qM/vADLcn6b/HYkR0aaSEj8=;
        b=qadP/ybP7YOevfO52m8wnUG+YiHdnOn5wiTDCLm2VjUVfUOG5wAohBATwM/IL4n8wK
         EUonCnQCrjtmnZRLgAC03JV9/+QCTi0BqZVDxpFq8SqiyAubeFWwbgMfqbnZcZRTl18c
         P1tSJdCagaQjOfouDP1NBm1bVz0SB49wHTXq7N7Gtb10cvdkyrfhhznn8dfTLLzfQ5xn
         VHTktar+xrik+S2ltlWJ4wrDf2vjCcW8doNdhQxWFwKhPnui+CRO0C1yWNJIJNiJ5rCB
         wKdladKdkllKCIdJYUqadUqaVvHHE+1Xq2vf4P6OzQfmw3LxIqhH43Ggd4aPaJltT2yX
         CDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679094256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w2C+V/8voXxzsC2KICa9qM/vADLcn6b/HYkR0aaSEj8=;
        b=dwXlx4Fh5FlHXaZnsqaF/l/PYWzAroNeEIsodGLV+n9AnzxJBWlR5MiKXGJEEW6rgF
         IAHLlEc4Uk9ldHXQvpX38qjG9PzlJCsfLxK6I2wdJsXb4lp3aeAe8DSlMfT7CqXh078K
         5lx8Ct+L6oh1PPC23VRRnx+uGwg8YdRjtyC0HfM0FYxcy/p3TbxUqkkWwFSYofQQfjnw
         EVMpce/p4oIKkVbf6EL1hBCpSSdIAs80ewSuu3fyWe+KwD1QGxUg44j3LsQAEb3WQjzS
         cPPlEpOEp3Z9EtcnGfLZXc8MVIZ7T+kBMRyYtgtluBoKyxrZ+4fN8oP3O6coj9VtQ4Ip
         HXmg==
X-Gm-Message-State: AO0yUKUzoLVMLXCQGmses75VfQdzCFyHXbZOGn9symaf17NPhxZWit+J
	zqxIEMKusmBg5+3EHEujcsD5yxYP5pdZTM8+DFqErg==
X-Google-Smtp-Source: AK7set8hywCBVoHzE2HL9COIHr0uPX9RzbYv5voQJIobm2WkCY5b7MlTeFVb42odO3dQtnivkNUSPb3IzOuPUKYTNlk=
X-Received: by 2002:a81:c148:0:b0:544:51f7:83c5 with SMTP id
 e8-20020a81c148000000b0054451f783c5mr5551479ywl.1.1679094255994; Fri, 17 Mar
 2023 16:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230126193752.297968-1-surenb@google.com> <20230314141144.6a0892e6.alex.williamson@redhat.com>
 <CAJuCfpFkKuyBJkk8OzWEu2YCg-UYooS4bHuDaXvnCbeR-cBdVw@mail.gmail.com> <20230317164059.466d1c70.alex.williamson@redhat.com>
In-Reply-To: <20230317164059.466d1c70.alex.williamson@redhat.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 17 Mar 2023 16:04:05 -0700
Message-ID: <CAJuCfpFZ06DCzO01gFv4944tXtyPWt_KxidLRVZLY_wMgtsN1Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] introduce vm_flags modifier functions
To: Alex Williamson <alex.williamson@redhat.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, Jason Wang <jasowang@redhat.com>, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, dimitri.sivanich@hpe.com, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, ke
 nt.overstreet@linux.dev, linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 17, 2023 at 3:41=E2=80=AFPM Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> On Fri, 17 Mar 2023 12:08:32 -0700
> Suren Baghdasaryan <surenb@google.com> wrote:
>
> > On Tue, Mar 14, 2023 at 1:11=E2=80=AFPM Alex Williamson
> > <alex.williamson@redhat.com> wrote:
> > >
> > > On Thu, 26 Jan 2023 11:37:45 -0800
> > > Suren Baghdasaryan <surenb@google.com> wrote:
> > >
> > > > This patchset was originally published as a part of per-VMA locking=
 [1] and
> > > > was split after suggestion that it's viable on its own and to facil=
itate
> > > > the review process. It is now a preprequisite for the next version =
of per-VMA
> > > > lock patchset, which reuses vm_flags modifier functions to lock the=
 VMA when
> > > > vm_flags are being updated.
> > > >
> > > > VMA vm_flags modifications are usually done under exclusive mmap_lo=
ck
> > > > protection because this attrubute affects other decisions like VMA =
merging
> > > > or splitting and races should be prevented. Introduce vm_flags modi=
fier
> > > > functions to enforce correct locking.
> > > >
> > > > The patchset applies cleanly over mm-unstable branch of mm tree.
> > >
> > > With this series, vfio-pci developed a bunch of warnings around not
> > > holding the mmap_lock write semaphore while calling
> > > io_remap_pfn_range() from our fault handler, vfio_pci_mmap_fault().
> > >
> > > I suspect vdpa has the same issue for their use of remap_pfn_range()
> > > from their fault handler, JasonW, MST, FYI.
> > >
> > > It also looks like gru_fault() would have the same issue, Dimitri.
> > >
> > > In all cases, we're preemptively setting vm_flags to what
> > > remap_pfn_range_notrack() uses, so I thought we were safe here as I
> > > specifically remember trying to avoid changing vm_flags from the
> > > fault handler.  But apparently that doesn't take into account
> > > track_pfn_remap() where VM_PAT comes into play.
> > >
> > > The reason for using remap_pfn_range() on fault in vfio-pci is that
> > > we're mapping device MMIO to userspace, where that MMIO can be disabl=
ed
> > > and we'd rather zap the mapping when that occurs so that we can sigbu=
s
> > > the user rather than allow the user to trigger potentially fatal bus
> > > errors on the host.
> > >
> > > Peter Xu has suggested offline that a non-lazy approach to reinsert t=
he
> > > mappings might be more inline with mm expectations relative to touchi=
ng
> > > vm_flags during fault.  What's the right solution here?  Can the faul=
t
> > > handling be salvaged, is proactive remapping the right approach, or i=
s
> > > there something better?  Thanks,
> >
> > Hi Alex,
> > If in your case it's safe to change vm_flags without holding exclusive
> > mmap_lock, maybe you can use __vm_flags_mod() the way I used it in
> > https://lore.kernel.org/all/20230126193752.297968-7-surenb@google.com,
> > while explaining why this should be safe?
>
> Hi Suren,
>
> Thanks for the reply, but I'm not sure I'm following.  Are you
> suggesting a bool arg added to io_remap_pfn_range(), or some new
> variant of that function to conditionally use __vm_flags_mod() in place
> of vm_flags_set() across the call chain?  Thanks,

I think either way could work but after taking a closer look, both
ways would be quite ugly. If we could somehow identify that we are
handling a page fault and use __vm_flags_mod() without additional
parameters it would be more palatable IMHO...
Peter's suggestion to avoid touching vm_flags during fault would be
much cleaner but I'm not sure how easily that can be done.

>
> Alex
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
