Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C208850FE7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 10:46:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.a=rsa-sha256 header.s=google header.b=PlSLxamd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYKNZ2skqz3cNt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 20:46:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.a=rsa-sha256 header.s=google header.b=PlSLxamd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=linux@rasmusvillemoes.dk; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYKMn2tYKz30dn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 20:45:56 +1100 (AEDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a2f79e79f0cso459001266b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 01:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1707731151; x=1708335951; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bV4cEl8eqJocUFlkfdXuhYFIA23ZZfBFtqghyorQNs8=;
        b=PlSLxamd7oMwxzfmggLX3OeYte3x8+BaIDQwv0rdQT6lyh5xp8zFYRVCH/ghJC90+4
         1GxncQfkHwNzBHQrLaGJhtSMvEZrmGAT2MFiONT4SF8i6OZPu443EYWMOv3KUvYSDlZZ
         tM11EdSMulRRSKjNZ3pQhZS8+jHj6AnnPQJzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707731151; x=1708335951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bV4cEl8eqJocUFlkfdXuhYFIA23ZZfBFtqghyorQNs8=;
        b=hWLwxKtpkQo1L7oOCAwdsPmUpevZBMcN1uN72mi6LdDdyKfJzJUIHpb8RgMqNwYs2W
         VLq3V++V5zF9Xk3KSVmoftZ30WZv0QJyQ/8p7/T5RJ8QyhnALmdEMoUyj81LdR/iz6XI
         wq+9WO7VY89ApsNdcyalBxKXwsP1zp0wIqWDIJDqmVt+tGwsOfQbbYypaqAL1lvxB7LI
         Wls0jXAetD8tcjCueWz+a3uTbvSkOr8xuSfiRlFrzlMSreLGYB90ci6+uJqxmbhHfkWz
         XnN5FR6sbprnczph94H2cywpk8iqiyysx1WPsM9WO2i+BU47htoRUIhtrwGIi+NGlQ8E
         98fw==
X-Forwarded-Encrypted: i=1; AJvYcCUuzqG+pmcqsMmN7r4jR8EwB+s6zhfsZBViFTy4Xtyzr1fBIsZ0uItdyc0NG7DECKLmDSkhfrD2nPvZfyAEz1+uGJQr9KRvKv4oFiD5wA==
X-Gm-Message-State: AOJu0YxeQc7U8RomEqp5/evry9DLxd1QhpCaFdBRI+gskDCYnv4oDVpo
	QGlxO6em42QqIr8Wd49wIeRYO5PuZ/iMuGl/o2/9/b1AR/eHYQQf+bdMtSc0I4I=
X-Google-Smtp-Source: AGHT+IGg9tRYxHX2ne5RUejoxgjNLuWm7IJuXq+jQGsYUF/UDKsC1BWQYq73kligtx67FdufyYx4ZA==
X-Received: by 2002:a17:906:110e:b0:a3c:23b4:e99 with SMTP id h14-20020a170906110e00b00a3c23b40e99mr4875586eja.75.1707731150654;
        Mon, 12 Feb 2024 01:45:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8131LLFKVmnd//P84XQZ4TM3k291SAAr5rlr+aco+GyHhalP2yDZ1FrvesS0LRgsXOn09QwIfxlhScddCcjYvkngXXTOfhuspMdVUvXq5xufRSNAaU2icj3vLIenGmg44+sk3x86knnboiKUC6O+H+nQzsZ9o2vB+xvMst/X1kofo2PxdYqPXVcWpskkhFoV4nhgDvyNs01vFZNPvhPOGzypnBXDwHJIDG4jDEAGCT6TPBwTg/PfWxIFSUDxm3+tYS03x/DmDEmXkzpuwxRr/YKWqN5MT46T/a4toJ1kUubKmj/nKfAyZXhSXRITXqnExPhPvEz1WECP1l7fGf0ZqHYjwzEBDEb6QCjsIVV4oV3vlNnOqYzuzSWYkRDVR9SJoqkTXFNpVJHtGHArgforDW2IWOXc6J3OquXKzDc0buK0BnUT/l71jW5epBmJLOSXPjvnUTAUwmd9g5ORIxe5JaCTnhVY7
Received: from [172.16.11.116] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id y7-20020a170906558700b00a3bbf725080sm30312ejp.55.2024.02.12.01.45.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 01:45:50 -0800 (PST)
Message-ID: <4ed6af49-610f-4df4-ae06-22a85e052dbb@rasmusvillemoes.dk>
Date: Mon, 12 Feb 2024 10:45:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND 4/6] bitmap: Introduce bitmap_off()
To: Herve Codina <herve.codina@bootlin.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Yury Norov <yury.norov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20240212075646.19114-1-herve.codina@bootlin.com>
 <20240212075646.19114-5-herve.codina@bootlin.com>
Content-Language: en-US, da
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20240212075646.19114-5-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/02/2024 08.56, Herve Codina wrote:
> The bitmap_onto() function translates one bitmap relative to another but
> no function are present to perform the reverse translation.
> 
> Introduce bitmap_off() to fill this hole.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  include/linux/bitmap.h |  3 +++
>  lib/bitmap.c           | 42 ++++++++++++++++++++++++++++++++++++++++++

This patch, or the next in the series, should include a diffstat
mentioning lib/test_bitmap.c. And please make sure that the tests
exercise both expected use as well as corner cases, so that the actual
expected behavior is documented in code and not just in prose (which may
be ambiguous), and so that behavior-changing refactorings will not go
unnoticed.

Rasmus

