Return-Path: <linuxppc-dev+bounces-12526-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB02B92C33
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 21:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVtHV3Zdsz2yxN;
	Tue, 23 Sep 2025 05:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758568838;
	cv=none; b=U8Gfmc7sSHb7Duk5z3MNaCFT1J+l1JPKEObhO+6IbZTyPPvlPukl9iWdWX1EvvbwjKZoSZtFL+ABjkWIQHYdABEw+54s+D4oYHakPr7SPv/mWOFx88VqLCng1/Tqb5mWozoUrEQ6y1iQQUnsQpMarq/UWN1Upum1VQHSEyyRJUE/2gyp8rjCBSUVYzFWI6V4GGxmyosmxzpos1bWfTWxSNiNjGI5yHovXaUmmJcZ/ruZ2sMT19tp9ncSEAnsQKCQiU7BFO5Xv3iDLraTywM6j9Xdcn+5dia5oo12Cn1F2/i4DlGYfWs544tnBmxogR6QyABZiGPZoemoJ9q7ayJVuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758568838; c=relaxed/relaxed;
	bh=3/c0zL5CtyedjX9xlkdHNzhrCuYLjzP3fiy9CkFYxNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UlsuoauqMYw5jWdqrgx1hxd6CKTO1Cy3Ijuxg2Mie6MaO+2dI/Db2MB09gWENJq5+MXCxzuKq5a+nbn+Y2q/zQlvM0eGtJkmjj+MGo/caGwvQE/qoKSFsqN1iX/a4aHWhaRUcI2VQoPOgqDEBS6KQbUf3PMFd2aYuyV74M6VEgt2a/ZU2iT8n13cKOKRzitZzCrOvzGrLYS/TVh91IJZZYrOoioeD7VibGjLLDrlaW3qIk1U3cwiPzuisPPTu//y+wBF8LAnbV4MaJzydvG4HlC/35NI02cM9vxUIIstJFgvMTE5wDOWj07JabI859tW2dr0m70uSdtOiZpxHFSbOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVtHT4K3qz2xnt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 05:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cVmSt6JfJz9sSs;
	Mon, 22 Sep 2025 16:58:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KnfmKuq3WAna; Mon, 22 Sep 2025 16:58:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cVmSt5ZMnz9sSr;
	Mon, 22 Sep 2025 16:58:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ACC408B768;
	Mon, 22 Sep 2025 16:58:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id AJ0qCR0yksLS; Mon, 22 Sep 2025 16:58:22 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A2CC8B763;
	Mon, 22 Sep 2025 16:58:22 +0200 (CEST)
Message-ID: <617e83e9-c9ad-45d1-bc5a-eba2ecd7965f@csgroup.eu>
Date: Mon, 22 Sep 2025 16:58:21 +0200
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
Subject: Re: [PATCH v2] bus: fsl-mc: Replace snprintf and sprintf with
 sysfs_emit in sysfs show functions
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>, ioana.ciornei@nxp.com
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250822124339.1739290-1-chelsyratnawat2001@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250822124339.1739290-1-chelsyratnawat2001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/08/2025 à 14:43, Chelsy Ratnawat a écrit :
> [Vous ne recevez pas souvent de courriers de chelsyratnawat2001@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Use sysfs_emit() instead of snprintf()/sprintf()  when writing
> to sysfs buffers, as recommended by the kernel documentation.
> 
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
> ---
> Changes in v2:
>   - replace sprintf() with sysfs_emit() in modalias_show()
>   - change commit msg to include the change for sprintf
> 
>   drivers/bus/fsl-mc/fsl-mc-bus.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> index c1c0a4759c7e..88fea34a55b9 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -176,8 +176,8 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
>   {
>          struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
> 
> -       return sprintf(buf, "fsl-mc:v%08Xd%s\n", mc_dev->obj_desc.vendor,
> -                      mc_dev->obj_desc.type);
> +       return sysfs_emit(buf, "fsl-mc:v%08Xd%s\n", mc_dev->obj_desc.vendor,
> +                       mc_dev->obj_desc.type);
>   }
>   static DEVICE_ATTR_RO(modalias);
> 
> @@ -203,7 +203,7 @@ static ssize_t driver_override_show(struct device *dev,
>   {
>          struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
> 
> -       return snprintf(buf, PAGE_SIZE, "%s\n", mc_dev->driver_override);
> +       return sysfs_emit(buf, "%s\n", mc_dev->driver_override);
>   }
>   static DEVICE_ATTR_RW(driver_override);
> 
> --
> 2.47.3
> 
> 

Applied, thanks!

Christophe

