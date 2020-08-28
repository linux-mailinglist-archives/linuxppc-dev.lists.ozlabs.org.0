Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6406525561A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 10:12:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdC5F6YXFzDqq7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Aug 2020 18:12:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GL/dikni; dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdC2S4bRdzDqnn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 18:10:24 +1000 (AEST)
Received: by mail-il1-x142.google.com with SMTP id m1so159579ilj.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Aug 2020 01:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O4a2D+ucekJ1VMKHbkWc2yNsJ1kQqPyUF0nhLsDe9YA=;
 b=GL/dikni34Zqc1BlebBi4v/0aAa59kT4Yb+evM9wRW5wJTw7iscnZoeUz2It27gobj
 +GtKOKPC+l93p7wEUMZmmytHDrDoGKxG3bw7LV9q9QWO0tA91zVjIAtJKkfPKwKtGrX8
 a280UIKwEq5kcSI6ejbDbGMEV/WIPQP4rgMaWiM/IUGLVKxq1y4C/Qet/P3IqAo8XUS6
 XN39DDa5LK4OACCtFPIz7+Zj/Lc19tMRm7FIZKZLLPjFl3IC+6cgzu1ZR2byxDQAYCv4
 +wFx/tFHZnYC5oFXkWWGxXQDUl6+wyZ9BmPbwg9fYQfDWt3JURbaoWTuYUAMp7nCPcMG
 LkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O4a2D+ucekJ1VMKHbkWc2yNsJ1kQqPyUF0nhLsDe9YA=;
 b=pQjeTYOd9aAqEMle9IluPiTx5esgrBSkQCdu95RziQPZBuU1sQviDnKsfNRSS11pBF
 Pn2Yich9hdjFGvoa619YpjZukrDSkyNNXOLI53mrSJ1W9WNgd3q+VkY7wd5qoo/+f+CX
 M66OYXR9ELAuONel2wNdPRZpqKCmhmC6duEy5GKFLczf4EDMySHcjepZjl5VcMwEuJWf
 StReaJurd89JEPVw58MEXM/+r2jn41nthHFrNY5BHm8pI/zmwjSPuQjXsVwtWX5kCQYO
 oEhJKtAk43FDcso861hmGlaoOkAf8qVYoF5F3etk7TA+pRT64roHwerq4yRcJj13Xipm
 AUzA==
X-Gm-Message-State: AOAM530u3RsJMG5pY32gVLvmbSpJPbQqxd8XkiAf9WlDbbLCwwkhytON
 VbU+a0PWtnqmfhYG2f87FfsXInPJv7AFCp1tmw==
X-Google-Smtp-Source: ABdhPJxzzVgZgWRe5RgNJDM2HLKkdDSGywvQ0UF+mrinCcgXWXMlIgW4MA4eA7smGuuRIpxH4+xEp+uuLn0ogycOjQk=
X-Received: by 2002:a05:6e02:12a3:: with SMTP id
 f3mr589357ilr.83.1598602220714; 
 Fri, 28 Aug 2020 01:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <1597049570-19536-1-git-send-email-kernelfans@gmail.com>
 <1597049570-19536-2-git-send-email-kernelfans@gmail.com>
 <17369122-3e37-1360-0f68-827a8104cd35@linux.ibm.com>
In-Reply-To: <17369122-3e37-1360-0f68-827a8104cd35@linux.ibm.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Fri, 28 Aug 2020 16:10:09 +0800
Message-ID: <CAFgQCTs58dOcO0CGVDD1WxiOE9yaPe_WG-U=t+=at45bAipQ_A@mail.gmail.com>
Subject: Re: [PATCHv5 2/2] powerpc/pseries: update device tree before ejecting
 hotplug uevents
To: Laurent Dufour <ldufour@linux.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 27, 2020 at 3:53 PM Laurent Dufour <ldufour@linux.ibm.com> wrot=
e:
>
> Le 10/08/2020 =C3=A0 10:52, Pingfan Liu a =C3=A9crit :
> > A bug is observed on pseries by taking the following steps on rhel:
> > -1. drmgr -c mem -r -q 5
> > -2. echo c > /proc/sysrq-trigger
> >
> > And then, the failure looks like:
> > kdump: saving to /sysroot//var/crash/127.0.0.1-2020-01-16-02:06:14/
> > kdump: saving vmcore-dmesg.txt
> > kdump: saving vmcore-dmesg.txt complete
> > kdump: saving vmcore
> >   Checking for memory holes                         : [  0.0 %] /      =
             Checking for memory holes                         : [100.0 %] =
|                   Excluding unnecessary pages                       : [10=
0.0 %] \                   Copying data                                    =
  : [  0.3 %] -          eta: 38s[   44.337636] hash-mmu: mm: Hashing failu=
