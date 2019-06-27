Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC4358B23
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 21:54:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZVwd014QzDqjZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 05:54:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="is1HU+gg"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZVtX3BPGzDqgV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 05:52:52 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id c70so2827752qkg.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 12:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qQvtIolaIhbEj7zQCdzCY/FMnc1dfYBybIqVXd3KZ8Y=;
 b=is1HU+ggY8nhSOnAQI/VX7rUG8dfJ3gGIIegNI9BVXfIesWy5VLF4zh7WUrsqCOnqB
 ikg5x6cEt2YFLNh/o/vy+ITlF970QkFbOx5kYJ5Z7Oe3G8liFvatPNcmmKMbn4+QUov6
 mbKPoj0t4y6YqqcAsVb3+2XEPtY2R/tcXkptmHCU83/GJucXehVUt+CwKgySB8sMGzc9
 Q3HhHPkn99sdp+xZlnDk85aR87UlQvBs+PhhwF4J/o60rrixXxSEpjxs0CSGMdVD30bK
 FV9EwDfNdcXpK1Dfv86SaUzx5gx7GW2c6ZCWEZgScTBygh+A5ccUyjt6kI8KAOsBypOQ
 1GsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qQvtIolaIhbEj7zQCdzCY/FMnc1dfYBybIqVXd3KZ8Y=;
 b=au3kiE9bbD0YYKCFSxpbREvEiZUUf4iuVrqpV9s/fkHTBWq5bz5tCMq210gW7kFpQQ
 bbPdUt9fCaEsIp5+TmUpjlLV4NHMNvDZNYZ/dN+KmRYDEA4erco9B6e7j+QFlQcDWK2/
 BZbgIMJCuXvpZ9Hi+EpdCLc2vcFo/cfpQfJ8XFM1vXPctvBZayb2Gq79bCwRpOGnW51M
 3Cpg4G2717L2WpzMGHcsRkxLv8bSjKaeM+VVpA9f07e5o8bCBPFLL9eyUjmYJQuu081k
 5cz1nuQqm0KHJiWitCQXw9QD4etlidd6j8DFPJTAeeyN5eU5MCpDiKMA9CIfJgJRYYzA
 6ccg==
X-Gm-Message-State: APjAAAWI5zkyQuaFT6sFg23maeIcbHZMDpP+2j0qmFUms7sEem2QdB6q
 3/cK+o3U033E6eGws1pcS5FFLg==
X-Google-Smtp-Source: APXvYqwqsUW/Hfuw+7OIqqajGDQc9UBxmD94kwLGNZOhmicRCyFC0z+2aPwr1Mw8fSs39S+PHsN01g==
X-Received: by 2002:a37:a2cc:: with SMTP id l195mr5019652qke.362.1561665168691; 
 Thu, 27 Jun 2019 12:52:48 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id a15sm63894qtb.43.2019.06.27.12.52.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 12:52:48 -0700 (PDT)
Message-ID: <1561665166.5154.90.camel@lca.pw>
Subject: Re: [PATCH v2] powerpc/setup_64: fix -Wempty-body warnings
From: Qian Cai <cai@lca.pw>
To: mpe@ellerman.id.au
Date: Thu, 27 Jun 2019 15:52:46 -0400
In-Reply-To: <1559768018-7665-1-git-send-email-cai@lca.pw>
References: <1559768018-7665-1-git-send-email-cai@lca.pw>
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
Cc: linuxppc-dev@lists.ozlabs.org, paulus@samba.org, tyreld@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ping.

On Wed, 2019-06-05 at 16:53 -0400, Qian Cai wrote:
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
> Suggested-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
> 
> v2: fix it by using a NOP while loop.
> 
>  arch/powerpc/kernel/setup_64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 44b4c432a273..bed4ae8d338c 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -71,7 +71,7 @@
>  #ifdef DEBUG
>  #define DBG(fmt...) udbg_printf(fmt)
>  #else
> -#define DBG(fmt...)
> +#define DBG(fmt...) do { } while (0)
>  #endif
>  
>  int spinning_secondaries;
