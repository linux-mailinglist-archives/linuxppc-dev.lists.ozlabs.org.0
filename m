Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7530A10675A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 08:54:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47K7xW4svfzDrLj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 18:54:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=buserror.net
 (client-ip=165.227.176.147; helo=baldur.buserror.net;
 envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=buserror.net
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47K7JK6y7szDrHd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 18:25:52 +1100 (AEDT)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1iY3Hv-0008R8-MZ; Fri, 22 Nov 2019 01:23:32 -0600
Message-ID: <ff6ac26dca3b1c3a74786c33b4d872535882d8ac.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Li Yang <leoyang.li@nxp.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Fri, 22 Nov 2019 01:23:30 -0600
In-Reply-To: <CADRPPNT4+zZd6fezcDcN=0EcezR4mHqnrOBBEexqBLyrV_THXQ@mail.gmail.com>
References: <20191118112324.22725-1-linux@rasmusvillemoes.dk>
 <20191118112324.22725-14-linux@rasmusvillemoes.dk>
 <CADRPPNT4+zZd6fezcDcN=0EcezR4mHqnrOBBEexqBLyrV_THXQ@mail.gmail.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: leoyang.li@nxp.com, linux@rasmusvillemoes.dk,
 qiang.zhao@nxp.com, christophe.leroy@c-s.fr, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 timur@kernel.org
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 * -1.5 GREYLIST_ISWHITE The incoming server has been whitelisted for
 *      this recipient and sender
Subject: Re: [PATCH v5 13/48] powerpc/83xx: remove mpc83xx_ipic_and_qe_init_IRQ
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: Timur Tabi <timur@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-11-20 at 11:59 -0600, Li Yang wrote:
> On Mon, Nov 18, 2019 at 5:29 AM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
> 
> Hi Scott,
> 
> What do you think of the PowerPC related changes(patch 13,14)?  Can we
> have you ACK and merge the series from soc tree?

Acked-by: Scott Wood <oss@buserror.net>

-Scott

> 
> Regards,
> Leo
> > 
> > This is now exactly the same as mpc83xx_ipic_init_IRQ, so just use
> > that directly.
> > 
> > Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > ---
> >  arch/powerpc/platforms/83xx/km83xx.c      | 2 +-
> >  arch/powerpc/platforms/83xx/misc.c        | 7 -------
> >  arch/powerpc/platforms/83xx/mpc832x_mds.c | 2 +-
> >  arch/powerpc/platforms/83xx/mpc832x_rdb.c | 2 +-
> >  arch/powerpc/platforms/83xx/mpc836x_mds.c | 2 +-
> >  arch/powerpc/platforms/83xx/mpc836x_rdk.c | 2 +-
> >  arch/powerpc/platforms/83xx/mpc83xx.h     | 5 -----
> >  7 files changed, 5 insertions(+), 17 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/83xx/km83xx.c
> > b/arch/powerpc/platforms/83xx/km83xx.c
> > index 5c6227f7bc37..3d89569e9e71 100644
> > --- a/arch/powerpc/platforms/83xx/km83xx.c
> > +++ b/arch/powerpc/platforms/83xx/km83xx.c
> > @@ -177,7 +177,7 @@ define_machine(mpc83xx_km) {
> >         .name           = "mpc83xx-km-platform",
> >         .probe          = mpc83xx_km_probe,
> >         .setup_arch     = mpc83xx_km_setup_arch,
> > -       .init_IRQ       = mpc83xx_ipic_and_qe_init_IRQ,
> > +       .init_IRQ       = mpc83xx_ipic_init_IRQ,
> >         .get_irq        = ipic_get_irq,
> >         .restart        = mpc83xx_restart,
> >         .time_init      = mpc83xx_time_init,
> > diff --git a/arch/powerpc/platforms/83xx/misc.c
> > b/arch/powerpc/platforms/83xx/misc.c
> > index 6935a5b9fbd1..1d8306eb2958 100644
> > --- a/arch/powerpc/platforms/83xx/misc.c
> > +++ b/arch/powerpc/platforms/83xx/misc.c
> > @@ -88,13 +88,6 @@ void __init mpc83xx_ipic_init_IRQ(void)
> >         ipic_set_default_priority();
> >  }
> > 
> > -#ifdef CONFIG_QUICC_ENGINE
> > -void __init mpc83xx_ipic_and_qe_init_IRQ(void)
> > -{
> > -       mpc83xx_ipic_init_IRQ();
> > -}
> > -#endif /* CONFIG_QUICC_ENGINE */
> > -
> >  static const struct of_device_id of_bus_ids[] __initconst = {
> >         { .type = "soc", },
> >         { .compatible = "soc", },
> > diff --git a/arch/powerpc/platforms/83xx/mpc832x_mds.c
> > b/arch/powerpc/platforms/83xx/mpc832x_mds.c
> > index 1c73af104d19..6fa5402ebf20 100644
> > --- a/arch/powerpc/platforms/83xx/mpc832x_mds.c
> > +++ b/arch/powerpc/platforms/83xx/mpc832x_mds.c
> > @@ -101,7 +101,7 @@ define_machine(mpc832x_mds) {
> >         .name           = "MPC832x MDS",
> >         .probe          = mpc832x_sys_probe,
> >         .setup_arch     = mpc832x_sys_setup_arch,
> > -       .init_IRQ       = mpc83xx_ipic_and_qe_init_IRQ,
> > +       .init_IRQ       = mpc83xx_ipic_init_IRQ,
> >         .get_irq        = ipic_get_irq,
> >         .restart        = mpc83xx_restart,
> >         .time_init      = mpc83xx_time_init,
> > diff --git a/arch/powerpc/platforms/83xx/mpc832x_rdb.c
> > b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
> > index 87f68ca06255..622c625d5ce4 100644
> > --- a/arch/powerpc/platforms/83xx/mpc832x_rdb.c
> > +++ b/arch/powerpc/platforms/83xx/mpc832x_rdb.c
> > @@ -219,7 +219,7 @@ define_machine(mpc832x_rdb) {
> >         .name           = "MPC832x RDB",
> >         .probe          = mpc832x_rdb_probe,
> >         .setup_arch     = mpc832x_rdb_setup_arch,
> > -       .init_IRQ       = mpc83xx_ipic_and_qe_init_IRQ,
> > +       .init_IRQ       = mpc83xx_ipic_init_IRQ,
> >         .get_irq        = ipic_get_irq,
> >         .restart        = mpc83xx_restart,
> >         .time_init      = mpc83xx_time_init,
> > diff --git a/arch/powerpc/platforms/83xx/mpc836x_mds.c
> > b/arch/powerpc/platforms/83xx/mpc836x_mds.c
> > index 5b484da9533e..219a83ab6c00 100644
> > --- a/arch/powerpc/platforms/83xx/mpc836x_mds.c
> > +++ b/arch/powerpc/platforms/83xx/mpc836x_mds.c
> > @@ -208,7 +208,7 @@ define_machine(mpc836x_mds) {
> >         .name           = "MPC836x MDS",
> >         .probe          = mpc836x_mds_probe,
> >         .setup_arch     = mpc836x_mds_setup_arch,
> > -       .init_IRQ       = mpc83xx_ipic_and_qe_init_IRQ,
> > +       .init_IRQ       = mpc83xx_ipic_init_IRQ,
> >         .get_irq        = ipic_get_irq,
> >         .restart        = mpc83xx_restart,
> >         .time_init      = mpc83xx_time_init,
> > diff --git a/arch/powerpc/platforms/83xx/mpc836x_rdk.c
> > b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
> > index b7119e443920..b4aac2cde849 100644
> > --- a/arch/powerpc/platforms/83xx/mpc836x_rdk.c
> > +++ b/arch/powerpc/platforms/83xx/mpc836x_rdk.c
> > @@ -41,7 +41,7 @@ define_machine(mpc836x_rdk) {
> >         .name           = "MPC836x RDK",
> >         .probe          = mpc836x_rdk_probe,
> >         .setup_arch     = mpc836x_rdk_setup_arch,
> > -       .init_IRQ       = mpc83xx_ipic_and_qe_init_IRQ,
> > +       .init_IRQ       = mpc83xx_ipic_init_IRQ,
> >         .get_irq        = ipic_get_irq,
> >         .restart        = mpc83xx_restart,
> >         .time_init      = mpc83xx_time_init,
> > diff --git a/arch/powerpc/platforms/83xx/mpc83xx.h
> > b/arch/powerpc/platforms/83xx/mpc83xx.h
> > index d343f6ce2599..f37d04332fc7 100644
> > --- a/arch/powerpc/platforms/83xx/mpc83xx.h
> > +++ b/arch/powerpc/platforms/83xx/mpc83xx.h
> > @@ -72,11 +72,6 @@ extern int mpc837x_usb_cfg(void);
> >  extern int mpc834x_usb_cfg(void);
> >  extern int mpc831x_usb_cfg(void);
> >  extern void mpc83xx_ipic_init_IRQ(void);
> > -#ifdef CONFIG_QUICC_ENGINE
> > -extern void mpc83xx_ipic_and_qe_init_IRQ(void);
> > -#else
> > -#define mpc83xx_ipic_and_qe_init_IRQ mpc83xx_ipic_init_IRQ
> > -#endif /* CONFIG_QUICC_ENGINE */
> > 
> >  #ifdef CONFIG_PCI
> >  extern void mpc83xx_setup_pci(void);
> > --
> > 2.23.0
> > 
> 
> 

