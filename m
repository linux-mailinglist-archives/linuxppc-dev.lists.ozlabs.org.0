Return-Path: <linuxppc-dev+bounces-6975-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D5BA5F73A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 15:05:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD8RP19jLz3cC6;
	Fri, 14 Mar 2025 01:05:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1098:5b::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741874752;
	cv=none; b=UikXeTFLMLNrfKI7NPPe1DipIFXHUo5/TUaWpOlMAtohEq4eUedluEL06+5QJNT4uhUr9bj6Qvze5yxSEhbPFBs+Ibj2omwghiKYKmWTFe5licwfPoUGC+7OxEtaspsnVCshDyX7HC1ApeMmMeU0kdcnY0nfv+FWQlDh9P3O+vUtvyYsMfLcXljCM0cege8+iwH3YeKipLdum1Ka4kFWUpNK+ilAno8z46sJ2TGsbSdKOKlahYAxKF94NMBkoj9vfEZYz20kjkeNyDHHClI3FHz0JZV9hX8k3h6TL/9fPSG1rqVsRvyzEMriR6U80+0Yl+ZeTHCYMCS7irg3J+29UA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741874752; c=relaxed/relaxed;
	bh=PEsRyzQpnsTIeXVgh3VKXs2l1ybuznv72IKMRB+grdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFOVvq4GQ6MN03dQpuR92nkLfDvuu0feYiukZwOISiQyn+E2WxTNNV8IwSqBs7AnNB3WlVzq2QtDX8BY5HSvLTBeAn1z6Tm6cgewPO2t99pcEU1k2dNTFe61WWVtLSyEF2U0EWdSd4vXGHAh8Lx/O/kWsN/9S2pJ09JOjjd4TQrfPJtq9XuZFooOpBUPOmhhspZpWtTK1/NRYTxfw5hUOknvjtqsbhQGlR2Zrb9AOBqX2lUE8hDWQPH1wwRnANICdE+lWepJnJQcZbyInvC1NeyZ1hBoC2wM3h1BTQt7HWe8wRoXz4tcSryGGw0goN/OsCCETb60UeDnA81LbIJZbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org; dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=Qr8mHT8t; dkim-atps=neutral; spf=pass (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org) smtp.mailfrom=treblig.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=Qr8mHT8t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org)
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD8RL1BxCz3c9R
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 01:05:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=PEsRyzQpnsTIeXVgh3VKXs2l1ybuznv72IKMRB+grdU=; b=Qr8mHT8tIdgntsqj
	NLrrS5Nptf7Tk9fTNx2lUaq17GWzLPe++dmJ/knwGNcamJkF7mmQdKUGO4KkGfI+uOVW2SYvOuYnj
	ywq5WWolNQHzhB7hsIoObIvmm9u6ce/iE5xZaAOFJw6dhcs5UnROKWLVAjmUtFfLy396y+rxr2CzL
	qmpNRx7lY61adQjn+6wz7BJhLBG7bIIvq2SLUJ5JvM22js3jepniEmeIAk3RyUCZbWHhkRBXvC77N
	an/ZWCodTWczRMEeRy9NtcFHMYAC/dC1m5zJFgVLfnQGxemQF6+/kVt1/UTOqMf+RwyDheSgPRMs0
	Clmjuln9XCwddUhhDw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tsiUj-004dd2-1D;
	Thu, 13 Mar 2025 13:21:05 +0000
Date: Thu, 13 Mar 2025 13:21:05 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, ioana.ciornei@nxp.com,
	stuyoder@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: Remove deadcode
Message-ID: <Z9LbwRUsHwFLpBZA@gallifrey>
References: <20241115152055.279732-1-linux@treblig.org>
 <3f9dbb7b-6527-48e1-9028-b46e5a0c58ce@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f9dbb7b-6527-48e1-9028-b46e5a0c58ce@csgroup.eu>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 13:17:26 up 309 days, 31 min,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

