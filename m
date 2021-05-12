Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9D137B4B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 05:50:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fg15Y65gJz2yx9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 13:50:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=gBKUHOq8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=gBKUHOq8; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fg14w5wpzz2xtm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 13:49:33 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id i14so17240833pgk.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 20:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=IzgGu9R0ARwDBsD+F2+JiW3x3zuHRQ4yrRZwYSnXu+o=;
 b=gBKUHOq8bXXc4gcmvChqsaFwzXmCzVaMbuxGaRF2zoU+2K9H8RWm99PIaivtkqwvbN
 9VWicYA33/yyz1ikMIL5uUDsNKBqrVc5xKHfNf/LCAKV2zULY5hdHnvpV0tJh7M8z9z/
 EpVCUCDWBdySe55vmMY/ducax5q8LvjK9PGwT0zfFFW7IRsuMV4hpZh8SVdothpAQcNk
 Iclsx/8GGQO9tqUqb7Z2b9OUCU5VcwhP6wac/gASXrinZZ0U/fkQpz/hconVGRTuhywk
 gAEJpKrDpnGq04SrJ1eJ84sBdqLVjTBegeTqAU/xW4dI7NfHVkUYsRmeQY7FSbbPTnfB
 6iwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IzgGu9R0ARwDBsD+F2+JiW3x3zuHRQ4yrRZwYSnXu+o=;
 b=ruUSwnLDQ1RLbYZJDRtiUu/kY0yOWGqMG8R5fJ5Mnj9cPDW21u9ki7zZvOrgVxyc8i
 8G+SDoBYKCJfbN5k/vr4Mwyuw47Mqo1yVLtJ18/NWpqlJEFEiYiTn3uihk7YxmYzslfH
 8Nl+azeROBcqYSo0scZPTW7Pl/Qklv9Qfhp7gZORqW3OwDc21EO8ELq2TACM4u0OqwsY
 HzFulNZ4Y9CPDLP7444S7014/aurIX4H1Fa0RHf0QTszleLRkFZsOiUMwtXh7RvzwvJW
 FCMsYlHeeC8wxRYbPgZkuGvebSbV2id8hgmffhvxcZ9ZDogIDBKJxls6QKoS+BBYFetE
 SPJQ==
X-Gm-Message-State: AOAM530IZbjPS0pnO0le7zarD4sT+Ndbh2KWR9/W/n/x9yh8DfjBJPk0
 UDdV05CPdCTmk+no3jHU+++UgQ==
X-Google-Smtp-Source: ABdhPJxECYSxNbvtoCjLInxxaXIyELrqBbGqdhrt2f9UsjwHdNJpJRoX9OeikLS7FyqRho+D5sZ8NA==
X-Received: by 2002:aa7:864c:0:b029:2cd:558:dbb8 with SMTP id
 a12-20020aa7864c0000b02902cd0558dbb8mr2932500pfo.78.1620791369439; 
 Tue, 11 May 2021 20:49:29 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id c6sm3225014pjs.11.2021.05.11.20.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 20:49:28 -0700 (PDT)
Message-ID: <80ae1561-ed8d-cf3a-f3bb-d89cd07bfc24@ozlabs.ru>
Date: Wed, 12 May 2021 13:48:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH kernel v2] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
Content-Language: en-US
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20210511044812.267965-1-aik@ozlabs.ru>
 <20210511112019.GK10366@gate.crashing.org>
 <1795b9efa40.27bb.1ca38dd7e845b990cd13d431eb58563d@ozlabs.ru>
 <20210511231635.GR10366@gate.crashing.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210511231635.GR10366@gate.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/12/21 09:16, Segher Boessenkool wrote:
> On Tue, May 11, 2021 at 11:30:17PM +1000, Alexey Kardashevskiy wrote:
>>> In any case, please mention the reasoning (and the fact that you are
>>> removing these flags!) in the commit message.  Thanks!
>>
>> but i did mention this, the last paragraph... they are duplicated.
> 
> Oh!  I completely missed those few lines.  Sorry for that :-(

Well, I probably should have made it a separate patch anyway, I'll 
repost separately.


> To compensate a bit:
> 
>> It still puzzles me why we need -C
>> (preserve comments in the preprocessor output) flag here.
> 
> It is so that a human can look at the output and read it.  Comments are
> very significant to human readers :-)

I seriously doubt anyone ever read those :) I suspect this is to pull 
all the licenses in one place and do some checking but I did not dig deep.


-- 
Alexey
