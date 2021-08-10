Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F09263E58B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 12:58:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkVKv6WXWz3bX3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 20:58:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AhB9IzC8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::336;
 helo=mail-wm1-x336.google.com; envelope-from=srinivas.kandagatla@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AhB9IzC8; dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkVK837D4z2yLm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Aug 2021 20:57:30 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so2206689wmb.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Aug 2021 03:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tYhapPe5H4mgp99/xIK0U3JAgB8Az9f2F1V7ARndpoI=;
 b=AhB9IzC8N70Gkz+16zkOwjsZF/JBPizz4JhvEBW8U0aZ6Wi5VbDm8loljB0HEFNPoq
 AvzkUISNyWFs/12scBaSXcdcHM0WRbYHdkbvvPy6CTQ0D2RhIJuRRabU4QizyWpgkAMv
 M4rdVgbR9O0/GV+/cUKoRJTWKvA9wUlW/RSfip2F9BCutzu9neQgm5LhhMro6IaUURRT
 g3g3vR5m+ilAjyMo2VNDgldGvH6jkjyW59laaO0TQXlGmqlo1etTkHVlQnJeNA8DePRi
 sInHmvZlz6RwYdOqXbmADv7YCBgHjBCTOwokBMFXbtRyvKypW1X3kM0EUkCQN2py0KuZ
 62Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tYhapPe5H4mgp99/xIK0U3JAgB8Az9f2F1V7ARndpoI=;
 b=YKWvROECmw22NdzJA/bsjqnIZid2GbpvytWVOhPlXGo2ixA0tJTRpt4WObhoblcOIG
 WkQ77wNJjZvk9USL9hTLkltT3RYwyYbVCRMaWB8xAM02Qn0iq8aGZfb4HcwfVB0uCKn+
 0pzxsfub1QlmV7dn1HZyifqzRnHKFc7CkY37H7HQNrIpArnFhFF4Itcv/fGmc9W9qtDZ
 puqMci1f11M/W/eSJTbaK1/GRmNzrUBlcJJFbxTWenDo6+tJjJR6bRGN/rKHwqNpHX44
 Yxf7vvR3Y1AX6F69Q2YNXOSXVPJ1iuxRnjhFsio4H6dl2umomcMxNkhgPxn5rEuhWEZu
 kWhw==
X-Gm-Message-State: AOAM531nWzrDIIpEwpxNvkQnPiLWjGcGbDd3IOLPFaRiNSAyR1MxYWlR
 A2+t+Trbk7USCUgCQAMq6HlSww==
X-Google-Smtp-Source: ABdhPJx+VZCy4y7O0qYRDJKBrvGIBsNubqdg/hBRfB6E8JiB0w1awHjnpL/wVPnZe4LlEaivmn3SVg==
X-Received: by 2002:a7b:c7d7:: with SMTP id z23mr21542255wmk.136.1628593040855; 
 Tue, 10 Aug 2021 03:57:20 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id q17sm925952wrr.91.2021.08.10.03.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 03:57:20 -0700 (PDT)
Subject: Re: [PATCH v4 0/5] nvmem: nintendo-otp: Add new driver for the Wii
 and Wii U OTP
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Rob Herring <robh+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org
References: <20210701225743.14631-1-linkmauve@linkmauve.fr>
 <20210801073822.12452-1-linkmauve@linkmauve.fr>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <cd854a84-7fd3-38bd-5a28-9306867a990f@linaro.org>
Date: Tue, 10 Aug 2021 11:57:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801073822.12452-1-linkmauve@linkmauve.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Ash Logan <ash@heyquark.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 01/08/2021 08:38, Emmanuel Gil Peyrot wrote:
> The OTP is a read-only memory area which contains various keys and
> signatures used to decrypt, encrypt or verify various pieces of storage.
> 
> Its size depends on the console, it is 128 bytes on the Wii and
> 1024 bytes on the Wii U (split into eight 128 bytes banks).
> 
> It can be used directly by writing into one register and reading from
> the other one, without any additional synchronisation.
> 
> This series has been tested on both the Wii U (using my downstream
> master-wiiu branch[1]), as well as on the Wii on mainline.
> 
> [1] https://gitlab.com/linkmauve/linux-wiiu/-/commits/master-wiiu
> 
> Changes since v1:
> - Fixed the commit messages so they can be accepted by other email
>    servers, sorry about that.
> 
> Changes since v2:
> - Switched the dt binding documentation to YAML.
> - Used more obvious register arithmetic, and tested that gcc (at -O1 and
>    above) outputs the exact same rlwinm instructions for them.
> - Use more #defines to make the code easier to read.
> - Include some links to the reversed documentation.
> - Avoid overlapping dt regions by changing the existing control@d800100
>    node to end before the OTP registers, with some bigger dt refactoring
>    left for a future series.
> 
> Changes since v3:
> - Relicense the dt-binding documentation under GPLv2-only or
>    BSD-2-clauses.
> 
> Emmanuel Gil Peyrot (5):
>    nvmem: nintendo-otp: Add new driver for the Wii and Wii U OTP
>    dt-bindings: nintendo-otp: Document the Wii and Wii U OTP support


Applied 1/5 and 2/5 to nvmem next,
rest of the patches should go via powerpc dts tree.

thanks,
--srini
>    powerpc: wii.dts: Reduce the size of the control area
>    powerpc: wii.dts: Expose the OTP on this platform
>    powerpc: wii_defconfig: Enable OTP by default
> 
>   .../bindings/nvmem/nintendo-otp.yaml          |  44 +++++++
>   arch/powerpc/boot/dts/wii.dts                 |  13 +-
>   arch/powerpc/configs/wii_defconfig            |   1 +
>   drivers/nvmem/Kconfig                         |  11 ++
>   drivers/nvmem/Makefile                        |   2 +
>   drivers/nvmem/nintendo-otp.c                  | 124 ++++++++++++++++++
>   6 files changed, 194 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml
>   create mode 100644 drivers/nvmem/nintendo-otp.c
> 
