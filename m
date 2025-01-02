Return-Path: <linuxppc-dev+bounces-4565-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D10B89FFB5F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 17:10:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPBWq2ytBz2yHj;
	Fri,  3 Jan 2025 03:10:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::330"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735834247;
	cv=none; b=EunoyI9jKi8mMrwAXXO6FOXMg/G7ollkCUJsOMBmpx2OMsuhNND5D2dwpAfbr5OyUIiiAgRZnSdISLNo8NIIf4pgt7ZHHnAZqIFaQ2AUpZRrwd7b9Xsj4lOd/2CjhwOp3F8ciDxHLwk4cy2lgVIOIFJ0VC+vBdKa9bUrQ3wTLP05SAeIidFsCcWf4aK74QN21A05vwo8Cdbw3KhBOFcXace3Jig9fmF0nXw6VdrkCdJbNjpDcFzsbp8hBlAjV6uAXFNW9R/+b2Tfkjxd1MZvrihFgF099cyO6opZRvUjKHs2I2PKudKq3MfN+/+qC1YKoUo6UV/cWZFoQB+2UUGO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735834247; c=relaxed/relaxed;
	bh=w2MW83ZlBEB0slMAIjVzh1uN6EJmqPsNX84g/jW2efg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ci/bIrI7liO4mvj7U+BZXn/7JBpeQVeBbV7APyw6elUl7M0MDQbdpFeXQO958Mj6gDiQjWIGl+tdtZNaVv7w4n3UZOSrxl9zHbECslZHkngfiBe2nbyKxN9h+FkLkzbLWOhmWllebu/+ZIOFI+o82IqSw2JjJDv2+c832BX074BVcP6aOnNmg2Z2DZEo6FGMV9YhGhDNfql7pOHXtybFEL4QcXHnGjkpSR7HH1sKoorql9fU3vtr+40jRzE6V1XT/JyGpfMOoWjBVCQRkwZU4QAcCo2AtQ0ipqkaXebIwPavR/yf2SHwj44W8yuuNoE+0f06IdZhUHru3lcvNE8tiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=H5N9G+pn; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=H5N9G+pn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPBWm71lHz2xbS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 03:10:43 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4361c705434so83681975e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jan 2025 08:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1735834237; x=1736439037; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w2MW83ZlBEB0slMAIjVzh1uN6EJmqPsNX84g/jW2efg=;
        b=H5N9G+pndP0vRbZL2O0Gsny1gk4CdjBrsjGuBs5P17jryFR5rc83Sdf1L9i3a4v8bs
         a1I3EZVr40KOTOAFPRFEQDlQnz/rV8p6V4vYOSGJNuy7KIgW+MF4UQxUh6oruig4DDr8
         H6euVTgIoxDtqEbGGp2LMFS9BhmKN0htgKnUS2lXtp1c8chCNOdBktKhCzkwq7qKgm1t
         8CrVrzUrItQLS73IfBF2owdZtxUNr1q6ymzoZCsshKtevvL9ux2Yeya2VXTvqI4leKhO
         9rqm2y9q22IKj4dZgNYs17hPX9iM9EGFBvz+PtnYYN0nXA/idfkHPfdBLtzmHkhyUTl9
         vocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735834237; x=1736439037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2MW83ZlBEB0slMAIjVzh1uN6EJmqPsNX84g/jW2efg=;
        b=ryownHzumUdXpoVQICkSnChu27Xb8D6NQsQu+oc6SFghZ9Nu50KHnz+ECCDbtZIdIK
         Eav8vzYzlEhbHv07xXn3Yt4pmUDU1E0V3K6w+WvW3knuKfkJTYXINLhQJ7YeHzpVIQtx
         e+WT3FZsUnFucHR6i/deXCIetA2/MDQYrboRnlFFqvyIOZWk8IheRxYCgffEXtVlkqA8
         D1G/xMsSZEIkIe8UOo1opvWWpWxbDx4QkIDhXNBoJFul9Dso/F++ctLhLvAoL4iwHSLK
         3YbbFx5ApjcWvNJXlhcVHpGEpsiAwxv3k3ZoVsopMJl4hEc4GK6GFNah2qT84y7w0ybh
         WE8w==
