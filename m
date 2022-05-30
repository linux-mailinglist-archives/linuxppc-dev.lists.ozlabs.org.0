Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7707537445
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 May 2022 07:27:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LBP6g53nqz3bhf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 May 2022 15:27:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=mI4wZWAz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.165; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=mI4wZWAz;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LBP615Jz5z2yLg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 May 2022 15:26:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1653888378;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=5A0kRRxHfEc7Fxt0H50pX6bx3RpoDsMSH7BzXZpO2Ac=;
    b=mI4wZWAzg+Xllia9lkw60Z3Yqaln5TD+Jj+oPvjw4JajrN1aWwIraOMWUX/Qwir+zN
    7xBAUKnqJepXDFls3QFhQEurV6077hVnLt77bx7vqHOHDRhdAwN4EuYUeDZHJ6aGdqCe
    JV+gS9gSuVPYUITfNdL4HD6Et3nNklemq0YVPjHN1EeGxLmlm4kq2aVM/YaY9MRrELiY
    N5NuWMtLMozw+7As52vokO1BNzLnhUkyW9Xg3PjCRwxNDj92keFzT8VCgdvDCE567T22
    uznKwq1+deR+hM48Axy7YqZGO7OI2i5JVh3yG7aYdRBSBm8rKycb4LQE3RDCokqx4et4
    HbQQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwiH4V6fojV0dIN6I1TxxPKaB/gU2A=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:b803:54e0:138e:6901]
    by smtp.strato.de (RZmta 47.45.0 AUTH)
    with ESMTPSA id 205ca1y4U5QGjFr
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 30 May 2022 07:26:16 +0200 (CEST)
Message-ID: <83ff7361-d54c-ac39-9ccb-0926c3a3d8e2@xenosoft.de>
Date: Mon, 30 May 2022 07:26:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [FSL P50x0] Keyboard and mouse don't work anymore after the
 devicetree updates for 5.19
Content-Language: de-DE
To: Rob Herring <robh@kernel.org>
References: <283c811b-27f7-64a8-8a67-11cf6c3a79cf@xenosoft.de>
 <2e1b72bd-ae44-19d1-5981-09f5c69759dc@csgroup.eu>
 <OSZPR01MB7019C5EC6E5CF5230600B283AAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <8a2aa8a5-55b3-93e9-7428-867311f568e2@xenosoft.de>
 <OSZPR01MB7019313DCB5A79F91BE6D91CAAD89@OSZPR01MB7019.jpnprd01.prod.outlook.com>
 <9e8dd323-4a36-abb2-568d-fe1384b1579c@xenosoft.de>
 <CAL_JsqLN6bT=YhyRTVWU2WmG-htCujtCROQuK+gdMUHMSHVeaQ@mail.gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <CAL_JsqLN6bT=YhyRTVWU2WmG-htCujtCROQuK+gdMUHMSHVeaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Darren Stevens <darren@stevens-zone.net>, mad skateman <madskateman@gmail.com>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27 May 2022 at 04:23 pm, Rob Herring wrote:
> The issue is in drivers/usb/host/fsl-mph-dr-of.c which copies the
> resources to a child platform device. Can you try the following
> change:
>
> diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
> index 44a7e58a26e3..47d9b7be60da 100644
> --- a/drivers/usb/host/fsl-mph-dr-of.c
> +++ b/drivers/usb/host/fsl-mph-dr-of.c
> @@ -80,8 +80,6 @@ static struct platform_device *fsl_usb2_device_register(
>                                          const char *name, int id)
>   {
>          struct platform_device *pdev;
> -       const struct resource *res = ofdev->resource;
> -       unsigned int num = ofdev->num_resources;
>          int retval;
>
>          pdev = platform_device_alloc(name, id);
> @@ -106,11 +104,7 @@ static struct platform_device *fsl_usb2_device_register(
>          if (retval)
>                  goto error;
>
> -       if (num) {
> -               retval = platform_device_add_resources(pdev, res, num);
> -               if (retval)
> -                       goto error;
> -       }
> +       pdev->dev.of_node = ofdev->dev.of_node;
>
>          retval = platform_device_add(pdev);
>          if (retval)
Hello Rob,

Thanks a lot for your patch! Unfortunately, this leads to a boot loop. 
Do you have another idea?

Thanks,
Christian
