Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC15502D7D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 18:05:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kg1Q946Kdz3bpH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 02:05:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=q1bzqzL3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b;
 helo=mail-ej1-x62b.google.com; envelope-from=olteanv@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=q1bzqzL3; dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kg1PT6cz3z2xDN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 02:04:59 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id k23so16071311ejd.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 09:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=112dwm8QpeyoKYHzXDlM/vsE5hIZxIAtes3nuwV/SSo=;
 b=q1bzqzL3lBdyltYHc9DTIT5JLPdLODWLZph8x8M5S6Lrx38YGPco66753ypyqSZHdS
 TsBVCJ5EpLAbAmZd7rn35rz5+5MFo5cmcPhwTg2EsuyzzljP5OF0i5quSN5Bq79dJupT
 XxChUcD2MsVarL7yLizfAjcN3B0NTqgueTBK61H9jo+fIJq2L7zfnVfyEtuLdKfBrIhL
 iDzvx73Aqc0XvRiY1AXXQbSKFoZMT0Gp0iczLfr/jN0opuxhWCDc6rZaQadXhtc1zVzT
 V6fOjszCUEV1CJPEyDoo3WVMYNJOQYRIdd2ngW2MNMxLobrauU5wyg1fn/2XkaL6GqdW
 ZQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=112dwm8QpeyoKYHzXDlM/vsE5hIZxIAtes3nuwV/SSo=;
 b=3q/fcmqEgS7oPE+XNTQcuWT7A8U5QSTcSLBPZHjlQ/g+q2kQ31iqyJe1aHhWt5zIAm
 B+KOx1TXFggVPjRU6Gz4YaTK4cg5m0few3b9lg3d45Z02MPQlVaZ8pqdQ4t9+VCk0iMU
 n5nLIfCJ3+XkZJWXo09e6IKHe6rac9sZyZa8WjpqTmSHxsaGoyaNJ8wADkh9arVJAd4O
 MHbSiSmOs7mnEvNrzZIr4jedRxuAawT2zHiX2546FqRiorHniPwzDTGmsclInyjmKbSg
 CpHeyV/QQMJ0F18uVIWenw6z0P7q1baFNkrX8Kmr6YM8rZ7/3DCJ6/3TpsnKeBv20p0J
 Oxtg==
X-Gm-Message-State: AOAM531bZoRn+BTkbor66eFNgeBS7azVN0IkuMLGLdcYnL21X4qsehbV
 aEy+GICbjYL83Nxc8EQs9KM=
X-Google-Smtp-Source: ABdhPJw48aM/ILhX7ieEo4E/2JT/l4q8QZCfn54tMQSw+A5qviAhPCWJlSaz9aHJH2xpZA3vw595cw==
X-Received: by 2002:a17:907:6e88:b0:6da:8f01:7a8f with SMTP id
 sh8-20020a1709076e8800b006da8f017a8fmr6648623ejc.619.1650038696267; 
 Fri, 15 Apr 2022 09:04:56 -0700 (PDT)
Received: from skbuf ([188.26.57.45]) by smtp.gmail.com with ESMTPSA id
 r18-20020a05640251d200b0041d1600ab09sm3036190edd.54.2022.04.15.09.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 09:04:55 -0700 (PDT)
Date: Fri, 15 Apr 2022 19:04:52 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH net-next v4 07/18] net: dsa: Replace usage of found with
 dedicated list iterator variable
Message-ID: <20220415160452.z4m4j3sulcteqggs@skbuf>
References: <20220415122947.2754662-1-jakobkoschel@gmail.com>
 <20220415122947.2754662-8-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220415122947.2754662-8-jakobkoschel@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, Ariel Elior <aelior@marvell.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "Bos, H.J." <h.j.bos@vu.nl>, linux-arm-kernel@lists.infradead.org,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakub Kicinski <kuba@kernel.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Yonghong Song <yhs@fb.com>,
 Edward Cree <ecree.xilinx@gmail.com>,
 Casper Andersson <casper.casan@gmail.com>, Xu Wang <vulab@iscas.ac.cn>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, bpf@vger.kernel.org,
 Colin Ian King <colin.king@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 15, 2022 at 02:29:36PM +0200, Jakob Koschel wrote:
> To move the list iterator variable into the list_for_each_entry_*()
> macro in the future it should be avoided to use the list iterator
> variable after the loop body.
> 
> To *never* use the list iterator variable after the loop it was
> concluded to use a separate iterator variable instead of a
> found boolean [1].
> 
> This removes the need to use a found variable and simply checking if
> the variable was set, can determine if the break/goto was hit.
> 
> Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---

I absolutely hate the robotic commit message, but the change looks like
it works, so:

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

>  net/dsa/dsa.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/net/dsa/dsa.c b/net/dsa/dsa.c
> index 89c6c86e746f..645522c4dd4a 100644
> --- a/net/dsa/dsa.c
> +++ b/net/dsa/dsa.c
> @@ -112,22 +112,21 @@ const struct dsa_device_ops *dsa_find_tagger_by_name(const char *buf)
>  
>  const struct dsa_device_ops *dsa_tag_driver_get(int tag_protocol)
>  {
> -	struct dsa_tag_driver *dsa_tag_driver;
> +	struct dsa_tag_driver *dsa_tag_driver = NULL, *iter;
>  	const struct dsa_device_ops *ops;
> -	bool found = false;
>  
>  	request_module("%s%d", DSA_TAG_DRIVER_ALIAS, tag_protocol);
>  
>  	mutex_lock(&dsa_tag_drivers_lock);
> -	list_for_each_entry(dsa_tag_driver, &dsa_tag_drivers_list, list) {
> -		ops = dsa_tag_driver->ops;
> +	list_for_each_entry(iter, &dsa_tag_drivers_list, list) {
> +		ops = iter->ops;
>  		if (ops->proto == tag_protocol) {
> -			found = true;
> +			dsa_tag_driver = iter;
>  			break;
>  		}
>  	}
>  
> -	if (found) {
> +	if (dsa_tag_driver) {
>  		if (!try_module_get(dsa_tag_driver->owner))
>  			ops = ERR_PTR(-ENOPROTOOPT);
>  	} else {
> -- 
> 2.25.1
> 
