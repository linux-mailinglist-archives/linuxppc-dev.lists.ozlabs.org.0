Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA09F8A60
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 09:19:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C0ym5CdbzF3Hw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 19:19:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="BX3IR55p"; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C0wT0SDNzF5FK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 19:17:26 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id e9so16685642ljp.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 00:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1UOrfE7eL3IqcRqo+GTUG4MyEyzZRkxeXy7A5k+rq7w=;
 b=BX3IR55pLCl6cXu5ECToHFRRet9jbkK5ccrkybPqkm9HryzEg+Vk1y587h9AeXIVNl
 hfxfeum8529o7h1XtQJZ0VtiGv4f4AjFzSyvTRbO8RczB2sYykTB2nw3/elVxka7pA/v
 BghNo/TL0TazYty8NYdFLKhrCgy/i7EqozlAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1UOrfE7eL3IqcRqo+GTUG4MyEyzZRkxeXy7A5k+rq7w=;
 b=Ln7C+YnvsReY0dZVSHK/FvQ0Hp6j+IstqAJlyFNMrS3rIn12nQ/i9Z0tyPUPyzzvPK
 6QIXKhUFDGFsqSWHNuQy9SWpvbsC2x2Higzkm/2QNi21oBfauMM3hnaYodSTiUKCWoIM
 J1p0vKRGlG4mNQdKknMcSBNgINs0mqZeBI2aqO033TLP8FVwYdNTRM3s157tyG8/BGdQ
 azCxC/yCA/kMMjTNjobm2wGrJHs0G+R1Kb/tzTp4/qQI7tmenIy8YRZ/ryh8xfWjfpOc
 JwP3h+BOiD/hjljvfuAAGUoi3xjToJxLmCRFjm+Wrq6JD8qXhReZGRz229j8ogGKbbPO
 /sZQ==
X-Gm-Message-State: APjAAAUHitzH7tgMsUJSl9pohGBzP7gQsxpXSHKuMgiHZ90gef+WPtJi
 atdK0sA318fv15gxzaFeIb6jAw==
X-Google-Smtp-Source: APXvYqwnzpW96b39jBou0jnSlL/HS7I564u3+KsUO4+qOnY1pdOoDbEAhAuUMgbbOG4MEk38oTo25g==
X-Received: by 2002:a2e:8518:: with SMTP id j24mr8331198lji.13.1573546643476; 
 Tue, 12 Nov 2019 00:17:23 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id a22sm7966566ljn.58.2019.11.12.00.17.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Nov 2019 00:17:22 -0800 (PST)
Subject: Re: [PATCH v4 34/47] soc: fsl: qe: change return type of
 cpm_muram_alloc() to s32
To: Qiang Zhao <qiang.zhao@nxp.com>, Leo Li <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-35-linux@rasmusvillemoes.dk>
 <VE1PR04MB6768D483426A2B6CC04E069D91770@VE1PR04MB6768.eurprd04.prod.outlook.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <75efc4ce-c6da-92c4-e3a5-5e37311b0f33@rasmusvillemoes.dk>
Date: Tue, 12 Nov 2019 09:17:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB6768D483426A2B6CC04E069D91770@VE1PR04MB6768.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=gbk
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
Cc: Scott Wood <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/11/2019 09.01, Qiang Zhao wrote:
> On Fri, Nov 8, 2019 at 21:01 Rasmus Villemoes <linux@rasmusvillemoes.dk> wrote:
> 
>> -unsigned long cpm_muram_alloc_fixed(unsigned long offset, unsigned long
>> size)
>> +s32 cpm_muram_alloc_fixed(unsigned long offset, unsigned long size)
>>  {
>> -	unsigned long start;
>> +	long start;
>>  	unsigned long flags;
>>  	struct genpool_data_fixed muram_pool_data_fixed;
>  
> "start" should be s32 here too?

Yes, of course. Good catch.

Rasmus
