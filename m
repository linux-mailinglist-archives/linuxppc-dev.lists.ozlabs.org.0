Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9FA6BF174
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 20:09:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdYbM4B6vz3cjF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 06:09:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=A9Xx39Vs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=A9Xx39Vs;
	dkim-atps=neutral
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdYZS5ByYz3bgk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 06:08:47 +1100 (AEDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-544b959a971so77546467b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 12:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679080124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtkQvqCybTAazWJPrit1AMvXQMfmRWKtxssDGkkt4aI=;
        b=A9Xx39VsDfAww1P3KBrqNePQW4nRTeWl/oDLqWC2n9XHSShzJU08lYLiMMTwNuGaEL
         KdK8emE8pLHmmgtPc3KiKRt8iMMNn6bunG0BxWE+/Y0kXLIqyLLMQ/d6v9MSPL73Gv8G
         55ALxvCKGbWb3efEI06Hlt57hqgzCVfid+MBX1/Uz7NSfxcBnnWoXIlEDRiTefNn2JGN
         Hpx42UiDje0uBZczcnQwT5097VwnM434IYLfWDKadih442QI8+PFv9m6tYDQUEFxb4rW
         vwF/X+YfmBG3+KdUHmX/M29EsSkeE9vOoDQ2BJ8aA2WNpChMeA9ztvHHxtdzHaiBKQyl
         Ar2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679080124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtkQvqCybTAazWJPrit1AMvXQMfmRWKtxssDGkkt4aI=;
        b=12njMInoXrT4L0pv/0+2vbRwESchF1htx9/60Nuexln2whLl9q9rhmzDn/d6hYHBVW
         zyZg16Vh31L8ll5cxURevCWCVozK9B8io/HDbA7Yuh3wSrzUlu6JSKLQ85uduBHHglZl
         NEro/jmlMFLVe96YdZA7AksopiOMEckeiCi4AEyjvgLBOWDWB0t9sj6vREja0e9EiRBW
         q7eGbRuO8VJDt0SIJ0MpIG6TkzzTpf754e4gAF9vbD36+qxomkkFeL/mQVW25D+uTSdy
         Ts/11EuHk0ZtwaSeBV1rDcf2bQynEA+Il7/PGVn7IGmbb5Mp22qHJZ38viZkcX/Kc0TO
         1nDw==
X-Gm-Message-State: AO0yUKUGwJIkwFdA5WSB9MobTOeVweI95/nBC/0VQkOyZkvTCoG6a9uv
	bG84rxcjt2aeEYTmGqtDHsiUxnKjCivyZeyxz6oEqA==
X-Google-Smtp-Source: AK7set9XdXibjKhLKLOpCgfHP3zHh4i0ReloLFIdYIvJHM4aukAMgg/kqZsVAHifAGiXEo7BWTSJHGdDz1qRr77kcJo=
X-Received: by 2002:a81:4517:0:b0:536:38b4:f50 with SMTP id
 s23-20020a814517000000b0053638b40f50mr5188310ywa.1.1679080123783; Fri, 17 Mar
 2023 12:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230126193752.297968-1-surenb@google.com> <20230314141144.6a0892e6.alex.williamson@redhat.com>
In-Reply-To: <20230314141144.6a0892e6.alex.williamson@redhat.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 17 Mar 2023 12:08:32 -0700
Message-ID: <CAJuCfpFkKuyBJkk8OzWEu2YCg-UYooS4bHuDaXvnCbeR-cBdVw@mail.gmail.com>
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

On Tue, Mar 14, 2023 at 1:11=E2=80=AFPM Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> On Thu, 26 Jan 2023 11:37:45 -0800
> Suren Baghdasaryan <surenb@google.com> wrote:
>
> > This patchset was originally published as a part of per-VMA locking [1]=
 and
> > was split after suggestion that it's viable on its own and to facilitat=
e
> > the review process. It is now a preprequisite for the next version of p=
er-VMA
> > lock patchset, which reuses vm_flags modifier functions to lock the VMA=
 when
> > vm_flags are being updated.
> >
> > VMA vm_flags modifications are usually done under exclusive mmap_lock
> > protection because this attrubute affects other decisions like VMA merg=
ing
> > or splitting and races should be prevented. Introduce vm_flags modifier
> > functions to enforce correct locking.
> >
> > The patchset applies cleanly over mm-unstable branch of mm tree.
>
> With this series, vfio-pci developed a bunch of warnings around not
> holding the mmap_lock write semaphore while calling
> io_remap_pfn_range() from our fault handler, vfio_pci_mmap_fault().
>
> I suspect vdpa has the same issue for their use of remap_pfn_range()
> from their fault handler, JasonW, MST, FYI.
>
> It also looks like gru_fault() would have the same issue, Dimitri.
>
> In all cases, we're preemptively setting vm_flags to what
> remap_pfn_range_notrack() uses, so I thought we were safe here as I
> specifically remember trying to avoid changing vm_flags from the
> fault handler.  But apparently that doesn't take into account
> track_pfn_remap() where VM_PAT comes into play.
>
> The reason for using remap_pfn_range() on fault in vfio-pci is that
> we're mapping device MMIO to userspace, where that MMIO can be disabled
> and we'd rather zap the mapping when that occurs so that we can sigbus
> the user rather than allow the user to trigger potentially fatal bus
> errors on the host.
>
> Peter Xu has suggested offline that a non-lazy approach to reinsert the
> mappings might be more inline with mm expectations relative to touching
> vm_flags during fault.  What's the right solution here?  Can the fault
> handling be salvaged, is proactive remapping the right approach, or is
> there something better?  Thanks,

Hi Alex,
If in your case it's safe to change vm_flags without holding exclusive
mmap_lock, maybe you can use __vm_flags_mod() the way I used it in
https://lore.kernel.org/all/20230126193752.297968-7-surenb@google.com,
while explaining why this should be safe?

>
> Alex
>
