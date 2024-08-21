Return-Path: <linuxppc-dev+bounces-289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CDE95A7C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 00:29:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wq1H63YMgz2xjv;
	Thu, 22 Aug 2024 08:29:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12d"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G+Wy1Ofx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=sergei.shtylyov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wpzc05CQyz2yF4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 07:14:23 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-530e062217eso155944e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 14:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724274855; x=1724879655; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QooDqJRC0GZshqLk0M/j0h7f/ulZAlj1gu5iEd0f5RI=;
        b=G+Wy1OfxbKphMr6gM8wmXEq4I1Vbsvos1wQvbhfnEQhID8zsJTazrOYVcepxmAMpWi
         0Fc9fvaSR9cDKIis78GcVWLFc70yJ7mAg/VWL0uC2QmnVN47F0QpitqqlQcQjnM9r5Kg
         kE4dhAa3zAfQtQcaw7N1zg2s7o9TI/MeQ2N3Z5L7+ajfnriIkR3dWzhIs5GexNjP6pB+
         Jp/2soncVC/Hggbt+V6LzFXNlKDt6TdOrPTYsmFn3IBzwoRPejd3/wTjpvWvd2zkYYIJ
         0M5uN/soHfXzRboqejQW7SoP6si/tj3bK7kRrTmWyW6aPrFG+XlMZ3OfsKIpA6qIBPyG
         3KqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724274855; x=1724879655;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QooDqJRC0GZshqLk0M/j0h7f/ulZAlj1gu5iEd0f5RI=;
        b=e8L1IGn4e0MEMeo1km0w7OoQUfJdZQi1Mf31HOYlptgpTksufQpN0jZ08aMql2qgJp
         H0YoL/t34fu8hRPzQdKc2wzeixlBXbOU/VQfw2+buBlyNZ1IdsWWyR8btwRAlITY0HeK
         JYuT4hk8YJzcaUjRMp7ps8k7jOKFRW8bWEWeYafrtI9CY40JZNmq4I/JolJ24SUej/Vz
         VgtZrPm5ikRNs2cV+jGkq3leKO0/DS5f4fTUrGyozkZa2zkWjACAfJ6I715i7EVxx7hf
         ix4sKNzxFM4DWc6xLQ74IYpMLKC9jGLWCYJgFKZJBTwiHtgDitf84a+DFcMVOXR4CIAp
         0S3w==
X-Forwarded-Encrypted: i=1; AJvYcCVbdUH70CZKlU30cHzh5bPOaHN2aLWYeLhWcMdwI9OK8wUjnuVN0HTkOv1HFx5pQNEPONb0SIp58zVR4Ss=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZWBONOhw71s2vTWczjeuXQjbEa89OIAIRJAGvr5h5+Em09U22
	Jz66evH8RmPefGtt0cy68yxS7X2duxdxnEgogPKlt0ZgP7yT8JaR
X-Google-Smtp-Source: AGHT+IH9hjfvv1bggZJwWg4QtFtjrRkHo+ftqZCKHTUhTarOgJz3RokmUaFChJ/IHjPxYMzkP4zsuw==
X-Received: by 2002:a05:6512:1088:b0:52c:842b:c276 with SMTP id 2adb3069b0e04-533485fc7ebmr2423183e87.53.1724274854587;
        Wed, 21 Aug 2024 14:14:14 -0700 (PDT)
Received: from [192.168.1.105] ([31.173.81.178])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea88f27sm8048e87.256.2024.08.21.14.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 14:14:14 -0700 (PDT)
Subject: Re: [PATCH v2] ata: pata_macio: Use WARN instead of BUG
To: Michael Ellerman <mpe@ellerman.id.au>, cassel@kernel.org
Cc: dlemoal@kernel.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 linux-ppc@kolla.no, vidra@ufal.mff.cuni.cz
References: <20240820030407.627785-1-mpe@ellerman.id.au>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <6b2208d1-c18f-14d5-e6d0-acd5c82b4db1@gmail.com>
Date: Thu, 22 Aug 2024 00:13:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
In-Reply-To: <20240820030407.627785-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/20/24 6:04 AM, Michael Ellerman wrote:

> The overflow/underflow conditions in pata_macio_qc_prep() should never
> happen. But if they do there's no need to kill the system entirely, a
> WARN and failing the IO request should be sufficient and might allow the
> system to keep running.

   WARN*() can kill your system with panic_on_warn -- Android is particularly
fond of this kernel parameter but I guess it's not your case... :-)
   Greg KH usually advices against using these macros. :-)

> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
[...]

   Please do CC me on the PATA driver patches! This one circumvented my review
(again)... :-/

MBR, Sergey

