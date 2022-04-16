Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1F05037FE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 21:38:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kgk5M3HMtz3bmW
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Apr 2022 05:38:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lEOMeVgS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lEOMeVgS; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kgk4g4BpMz2yWN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Apr 2022 05:37:53 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 i24-20020a17090adc1800b001cd5529465aso9553682pjv.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 12:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bBrIvj2RbZjYdFWgGo9Q0KH8nivE4RSBLo6+AjhmX8c=;
 b=lEOMeVgS1UMAn/xAIx5tnzWJc4+4PBnVnbIGYnQgj/K7x1Xjyp0bC5S4rQX/eJ5XJ+
 Uvn4OHwJ93BV1qqJQ8Lz8Dh5SMvYbToBLlkhbRBgK8+8NJHX95bahxE8bIyrfhPfTOmB
 zyHMM6yt3Pc4IVFjxuzz0Zus9NOynBqBsxuzSkzBUVJ8d2KcICxb5bsLxJfdh9ArULCH
 DBWP0uXEP/didfNU/U9Mf6Cl0qPKeQnU6ukgCF3Xqk388QOUUIf8BLF1eyJLxPeXVZDA
 4n4v4zJ7TEb5faKVZN/sBliY0tZGS+DMd9VhpsfLOYIHRRZbOy2e1qKh5A00PUzLphHZ
 kKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bBrIvj2RbZjYdFWgGo9Q0KH8nivE4RSBLo6+AjhmX8c=;
 b=FS1wYzgPmrylYoF2dyHZNkwMn0ZjnwKM4dPOB0+4ccXZnXd4hdXreocDcNQHeNkpfw
 aXxbTTAPG86k1Jw7P74GvoGVBRDIlkUov2mPImALOa28Zu1CB2EdWxezmqKsDhg/MFZj
 86OUgKtceCwZ+Rzhh+nt76YaLNg2Zu4M+Pe4GCL3DtmNFJRcdkoe4UvMu43U5linv+fB
 FcFxRbCFu2cVZ0ypZIbDS9k6qkGj2WNgyQ+kocFMJH0/hrM88KzpSRP6PpGVhbmHdaaN
 Erq2S8on7OZgNYBoIsElshVpxgSaER1dKwUNvGehp6o0F6I4GovHt7jfLlwDDqcOCjwT
 4Qfg==
X-Gm-Message-State: AOAM533c5WvDcV1GdxYc9ObXzIZXg00U+uphNbF66XRv3RgENUPLH1Bu
 gVOuAFMvWgveqg5CbKlWoKo=
X-Google-Smtp-Source: ABdhPJytoSNnjDeE+7hBXKTSMpgdN3zwp9Rbobt1H/fmiDJUw3gNnLwtvKzHRCcSY93HciTZejk2EQ==
X-Received: by 2002:a17:902:8c96:b0:158:9135:98d3 with SMTP id
 t22-20020a1709028c9600b00158913598d3mr4509598plo.171.1650137869043; 
 Sat, 16 Apr 2022 12:37:49 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a63b54a000000b00380ea901cd2sm8056884pgo.6.2022.04.16.12.37.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Apr 2022 12:37:48 -0700 (PDT)
Message-ID: <bec03048-d15a-d934-ab88-0f6a5cb2ab0f@gmail.com>
Date: Sat, 16 Apr 2022 12:37:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH net-next v4 07/18] net: dsa: Replace usage of found with
 dedicated list iterator variable
Content-Language: en-US
To: Jakob Koschel <jakobkoschel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
References: <20220415122947.2754662-1-jakobkoschel@gmail.com>
 <20220415122947.2754662-8-jakobkoschel@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220415122947.2754662-8-jakobkoschel@gmail.com>
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
 Yonghong Song <yhs@fb.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
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

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
