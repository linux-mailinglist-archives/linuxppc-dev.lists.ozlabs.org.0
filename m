Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A36835EB3F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 05:09:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKnVy2sw6z3bx8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 13:08:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mSINI5wd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::135;
 helo=mail-il1-x135.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mSINI5wd; dkim-atps=neutral
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKnVW2RbYz2yhx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 13:08:33 +1000 (AEST)
Received: by mail-il1-x135.google.com with SMTP id 7so14220243ilz.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 20:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QLvOUgQuiyd/aoqbBhVie3KigYMPxH+eY6PHVYBxhjY=;
 b=mSINI5wddImZDFCogVoz9BlbGr2OXBvWbFUXr+OI9T63WNvQR0cCMeN3i6dmseR6MU
 TnwdLPjDKY0vN10M/YnX1U9FxsVJeizkNdO3XgBa1Cc1nOnOApELxXHvQ5kKPss+K6rQ
 hoD1y9ylU6yl9Tj0ecp63X/6OdoZ1cbIzuqRu3MVrxiecSGmn2QPdFKgCvkPVgLaBKgT
 j9Di31jAaypUIB+bKlbD3vX8ocQzq/1P/gn06XO8RSJKYrpgMOCaR0iz8RSpPZED5vPd
 yV/eFmIpwv//ri2UEOUukFckXOeAXXBiS55RVEjH5uAqF0JHaRKYiwU84+3Pn5IcPM3+
 S+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QLvOUgQuiyd/aoqbBhVie3KigYMPxH+eY6PHVYBxhjY=;
 b=uTk8FFhhiwFDSMMNuwaDq5MK76ls9SdNHH+eoHalXlhC0d9yQ8+ZB3HGsPf0lkEAE+
 bF8gNEEYz+HOiyMbqnt0R/J+pg7ieu1ysOAfQktpQCdJuO0zTIQVkS26h4mICEqK/+WM
 CSk54HizO6VJqrFb66FWuVT+G9mtkhcUmbIBDPC7k3fdxDvngG9ZuxpFapNtRR56M1TH
 zKip0LLNx9UWG/ZevJ4ZsAaQAbukBDEsIspJ7pAE5J/5fstLTf5d2WT1QjCVUbJ3kxr1
 haP7WRZJbrLSPgm7e/nWP3GayAQ0xNsyuH6m/Rwvmx4N7Dimt3TVJdJlMo+nRaRckt/g
 B4sg==
X-Gm-Message-State: AOAM530x8ucUpzPkkQntoSZmBMkOxPOJWlOIDGeoiz9ahscfodfPctgb
 7lld71jmyc/BwkxCyjXNXU3vdi7L4gE9H1w1ZA==
X-Google-Smtp-Source: ABdhPJwdgeW3fGNnRUjJWhhjemcg3Fh74r7/jba6GcLbaRK9fCgZl/Qp4M/snUIfHNbYQkweGwr+L99k5VQI8EbW/LY=
X-Received: by 2002:a05:6e02:1ba5:: with SMTP id
 n5mr554045ili.45.1618369710049; 
 Tue, 13 Apr 2021 20:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <1597049570-19536-1-git-send-email-kernelfans@gmail.com>
 <1597049570-19536-2-git-send-email-kernelfans@gmail.com>
 <17369122-3e37-1360-0f68-827a8104cd35@linux.ibm.com>
 <CAFgQCTs58dOcO0CGVDD1WxiOE9yaPe_WG-U=t+=at45bAipQ_A@mail.gmail.com>
 <20210409163323.GP6564@kitsune.suse.cz>
In-Reply-To: <20210409163323.GP6564@kitsune.suse.cz>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Wed, 14 Apr 2021 11:08:19 +0800
Message-ID: <CAFgQCTsTWiYcuiipWmnieuNTWTar30aAUOsE3L9CcrVBiQix3A@mail.gmail.com>
Subject: Re: [PATCHv5 2/2] powerpc/pseries: update device tree before ejecting
 hotplug uevents
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
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
 Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 10, 2021 at 12:33 AM Michal Such=C3=A1nek <msuchanek@suse.de> w=
