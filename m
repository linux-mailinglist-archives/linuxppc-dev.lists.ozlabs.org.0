Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E093402BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 11:09:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1N6d2N1kz3bxH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 21:09:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=N+Q0LUNo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=sergei.shtylyov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N+Q0LUNo; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1N6B5Dsyz2yRg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 21:09:05 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id o10so3625754lfb.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 03:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jMxhISu+COlRrHc/EVrqMnT5LVw2161ovhdA7IBtSGw=;
 b=N+Q0LUNoyVaDPJ1eJrZ67FhUa77q/Fz02On4l9bg9QACSIgykCKqUmFdsf53Ojgnbf
 eyumUdx/TwjbtDOLgwCYAB7RDOtR57TMCBeyNSAY//ay7Tl2lccP2Ssym94kRXjxfYRe
 lulL4E/vgpp41CghUdWNrhQunOsNpbRkQh1Z5uA9cr4OPAdKTqKspV2wEkOPVcm1LmJR
 yZKXoXYlgW/Aj82akuKLiTGE5Fox66wxjP6rcBsCJbwoniHR5/N5xRjjkVjAEfQdY1MW
 wabHvQrtRlGBXU/oemiBE0fxxY0J0doyEwDn/K3ybrpVrl7lPm8K8TOwVCHW7Z8VfYJf
 AzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jMxhISu+COlRrHc/EVrqMnT5LVw2161ovhdA7IBtSGw=;
 b=FhRFmTHWTTIwKwHZUm3GTv2Dc3vtoMqkxKmQPp6oFKyJ25SnKHVZ26FZQy6spuxwjC
 Nd8v91h7L9zRpY0Lx7v8JF4L6Bxf+y5Ch1lTWeB2lpJJaHX55m6g8Ueg7vul458DrGoG
 zlx5AlO2+2VtfNNZDhKh4Da4aCkYrBAFva/fk/BwCTlrDnyYRj60jyct7LnupBbyRTRU
 iOr+Lp4wA6hqW1zx0ivTgUQlZ5WWQoEnM0boep8UrB/9JLIRoIVz9m/R7bXFi2gy3w0b
 wuEr0DNomzT4HTdIwpDYmSjJYUf9POyefSk9AbN4s/4dVNJ2qV2HU0beFmgL2zbgVxsR
 cHIA==
X-Gm-Message-State: AOAM530mc7fj3xjkicSd6xxkC5B60II2ZSfkYhqTUNzaP0QI1hS2Y2FT
 bb8qolzD0yS8TqlE3gQGH/MbC1/ldozx6Q==
X-Google-Smtp-Source: ABdhPJx2/i763YoZT8agJf/e8IcPTQBDi5fhHCqQUnQpQ0jOlOdRn9E3L+UaYKsqgqqx/61KeZhUWQ==
X-Received: by 2002:a05:6512:32ab:: with SMTP id
 q11mr4934722lfe.106.1616062140994; 
 Thu, 18 Mar 2021 03:09:00 -0700 (PDT)
Received: from [192.168.1.101] ([178.176.78.3])
 by smtp.gmail.com with ESMTPSA id z21sm173661ljh.104.2021.03.18.03.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 03:09:00 -0700 (PDT)
Subject: Re: [PATCH 07/10] MIPS: disable CONFIG_IDE in bigsur_defconfig
To: Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>,
 Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-8-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <53035511-c140-b51a-dd1d-874b1041039a@gmail.com>
Date: Thu, 18 Mar 2021 13:08:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318045706.200458-8-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On 3/18/21 7:57 AM, Christoph Hellwig wrote:

> bigsur_defconfig enables CONFIG_IDE for the tc86c001 ide driver, which
> is a Toshiba plug in card that does not make much sense to use on bigsur
    ^ for

   Else that doesn't make much sense. :-)

> platforms.  For all other ATA cards libata support is already enabled.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
