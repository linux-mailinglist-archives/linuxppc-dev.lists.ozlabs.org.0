Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 717A78C65D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 13:37:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cryptogams.org header.i=@cryptogams.org header.a=rsa-sha256 header.s=gmail header.b=QYcfvr5q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfWQx6Kwwz3cZt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 21:36:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cryptogams.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cryptogams.org header.i=@cryptogams.org header.a=rsa-sha256 header.s=gmail header.b=QYcfvr5q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cryptogams.org (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=appro@cryptogams.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfQt44R4Tz30Wq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 18:11:38 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-51fdc9af005so10543182e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 01:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1715760687; x=1716365487; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nadn3nJhbpbUcGRwW1AG+AKX8Tqss/4B5lqeqiiCsI4=;
        b=QYcfvr5q+mpjaQfsNuOitAdXwXFxF8No0OWxFyvNUufR2fb14PfGkeh8t43QLWbYvO
         Elx1CR3ogRJsRwwzLzF79+FCebi+QAqtPxu3clzDZEw8jEtlhCXuI0HZYQe78UZy1jNF
         p5U5FxoNxM7wtQVTHlnXtwFGMXJWS+jAIpgDUBXj9MOGA0Iur410aLHu6SxPTBHbsVFU
         GyZwa2EovYMRHFt35EXj2+qCHbNaFsZWLYvUT02pwd/LcrHjuFvVrD5LQW8G6FfycxFM
         LQVz9syYiNxi2c8W3M032dP9489zWr6bfYUlOl+DOcAVSJzFIIV82Q5xFWKKLA8rAA2a
         g5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715760687; x=1716365487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nadn3nJhbpbUcGRwW1AG+AKX8Tqss/4B5lqeqiiCsI4=;
        b=cguUQoCcDIu+0ScTvkg92/jwdeldRODmcv5LCT9++uTse+ZaeYad7ojyWFVAFwxzoH
         uolMNmxgt1RPOlfhLixt8Kb2DOe72oljtENgvNCAvHfeUQlGHCEw2UmRJAHuI1mGnfi1
         5lOKIINrfzTiVbNmlgp6I3Nw1k6N/N8NcY1O5uqus9vhJe7uajz64wisXoN54kStv4o2
         Le8ZP2BNqPtT3sDGKieEmV+i2hIQjcwdOhgzUxXWiE/yBCxmfOS79K8LY/ac8maUiuOJ
         y5nwiFwmKTqUMBN0eh8z8k4QIanu4jGQCA1VJEmuZO5N1W6WF6aeQt6f6/Tn3wF+N3Nw
         fTow==
X-Forwarded-Encrypted: i=1; AJvYcCUdttd0sX/jjQVVqcTk1E4sA47ewuFwQL4pSu+HE3OGqLr9hID4300mYC1wkdqOQPrH70i8N47b9xq59HCruK1l3dopSqbPwgDyfueUUA==
X-Gm-Message-State: AOJu0YyUSZoDOjWBEUGUCcKln7dK3Hd4ZQCRA+xqxn4b97UofkJe6klz
	JhzargsCShB/yjX+zTMw8K1CZyuNejW0lDxt0LMqcq8tGMNaHTosWu9Ou8HWcGg=
X-Google-Smtp-Source: AGHT+IEm4tt3o20ljc2e1O4yFuBQYTb/i4s4EPsBk0XZkzFkv52SwrrVPTrrVXZR+8C3wJP6qscL5Q==
X-Received: by 2002:a05:6512:61:b0:51c:5570:f570 with SMTP id 2adb3069b0e04-52210473d4fmr11529720e87.59.1715760687525;
        Wed, 15 May 2024 01:11:27 -0700 (PDT)
Received: from [10.0.1.129] (c-922370d5.012-252-67626723.bbcust.telenor.se. [213.112.35.146])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ba8e6sm2400086e87.108.2024.05.15.01.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 01:11:27 -0700 (PDT)
Message-ID: <dc5aadc2-308d-4f24-8a59-45da21b8b2e5@cryptogams.org>
Date: Wed, 15 May 2024 10:11:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] crypto: X25519 low-level primitives for ppc64le.
To: Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
 <20240514173835.4814-2-dtsen@linux.ibm.com>
Content-Language: en-US
From: Andy Polyakov <appro@cryptogams.org>
In-Reply-To: <20240514173835.4814-2-dtsen@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 15 May 2024 21:36:22 +1000
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Couple of remarks inline.

> +# [1] https://www.openssl.org/~appro/cryptogams/

https://github.com/dot-asm/cryptogams/ is arguably better reference.

> +SYM_FUNC_START(x25519_fe51_mul)
> +.align	5

The goal is to align the label, not the first instruction after the 
directive. It's not a problem in this spot, in the beginning of the 
module that is, but further below it's likely to inject redundant nops 
between the label and meaningful code. But since the directive in 
question is not position-sensitive one can resolve this by changing the 
order of the directive and the SYM_FUNC_START macro.

Cheers.