rote:
>
> Hello,
>
> On Fri, Aug 28, 2020 at 04:10:09PM +0800, Pingfan Liu wrote:
> > On Thu, Aug 27, 2020 at 3:53 PM Laurent Dufour <ldufour@linux.ibm.com> =
wrote:
> > >
> > > Le 10/08/2020 =C3=A0 10:52, Pingfan Liu a =C3=A9crit :
> > > > A bug is observed on pseries by taking the following steps on rhel:
> > > > -1. drmgr -c mem -r -q 5
> > > > -2. echo c > /proc/sysrq-trigger
> > > >
> > > > And then, the failure looks like:
> > > > kdump: saving to /sysroot//var/crash/127.0.0.1-2020-01-16-02:06:14/
> > > > kdump: saving vmcore-dmesg.txt
> > > > kdump: saving vmcore-dmesg.txt complete
> > > > kdump: saving vmcore
> > > >   Checking for memory holes                         : [  0.0 %] /  =
                 Checking for memory holes                         : [100.0=
 %] |                   Excluding unnecessary pages                       :=
 [100.0 %] \                   Copying data                                =
      : [  0.3 %] -          eta: 38s[   44.337636] hash-mmu: mm: Hashing f=
ailure ! EA=3D0x7fffba400000 access=3D0x8000000000000004 current=3Dmakedump=
file
> > > > [   44.337663] hash-mmu:     trap=3D0x300 vsid=3D0x13a109c ssize=3D=
1 base psize=3D2 psize 2 pte=3D0xc000000050000504
> > > > [   44.337677] hash-mmu: mm: Hashing failure ! EA=3D0x7fffba400000 =
access=3D0x8000000000000004 current=3Dmakedumpfile
> > > > [   44.337692] hash-mmu:     trap=3D0x300 vsid=3D0x13a109c ssize=3D=
1 base psize=3D2 psize 2 pte=3D0xc000000050000504
> > > > [   44.337708] makedumpfile[469]: unhandled signal 7 at 00007fffba4=
00000 nip 00007fffbbc4d7fc lr 000000011356ca3c code 2
> > > > [   44.338548] Core dump to |/bin/false pipe failed
> > > > /lib/kdump-lib-initramfs.sh: line 98:   469 Bus error              =
 $CORE_COLLECTOR /proc/vmcore $_mp/$KDUMP_PATH/$HOST_IP-$DATEDIR/vmcore-inc=
omplete
> > > > kdump: saving vmcore failed
> > > >
> > > > * Root cause *
> > > >    After analyzing, it turns out that in the current implementation=
,
> > > > when hot-removing lmb, the KOBJ_REMOVE event ejects before the dt u=
pdating as
> > > > the code __remove_memory() comes before drmem_update_dt().
> > > > So in kdump kernel, when read_from_oldmem() resorts to
> > > > pSeries_lpar_hpte_insert() to install hpte, but fails with -2 due t=
o
> > > > non-exist pfn. And finally, low_hash_fault() raise SIGBUS to proces=
s, as it
> > > > can be observed "Bus error"
> > > >
> > > >  From a viewpoint of listener and publisher, the publisher notifies=
 the
