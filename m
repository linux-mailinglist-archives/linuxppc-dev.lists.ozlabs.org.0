Return-Path: <linuxppc-dev+bounces-11979-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D38E0B50A12
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 03:06:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cM2ZF0CxJz3020;
	Wed, 10 Sep 2025 11:06:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757466372;
	cv=none; b=jA/5SOnQ3nSn+oxRVJ4J4CvHvkpH4+mZa8U9+kihcYNz78yTn03I9Z4kueKfTtftrJzJzOfLbE/jwBT1VHu/1YZi+ks2jztLqLB6zKIZSml7kKc1cqzDxXiLpaio28jUCNoffMCGfOR36rWAVHiESPEAfeXb02ZYLyGCFSHygqpDRWTEFOzkdOwd/A1hrkLZu2Uq1wF0HkZI7JMe5BmdldNR7BqK9Or/KZjm7XzacdEclsVGtNTFabuoHA5BFUa9ofi/zTpFM75dxXQzpkx0BnZb9IxSG8v2Aq01Q4+sxzQ3ijPIhG1VZSq0cnEkkVSf19winFy8565dFsfD5P8QoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757466372; c=relaxed/relaxed;
	bh=PDZwAXLouP084B9hVHdN4iMIIVS5iU06EyLqPH/Ivgo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=fpM4LmFWym6eqXfBBt6F8bKOgL4EoF9vvfJvEeymvRdjDB7I9DqIy8rE1HpuBHp88dOV5cC+4erlZEcH9IxxvTEwgKiWQALZAoZHbPNVvAc3SX4bbwaWwzBjsUdcJL0+XvaP4LlMIT9JR24+Y2UbR//i4xvl3UKcQROA+9wp020vA3fCK+haod+kN5+cWY4sWlgcEicg0YunRf6m9Dqf20bpl+N5eONwBZiG/eXiAfSoEpkp5EhuxRzIR3CXOPLSBmyVG4YYvqTDaeOmCiJk6YL4XMaww/7CPhd/YUt+F8FU/6pHZ0xRTxfHgrbCKVqWKcJ6gKCJSubwHo5HO7WTnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CsPpsWeN; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=rene.herman@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CsPpsWeN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=rene.herman@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cM2ZB2SwKz2yx7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 11:06:08 +1000 (AEST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b04ba58a84fso538884766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Sep 2025 18:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757466365; x=1758071165; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDZwAXLouP084B9hVHdN4iMIIVS5iU06EyLqPH/Ivgo=;
        b=CsPpsWeN8QXcO0Leeaza5+e6ODKuAbhRn5vulB2giwnsJgkZWUL0KhrdjJAw6W0Fp7
         W05ypl52+Sgy6OULjqn7FC31yjwXgHKhoZgH8B7j2odt0N/gdCXv7rbP08Sgq9ocstEa
         89bKx41XDQNEh8zAfmivh6ZmfOKb9MBb4IFg89QWB1WchvaPF138ifxctePnwlP62CG6
         OHBVddbNvqCNfRbxbaBwC6DsPEuEqvPnTK8E1IAFFinXYgcxq0t9LsY3RSJC63geTfeM
         00dMgN/su3q5ROBfWiiPuBHHsW1GalTOBYu1Toqvcg5DOxO19lSk3BjX/WIMsCWK/due
         h0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757466365; x=1758071165;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDZwAXLouP084B9hVHdN4iMIIVS5iU06EyLqPH/Ivgo=;
        b=waGod0KhcN7qFGmGdvtoCPTAJJiP717KyY6oGndHseeVfwM7JFnCDZSYMCqXfJqqNk
         YLJSm6P9WU4VOGPNQ8rHQRkfBfMOaIxfjy3zblh9JLVHU9vFgs25I2PvcQM+B8o2DGM0
         COl2izu0pYeZH0E7St4kdj3TwfXkEAQ83HPtEPh0CsX8zZxZaDmNsU61HI7zeItGq3Yl
         Pc6HyHqJrb9jxVCFF+etUiEmm1ntJHmypL0g45/PEaGH1hjsgd3syP4axV+7CyRddA3i
         K7HUAFEhGo7nym3larWwNNJBEf94lmD0NDnQvGaOvBbyKR4lviiHbQTkkKosUhoKv9LZ
         mGuA==
X-Forwarded-Encrypted: i=1; AJvYcCXzQgTZTocxZ9Dboj4cezHLwONpLyJkp/ke7oOX83rd97uvJwty7s4PnoZfGK4et7GLujYsXtBpVSvIsWk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxxh6YHUgFP8jao59+uNXdkYkQ1tWU4Snc9OJMm9bgsJs4tJJoZ
	K4utOzIUpIvB+70f8gX84zezelwYKjwq3cpspUsmj9yDHz04/WV+JQvD
X-Gm-Gg: ASbGncuAVe7tDE9PoHLr8sHyoNVIw8VNBccPtlnkGtIjhHQBsfoTmibR3WbPVcZ/DzG
	OWnSWafBUhovDnBFllKbKJ6DLvNYqluSmHefzoTF8LAcxiKlZGFrgRTa6KVZmIgXXvIcz+hzJt3
	SMnQmkKYttkmY5mhX9Yyj7zuec3QRFQ362FuJhbR2ljphiuzAmYdDoTzxsR7ZQ4Khp8f44zLw/u
	1WfmsLNsfkV336bvqtk65vqulGe34vauHTeX5lqQzjA9BwR+uA39y6xhBoZ7NkZM3y+CS0u/fXS
	6+XnYIgO25ftieRPczj+thbzO1cArG7rJn7u8hlun2jaZJaEtZx/w59YQMoJfrkj74HtSR4PJ+V
	TKeHAohlXUIIyY5ma6+QyC+Pvom8FiOlpc/Z5Oqxv9eBjuMBEj0PLngkB3e1f0tb9skLYxYs5
X-Google-Smtp-Source: AGHT+IFjBmxeo0iihWNvQGW9XaPHPBKL/NIGGGOL86gq7iDWLkzDSZTSGw6FlnjUE/qdjGTpbeIhew==
X-Received: by 2002:a17:907:72c9:b0:b04:4ba7:4e0d with SMTP id a640c23a62f3a-b04b148a54emr1331824166b.26.1757466364453;
        Tue, 09 Sep 2025 18:06:04 -0700 (PDT)
Received: from [192.168.0.51] (217-62-96-139.cable.dynamic.v4.ziggo.nl. [217.62.96.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07830464f9sm78316966b.9.2025.09.09.18.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 18:06:03 -0700 (PDT)
Message-ID: <bf46e8f6-221a-40c7-9da5-8003397ff113@gmail.com>
Date: Wed, 10 Sep 2025 03:06:01 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: torvalds@linux-foundation.org
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 alexander.sverdlin@gmail.com, andreas@gaisler.com, ankur.a.arora@oracle.com,
 arnd@arndb.de, chester.a.unal@arinc9.com, christophe.leroy@csgroup.eu,
 david@redhat.com, geert+renesas@glider.be, heiko@sntech.de, hpa@zytor.com,
 imx@lists.linux.dev, ira.weiny@intel.com, ksummit@lists.linux.dev,
 l.stach@pengutronix.de, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, lorenzo.stoakes@oracle.com, nm@ti.com,
 richard@nod.at, rppt@kernel.org, sergio.paracuellos@gmail.com,
 surenb@google.com, vbabka@suse.cz, willy@infradead.org
References: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Language: en-US
From: =?UTF-8?Q?Ren=C3=A9_Herman?= <rene.herman@gmail.com>
In-Reply-To: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> Well, while on x86 1GB systems did use highmem, they'd typically not 
> use very much of it.
> 
> IOW, they'd have about 900MB as lowmem (ok, I think it was 896MB to
> be exact), with something like 120MB highmem.
> 
> So they'd either lose a bit of memory, or they'd use the 2G:2G
> split.
Right, 1G-128M of VMALLOC_RESERVE, but they didn't generally use 2G/2G 
but ever since it was introduced late in the 32-bit era VMSPLIT_3G_OPT, 
i.e., PAGE_OFFSET = 0xb0000000, i.e., 3G-256M/1G+256M.

Although at the time the patches died an unceremonious death, 4G/4G 
patches for x86 were also around; I used to be a (conceptual) fan of 
them: it takes quite a number of TLB-flushes to suck more than highmem.

Not one hint of clue if spectre/meltdown is applicable to these systems 
and if so, if they in fact do or should already be suffering through 
those same flushes anyway but maybe it'd be an option to dig those 
patches out of some archive somewhere.

I promise I'll test them on an AMD Duron with 768MB RAM :)

Rene.

