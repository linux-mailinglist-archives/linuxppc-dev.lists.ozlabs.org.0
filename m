Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0C33402EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 11:12:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1NBN0fkxz3bw5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 21:12:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=h+XOb1Gs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=sergei.shtylyov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=h+XOb1Gs; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1N9x13j3z2xdL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 21:12:20 +1100 (AEDT)
Received: by mail-lf1-x12d.google.com with SMTP id m12so3652213lfq.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 03:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fj+8CF0xEa6bOzXqxjtIYrEA5HoToR1DJW5/Q9q9jmw=;
 b=h+XOb1GsQ2w8fLoRZPzFbHuKl4PLZbrg1n3NNXlB+1pwKaDpv3IYeBwNMYTnaAe/dv
 53qY2HQRgJloO7YPpYoaazxwB0LyW9cda/3XqephYo6XWuKffw2EvNS/BeW8bu2CjhLn
 YWTP2x1H0eEBDgDtwckTaScppt8aK7lt+V3njf7QJpXzuiT7grarbWs5GRfMMbxHi5hx
 sbbCxsAJNuzngqg7yz9ZWUT+6eIJtzHyMp4aZtClTbLq39j781dflkTtZN7C5T1u2Nwq
 xymOipVtMZt0XepUbRaIZljM2iUOt+cNzBqUcJW9l5gvLHs6joBPpTbT1tLMNxHlVuyX
 KLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fj+8CF0xEa6bOzXqxjtIYrEA5HoToR1DJW5/Q9q9jmw=;
 b=sSmmkJDjdGx3+N86aKoLOb4IzTqvJFt6hceSb5L6Am0CP76AfXFCBvsgE0xos5bSqg
 nE11ugeDSmocpMoSCLKGabwnZWdEB8Jpv9l+8W54TX+ti2Ilf0SsHmjQzNOw+4QD7DTg
 2c7RrarVsp+dMB4APcGunM5JiflsFKSAd7lok4mbjLMdDa8OAd0DOASVv3l5/edadI75
 Toj4RKHRxNjEpvJBMH9e1ZAf9QldEF9KeksiVw4RB4oQz4t/FxFSpoIdjfnSUjPBjS/v
 bBJK73e4E1WLJIU66I35c9jF9/S9sB0A+Zv4erAiEUzSDOUwAwcJav0iAdzzOekfQ3GY
 I0fA==
X-Gm-Message-State: AOAM532AGcniYFdJ8/AaQbyoGH45d65PZkL717OKe0ke6nKIJLAX0pg4
 5mxE7SnMjLK07LxbcDtfkfgVTSmWpcc06Q==
X-Google-Smtp-Source: ABdhPJw0WKNmAy7eGUCvhofce6ngmswkk73bpXDn/HaCVJQto32NE95sJGLkJZuXS7ucQeT6WnUpaw==
X-Received: by 2002:a05:6512:238c:: with SMTP id
 c12mr69712lfv.200.1616062337968; 
 Thu, 18 Mar 2021 03:12:17 -0700 (PDT)
Received: from [192.168.1.101] ([178.176.78.3])
 by smtp.gmail.com with ESMTPSA id p22sm168167lfh.113.2021.03.18.03.12.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 03:12:17 -0700 (PDT)
Subject: Re: [PATCH 08/10] MIPS: disable CONFIG_IDE in malta*_defconfig
To: Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>,
 Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-9-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <5b0f503e-a27c-a241-c705-b2a9ccd6d0a2@gmail.com>
Date: Thu, 18 Mar 2021 13:12:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318045706.200458-9-hch@lst.de>
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

On 3/18/21 7:57 AM, Christoph Hellwig wrote:

> Various malta defconfigs enable CONFIG_IDE for the tc86c001 ide driver,
> hich is a Toshiba plug in card that does not make much sense to use on
  ^ which is for

> bigsur platforms.  For all other ATA cards libata support is already
  ^ Malta.

> enabled.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei
