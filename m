Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1770710E6DC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 09:23:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RJ6b3j1NzDqMB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 19:23:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="LDvW5+gU"; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RHsx3gd5zDqNZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 19:12:51 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id r15so24232017lff.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Dec 2019 00:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RXvQHsZsmW6pXP8cWlKu2oB3ye6J64yetODPCUShQls=;
 b=LDvW5+gU93ELdFLgK+qT5nVScnz7JgrgQhRNku/wapYS8SJVJ0DJqOui367w/7mQxq
 Au7P5C7DLMSuDtkf/MWrkqjx3ggt2cjLRCY1veJ07zT9Q1Eu1LPn5x1JVqaSg1XnhMZM
 3wHW/8HPkLuPc9XfhNEKM5So4ssvUYGcLRkL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RXvQHsZsmW6pXP8cWlKu2oB3ye6J64yetODPCUShQls=;
 b=lVncaEgrMC1i56pFZiTwUmixo48yWoCp/tkex9Rh5z+FWKxMHjGT3Sm3RGFxAXZmO2
 Pvg7yr0wemu2qd3ICPCiimjzGUCynufSv9cLuol8UXRJF2kN5BaTZeJoWg1sImBTDHcS
 3YFKPf+mU/kPbIosbW1fSy6G/jOJa32Jmbp/YL5rNl7kxPPDUvYIqr6thkG7QSY24qBL
 JWQn13+vLrm4z90bFKrxvU+gkOynb5X9E6njbbjjea3TUMq6Uq/ecEmWfKddDCtd+BU6
 j/BKz1Gfwg4xBjV3Dr5cIE5+VHMjh5ay6Ef2fj23ccHgjgBP4NpGNeNAULZ1dDVwYGog
 JMeA==
X-Gm-Message-State: APjAAAWrdZO48V5xH79KXuvBIal4T9eDv3IH1OD7vpNlQXGN2mQtsvdb
 nwvl84P8h5c+7wXogRhPA7m5gg==
X-Google-Smtp-Source: APXvYqwlkkFrnJatLGMhg+Y85fDnQNQBGUSaNwCgj8pT5xNS23TPmswcOte86uiWZSUfoOuJ8nIa5g==
X-Received: by 2002:ac2:4c82:: with SMTP id d2mr29043163lfl.62.1575274363744; 
 Mon, 02 Dec 2019 00:12:43 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id t6sm5445106lji.17.2019.12.02.00.12.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Dec 2019 00:12:42 -0800 (PST)
Subject: Re: [PATCH v6 00/49] QUICC Engine support on ARM, ARM64, PPC64
To: Timur Tabi <timur@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Christophe Leroy <christophe.leroy@c-s.fr>
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
 <7beef282-1dd8-7c7a-4f6d-d0605d11eab5@kernel.org>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <fb810251-f444-bd5d-54e3-774d2e1ccdb9@rasmusvillemoes.dk>
Date: Mon, 2 Dec 2019 09:12:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7beef282-1dd8-7c7a-4f6d-d0605d11eab5@kernel.org>
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
Cc: Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/12/2019 17.10, Timur Tabi wrote:
> On 11/28/19 8:55 AM, Rasmus Villemoes wrote:
>> There have been several attempts in the past few years to allow
>> building the QUICC engine drivers for platforms other than PPC32. This
>> is yet another attempt.
>>
>> v5 can be found
>> here:https://lore.kernel.org/lkml/20191118112324.22725-1-linux@rasmusvillemoes.dk/
>>
> 
> If it helps:
> 
> Entire series:
> Acked-by: Timur Tabi <timur@kernel.org>

Thanks. I'll leave it to Li Yang whether to apply that - they already
all (except for the last-minute build fix) have your R-b.

Li Yang, any chance you could pick up these patches so they have plenty
of time in -next until 5.6?

Thanks,
Rasmus
