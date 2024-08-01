Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 867E89442E7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 07:52:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MYWlFXaw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZJ5b3Yvlz3cfT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 15:52:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MYWlFXaw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=viresh.kumar@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZJ4w2YQ7z30T8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 15:51:58 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-70eb73a9f14so4944346b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 22:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722491514; x=1723096314; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7gBLGL+mmGX6AVb3elsBnCFrc79BJCRR+zjbmuB2kqk=;
        b=MYWlFXawjQV6XDFql6KsQ+PyplpcWyd9GrigI8IGN3Un2bE+U+LZ4N6oy9Zt9fYVgK
         yLaELbFSTJblkx0gFu7e0AMaz+LNIy3fA9IcbFqWtErw4oycYnP+6jTYwQNNEdzMH5rG
         Qh+OrngHiSd4Y9TjVZAZ90UD2lPvDS7cb8kPgCdhZmbFkHPXSXKBH4vEePoyxGgbOt0d
         p9HP+Sm43oVcK2sf/q8MXI19FQRnPRu9VVhXMsFPWuSgJx0XnmHqAoNSTYzLNzbqDUfg
         ojDQoAMwmUvIPU11xsdrwNU0yJvHzU2tHmN5MJufH6re/laJ96h9aDm5m6KZraLLQvtR
         PDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722491514; x=1723096314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gBLGL+mmGX6AVb3elsBnCFrc79BJCRR+zjbmuB2kqk=;
        b=KWO1km1/m3DdtTMUnuPjyhjtoUcbcLCX/ZC8VlIsdHjiK/lkEagvaq7ld5Zu/UkXlb
         cYHXL8zT47MKEZlHpFpGameEqaHofMpuQLmCMdS0JES4Vnht/n7YMEOp/Cz0H9bJXtJ0
         6mJJyLGp5mXkTQyvCAVsvGnYguFjEjHtULEA1swszoSNzSmlZas1SlEYTVeRzDIZXkOb
         S4joAgyKkHaE2eC56/qp8YY8bj1u+9NOKbkaToAD6ucyrQcnQsyDV5kQOWqvkSfGdPpc
         EuSbaUyd4T9xZ3YpKhuQfda2q0WPN4YTlfCENqDxGlIJ1591hRU5Vs6OcKxsrWaf/50B
         wLhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4YndOBUnnCkHDH5rXrzQGNBJGnJH5A5ckp1GVE0CmrPEge21HeFREgXG23Dnu99are9l66oM7+xXZGhUtW9HAPit2YUDpSyWZP6eFhg==
X-Gm-Message-State: AOJu0Yx94KsU3Jk5Bb0BdnPvQyms6n7eQC9raliB4vjg/L61+wxgh+9p
	UTh9Ux+J8PHzd13M8oGhuosiS1MYC4bVj3q2OXB54+LaTkMVaJFUaKnkJ4LNhFs=
X-Google-Smtp-Source: AGHT+IHi3LdaOVqsILRzUG5RajCZhFYqsgwTEJCbU7Q/0owEgSj/B+R4O+r/bPYrYZw7jZacX4sQzQ==
X-Received: by 2002:a05:6a20:ac44:b0:1bd:feed:c031 with SMTP id adf61e73a8af0-1c68cf30d2dmr1821935637.28.1722491513712;
        Wed, 31 Jul 2024 22:51:53 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4add69sm2325862a91.47.2024.07.31.22.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 22:51:52 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:21:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Subject: Re: [PATCH] cpufreq: Use of_property_present()
Message-ID: <20240801055150.ojas7q5w5jzhmeut@vireshk-i7>
References: <20240731191312.1710417-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731191312.1710417-2-robh@kernel.org>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>, linux-pm@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Patrice Chotard <patrice.chotard@foss.st.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31-07-24, 13:12, Rob Herring (Arm) wrote:
> Use of_property_present() to test for property presence rather than
> of_(find|get)_property(). This is part of a larger effort to remove
> callers of of_find_property() and similar functions. of_find_property()
> leaks the DT struct property and data pointers which is a problem for
> dynamically allocated nodes which may be freed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/cpufreq/cpufreq-dt.c           | 11 +++--------
>  drivers/cpufreq/pmac64-cpufreq.c       |  2 +-
>  drivers/cpufreq/sti-cpufreq.c          |  2 +-
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c |  2 +-
>  4 files changed, 6 insertions(+), 11 deletions(-)

Applied. Thanks.

-- 
viresh
