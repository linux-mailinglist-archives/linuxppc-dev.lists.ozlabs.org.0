Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7D9124233
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 09:50:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d7yB4vBJzDqDC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 19:50:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="ZOC7C1xq"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d7Lb3TlczDqdc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 19:23:18 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id x185so802150pfc.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 00:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=u6YuZYHprAHHi0QwOfU3E3YITTrm0AcZfhRLKsJtsT4=;
 b=ZOC7C1xq1t7VDphwBtvlYLLrsokgL4RWFfDwz2kbOq+lOrHUd4NWi1XbeoKsyA5SvE
 v0MKtw83sMXut/S0l5vDtG6zBxKy3WqVSmUVerYJigETcdUPYvHCpknEqBULcl+Fd3nJ
 5OR7BnGl0f3wcdSf/azCbOxG1Mw4WhpOXnBi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=u6YuZYHprAHHi0QwOfU3E3YITTrm0AcZfhRLKsJtsT4=;
 b=WCmNXUdaAkhyR4pOJFUrB2OHUamTvrk8t3S5J0w+OiZV2wZUpzIRjAplhSBXAeT6t4
 tzmX14BzZCn1ihfT92OP3p+DKsJaCJZFhFwfACyfqLxea6yg2kgi0VboF/sQ1Syp5srJ
 JlTNWS/LTYSsRuM9WaVl2M5DH5d4ixLNbujxMZgflXXp+a0st4UiIRNDytQ+chkQkYBN
 239EkOhoukQkHJYg/NkNO2HbJdwrvc82XPkjCgBiLRhC5AYOxoMURM5SjsFBJslIsOAF
 UoMlg/RNLoiNV7Jj9K3s8p4NI5MGtoAFwSkbxjSfwZsb66O/Q8hLNh1DyhrHIWtXKwka
 dDpQ==
X-Gm-Message-State: APjAAAXhw3BHAPg9Lt+GBaIy7Ft5vRNR3lM0U19Yal1mzvHACx1F3bKx
 e3t34aoXFlnDPUhe1QuEnM0iuA==
X-Google-Smtp-Source: APXvYqy5wQjGRBOLJMF5efGSjev0LGgQSKnO0x9a8KPptpbEyk+K6Pwlx+A6USOEs2166ugmVpGJRg==
X-Received: by 2002:aa7:9629:: with SMTP id r9mr1698424pfg.51.1576657395370;
 Wed, 18 Dec 2019 00:23:15 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-a084-b324-40b3-453d.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:a084:b324:40b3:453d])
 by smtp.gmail.com with ESMTPSA id o17sm1596866pjq.1.2019.12.18.00.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 00:23:14 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 03/18] powerpc: Add PREFIXED SRR1 bit for future ISA
 version
In-Reply-To: <20191126052141.28009-4-jniethe5@gmail.com>
References: <20191126052141.28009-1-jniethe5@gmail.com>
 <20191126052141.28009-4-jniethe5@gmail.com>
Date: Wed, 18 Dec 2019 19:23:11 +1100
Message-ID: <87v9qet53k.fsf@dja-thinkpad.axtens.net>
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
Cc: alistair@popple.id.au, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe <jniethe5@gmail.com> writes:

> Add the bit definition for exceptions caused by prefixed instructions.
>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/include/asm/reg.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 6f9fcc3d4c82..0a6d39fb4769 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -778,6 +778,7 @@
>  
>  #define   SRR1_MCE_MCP		0x00080000 /* Machine check signal caused interrupt */
>  #define   SRR1_BOUNDARY		0x10000000 /* Prefixed instruction crosses 64-byte boundary */
> +#define   SRR1_PREFIXED		0x20000000 /* Exception caused by prefixed instruction */

You could probably squash this with the previous patch, and maybe the
next patch too.

Regards,
Daniel

>  
>  #define SPRN_HSRR0	0x13A	/* Save/Restore Register 0 */
>  #define SPRN_HSRR1	0x13B	/* Save/Restore Register 1 */
> -- 
> 2.20.1
