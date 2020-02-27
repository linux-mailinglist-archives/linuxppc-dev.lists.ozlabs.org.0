Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9209D1723E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 17:48:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SzBf44Q9zDr4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 03:48:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=skhan@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=google header.b=XaBoABkO; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Sz7D6rRWzDr3j
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 03:45:28 +1100 (AEDT)
Received: by mail-io1-xd42.google.com with SMTP id x1so154617iop.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 08:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rS6KqBFssX9ZUdW6+MPkG1KvIc6wVLI2emiU+QF0qwg=;
 b=XaBoABkOukH7Nu7mt4lsMgCefNzcJQuXa2aVFVbkfZpp6Tb5s+73tbFVKvoyGjA/de
 rmZCbRd35i75iH1YaR3+beQ0/MRPNMdEGj3CTigZMKUY3xL+M1uKsj1ZAx7tdcdtuV87
 YOAZpAJF4zquagazdIfTcwOMiCpDIc/iUts64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rS6KqBFssX9ZUdW6+MPkG1KvIc6wVLI2emiU+QF0qwg=;
 b=TGmbJCuA7MbnhaHuCl1a8Nk073yNhArLvEMbLmRFrpEA0QT3Lwiiq64FSRFODFOjXd
 XBI9r9AsDAlr5wk8myZDujwzRK3BqvhjOKGgzWdz0QZ6BO48+Va1QFR0thmymJXgkbr2
 90aCuvTUhhgajbARb0G7JWW0lcZfcFukrf1cSAcFxkOjJ/XaSK4/bgkrFdreM97kUrSa
 mMavrooeDOKv+RssGTtH86QM0uNH+EuhhUVA+mBuT5STefo+s///eW6+mjs63gAOfo+/
 qbQpGsNxAuqS1wxlFjtvJSm027uNelcPltbRcGp6ECvF5wGnOHklIxFgo7R7tKfvyL+4
 xX6A==
X-Gm-Message-State: APjAAAWeeXfopAO7k72UiACUR5DafWIDO3WDAn5OgFOZMcEItXFi3Q7E
 PwLKQjYmam5QQdG/3OmJtSJZEg==
X-Google-Smtp-Source: APXvYqx/a5Dli7aKEcWZrJspfguzTO9DfNqargT1han0HSOgIYlEsoiSlvvxXv/MLc1HIIpISgSXpg==
X-Received: by 2002:a6b:700e:: with SMTP id l14mr187328ioc.170.1582821924223; 
 Thu, 27 Feb 2020 08:45:24 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id i16sm1978584ils.41.2020.02.27.08.45.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 08:45:23 -0800 (PST)
Subject: Re: [PATCH] selftest/lkdtm: Use local .gitignore
To: Kees Cook <keescook@chromium.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>
References: <e4ba4f716599d1d66c8bc60489f4b05764ea8470.1582812034.git.christophe.leroy@c-s.fr>
 <202002270817.1C32C98@keescook>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f804d7bc-134d-27f8-daa5-6bbf9f28b54d@linuxfoundation.org>
Date: Thu, 27 Feb 2020 09:45:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <202002270817.1C32C98@keescook>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/27/20 9:17 AM, Kees Cook wrote:
> On Thu, Feb 27, 2020 at 02:07:10PM +0000, Christophe Leroy wrote:
>> Commit 68ca0fd272da ("selftest/lkdtm: Don't pollute 'git status'")
>> introduced patterns for git to ignore files generated in
>> tools/testing/selftests/lkdtm/
>>
>> Use local .gitignore file instead of using the root one.
>>
>> Fixes: 68ca0fd272da ("selftest/lkdtm: Don't pollute 'git status'")
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> 
> Yeah, that's better. Thanks!
> 
> Acked-by: Kees Cook <keescook@chromium.org>
> 

I will apply it for next rc.

Thanks. I should have noticed the problem in the previous version.
It slipped by me. :(

thanks,
-- Shuah

