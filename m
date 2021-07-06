Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 718243BD73F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 14:54:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GK2Z22rc3z3f1S
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 22:54:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TwRJy6+J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534;
 helo=mail-ed1-x534.google.com; envelope-from=luzmaximilian@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TwRJy6+J; dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GK0zR1bDBz2yxX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 21:42:42 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id m1so27575933edq.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jul 2021 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CDGtQ2yb8IShQ7cIRYFiJmp1Uu5BANeA/6Jg/xILJy0=;
 b=TwRJy6+J3urIn/EOHkX70XQHrPpIXFIOoiquz6eJSwyU/SQIQ4dADKORnRQAYcVLDd
 bGmCH+O3vZ/zwAN03+xnrlCOWn/T/Pz6KfPYlHzOgGXWb72eEAEAjVLMxY3sV52LOQiu
 4sMepvP8f2M/NuGTEEUpcS9djTSXyNUocbOOHuCxDZ/swc4Yj2krBjOK18+xBOWwYw7y
 O/LcWjnu0kdZ4pmyv7jFfFo0qSdeTOdmtP2CciCXwcdnQ5FYkYueWY1vZLSQqxLbXVdx
 xHWyXJmiVDLrlTvE9QGQSNArUJUGdY04ySHX3mfxNurDFI1sFLhNw1IKyh/ZzycJEC6f
 piBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CDGtQ2yb8IShQ7cIRYFiJmp1Uu5BANeA/6Jg/xILJy0=;
 b=FjbCNZ17HLXFpU/ZgN4tl3FIWrrDKKWjXLQPa0JrRs3rGcBTTNFC93Q4PY6ZTKoRTc
 oN9efp8ksGUetCca0BlCNrRUMo/WCHCAcTu1Xpzdrh8re+WE2pe373RI7kaJVfkMun8D
 30lZD4sK3gZ5xll5QXPwIBclyg6mUz3SbQYwWcCaMLgJnBUPdApz8Pwptj7ep34JzREj
 v/e//oM4HOKkqDt0WIAmeGUmBsGJrChdWo9ZhCqEh8+5LmaVxgZL9qbDaVuPMGJE7vtI
 qiHEh/T1UvQu0/1XJbHheUOUPlNR+xN2VG2/B2RUWro891Xy5lvRwXiubgWLcyg6OYct
 rqXQ==
X-Gm-Message-State: AOAM532gk6jwN6195w7qZfeqc7okzB/nz7W5wBAqOtoiOyEQXAXgzB4Q
 RKoHD8WsEN1TrafaSh4GQaY=
X-Google-Smtp-Source: ABdhPJwOR9RYbuFI1V8zYqZEcawlLdGKboqfR9DJ6TrIpurxtzPOHwaABH2lGpOOBvACTZh8ZOEU1A==
X-Received: by 2002:a05:6402:1c06:: with SMTP id
 ck6mr22330893edb.287.1625571755735; 
 Tue, 06 Jul 2021 04:42:35 -0700 (PDT)
Received: from [192.168.2.202] (pd9e5a48a.dip0.t-ipconnect.de.
 [217.229.164.138])
 by smtp.gmail.com with ESMTPSA id eb9sm5646083ejc.32.2021.07.06.04.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 04:42:35 -0700 (PDT)
Subject: Re: [PATCH] bus: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
From: Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <07c08230-6c71-2a73-c89f-05b9b5de78ab@gmail.com>
Date: Tue, 6 Jul 2021 13:42:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 06 Jul 2021 22:48:04 +1000
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 linux-hyperv@vger.kernel.org, Alex Elder <elder@kernel.org>,
 kvm@vger.kernel.org, nvdimm@lists.linux.dev, linux-mmc@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-fpga@vger.kernel.org,
 linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-cxl@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 target-devel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-i3c@lists.infradead.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>,
 Rob Herring <robh@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, linux-scsi@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-staging@lists.linux.dev,
 Dexuan Cui <decui@microsoft.com>, linux-acpi@vger.kernel.org,
 Andy Gross <agross@kernel.org>, industrypack-devel@lists.sourceforge.net,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-mips@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-sunxi@lists.linux.dev, Len Brown <lenb@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-remoteproc@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>, Jiri Kosina <jikos@kernel.org>,
 Johan Hovold <johan@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 xen-devel@lists.xenproject.org, Bjorn Helgaas <bhelgaas@google.com>,
 Mark Gross <mgross@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
 Johannes Thumshirn <morbidrsa@gmail.com>, linux-parisc@vger.kernel.org,
 greybus-dev@lists.linaro.org, Stephen Boyd <sboyd@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-ntb@googlegroups.com, linux-media@vger.kernel.org,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/6/21 11:50 AM, Uwe Kleine-König wrote:
> The driver core ignores the return value of this callback because there
> is only little it can do when a device disappears.
> 
> This is the final bit of a long lasting cleanup quest where several
> buses were converted to also return void from their remove callback.
> Additionally some resource leaks were fixed that were caused by drivers
> returning an error code in the expectation that the driver won't go
> away.
> 
> With struct bus_type::remove returning void it's prevented that newly
> implemented buses return an ignored error code and so don't anticipate
> wrong expectations for driver authors.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

>   drivers/platform/surface/aggregator/bus.c | 4 +---

Acked-by: Maximilian Luz <luzmaximilian@gmail.com>
