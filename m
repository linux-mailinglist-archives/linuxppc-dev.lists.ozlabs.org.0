Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A598C69B5E9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 00:00:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJS2Q3LV8z3fG7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 10:00:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ZdJkqJ4w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=ZdJkqJ4w;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJS1S04jMz3cJK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 09:59:23 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id cn2so9881181edb.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 14:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tEQSmYhd5lnJCtQxFzcCmvjtHrTwKOp3ygZ8THJUUCE=;
        b=ZdJkqJ4waQDuAQJEGWyJ3hvuW/8LBVyQq/Bo2iaLWQOjLKDO7Ir0YbQyTKVjnLyaEJ
         L136l5pyGoYnoq+SRQNSW7XcfX/Gn4wXGFRTHr5L0wolMkcFPPWX0PU9KPPebXKrs8A0
         EiWYr287GSbz5INdOAvFqnTZ5ur67QlgITwqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEQSmYhd5lnJCtQxFzcCmvjtHrTwKOp3ygZ8THJUUCE=;
        b=G+eDsmbkeHD/diVJGiFsS4fN183fShh54iQH4hIRW4PVRdAZL0T23WE6XNhoGZL+j7
         exOMB8UqrPDcARvBWNSOoqQxPC6DU0k99Mb4uNafCMuTllhOq09J8mn+fxmlutDkMn5r
         vN3nxFOJsZkX9c/9zwDAlcpl/NtDkkkdyd7Aqn7PlBwN6lCQewP/ZT2Cyh7Si1YLnm1y
         tXWgX6CFDsxsjZLRhhIzR+IOHjKADw96jctfFcqCIIk4Ngu+2ahauDBGGlx9jLofDjba
         tFyzHWgcSoRt0KpR7D21fTCsXW7ssOdpd83HCN7mSNsp0MYcp3ay01v52wlalYV+YVU9
         BHug==
X-Gm-Message-State: AO0yUKWS7EixnIoJAGBR/iT8Ztw/CmnR2kEGahmUChyVRN8a6iP0RYcI
	wj0o+ysqog55huFtUfXG/AD+Ucwv8hYA6C1T17c=
X-Google-Smtp-Source: AK7set9ryawXk4nXBQapq8DV8JzG3E40HJLX7f8dFYNfwNsGzfvV7Dkb0EgQdS4ZG+CsFdoBfTXSAQ==
X-Received: by 2002:a17:907:c297:b0:8aa:6edf:2a9 with SMTP id tk23-20020a170907c29700b008aa6edf02a9mr1862634ejc.69.1676674756914;
        Fri, 17 Feb 2023 14:59:16 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id w18-20020a170907271200b008710789d85fsm2641480ejk.156.2023.02.17.14.59.16
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 14:59:16 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id ez12so9880848edb.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 14:59:16 -0800 (PST)
X-Received: by 2002:a17:907:988c:b0:877:747e:f076 with SMTP id
 ja12-20020a170907988c00b00877747ef076mr1226419ejc.0.1676674755989; Fri, 17
 Feb 2023 14:59:15 -0800 (PST)
MIME-Version: 1.0
References: <87h6vjzzjh.fsf@mpe.ellerman.id.au>
In-Reply-To: <87h6vjzzjh.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 17 Feb 2023 14:58:59 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh=m4sr1iLbt_PMmbrWsjLmkCAbz=NkKZmfTYFWv-RA7Q@mail.gmail.com>
Message-ID: <CAHk-=wh=m4sr1iLbt_PMmbrWsjLmkCAbz=NkKZmfTYFWv-RA7Q@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.2-6 tag
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, bgray@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 17, 2023 at 2:40 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Thanks to: Benjamin Gray, "Erhard F.".

That just looks _odd_.

It's not like the full name wasn't already elsewhere in the kernel
logs as a reporter (and at least once as patch author), so I just
fixed it up ;)

               Linus
