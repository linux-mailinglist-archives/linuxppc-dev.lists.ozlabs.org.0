Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E82F6C70
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 02:46:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BDJ91m7TzF4RJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 12:46:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=eric.dumazet@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OuiFYHhb"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BDGF2rL7zDrCJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 12:45:05 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id n13so9589543pff.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2019 17:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=80X0XSD0z9TSGmjUVgRibRN8mNevgQEBc1olihW2u6g=;
 b=OuiFYHhbZ9Jlgoq/7aQ7D0VlRd9aa0SuAm/xmePlv1T/040HatzWfRj/hJcLZa3cWl
 KnM2nXGTg6LmyIIGYQF9iRWBXC8f5Y+uaL9ac9d4kaA6dk8Sx9lQyJntnXIWifO/yr1z
 0RT3gkcUNJO/RKdqlK0wRudZuTiAuCm2xuz3G9XYqecXQmi+IrzL3F/brfVbv6VlQx56
 CTD+nRI7PIushCJ085u4FrzZDmofIReN95+TQJyODH4UJQTIFrxJN4FojhuDt/5VkvwA
 RQe3t6wyBTfocf10L13HjL7lmRKy52BbCrjzCO9P+9dvLlFRmgZ3XcA22pOIc8cq6tCZ
 ChLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=80X0XSD0z9TSGmjUVgRibRN8mNevgQEBc1olihW2u6g=;
 b=W83St0Z9YMokVcrxQLogY0UTB8ZTU2aDZl2x+1mqkE1Np0xPT/E+sglbeM0MbqWVrY
 1/qu92TQ2BJSG0h6kGJuyqvR9XPrCJp69d/admNxX2tsd13WfgtZzFrkfY5ahf9QYict
 uACSHKsu43rYutrhk91cc3051F46XgCdunaNAcYOxNXK3LDUApS6fdLeiXCVZXJ1ahDr
 2Uw7rYThesX0hMf/YjuJp5BHU1Gxq5qL62j1sR8nt+51lLFtiW7yNxx6mJpnFbOTDXIs
 DTR7Hj1qACEGHdEpig6U9+PU+hN//fxJ5F1eC3Wo4YY49zPlDMBDjSWK7oEuaLaIcf+O
 H2kg==
X-Gm-Message-State: APjAAAXXWCX46RemDgO355sDxd8fG9t+NHaNQHuI0Yi98D9rUKxw81Tj
 vezU4qHpqWSmaCE7L7KSCr19Wgav
X-Google-Smtp-Source: APXvYqzq3k1xgi5K27cvzCuxPJRBEviwJSeyWLqUc78Sumo9fyb0YLWuKtwUi8vNz/jJ3hJ8eT158A==
X-Received: by 2002:a62:1953:: with SMTP id 80mr27049192pfz.72.1573436702889; 
 Sun, 10 Nov 2019 17:45:02 -0800 (PST)
Received: from [192.168.86.235] (c-73-241-150-58.hsd1.ca.comcast.net.
 [73.241.150.58])
 by smtp.gmail.com with ESMTPSA id y3sm11526006pgl.78.2019.11.10.17.45.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Nov 2019 17:45:02 -0800 (PST)
Subject: Re: linux-next: build warning after merge of the net-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
References: <20191111123922.540319a2@canb.auug.org.au>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <e71126d6-6c15-297d-0138-4c76d6720186@gmail.com>
Date: Sun, 10 Nov 2019 17:45:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191111123922.540319a2@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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
Cc: Eric Dumazet <edumazet@google.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/10/19 5:39 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the net-next tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> In file included from ./arch/powerpc/include/generated/asm/local64.h:1,
>                  from include/linux/u64_stats_sync.h:72,
>                  from include/linux/cgroup-defs.h:20,
>                  from include/linux/cgroup.h:28,
>                  from include/linux/memcontrol.h:13,
>                  from include/linux/swap.h:9,
>                  from include/linux/suspend.h:5,
>                  from arch/powerpc/kernel/asm-offsets.c:23:
> include/linux/u64_stats_sync.h: In function 'u64_stats_read':
> include/asm-generic/local64.h:30:37: warning: passing argument 1 of 'local_read' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>    30 | #define local64_read(l)  local_read(&(l)->a)
>       |                                     ^~~~~~~
> include/linux/u64_stats_sync.h:80:9: note: in expansion of macro 'local64_read'
>    80 |  return local64_read(&p->v);
>       |         ^~~~~~~~~~~~
> In file included from include/asm-generic/local64.h:22,
>                  from ./arch/powerpc/include/generated/asm/local64.h:1,
>                  from include/linux/u64_stats_sync.h:72,
>                  from include/linux/cgroup-defs.h:20,
>                  from include/linux/cgroup.h:28,
>                  from include/linux/memcontrol.h:13,
>                  from include/linux/swap.h:9,
>                  from include/linux/suspend.h:5,
>                  from arch/powerpc/kernel/asm-offsets.c:23:
> arch/powerpc/include/asm/local.h:20:44: note: expected 'local_t *' {aka 'struct <anonymous> *'} but argument is of type 'const local_t *' {aka 'const struct <anonymous> *'}
>    20 | static __inline__ long local_read(local_t *l)
>       |                                   ~~~~~~~~~^
> 
> Introduced by commit
> 
>   316580b69d0a ("u64_stats: provide u64_stats_t type")
> 
> Powerpc folks: is there some reason that local_read() cannot take a
> const argument?
> 
> I have added this patch (which builds fine) for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 11 Nov 2019 12:32:24 +1100
> Subject: [PATCH] powerpc: local_read() should take a const local_t argument
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/include/asm/local.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/local.h b/arch/powerpc/include/asm/local.h
> index fdd00939270b..bc4bd19b7fc2 100644
> --- a/arch/powerpc/include/asm/local.h
> +++ b/arch/powerpc/include/asm/local.h
> @@ -17,7 +17,7 @@ typedef struct
>  
>  #define LOCAL_INIT(i)	{ (i) }
>  
> -static __inline__ long local_read(local_t *l)
> +static __inline__ long local_read(const local_t *l)
>  {
>  	return READ_ONCE(l->v);
>  }
> 

I have sent this patch two days ago, I do not believe I had any answer from ppc maintainers.

From 47c47befdcf31fb8498c9e630bb8e0dc3ef88079 Mon Sep 17 00:00:00 2001
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 8 Nov 2019 06:04:35 -0800
Subject: [PATCH] powerpc: add const qual to local_read() parameter

A patch in net-next triggered a compile error on powerpc.

This seems reasonable to relax powerpc local_read() requirements.

Fixes: 316580b69d0a ("u64_stats: provide u64_stats_t type")
Signed-off-by: Eric Dumazet <edumazet@google.com>
Reported-by: kbuild test robot <lkp@intel.com>
Cc:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc:	Paul Mackerras <paulus@samba.org>
Cc:	Michael Ellerman <mpe@ellerman.id.au>
Cc:	linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/include/asm/local.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/local.h b/arch/powerpc/include/asm/local.h
index fdd00939270bf08113b537a090d6a6e34a048361..bc4bd19b7fc235b80ec1132f44409b6fe1057975 100644
--- a/arch/powerpc/include/asm/local.h
+++ b/arch/powerpc/include/asm/local.h
@@ -17,7 +17,7 @@ typedef struct
 
 #define LOCAL_INIT(i)	{ (i) }
 
-static __inline__ long local_read(local_t *l)
+static __inline__ long local_read(const local_t *l)
 {
 	return READ_ONCE(l->v);
 }
-- 
2.24.0.432.g9d3f5f5b63-goog