> > > > listener before data is ready.  This introduces a problem where ude=
v
> > > > launches kexec-tools (due to KOBJ_REMOVE) and loads a stale dt befo=
re
> > > > updating. And in capture kernel, makedumpfile will access the memor=
y based
> > > > on the stale dt info, and hit a SIGBUS error due to an un-existed l=
mb.
> > > >
> > > > * Fix *
> > > > This bug is introduced by commit 063b8b1251fd
> > > > ("powerpc/pseries/memory-hotplug: Only update DT once per memory DL=
PAR
> > > > request"), which tried to combine all the dt updating into one.
> > > >
> > > > To fix this issue, meanwhile not to introduce a quadratic runtime
> > > > complexity by the model:
> > > >    dlpar_memory_add_by_count
> > > >      for_each_drmem_lmb             <--
> > > >        dlpar_add_lmb
> > > >          drmem_update_dt(_v1|_v2)
> > > >            for_each_drmem_lmb       <--
> > > > The dt should still be only updated once, and just before the last =
memory
> > > > online/offline event is ejected to user space. Achieve this by trac=
ing the
> > > > num of lmb added or removed.
> > > >
> > > > Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> > > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > > Cc: Hari Bathini <hbathini@linux.ibm.com>
> > > > Cc: Nathan Lynch <nathanl@linux.ibm.com>
> > > > Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com>
> > > > Cc: Laurent Dufour <ldufour@linux.ibm.com>
> > > > To: linuxppc-dev@lists.ozlabs.org
> > > > Cc: kexec@lists.infradead.org
> > > > ---
> > > > v4 -> v5: change dlpar_add_lmb()/dlpar_remove_lmb() prototype to re=
port
> > > >            whether dt is updated successfully.
> > > >            Fix a condition boundary check bug
> > > > v3 -> v4: resolve a quadratic runtime complexity issue.
> > > >            This series is applied on next-test branch
> > > >   arch/powerpc/platforms/pseries/hotplug-memory.c | 102 +++++++++++=
++++++++-----
> > > >   1 file changed, 80 insertions(+), 22 deletions(-)
> > > >
> > > > diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch=
/powerpc/platforms/pseries/hotplug-memory.c
> > > > index 46cbcd1..1567d9f 100644
> > > > --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> > > > +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> > > > @@ -350,13 +350,22 @@ static bool lmb_is_removable(struct drmem_lmb=
 *lmb)
> > > >       return true;
> > > >   }
> > > >
> > > > -static int dlpar_add_lmb(struct drmem_lmb *);
> > > > +enum dt_update_status {
> > > > +     DT_NOUPDATE,
> > > > +     DT_TOUPDATE,
> > > > +     DT_UPDATED,
> > > > +};
> > > > +
> > > > +/* "*dt_update" returns DT_UPDATED if updated */
> > > > +static int dlpar_add_lmb(struct drmem_lmb *lmb,
> > > > +             enum dt_update_status *dt_update);
> > > >
> > > > -static int dlpar_remove_lmb(struct drmem_lmb *lmb)
> > > > +static int dlpar_remove_lmb(struct drmem_lmb *lmb,
> > > > +             enum dt_update_status *dt_update)
> > > >   {
> > > >       unsigned long block_sz;
> > > >       phys_addr_t base_addr;
> > > > -     int rc, nid;
> > > > +     int rc, ret, nid;
> > > >
> > > >       if (!lmb_is_removable(lmb))
> > > >               return -EINVAL;
> > > > @@ -372,6 +381,13 @@ static int dlpar_remove_lmb(struct drmem_lmb *=
lmb)
> > > >       invalidate_lmb_associativity_index(lmb);
> > > >       lmb_clear_nid(lmb);
> > > >       lmb->flags &=3D ~DRCONF_MEM_ASSIGNED;
> > > > +     if (*dt_update) {
> > Original, I plan to use it to exclude the case of DT_NOUPDATE, which is=
 value 0.
> > And I think it looks better by using if (*dt_update =3D=3D DT_TOUPDATE)
> > >
> > > That test is wrong, you should do:
> > >          if (*dt_update && *dt_update =3D=3D DT_TOUPDATE) {
> > I think you mean  if (dt_update && *dt_update =3D=3D DT_TOUPDATE) {
> > >
> > > With the current code, the device tree is updated all the time.
> > >
> > > Another option would be to pass a valid pointer (!=3D NULL) only when=
 DT update is
> > > required, this way you don't need the DT_TOUPDATE value. The caller w=
ould have
> > > to set the pointer accordingly. The advantage with this option is the=
 caller is
> > > guaranteed that its variable is not touched by the callee when no dev=
ice tree is
> > > requested. A simple boolean pointer would be enough without the need =
to this enum.
> > It is expected that dlpar_remove_lmb/dlpar_add_lmb can report whether
> > they successfully update dt or not. So the caller can handle the
> > different cases.
>
> Is there any plan to refresh this patch to apply to master?
>
Spreading the failure and rollback logic around the code looks urgly.
Even myself dislike it. But I have not found a better way out.

> I am using an older revision of this patch so I am not in the position
> to repost an updated version.
>
> I lack some otimization in my patch so I probably have the quadratic
> coplexity of the add mentioned above.
>
Do you have any good ideas?

Thanks,
Pingfan
