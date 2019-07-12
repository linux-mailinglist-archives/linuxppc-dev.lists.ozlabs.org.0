Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E716729E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 17:42:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lccF5JJpzDqfq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 01:42:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="QmSMDI80"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lcLy170WzDqnB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 01:30:34 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id w17so8465098qto.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 08:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wu702WptAOAhsxDRfP3OXS4FEoD+D5sZm3CKh3FTjwY=;
 b=QmSMDI806K6oU8ImCzb9JsLwsO8VSznuzhbhIDV1OvlMdLb3JkZBbJ/92Ivdqv3Sew
 Z7Qe0Qq26NaeD2qR8Fom58E7VVaxDBDNK6Ue8HqwD5jRuFPeODklvM9ELlDLdLZIZCXG
 OE9SJg4v5yylzl+TWHxfSy3bhDW9prX77jVrXENwP3cPaOOkhGNGJVt2DRwhHngMMrDk
 jMr9uk4HYyhrLQzuZWlghtw4gINRA4kGP/nhSFxCJ92nq0mYCMnBHi6bpdi8T9aJqWrO
 5PBWovYV0fHThDmg/54NNq+oeEivOXzli/38ZrhBS+qOUucmtpVA4PzYIaRHvXQ9IMg7
 c8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wu702WptAOAhsxDRfP3OXS4FEoD+D5sZm3CKh3FTjwY=;
 b=UNC0hMA4Xdg+UAXxNkq1dzJwDoqIHVY7SoRGCD2R4/3/IOuMGPOw5tMtZwRwiX/4tF
 QlhIGfuVmSqzaKbN70k21Rid2R2MX+7ZUjVqLkmsye40C7AcmzT7ysoCaLUOsJQnS+ck
 nLYSW9zWTGuP0xgYQfV5FruYTUXz9KOVPXg5//Rk6k6zpYndTLOHabMOCEMHHXJd6y/a
 qGwrAOHCAar7f9YUqsAtazUnC6ZDkHnrPuO1Sv0qpMAQv+o36BRo2/qb1xDDmdAiGqCl
 SmPBVBUiw3xv8n5Odx1X04akPSs+uKZ2k9f7Hoosu9UI64USyR8dP63ziTzYUU17XEbl
 +CKg==
X-Gm-Message-State: APjAAAUvB3NCeD+DPVC7z7rofqu8p8EK9RfD9SDxgymYo186O6ZAD6vN
 i5v0RFjkz5K1RvQ++C0VG9HNTg==
X-Google-Smtp-Source: APXvYqxlBvzD3wvRDrKYL7X7wGaNLInLmH+c+gXqWIYDX/FawG5w8l/m+Xmsh8f0lfeZ4uCTw2dEaQ==
X-Received: by 2002:ac8:32c8:: with SMTP id a8mr6715382qtb.47.1562945428748;
 Fri, 12 Jul 2019 08:30:28 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id w62sm3649817qkd.30.2019.07.12.08.30.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 08:30:28 -0700 (PDT)
Message-ID: <1562945427.8510.28.camel@lca.pw>
Subject: Re: [PATCH v3] powerpc/setup_64: fix -Wempty-body warnings
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Date: Fri, 12 Jul 2019 11:30:27 -0400
In-Reply-To: <1561730629-5025-1-git-send-email-cai@lca.pw>
References: <1561730629-5025-1-git-send-email-cai@lca.pw>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, paulus@samba.org, tyreld@linux.vnet.ibm.com,
 joe@perches.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ping.

On Fri, 2019-06-28 at 10:03 -0400, Qian Cai wrote:
> At the beginning of setup_64.c, it has,
> 
>   #ifdef DEBUG
>   #define DBG(fmt...) udbg_printf(fmt)
>   #else
>   #define DBG(fmt...)
>   #endif
> 
> where DBG() could be compiled away, and generate warnings,
> 
> arch/powerpc/kernel/setup_64.c: In function 'initialize_cache_info':
> arch/powerpc/kernel/setup_64.c:579:49: warning: suggest braces around
> empty body in an 'if' statement [-Wempty-body]
>     DBG("Argh, can't find dcache properties !\n");
>                                                  ^
> arch/powerpc/kernel/setup_64.c:582:49: warning: suggest braces around
> empty body in an 'if' statement [-Wempty-body]
>     DBG("Argh, can't find icache properties !\n");
> 
> Fix it by using the no_printk() macro, and make sure that format and
> argument are always verified by the compiler.
> 
> Suggested-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
> 
> v3: Use no_printk() macro, and make sure that format and argument are always
>     verified by the compiler using a more generic form ##__VA_ARGS__ per Joe.
> 
> v2: Fix it by using a NOP while loop per Tyrel.
> 
>  arch/powerpc/kernel/setup_64.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 44b4c432a273..cea933a43f0a 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -69,9 +69,9 @@
>  #include "setup.h"
>  
>  #ifdef DEBUG
> -#define DBG(fmt...) udbg_printf(fmt)
> +#define DBG(fmt, ...) udbg_printf(fmt, ##__VA_ARGS__)
>  #else
> -#define DBG(fmt...)
> +#define DBG(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
>  #endif
>  
>  int spinning_secondaries;
