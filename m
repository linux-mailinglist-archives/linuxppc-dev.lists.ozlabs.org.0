Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 768EA1B3AEB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 11:13:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496ZVP5VZCzDqQK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 19:13:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J4giD/YB; dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496ZSf6RGNzDqmq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 19:12:00 +1000 (AEST)
Received: by mail-il1-x142.google.com with SMTP id z12so1126684ilb.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 02:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HLA2X61U+G6ZU9bEd0gaBeZeOPn3A93++NR5CH7fB64=;
 b=J4giD/YBDck/mUz0NwFQmVGxTe9zC58MQlFLAUBAI8G5MB5vM1Rp3aJ6rpAtVprNOk
 fjK4+71GRvF2HV3KluQ3oGmf/X5xqtLOJdDGZs7SFWjzhOCE/UJxAO45q73x3htA1uff
 QFGDAoOK5RvuBFRKG19vPMWNefS/BkV8oQkA0du0Q/k4lgU3RXC68RSoydztfd87xOFw
 Oft5gwdc7SNDcoOKq4kdGGAvk2trvqzmbU46Xox7RnM/aSe0xUHsbJPR4EePZrbWO8DU
 HagahOT5NBK4iLVTpgdtYC0jPvdIhqXYRZLvtcSinDR5InMHTuOXWLl+btWsaHjppnji
 A55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HLA2X61U+G6ZU9bEd0gaBeZeOPn3A93++NR5CH7fB64=;
 b=plgK1U44nGofT7Lzv590ia1UqRW2NHb4qkGLNMz9LBF4DqzFC9DjJyRvbL/6PShoKz
 yxc2Lq7vX7qolr3fhY7p2l2tjsm+dnPMw5BaGDA6URolSX6WUYPw/XR5r0f238opPUth
 RICMxV8vtUDZ9SXZAsGjWZnVduTvDhaiZjKL0hHxMcWVpTdnV9SvNkKbefK+MrIBDkey
 bOoAr5wIWY4ClHnn0zm1lxJ2+Ow2r/olnTn/OEy4++Vnti0VTbFRBSrNUZslnkfac8t3
 aRV+nmy3I2XWpx6n7yGLAi7lTttw62iWV5+xaYsqcEZ0F0vOpYZkuSW96xcTcdVG+y+V
 9FOg==
X-Gm-Message-State: AGi0PuZFOPzjDwA+xVSLwPsN6sCSajWDbitt02KD2hU0Kgk1COCT1vdj
 Wq8EuZYEibM74XUSSQ4FiZfatIEa7KSpq6jjpVY=
X-Google-Smtp-Source: APiQypLL1gvBGc4Ay2OA6p4ztYkG00xYbbpahoQ5ydSVzKBkM11/r29cjbEPIXT9B2oV7tkziJyE0MoGrx9YPZIi6TQ=
X-Received: by 2002:a05:6e02:dc3:: with SMTP id
 l3mr24249236ilj.149.1587546717465; 
 Wed, 22 Apr 2020 02:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200323075354.93825-1-aik@ozlabs.ru>
 <b512ac5e-dca5-4c08-8ea1-a636b887c0d0@ozlabs.ru>
 <d5cac37a-8b32-cabf-e247-10e64f0110ab@ozlabs.ru>
 <CAOSf1CGfjX9LGQ1GDSmxrzjnaWOM3mUvBu9_xe-L2umin9n66w@mail.gmail.com>
 <CAOSf1CHgUsJ7jGokg6QD6cEDr4-o5hnyyyjRZ=YijsRY3T1sYA@mail.gmail.com>
 <b0b361092d2d7e38f753edee6dcd9222b4e388ce.camel@russell.cc>
 <9893c4db-057d-8e42-52fe-8241d6d90b5f@ozlabs.ru>
 <76718d0c46f4638a57fd2deeeed031143599d12d.camel@gmail.com>
 <8f317916-06be-ed25-4d9b-a8e2e993b112@ozlabs.ru>
 <CAOSf1CG_qiR2HvSFVTbgTyqVmDt4+Oy60PNWY23K2ihHib1K7Q@mail.gmail.com>
 <ee3fd87f-f2b6-1439-a310-fedc614e6155@ozlabs.ru>
In-Reply-To: <ee3fd87f-f2b6-1439-a310-fedc614e6155@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 22 Apr 2020 19:11:46 +1000
Message-ID: <CAOSf1CGeDCh-5TQ0mka0GG_gNeTY3EVtYkPvu=0ckrGe1VAqcw@mail.gmail.com>
Subject: Re: [PATCH kernel v2 0/7] powerpc/powenv/ioda: Allow huge DMA window
 at 4GB
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
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
Cc: KVM list <kvm@vger.kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, kvm-ppc@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 22, 2020 at 4:49 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> 32bit MMIO is what puzzles me in this picture, how does it work?

For devices with no m64 we allocate a PE number as described above. In
the 32bit MMIO window we have a segment-to-PE remapping table so any
m32 segment can be assigned to any PE. As a result slave PE concept
isn't really needed. If the BARs of a device span multiple m32
segments then we can setup the remapping table so that all the
segments point to the same PE.

> > I was thinking we should try minimise the number of DMA-only PEs since
> > it complicates the EEH freeze handling. When MMIO and DMA are mapped
> > to the same PE an error on either will cause the hardware to stop
> > both. When seperate PEs are used for DMA and MMIO you lose that
> > atomicity. It's not a big deal if DMA is stopped and MMIO allowed
> > since PAPR (sort-of) allows that, but having MMIO frozen with DMA
> > unfrozen is a bit sketch.
>
> You suggested using slave PEs for crippled functions - won't we have the
> same problem then?

Yes, but I think it's probably worth doing in that case. You get
slightly janky EEH in exchange for better DMA performance.

> And is this "slave PE" something the hardware supports or it is a
> software concept?

It's all in software. The hardware does have the PELT-V which allows
you to specify a group of PEs to additionally freeze when a PE is
frozen, but the PELT-V is only used when handling AER messages.  All
other error sources (DMAs, MMIOs, etc) will only freeze one PE (or all
of them in very rare cases).

> > There's been no official FW releases with a skiboot that supports the
> > phb get/set option opal calls so the only systems that can actually
> > take advantage of it are our lab systems. It might still be useful for
> > future systems, but I'd rather something that doesn't depend on FW
> > support.
>
> Pensando folks use it ;)

the what folks

Oliver
