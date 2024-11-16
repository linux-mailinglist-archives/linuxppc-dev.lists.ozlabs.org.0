Return-Path: <linuxppc-dev+bounces-3326-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B60589CFE30
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 11:33:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xr9Fr50J5z2xk1;
	Sat, 16 Nov 2024 21:33:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731753184;
	cv=none; b=D+mXGpU8DPwxLQgwj5rSt1sI5f6vaG9GBV4ddtQc8a3AepSPlc0LbqwS4IMiEtpDCdB/x17p5QnmeEMe5IKAWM4HGgPSvznrN1q+hqMdY6d2+zRTty4g+6ilSrPg4lpYWFcc2meiMU/7Ujm6ifp9anZtp76n1xSxJoP3MPZdy7iNV//N4C9nkwmIH0Du4OdH0/ouJbAunLVa3fRmnt+BVQYF9+78PZrw6y0YzK+kCFKdgwxzDAfsBN5ccnl8NO6didsSB0T26/c9eV2tYxt/l+ng7GlwLsC76u2mj4u/mt/XSyijgrntm5C9sicq4mPS1Kn/VXH/knTINaSi53hTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731753184; c=relaxed/relaxed;
	bh=EiKywmX11up7vzxh9wOVcX/xRjapeyihgtiC9Dahg/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VShMNE6C+hEN86VXUr0KgqlpVXyUtfNOeNt3OuBHHn5pGUVhbCsfOL3D26ZZmn+flmkuzmDWyYsh7ix8mxcz0WgwbuYGJmNU0IqJQ4RhCsoilI8f/J5eMLxPhx+5EPXrUrHDDsYHc822H2gQgQUadPmSFJrHJ6V91sFczx0Ij2K+Jq03BdykSun4t+YzNZzts/42gBStaGTSpbxu3IT6O4JJum8vMyDZlYUMqYrO7T6rwIgdY6CYb9dHp/srBk/HDtd51bbh7RcgMFAm4ZPvCrndERcgzg9NgjvSdOeV2EnnXN5N4i1BXql2RdMi8NMbw8LJNu1iipMl+lBkTiOnKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xr9Fq50PSz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 21:33:03 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Xr9Fm6mkmz9sSV;
	Sat, 16 Nov 2024 11:33:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RtqYPDBAnn-D; Sat, 16 Nov 2024 11:33:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Xr9Fm5fYzz9sST;
	Sat, 16 Nov 2024 11:33:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A84AA8B7A0;
	Sat, 16 Nov 2024 11:33:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Ln_6XnRxJZel; Sat, 16 Nov 2024 11:33:00 +0100 (CET)
Received: from [192.168.232.159] (POS169858.IDSI0.si.c-s.fr [192.168.232.159])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3ED8D8B763;
	Sat, 16 Nov 2024 11:33:00 +0100 (CET)
