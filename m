Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB85172D86
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 01:41:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T9hw38lYzDr8L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 11:41:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=brauner.io (client-ip=209.85.128.68;
 helo=mail-wm1-f68.google.com; envelope-from=christian@brauner.io;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ubuntu.com
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T9BS6WJTzDr7b
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 11:18:49 +1100 (AEDT)
Received: by mail-wm1-f68.google.com with SMTP id m3so1433310wmi.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 16:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:user-agent:in-reply-to:references
 :mime-version:content-transfer-encoding:subject:to:cc:from
 :message-id;
 bh=Ru4d08QosRwi5UKUDayggsg8+1o9m63515MgXLmokW8=;
 b=Mwi/bre22dqkvg5kEMUKXhJG8CIwxUpB17grPZ8jDQrkcvfp00yHBRd7FnDBTvMnft
 Mo1Q8zvPgUQae9ChLOwoI6o0kDGgBfnVm5CzNPqgbHKO9rXpLrloXNWIS0RlYHCEOmOh
 UxcAlzCfqFvimgrVTQl6HBXl1o7XZdgbY9y4yO3PfPr6Vr5OHWXZAl7vbBiCZnEvDm7x
 LOJ8jsxXYFnb8N6kUBKR/e58JAlQZQ6XYxI9ZHuJXcBw2uEvziLZRPi+8tmuI29yt9a6
 1ctJN27KM0NcvvCrA+i7tc/pQfVzcN96j1s3jPMWmChFiqV6yNU0mr5lbboqO4YrF3BZ
 kubw==
X-Gm-Message-State: APjAAAW1gww2mSx5EU2v2agwqB3uprndMqCz8ipvKsEn/lUeqVm9X+On
 27/sShDNtfq9OOUSSd9Td2Gqsw==
X-Google-Smtp-Source: APXvYqy+BY8r4CAlQjGnmuK0o8k329k009mLT7m3y33mtID+0H5FRuAG3RePEOUn51L+FOrcaJrpKA==
X-Received: by 2002:a05:600c:291d:: with SMTP id
 i29mr1383321wmd.39.1582849124239; 
 Thu, 27 Feb 2020 16:18:44 -0800 (PST)
Received: from Google-Pixel-3a.fritz.box
 (ip5f5bf7ec.dynamic.kabel-deutschland.de. [95.91.247.236])
 by smtp.gmail.com with ESMTPSA id d17sm9543105wmb.36.2020.02.27.16.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 16:18:43 -0800 (PST)
Date: Fri, 28 Feb 2020 01:18:44 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <966567c7dbaa26a06730d796354f8a086c0ee288.1582847778.git.christophe.leroy@c-s.fr>
References: <966567c7dbaa26a06730d796354f8a086c0ee288.1582847778.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] selftests: pidfd: Add pidfd_fdinfo_test in .gitignore
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Christian Kellner <christian@kellner.me>,
 Shuah Khan <skhan@linuxfoundation.org>
From: Christian Brauner <christian.brauner@ubuntu.com>
Message-ID: <DB631DFB-DF8B-4B95-AC50-74F1ED733CAE@ubuntu.com>
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
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On February 28, 2020 1:00:08 AM GMT+01:00, Christophe Leroy <christophe=2El=
eroy@c-s=2Efr> wrote:
>The commit identified below added pidfd_fdinfo_test
>but failed to add it to =2Egitignore
>
>Fixes: 2def297ec7fb ("pidfd: add tests for NSpid info in fdinfo")
>Cc: stable@vger=2Ekernel=2Eorg
>Signed-off-by: Christophe Leroy <christophe=2Eleroy@c-s=2Efr>
>---
> tools/testing/selftests/pidfd/=2Egitignore | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/tools/testing/selftests/pidfd/=2Egitignore
>b/tools/testing/selftests/pidfd/=2Egitignore
>index 3a779c084d96=2E=2E39559d723c41 100644
>--- a/tools/testing/selftests/pidfd/=2Egitignore
>+++ b/tools/testing/selftests/pidfd/=2Egitignore
>@@ -2,4 +2,5 @@ pidfd_open_test
> pidfd_poll_test
> pidfd_test
> pidfd_wait
>+pidfd_fdinfo_test
> pidfd_getfd_test

Thanks for spotting this=2E
I'll pick this up along with other fixes I have waiting=2E

Acked-by: Christian Brauner <christian=2Ebrauner@ubuntu=2Ecom>
