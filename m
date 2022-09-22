Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7035E6DD4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 23:16:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYSkz5vqqz3c6T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 07:16:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gimpelevich-san-francisco-ca-us.20210112.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=tGeOq2JW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=gimpelevich.san-francisco.ca.us (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=daniel@gimpelevich.san-francisco.ca.us; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gimpelevich-san-francisco-ca-us.20210112.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=tGeOq2JW;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYSkN1CWyz304n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 07:15:52 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id o99-20020a17090a0a6c00b002039c4fce53so3745414pjo.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 14:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gimpelevich-san-francisco-ca-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date;
        bh=F/fSD3tiHwAEumeXG+qiH5G3ZfY9Y6LXUkEueVgh6Fk=;
        b=tGeOq2JWiIBsL3jWhqw00ZY4tOCMc7IQwKuz2NBmLdlz6nI72CPqI5nvU4wYA7wrSK
         4ZtSaaYV2fWWtkk6v6ylkQsxeFK/GpQhc5Kroq/oD899bc22M7UnBHR9Kf264D7iCyFg
         NPoBZnxVotT//5zKC5GKwBGbCnKU2NoIe0/OJHqWzMDG0yR4UwOL74fYkFPbPFTM/EZy
         2FWS/hle0d47gTgQgX7IgjjsLEVfb3z04geb4y98if+3dNiERqjRRvZk0HyzSwRUfTWQ
         BRQKsTwaWXeqkdmv1qnX1MPytI/80wucocrAmC2XiQFJs11GsU5g6AGI7NkC7/vFD3PI
         B1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=F/fSD3tiHwAEumeXG+qiH5G3ZfY9Y6LXUkEueVgh6Fk=;
        b=MUp6kLe0PdFFWZZCxhZ3ECmKPvX8Ho7gX83/QGX0O5/X7XLC5FVC0gOlgqRUsfHek8
         C/Rx1II6Cqap06ULeukImskDTJbIgmu1WDLybKPvDUwfC3LbjdM6ZgeHx8Kj262Ey/Tj
         uCpIEhEjbqWlLswJ9N05xMyvmzOKzU6eUgRelJujG0s4gnmHQ02fsGEclAucH6f4AUYc
         3Gk+/KnElu9jJqAzz6ZfIW/zICtl7gEq8Csfh7bYMTqOXnwlHdWFFk/i3AeufnjPtw6c
         MOG+qtrEx+G1xY7dJL7BHSTlArKipNBkNYCMWtFfVG33ZfXRq/8w/kw7eLv2/Zzb7W79
         fIeQ==
X-Gm-Message-State: ACrzQf1YQSYVx9hQYMYoWdL9GYJQHFm9hrM+OyVNrVikzrwUylDOeFr8
	y8TL2vHr9EWDlP28SyQBklTESQ==
X-Google-Smtp-Source: AMsMyM5ldt2VrAPEWUNgs13BVkUvJnBv9O5XNfcE5ETCAxNGwR13fNpzdtYlY5dOXChaPEyxe5tV+Q==
X-Received: by 2002:a17:902:7897:b0:178:9292:57b9 with SMTP id q23-20020a170902789700b00178929257b9mr5370369pll.102.1663881348801;
        Thu, 22 Sep 2022 14:15:48 -0700 (PDT)
Received: from [192.168.72.152] (157-131-203-68.fiber.dynamic.sonic.net. [157.131.203.68])
        by smtp.gmail.com with ESMTPSA id d6-20020a170902b70600b00173368e9dedsm4485709pls.252.2022.09.22.14.15.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Sep 2022 14:15:48 -0700 (PDT)
Message-ID: <1663881344.25129.23.camel@chimera>
Subject: Re: [PATCH 0/8] generic command line v4
From: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
To: Daniel Walker <danielwa@cisco.com>
Date: Thu, 22 Sep 2022 14:15:44 -0700
In-Reply-To: <20220922211026.GW4320@zorba>
References: <20210416040924.2882771-1-danielwa@cisco.com>
	 <b517fac5-2fdc-a8c9-75d0-174c67f5a2de@seco.com>
	 <20220922205334.GV4320@zorba>
	 <dcff9b0f-82c8-5aa7-0fff-b749a05fcb20@seco.com>
	 <20220922211026.GW4320@zorba>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
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
Cc: Rob Herring <robh@kernel.org>, linux-efi@vger.kernel.org, devicetree@vger.kernel.org, Sean Anderson <sean.anderson@seco.com>, linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2022-09-22 at 14:10 -0700, Daniel Walker wrote:
> On Thu, Sep 22, 2022 at 05:03:46PM -0400, Sean Anderson wrote:
[snip]
> > As recently as last month, someone's patch to add such support was
> > rejected for this reason [1].
> > 
> > --Sean
> > 
> > [1] https://lore.kernel.org/linux-arm-kernel/20220812084613.GA3107@willie-the-truck/
> 
> 
> I had no idea.. Thanks for pointing that out. I guess I will re-submit in that
> case.
> 
> Daniel

This has been happening repeatedly since circa 2014, on multiple
architectures. It's quite frustrating, really.

