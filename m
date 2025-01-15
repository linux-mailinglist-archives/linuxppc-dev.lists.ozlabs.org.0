Return-Path: <linuxppc-dev+bounces-5285-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D38A11A94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 08:13:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXxzF3c9dz30CB;
	Wed, 15 Jan 2025 18:12:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736925177;
	cv=none; b=gcDj8/IXuH8eRV+tHEdsqYqy0YjqpF++UBCaSAiChp3logi1gTwWvy2oybZcPPQydpTwZTlfAF0oz5gTLFgh8ThfkRCIZ5wKTyyprm/I9d6hVjmWyTCl4K3X+B6pe374zc1ztlYpMNoxwcHWFSQf/mvP1AgKiW3Wmpsukrj9r39Er8JvNpCo75Gb+E2HVbJDio7UBW7BNa8nRatP+qJJ830MDOH9zvfRS/rIDKc2rifEjhale4Y3Wktd4qARDBY+9/4zjfZvhqkJesOmi1dZrtTsXG+Pko2RT3D7crt0NJLp4d9Z7k5jZyIJLrR/t5uqrHL22TZOxUqHR4kpW1OGPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736925177; c=relaxed/relaxed;
	bh=O8HHF6MYQA6CAOWThaq0m4Xv0t8b1zLcaJQ7xxZQmfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjaJ8jl4nNvJI5tgufDVETWtGbyCLydwuYxPg7I1L3zzSNDwrN0X6NVejcWeKdGrrrq3DcW0ZxDTUq8BH+ArAP+kFJ9SzWoeqYlQD1VANUMsG9Zd/uUi9PZ6DMkRZsRou6Q7jYoDI2xeUbaFLIaQdRnnQb069IJEDJMp228RWj4bCovkUOqo9xK7v7W2Rep55Tw53B/1ZmMuAAAHl72N816pQvly+DRnZaPfyx0ouBlIUJrzYe2PSvoa848eP5sSgIiQY0J+jVplirdqQDOIqBGv75s5w42TERDWEP0YM39+koghBXUTZG995z4YOzjTd+Tc/mT+oduyFoIOxPaNeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wULpECCl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wULpECCl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXxzD4HjGz307K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 18:12:55 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-216634dd574so74553115ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 23:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736925174; x=1737529974; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O8HHF6MYQA6CAOWThaq0m4Xv0t8b1zLcaJQ7xxZQmfU=;
        b=wULpECClvWSYRY8G2lWxx+x6M2XI5iCUrhYL2YyGHX5lvIwfGVP8yO6ksOOOYvd6k8
         ZzcsI73Nxpfp7RfNOJkRO7daWOvu/YwYF4TrKW1k5ulpn1XFklD5+DHtQOjOpjY1w0xl
         X3RhyQSF9sctl8L9HajyFMPwOX7kBts/uBKzNo0/iXL/AGMRk6YGIRbhpEIDw0dIRkiM
         VUqlsLmutuypjrU+J5ESzcXxvfSmPxr2K5uqI10yPdFcFGWkmpTncCgsEpNgn/O6uzyN
         fsoiek7PnLIOZB2iByKGg8qClhcNxNkqrzP4aW+Ki6VGF7lzkmMA99tCFvNhDN+mYkJg
         Y1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736925174; x=1737529974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8HHF6MYQA6CAOWThaq0m4Xv0t8b1zLcaJQ7xxZQmfU=;
        b=BvwtxMpznwzEU7oR0tybCtDJ8OfVUF2bYP0jmh8/clLJx9loUTF7qlNyPSAtYJvMjS
         EOJKlBq3MVS/GYT8kFxQpI1+UWiA8/K9CZ3mtv4W6G23r0NTvCf9Jjrn6hW6oNL0S0Hz
         kH5WSM8WHSjxoX3YJfKtTdKzLl2LUbMUiX3gyh8PZoyUKsP0Uy+6CZWePg9vvPEhwFpD
         HwKUr3NnIf+ljwKuRHS1Cf1VKeg32KJPMa01IFAOYyO9l3rVcokKL2SsHzoNUTbN++M9
         4IIzDjF55Z1Q/sMhqDp3B6uKrqdkgxKe9lQJIDLc7wb43YHbJEJKWG/9hiE3NjMyX1Qi
         fHKA==
X-Forwarded-Encrypted: i=1; AJvYcCUjzFVwQgPFfv6v4VC1MEkzV/OJgO8N+QBP6wGgUMbCsyAnZG2Q286G7xmCMUrSvX/zLeVLBEcOCZtzPs8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxou4w5pmxOmMAHxYVUK5CO1AeOl8F/5lw4FkWewPscioUzXlRU
	PIoI2Ez4NOSUoqfpxVMPfDf80nspq1283SzR75WpBSkxGxhVaWKSn7O/ANdeNFU=
X-Gm-Gg: ASbGncv/R5CslKYwi2jlQC+2hUz/EUlPXFZ8lL6D/COyXMm1KguJ/fcvRbMr18SEOkC
	xSVN/pX4XKUzka+mrNPG1Ja+Yxiy1SB3cxS6uk9q+ZqeNzn6JzsFQvwUeiP9BY8AvxKqzvzq55s
	x2Iy/kfHAP9BIWayuEMwGQboU1x8la4EvHsG46OHTuzWthz7QhOYtKT0RBfjPTMWKRac/6fKSWQ
	AFuJRCCEsgfvX4duLOmD8Lt5tkAKcJHjk+2cGPOrDyiYje/Y1m75Mj8+pQ=
X-Google-Smtp-Source: AGHT+IE2T/YITMwdTXu7fGoI/VNncgoEDza43yvfpT31YZbr+6WFdwjMNUDo/e4NJFzh+zf2/sHP0Q==
X-Received: by 2002:a17:903:41c3:b0:216:18f9:528b with SMTP id d9443c01a7336-21a83f6299emr406121655ad.26.1736925173712;
        Tue, 14 Jan 2025 23:12:53 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22dd30sm76804695ad.171.2025.01.14.23.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 23:12:53 -0800 (PST)
Date: Wed, 15 Jan 2025 12:42:51 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] cpufreq: Use str_enable_disable-like helpers
Message-ID: <20250115071251.ww6z2h2oj2v56sbw@vireshk-i7>
References: <20250114190600.846651-1-krzysztof.kozlowski@linaro.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114190600.846651-1-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 14-01-25, 20:06, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

