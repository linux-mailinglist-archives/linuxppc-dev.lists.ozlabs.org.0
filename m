Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 217CD70F70A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 14:59:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRB8d705Nz3f8f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 22:59:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VCLcvlia;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VCLcvlia;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRB7l2nMqz300C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 22:58:25 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5346d150972so238913a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 05:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684933102; x=1687525102;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tBAr6nf6/jR5QGXzB4/+ToLJPUfTVA+N9gkbz/Hb2eQ=;
        b=VCLcvliaK4vDpHRRpgL3RsP9JKt/fLc2ZCTTdsegcVU1bEl0YVZeu0Bo5o+Az9hiHb
         x9MsCqoRBeEjSkWgvBTS6sMq8tZdhbcHi3CD9WsSCBDgfX2QmGF0DIMw5UAKFG+5U/P7
         3bdTFzPqPIUZKd3QBh+cNCR78euyscIMqDtgIpVfPeWuLPINwQaq/OLUP/A4r22c8TBz
         C7QkA7HlP8JHeYb/dmQbVZawNFkFmb15o0UjxwSrrRN08Dc6IWzAPlQRHRlQ/fZ3gTl1
         Xm0ido7BvtrpiFAS+60ZHOamXx/r5lgod/wwtFOdlJFY66q3Sk3oq/4RoRzdw4KJ8vdr
         qOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684933102; x=1687525102;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tBAr6nf6/jR5QGXzB4/+ToLJPUfTVA+N9gkbz/Hb2eQ=;
        b=KbLit9fZI69JDiNSg4SbTQAG9TP+mTK+lJ+LEb5DXE3ilIsgRnMvPAZH33a+bLILYD
         nYF0Bvc8gpLU0zzD2z/UrQbmi2kcRnuBLd+vyn89C/ESNlETJV3di16kqgSn8/JV6YE/
         IkIkMqsoXbg0TFms7Ye8WXDihzUBU5QjQTSpp7E1hPK5iX4+i3MjCx6fY4OzMxcD60Re
         7IppWSoKkNkJOy1EiWslgNN0IgZn4lkXnVsW3YK2SJhCGiosq2UdJYNGdwxySBLybshi
         M9nMfXKk9sKo467vOxW0J9EfaTaN4oNz60aEeSfShykrHig9eYdKxP5biJi0P+wLmMSq
         xCjQ==
X-Gm-Message-State: AC+VfDx5te68AiCeEpOmRGb3y4V3SA83YEQoNFBcB4oFFgyU1ut5BNvZ
	/+08uJKc/ur3OeKeRVC83FE=
X-Google-Smtp-Source: ACHHUZ5E6x244rmOMqqWNfxM+LDTWBnKBvIyGo1mwSh4eCdrHeqJOk1OgxQ/08oZRvsvO7uRH6PMxw==
X-Received: by 2002:a17:902:daca:b0:1ad:dbea:6e09 with SMTP id q10-20020a170902daca00b001addbea6e09mr20587943plx.66.1684933102342;
        Wed, 24 May 2023 05:58:22 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-11.three.co.id. [180.214.232.11])
        by smtp.gmail.com with ESMTPSA id l6-20020a170902f68600b001ac706dd98bsm8665957plg.35.2023.05.24.05.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 05:58:21 -0700 (PDT)
Message-ID: <5d22e1e9-0307-3664-8b4a-99caaaaa4315@gmail.com>
Date: Wed, 24 May 2023 19:58:16 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Fwd: ./include/linux/mmzone.h:1735:2: error: #error Allocator
 MAX_ORDER exceeds SECTION_SIZE (v6.4-rc3 build regression)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux Regressions <regressions@lists.linux.dev>
References: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com>
Content-Language: en-US
In-Reply-To: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: doru iorgulescu <doru.iorgulescu1@gmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Fabiano Rosas <farosas@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/24/23 17:58, Bagas Sanjaya wrote:
> Anyway, I'm adding it to regzbot:
> 
> #regzbot introduced: 23baf831a32c04f https://bugzilla.kernel.org/show_bug.cgi?id=217477
> #regzbot title: Allocator MAX_ORDER exceeds SECTION_SIZE caused by MAX_ORDER redefinition
> 

From bugzilla [1], the reporter had successfully tried the proposed
kernel config fix, so:

#regzbot resolve: reducing CONFIG_ARCH_FORCE_MAX_ORDER to 8 resolves the regression

Thanks for all who participates in this regression report!

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217477#c8

-- 
An old man doll... just what I always wanted! - Clara

