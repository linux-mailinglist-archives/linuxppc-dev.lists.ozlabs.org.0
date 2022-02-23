Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 999E04C1D48
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 21:43:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3nzv0CcFz3cXj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 07:43:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.133; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3nzM2tpsz3cDn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 07:42:38 +1100 (AEDT)
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MkHhB-1o7Kth0qWP-00kiCX for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb
 2022 21:42:36 +0100
Received: by mail-wr1-f49.google.com with SMTP id d17so6711529wrc.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 12:42:36 -0800 (PST)
X-Gm-Message-State: AOAM532GIIBjZcwmWSSZoVf2eZoucz1sul8/MXgfe3q0l7QrrR13eo4G
 pOUPErcCQAT/rRHidAbriLhO6A4q2bYwaO34AII=
X-Google-Smtp-Source: ABdhPJziqSCxjCS1x1u10tLrK12Y5BgM1gvdjleghmB0yDOaxeqY4rE/1foGEILFQdcVBbYw8yS43bNCsScP3V8TzG8=
X-Received: by 2002:adf:cf0c:0:b0:1e6:22fe:4580 with SMTP id
 o12-20020adfcf0c000000b001e622fe4580mr1011010wrj.12.1645648955871; Wed, 23
 Feb 2022 12:42:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641500561.git.christophe.jaillet@wanadoo.fr>
 <YhXmQwvjMFPQFPUr@infradead.org>
 <ddf6010e-417d-8da7-8e11-1b4a55f92fff@wanadoo.fr>
In-Reply-To: <ddf6010e-417d-8da7-8e11-1b4a55f92fff@wanadoo.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 23 Feb 2022 21:42:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0nshfiWnhZydoRkmNBMQnyPueE4pvV1LuWR4XLxBQjUg@mail.gmail.com>
Message-ID: <CAK8P3a0nshfiWnhZydoRkmNBMQnyPueE4pvV1LuWR4XLxBQjUg@mail.gmail.com>
Subject: Re: [PATCH 00/16] Remove usage of the deprecated "pci-dma-compat.h"
 API
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3129hbC98YGZzJ4HHJLsXTCX3hAuEx1SzIbQcxgPHhv2AiOzgE/
 HSWkHrOGtGOfoDAnyPkqVhJyvIaXbsU8v9cbebVJ/jdkrOEVtQDw8G4bL61+Bdko/RivScG
 7+PiPytfbtheuDrduF2BRzzVsPmhfNjnz1YEIeF8m/sJYMK04O9VnpM/uBTw7JFcfTa8mfq
 +eTNcUGBVrYq1DAJCRotA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0xDULfELQUA=:ATRMCv7QKUxpxT8a0MwEPc
 H+w24rq1p/2h9rcX2jv7ObWjhShg7FWss3b7mg/KPXxs/XRRf7//ceYDtxxNL75PT/tgIfO6U
 f7YpPMNOlaystfiTV/yF1dRtv5sNUM8Dk7C85SLfhHzpcUmHqBpxBD4avK6RrWYwWdW9whuj3
 CjwQGRHp9iz0aWyIEwx9JyLsXrpls3FwgGJUmrqrq2AmY5vseszmzMhVvNdxsCyNTIrmFlx62
 XFK6lKnLSVEnNf3CXkV7lnuNx8BrveIDb42AATMsYJdisYGNScLMj4qm0V9kbvjx5kKQd08fu
 3slGSyHQo3dkhbV7doAA3T36QR64pRoEZRq+OYEUppgefC9OiUildqbAQlol3nVz74zwMWE+o
 hOCTE1bxSnZOQFtiNyj7+PWM4Ay2QcklFCkQ5pORdSIRTnK1wmNBfhUb9d478tcC/+sRegANm
 yxQS2mhu4+NjFQO+1+E0MxzOprZCGn1l91KyoIJSk5AdLX+SAU4RYF/kcJk0yzwd0BgB9kCH9
 O7+/nqEdH9o1rYu88rXQZYg2yR5dvdeY66LhqtWaBgHSRaqBz1hDqLj76B/QBuFRDH8YQv+2L
 57xfH4en5bh1LjXhYssf1RP1FjIIoVl4KF3h7EjyDzT+GDjMULp0nHoZvWqPsDdxe5+TDGrpA
 VEiQulVElSEEbc7C3eOmQ7DuVTluBs0sy3iZsa1703vIVVEoieS05TcJ3ydHF8W0RDwlBJuLZ
 a5t9EdVWRczcQ+oQo5cbbrA380wLzraeVmeoDzLt/N6shOx8sluXOi2ZIiTVRHFaYJinCdr9R
 nK+gi7duzQryHsatcRbEQ/JSPwdTgIoAsf9WZdgjwdTv7TLEJM=
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
Cc: David Airlie <airlied@linux.ie>, Tom Rix <trix@redhat.com>,
 linux-fpga@vger.kernel.org, linux-pci <linux-pci@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Christoph Hellwig <hch@infradead.org>, MPT-FusionLinux.pdl@broadcom.com,
 hao.wu@intel.com, Arnd Bergmann <arnd@arndb.de>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 sreekanth.reddy@broadcom.com, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matt Turner <mattst88@gmail.com>,
 awalls@md.metrocast.net, David Miller <davem@davemloft.net>,
 Alex Bounine <alex.bou9@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, dmaengine@vger.kernel.org,
 Moritz Fischer <mdf@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Xu Yilun <yilun.xu@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 23, 2022 at 9:26 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 23/02/2022 =C3=A0 08:46, Christoph Hellwig a =C3=A9crit :
> > Hi Christophe,
> >
> > do you know what the state is in current linux-next?
> >
> > I think we'll just want to queue up anything left at this point in the
> > dma-mapping or PCI tree and get it done.
> >
>
> Hi,
>
> Patch 01, 04, 05, 06, 08, 09 have not reached -next yet.
> They all still apply cleanly.
>
> 04 has been picked it up for inclusion in the media subsystem for 5.18.
> The other ones all have 1 or more Reviewed-by:/Acked-by: tags.
>
> Patch 16 must be resubmitted to add "#include <linux/dma-mapping.h>" in
> order not to break builds.
>
>
> All the other patches have landed in -next.

Ok, these all look trivial. I'd suggest you send the rebase version to
Andrew Morton then, so he can pick them all up into linux-mm, on top
of the linux-next contents.

         Arnd
