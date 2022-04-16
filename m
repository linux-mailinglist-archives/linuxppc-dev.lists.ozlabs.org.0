Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F0550380D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 21:40:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kgk7Q2NqCz3cFB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Apr 2022 05:40:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ipkj2w+o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ipkj2w+o; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kgk5z0sc9z3bxh
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Apr 2022 05:39:02 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id o5so10108827pjr.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 12:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=N+DA4t8WHVTUtbydzYgACjP/GeP+iQmNsdDutAJHeuA=;
 b=ipkj2w+o4JXJ3KVPO0DxLQWuqs4OEyi3UxINeXoIACCYu6fi6SkJQHqTkrYwYGprUQ
 eFmI7HinPBK1VOkYjtuvYxcz0o+axmOWFuu05Ikj/TH1PrTl1EbSnsUo0T8FWlF4ucXj
 UIdtITPmr4CiwPguZXFmrLHp1mzUxubJ2PQLWe91Zk2tpcpgQRCgqJsfRW06Go+ljivI
 D6CuHcdtpbXh1GP7kTxAbofHF6QwSBpbAIYYbNPw9ms5N9bglUTEtjE5UD7rXrParXGc
 kZzuK5gHoSIDFJqFGQlftcu7Dut1Gv5ZlsMOVF1z39g57L5NEGalhGUQoG6dehteKE89
 HYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=N+DA4t8WHVTUtbydzYgACjP/GeP+iQmNsdDutAJHeuA=;
 b=CdRIab9lO9QepdWrI1d/xS923iSpiJKPuhsgS8qI/ifMXVbdnVniKRlBjqSeV/f7qK
 9aQAizFjU7H+A75qj42/CMmqZMIOL6ptylUwBrrDx6fdGmtEGvq9RwVSkxV+5Lg2B+2+
 Hyi3zU1enS1REvdMtm/lNJw43/xZtYQf+/C6WSt0+xzFzikpbeYvbCdlrpNcbe9awXsL
 yFjxntSBbcAngbRYx0tQ8l3JeWQf7EzvQrlvMDBpLjfEWv1jLPGoBbxyhjKqml4QkiJm
 2m22VvchIv1vqvwptY5n9jVWlbZ1XJcMWlvrpYv2zIaArh+AH6km/r6KKFDJzpbvsT90
 hQMg==
X-Gm-Message-State: AOAM533eLOPNubOva27B+A1ufugxFLvpWP9k3P+HwmGhvnCECB4f1G+l
 +yAPlZdvTxAYaT9spRM8dMo=
X-Google-Smtp-Source: ABdhPJyeyAQ30+cHYCLhpzgXBLBNZ+Oa9HOuk6mMsnj9uqD+miynqPFri5VlK2WPnuSq25kcoNNBeA==
X-Received: by 2002:a17:903:11c7:b0:154:b936:d1d4 with SMTP id
 q7-20020a17090311c700b00154b936d1d4mr4694779plh.78.1650137940950; 
 Sat, 16 Apr 2022 12:39:00 -0700 (PDT)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm7142471pfc.111.2022.04.16.12.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Apr 2022 12:39:00 -0700 (PDT)
Message-ID: <2c0e1778-4602-67eb-8481-33e29764c84d@gmail.com>
Date: Sat, 16 Apr 2022 12:38:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH net-next v4 04/18] net: dsa: sja1105: use
 list_add_tail(pos) instead of list_add(pos->prev)
Content-Language: en-US
To: Jakob Koschel <jakobkoschel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
References: <20220415122947.2754662-1-jakobkoschel@gmail.com>
 <20220415122947.2754662-5-jakobkoschel@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220415122947.2754662-5-jakobkoschel@gmail.com>
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
> When passed a non-head list element, list_add_tail() actually adds the
> new element to its left, which is what we want. Despite the slightly
> confusing name, use the dedicated function which does the same thing as
> the open-coded list_add(pos->prev).
> 
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
