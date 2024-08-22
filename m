Return-Path: <linuxppc-dev+bounces-398-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFBC95BFA6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 22:39:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqZnB5Zjrz2xHb;
	Fri, 23 Aug 2024 06:39:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::130"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724359166;
	cv=none; b=eZ5Hq10lulYJisny7PnBkNS6N9EK4zMBjA1c9ZbgoX25y+v0ettVFBGwP364UvU7tPuo2QzEqi8UkCCNbG8lTA0Y3nh2Wz3I+921iINWtQcxD0SEOo1OUqJB9KF2SBx0UPo/FHQ5bBLzDoJ4QKV8XJ/pqfFNhfPncqd1t/3/tUkLLNmjlAuaTEQ2Hb77ODOU81513/ko+upBNMoM3ngWUv7urvFGsIS33chkdMAIkbAf6b58YVEmQS9aTZK7/ZAZHw/GEJlefI8cm7Ow8MVEDwWdBsZI0vTZJxM0tbjEuWY9nSVy1nFxK7wPxh15F5JSagA9hbi1gVUzTGy4cjCGyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724359166; c=relaxed/relaxed;
	bh=OkFn0AdhVgyDSLEmCSbk7UuIUs0dBVqwRiVvtrDuc3Y=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Subject:To:Cc:References:From:Message-ID:Date:
	 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
	 Content-Transfer-Encoding; b=e50wkTak9YLZiaDyK5UyCETT/9b6a0WVKxKP2Z42xTGqS6j+tGXwuD3PTlFNRKFntiadzuaD7rvqO0qoU2uWy6HjqjveO6NfThh9Pje/+1yNWU/oiPF8+wEKqCyQptiPbIefcdz2AlkQQU0ev7MBuzFoUiXhuHfKcJpWzNudHliC9YCy2o9aD1EvL9QaUPy3a37UA26m1imGcf+oabwCPhSB5qbYDAyX0JHLSLuYtsz93ycaU1HJIgnpn3CPBJqIdhpgxq0yNgpAKIFyjxS873/lChS7sAgzmQwe0bT4o2XQhuGW4ZRfX7SXF8HquidK9ezCbDyIZxFxLOFKt1ELMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FNMbd+vC; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=sergei.shtylyov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FNMbd+vC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=sergei.shtylyov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqZn95lxgz2xGT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 06:39:25 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso2071635e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 13:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724359156; x=1724963956; darn=lists.ozlabs.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkFn0AdhVgyDSLEmCSbk7UuIUs0dBVqwRiVvtrDuc3Y=;
        b=FNMbd+vC9PLav+6HhgmjyKGqQJLe02yYLkGIV68GJgqzf04f8GI28sD6QBxoeMJhfq
         mvTZxpE1rD1Ur1eJ8CcI+0KBp+3AMDHkA/t57DxHanHjqZaefpgEBZn8qPr1mC4IJ6Fy
         fsVuD2vO2Tlc4o+YmE4TgArIEhbcyuv1eERBL+gLCQksKZImOtVlzVKUTRtOKPe/Cv2q
         o7afstghNzkCag8UE4iHpRDOtCpRIlWVU/DIUw1GKrcoh2lfN5OGKnwnC2vL4Lrlh++A
         w2ftGCy5BheyPfNYsxkpPhC4rxWVL/MD/aNhGGkg9C5zcVjlnhAbtVLXMaQiiv9OhWO8
         rLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724359156; x=1724963956;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OkFn0AdhVgyDSLEmCSbk7UuIUs0dBVqwRiVvtrDuc3Y=;
        b=AwgTolE69Qrn7muMk+6A5na+0dE9ns60BBhIyQqIqanGNay69ncX9tQE7rummgFeeN
         59JXqYIK43KJJ3qYJMFQpYBR4iO8AjxASnpp5tpzLN/y7LzomJ7EKa2MdbFYJKFhWrKk
         Wg/K6gDxo/ENwcqPsw/5rJ6jJ9SA3GXVgel1c+eR9uQ4Ng1ccdxFr3rhE0KZBbRfrbKw
         ZepdF67Mf5oGTWKuGdPvXzi/rbtOl+4aiB36ZCReUPp8prbd/kWTktb/5hTOi/Er3sYX
         P3RKFpTdU/dpdnaf8TDPvc/06yasJHrjJ4Ulj8973jpnQDpbcwNZRse4onVkX9DEnjom
         VVWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOAa7Z/KeDISeJz8XUGKYWY3174DBXefpfKRkB/CwolkyzEV5x7I3K2Rm4Puhp95JVGjHlY720x90yHNQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyg2H6aMBRbglybDWW4xIoNwyTq5n5utuyOkyKfxE2Kbs63Ocy6
	8SLBF7cO2HnYx6Pf7/hsD1oSqLr1EJ1xsDJA8fodWED7jakYbxev
X-Google-Smtp-Source: AGHT+IG7aXm73Ndu+NiqWPAkccFpdhVsfBo5sgR8yeluU7T/U/g51mQZyz4I6LQ6xQXtCJpg3cjjSg==
X-Received: by 2002:a05:6512:224a:b0:52c:d626:77aa with SMTP id 2adb3069b0e04-534387c290dmr71446e87.58.1724359155604;
        Thu, 22 Aug 2024 13:39:15 -0700 (PDT)
Received: from [192.168.1.105] ([31.173.84.20])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5334ea59415sm356805e87.120.2024.08.22.13.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 13:39:15 -0700 (PDT)
Subject: Re: [PATCH v2] ata: pata_macio: Use WARN instead of BUG
To: Christoph Hellwig <hch@lst.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>, cassel@kernel.org,
 dlemoal@kernel.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-ppc@kolla.no, vidra@ufal.mff.cuni.cz
References: <20240820030407.627785-1-mpe@ellerman.id.au>
 <6b2208d1-c18f-14d5-e6d0-acd5c82b4db1@gmail.com>
 <20240822025952.GA32067@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <95c3cc5d-17e3-d19b-22f6-6a519f480143@gmail.com>
Date: Thu, 22 Aug 2024 23:39:13 +0300
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
In-Reply-To: <20240822025952.GA32067@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/22/24 5:59 AM, Christoph Hellwig wrote:
[...]

>>> The overflow/underflow conditions in pata_macio_qc_prep() should never
>>> happen. But if they do there's no need to kill the system entirely, a
>>> WARN and failing the IO request should be sufficient and might allow the
>>> system to keep running.
>>
>>    WARN*() can kill your system with panic_on_warn -- Android is particularly
>> fond of this kernel parameter but I guess it's not your case... :-)
>>    Greg KH usually advices against using these macros. :-)
> 
> And in this case he is simply totally wrong.  The whole poing of WARN_ON

   Greg does have a point: on billions of Linux systems (Android phones) that
all use panic_on_warn=1, WARN*() is pretty much equivalent to panic()... :-/

> is to have a standardized way to assert conditions.

   Hm, makes me remember assert() in C aborts a program... :-)

MBR, Sergey

