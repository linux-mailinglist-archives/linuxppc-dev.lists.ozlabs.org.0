Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED8D10DAA6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 21:47:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Pmm82TF2zDrBH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 07:47:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.b="RPpCWkXj"; 
 dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PmkF74YzzDr7C
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 07:45:56 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id w8so13794801pjh.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 12:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gg5me5dViZKmX3j5Wl5G7oXUhPYuxdRzN5a2QntEtdY=;
 b=RPpCWkXjASFdGL8lUGiEm00+1Jw8VqN+E8nmsVIH7HQy+NfX4KSWliROvaWA8TKdv1
 oPhngwKUltxp7bdjirNdovk/8XIG80Bp26AlNZ7+K30F6VnNMr2YZHFraQMUbw9wJ+9d
 tW89K16h3pSqiLh3pgZch2pNdOcfEreEC+phSXg73Vvg34YauGy+9yWX1R3KH4wk5Ge3
 3kg00y+HEjWacssIgkU68/iBqtvMnTcw2fd34yZOxDJnc3Mzn6dDIRucrjxj6oC4NkE3
 9isiG8wSOIkvFSADyqkBDOVKs8TWlOOyEfHfvQQsALy1Q58Y0BNR/BktgDZKAmJTGAYu
 2ooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gg5me5dViZKmX3j5Wl5G7oXUhPYuxdRzN5a2QntEtdY=;
 b=ZzrodhaW1VNTFSkrELHzZ9bdGns83c5l22u9XIpXkzgkAcKfTMS9ZH92XUBuhZd+tU
 RDem8qhgu8Rm9pcBoeANpJ+XhjgR6Hck8QKcpYfRnHDW3RYVyFq1zKP2a8sbk/XRhX9/
 ZpDZa23vSP6bPC976N5ag2N8axc05fXd3lE2uHoJ3/11wYtDMpDsAj//5VA0LszmCDNd
 Gw7OHIeinhwQaWrZTgQGktXd3BYojlLtXHlS9FBcrNPKnEOEs14IGqmyy5GzpwTwPLpi
 l7C9BsfBBWxU+gZo8RqLDZ1/Jv6VPmvjF7WIK+E8BBHU0aEpjZwXMUGYHVD6GJvuq01Y
 bASw==
X-Gm-Message-State: APjAAAXswqZlOefTtnx8VqAOd4AfzFgTjqh0hhmcQmzhDPnL9v7GstFj
 R5WyNCR+TvXHXVrjST53/4tDV9RXfFWQRA==
X-Google-Smtp-Source: APXvYqzrgh9Qm7BMjFQKa7oMdl/3zmuWcPPllwiqcAAG1hrsImgTL4prpQ+lZjxxJFbWepsZltn+4w==
X-Received: by 2002:a17:90a:fe07:: with SMTP id
 ck7mr19937314pjb.99.1575060353342; 
 Fri, 29 Nov 2019 12:45:53 -0800 (PST)
Received: from ?IPv6:2605:e000:100e:8c61:6938:40fc:d284:b43?
 ([2605:e000:100e:8c61:6938:40fc:d284:b43])
 by smtp.gmail.com with ESMTPSA id b1sm15584966pjw.19.2019.11.29.12.45.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2019 12:45:52 -0800 (PST)
Subject: Re: Build failure on latest powerpc/merge (311ae9e159d8 io_uring: fix
 dead-hung for non-iter fixed rw)
To: Pavel Begunkov <asml.silence@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <71cf82d5-5986-43b7-cf1c-acba429a89d6@c-s.fr>
 <3a95d445-1f5c-7750-f0de-ddc427800b3b@kernel.dk>
 <4ef71e74-848f-59d4-6b0b-d3a3c52095a0@c-s.fr>
 <5389b43a-259d-997c-41e6-5e84a91b012a@kernel.dk>
 <38cb2865-d887-d46d-94ef-4ebccff4dc60@gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <884742fe-2eff-48ba-1382-83aab9a37a84@kernel.dk>
Date: Fri, 29 Nov 2019 12:45:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <38cb2865-d887-d46d-94ef-4ebccff4dc60@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/29/19 10:07 AM, Pavel Begunkov wrote:
> On 29/11/2019 20:16, Jens Axboe wrote:
>> On 11/29/19 8:14 AM, Christophe Leroy wrote:
>>>>>
>>>>> Reverting commit 311ae9e159d8 ("io_uring: fix dead-hung for non-iter
>>>>> fixed rw") clears the failure.
>>>>>
>>>>> Most likely an #include is missing.
>>>>
>>>> Huh weird how the build bots didn't catch that. Does the below work?
>>>
>>> Yes it works, thanks.
>>
>> Thanks for reporting and testing, I've queued it up with your reported
>> and tested-by.
>>
> My bad, thanks for the report and fixing.

No worries, usually the build bots are great at finding these before
patches go upstream. They have been unreliable lately, unfortunately.

-- 
Jens Axboe

