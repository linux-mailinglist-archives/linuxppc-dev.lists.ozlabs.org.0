Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BAA770980
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 22:10:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kqn43uMb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHcKJ1RL1z3cV1
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 06:10:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kqn43uMb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=shuah@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHcJC73nWz3cJR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 06:09:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1130561C5A;
	Fri,  4 Aug 2023 20:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034F0C433C8;
	Fri,  4 Aug 2023 20:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691179782;
	bh=B2WuureFKU4I4xfTCbSBZR9mqJTud6pi2bRQFifphDw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=kqn43uMbZAfMxrn7e8fIZPk5RgwbAk16KtR8zZSNXUY854tfARcR5Vt+YTLxTiRIp
	 TlTl6v6hA7FWxjzteE4hblNlI55yYS0WsMgCXV3oZ1phyiedYVrZ9J4BB0IZj0BW9V
	 Wi74XeC7ewpAaRm11P0Tdii5NBQIpc3x67Coq9hfkNwFPBeuQzYUH79sjLqLaKaqRv
	 1rOEa67Pdx1l/V5P68oohlc4IHs/SuhUfMz/O6iyNJ9nRqgfmHPQoZrsIPwbxGwfRI
	 +1CHNiY1cFFbTQRm/F1q/UcxvqTl7+HJwQ9qmBHxQHh0lQRS9tqJkb/p48Dbx3TDVM
	 LFwt92qRHL+HQ==
Message-ID: <18553400-87e5-831f-322b-57b2e93244a7@kernel.org>
Date: Fri, 4 Aug 2023 14:09:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next 5/5] USB: usbip: Remove an unnecessary NULL value
Content-Language: en-US
To: Ruan Jinjie <ruanjinjie@huawei.com>, peter.chen@kernel.org,
 gregkh@linuxfoundation.org, leoyang.li@nxp.com, b-liu@ti.com,
 valentina.manea.m@gmail.com, i@zenithal.me, stern@rowland.harvard.edu,
 u.kleine-koenig@pengutronix.de, aaro.koskinen@iki.fi, void0red@gmail.com,
 linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Shuah Khan <skhan@linuxfoundation.org>, shuah <shuah@kernel.org>
References: <20230804093253.91647-1-ruanjinjie@huawei.com>
 <20230804093253.91647-6-ruanjinjie@huawei.com>
From: shuah <shuah@kernel.org>
In-Reply-To: <20230804093253.91647-6-ruanjinjie@huawei.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/4/23 03:32, Ruan Jinjie wrote:
> The NULL initialization of the pointers assigned by kzalloc() first is
> not necessary, because if the kzalloc() failed, the pointers will be
> assigned NULL, otherwise it works as usual. so remove it.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>   drivers/usb/usbip/vudc_dev.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/usbip/vudc_dev.c b/drivers/usb/usbip/vudc_dev.c
> index 2bc428f2e261..8e42839e6060 100644
> --- a/drivers/usb/usbip/vudc_dev.c
> +++ b/drivers/usb/usbip/vudc_dev.c
> @@ -489,7 +489,7 @@ static void vudc_device_unusable(struct usbip_device *ud)
>   
>   struct vudc_device *alloc_vudc_device(int devid)
>   {
> -	struct vudc_device *udc_dev = NULL;
> +	struct vudc_device *udc_dev;
>   
>   	udc_dev = kzalloc(sizeof(*udc_dev), GFP_KERNEL);
>   	if (!udc_dev)

In addition to this, make a change to return NULL instead
of going to out.

if (!udc_dev)
                 goto out;

thanks,
-- Shuah

