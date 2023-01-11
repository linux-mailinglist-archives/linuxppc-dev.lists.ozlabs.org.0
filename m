Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4D2665413
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 06:57:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsH5713LYz3fCS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 16:57:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.43; helo=mail-wm1-f43.google.com; envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsH4Z2LkSz2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 16:56:45 +1100 (AEDT)
Received: by mail-wm1-f43.google.com with SMTP id o15so10336664wmr.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 21:56:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nRJzXWIcLGfsAx1uj7LxnnT+lT00vnfCm0VUVZlOxf4=;
        b=mfDfM5BMCJK6GNviotzX8ym8i9XR9PchaEsG2t2bgoOun7dcvcB3XGorJE4N18hcng
         Avyq1F5xG27a0GI9TF0rLXFlA+N6PXwcq8Fp8kL07nSLm1gT+PiJQmlqhnAPg9jkq70S
         Tlawlk/UVbJGSARhtxNsYkAt9k1sNDxodluoXdyYv/xA2VD6sCtfWe1swg3NvcEb0f7Y
         wRRDfuGYBGB8kMqvHkd8AcOUmHf52k5hOll4SK1pVXm8AFH9aV74NKzmGa+/khOVQlUB
         btCpzwnUse+oq/lzUpviI6JB4aoCeg4KXg9HIE/lcIz7lvWhqN6TBJmOduTNkh7k0F3K
         N0rA==
X-Gm-Message-State: AFqh2kpk2eY3i/yRFgWJnT63V3XSHWCBDdX/ffPS34gWhf11UQX12NGe
	/F6fqJjDHv0kQzUHatwfHng=
X-Google-Smtp-Source: AMrXdXuGMiv2BcYICZBUe09GCtW4hRfxWXShZC6GeIunbbzMLdfIj5QG6N/iKwiH0FjjphNqa2+B0A==
X-Received: by 2002:a05:600c:22d4:b0:3cf:82b9:2fe6 with SMTP id 20-20020a05600c22d400b003cf82b92fe6mr61119232wmg.8.1673416601718;
        Tue, 10 Jan 2023 21:56:41 -0800 (PST)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id az28-20020a05600c601c00b003cf57329221sm21419506wmb.14.2023.01.10.21.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 21:56:41 -0800 (PST)
Message-ID: <c10bf347-9f53-bcaf-acc2-d3dd6baa0efb@kernel.org>
Date: Wed, 11 Jan 2023 06:56:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 11/13] tty/serial: Call ->dtr_rts() parameter active
 consistently
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-serial@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=c3=a1lvez?= <siglesias@igalia.com>,
 Rodolfo Giometti <giometti@enneenne.com>, Arnd Bergmann <arnd@arndb.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, David Lin <dtwlin@gmail.com>,
 Alex Elder <elder@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org
References: <20230110120226.14972-1-ilpo.jarvinen@linux.intel.com>
 <20230110120226.14972-12-ilpo.jarvinen@linux.intel.com>
From: Jiri Slaby <jirislaby@kernel.org>
In-Reply-To: <20230110120226.14972-12-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 10. 01. 23, 13:02, Ilpo Järvinen wrote:
> Convert various parameter names for ->dtr_rts() and related functions
> from onoff, on, and raise to active.

Much better.

> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

-- 
js
suse labs

