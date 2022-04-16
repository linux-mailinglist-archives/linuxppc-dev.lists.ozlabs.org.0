Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C84E9503802
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 21:39:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kgk6253pzz3bpQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Apr 2022 05:39:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Pbrr9ivX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Pbrr9ivX; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kgk544S83z3bcX
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Apr 2022 05:38:16 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 2so10071131pjw.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 12:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mHBrU/6FS1PWEDbIq/XDCf3uhBAcZz4F8hxO2TMTiLI=;
 b=Pbrr9ivXtMgzgh6tAg+nn9bID05dXTfcaIe8ate3Wi8Ohs8t6EglfN2njyWlhjpTul
 tR1mINyTEbBvGPAhMgoSR1rQ4UPnlalDTu2iAw/L/tiSzzl7fdAIr6Ugqvo8ss6hD/dN
 UVJg69EABO+7PeFq4gKg21BZx3XELRHZSWcNQxJ/clehrKZCTOPln+2ntLmYORnGAqk+
 7z1X/i+gqjxIWPnenKvU7Hw4tOY/PXkSz0bb6LGJYDF+8QPHHUPQpAV8pBKDufq+9olJ
 hWtXkC0r0x0GPXCJ/l48JpaMEsFQoEwh0G4j/OD1VJdc562oeWatSqpIcm8HnRfH00Ot
 mY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mHBrU/6FS1PWEDbIq/XDCf3uhBAcZz4F8hxO2TMTiLI=;
 b=uWzczaiMlOUxPGOdF2q5YYYWoC6bf+Hz9zwRHnYMlzcCbqrw50l1VxKQj/nvzt7VsQ
 ijcxFGFLvjQz+fUOGgYZUo6FPilDWbtUr0Jm80mrkX0e8bGFc8xowdgbW4XLtK4eYr5+
 m0t9OUrq2zUm1t/d1VFpdjlJCVXLq681g6/R7iky3+XXmyyiNyBGBQl9Imvn61RmPEvf
 BBoZjK5h1ox5oMK6CpmpdwkR4oEmmFAOiCXjBcH6l+EF+Xh/z/2XK8R0RuhabJjNbFD2
 SrmevU6eBWmzus8BLkeXre+P9FHI2wPVAAy0QeP7AfAQIiIgSn/nYQlCB7OpXty5ghnp
 X4DQ==
X-Gm-Message-State: AOAM53158EEtU6AzSyAovqyfNiOPa7ht4ZYNT8EKG12LDVEerMmyD1nD
 L7FeJPEYNqEtRa28fQeMNSI=
X-Google-Smtp-Source: ABdhPJwi0GT93WoZvWRnoJUYJPO0y7rxwdlEN9w4ihHyQC85Vlwb9bQPRJwhzRGybsPLuPs6G04O4Q==
X-Received: by 2002:a17:902:d511:b0:158:3be2:6637 with SMTP id
 b17-20020a170902d51100b001583be26637mr4462063plg.107.1650137894204; 
 Sat, 16 Apr 2022 12:38:14 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 q12-20020a056a00084c00b0050a4bae6531sm3749099pfk.165.2022.04.16.12.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Apr 2022 12:38:13 -0700 (PDT)
Message-ID: <20e56bff-b456-3301-0594-dac917416a92@gmail.com>
Date: Sat, 16 Apr 2022 12:38:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH net-next v4 05/18] net: dsa: mv88e6xxx: remove redundant
 check in mv88e6xxx_port_vlan()
Content-Language: en-US
To: Jakob Koschel <jakobkoschel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
References: <20220415122947.2754662-1-jakobkoschel@gmail.com>
 <20220415122947.2754662-6-jakobkoschel@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220415122947.2754662-6-jakobkoschel@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, Ariel Elior <aelior@marvell.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "Bos, H.J." <h.j.bos@vu.nl>, linux-arm-kernel@lists.infradead.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, KP Singh <kpsingh@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Edward Cree <ecree.xilinx@gmail.com>,
 Casper Andersson <casper.casan@gmail.com>, Xu Wang <vulab@iscas.ac.cn>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, bpf@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/15/2022 5:29 AM, Jakob Koschel wrote:
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> We know that "dev > dst->last_switch" in the "else" block.
> In other words, that "dev - dst->last_switch" is > 0.
> 
> dsa_port_bridge_num_get(dp) can be 0, but the check
> "if (bridge_num + dst->last_switch != dev) continue", rewritten as
> "if (bridge_num != dev - dst->last_switch) continue", aka
> "if (bridge_num != something which cannot be 0) continue",
> makes it redundant to have the extra "if (!bridge_num) continue" logic,
> since a bridge_num of zero would have been skipped anyway.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
