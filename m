Return-Path: <linuxppc-dev+bounces-913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59392969D1C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 14:12:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WykyH0tMRz2xSl;
	Tue,  3 Sep 2024 22:12:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725354193;
	cv=none; b=FtiD3S+/JL+xSUH7GGvrDhny/yzLRXlgRww+zOeXC1MVWlt/6pKJO14xtrEVYY3dmPZbys0MYFBERmtMgtYfyBp6kTxF3eSy7BFwXs7WFORbpYdSrKfk+g4z32dXNSGaIJGepg4951rm369pSVajhhqzVvkXwcN6A8AUl8qJ7wm97ush809wWL2ckmrWph1E0A9HosnXXSU7gGsUCNVHOCY1nc0FxZDueI66exLjL/KIo2cPj88IAXC3c4mTBUspG01QahwlGJU+gKnu3kL8tBrTeghq6S0ixt2uQQRMahNddk/ZieMrC0Y8xYjCYWmG/i6xBCGGLPs30ctDznkFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725354193; c=relaxed/relaxed;
	bh=vXMjQRozUzAfZtDGQl5kmRCarCMdJrz35wUmsxbqBGY=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=E61oZxrWRzv9Hesq1UyD3Ej69HnZ7oV1VT4ugP+oOXQl2Fo4DQEGid1O7dJrTfAbE3VtulJBCS3voyT/umLaYiMmIgZ1q2bV271bzskMJc40Qh3b3UiK38F0tL7e73u8uTt2u07ptTMqidNOuO4vuTIlkisJ3FywE+zHs4ZnGyS3KsLGUxkFROELyD/jPVTDw3UJc26h4IgdDFIs66UsuqqVfL3ohHNGf9VfHYf/Ygojm8v5ap5cPLjrrEm8j25Bs7zSckWr82cS98+i2JgLg+mDS5meC7wEeoIgQw9m8M95oZ6F9kny3o0U7HMUwJjU/RXUe5QIxhymFYtmtqCvMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=swOLosvC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=swOLosvC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyfmJ4pWSz2xTR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 19:03:10 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7cb3db0932cso3810884a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2024 02:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725354185; x=1725958985; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vXMjQRozUzAfZtDGQl5kmRCarCMdJrz35wUmsxbqBGY=;
        b=swOLosvCiiiCRPthvTuuT2+gLpwlHJQpj1RtTTtZuivxt+oELEbzO0tuAGU1b5yspG
         hq+z5x/4s96aRePFleGIQ1LQN6ukyi8t4d+ELnunIpj9ha0CLbUTr77BJlJQM7G0LxZB
         jvOeAHjayYMJrmYxd/n1Ha9o03b0XnsIw92z5Xx7BEhrjMp5+Bn+tqJy40qZGLAjGQVs
         b/lpnl5G0H3kWKv7s5dOylu5vc7BO7jpDhoF1mkyL3Tp9QB6d5lzzU6mUR/mFpC2FefT
         euku7rwOnCOJu4qXHuEd03otJj29XkbzKrSUoW1vaSF+m7kJHJmAUsK/fzoFq9zyrw6E
         MTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725354185; x=1725958985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXMjQRozUzAfZtDGQl5kmRCarCMdJrz35wUmsxbqBGY=;
        b=AIZp21j7EixhNyS3NXUvZl7lw+Xn1Sz9aaC6OwRHJokLV1WrKYW//166YK5RidwpX5
         rZObhAgCVfUEb563CrqesHt4ATg77oU1PLJfzHD11pOz8k9+w384zgCStwLuGEalClLr
         KvvrApRW3lZEmeurxxMdkXveVQNg5w7gVR5cqcJSS0SQ7riz8v0KoUUXNa1x3eviptb5
         WJw3IP+pnAhH1aKZ7VNy5n9VZE+ZYizC9ifrFVXii4+FxfR4S3p4TxGPc582IhCUDKMQ
         w3lbENWjSwSjyHZ7OPeM3Pu/AFzmZIkZR7gFlwK1tLqE8zQYmYgQc2uNTyXg71dGRTBR
         c/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVD1q7V8qvj4XXeU5dn/5dNbwQqdfzFMw5/pO69UyjtPbYq0KvN/kD2S7RJPRIrJrbHlg0cEo/3Hk0Zj44=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyqGs0wUcYzTO6OzapJaF6TGftupxgMNYbvC+2oJ8N4JfZOH1Xv
	A09yvev+NZsif7ZWJIydx+0M0NBhRdBqpXiQ/rxx7VWj+Z7ULFZC1eqGZnPD0ws=
X-Google-Smtp-Source: AGHT+IGbzt8vUGrEk6tocF11V7cRb1xoAuI7nhEIChNefDbTXr8mJQYLikgxuEKN2ui2+XiiLzZpXw==
X-Received: by 2002:a17:90a:2c9:b0:2c9:7219:1db0 with SMTP id 98e67ed59e1d1-2d85616ed48mr19057360a91.3.1725354185405;
        Tue, 03 Sep 2024 02:03:05 -0700 (PDT)
Received: from localhost ([122.172.83.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2da5932d1ecsm1320793a91.43.2024.09.03.02.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:03:04 -0700 (PDT)
Date: Tue, 3 Sep 2024 14:33:02 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Liu Jing <liujing@cmss.chinamobile.com>
Cc: rafael@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org,
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Fix the cacography in powernv-cpufreq.c
Message-ID: <20240903090302.j7znk6icmztf3dnf@vireshk-i7>
References: <20240902082816.2599-1-liujing@cmss.chinamobile.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902082816.2599-1-liujing@cmss.chinamobile.com>

On 02-09-24, 16:28, Liu Jing wrote:
> The word 'swtich' is wrong, so fix it.
> 
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
> ---
>  drivers/cpufreq/powernv-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh

