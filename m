Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 961C5503809
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 21:39:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kgk6l3cDdz3c83
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Apr 2022 05:39:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FFOQGdsS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FFOQGdsS; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kgk5Y5wT0z3bZ4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Apr 2022 05:38:41 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id t12so9536777pll.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 12:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1Od2+V3Bj00Er4Mva8kO5nsmL4Z8o4xlw5ojaMLjb+w=;
 b=FFOQGdsSjPmsDdXIlaewKQ8ZFhhoraD8wn0k1G/X2hv94hq9geZz81UYFVS4QYEjw2
 btSOypwjHN5ovugpJYXXuzgZu9we+zRymba667F54uMiM4CMybbNf4RHA5IWRYHtsNMT
 F5YBX+bTf6CoSIKm+3JVthY0Cchzo9cOliLZ01HWHYAX59s02cO9El5NZakqvkNABfSn
 lkszACXmfnj9J5YZIp6tae1eh1D8pLBHppOwp9JcmCIjSyQ0HwlBy5N6bdR0Mtnpxj54
 XAv9mbIWjOYBnR9di3tXENZ1YPh5wbAYUNUVVx8cvR74hs4VGWCyH9sxSPQ2MZF+HxoH
 XcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Od2+V3Bj00Er4Mva8kO5nsmL4Z8o4xlw5ojaMLjb+w=;
 b=f+IxRb1YOm+XDfz1/R7bcC08XACEvQNp/5Jl+mbswy8M5YPrNnamIJy8OCg90QXWUu
 KHkv1yLomi+M9jsKUHgwpcRhL7DwiHTDEdG4yRSCQBiwvg4TTPspjVk6yQT8marpDxGy
 q54XKIOyL8qFtXtmKsTsSdgir5A2aU8ZLsY7GJZXwLZFqn0RjfLlAN8Oa5DNouY4RgLr
 XLD1RStu3NSY29Anr+f1XV3wmxunbgyhITem4WyAbSVPmfxyoYeYfmoJ7+T7eI/GBoxP
 TgW4FYcXyTv8YfcdCX1MNw5+na+bCPsb5cmsS63AckkWVNjAqlKLi2uUZTR0kaLTGIUo
 2vCw==
X-Gm-Message-State: AOAM5331a+9djWdm3IGdSIpKV7c01bVsbQTt8gY66PTLqFWhpwU37ZGI
 NDPtO7+wZul8R515JMzCpYI=
X-Google-Smtp-Source: ABdhPJy7mlYg2xknqTc8SqONg+1saF9q0f2T6nu61MenY84/BMYT2pB1OyS1ut0gOcOlm4Mvl8AMzg==
X-Received: by 2002:a17:902:ccd0:b0:156:7ac2:5600 with SMTP id
 z16-20020a170902ccd000b001567ac25600mr4631387ple.156.1650137919166; 
 Sat, 16 Apr 2022 12:38:39 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 g15-20020aa7818f000000b00505ce2e4640sm6678733pfi.100.2022.04.16.12.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Apr 2022 12:38:38 -0700 (PDT)
Message-ID: <64a9fc32-0288-d142-f35b-0f688a0a6659@gmail.com>
Date: Sat, 16 Apr 2022 12:38:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH net-next v4 06/18] net: dsa: mv88e6xxx: refactor
 mv88e6xxx_port_vlan()
Content-Language: en-US
To: Jakob Koschel <jakobkoschel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
References: <20220415122947.2754662-1-jakobkoschel@gmail.com>
 <20220415122947.2754662-7-jakobkoschel@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220415122947.2754662-7-jakobkoschel@gmail.com>
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
> To avoid bugs and speculative execution exploits due to type-confused
> pointers at the end of a list_for_each_entry() loop, one measure is to
> restrict code to not use the iterator variable outside the loop block.
> 
> In the case of mv88e6xxx_port_vlan(), this isn't a problem, as we never
> let the loops exit through "natural causes" anyway, by using a "found"
> variable and then using the last "dp" iterator prior to the break, which
> is a safe thing to do.
> 
> Nonetheless, with the expected new syntax, this pattern will no longer
> be possible.
> 
> Profit off of the occasion and break the two port finding methods into
> smaller sub-functions. Somehow, returning a copy of the iterator pointer
> is still accepted.
> 
> This change makes it redundant to have a "bool found", since the "dp"
> from mv88e6xxx_port_vlan() now holds NULL if we haven't found what we
> were looking for.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
