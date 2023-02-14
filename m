Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D65695B1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 08:52:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGD2D00cGz3cMT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 18:52:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=b2BkfvRt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=b2BkfvRt;
	dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGD0f0khFz3cFN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 18:50:57 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id f23-20020a05600c491700b003dff4480a17so489590wmp.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Feb 2023 23:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFkW6VXT2fJOMq6WUaQRBhQCIVLvw3497deAs8udnhc=;
        b=b2BkfvRtFc9qhL9RxXaUQvxTUsLUpsHLXh8vIrxL+M+JiOUhz32HAYvSUPPyTdQl77
         1p3HUUIWnP0wozCAjwY8VxpC5Hjl2+v3GwjG/dFVysmWZhGHWvr/6iIH91gfRtudx5ii
         egD42T62aSSeAUQAoZ3bftvq6oEk1IvgPTqvhyz2/H8/FloRkK5BRF9A8eWltvJmLwJI
         Uf0s9r16yQhJARquCcxwXlLrVW3jKQORB/2Pnub6HP1P/jj2kw2BN2QNr8FaScNfp7xd
         Jpk95lFXnJ80tAWYVStTx2EDtvvDFldUhYT6kDqrJVlji1UtQ+TxVDywjsr26yaPckWo
         FVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFkW6VXT2fJOMq6WUaQRBhQCIVLvw3497deAs8udnhc=;
        b=eZXJ4LXJ5Yvj9QHsJQvLifudYyohfwpr3jWOn7cZvP9LXModCnmz5WCghOCxyJLxOG
         SvPRl7XSx6X6Y/zKSjsVsSf4j7sKXmsSKgokJqneoisbs7J8gsrxrrgvE1d2+YBA7jVx
         UasoF0Y5fFpQDhrsRPu6uLx/aQkGSq/vZYmvTdflf6UV/Xk01GDpwqNmX6wckE+uwQIs
         aDlbzpzy6CS7oY9hBeRHWr7hxjf+0Y/BNb14aNNZ3ssKfjGMmnnVUoaL/IIdyi6Ekjtu
         y1d9mg/BKqsNZRvcWx5Z2Z1SzrkYe1AEgGzPnhVQ4VorB44P+TZHVmzWDJbCHWiorZ30
         gxSw==
X-Gm-Message-State: AO0yUKVnD3I1gc6oZgpAwUwKdxkLu0ATPbqfR2RAIdLB57xRROYw+zZl
	yYef0vUTL4AE2z73GiATLxdPEw==
X-Google-Smtp-Source: AK7set8OwsFg75MOvBTEy09aU+PMdliA4+gMU5XeiDY9OERUz4XXU+M2RI99OwrD6TCFxsze20SfqA==
X-Received: by 2002:a05:600c:1609:b0:3df:f85a:472f with SMTP id m9-20020a05600c160900b003dff85a472fmr1835747wmn.13.1676361054982;
        Mon, 13 Feb 2023 23:50:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id bg23-20020a05600c3c9700b003dd1bd66e0dsm18073301wmb.3.2023.02.13.23.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 23:50:54 -0800 (PST)
Message-ID: <56249307-5093-1283-d2db-26c5b20881fa@linaro.org>
Date: Tue, 14 Feb 2023 08:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 11/24] mips/cpu: Mark play_dead() __noreturn
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <2897b51a9b8beb5b594fe66fb1d3a479ddd2a0e2.1676358308.git.jpoimboe@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2897b51a9b8beb5b594fe66fb1d3a479ddd2a0e2.1676358308.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-mips@vger.kernel.org, linux-alph
 a@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/2/23 08:05, Josh Poimboeuf wrote:
> play_dead() doesn't return.  Annotate it as such.  By extension this
> also makes arch_cpu_idle_dead() noreturn.
> 
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/mips/include/asm/smp.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


