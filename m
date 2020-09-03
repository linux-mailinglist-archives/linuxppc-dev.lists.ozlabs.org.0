Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C64D25CC1F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 23:24:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjDMW2pKrzDr7P
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 07:24:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjDKL3CQzzDqkf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 07:22:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uhJId/G7; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BjDKL035Xz8tjC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 07:22:14 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BjDKK6c4Rz9sTK; Fri,  4 Sep 2020 07:22:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=chunkeey@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uhJId/G7; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BjDKK632Fz9sSP
 for <linuxppc-dev@ozlabs.org>; Fri,  4 Sep 2020 07:22:13 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id c10so4104232edk.6
 for <linuxppc-dev@ozlabs.org>; Thu, 03 Sep 2020 14:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=vBV+kSnYK7stIvbafZ/3dbWe9aWGsvygRzHJWB0ieE8=;
 b=uhJId/G7YwMUYivWz2MZK3Va/d8mPsiMb0N+6zAkgrYfvNnwAwfineuyIElhIT9fm8
 UEnrMrc77YqYUN8f43yJh94SLJOIo8N6KKbqGvzUfwD2sTt4Ho6gFZ9hzoS2x/nyZBZ5
 RJO1Ejc9wTVAUFRxKN8m+ae/1PbnIeBdEOdF5dZH/xStNU2pcy/UIuPF+bdeqzWS1LWQ
 xuGm4EeelCyMZ6o8gthD4P2PAoeZ6VKlg1bMhpDZRcrUyphfx6fnAwuQMv9MfTw299df
 gYz0F0xAKOw/7DHVeED4oxoz2LANUPoea9m/wPdUXgzUk55aVxm4vVYiV/sTZMP2MX+m
 mt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vBV+kSnYK7stIvbafZ/3dbWe9aWGsvygRzHJWB0ieE8=;
 b=In+IEZIyqHTUaDf+u8MRRdOTa0sZIptIG0m7SoVQvwCmwrlO5MQdskwkyZbGEpSGLb
 zVMkzt4JmYSqah8teg8EIbqHufVO9BC7GeEqVbLCP5wKnvaAeTuqHncGx2vi/Llc9j1H
 GlkXtNr7G3I+I1hY7DkK3IvaSB3evzhF5B5F3VRXWfdTzkkkprJKzRS3NafMBv+uV6jw
 dPv7mr8LAK0hUcexaxVBWzR7LfYiGw20MLFKMCHzrgh7jCp6lQIUbBGc5EQ3p0cgxqDb
 WM08wmsMKTKC9jgBLt3CSstSiHBAvy6HISbjq1BOa3QlCEBZ+wGazshjiiZ61IL4xYtC
 PHNg==
X-Gm-Message-State: AOAM530ktXGmwi5Wa7U7BNo8VSLPON4j1pZEItdu3CReqQli8S2qADQS
 uY4ar9zX1Y/+u7E0u0rG6KY=
X-Google-Smtp-Source: ABdhPJwHqLjDfnZhEB3lyW8q9fTU/0jaonIf9K1wnH01NxTQX8L6z74aTonkHYqT3BjZoQz25mzs9g==
X-Received: by 2002:a50:9dc6:: with SMTP id l6mr5557421edk.136.1599168124276; 
 Thu, 03 Sep 2020 14:22:04 -0700 (PDT)
Received: from debian64.daheim (p5b0d7509.dip0.t-ipconnect.de. [91.13.117.9])
 by smtp.gmail.com with ESMTPSA id
 l23sm4096769eje.46.2020.09.03.14.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 14:22:03 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.94)
 (envelope-from <chunkeey@gmail.com>)
 id 1kDwfe-005t99-NH; Thu, 03 Sep 2020 23:21:26 +0200
Subject: Re: [PATCH] powerpc/boot/dts: Fix dtc "pciex" warnings
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20200623130320.405852-1-mpe@ellerman.id.au>
From: Christian Lamparter <chunkeey@gmail.com>
Message-ID: <d2652e63-b136-a805-fd6d-00584b64c772@gmail.com>
Date: Thu, 3 Sep 2020 23:21:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200623130320.405852-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: sfr@canb.auug.org.au, Chris Blake <chrisrblake93@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-06-23 15:03, Michael Ellerman wrote:
> With CONFIG_OF_ALL_DTBS=y, as set by eg. allmodconfig, we see lots of
> warnings about our dts files, such as:
>
>    arch/powerpc/boot/dts/glacier.dts:492.26-532.5:
>    Warning (pci_bridge): /plb/pciex@d00000000: node name is not "pci"
>    or "pcie"
>
> The node name should not particularly matter, it's just a name, and
> AFAICS there's no kernel code that cares whether nodes are *named*
> "pciex" or "pcie". So shutup these warnings by converting to the name
> dtc wants.
>
> As always there's some risk this could break something obscure that
> does rely on the name, in which case we can revert.

Hmm, I noticed this when I was looking up why nobody commented
on my series of adding more devices to the APM82181/bluestone series:

<https://lore.kernel.org/linuxppc-dev/cover.1598124791.git.chunkeey@gmail.com/>
(I'll post a v3 "soonish".)


Unfortunately yes. This patch will break uboot code in Meraki MX60(W) / MX60.

 > https://github.com/riptidewave93/meraki-uboot/blob/mx60w-20180413/board/amcc/bluestone/bluestone.c#L1178

| if (!pci_available()) {
|     fdt_find_and_setprop(blob, "/plb/pciex@d00000000", "status",
|                   "disabled", sizeof("disabled"), 1);
| }


Backstory: There are two version of the Meraki MX60. The MX60
and the MX60W. The difference is that the MX60W has a populated
mini-pcie slot on the PCB for a >W<ireless card.

That said, this is not earth shattering.

(In theory, this can also cause problems for the bluestone and canyonlands
dev boards that have the option to be configured as either dual sata or
pcie+sata.... But this is probably not a problem for customer boards)

OT: Please note that the plb, opb and ebc node paths (/plb/opb/ebc) are
hardcoded too :(. Amending the proper unit-addresses will lead to no-longer
working DTBs as the "ranges" are missing.

Cheers,
Christian
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>
> diff --git a/arch/powerpc/boot/dts/bluestone.dts b/arch/powerpc/boot/dts/bluestone.dts
> index cc965a1816b6..aa1ae94cd776 100644
> --- a/arch/powerpc/boot/dts/bluestone.dts
> +++ b/arch/powerpc/boot/dts/bluestone.dts
> @@ -325,7 +325,7 @@ EMAC0: ethernet@ef600c00 {
>   			};
>   		};
>   
> -		PCIE0: pciex@d00000000 {
> +		PCIE0: pcie@d00000000 {
>   			device_type = "pci";
>   			#interrupt-cells = <1>;
>   			#size-cells = <2>;

