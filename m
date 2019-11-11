Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C22D6F6F1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 08:36:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BN355TY1zF3Dn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 18:36:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::142;
 helo=mail-lf1-x142.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="QIoixCtM"; dkim-atps=neutral
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BN0q2x77zDr3M
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 18:34:02 +1100 (AEDT)
Received: by mail-lf1-x142.google.com with SMTP id y186so3236764lfa.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2019 23:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=11XyuX75h6wLXlM8eIF2c6GY+p1TuOaj5FL64Q+XyMA=;
 b=QIoixCtMLQtH5ivP/i+BLVDDT85cUSsT96NwuYXO3sqDavMb8qbqaQ1rEt/1rhsQA7
 9bKf54a4NzkBgFwDRc6SljVSQAg1BpYhc8pdaWjO7e6h4+yXUcxfj4fCMA6hFTn/pwYL
 UTkRBuhH71NZcBtzr9R67ULNVOR+UkkeOxlpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=11XyuX75h6wLXlM8eIF2c6GY+p1TuOaj5FL64Q+XyMA=;
 b=YWTUZy3gJ8n1GCDV+or+rHN1r7mBvYXl3l3fmaIh/N0aLSx5zq6vFdd6ZHqgDMLKtZ
 pe8KwtkK4plY/dpCsCdwQT19mEDdjA44U++FEH+Z83/sUqmVlWph6rr/1Y7GYsUTUqM3
 humTH9HE78nbcB0bDYVqLMST3+BthrdroUz7x1JswwwHcKDBL7CgyR/+4XCAun9YkR88
 1RfH+OyF+1X5ewNV5zUvDl8PYxWthxW/iT79I43H1IVrkZZpdbdF/8HV1oybzSN9JjYp
 8SZ38Ay88MVp37k15kll7THHGmnRiU9C5fdIpikKNOXUps3wz3RokTMkCtyt5tOpfi3C
 DldQ==
X-Gm-Message-State: APjAAAWs/4qA8cW+btyKa00zWmXhadkvp8N80YcvsrEl75po/3SCHkw5
 6QWh9lhWmPoufiRgUEzRTwZ6ag==
X-Google-Smtp-Source: APXvYqwWjm4XW5IM/KA1VQfUmHJXZcUSfm6veYrOgywqCu+f4k/Fz0EK4oxRy/gcrvKaSfQ4yzaE2Q==
X-Received: by 2002:a19:855:: with SMTP id 82mr14378120lfi.44.1573457634762;
 Sun, 10 Nov 2019 23:33:54 -0800 (PST)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id z127sm5941129lfa.19.2019.11.10.23.33.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 10 Nov 2019 23:33:54 -0800 (PST)
Subject: Re: [PATCH v4 47/47] soc: fsl: qe: remove PPC32 dependency from
 CONFIG_QUICC_ENGINE
To: Li Yang <leoyang.li@nxp.com>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-48-linux@rasmusvillemoes.dk>
 <CADRPPNQwnmPCh8nzQ5vBTLoieO-r2u0huh17mwcinhfhNgo04A@mail.gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <14894529-a6bd-9b7e-eacc-06d5e49cc8e8@rasmusvillemoes.dk>
Date: Mon, 11 Nov 2019 08:33:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADRPPNQwnmPCh8nzQ5vBTLoieO-r2u0huh17mwcinhfhNgo04A@mail.gmail.com>
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
Cc: lkml <linux-kernel@vger.kernel.org>, Scott Wood <oss@buserror.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/11/2019 00.48, Li Yang wrote:
> On Fri, Nov 8, 2019 at 7:05 AM Rasmus Villemoes
> <linux@rasmusvillemoes.dk> wrote:
>>
>> There are also ARM and ARM64 based SOCs with a QUICC Engine, and the
>> core QE code as well as net/wan/fsl_ucc_hdlc and tty/serial/ucc_uart
>> has now been modified to not rely on ppcisms.
>>
>> So extend the architectures that can select QUICC_ENGINE, and add the
>> rather modest requirements of OF && HAS_IOMEM.
>>
>> The core code as well as the ucc_uart driver has been tested on an
>> LS1021A (arm), and it has also been tested that the QE code still
>> works on an mpc8309 (ppc).
>>
>> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
>> ---
>>  drivers/soc/fsl/qe/Kconfig | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
>> index cfa4b2939992..f1974f811572 100644
>> --- a/drivers/soc/fsl/qe/Kconfig
>> +++ b/drivers/soc/fsl/qe/Kconfig
>> @@ -5,7 +5,8 @@
>>
>>  config QUICC_ENGINE
>>         bool "QUICC Engine (QE) framework support"
>> -       depends on FSL_SOC && PPC32
>> +       depends on OF && HAS_IOMEM
>> +       depends on PPC32 || ARM || ARM64 || COMPILE_TEST
> 
> Can you also add PPC64?  It is also used on some PPC64 platforms
> (QorIQ T series).

Sure, but if that's the only thing in the whole series, perhaps you
could amend it when applying instead of me sending all 47 patches again.

Should PPC32 || PPC64 be spelled PPC?

Rasmus
