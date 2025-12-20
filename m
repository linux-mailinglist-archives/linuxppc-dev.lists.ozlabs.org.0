Return-Path: <linuxppc-dev+bounces-14917-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ACFCD2D75
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Dec 2025 11:45:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dYLdq3bvfz2yFQ;
	Sat, 20 Dec 2025 21:45:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766227519;
	cv=none; b=ZvNQHiK3gI690hfQGZB3tyYCqW0drv4H3ucveJh2B21nLGW6XSelhR+Z5fAmG9hcYp8PUlYXNh0vZtUbFEWrPQHeX0ech4acSJd1rKmQRwJMOI15waXNjHEqScPWQ+M6ZMn0ysCsyfP9zHH/qb+GdA59QPPG4j+VW3KoCpTv3zrH7T/BsEZ2tYMzKrwLNDX1NXLx/3sVqo28dbElgcjtW/BQH9D9lF3PiAOqTVBc8SzmyIKiUl8jGN6ljtoeT7mWrvPXbq0BUZ5pb5btYATP1GFA3Zt9pl8uKLbm/bMr32viwUC0dW0TB6tbNqbpVGD7iRyYDGr81WAphWC2VTLzVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766227519; c=relaxed/relaxed;
	bh=dDVJ1lNXe5miYeb7Pa/YktQaMCfraxS4pds/E6jFn8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jfhHeP+uoJ8SliCUEBOc1p+4A5wVhtCnHI/gDWMLJmJbdXzUTPTLa3kVn13k5eSw6c++FLhnhacw8Oofru6TJr/R2b4KVsWcPmKw7DHmqWExeBwg8UNEO27BBAGDE8h4nPKea9zY/WtpE2wqKDKQMO5MaeLsbBJ+YKpfNI/TVv5/h9Zf7LA7I949Z288TQeLwnp23Hef1adX5CmxQ1UKs/sMAReTVi21/myCgTdSmQTca9OOr3q4BH3x1ppmy6ug/Zdo/1kuAQ8yGzKUg/TLFWP05eV2OZ9yQTP5IteJb3/LmosWFlnpL4z48OPEtpCE1E5Ve7Ca7FsGAm/4AFa5mQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bRB0hHm4; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bRB0hHm4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dYLdp1mxlz2xlF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Dec 2025 21:45:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 456854067B;
	Sat, 20 Dec 2025 10:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0BDC4CEF5;
	Sat, 20 Dec 2025 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766227514;
	bh=V5P5vXWLkKnry4xZROdXvmrEOjVqCHKY6ocQB130z6o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bRB0hHm4nUD2k0rwJVhjtIgZd3iS4PLr4Rw8rW4AJNs1BKldZkf1PKdePJEY+10Sc
	 38oKr67givnzWArEIxU29dHrHuwhOzMwa+UxE3AIPTnidDfP44t/Yp3msEWXb/xzOu
	 G6Fpn28pjGMsvuO6yOSWSMtxWr4I59kJStCPyqNJxjgvAuuBxIHv0jCnWakKWt1Ybi
	 912GbWJKweARZSrRNXHCrmjydzrIIqeYtTJchNfYF4boarfyUwbZJLSCwP3hQBPOTK
	 bsmsWCWyJj08XFDM2yt/hHwPWhqXVufXvayHjEm6hkGdxLN5GspkhqCYGJ9I1gfHDX
	 +TJI5mvws5yvA==
Message-ID: <b371cc50-4b3d-4b0c-8948-6af78baac041@kernel.org>
Date: Sat, 20 Dec 2025 11:45:10 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/fsl_rio: fix a improper release in
 fsl_rio_setup()
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, mporter@kernel.crashing.org,
 alex.bou9@gmail.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20251219141033.632153-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251219141033.632153-1-lihaoxiang@isrc.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 19/12/2025 à 15:10, Haoxiang Li a écrit :
> [Vous ne recevez pas souvent de courriers de lihaoxiang@isrc.iscas.ac.cn. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> If rio_register_mport() fails, put_device() is the correct way
> to drop the device reference.
> To prevent a double free, remove put_device() in rio_register_mport()
> Also, add a put_device() in tsi721_setup_mport() to prevent reference
> leak.

Your explanation is unclear. It is correct that put_device() is the 
correct way to drop the device reference, and it is already what 
rio_register_mport() does. Why do you need to move it out of 
rio_register_mport() ? This is what you have to explain.

> 
> Found by code review.

AI code review or human code review ?

> 
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
>   arch/powerpc/sysdev/fsl_rio.c    | 2 +-
>   drivers/rapidio/devices/tsi721.c | 1 +
>   drivers/rapidio/rio.c            | 1 -
>   3 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
> index f9b214b299e7..f6226b2619ed 100644
> --- a/arch/powerpc/sysdev/fsl_rio.c
> +++ b/arch/powerpc/sysdev/fsl_rio.c
> @@ -697,7 +697,7 @@ static int fsl_rio_setup(struct platform_device *dev)
>                  if (rio_register_mport(port)) {
>                          release_resource(&port->iores);
>                          kfree(priv);
> -                       kfree(port);

Why do you remove this kfree() ? By doing this you will leak the port 
pointer allocated earlier in the loop by kzalloc()

> +                       put_device(&port->dev);
>                          continue;
>                  }
>                  active_ports++;
> diff --git a/drivers/rapidio/devices/tsi721.c b/drivers/rapidio/devices/tsi721.c
> index 4b84270a8906..17c2bcf29c5c 100644
> --- a/drivers/rapidio/devices/tsi721.c
> +++ b/drivers/rapidio/devices/tsi721.c
> @@ -2758,6 +2758,7 @@ static int tsi721_setup_mport(struct tsi721_device *priv)
>          err = rio_register_mport(mport);
>          if (err) {
>                  tsi721_unregister_dma(priv);
> +               put_device(&mport->dev);
>                  goto err_exit;
>          }
> 
> diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
> index 46daf32ea13b..026b2328afd7 100644
> --- a/drivers/rapidio/rio.c
> +++ b/drivers/rapidio/rio.c
> @@ -2089,7 +2089,6 @@ int rio_register_mport(struct rio_mport *port)
>                  mutex_lock(&rio_mport_list_lock);
>                  list_del(&port->node);
>                  mutex_unlock(&rio_mport_list_lock);
> -               put_device(&port->dev);
>          } else {
>                  dev_dbg(&port->dev, "RIO: registered mport%d\n", port->id);
>          }
> --
> 2.25.1
> 


