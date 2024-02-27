Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39429868B51
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 09:54:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qkOjZPgv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkWWp6pDqz3d4F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 19:54:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qkOjZPgv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=tudor.ambarus@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkWW5532kz30gM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 19:54:08 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a36126ee41eso473046666b.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 00:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709024046; x=1709628846; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/R2gt8FfMfgy+vk+46mAFR8jEJEX98suuabTB+H5F6I=;
        b=qkOjZPgvr3hNtZ2gcKjkqaB4DO7mT7T10YbBSt2wOFzB31kFa7c6jMBEa9efI8vlOt
         g/ECmTH0fFURoA/Zphv7j96VpzWT37VbGTTSK7/NkewMg8ckDd7TFfMFqdHQveU4bQ02
         88zxgilPwSY/Zwzi6p6eV+U16h9iLlu3JXeAcozSTvR0eegqmCpSXuUFwcUJHUzjHsgG
         Yn6PiZm5exfGODk5n8olbKOVRSeG3oSRy5QkuwpJU+0gUyQ4EhZkCbLetoZbbp51mKrX
         UPS/j5dXOGHfdFr243+G9E9Y7zIhIqvIXeqdilHZs2+G5ywy8NtRR5IjgmqUQlSGfx5J
         Pv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709024046; x=1709628846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/R2gt8FfMfgy+vk+46mAFR8jEJEX98suuabTB+H5F6I=;
        b=ZEBEdMeh215B+VC9eSkyJrhse1iOuNtZhFVuGZm6x++zImO89jnE1OLIRnJ6sml10M
         9MAy7hA9cErdM4/mLjgJRmiisR6FzTNbgo9kwUCOrnCz6BBx7svrcDirleKxLNl3iJk9
         eHhKVkQtR2JfYaNbEhTaudUt5SqcOb2E/PnfCQ8IHqVTOEX7lnFlxAJuI8zAGgUUR26F
         CUG+XmnsXVsh4JA7H+UD9xi1h1zOczxxDEBYhNXtpuwhtmwzGBLysHb3i6Q9MunIA1cc
         8BzrZROgJEJlAQ/PwtNM8Z1XqR027cXJZl5kQHlN0J6Ay3r6HR5/lMCzjqDDF1c0BdxK
         G8nA==
X-Forwarded-Encrypted: i=1; AJvYcCW60p5dvmo+tevyxZ04PaoPvxF8Vrlp1Nu9fIT92DK9BIHVc0s7b9/IHr7wLvZh1M4RIV8eJGwr0/OUvY3vWeK1Jn7PvcVXRVDNGZUBHw==
X-Gm-Message-State: AOJu0YzKZpXMs65PSKCiuAPPsFLU4S+lizGI7vY0WTUcV1aZcLu+G2xt
	JqZVD7wlErLqhigCnfF5f8O8mneHRpjzrYr+c+Q2H9WCcy6wtXU8dBOu+MPSuZ4=
X-Google-Smtp-Source: AGHT+IGfbz+zIwvGhump2k6nxmb7eLS31X0yw5cokND+hQ1oEsVFKJwBygsFR+WovIqEMi1tyrEUxA==
X-Received: by 2002:a17:906:6d8b:b0:a3f:dae9:1e88 with SMTP id h11-20020a1709066d8b00b00a3fdae91e88mr6406985ejt.37.1709024045603;
        Tue, 27 Feb 2024 00:54:05 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id i25-20020a1709063c5900b00a3f596aaf9dsm552002ejg.26.2024.02.27.00.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 00:54:05 -0800 (PST)
Message-ID: <0b29d980-b3b4-4437-be24-19f54b473224@linaro.org>
Date: Tue, 27 Feb 2024 08:54:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Increasing build coverage for drivers/spi/spi-ppc4xx.c
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <qvuhez7vrcoui7i6s4yohd4ednneuoejcp6tw6iwzeefgpyvd6@fkwwtwozhakf>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <qvuhez7vrcoui7i6s4yohd4ednneuoejcp6tw6iwzeefgpyvd6@fkwwtwozhakf>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-spi@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Mark Brown <broonie@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/27/24 08:46, Uwe Kleine-König wrote:
> recently the spi-ppc4xx.c driver suffered from build errors and warnings
> that were undetected for longer than I expected. I think it would be

long enough so that we remove the driver altogether?