* Christophe Leroy (christophe.leroy@csgroup.eu) wrote:
> 
> 
> Le 15/11/2024 à 16:20, linux@treblig.org a écrit :
> > [Vous ne recevez pas souvent de courriers de linux@treblig.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > fsl_mc_allocator_driver_exit() was added explicitly by
> > commit 1e8ac83b6caf ("bus: fsl-mc: add fsl_mc_allocator cleanup function")
> > but was never used.
> > 
> > Remove it.
> > 
> > fsl_mc_portal_reset() was added in 2015 by
> > commit 197f4d6a4a00 ("staging: fsl-mc: fsl-mc object allocator driver")
> > but was never used.
> > 
> > Remove it.
> > 
> > fsl_mc_portal_reset() was the only caller of dpmcp_reset().
> > 
> > Remove it.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Hi,
  Can someone pick this old change up please?  I see the PPC patchwork says
  'handled elsewhere' but doesn't say where.

Thanks,

Dave
> 
> > ---
> >   drivers/bus/fsl-mc/dpmcp.c            | 22 ----------------------
> >   drivers/bus/fsl-mc/fsl-mc-allocator.c |  5 -----
> >   drivers/bus/fsl-mc/fsl-mc-private.h   |  6 ------
> >   drivers/bus/fsl-mc/mc-io.c            | 20 --------------------
> >   include/linux/fsl/mc.h                |  2 --
> >   5 files changed, 55 deletions(-)
> > 
> > diff --git a/drivers/bus/fsl-mc/dpmcp.c b/drivers/bus/fsl-mc/dpmcp.c
> > index 5fbd0dbde24a..7816c0a728ef 100644
> > --- a/drivers/bus/fsl-mc/dpmcp.c
> > +++ b/drivers/bus/fsl-mc/dpmcp.c
> > @@ -75,25 +75,3 @@ int dpmcp_close(struct fsl_mc_io *mc_io,
> >          /* send command to mc*/
> >          return mc_send_command(mc_io, &cmd);
> >   }
> > -
> > -/**
> > - * dpmcp_reset() - Reset the DPMCP, returns the object to initial state.
> > - * @mc_io:     Pointer to MC portal's I/O object
> > - * @cmd_flags: Command flags; one or more of 'MC_CMD_FLAG_'
> > - * @token:     Token of DPMCP object
> > - *
> > - * Return:     '0' on Success; Error code otherwise.
> > - */
> > -int dpmcp_reset(struct fsl_mc_io *mc_io,
> > -               u32 cmd_flags,
> > -               u16 token)
> > -{
> > -       struct fsl_mc_command cmd = { 0 };
> > -
> > -       /* prepare command */
> > -       cmd.header = mc_encode_cmd_header(DPMCP_CMDID_RESET,
> > -                                         cmd_flags, token);
> > -
> > -       /* send command to mc*/
> > -       return mc_send_command(mc_io, &cmd);
> > -}
> > diff --git a/drivers/bus/fsl-mc/fsl-mc-allocator.c b/drivers/bus/fsl-mc/fsl-mc-allocator.c
> > index b5e8c021fa1f..6c3beb82dd1b 100644
> > --- a/drivers/bus/fsl-mc/fsl-mc-allocator.c
> > +++ b/drivers/bus/fsl-mc/fsl-mc-allocator.c
> > @@ -656,8 +656,3 @@ int __init fsl_mc_allocator_driver_init(void)
> >   {
> >          return fsl_mc_driver_register(&fsl_mc_allocator_driver);
> >   }
> > -
> > -void fsl_mc_allocator_driver_exit(void)
> > -{
> > -       fsl_mc_driver_unregister(&fsl_mc_allocator_driver);
> > -}
> > diff --git a/drivers/bus/fsl-mc/fsl-mc-private.h b/drivers/bus/fsl-mc/fsl-mc-private.h
> > index b3520ea1b9f4..e1b7ec3ed1a7 100644
> > --- a/drivers/bus/fsl-mc/fsl-mc-private.h
> > +++ b/drivers/bus/fsl-mc/fsl-mc-private.h
> > @@ -66,10 +66,6 @@ int dpmcp_close(struct fsl_mc_io *mc_io,
> >                  u32 cmd_flags,
> >                  u16 token);
> > 
> > -int dpmcp_reset(struct fsl_mc_io *mc_io,
> > -               u32 cmd_flags,
> > -               u16 token);
> > -
> >   /*
> >    * Data Path Resource Container (DPRC) API
> >    */
> > @@ -631,8 +627,6 @@ int dprc_scan_objects(struct fsl_mc_device *mc_bus_dev,
> > 
> >   int __init fsl_mc_allocator_driver_init(void);
> > 
> > -void fsl_mc_allocator_driver_exit(void);
> > -
> >   void fsl_mc_init_all_resource_pools(struct fsl_mc_device *mc_bus_dev);
> > 
> >   void fsl_mc_cleanup_all_resource_pools(struct fsl_mc_device *mc_bus_dev);
> > diff --git a/drivers/bus/fsl-mc/mc-io.c b/drivers/bus/fsl-mc/mc-io.c
> > index 95b10a6cf307..a0ad7866cbfc 100644
> > --- a/drivers/bus/fsl-mc/mc-io.c
> > +++ b/drivers/bus/fsl-mc/mc-io.c
> > @@ -263,23 +263,3 @@ void fsl_mc_portal_free(struct fsl_mc_io *mc_io)
> >          dpmcp_dev->consumer_link = NULL;
> >   }
> >   EXPORT_SYMBOL_GPL(fsl_mc_portal_free);
> > -
> > -/**
> > - * fsl_mc_portal_reset - Resets the dpmcp object for a given fsl_mc_io object
> > - *
> > - * @mc_io: Pointer to the fsl_mc_io object that wraps the MC portal to free
> > - */
> > -int fsl_mc_portal_reset(struct fsl_mc_io *mc_io)
> > -{
> > -       int error;
> > -       struct fsl_mc_device *dpmcp_dev = mc_io->dpmcp_dev;
> > -
> > -       error = dpmcp_reset(mc_io, 0, dpmcp_dev->mc_handle);
> > -       if (error < 0) {
> > -               dev_err(&dpmcp_dev->dev, "dpmcp_reset() failed: %d\n", error);
> > -               return error;
> > -       }
> > -
> > -       return 0;
> > -}
> > -EXPORT_SYMBOL_GPL(fsl_mc_portal_reset);
> > diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
> > index c90ec889bfc2..37316a58d2ed 100644
> > --- a/include/linux/fsl/mc.h
> > +++ b/include/linux/fsl/mc.h
> > @@ -417,8 +417,6 @@ int __must_check fsl_mc_portal_allocate(struct fsl_mc_device *mc_dev,
> > 
> >   void fsl_mc_portal_free(struct fsl_mc_io *mc_io);
> > 
> > -int fsl_mc_portal_reset(struct fsl_mc_io *mc_io);
> > -
> >   int __must_check fsl_mc_object_allocate(struct fsl_mc_device *mc_dev,
> >                                          enum fsl_mc_pool_type pool_type,
> >                                          struct fsl_mc_device **new_mc_adev);
> > --
> > 2.47.0
> > 
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

