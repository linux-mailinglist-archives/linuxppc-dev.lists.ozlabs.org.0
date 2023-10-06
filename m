Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 804497BB1D1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 08:58:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BYMNP4sc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1zll5hX2z3dDT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 17:58:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BYMNP4sc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1zkr20X2z2yQL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 17:57:23 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c60cec8041so13183805ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Oct 2023 23:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696575439; x=1697180239; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltCjm4aJUWe9aYqASEplzIRx3exF5lO5oefAHyj9uWI=;
        b=BYMNP4scS1w4q/sw8NP9Y5ZZFJhvTZs0JpR04BQ1gXlWdb9w8UgG6X7XQZHZ14lKZN
         CDRo0lpddi1in1VMomDo+NzXma7mD5x52Jgx1LhSJy8jgSaP43XGwz4UG1tuatn47bxW
         xCaX4VPL4qHnqlKrXbHVxcK+VUDAP7qZ92A4gsfFInoJfCRod89id2Yj7yeUgDxHFCsI
         AMw/J7zN9bgIwwLVByIMaE22kfx0GPLxJNommYq+OSF4SHC+3jyiChWp/TpSITcLQJ2u
         DQUiWbiMimDC1+A/JFXzDmhu+/zVbIAK0v+U9r4Mfn+A7cLVK+NDMoiglEjr4kbzY+hl
         3KdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696575439; x=1697180239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltCjm4aJUWe9aYqASEplzIRx3exF5lO5oefAHyj9uWI=;
        b=mT0Fyl7d8KtapCSYbnqhb3GSjLOHTtIggFGwhnt+eRpnHX7n4ey1xlogvd3oaVMx7z
         0I9uUxMoWurjo9Hznbsi1pWCK5+u9k2jXr0mxLfphPfgwqCA7jb0z26M1GdXAqte0Yca
         mfKYTmM5qZvqFFIUK09ZMfokUbYn8tBCeGdVXVtVcZZE1xOe4qpFAhU7Q98Rt0Jz09Mk
         3fGKtAdgUbXGPVG5x9GQ4tsSVcHEMYEknvkmyOVIsp/6FNDzIDx0DjYzLFsLDQN44jIn
         85DosfltrqHXhmVM+s2EfIjTQ8r8oaxiOdgGgnUQmXnmCmzGKLqnTRUKCp7eKiAc+eLB
         t3dQ==
X-Gm-Message-State: AOJu0Yw5dr+beG06DMo4KMYdequZojrRg8kmyTn6aHQRrz4PEXgRr0c6
	+nZ32oG+EHWnZFmoDZBaHcM=
X-Google-Smtp-Source: AGHT+IGqQwQOB9t6/yYKRaS6b8thQhpGRr5Dk8tWrNhV15C8CICkgfRtYX3GSYgryu7yNxfhJNi1eQ==
X-Received: by 2002:a17:902:ecc8:b0:1c4:29dd:2519 with SMTP id a8-20020a170902ecc800b001c429dd2519mr7615049plh.67.1696575439280;
        Thu, 05 Oct 2023 23:57:19 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902a3c100b001c61512f2a6sm3035443plb.220.2023.10.05.23.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 23:57:18 -0700 (PDT)
Message-ID: <0802bc5a-9fb0-433a-8491-47806cc7c549@gmail.com>
Date: Fri, 6 Oct 2023 13:57:12 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bisected] PowerMac G5 fails booting kernel 6.6-rc3 (BUG: Unable
 to handle kernel data access at 0xfeffbb62ffec65fe)
To: Matthew Wilcox <willy@infradead.org>
References: <20230929132750.3cd98452@yea> <ZR9esG8H17LY2KOX@debian.me>
 <ZR9gkZKafUSNOAEf@casper.infradead.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <ZR9gkZKafUSNOAEf@casper.infradead.org>
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Linux Regressions <regressions@lists.linux.dev>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/10/2023 08:19, Matthew Wilcox wrote:
> On Fri, Oct 06, 2023 at 08:11:12AM +0700, Bagas Sanjaya wrote:
>> Matthew Wilcox, did you miss this regression report? You should look into it
>> since it is (apparently) cause by a commit of yours.
> 
> No, I didn't miss it.  I'm simply choosing to work on other things.
> All this regression tracking nonsense and being told to work on things
> by people who've appointed themselves my manager has completely sapped
> my motivation to work on bugs.  If you want me to work on things, *don't*
> harass me.
> 

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

