Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3D81A44B0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 11:48:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zCrT2m2tzDrP3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 19:48:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cogentembedded.com (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com;
 envelope-from=sergei.shtylyov@cogentembedded.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=cogentembedded.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=cogentembedded-com.20150623.gappssmtp.com
 header.i=@cogentembedded-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=0VEEMUSX; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zCpq4myCzDrB9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 19:47:14 +1000 (AEST)
Received: by mail-lf1-x143.google.com with SMTP id h6so997617lfc.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ixWyit/BPi4Ka4deLVPgn2JfqAzulpluWjNuC7xycq0=;
 b=0VEEMUSXUIZzs5iYhN0FjOM3beqogpopP5rDDncQ9uEaoy9IhQCJpSjbS/XcuVqDNn
 U4gUQkn5snZ9ZQ951zs+i+EwryOye3aC64VlDiiQi91q54yOP4gLGuYywdugT/hJpCIp
 C9a//G0v6owmNFn1orp3IT+/Lk3iCxeR/d8bvRnRtTgW+gGXHLUE8BuVyv2tZXgKVDO0
 AdUUecxb5LHlNX8BwTIYJBdEBA6UF8fRgSiyky5Dp/ppC5ILPbCQdykVBXwRQ684kNIp
 rsKAmvl92WXQL/jppPC/wRaply/yTd2ovdgP+9ZA8v8YQubFLxfk2BJx24xnib5XMnwn
 3m9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ixWyit/BPi4Ka4deLVPgn2JfqAzulpluWjNuC7xycq0=;
 b=KIkz+frnkmQtleMR2uprhMr3nivO5J/WtswnF5P8/x6iA99tm6Ot6GvQz0WaPARdaP
 lote7Fuvz6Wqo5uZPpZQOVw/Oxs2qCjRk0+b8z77fhK2UstalLoLXuWKEpc+VWRVV/Zc
 e9I5Sdx01/ofNsrjnsrY73/L8evvWk9qjhwOdwZOx2qcjjkQtSGTlNQV1m4JE/ZHB61m
 R392NI0Jhf66xfbn00UxbcAt71XVmCxEKxoFonrN0ck8Vs6FQI2JzmrfkkUSYpqp73r3
 P8Mdm3JWjy0OlQ6rGmrzDw9pdxyIL31rygqY566vjigVsym8EffztDXYjRMYlm/id3RG
 +J8g==
X-Gm-Message-State: AGi0PuYph6l4aR25NnG6O3s4ibnS+O3g7HlnZc5iayZHLv747DA3ejXL
 7BBtzFFG0NCL7pp7n1BKVe9Qmg==
X-Google-Smtp-Source: APiQypKlvy1p+ulGm7rmqXh0dNWrbd9j3xSh46zFxUDGl1I0qpueqnZ7JooiYzM/K+nLb3U/hKGRBQ==
X-Received: by 2002:ac2:498d:: with SMTP id f13mr2157743lfl.75.1586512032084; 
 Fri, 10 Apr 2020 02:47:12 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:449c:a024:b8e5:a34a:c38e:b427?
 ([2a00:1fa0:449c:a024:b8e5:a34a:c38e:b427])
 by smtp.gmail.com with ESMTPSA id o6sm794019lji.15.2020.04.10.02.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2020 02:47:11 -0700 (PDT)
Subject: Re: [PATCH] usb: gadget: fsl: Fix a wrong judgment in fsl_udc_probe()
To: Tang Bin <tangbin@cmss.chinamobile.com>, leoyang.li@nxp.com,
 balbi@kernel.org, gregkh@linuxfoundation.org
References: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <02aeae70-60b8-761c-b058-8b4bc78ffd99@cogentembedded.com>
Date: Fri, 10 Apr 2020 12:47:01 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Markus.Elfring@web.de, linux-usb@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10.04.2020 4:58, Tang Bin wrote:

> If the function "platform_get_irq()" failed, the negative value
> returned will not be detected here, including "-EPROBE_DEFER", which
> causes the application to fail to get the correct error message.
> Thus it must be fixed.

    platform_get_irq() prints an appropriate error message, the problem is that
the current code calls request_irq() with error code instead of IRQ.

> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
[...]

MBR, Sergei
