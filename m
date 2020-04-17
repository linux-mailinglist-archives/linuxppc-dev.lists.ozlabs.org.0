Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CF01AD9DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 11:28:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493W3w0mJRzDq9J
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 19:28:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=geert.uytterhoeven@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493W0g2yXHzDqJ7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 19:25:38 +1000 (AEST)
Received: by mail-oi1-f193.google.com with SMTP id j16so1511605oih.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 02:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BWSTE4N/Wm9rwAUVp1UnC1E/i0r+ahDeY0nVMk2tI18=;
 b=YJLP6eLaFRwKzj8pJv9HAiG6NGhac3J56ub8niAWTuCpNPWLg4lGFQs89yYAt410yx
 CyR4PGSwgOpoVhtvOgIGN+waC2Dv8P+yNwk2s0fFELLcHEXmE1h1XX+k8dgW5NTAIo+G
 lII6zH1g+zABs0ZltUWMKKs468Habfr0amLWzuj0sBtVoRDVOxpvUZ9C1I5oSzKwUPsK
 PcnAf0oMIRVQ6YVBi4Uaw9RYixVLSopQgiDQc7gaPYJChCAddMUnWVQbcx8DLvRAaBOT
 OCXWlOvdpCphmDQ7NGiEJTqmuUZY0LVwtUsqlfFb0jQl6uepRNboasjOiqCK+jYgt+Rr
 W3aw==
X-Gm-Message-State: AGi0PuZANyct0lnvPSmbw5QWt4EQ0kUgYFGjefVwsC5Oa6DTBD4wTtSf
 20sIe81TDxrrVK2pz6gSUlXGGU1FuP8XYk7dr6M=
X-Google-Smtp-Source: APiQypKOQv5qC1afvAW43RZ+soR2wpbEzQicoJCcDz/ilWYKQxCgXhQrGiZnQcdr5oL9NLxkkPtHOBZ4kMwMNNnvFv8=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr1412099oig.153.1587115535289; 
 Fri, 17 Apr 2020 02:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200415024356.23751-1-jasowang@redhat.com>
 <20200416185426-mutt-send-email-mst@kernel.org>
 <b7e2deb7-cb64-b625-aeb4-760c7b28c0c8@redhat.com>
 <20200417022929-mutt-send-email-mst@kernel.org>
 <4274625d-6feb-81b6-5b0a-695229e7c33d@redhat.com>
 <20200417042912-mutt-send-email-mst@kernel.org>
 <fdb555a6-4b8d-15b6-0849-3fe0e0786038@redhat.com>
 <20200417044230-mutt-send-email-mst@kernel.org>
 <73843240-3040-655d-baa9-683341ed4786@redhat.com>
 <20200417045454-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200417045454-mutt-send-email-mst@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Apr 2020 11:25:23 +0200
Message-ID: <CAMuHMdXbzd9puG6gGri4jUtUT8rFrqnWwZ1NwP=47WQJ_eBC5g@mail.gmail.com>
Subject: Re: [PATCH V2] vhost: do not enable VHOST_MENU by default
To: "Michael S. Tsirkin" <mst@redhat.com>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vasily Gorbik <gor@linux.ibm.com>, KVM list <kvm@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Jason Wang <jasowang@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, virtualization@lists.linux-foundation.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Fri, Apr 17, 2020 at 10:57 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> On Fri, Apr 17, 2020 at 04:51:19PM +0800, Jason Wang wrote:
> > On 2020/4/17 =E4=B8=8B=E5=8D=884:46, Michael S. Tsirkin wrote:
> > > On Fri, Apr 17, 2020 at 04:39:49PM +0800, Jason Wang wrote:
> > > > On 2020/4/17 =E4=B8=8B=E5=8D=884:29, Michael S. Tsirkin wrote:
> > > > > On Fri, Apr 17, 2020 at 03:36:52PM +0800, Jason Wang wrote:
> > > > > > On 2020/4/17 =E4=B8=8B=E5=8D=882:33, Michael S. Tsirkin wrote:
> > > > > > > On Fri, Apr 17, 2020 at 11:12:14AM +0800, Jason Wang wrote:
> > > > > > > > On 2020/4/17 =E4=B8=8A=E5=8D=886:55, Michael S. Tsirkin wro=
te:
> > > > > > > > > On Wed, Apr 15, 2020 at 10:43:56AM +0800, Jason Wang wrot=
e:
> > > > > > > > > > We try to keep the defconfig untouched after decoupling=
 CONFIG_VHOST
> > > > > > > > > > out of CONFIG_VIRTUALIZATION in commit 20c384f1ea1a
> > > > > > > > > > ("vhost: refine vhost and vringh kconfig") by enabling =
VHOST_MENU by
> > > > > > > > > > default. Then the defconfigs can keep enabling CONFIG_V=
HOST_NET
> > > > > > > > > > without the caring of CONFIG_VHOST.
> > > > > > > > > >
> > > > > > > > > > But this will leave a "CONFIG_VHOST_MENU=3Dy" in all de=
fconfigs and even
> > > > > > > > > > for the ones that doesn't want vhost. So it actually sh=
ifts the
> > > > > > > > > > burdens to the maintainers of all other to add "CONFIG_=
VHOST_MENU is
> > > > > > > > > > not set". So this patch tries to enable CONFIG_VHOST ex=
plicitly in
> > > > > > > > > > defconfigs that enables CONFIG_VHOST_NET and CONFIG_VHO=
ST_VSOCK.
> > > > > > > > > >
> > > > > > > > > > Acked-by: Christian Borntraeger<borntraeger@de.ibm.com>=
   (s390)
> > > > > > > > > > Acked-by: Michael Ellerman<mpe@ellerman.id.au>   (power=
pc)
> > > > > > > > > > Cc: Thomas Bogendoerfer<tsbogend@alpha.franken.de>
> > > > > > > > > > Cc: Benjamin Herrenschmidt<benh@kernel.crashing.org>
> > > > > > > > > > Cc: Paul Mackerras<paulus@samba.org>
> > > > > > > > > > Cc: Michael Ellerman<mpe@ellerman.id.au>
> > > > > > > > > > Cc: Heiko Carstens<heiko.carstens@de.ibm.com>
> > > > > > > > > > Cc: Vasily Gorbik<gor@linux.ibm.com>
> > > > > > > > > > Cc: Christian Borntraeger<borntraeger@de.ibm.com>
> > > > > > > > > > Reported-by: Geert Uytterhoeven<geert@linux-m68k.org>
> > > > > > > > > > Signed-off-by: Jason Wang<jasowang@redhat.com>
> > > > > > > > > I rebased this on top of OABI fix since that
> > > > > > > > > seems more orgent to fix.
> > > > > > > > > Pushed to my vhost branch pls take a look and
> > > > > > > > > if possible test.
> > > > > > > > > Thanks!
> > > > > > > > I test this patch by generating the defconfigs that wants v=
host_net or
> > > > > > > > vhost_vsock. All looks fine.
> > > > > > > >
> > > > > > > > But having CONFIG_VHOST_DPN=3Dy may end up with the similar=
 situation that
> > > > > > > > this patch want to address.
> > > > > > > > Maybe we can let CONFIG_VHOST depends on !ARM || AEABI then=
 add another
> > > > > > > > menuconfig for VHOST_RING and do something similar?
> > > > > > > >
> > > > > > > > Thanks
> > > > > > > Sorry I don't understand. After this patch CONFIG_VHOST_DPN i=
s just
> > > > > > > an internal variable for the OABI fix. I kept it separate
> > > > > > > so it's easy to revert for 5.8. Yes we could squash it into
> > > > > > > VHOST directly but I don't see how that changes logic at all.
> > > > > > Sorry for being unclear.
> > > > > >
> > > > > > I meant since it was enabled by default, "CONFIG_VHOST_DPN=3Dy"=
 will be left
> > > > > > in the defconfigs.
> > > > > But who cares?
> > > > FYI, please seehttps://www.spinics.net/lists/kvm/msg212685.html
> > > The complaint was not about the symbol IIUC.  It was that we caused
> > > everyone to build vhost unless they manually disabled it.
> >
> > There could be some misunderstanding here. I thought it's somehow simil=
ar: a
> > CONFIG_VHOST_MENU=3Dy will be left in the defconfigs even if CONFIG_VHO=
ST is
> > not set.
> >
> > Thanks
>
> Hmm. So looking at Documentation/kbuild/kconfig-language.rst :
>
>         Things that merit "default y/m" include:
>
>         a) A new Kconfig option for something that used to always be buil=
t
>            should be "default y".
>
>         b) A new gatekeeping Kconfig option that hides/shows other Kconfi=
g
>            options (but does not generate any code of its own), should be
>            "default y" so people will see those other options.
>
>         c) Sub-driver behavior or similar options for a driver that is
>            "default n". This allows you to provide sane defaults.
>
>
> So it looks like VHOST_MENU is actually matching rule b).
> So what's the problem we are trying to solve with this patch, exactly?
>
> Geert could you clarify pls?

I can confirm VHOST_MENU is matching rule b), so it is safe to always
enable it.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
