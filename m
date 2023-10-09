Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C467BD77E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 11:46:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q3298mSA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3vM16Wn6z3cRv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 20:46:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Q3298mSA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=tudor.ambarus@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3pV34fF0z2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 17:07:37 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50435a9f800so5329711e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 Oct 2023 23:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696831648; x=1697436448; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jQSsnNPGoLekEfxryi1OyAWP3eYL96XguQhMUQ9k7M=;
        b=Q3298mSAHIKmirIqf1BKiLCQemsF3Iaw20qxG82ODVWGmmndpINkrcKOdQuoMlHzOX
         Lpihf1DmsC/toZi39U1vxr+FWehXVAWLJmcRirklZNtUueaXWg2l93xwz9l3xkW50hsm
         J9UIDzrpEAAG3eC7tqFO2C2day49XTGnNz+Z1IX6wIL1OEpNe2rcf14p3pSLeUUZdUdP
         28T+5D84Tkx1ZXYPP3bVhXiKPFa/wNLbmBwK33KXPc5yXsz8Z69XuaxPa8o1cG1v3qeS
         Lt5fG/1EXAmL452ALUcbejLh8H725vVCf4x00Nc3xE6GFQKtFHNkb9pHeJbpirHn0q8e
         7gsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696831648; x=1697436448;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jQSsnNPGoLekEfxryi1OyAWP3eYL96XguQhMUQ9k7M=;
        b=eh6dqAn4twgl38MbzCC9itsRgfmoNcAnZ7B/hLOGV8QozZIkaTc9nUNpdp2EC4g8jb
         L+r1P8WXcr4ZbXh7lORMkoD6DDPR3Vx7ElgtV1JtxPafK9x8hS0SB8rDkksntZ+9PPRQ
         GT2PGCVcKyHSjFeDAY8HvQxI+STzzz5V+9+AHwz3fF9TMT3wzHHRgnON7VSysJTaGEgB
         39BH5KcRGiFfXCG+WlBxgvI1D2NppQ6FEq/Q7+97c3kphwcPXMW6ZsWSyIYcwg5pebhv
         FPhj0yLTqpIK1ogF0lNxR5L0WQgafx/fUyxHrdZMEQRb/b2K5kRY91kDGGigHDoQnGSw
         oLDA==
X-Gm-Message-State: AOJu0YzmR0pWSrYcDxmCsK3J23Bli7+Woq7cTMlmldy82SZRWAm9mavy
	53p2hnNs8tCsjQBNHLiQ9aqtZA==
X-Google-Smtp-Source: AGHT+IEulPl8s4i0M+Zi/sk4AKTnELItj8JoKzhnPWHm3t1wWVYt1qRXTgDtyk/ECIXgf4klmNEzyw==
X-Received: by 2002:a19:5050:0:b0:503:31dc:7d64 with SMTP id z16-20020a195050000000b0050331dc7d64mr12856772lfj.21.1696831645881;
        Sun, 08 Oct 2023 23:07:25 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.123])
        by smtp.gmail.com with ESMTPSA id v2-20020a1cf702000000b00405d9a950a2sm12438473wmh.28.2023.10.08.23.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Oct 2023 23:07:25 -0700 (PDT)
Message-ID: <19a98e1d-583b-4057-bdbe-895402ab4143@linaro.org>
Date: Mon, 9 Oct 2023 07:07:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] mtd: Convert to platform remove callback returning
 void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Oct 2023 20:46:10 +1100
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
Cc: David Woodhouse <David.Woodhouse@intel.com>, Hui Tang <tanghui20@huawei.com>, Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Li Zetao <lizetao1@huawei.com>, Zheng Yongjun <zhengyongjun3@huawei.com>, linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, Yangtao Li <frank.li@vivo.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kbuild@vger.kernel.org, Joern Engel <joern@lazybastard.org>, Nicholas Piggin <npiggin@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-arm-kernel@lists.infradead.org, Michael Walle <michael@walle.cc>, kernel@pengutronix.de, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Pratyush Yadav <pratyush@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 10/8/23 21:01, Uwe Kleine-König wrote:
> Hello,
> 
> this series converts all platform drivers below drivers/mtd to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver
> core doesn't (and cannot) cope for errors during remove. The only effect
> of a non-zero return value in .remove() is that the driver core emits a
> warning. The device is removed anyhow and an early return from .remove()
> usually yields resource leaks and/or use-after-free bugs.
> 
> All drivers touched here returned zero unconditionally in their remove
> callback, so they could all be converted trivially to .remove_new().
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