X-Forwarded-Encrypted: i=1; AJvYcCVyHirBI/rKORc0ibc6aJgQecKcX6dmdXFyMGB+hVyozAb2NbxkPbvzQEpNNQNns7gSshfNGGYkzyTGIAs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwdL+X7JkB6zlMcjUm3/JVCnhF+YgUWF0QGZdLWV2V6hoLovgf1
	P7ZZ/wwxJfVv8ycEl5LAeNryQoKlZcWEciNuM4muTbRL5cf9Jzu5UaMJ5u2QLDk=
X-Gm-Gg: ASbGnctnyUf3zDyiWkz/cMZDDanRZI9txeG8xM3TXuzdjknfNSAUv8MVP39/MhbrP3x
	Evh96/L0OOkh4A9eJiYga+AJBMpcGFRQh86o6fdhDhO8cW+IGeSROhRT9edRMhkfdjCNR+OyR0J
	sMWbCy7SAZpu9aCz2agJDoZgo5GRO74Cxj+rtV9d4pJoDnvgrwMarXDiXX2rI8OapQ1E3b/Tta+
	J/gf+ORdQFhg/sGlzJDv3PXwzH/M+JPE/S+3fuEQyJKoEt6D7Ym4Eii0g==
X-Google-Smtp-Source: AGHT+IErl4BqanoYDVUAZsHsogjaaRwncA1U/OXvBzPwYOV5N8q9kJ/EGpWxK0q8/x1dmkcwBA2jNg==
X-Received: by 2002:a05:600c:35d2:b0:434:a929:42bb with SMTP id 5b1f17b1804b1-436686464cemr420475395e9.18.1735834237013;
        Thu, 02 Jan 2025 08:10:37 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11aecsm489101735e9.23.2025.01.02.08.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 08:10:36 -0800 (PST)
Date: Thu, 2 Jan 2025 17:10:33 +0100
From: Petr Mladek <pmladek@suse.com>
To: wzs <wangzhengshu39@gmail.com>
Cc: dianders@chromium.org, tglx@linutronix.de, liusong@linux.alibaba.com,
	akpm@linux-foundation.org, kernelfans@gmail.com, deller@gmx.de,
	npiggin@gmail.com, tsbogend@alpha.franken.de,
	James.Bottomley@hansenpartnership.com, jan.kiszka@siemens.com,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	yaoma@linux.alibaba.com
Subject: Re: watchdog: BUG: soft lockup
Message-ID: <Z3a6eQHwjRdwnDXp@pathway.suse.cz>
References: <CAGXGE_JWtMo8Qs=hsH=NULkDRFoYKYorKHACpqvqpYiO3am8eQ@mail.gmail.com>
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
In-Reply-To: <CAGXGE_JWtMo8Qs=hsH=NULkDRFoYKYorKHACpqvqpYiO3am8eQ@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon 2024-12-23 14:32:11, wzs wrote:
> Hello,
> when fuzzing the Linux kernel,
> I triggered many "watch: BUG: soft lockup" warnings.
> I am not sure whether this is an issue with the kernel or with the
> fuzzing program I ran.
> (The same fuzzing program, when tested on kernel versions from
> Linux-6.7.0 to 6.12.0, triggers the 'watchdog: BUG: soft lockup'
> warning on some versions, while others do not. Linux 6.12.0 is the
> latest stable release where this error occurs.)

I am not sure if I understand the above correctly.

Did you test also kernel versions older than 6.7.0 or newer then 6.12.0?

Was the result random? Like for example, did you saw the problem
on 6.7.0 and 6.12.0 but not on 6.9.0?

Did you try to run the test more times with the same version of the
kernel? Was it reproducible?

I guess that the problem is in all versions but it is not 100%
reproducible. So that the softlockup happens or does not happen by chance.


> The bug information I provided below is from the Linux-6.12.0 kernel.
> If you need bug information from other versions, I would be happy to provide it.
> 
> kernel config :https://pastebin.com/i4LPXNAN
> console output :https://pastebin.com/uKVpvJ78

It would be great to see at least three logs. It might help to find
a common pattern.

Also it would be great to provide a full log if possible. Or at least
the boot part and few more lines before the crash.

Best Regards,
Petr

