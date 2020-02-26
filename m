Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF5E170CC7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 00:50:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SXbj5r2KzDqpB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 10:50:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=p/9RYB8k; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SXYy3KpXzDqR0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 10:48:36 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id gv17so337030pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 15:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=UW09MiMy2GaFwFAJ/K3zl0bfOBctGn1N/5oBnyfXBBo=;
 b=p/9RYB8kgMB0e8z5IDwOgAal1bA5SLd2SFKLv25Ung8/p0BhAB86euEgkobREoxfmp
 yKqg6pDpBKuUpdrEwTr9vEVyrfSL+cXkHm3hBTYBDohCfSV3uahMaoXMOOdshJ4aR+Fu
 V1toxermAqGtoIKM5MGgcSal+/esLdjYKwiLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=UW09MiMy2GaFwFAJ/K3zl0bfOBctGn1N/5oBnyfXBBo=;
 b=mJB3DZmQCEDdwkZ9W725bZ6rURsIpS+yRZjaT9Cy77RlWujQCHyMyhig/5jlgB1vuW
 o9Vv05XSCelz3b10Zw0p7mEDHWsmRt6FpWCbTY4P0XSqJMM623N+tCI26d4q2+Au8iCa
 tfUwVrn+se9eIHrzKiWAt6QeHxFUDyRkiwkteS9gPUFRy4YpxCzw2YSlexp3cATLwQH1
 /r2B5ovQlpoOGKLJmSQbh6qpxEdHIQZhY+5O5AFbouGfri+WjcuDQ3Au/4ZtSy0UzQdB
 Hm9t7dtTr+fgTQTeyNY8nlqc+DnVIngr5lKYKjeOg95xJVZ3oFkhDX+NOX7pBT/yxasP
 Q/cw==
X-Gm-Message-State: APjAAAXuBZN+ZIzvEDywHXGWmTGSN3oOWt1lsNM/qqKK8KhbEtystri/
 ZStyzeyxWOkYeuj2OlZfbw0POg==
X-Google-Smtp-Source: APXvYqwO0geOgUQ2VFTz4udUkoL6gA+i5YLlDwNbhBkmZKUuVfAD8LuxK/3KK4B4kuG2YBBwmhPS2w==
X-Received: by 2002:a17:902:ba93:: with SMTP id
 k19mr1782695pls.197.1582760911494; 
 Wed, 26 Feb 2020 15:48:31 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-5952-947b-051c-ea5f.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:5952:947b:51c:ea5f])
 by smtp.gmail.com with ESMTPSA id f127sm4475804pfa.112.2020.02.26.15.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 15:48:30 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com
Subject: Re: [PATCH v2 0/3] Fix some incompatibilites between KASAN and
 FORTIFY_SOURCE
In-Reply-To: <20200116062625.32692-1-dja@axtens.net>
References: <20200116062625.32692-1-dja@axtens.net>
Date: Thu, 27 Feb 2020 10:48:26 +1100
Message-ID: <87o8tkrjud.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-s390@vger.kernel.org, linux-xtensa@linux-xtensa.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:

> 3 KASAN self-tests fail on a kernel with both KASAN and FORTIFY_SOURCE:
> memchr, memcmp and strlen. I have observed this on x86 and powerpc.
>
> When FORTIFY_SOURCE is on, a number of functions are replaced with
> fortified versions, which attempt to check the sizes of the
> operands. However, these functions often directly invoke __builtin_foo()
> once they have performed the fortify check.
>
> This breaks things in 2 ways:
>
>  - the three function calls are technically dead code, and can be
>    eliminated. When __builtin_ versions are used, the compiler can detect
>    this.
>
>  - Using __builtins may bypass KASAN checks if the compiler decides to
>    inline it's own implementation as sequence of instructions, rather than
>    emit a function call that goes out to a KASAN-instrumented
>    implementation.
>
> The patches address each reason in turn. Finally, test_memcmp used a
> stack array without explicit initialisation, which can sometimes break
> too, so fix that up.

Hi all,

It doesn't look like this has been picked up yet. Is there anything I
can do to help things along?

Regards,
Daniel

>
> v2: - some cleanups, don't mess with arch code as I missed some wrinkles.
>     - add stack array init (patch 3)
>
> Daniel Axtens (3):
>   kasan: stop tests being eliminated as dead code with FORTIFY_SOURCE
>   string.h: fix incompatibility between FORTIFY_SOURCE and KASAN
>   kasan: initialise array in kasan_memcmp test
>
>  include/linux/string.h | 60 +++++++++++++++++++++++++++++++++---------
>  lib/test_kasan.c       | 32 +++++++++++++---------
>  2 files changed, 68 insertions(+), 24 deletions(-)
>
> -- 
> 2.20.1
