Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C1F22C522
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 14:27:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCpP23tjyzDrqg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 22:27:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::143;
 helo=mail-il1-x143.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QuDuglS2; dkim-atps=neutral
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCpLF4dkDzDrgS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 22:24:51 +1000 (AEST)
Received: by mail-il1-x143.google.com with SMTP id s21so7040675ilk.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 05:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iz41Wb4g9jFLNHNHr48beAOPKmTQbRh9kIQCMiea/+I=;
 b=QuDuglS2OyXRJTbLzS/rhCt0ji5bLHqN51RPWYNOAoHcuTXhzLTvbvAc9QP9NYZtNn
 eJNzX4EzIAv8PgccosdoQ5C0jge4BPmKT6gnno5EDWzLDBg9knlRaulIAqyll8Fwm/nu
 XmE9PcdrgJZMSRX+xfpcOWj+TANlibL6uIqpf0y/DNqvweYWhPO8fE9P2owClu5GlN9A
 nNO8Q0MsQ2y+PdGyIYWru6+4vCn5G533LbHNbcVrjL3Di9+bxphwrVV5RuuJtZ4th4+C
 8ECg/gqXjT0eFbmMAbVOduy9fTvgM06P9ElXuCjkC0pdPFcxRNBCPJ+QHJK0556KFavM
 5INg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iz41Wb4g9jFLNHNHr48beAOPKmTQbRh9kIQCMiea/+I=;
 b=pmKpcUQleMBogTDvhZAB4nQceu+noX51O70e2MIWae21+b5118tJ8okBc0TgDfFo77
 uELT5xH57uGRclP2EQMYiWgWf+SscJwbPV0NUu/6K7KOR+0Iz95zG/rMwNsuAl1FjmJt
 f2sEw2weg1YQAPMtANeYnJP8ZpAUW2YowBdo/jrUVBOs1Ms75qV2t+n2hLV1dd0QAgLB
 3DYB7BonbJzV4uHss0uiJw13XaHwQAu8qJCyNlJrcSW0olq9BfmO7ioyUKlTsWV9vKFF
 BmozWBehRd7EaC//g7YEVJHr6YSjugtufVtJHglaDOJi5Bdl0O8eg9x5Ew5UV2/Y9p8w
 qxAQ==
X-Gm-Message-State: AOAM533Ehbs00CF8Sge7Efz/YKC8fop5VSofMAPqouZxKgbY/5/OuaQ3
 egw6ToY+PniLJ5ibwD8uKn09WWxeNQZbIEduww==
X-Google-Smtp-Source: ABdhPJzvZZhMBxJXWl2+g0hkSt9TgwSgXDh6/p8h1uxpj3drfff0+uuydkxOG5Ud7hY9PMF9N4FEGrnU625i6PRXI48=
X-Received: by 2002:a92:cb10:: with SMTP id s16mr10223389ilo.192.1595593488273; 
 Fri, 24 Jul 2020 05:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <1595382730-10565-1-git-send-email-kernelfans@gmail.com>
 <1595382730-10565-2-git-send-email-kernelfans@gmail.com>
 <87imee1hvt.fsf@linux.ibm.com>
In-Reply-To: <87imee1hvt.fsf@linux.ibm.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Fri, 24 Jul 2020 20:24:37 +0800
Message-ID: <CAFgQCTu_QO=50v2J0=aY2iV8P-oM82_Kfw9My600ZARUt01grw@mail.gmail.com>
Subject: Re: [PATCHv3 2/2] powerpc/pseries: update device tree before ejecting
 hotplug uevents
To: Nathan Lynch <nathanl@linux.ibm.com>
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
Cc: cheloha@linux.ibm.com, Kexec Mailing List <kexec@lists.infradead.org>,
 ldufour@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 23, 2020 at 9:27 PM Nathan Lynch <nathanl@linux.ibm.com> wrote:
>
> Pingfan Liu <kernelfans@gmail.com> writes:
> > A bug is observed on pseries by taking the following steps on rhel:
> > -1. drmgr -c mem -r -q 5
> > -2. echo c > /proc/sysrq-trigger
> >
> > And then, the failure looks like:
> > kdump: saving to /sysroot//var/crash/127.0.0.1-2020-01-16-02:06:14/
> > kdump: saving vmcore-dmesg.txt
> > kdump: saving vmcore-dmesg.txt complete
> > kdump: saving vmcore
> >  Checking for memory holes                         : [  0.0 %] /       =
            Checking for memory holes                         : [100.0 %] |=
                   Excluding unnecessary pages                       : [100=
.0 %] \                   Copying data                                     =
 : [  0.3 %] -          eta: 38s[   44.337636] hash-mmu: mm: Hashing failur=
e ! EA=3D0x7fffba400000 access=3D0x8000000000000004 current=3Dmakedumpfile
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
> >   After analyzing, it turns out that in the current implementation,
> > when hot-removing lmb, the KOBJ_REMOVE event ejects before the dt updat=
ing as
> > the code __remove_memory() comes before drmem_update_dt().
> > So in kdump kernel, when read_from_oldmem() resorts to
> > pSeries_lpar_hpte_insert() to install hpte, but fails with -2 due to
> > non-exist pfn. And finally, low_hash_fault() raise SIGBUS to process, a=
s it
> > can be observed "Bus error"
> >
> > From a viewpoint of listener and publisher, the publisher notifies the
> > listener before data is ready.  This introduces a problem where udev
> > launches kexec-tools (due to KOBJ_REMOVE) and loads a stale dt before
> > updating. And in capture kernel, makedumpfile will access the memory ba=
sed
> > on the stale dt info, and hit a SIGBUS error due to an un-existed lmb.
> >
> > * Fix *
> >   In order to fix this issue, update dt before __remove_memory(), and
> > accordingly the same rule in hot-add path.
> >
> > This will introduce extra dt updating payload for each involved lmb whe=
n hotplug.
> > But it should be fine since drmem_update_dt() is memory based operation=
 and
> > hotplug is not a hot path.
>
> This is great analysis but the performance implications of the change
> are grave. The add/remove paths here are already O(n) where n is the
> quantity of memory assigned to the LP, this change would make it O(n^2):
>
> dlpar_memory_add_by_count
>   for_each_drmem_lmb             <--
>     dlpar_add_lmb
>       drmem_update_dt(_v1|_v2)
>         for_each_drmem_lmb       <--
>
> Memory add/remove isn't a hot path but quadratic runtime complexity
> isn't acceptable. Its current performance is bad enough that I have
Yes, the quadratic runtime complexity sounds terrible.
And I am curious about the bug. Does the system have thousands of lmb?

> internal bugs open on it.
>
> Not to mention we leak memory every time drmem_update_dt is called
> because we can't safely free device tree properties :-(
Do you know what block us to free it?
>
> Also note that this sort of reverts (fixes?) 063b8b1251fd
> ("powerpc/pseries/memory-hotplug: Only update DT once per memory DLPAR
> request").
Yes. And now, I think I need to bring up another method to fix it.

Thanks,
Pingfan
