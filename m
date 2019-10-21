Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A5FDFC44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 05:45:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xzt40q72zDqL5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 14:45:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pensando.io (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=snelson@pensando.io;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=pensando.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=pensando.io header.i=@pensando.io header.b="ZvioHrwP"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xj0y01FmzDqxW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 03:35:09 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id 23so8132516pgk.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 09:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pensando.io; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YQ2SYzDjclp6+UMcXfMKe/dCfkknHxuiGOrHRSVn0cA=;
 b=ZvioHrwPqgA32sqk/ZfXl+AIKFsddUO2tNAqbJtu4tCcRANhGvReU9J0qCrPtBX4dr
 XyEFxDF3rI4Skd8uu+tW37bMnIbIfeVll6YP9QPsiv1m3u9UI7Hz50C/EOmQGDDvJxjt
 MNnpf3ALOQX+wn100d4q49rWpqL/dLYkEvAbPydL+TGXqu4wUlet2YAblmsMtkne7qnv
 mFnrVk537e3SRZLOSIfp5DZTMcRh1T3I7huUyEOh7iplVBe4IuwO1byLK+LTz8AIzALW
 g8HnTvBYEWL7IAty6Tx+yooX0qDMEelsrde2cgdpkGApf9pCWxxWG6Loqrv6o3ZIrYoi
 o0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YQ2SYzDjclp6+UMcXfMKe/dCfkknHxuiGOrHRSVn0cA=;
 b=telZR7xOf2+SCk2GlQhOTe1OsyVvAfpwgjbf1Lyr+gp5xqfYFMrFR39XmQPYgicLVA
 gdHczBAnkSxU/XoV1w/3EEpK5v56/PH8/NTcpXtRlABVmWYxm6c04+kbZnM67yxksxrK
 rkTuaXnaKZZIWGCzu81n5aeLBV1UOwmc5NoUDpyRu4KZLQ+40cINknxAf6NdaYKEBlT9
 w/7BUmaj0vz+zTGIOXmGh2Dfjk4AmAh59+lF6OVC73iOhLwlRzU6zO63Wso7RxsXINvo
 n13b/aqjw+jVscoYbtVKKdEhcd9tjgpVf8Aud3ezHLptluZFjP60E4bwMoFWodvHgszB
 miKg==
X-Gm-Message-State: APjAAAWcfgX4vApJ1r4YmF5zDw+7BZgkPZVWXL+QOcoZQrBaGYyV289k
 bchCe4jSLHE+QuQ78ur7Tq70Qg==
X-Google-Smtp-Source: APXvYqwmyNu50+FxrTO6V6IulFup1S67xnT8cj+dbepaT4niD1qSPIKhFvBy+c/p26nJk53uezcFig==
X-Received: by 2002:a63:ad0d:: with SMTP id g13mr26250877pgf.407.1571675706632; 
 Mon, 21 Oct 2019 09:35:06 -0700 (PDT)
Received: from Shannons-MacBook-Pro.local
 (static-50-53-47-17.bvtn.or.frontiernet.net. [50.53.47.17])
 by smtp.gmail.com with ESMTPSA id e4sm16610297pff.22.2019.10.21.09.35.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Oct 2019 09:35:05 -0700 (PDT)
Subject: Re: [PATCH 5/5] ionic: Use debugfs_create_bool() to export bool
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Breno_Leit=c3=a3o?= <leitao@debian.org>,
 Nayna Jain <nayna@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David@rox.of.borg, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Casey Leedom <leedom@chelsio.com>,
 Pensando Drivers <drivers@pensando.io>, Kevin Hilman <khilman@kernel.org>,
 Nishanth Menon <nm@ti.com>
References: <20191021145149.31657-1-geert+renesas@glider.be>
 <20191021145149.31657-6-geert+renesas@glider.be>
From: Shannon Nelson <snelson@pensando.io>
Message-ID: <aeebbd5f-6100-2780-ef1c-6b1c261c9d23@pensando.io>
Date: Mon, 21 Oct 2019 09:35:03 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021145149.31657-6-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Tue, 22 Oct 2019 14:43:41 +1100
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
Cc: amd-gfx@lists.freedesktop.org, linux-pm@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/21/19 7:51 AM, Geert Uytterhoeven wrote:
> Currently bool ionic_cq.done_color is exported using
> debugfs_create_u8(), which requires a cast, preventing further compiler
> checks.
>
> Fix this by switching to debugfs_create_bool(), and dropping the cast.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Shannon Nelson <snelson@pensando.io>

> ---
>   drivers/net/ethernet/pensando/ionic/ionic_debugfs.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_debugfs.c b/drivers/net/ethernet/pensando/ionic/ionic_debugfs.c
> index bc03cecf80cc9eb4..5beba915f69d12dd 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_debugfs.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_debugfs.c
> @@ -170,8 +170,7 @@ void ionic_debugfs_add_qcq(struct ionic_lif *lif, struct ionic_qcq *qcq)
>   	debugfs_create_x64("base_pa", 0400, cq_dentry, &cq->base_pa);
>   	debugfs_create_u32("num_descs", 0400, cq_dentry, &cq->num_descs);
>   	debugfs_create_u32("desc_size", 0400, cq_dentry, &cq->desc_size);
> -	debugfs_create_u8("done_color", 0400, cq_dentry,
> -			  (u8 *)&cq->done_color);
> +	debugfs_create_bool("done_color", 0400, cq_dentry, &cq->done_color);
>   
>   	debugfs_create_file("tail", 0400, cq_dentry, cq, &cq_tail_fops);
>   

