Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AEA44D09D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 05:07:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqSph3Ttzz3bN8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 15:07:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lS36aFbk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lS36aFbk; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqSnw20VMz2yHC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 15:06:26 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id i9so4678384qki.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 20:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OLcFQVtD+zrg7PXIBfRA8cAQH7T7V2/4cfVGtfrxAq8=;
 b=lS36aFbkIRhJuC6Cd/AAaIIRXR6DpEI+MiQBTh+HAqDGQ7SJt2kOk9H7OefPb7ebNK
 3aaMIjZ2VlWMsGo6UecehmNcDjgJPL0cuqd0Umndtlo7lzpVLJosTFKfQ5jLQmWN+gWR
 Jr5xvZvaie2aDWnjNWXbAbJGgix5rr9ARnzYKIC+eLHLu1eICDbrqm5BMAU1FSKAGoDN
 49GzgVLS1AtMP3yl2OZ0HlByk+DJfaIP8+CSdmBdJiTSYsNiET6sL5V9FzCrGaRLtDUg
 DNpaMHeGFR8f41ArSJvrUf5szRHojZN4RxBZV/DP/lerAQFp9+r2/Xy1TUACK3rmOSMW
 l+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OLcFQVtD+zrg7PXIBfRA8cAQH7T7V2/4cfVGtfrxAq8=;
 b=WCn12j0cfNKUBZNSnODvjZnDilMuvyyqR26PJ6RGnyLlxWn7jRPSL8eRJTouHPigZq
 FsPWZPTWKLKoqT3vXqlm/lAMBv9reMaf4LZsIWmXfh/G61ZN6xiy1siKcmCP6wK1DWBY
 mNlxTFc2qSgisMMibw8RsFVLyHSURaMW30i939Bdb/+e3Wee3F45tiiQpVQcVsTbD4jG
 SaoJw04QMKgHiMtNZwm5PLJshGR4SdsXK5YDaVMDHeB60zIzw7/MJ5DPaxhbPATtp7Y5
 kc+wZLOGqVwTyOXB1EF+4cAr4GdyDA88dqXvt4By7UL7qt4oByxKF2VwcGK0/x4MH3xL
 TdKg==
X-Gm-Message-State: AOAM532wd1mlWNQyorSitMiPDwzhR8nSLiBFO9ryz3A25Gyw13Cq14pG
 /F7qY7XNerZ7QpZUxgFLM0o=
X-Google-Smtp-Source: ABdhPJwy1jkciX4+znRvqnHrGi5juDKLXSdn6bNl6om1ZBoExEpt68bOz9etkvnkVJVIPj1CjWlbwA==
X-Received: by 2002:a37:5804:: with SMTP id m4mr3775483qkb.137.1636603582779; 
 Wed, 10 Nov 2021 20:06:22 -0800 (PST)
Received: from [192.168.43.249] (mobile-166-172-188-236.mycingular.net.
 [166.172.188.236])
 by smtp.gmail.com with ESMTPSA id p5sm1084681qtw.69.2021.11.10.20.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 20:06:22 -0800 (PST)
Subject: Re: [PATCH/RFC] of: Shrink struct of_device_id
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh+dt@kernel.org>
References: <ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <9e20f1b0-3fc4-920a-dff4-1227f72207cf@gmail.com>
Date: Wed, 10 Nov 2021 23:06:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Geert,

On 11/10/21 11:23 AM, Geert Uytterhoeven wrote:
> Currently struct of_device_id is 196 (32-bit) or 200 (64-bit) bytes
> large.  It contains fixed-size strings for a name, a type, and a
> compatible value, but the first two are barely used.
> OF device ID tables contain multiple entries, plus an empty sentinel
> entry.
> 
> Statistics for my current kernel source tree:
>   - 4487 tables with 16836 entries (3367200 bytes)
>   - 176 names (average 6.7 max 23 chars)
>   - 66 types (average 5.1 max 21 chars)
>   - 12192 compatible values (average 18.0 max 45 chars)
> Taking into account the minimum needed size to store the strings, only
> 6.9% of the allocated space is used...

I like the idea of using less memory (and thank you for the above data!),
but I do not like the implementation, which reduces the size (of name at
least - I didn't check each field) to less than what the standard allows.

I have an idea of another way to accomplish the same goal, but I need to
dig a bit to make sure I'm not shooting myself in the foot.

-Frank

> 
> Reduce kernel size by reducing the sizes of the fixed strings by one
> half.
> 
> This reduces the size of an ARM multi_v7_defconfig kernel by ca. 400
> KiB.  For a typical kernel supporting a single board, you can expect to
> save 50-100 KiB.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Notes:
>   - While gcc complains if the non-NUL characters in a string do not fit
>     in the available space, it does not complain if there is no space to
>     store the string's NUL-terminator.  However, that should be caught
>     during testing, as the affected entry won't ever match.  The kernel
>     won't crash, as such strings will still be terminated by the
>     sentinel in the table.
> 
>   - We could save even more by converting the strings from fixed-size
>     arrays to pointers, at the expense of making it harder to mark
>     entries __init.  Given most drivers support binding and unbinding
>     and thus cannot use __init for of_device_id tables, perhaps that's
>     the way to go?
> 
> Thanks for your comments!
> ---
>  include/linux/mod_devicetable.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index ae2e75d15b219920..2bb2558d52d30d2b 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -266,9 +266,9 @@ struct sdw_device_id {
>   * Struct used for matching a device
>   */
>  struct of_device_id {
> -	char	name[32];
> -	char	type[32];
> -	char	compatible[128];
> +	char	name[24];
> +	char	type[24];
> +	char	compatible[48];
>  	const void *data;
>  };
>  
> 

