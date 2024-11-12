Return-Path: <linuxppc-dev+bounces-3127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 174DE9C63A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 22:42:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xp0Hq5Hk4z2xdZ;
	Wed, 13 Nov 2024 08:42:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731447735;
	cv=none; b=Zj4mMQZYxVvkxwoME3lANkrldXrGGGzPY9drhPsd0WVwxMEL9jcfuov9khTvJGvOKMXdIwSOZ4MlTs8wancq7wj5bkuRQ2wNOKPAubwlFhPRz/qtejIYp0X9PsDIqtvGIT0Y2aJaEjk+TUNB/TeIiBn3o3shoTbblmRbvexyb1FmjBKp00Ue0omD+ruQ6fM4Kgh4ctWYnyFDaJsnx1x3OZCwF/wO8tAvZpefy+XUO93PCK6FVumi/H8L9TxYoi0EY8GqG/oT1Qko1ypV3fFqMNbhyMCjsMhDeo5ckxRWiV5GERnAh9j/kJXv2AFyYlyyNzWaY86v7epOkZah5RcP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731447735; c=relaxed/relaxed;
	bh=1JyuzlEmjIKs0OEzFDs2Ei5r4rj+a+WGwyUfTtd/WDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oQ+q5Z6lPXAgIXBSjF81QMUqQP6isGHJSKLS01kkaPRVFxXPZx82J9XKL/MYGyBRQltSY4Q7XbIuWJfb6QoObpQKvpxTkYXOEpHWgdT1eKTbvgSUaUEpmoykYb3AbkMRZRh+8KUChvz4wmCs7VIBQxH0rRksSeMFYlpkInLYuzOrpcDC7+F/ZO/sihZdSMJ7REzfcwL3VbuCPq6lN5A0ihE5Dpbwm0exrn+LEXsrhVRkwUW+ctZ94IdSn8EJs/uKcMSgm9VQPhn6jPE4jfpollJrPzJ5VzYLKELJs3SAGcHQhkOEL25rcFwe6evHO9ZUpfwigz7ekiH/mCZJzgKGSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=URO1va9a; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=florian.fainelli@broadcom.com; receiver=lists.ozlabs.org) smtp.mailfrom=broadcom.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=URO1va9a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=broadcom.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=florian.fainelli@broadcom.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xp0Hn5Wylz2xZt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 08:42:09 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20c767a9c50so61187435ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 13:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1731447728; x=1732052528; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1JyuzlEmjIKs0OEzFDs2Ei5r4rj+a+WGwyUfTtd/WDY=;
        b=URO1va9a3eoqpZVnz4vNP6xK0WqQ+Pkv3Cf4g0NUS88rAX0AarcxA5e7Z8pkNfBIPK
         BJz5B+f8dQehcwEoR8jXwLrhfNXT8jbqfMNyehYtUlsBw3mCIN2YsQMThL2wf+xTBEpy
         i6eDT+KN1jVHvpECQAFWCq8OTEzt3THbgQLWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731447728; x=1732052528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JyuzlEmjIKs0OEzFDs2Ei5r4rj+a+WGwyUfTtd/WDY=;
        b=ibyE/H/7yNGXgoydBr2Imn0LNTeokUrJ6/9rHvKDG9/l6gOQrcVH/g3+Hr4bK0qxpO
         4ypJ8BXqoz8Kiet2CZgU+GcAxAIZNHtEAzPCGAcifFAcEtOmoj3/sbFslrrpNb/Ai0Uu
         gRymythaGtfqw6E5Gll3vrPXuiX+XTvgQO/F+8DmIP+gyrBfMZis2QuTz8hzkKbXfauw
         dbFzaTlEMdy2BJTYUmijhl2ZXOxGnBd9F1Y9ibCkjvsUVFPL30ub1ZzaVFO0WTBCtSRv
         yeBnDVH9ZGyDUbYX6a/+gC7QfrhJT8oh8hHwg+2jS3Y2Wa8bVt9LT+3J7yZ+K+nbJYhX
         gEdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWku72k1p1Gq/JqA7SZlMpN+wilt2DrYLKAbgFEK/aSIvkfSfnz9t5D2ff5evKOSLJoZmo40aKPEer8bFU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyVHNsmrUYx+VtR/wXBSpxbf0AMnfEeq8vj3TsJTPmwNqXnURRX
	diXWwMUhuhXoqY0wXLOuC13d4stRCaYu9vA/nI0Hl5cx6yV9oUh5OHdvccWXKg==
X-Google-Smtp-Source: AGHT+IFDh6oyLu1szZNtbuwF2rTREJskobicbVjVT9besKSihoc9sQcmwBwA22LNfYSTp8e423c8ow==
X-Received: by 2002:a17:90a:e7cb:b0:2e2:a8dd:9bb5 with SMTP id 98e67ed59e1d1-2e9b170d9f4mr23022270a91.12.1731447727580;
        Tue, 12 Nov 2024 13:42:07 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9f3f4fe0bsm9897a91.53.2024.11.12.13.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 13:42:06 -0800 (PST)
Message-ID: <4b50e109-da52-4616-8f68-75174ffac8a5@broadcom.com>
Date: Tue, 12 Nov 2024 13:42:02 -0800
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 net-next] net: modernize IRQ resource acquisition
To: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vladimir Oltean <olteanv@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Marcin Wojtas <marcin.s.wojtas@gmail.com>, Byungho An <bh74.an@samsung.com>,
 Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Francois Romieu <romieu@fr.zoreil.com>, Michal Simek <michal.simek@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Zhao Qiang <qiang.zhao@nxp.com>,
 "open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "open list:FREESCALE SOC FS_ENET DRIVER" <linuxppc-dev@lists.ozlabs.org>
References: <20241112211442.7205-1-rosenp@gmail.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20241112211442.7205-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11/12/24 13:14, Rosen Penev wrote:
> In probe, np == pdev->dev.of_node. It's easier to pass pdev directly.
> 
> Replace irq_of_parse_and_map() by platform_get_irq() to do so. Requires
> removing the error message as well as fixing the return type.
> 
> Replace of_address_to_resource() with platform_get_resource() for the
> same reason.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> (for CAN)
> Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>

For bcm_sf2.c:

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>

-- 
Florian

