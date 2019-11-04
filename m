Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C08EDEDA03
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 08:40:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4764Th3XrDzF58H
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 18:40:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::244;
 helo=mail-lj1-x244.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="fKyAoSLb"; dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4764Rb1NFwzF4ys
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 18:38:49 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id t5so16437175ljk.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Nov 2019 23:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Skx+IlvEjbz4Ey3Z8Es5BpI/gDpf4xIU9seBvakWE2o=;
 b=fKyAoSLbBB7K6Hwz7WQ1hkLB8UolD91873nvpgYDwu3vHgk9FskSurtOXN9GkL1c/5
 O1QO4r/LPsSNuj4aQkwxPg2auKprW4F4lCLH/I6JsLtqOEwdNwfRS8W2sWECsVQqK6CO
 JdWAYkhmIGvDXKDiJ6rIDpzfpG3P7N4TPq36U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Skx+IlvEjbz4Ey3Z8Es5BpI/gDpf4xIU9seBvakWE2o=;
 b=DDHv5lz15x5KyqZyKFXaHVjPWuzHC8ankLnpccbG7JYcFYJzGFcNyJ8n0UHdFK19AH
 XYFs49pdS4lPKDjy8ATXAPe4w4k+LNU31Zbmqq6zcfzVVPC1m5FPSIdf34h+rTT+dStP
 UVxMYpGrii1609Ty03EpjoNPyO8EOt6u7QXfdg+LaPUGPWeveK3eNFDIeUJOcos34eX+
 2AOQn9u/mv6gsROP7PyF9NqWaRI7jfl528UR6s2Dui5CkKakfbvHaK0jaYXYIrSa64Qn
 lmNxwKW86CoK/qlsT2RWDhAoUJJD3s5Al3EkePBJ+z8JHIYLheosZBFXPzYbkV5MGh7N
 WlXA==
X-Gm-Message-State: APjAAAW3ZOir3wg8jiq+eKV7TlcL9Jlg7ZE0KrmWGr65lGHsLEacWNc+
 YYyZP8Efw8qiSugO08bmNek6Cw==
X-Google-Smtp-Source: APXvYqy0dojhXdV/Wyv7nl7DnnJ1xyl+IlR4kyBZvriN/BA2WM6WGs9kvJj6pwDEOoKIklqLOYQZtg==
X-Received: by 2002:a2e:5d1:: with SMTP id 200mr18228489ljf.50.1572853123654; 
 Sun, 03 Nov 2019 23:38:43 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id c5sm6344575ljd.57.2019.11.03.23.38.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Nov 2019 23:38:42 -0800 (PST)
Subject: Re: [PATCH v3 28/36] serial: ucc_uart: explicitly include
 soc/fsl/cpm.h
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-29-linux@rasmusvillemoes.dk>
 <a921b57b-04d5-4874-89e2-df29dfe99bfc@c-s.fr>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <0acb2e96-3485-5e49-bed1-8deb2051cb91@rasmusvillemoes.dk>
Date: Mon, 4 Nov 2019 08:38:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a921b57b-04d5-4874-89e2-df29dfe99bfc@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/11/2019 17.19, Christophe Leroy wrote:
> Le 01/11/2019 à 13:42, Rasmus Villemoes a écrit :
>> This driver uses #defines from soc/fsl/cpm.h, so instead of relying on
>> some other header pulling that in, do that explicitly. This is
>> preparation for allowing this driver to build on ARM.
>>
> 
> UCC are only on QE.
> CPM has SCCs. instead.
> So this driver shouldn't need cpm.h

But it does. At the very least for the BD_SC_* defines, possibly others
things. It's possible one could split off the common part to a separate
header, but that sort of cleanup/refactoring is beyond what I'd be
comfortable including in this series.

Rasmus
