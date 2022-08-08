Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE88F58C303
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 07:47:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1QFg5p6Wz3bc8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 15:47:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w2pEwR1F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w2pEwR1F;
	dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1QF308WLz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 15:46:46 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id z20so8724881ljq.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Aug 2022 22:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xOqrRkUDHjSPuj9i4H6o8TBLA4yLo5iNF5pKCqfxIWk=;
        b=w2pEwR1FFLzI//sm8jmTeFJ4Px5SM4423RgpSEXsyRj/Z2hRJebM9KtVWuyfDGuAXe
         jcaG0Q5QCJYPvc5nmx+AW8tu4Lxa4DFmlhxoYTRGmDMS4tF5kDeZM2XICPX1m3BxzbhT
         2OljNkW/IMOcfyl1k/wx8oGs0EeiXcr9O/Y4ev7VPe2fVsnugj9zFXoWRyn9+jqOsmm2
         PcYhEjclXti52j4KCKnl+Kd3cluDe6QxlE3OZb9sy8giizcPKhRd2hMS944KIYQhxnfw
         gOXw3ww3YkOwBEv2vqXKZRoMCDRiUJVoCGp3WJaRUNwJGYYnxOlD7KVb6+w+LNi64AcA
         Ak+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xOqrRkUDHjSPuj9i4H6o8TBLA4yLo5iNF5pKCqfxIWk=;
        b=KrEkcbW5xV0cR5q6PhC1RgFs8fKs1p1KpBOflYH1OQMX4sPJr5F+HXFh5OhfXx9nIg
         ANKOUKe7m8Od4+/nqCPo/Zys3erdxLgSXAqn1WICOPBf3l47AwE7j7TFAKN6PHHPhJLS
         a7LtuINE6CRCpaE5EXcxwSJFeQyWFjOljK5JylwF5aXqaKpBNAtYM/mUFIQtw7mARV81
         +9Srcgw2BbyHHhQgEgVLgKTR/PtbmjiDH0KHCBvym57KxCO9k4HuVj9LvD6bhmowxH5i
         bfedfUNPAo49c9EEDEzIYOQrIgpP4L0n1emp5UGwsoZ7ggqiuF3nRdFWQSGkhrfCB4mn
         kmkQ==
X-Gm-Message-State: ACgBeo3taW03Cz5UH9H4k+FsHWyiiM5EYU5Gpo3Ky51iAdjIO14jXgSf
	/soR6ZBfvwZDR7g8wXFHHalMqg==
X-Google-Smtp-Source: AA6agR5JYOLMzw/XuGStP7L2CF8XiWX/3bJ6dgIuD4q16mY6f7h3TcfBzWO5PAF/CuZhlkN1TZO6eA==
X-Received: by 2002:a2e:7e0a:0:b0:25e:63f2:bbb0 with SMTP id z10-20020a2e7e0a000000b0025e63f2bbb0mr5699446ljc.77.1659937601371;
        Sun, 07 Aug 2022 22:46:41 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id o14-20020a05651205ce00b0048ad0ad627asm1301868lfo.128.2022.08.07.22.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Aug 2022 22:46:40 -0700 (PDT)
Message-ID: <6aac8854-599e-c43f-0a49-0650fce91179@linaro.org>
Date: Mon, 8 Aug 2022 07:46:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-phy@lists.infradead.org
References: <20220804220602.477589-1-sean.anderson@seco.com>
 <20220804220602.477589-4-sean.anderson@seco.com>
 <bee3d724-1efb-d5c7-6698-c98a198e69fd@linaro.org>
 <b97f113b-f429-c8c5-96ee-7f1a68e16117@seco.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b97f113b-f429-c8c5-96ee-7f1a68e16117@seco.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/08/2022 17:17, Sean Anderson wrote:
> 
> 
> On 8/5/22 2:53 AM, Krzysztof Kozlowski wrote:
>> On 05/08/2022 00:05, Sean Anderson wrote:
>>> This adds ids for the Lynx 10g SerDes's internal PLLs. These may be used
>>> witn assigned-clock* to specify a particular frequency to use.
>>>
>>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>>> ---
>>>
>>> Changes in v4:
>>> - New
>>>
>>>  include/dt-bindings/clock/fsl,lynx-10g.h | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>  create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
>>>
>>> diff --git a/include/dt-bindings/clock/fsl,lynx-10g.h b/include/dt-bindings/clock/fsl,lynx-10g.h
>>> new file mode 100644
>>> index 000000000000..f5b955658106
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/fsl,lynx-10g.h
>>> @@ -0,0 +1,14 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>
>> This should be dual license.
> 
> This is just matching what the majority (263 out of 326) clock dt-bindings headers do.

Then please license it just like bindings, so dual license with BSD.

> 
>>> +/*
>>> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>
>>
>> It's confusing to see personal copyrights with company email. Either the
>> copyright is attributed to your employer or to you. If to you, use
>> private email.
> 
> I hold the copyright, and I would like inquiries to be directed to my work
> email (as I don't have this hardware at home).

OK, I guess I won't be the only one confused :). This entry here is not
parsed for any tools and only sometimes people look at it. The questions
are directed via entry in maintainers file or via git history, so you
can put company email just there.

> 
>>> + */
>>> +
>>> +#ifndef __DT_BINDINGS_CLK_LYNX_10G_H
>>> +#define __DT_BINDINGS_CLK_LYNX_10G_H
>>> +
>>> +#define LYNX10G_CLKS_PER_PLL 2
>>> +
>>> +#define LYNX10G_PLLa(a)		((a) * LYNX10G_CLKS_PER_PLL)
>>> +#define LYNX10G_PLLa_EX_DLY(a)	((a) * LYNX10G_CLKS_PER_PLL + 1)
>>
>> These do not look like proper IDs for clocks for bindings. Numbering
>> starts from 0 or 1 and any "a" needs to be clearly explained. What do
>> you bind here?
> 
> This matches "a" is the index of the PLL. E.g. registers PLL1RSTCTL etc.
> This matches the notation used in the reference manual.

This is a file for bindings, not for storing register values. There is
no single need to store register values (offsets, indexes) as bindings
as it is not appropriate. Therefore if you do not use it as an ID, just
remove the bindings header.

> Although for
> convenience, this driver considers the PLLs to start at 0 instead of 1.

Best regards,
Krzysztof
