Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D2F6B6E6C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 05:27:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZkCl3Kg1z3cM7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 15:27:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jf854F55;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=viresh.kumar@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jf854F55;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZkBp4j6gz3c6H
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 15:26:55 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id u3-20020a17090a450300b00239db6d7d47so10364530pjg.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Mar 2023 21:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678681610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZHWeMo3uo490fL7bQ85wx0a2LnkR/8UzG/czZchrf8=;
        b=jf854F55Vcq7F3Ut9aXZ26+FT4AeDCHj0bX8sCxH5zNW+qvSFvsSBGyJ4JA8Pkd7AJ
         sKpIdflPJomeeVa5j574TP7GMnt5LJBTtQaZC6ZqZSlIZMq0R1jfnSJ1QsEAU6qUqykk
         Yomo+GoWszjl0CWdDAoO96fsojhNqQg9MMRrO3U0uI4SB9tdS6Fmwr+BKlyVHQjgGPjP
         lmUDweFuGcWul7UTPlyP1Ve5lxLxR5OhwcUoMCXDQ8uSQGisjsuoHl/yf2J0TWjPWt3c
         uWM0ZPv8hjy20fNpr2Ve0LeDF9uAM9yQ/ZxS8H3a9c76iOnr1yMeUYyahIAIyvUPSKrg
         HAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678681610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZHWeMo3uo490fL7bQ85wx0a2LnkR/8UzG/czZchrf8=;
        b=MYksUQ2IyavcucXTH4NKvfHPYKwJ6QLIwZBUoyJjIDzTtRCxW3m4b84ZFQkSLBnyTq
         kTV7OFNdoseTkOeJHbRmjliVHBTGatvL6tEMACYYkItxC6aX1rlzStXdnTbVAu7tOBN6
         zq3zlC/y6nF0B4f/yLuxZ61xqDDLhlxhJhUaz4rfuAthB7yzCSrl0uxOOXYekCGcqHPh
         yzTe4290IbbK6PJLkN1R+wFAskjVTzgqeTpKNLJut4ycfCXUJTjgDuxFixd/ntbozKOZ
         906qRN4zrNtGZhrfQ93qkEDn6fHyjEmjyoqulW+oaS2UpQsi1BzDkhL1QS0Mr8Qwb9FI
         xpjw==
X-Gm-Message-State: AO0yUKVC2v103NVtRsz1rEzpL83C1CjRo26guAfOBWGurXrqAmb6EFek
	MJYvBI1q3kVVB4f7s/OTzVaYsQ==
X-Google-Smtp-Source: AK7set/+pMK+r6zFCsdx7eazA7/dKXtZtSLa46F10nMT940SC7ngN1rfMa60EgFH/xH708++tgZ7pw==
X-Received: by 2002:a17:903:246:b0:19f:31c5:1848 with SMTP id j6-20020a170903024600b0019f31c51848mr6116232plh.27.1678681610031;
        Sun, 12 Mar 2023 21:26:50 -0700 (PDT)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id g12-20020a170902868c00b001964c8164aasm3594614plo.129.2023.03.12.21.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 21:26:49 -0700 (PDT)
Date: Mon, 13 Mar 2023 09:56:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] cpufreq: pmac32: Use of_property_read_bool() for boolean
 properties
Message-ID: <20230313042647.gkth7prhopaa7nnq@vireshk-i7>
References: <20230310144703.1541819-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310144703.1541819-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10-03-23, 08:47, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/cpufreq/pmac32-cpufreq.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
