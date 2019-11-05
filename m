Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E970AF09C6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 23:47:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4774Yw2j8czF59p
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 09:47:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="G5KV+1mr"; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4774XD2GsSzF4qM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 09:46:16 +1100 (AEDT)
Received: by mail-wm1-x342.google.com with SMTP id t26so1168141wmi.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Nov 2019 14:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7xwWVXiuG1tLPN6CPka9ylUlJIP2hCJ9RzlJKfzF5/I=;
 b=G5KV+1mriyllS9vliRA/FB2eSB8+Y1pVuDH+yOGI9/dlU6p4f0CEBcf1v3g2sqUVJJ
 2ZuBQ9rKXI0+Unyi+pLfp6ghnwr3XOeicCMuKJ0jFCjXXJlMRdxRxf3s3fKZcJdPdWWN
 oeQTWKOv+Pi/dicJidS5o5yDQuS2gidH2b8t8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7xwWVXiuG1tLPN6CPka9ylUlJIP2hCJ9RzlJKfzF5/I=;
 b=sIRpnjOGpqCVHEjpLNzZ3nWIVzPjKLpe38mA8g7lI2zMCrxVFo/tutcbgoWzju4VD0
 fcMAEuWCHdxGkecvlNmMzzRSyZ6yudNoHMGU8UWIXKF1bkpGS2Zq4OTbWW3ICiLW5raL
 YmJClOQFa4NzWP5e2AQOCxIE63u5xD4dQVgCHsHwPuNWaCYWFsRKQDYIzwLZksZNV4RW
 TBZP4g49PVpfG06/6XCCasrzrhNMucWy5QuPppoXjvc14T0+NvDtINyWeCax9hD+jH+k
 EBiqHfGQ+AXb56/kIjnF/J1KrgiTr9VdFo74g8ig4aDtwXmHBRWuKAjyB4nMj7PPiTOt
 R7gg==
X-Gm-Message-State: APjAAAXkj4kEG96JclZVdDfiEnSR4eX7Sa8Wt3OHpL8g/Wh8ZorkfhsL
 cmj2tv+pzeQNj1hH9l/2l3DCKA==
X-Google-Smtp-Source: APXvYqyILKyWyx8z/N+HI9ObpIe8L/xuTBO+aWfJYAW3owIrX4/P2lrMpGLQn5+ocDXByWt/4qGYzg==
X-Received: by 2002:a7b:c7c7:: with SMTP id z7mr1055811wmk.85.1572993971089;
 Tue, 05 Nov 2019 14:46:11 -0800 (PST)
Received: from [192.168.1.149] (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id i3sm22220902wrw.69.2019.11.05.14.46.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Nov 2019 14:46:10 -0800 (PST)
Subject: Re: [PATCH v3 35/36] net/wan: make FSL_UCC_HDLC explicitly depend on
 PPC32
To: Li Yang <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-36-linux@rasmusvillemoes.dk>
 <4e2ac670-2bf4-fb47-2130-c0120bcf0111@c-s.fr>
 <VE1PR04MB6687D4620E32176BDC120DBA8F620@VE1PR04MB6687.eurprd04.prod.outlook.com>
 <24ea27b6-adea-cc74-f480-b68de163f531@rasmusvillemoes.dk>
 <CADRPPNQ4dq1pnvNU71vNEgk1V5ovrT9O2=UMJxG45=ZSRdJ4ig@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <f48df0c7-77f1-268f-8588-7eff5e9fd7c5@rasmusvillemoes.dk>
Date: Tue, 5 Nov 2019 23:46:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADRPPNQ4dq1pnvNU71vNEgk1V5ovrT9O2=UMJxG45=ZSRdJ4ig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/11/2019 21.56, Li Yang wrote:

>> No, this patch cannot be dropped. Please see the kbuild complaints for
>> v2,23/23 about use of IS_ERR_VALUE on not-sizeof(long) entities. I see
>> kbuild has complained about the same thing for v3 since apparently the
>> same thing appears in ucc_slow.c. So I'll fix that.
> 
> When I made this comment I didn't notice you have removed all the
> architectural dependencies for CONFIG_QUICC_ENGINE.  If the
> QUICC_ENGINE is only buidable on powerpc, arm and arm64, this change
> will not be needed.
> 
> BTW, I'm not sure if it is a good idea to make it selectable on these
> unrelavent architectures.  Real architectural dependencies and
> COMPILE_TEST dependency will be better if we really want to test the
> buildability on other platforms.

Well, making QUICC_ENGINE depend on PPC32 || ARM would certainly make
things easier for me. Once you include ARM64 or any other 64 bit
architecture the buildbot complaints start rolling in from the
IS_ERR_VALUEs. And ARM64 should be supported as well, so there really
isn't much difference between dropping all arch restrictions and listing
the relevant archs in the Kconfig dependencies.

Rasmus


