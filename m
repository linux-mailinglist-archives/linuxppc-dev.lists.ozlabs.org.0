Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AD0253DF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 08:38:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcY2Q3tvKzDqdP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 16:38:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CHAJBPFB; dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcY0f4lM4zDqL4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 16:36:33 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id u126so4675494iod.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 23:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+v9dfav1RJxNw3Emgv+Ztt/9zvW5zwZb7I8/vDQT1e4=;
 b=CHAJBPFBN3G0bVcixHftGBfoZo/E/nDB5Dc3+B0i+xTnmiV1+4g3NPpVBcFbLefA0P
 73Zt0yxDbATe9aq4qQSZyOglsGNdNOjwcYEwY7I7LTmckrzdvNLgfbv1irBILW3y8fHM
 4m+khn+dV0dqHPejJ4R+iaRVuntZzdoy/SViwod+4qN7Rf6KIQO8/lbuMJgyJPF0kyO3
 I/z2N/hxAomI7BuDHPdVV86oChAEXwfg2hAXRSOeCc3jTk6U274EZ0f/Lq40fAp/6HvJ
 Ebkx4Q/98lvHw0t9j1R4FSe0vVIXh+95a0hK8q14j7Tcob0yzspJGw5dCop4mB/2/11U
 Theg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+v9dfav1RJxNw3Emgv+Ztt/9zvW5zwZb7I8/vDQT1e4=;
 b=YnNc1QtPwvc/ztw6S1YbFgHVpzbfsI7TMqGErLAVMmOE7g0+b3vuMSYns7iqLcyQye
 qNyifhjyauBpRd9S54Sy22NKzPTpGcEjaY/RGbxmVzlDZ9+xScZZNZepERun6VkrfCe9
 Bzub8TJKynppnOB4ZTpQdtwyHZlTC8hatDGZLszR/kbE/4xAcdADRsL8JsEmHXy8xdCo
 cTaOWNT+/gx/WqrOkq1wRxAcBJnOihrlb9nXbAzES6vuMyddBeNmsPkhIh0fN+ZasLTS
 4GaaDPM8+OfXkt5OQjV8eygIk8OtkOXfsqYnI4UVPZBgwKYNgDmp1r49/sYU8u93BCq0
 0COA==
X-Gm-Message-State: AOAM533alCdSmOJUQ7yaD7e0tXMsP+xlEBxU60bAmwLFQOqdHx6vVn/t
 DfZSi2gW1q5C9U145UxHVF6WPGqcNNrw/WaZqmTQ0aM=
X-Google-Smtp-Source: ABdhPJybINJE6g8b5o9tfdT+2kbJIgqfTiwwui4QLJfIW/02T6fZR6J58zyPj1ivT7z1zWsb1oBHcFInSaTpuqCAWEA=
X-Received: by 2002:a5d:8041:: with SMTP id b1mr15833505ior.74.1598510190114; 
 Wed, 26 Aug 2020 23:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <1597049570-19536-1-git-send-email-kernelfans@gmail.com>
 <1597049570-19536-2-git-send-email-kernelfans@gmail.com>
In-Reply-To: <1597049570-19536-2-git-send-email-kernelfans@gmail.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Thu, 27 Aug 2020 14:36:18 +0800
Message-ID: <CAFgQCTssv8mQqcySzctwy=LUnsS81eK73QYQN7Qn95OvmVxe_Q@mail.gmail.com>
Subject: Re: [PATCHv5 2/2] powerpc/pseries: update device tree before ejecting
 hotplug uevents
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
 Laurent Dufour <ldufour@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello guys. Do you have further comments on this version?

Thanks,
Pingfan

On Mon, Aug 10, 2020 at 4:53 PM Pingfan Liu <kernelfans@gmail.com> wrote:
>
> A bug is observed on pseries by taking the following steps on rhel:
> -1. drmgr -c mem -r -q 5
> -2. echo c > /proc/sysrq-trigger
>
> And then, the failure looks like:
> kdump: saving to /sysroot//var/crash/127.0.0.1-2020-01-16-02:06:14/
> kdump: saving vmcore-dmesg.txt
> kdump: saving vmcore-dmesg.txt complete
> kdump: saving vmcore
>  Checking for memory holes                         : [  0.0 %] /         =
          Checking for memory holes                         : [100.0 %] |  =
                 Excluding unnecessary pages                       : [100.0=
 %] \                   Copying data                                      :=
 [  0.3 %] -          eta: 38s[   44.337636] hash-mmu: mm: Hashing failure =
