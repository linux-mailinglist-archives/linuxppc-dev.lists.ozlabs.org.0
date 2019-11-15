Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0140FD769
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 08:56:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DrJy6ttlzF59k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 18:56:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="Tj7gXOnq"; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DrGb4K3gzF6d7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 18:54:30 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id t5so9663126ljk.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 23:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+C6UFetkkOkabjlrx29bRj2f/pHq6ZunDxUzZ7B8oJI=;
 b=Tj7gXOnqtuG0wJhNZbvfhuhFF7Ajj+d/fkSs7BOhJuk6zYcUK3pqsPz4KlpJ5C6cZu
 CQ9MRWf2wM06ny9O2bnOKcTBNvY1ewmlHc0/L/nIx34DK3gZJOIMBOt6MJMcRJUnM6lj
 Sty8aREsnWc3bR9ednCLj5/uDLng1EyPh4j+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+C6UFetkkOkabjlrx29bRj2f/pHq6ZunDxUzZ7B8oJI=;
 b=H2J+/T1gQKssk6KgpI3XwiNefh/w8DZUoxNS5LgoZYI0WCu9Ggo66deyqPD57f2umb
 LVchkvD35LNHDPNBuqRITMCWi7TAS2iM0lUwVnrJeFzDrCM+7HTb2Xk+m7WeKuwLuj8C
 MsZHGyFIofCTu5Fk/8ljoJn4HN85dln1Xz/yxoyZgrtEXqFXJPzvjQ4ewCiigufgZZ7P
 KMY5IEnH+G0Gfx+GXPW4lB11m6/1ZcLQCgYmkPZH13y4DeUYuA++Li8S5+OQ2xuIWPMS
 PJq+WJ8VjnJrq3ANYyK/e3qOxbE8qHRP7WRldRimqoR6f+gVGKMgAz6KkLcxUaRIpsRh
 7QtQ==
X-Gm-Message-State: APjAAAU/gzxJx4pGwxHLejQd6FSeKYawpd5KlKzZNSnkFsaw644MHUt5
 7BfGgvFnixiCRsRxlzGSBBYxbA==
X-Google-Smtp-Source: APXvYqwtca4V1MXOZa/BxeDe/jqUfjT4UHa/rribPRAykBqSAV8Y1dWumBHX7aG8dBwq5CyNgx3uLQ==
X-Received: by 2002:a2e:8809:: with SMTP id x9mr9979158ljh.82.1573804466324;
 Thu, 14 Nov 2019 23:54:26 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id w11sm4254332lji.45.2019.11.14.23.54.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Nov 2019 23:54:25 -0800 (PST)
Subject: Re: [PATCH v4 46/47] net: ethernet: freescale: make UCC_GETH
 explicitly depend on PPC32
To: Li Yang <leoyang.li@nxp.com>, Timur Tabi <timur@kernel.org>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-47-linux@rasmusvillemoes.dk>
 <CAOZdJXUX2cZfaQTkBdNrwD=jT2399rZzRFtDj6vNa==9Bmkh5A@mail.gmail.com>
 <CADRPPNS00uU+f6ap9D-pYQUFo_T-o2bgtnYaE9qAXOwck86-OQ@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <29b45e76-f384-fe16-0891-cc51cfecefd4@rasmusvillemoes.dk>
Date: Fri, 15 Nov 2019 08:54:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADRPPNS00uU+f6ap9D-pYQUFo_T-o2bgtnYaE9qAXOwck86-OQ@mail.gmail.com>
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
Cc: netdev <netdev@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15/11/2019 06.44, Li Yang wrote:
> On Thu, Nov 14, 2019 at 10:37 PM Timur Tabi <timur@kernel.org> wrote:
>>
>> On Fri, Nov 8, 2019 at 7:04 AM Rasmus Villemoes
>> <linux@rasmusvillemoes.dk> wrote:
>>>
>>> Currently, QUICC_ENGINE depends on PPC32, so this in itself does not
>>> change anything. In order to allow removing the PPC32 dependency from
>>> QUICC_ENGINE and avoid allmodconfig build failures, add this explicit
>>> dependency.
>>
>> Can you add an explanation why we don't want ucc_geth on non-PowerPC platforms?

It's not that "we" don't want to allow building this on non-PPC per se,
but making it build requires some surgery that I think should be done by
whoever might eventually want it. So _my_ reason for lowering this
dependency from QUICC_ENGINE to UCC_GETH is exactly what it says above.

> I think it is because the QE Ethernet was never integrated in any
> non-PowerPC SoC and most likely will not be in the future. 

Well, that kind of thing is impossible to know for outsiders like me.
Maybe one can amend the commit log with that info:

"Also, the QE Ethernet has never been integrated on any non-PowerPC SoC
and most likely will not be in the future."

Rasmus
