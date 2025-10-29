Return-Path: <linuxppc-dev+bounces-13479-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D6BC17F12
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 02:42:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx93t404mz3bfF;
	Wed, 29 Oct 2025 12:42:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761702170;
	cv=none; b=G/UJUnlg+oGpebSpffaIEI4Qv9Mrv2/Vy16w7FZh5bmj1iVtz4m46UC5P5fJ5Qo8kEKeLy5PSfi9JjFDkfDfggxqHJ91TAVP2bHZKyqexE5FiMquI9GqKV5rLU1ylJkbkFQyZkr353AK62vvwqrit/mRrdsSB3n0rxtHShEeBb92gQuhfMn27NIYZQ2hipOwOJCJ3ivOSNhluSVJxOcNozq/nXTYNdIguikd6TPnwV+xro5KeVEioPeWRoNmLogP+AoH8+Dqita5KWBY4TNCu0dQkhPrTgjDXWpQPMyPMEo7McdSPdLL7vtUm7z3zi+W8lGvg2kTD6ky5mSMG4fpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761702170; c=relaxed/relaxed;
	bh=EWYacNbOuERW4OojK9bgZfknBThRIQSN+JVixz2GaWY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=J1JNOeouNivLCRSwriL3MxLbNaq+9bSn0pPwLw6jOA66Yh/cDeBBpsrct5M/iW1H5PIC0f5zrVY3t/SKorBCp4aT+uw7S7jUbO8daTAXKEhfi5KzL55GzWzJsFog5AuhIdlzFYaRQLebm7c9F3rH9q9douelTxFHoUbq71bHhEi8wml2FZCRvFSDXklxa5pw8rzKhVUXBM2J9G2meh7e5UnUD02OSX55e8s2viMJV+pZ2tw5VM8PJKGtTHgr4Hl2zWS6hb02/5VAAzwTPfqTq251zf2tM/21MoLFm6V8EE1EtsWPv7m5m06a+idtwy0w/XHtMLGmamyr1EhAw8ma0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=eplNVRJU; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=andrew.cooper3@citrix.com; receiver=lists.ozlabs.org) smtp.mailfrom=citrix.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=google header.b=eplNVRJU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=citrix.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=andrew.cooper3@citrix.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cx93s1bQMz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 12:42:48 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-475dbb524e4so26672915e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 18:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1761702165; x=1762306965; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EWYacNbOuERW4OojK9bgZfknBThRIQSN+JVixz2GaWY=;
        b=eplNVRJUtr46S0KhlmPrTsl39X8XFcnvEkTkXmtCWBEYa8MuU9bLomEiKAIOUJ8SAR
         LBoaQu1JkyFE32wdew/nZqzB1jvq/xloK7mMn9+8jkdeIRWka1tWCNN460XrYKHl69k6
         WsOEYc+lj8+lyFyHFmxRKfslHl42jDUUhPdX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761702165; x=1762306965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWYacNbOuERW4OojK9bgZfknBThRIQSN+JVixz2GaWY=;
        b=NTkBbBk/GCKHjshUNKGnCSeyv+DLKcw59+bU4FPsy1Q4sfUE96Zo/EQ5fpAURDpmI8
         ebyEPuQckaiTA8ovXGaf3DGiEDa0Z3YpSsR4j/hhbsOuGaJO8CCQOOZki36D1i9aLuAy
         Jm/BtBgJBfOwXulC3wIZQJn0iN9VTWfQCl1utEWSU0WCfQR8fVGjHe4J1jRUIPaR5+gA
         wfbcVVJYSG15Sb0Y0znY6X1xBpSgaPJ1CtIGnA8PJnnmjlfnbSZqzMOGT3S8mMLKPb4T
         HhA9VMZ4h+41xJQcJJzxW9k86NgVQNEsLMlvCLX+8DhiLmZSLRX70J0JWmYS5+x98fsB
         6awQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX5Grr/VH9BPWT6A9j/c9PLB0Oms8OjrhGOneovboVW8Eik4SNaEJSXHrmF/54rl/uLSRyU6vntS4V8TU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx0LW14ZKYxd/ETu7WBoQJCEcrQXehZ938AFli/ypru77f9XkD/
	mhVA7cBZZYeNyDxGofiuVdpDVrebiEVGa93rEhemc8drwmBpLs/cbeF4yRWyoWeOiTk=
X-Gm-Gg: ASbGncsujOqKLKsRjklNrRraZV4G1omd3VT8j5nSvJ6uWSn9LJqocGvjJ5IcgurGaza
	IdqJIpPp25EQjfKnOwrueS/pjSSTcwTBvs3Teg9h6Ixw6xzdt7SSTxaFXyymg4ZAvc4tl0qgH4t
	pi3WN3jWmrIMxkgybRaxEbcO66IHrg8f3xqwYCVhIFnExz/Sto/ZAXGT4qJSZTageMWNqpQdjNm
	F3YfHuiY2iJiAO5tD3JwWY4WV6H+hEpzaitRdAfa0mrqCKCzrvyCX1mFbVRYM9QjInzYpW8nunn
	woVh4s9Pz7RGr/GFrhvhDcc9TzheM6YuSqGRBqK60wi3KE5gmdrw3fOYmQ94FeNaKtlJZJ0NT9V
	yTGSPNI+RYTF8BMcRLQHyCZAi8omG6uIr+6zCYPDvVfUV9LRfuWcf4bIl17BGhb3/Fg6sADHB5H
	fXK719KYmXpB/YDCB+zOF74rG4XEll3M2Cditv0cdh/g==
X-Google-Smtp-Source: AGHT+IGqI9jtOex3Utdbx/Z1nQq99SV5FMBT/ydoR0q3MNA+77+i7Qo+Sb3m9MO+Mv1x7c12EQbYmw==
X-Received: by 2002:a05:600c:3b1d:b0:475:dd9a:f786 with SMTP id 5b1f17b1804b1-4771e1f4075mr10435015e9.40.1761702164908;
        Tue, 28 Oct 2025 18:42:44 -0700 (PDT)
Received: from [192.168.1.32] (host-78-149-11-196.as13285.net. [78.149.11.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e196b27sm21805305e9.8.2025.10.28.18.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 18:42:43 -0700 (PDT)
Message-ID: <5bc35f89-1b77-4c0c-b6ea-fe9b2cb74870@citrix.com>
Date: Wed, 29 Oct 2025 01:42:42 +0000
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: torvalds@linux-foundation.org
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, axboe@kernel.dk, bp@alien8.de,
 brauner@kernel.org, catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
 dave.hansen@intel.com, dave.hansen@linux.intel.com,
 david.laight.linux@gmail.com, edumazet@google.com, hpa@zytor.com,
 kuni1840@gmail.com, kuniyu@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mingo@redhat.com,
 mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com, pjw@kernel.org,
 tglx@linutronix.de, will@kernel.org, x86@kernel.org
References: <CAHk-=wiTN=1Sm5DVnXDtQ-tSiPuz-7QVpgP2vt6LgaEnhbubfw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] epoll: Use __user_write_access_begin() and
 unsafe_put_user() in epoll_put_uevent().
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CAHk-=wiTN=1Sm5DVnXDtQ-tSiPuz-7QVpgP2vt6LgaEnhbubfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> Yeah, clac/stac are horrenously expensive on Zen 2. I think they are
> microcoded - and not the fast kind - so effectively serializing.

AIUI, Zen5 is the first uarch capable of renaming the AC flag.

This make STAC/CLAC "lfence-like" in practice on older CPUs, because of
an implementation constraint of not being able to execute speculatively.

~Andrew