re ! EA=3D0x7fffba400000 access=3D0x8000000000000004 current=3Dmakedumpfile
> > [   44.337663] hash-mmu:     trap=3D0x300 vsid=3D0x13a109c ssize=3D1 ba=
se psize=3D2 psize 2 pte=3D0xc000000050000504
> > [   44.337677] hash-mmu: mm: Hashing failure ! EA=3D0x7fffba400000 acce=
ss=3D0x8000000000000004 current=3Dmakedumpfile
> > [   44.337692] hash-mmu:     trap=3D0x300 vsid=3D0x13a109c ssize=3D1 ba=
se psize=3D2 psize 2 pte=3D0xc000000050000504
> > [   44.337708] makedumpfile[469]: unhandled signal 7 at 00007fffba40000=
0 nip 00007fffbbc4d7fc lr 000000011356ca3c code 2
> > [   44.338548] Core dump to |/bin/false pipe failed
> > /lib/kdump-lib-initramfs.sh: line 98:   469 Bus error               $CO=
RE_COLLECTOR /proc/vmcore $_mp/$KDUMP_PATH/$HOST_IP-$DATEDIR/vmcore-incompl=
ete
> > kdump: saving vmcore failed
> >
> > * Root cause *
> >    After analyzing, it turns out that in the current implementation,
> > when hot-removing lmb, the KOBJ_REMOVE event ejects before the dt updat=
ing as
> > the code __remove_memory() comes before drmem_update_dt().
> > So in kdump kernel, when read_from_oldmem() resorts to
> > pSeries_lpar_hpte_insert() to install hpte, but fails with -2 due to
> > non-exist pfn. And finally, low_hash_fault() raise SIGBUS to process, a=
s it
> > can be observed "Bus error"
> >
> >  From a viewpoint of listener and publisher, the publisher notifies the
> > listener before data is ready.  This introduces a problem where udev
> > launches kexec-tools (due to KOBJ_REMOVE) and loads a stale dt before
> > updating. And in capture kernel, makedumpfile will access the memory ba=
sed
> > on the stale dt info, and hit a SIGBUS error due to an un-existed lmb.
> >
> > * Fix *
> > This bug is introduced by commit 063b8b1251fd
> > ("powerpc/pseries/memory-hotplug: Only update DT once per memory DLPAR
> > request"), which tried to combine all the dt updating into one.
> >
> > To fix this issue, meanwhile not to introduce a quadratic runtime
> > complexity by the model:
> >    dlpar_memory_add_by_count
> >      for_each_drmem_lmb             <--
> >        dlpar_add_lmb
> >          drmem_update_dt(_v1|_v2)
> >            for_each_drmem_lmb       <--
> > The dt should still be only updated once, and just before the last memo=
ry
> > online/offline event is ejected to user space. Achieve this by tracing =
the
> > num of lmb added or removed.
> >
> > Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Hari Bathini <hbathini@linux.ibm.com>
> > Cc: Nathan Lynch <nathanl@linux.ibm.com>
> > Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com>
> > Cc: Laurent Dufour <ldufour@linux.ibm.com>
> > To: linuxppc-dev@lists.ozlabs.org
> > Cc: kexec@lists.infradead.org
> > ---
> > v4 -> v5: change dlpar_add_lmb()/dlpar_remove_lmb() prototype to report
> >            whether dt is updated successfully.
> >            Fix a condition boundary check bug
> > v3 -> v4: resolve a quadratic runtime complexity issue.
> >            This series is applied on next-test branch
> >   arch/powerpc/platforms/pseries/hotplug-memory.c | 102 +++++++++++++++=
++++-----
> >   1 file changed, 80 insertions(+), 22 deletions(-)
> >
> > diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/pow=
erpc/platforms/pseries/hotplug-memory.c
> > index 46cbcd1..1567d9f 100644
> > --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> > +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> > @@ -350,13 +350,22 @@ static bool lmb_is_removable(struct drmem_lmb *lm=
b)
> >       return true;
> >   }
> >
> > -static int dlpar_add_lmb(struct drmem_lmb *);
> > +enum dt_update_status {
> > +     DT_NOUPDATE,
> > +     DT_TOUPDATE,
> > +     DT_UPDATED,
> > +};
> > +
> > +/* "*dt_update" returns DT_UPDATED if updated */
> > +static int dlpar_add_lmb(struct drmem_lmb *lmb,
> > +             enum dt_update_status *dt_update);
> >
> > -static int dlpar_remove_lmb(struct drmem_lmb *lmb)
> > +static int dlpar_remove_lmb(struct drmem_lmb *lmb,
> > +             enum dt_update_status *dt_update)
> >   {
> >       unsigned long block_sz;
> >       phys_addr_t base_addr;
> > -     int rc, nid;
> > +     int rc, ret, nid;
> >
> >       if (!lmb_is_removable(lmb))
> >               return -EINVAL;
> > @@ -372,6 +381,13 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
> >       invalidate_lmb_associativity_index(lmb);
> >       lmb_clear_nid(lmb);
> >       lmb->flags &=3D ~DRCONF_MEM_ASSIGNED;
> > +     if (*dt_update) {
Original, I plan to use it to exclude the case of DT_NOUPDATE, which is val=
ue 0.
And I think it looks better by using if (*dt_update =3D=3D DT_TOUPDATE)
>
> That test is wrong, you should do:
>          if (*dt_update && *dt_update =3D=3D DT_TOUPDATE) {
I think you mean  if (dt_update && *dt_update =3D=3D DT_TOUPDATE) {
>
> With the current code, the device tree is updated all the time.
>
> Another option would be to pass a valid pointer (!=3D NULL) only when DT =
update is
> required, this way you don't need the DT_TOUPDATE value. The caller would=
 have
> to set the pointer accordingly. The advantage with this option is the cal=
ler is
> guaranteed that its variable is not touched by the callee when no device =
tree is
> requested. A simple boolean pointer would be enough without the need to t=
his enum.
It is expected that dlpar_remove_lmb/dlpar_add_lmb can report whether
they successfully update dt or not. So the caller can handle the
different cases.

Thanks,
Pingfan