Message-ID: <3f9dbb7b-6527-48e1-9028-b46e5a0c58ce@csgroup.eu>
Date: Sat, 16 Nov 2024 11:33:00 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: fsl-mc: Remove deadcode
To: linux@treblig.org, ioana.ciornei@nxp.com, stuyoder@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241115152055.279732-1-linux@treblig.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241115152055.279732-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 15/11/2024 à 16:20, linux@treblig.org a écrit :
> [Vous ne recevez pas souvent de courriers de linux@treblig.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> fsl_mc_allocator_driver_exit() was added explicitly by
> commit 1e8ac83b6caf ("bus: fsl-mc: add fsl_mc_allocator cleanup function")
> but was never used.
> 
> Remove it.
> 
> fsl_mc_portal_reset() was added in 2015 by
> commit 197f4d6a4a00 ("staging: fsl-mc: fsl-mc object allocator driver")
> but was never used.
> 
> Remove it.
> 
> fsl_mc_portal_reset() was the only caller of dpmcp_reset().
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/bus/fsl-mc/dpmcp.c            | 22 ----------------------
>   drivers/bus/fsl-mc/fsl-mc-allocator.c |  5 -----
>   drivers/bus/fsl-mc/fsl-mc-private.h   |  6 ------
>   drivers/bus/fsl-mc/mc-io.c            | 20 --------------------
>   include/linux/fsl/mc.h                |  2 --
>   5 files changed, 55 deletions(-)
> 
> diff --git a/drivers/bus/fsl-mc/dpmcp.c b/drivers/bus/fsl-mc/dpmcp.c
> index 5fbd0dbde24a..7816c0a728ef 100644
> --- a/drivers/bus/fsl-mc/dpmcp.c
> +++ b/drivers/bus/fsl-mc/dpmcp.c
> @@ -75,25 +75,3 @@ int dpmcp_close(struct fsl_mc_io *mc_io,
>          /* send command to mc*/
>          return mc_send_command(mc_io, &cmd);
>   }
> -
> -/**
> - * dpmcp_reset() - Reset the DPMCP, returns the object to initial state.
> - * @mc_io:     Pointer to MC portal's I/O object
> - * @cmd_flags: Command flags; one or more of 'MC_CMD_FLAG_'
> - * @token:     Token of DPMCP object
> - *
> - * Return:     '0' on Success; Error code otherwise.
> - */
> -int dpmcp_reset(struct fsl_mc_io *mc_io,
> -               u32 cmd_flags,
> -               u16 token)
> -{
> -       struct fsl_mc_command cmd = { 0 };
> -
> -       /* prepare command */
> -       cmd.header = mc_encode_cmd_header(DPMCP_CMDID_RESET,
> -                                         cmd_flags, token);
> -
> -       /* send command to mc*/
> -       return mc_send_command(mc_io, &cmd);
> -}
> diff --git a/drivers/bus/fsl-mc/fsl-mc-allocator.c b/drivers/bus/fsl-mc/fsl-mc-allocator.c
> index b5e8c021fa1f..6c3beb82dd1b 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-allocator.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-allocator.c
> @@ -656,8 +656,3 @@ int __init fsl_mc_allocator_driver_init(void)
>   {
>          return fsl_mc_driver_register(&fsl_mc_allocator_driver);
>   }
> -
> -void fsl_mc_allocator_driver_exit(void)
> -{
> -       fsl_mc_driver_unregister(&fsl_mc_allocator_driver);
> -}
> diff --git a/drivers/bus/fsl-mc/fsl-mc-private.h b/drivers/bus/fsl-mc/fsl-mc-private.h
> index b3520ea1b9f4..e1b7ec3ed1a7 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-private.h
> +++ b/drivers/bus/fsl-mc/fsl-mc-private.h
> @@ -66,10 +66,6 @@ int dpmcp_close(struct fsl_mc_io *mc_io,
>                  u32 cmd_flags,
>                  u16 token);
> 
> -int dpmcp_reset(struct fsl_mc_io *mc_io,
> -               u32 cmd_flags,
> -               u16 token);
> -
>   /*
>    * Data Path Resource Container (DPRC) API
>    */
> @@ -631,8 +627,6 @@ int dprc_scan_objects(struct fsl_mc_device *mc_bus_dev,
> 
>   int __init fsl_mc_allocator_driver_init(void);
> 
> -void fsl_mc_allocator_driver_exit(void);
> -
>   void fsl_mc_init_all_resource_pools(struct fsl_mc_device *mc_bus_dev);
> 
>   void fsl_mc_cleanup_all_resource_pools(struct fsl_mc_device *mc_bus_dev);
> diff --git a/drivers/bus/fsl-mc/mc-io.c b/drivers/bus/fsl-mc/mc-io.c
> index 95b10a6cf307..a0ad7866cbfc 100644
> --- a/drivers/bus/fsl-mc/mc-io.c
> +++ b/drivers/bus/fsl-mc/mc-io.c
> @@ -263,23 +263,3 @@ void fsl_mc_portal_free(struct fsl_mc_io *mc_io)
>          dpmcp_dev->consumer_link = NULL;
>   }
>   EXPORT_SYMBOL_GPL(fsl_mc_portal_free);
> -
> -/**
> - * fsl_mc_portal_reset - Resets the dpmcp object for a given fsl_mc_io object
> - *
> - * @mc_io: Pointer to the fsl_mc_io object that wraps the MC portal to free
> - */
> -int fsl_mc_portal_reset(struct fsl_mc_io *mc_io)
> -{
> -       int error;
> -       struct fsl_mc_device *dpmcp_dev = mc_io->dpmcp_dev;
> -
> -       error = dpmcp_reset(mc_io, 0, dpmcp_dev->mc_handle);
> -       if (error < 0) {
> -               dev_err(&dpmcp_dev->dev, "dpmcp_reset() failed: %d\n", error);
> -               return error;
> -       }
> -
> -       return 0;
> -}
> -EXPORT_SYMBOL_GPL(fsl_mc_portal_reset);
> diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
> index c90ec889bfc2..37316a58d2ed 100644
> --- a/include/linux/fsl/mc.h
> +++ b/include/linux/fsl/mc.h
> @@ -417,8 +417,6 @@ int __must_check fsl_mc_portal_allocate(struct fsl_mc_device *mc_dev,
> 
>   void fsl_mc_portal_free(struct fsl_mc_io *mc_io);
> 
> -int fsl_mc_portal_reset(struct fsl_mc_io *mc_io);
> -
>   int __must_check fsl_mc_object_allocate(struct fsl_mc_device *mc_dev,
>                                          enum fsl_mc_pool_type pool_type,
>                                          struct fsl_mc_device **new_mc_adev);
> --
> 2.47.0
> 

