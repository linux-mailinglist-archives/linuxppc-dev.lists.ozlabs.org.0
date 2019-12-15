Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4804111F78C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 12:59:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bNHQ61ftzDqG0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 22:59:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.67; helo=mail-ed1-f67.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47bNFH6ZbhzDq5t
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Dec 2019 22:57:34 +1100 (AEDT)
Received: by mail-ed1-f67.google.com with SMTP id cm12so2717540edb.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Dec 2019 03:57:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3bFRjA9UFM72dx5MZDZ0tLg6rOZz8LMmXjc51eyWHQw=;
 b=REwVdZSfoybJnRiG0TbYA09Fa0Nj45uTjzKm390wI4h0ixmFj/nxBd829wIRkHRGIv
 Y/QqKE8QczKY/vY8z7kKVuelEZbJIhPw0luvi03LANnaZAhHIUpxROnl7N8S9y5W6FVy
 CIm3ipxxJcvpJWvgH9IuGRlPXP9hjeJfsHUStr4kpRHj90ZFP4Q/qJvHmUNPvZfDjRvP
 +LGZdiR6eTvBPAx1ea3GQN5h9YYUcFSJiYfhPG9OcDYTeyzIB/ajqbs1Ps0nUWjwxJFy
 xXec/1MQwPztZL9Ib1Bk0qenIC/59J0QI6NiiyR9NdLGZjMQV5UEYJAeLJ5sWAa1wOHD
 S7rA==
X-Gm-Message-State: APjAAAWOBj+IhegleWCYiBq0tql6XL91LgpNLEAl6sOym2zKaodmfMfS
 9Hico2O5JlTuMynZO7TdGBs=
X-Google-Smtp-Source: APXvYqwZaqP3BPfUD1WWLgwtYw1XJJ7Zy4zkrjF1M4qRiNjNshTKEWnoyc7zscsZ5R0wuEWiJvnvIw==
X-Received: by 2002:aa7:d306:: with SMTP id p6mr26042390edq.72.1576411050586; 
 Sun, 15 Dec 2019 03:57:30 -0800 (PST)
Received: from kozik-lap ([194.230.155.234])
 by smtp.googlemail.com with ESMTPSA id l18sm663825edw.59.2019.12.15.03.57.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Dec 2019 03:57:29 -0800 (PST)
Date: Sun, 15 Dec 2019 12:57:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 02/10] soc: samsung: convert to
 devm_platform_ioremap_resource
Message-ID: <20191215115727.GB30973@kozik-lap>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
 <20191214175447.25482-2-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191214175447.25482-2-tiny.windzz@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 khilman@baylibre.com, linux-arm-msm@vger.kernel.org, ssantosh@kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, leoyang.li@nxp.com, linux-samsung-soc@vger.kernel.org,
 wens@csie.org, agross@kernel.org, khalasa@piap.pl, kgene@kernel.org,
 john@phrozen.org, matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org,
 jun.nie@linaro.org, bjorn.andersson@linaro.org, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Dec 14, 2019 at 05:54:39PM +0000, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/soc/samsung/exynos-pmu.c | 4 +---

Thanks, applied.

Best regards,
Krzysztof