! EA=3D0x7fffba400000 access=3D0x8000000000000004 current=3Dmakedumpfile
> [   44.337663] hash-mmu:     trap=3D0x300 vsid=3D0x13a109c ssize=3D1 base=
 psize=3D2 psize 2 pte=3D0xc000000050000504
> [   44.337677] hash-mmu: mm: Hashing failure ! EA=3D0x7fffba400000 access=
=3D0x8000000000000004 current=3Dmakedumpfile
> [   44.337692] hash-mmu:     trap=3D0x300 vsid=3D0x13a109c ssize=3D1 base=
 psize=3D2 psize 2 pte=3D0xc000000050000504
> [   44.337708] makedumpfile[469]: unhandled signal 7 at 00007fffba400000 =
nip 00007fffbbc4d7fc lr 000000011356ca3c code 2
> [   44.338548] Core dump to |/bin/false pipe failed
> /lib/kdump-lib-initramfs.sh: line 98:   469 Bus error               $CORE=
_COLLECTOR /proc/vmcore $_mp/$KDUMP_PATH/$HOST_IP-$DATEDIR/vmcore-incomplet=
e
> kdump: saving vmcore failed
>
> * Root cause *
>   After analyzing, it turns out that in the current implementation,
> when hot-removing lmb, the KOBJ_REMOVE event ejects before the dt updatin=
g as
> the code __remove_memory() comes before drmem_update_dt().
> So in kdump kernel, when read_from_oldmem() resorts to
> pSeries_lpar_hpte_insert() to install hpte, but fails with -2 due to
> non-exist pfn. And finally, low_hash_fault() raise SIGBUS to process, as =
it
> can be observed "Bus error"
>
> From a viewpoint of listener and publisher, the publisher notifies the
> listener before data is ready.  This introduces a problem where udev
> launches kexec-tools (due to KOBJ_REMOVE) and loads a stale dt before
> updating. And in capture kernel, makedumpfile will access the memory base=
d
> on the stale dt info, and hit a SIGBUS error due to an un-existed lmb.
>
> * Fix *
> This bug is introduced by commit 063b8b1251fd
> ("powerpc/pseries/memory-hotplug: Only update DT once per memory DLPAR
> request"), which tried to combine all the dt updating into one.
>
> To fix this issue, meanwhile not to introduce a quadratic runtime
> complexity by the model:
>   dlpar_memory_add_by_count
>     for_each_drmem_lmb             <--
>       dlpar_add_lmb
>         drmem_update_dt(_v1|_v2)
>           for_each_drmem_lmb       <--
> The dt should still be only updated once, and just before the last memory
> online/offline event is ejected to user space. Achieve this by tracing th=
e
> num of lmb added or removed.
>
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com>
> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> To: linuxppc-dev@lists.ozlabs.org
> Cc: kexec@lists.infradead.org
> ---
> v4 -> v5: change dlpar_add_lmb()/dlpar_remove_lmb() prototype to report
>           whether dt is updated successfully.
>           Fix a condition boundary check bug
> v3 -> v4: resolve a quadratic runtime complexity issue.
>           This series is applied on next-test branch
>  arch/powerpc/platforms/pseries/hotplug-memory.c | 102 ++++++++++++++++++=
+-----
>  1 file changed, 80 insertions(+), 22 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/power=
pc/platforms/pseries/hotplug-memory.c
> index 46cbcd1..1567d9f 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -350,13 +350,22 @@ static bool lmb_is_removable(struct drmem_lmb *lmb)
>         return true;
>  }
>
> -static int dlpar_add_lmb(struct drmem_lmb *);
> +enum dt_update_status {
> +       DT_NOUPDATE,
> +       DT_TOUPDATE,
> +       DT_UPDATED,
> +};
> +
> +/* "*dt_update" returns DT_UPDATED if updated */
> +static int dlpar_add_lmb(struct drmem_lmb *lmb,
> +               enum dt_update_status *dt_update);
>
> -static int dlpar_remove_lmb(struct drmem_lmb *lmb)
> +static int dlpar_remove_lmb(struct drmem_lmb *lmb,
> +               enum dt_update_status *dt_update)
>  {
>         unsigned long block_sz;
>         phys_addr_t base_addr;
> -       int rc, nid;
> +       int rc, ret, nid;
>
>         if (!lmb_is_removable(lmb))
>                 return -EINVAL;
> @@ -372,6 +381,13 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
>         invalidate_lmb_associativity_index(lmb);
>         lmb_clear_nid(lmb);
>         lmb->flags &=3D ~DRCONF_MEM_ASSIGNED;
> +       if (*dt_update) {
> +               ret =3D drmem_update_dt();
> +               if (ret)
> +                       pr_warn("%s fail to update dt, but continue\n", _=
_func__);
> +               else
> +                       *dt_update =3D DT_UPDATED;
> +       }
>
>         __remove_memory(nid, base_addr, block_sz);
>
> @@ -387,6 +403,7 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_r=
emove)
>         int lmbs_removed =3D 0;
>         int lmbs_available =3D 0;
>         int rc;
> +       enum dt_update_status dt_update =3D DT_NOUPDATE;
>
>         pr_info("Attempting to hot-remove %d LMB(s)\n", lmbs_to_remove);
>
> @@ -409,7 +426,11 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_=
remove)
>         }
>
>         for_each_drmem_lmb(lmb) {
> -               rc =3D dlpar_remove_lmb(lmb);
> +
> +               /* combine dt updating for all LMBs */
> +               if (lmbs_to_remove - lmbs_removed <=3D 1)
> +                       dt_update =3D DT_TOUPDATE;
> +               rc =3D dlpar_remove_lmb(lmb, &dt_update);
>                 if (rc)
>                         continue;
>
> @@ -424,13 +445,17 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to=
_remove)
>         }
>
>         if (lmbs_removed !=3D lmbs_to_remove) {
> +               enum dt_update_status rollback_dt_update =3D DT_NOUPDATE;
> +
>                 pr_err("Memory hot-remove failed, adding LMB's back\n");
>
>                 for_each_drmem_lmb(lmb) {
>                         if (!drmem_lmb_reserved(lmb))
>                                 continue;
>
> -                       rc =3D dlpar_add_lmb(lmb);
> +                       if (--lmbs_removed =3D=3D 0 && dt_update =3D=3D D=
T_UPDATED)
> +                               rollback_dt_update =3D DT_TOUPDATE;
> +                       rc =3D dlpar_add_lmb(lmb, &rollback_dt_update);
>                         if (rc)
>                                 pr_err("Failed to add LMB back, drc index=
 %x\n",
>                                        lmb->drc_index);
> @@ -458,6 +483,7 @@ static int dlpar_memory_remove_by_count(u32 lmbs_to_r=
emove)
>
>  static int dlpar_memory_remove_by_index(u32 drc_index)
>  {
> +       enum dt_update_status dt_update =3D DT_TOUPDATE;
>         struct drmem_lmb *lmb;
>         int lmb_found;
>         int rc;
> @@ -468,7 +494,7 @@ static int dlpar_memory_remove_by_index(u32 drc_index=
)
>         for_each_drmem_lmb(lmb) {
>                 if (lmb->drc_index =3D=3D drc_index) {
>                         lmb_found =3D 1;
> -                       rc =3D dlpar_remove_lmb(lmb);
> +                       rc =3D dlpar_remove_lmb(lmb, &dt_update);
>                         if (!rc)
>                                 dlpar_release_drc(lmb->drc_index);
>
> @@ -490,6 +516,7 @@ static int dlpar_memory_remove_by_index(u32 drc_index=
)
>
>  static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>  {
> +       enum dt_update_status dt_update =3D DT_NOUPDATE;
>         struct drmem_lmb *lmb, *start_lmb, *end_lmb;
>         int lmbs_available =3D 0;
>         int rc;
> @@ -519,7 +546,9 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remo=
ve, u32 drc_index)
>                 if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
>                         continue;
>
> -               rc =3D dlpar_remove_lmb(lmb);
> +               if (lmb =3D=3D end_lmb)
> +                       dt_update =3D DT_TOUPDATE;
> +               rc =3D dlpar_remove_lmb(lmb, &dt_update);
>                 if (rc)
>                         break;
>
> @@ -527,14 +556,16 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_re=
move, u32 drc_index)
>         }
>
>         if (rc) {
> -               pr_err("Memory indexed-count-remove failed, adding any re=
moved LMBs\n");
> +               enum dt_update_status rollback_dt_update =3D DT_NOUPDATE;
>
> +               pr_err("Memory indexed-count-remove failed, adding any re=
moved LMBs\n");
>
>                 for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
>                         if (!drmem_lmb_reserved(lmb))
>                                 continue;
> -
> -                       rc =3D dlpar_add_lmb(lmb);
> +                       if (lmb =3D=3D end_lmb && dt_update =3D=3D DT_UPD=
ATED)
> +                               rollback_dt_update =3D DT_TOUPDATE;
> +                       rc =3D dlpar_add_lmb(lmb, &rollback_dt_update);
>                         if (rc)
>                                 pr_err("Failed to add LMB, drc index %x\n=
",
>                                        lmb->drc_index);
> @@ -572,7 +603,7 @@ static inline int dlpar_memory_remove(struct pseries_=
hp_errorlog *hp_elog)
>  {
>         return -EOPNOTSUPP;
>  }
> -static int dlpar_remove_lmb(struct drmem_lmb *lmb)
> +static int dlpar_remove_lmb(struct drmem_lmb *lmb, bool dt_update)
>  {
>         return -EOPNOTSUPP;
>  }
> @@ -591,10 +622,11 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_re=
move, u32 drc_index)
>  }
>  #endif /* CONFIG_MEMORY_HOTREMOVE */
>
> -static int dlpar_add_lmb(struct drmem_lmb *lmb)
> +static int dlpar_add_lmb(struct drmem_lmb *lmb,
> +               enum dt_update_status *dt_update)
>  {
>         unsigned long block_sz;
> -       int rc;
> +       int rc, ret;
>
>         if (lmb->flags & DRCONF_MEM_ASSIGNED)
>                 return -EINVAL;
> @@ -607,6 +639,13 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>
>         lmb_set_nid(lmb);
>         lmb->flags |=3D DRCONF_MEM_ASSIGNED;
> +       if (*dt_update) {
> +               ret =3D drmem_update_dt();
> +               if (ret)
> +                       pr_warn("%s fail to update dt, but continue\n", _=
_func__);
> +               else
> +                       *dt_update =3D DT_UPDATED;
> +       }
>
>         block_sz =3D memory_block_size_bytes();
>
> @@ -616,6 +655,8 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>                 invalidate_lmb_associativity_index(lmb);
>                 lmb_clear_nid(lmb);
>                 lmb->flags &=3D ~DRCONF_MEM_ASSIGNED;
> +               if (*dt_update =3D=3D DT_UPDATED)
> +                       drmem_update_dt();
>                 return rc;
>         }
>
> @@ -627,7 +668,11 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>                 invalidate_lmb_associativity_index(lmb);
>                 lmb_clear_nid(lmb);
>                 lmb->flags &=3D ~DRCONF_MEM_ASSIGNED;
> -
> +               if (*dt_update =3D=3D DT_UPDATED) {
> +                       ret =3D drmem_update_dt();
> +                       if (ret)
> +                               pr_warn("%s fail to update dt during roll=
back, but continue\n", __func__);
> +               }
>                 __remove_memory(nid, base_addr, block_sz);
>         }
>
> @@ -636,6 +681,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>
>  static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>  {
> +       enum dt_update_status dt_update =3D DT_NOUPDATE;
>         struct drmem_lmb *lmb;
>         int lmbs_available =3D 0;
>         int lmbs_added =3D 0;
> @@ -666,7 +712,9 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>                 if (rc)
>                         continue;
>
> -               rc =3D dlpar_add_lmb(lmb);
> +               if (lmbs_to_add - lmbs_added <=3D 1)
> +                       dt_update =3D DT_TOUPDATE;
> +               rc =3D dlpar_add_lmb(lmb, &dt_update);
>                 if (rc) {
>                         dlpar_release_drc(lmb->drc_index);
>                         continue;
> @@ -683,13 +731,18 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_ad=
d)
>         }
>
>         if (lmbs_added !=3D lmbs_to_add) {
> +               enum dt_update_status rollback_dt_update =3D DT_NOUPDATE;
> +
>                 pr_err("Memory hot-add failed, removing any added LMBs\n"=
);
>
>                 for_each_drmem_lmb(lmb) {
>                         if (!drmem_lmb_reserved(lmb))
>                                 continue;
>
> -                       rc =3D dlpar_remove_lmb(lmb);
> +                       if (--lmbs_added =3D=3D 0 && dt_update =3D=3D DT_=
UPDATED)
> +                               rollback_dt_update =3D DT_TOUPDATE;
> +
> +                       rc =3D dlpar_remove_lmb(lmb, &rollback_dt_update)=
;
>                         if (rc)
>                                 pr_err("Failed to remove LMB, drc index %=
x\n",
>                                        lmb->drc_index);
> @@ -716,6 +769,7 @@ static int dlpar_memory_add_by_count(u32 lmbs_to_add)
>
>  static int dlpar_memory_add_by_index(u32 drc_index)
>  {
> +       enum dt_update_status dt_update =3D DT_TOUPDATE;
>         struct drmem_lmb *lmb;
>         int rc, lmb_found;
>
> @@ -727,7 +781,7 @@ static int dlpar_memory_add_by_index(u32 drc_index)
>                         lmb_found =3D 1;
>                         rc =3D dlpar_acquire_drc(lmb->drc_index);
>                         if (!rc) {
> -                               rc =3D dlpar_add_lmb(lmb);
> +                               rc =3D dlpar_add_lmb(lmb, &dt_update);
>                                 if (rc)
>                                         dlpar_release_drc(lmb->drc_index)=
;
>                         }
> @@ -750,6 +804,7 @@ static int dlpar_memory_add_by_index(u32 drc_index)
>
>  static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u32 drc_index)
>  {
> +       enum dt_update_status dt_update =3D DT_NOUPDATE;
>         struct drmem_lmb *lmb, *start_lmb, *end_lmb;
>         int lmbs_available =3D 0;
>         int rc;
> @@ -783,7 +838,9 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, u3=
2 drc_index)
>                 if (rc)
>                         break;
>
> -               rc =3D dlpar_add_lmb(lmb);
> +               if (lmb =3D=3D end_lmb)
> +                       dt_update =3D DT_TOUPDATE;
> +               rc =3D dlpar_add_lmb(lmb, &dt_update);
>                 if (rc) {
>                         dlpar_release_drc(lmb->drc_index);
>                         break;
> @@ -796,10 +853,14 @@ static int dlpar_memory_add_by_ic(u32 lmbs_to_add, =
u32 drc_index)
>                 pr_err("Memory indexed-count-add failed, removing any add=
ed LMBs\n");
>
>                 for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
> +                       enum dt_update_status rollback_dt_update =3D DT_N=
OUPDATE;
> +
>                         if (!drmem_lmb_reserved(lmb))
>                                 continue;
>
> -                       rc =3D dlpar_remove_lmb(lmb);
> +                       if (lmb =3D=3D end_lmb && dt_update =3D=3D DT_UPD=
ATED)
> +                               rollback_dt_update =3D DT_TOUPDATE;
> +                       rc =3D dlpar_remove_lmb(lmb, &rollback_dt_update)=
;
>                         if (rc)
>                                 pr_err("Failed to remove LMB, drc index %=
x\n",
>                                        lmb->drc_index);
> @@ -879,9 +940,6 @@ int dlpar_memory(struct pseries_hp_errorlog *hp_elog)
>                 break;
>         }
>
> -       if (!rc)
> -               rc =3D drmem_update_dt();
> -
>         unlock_device_hotplug();
>         return rc;
>  }
> --
> 2.7.5
>
