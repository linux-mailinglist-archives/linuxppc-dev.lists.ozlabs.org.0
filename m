Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA673295C8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 04:48:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqNQY5wsVz3cY4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 14:48:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TY3+B7+M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=viresh.kumar@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TY3+B7+M; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqNQ76z9cz30Nc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 14:48:12 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id o6so1013912pjf.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Mar 2021 19:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rcso78BwGVOEbZ2NnBuym7yv8DVTXrh7hVgCEjGyQuo=;
 b=TY3+B7+M/KvcZe3L7pQoy4X0FdgIq/voYvzOau5FSID24UtVk7v3WE7k/f8iodv8vJ
 LvPLWtETGyGwtpqWEQOFmzZD+S2kYdE5BEfZ+/HUOmKkHyNlBtrV072ZL+C+NTajTC0G
 X5dzGEv9x3caCt++C34TiodYRcYwEAHS6SbsLrC3PGX5G99L79QZ5KdNlJH/IkqmAYZW
 PSaRlQtsJ50wnWAfUR+vF//WXjZgdyQZhSNttorjyfLIcfiKXxSfd1MlmT+9STluUKXC
 xTn82LG52drjqxp1lVKTAzxeXg14nS7IRzuN+C8cW/pHezwOivteZokYW6yWDNjbC8SQ
 UhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rcso78BwGVOEbZ2NnBuym7yv8DVTXrh7hVgCEjGyQuo=;
 b=LSqGPZxoLQBVvJyRx/WJFdSPExaWG++01HKMwvHJtipqLMmrTz3DZL4DjeCl9JMSB3
 e1cNPmyiqmryAZDkQimg5eLQlX64DobZDw0fseervbxDo/pPZj2/IzvhmL5cLDTdZieu
 elfT3CAGsBJXKnDNDxb6YDETeqQh19cfZ1HPqVzZm1zYlaQer+N7wtG5PYj7q2gqHzzu
 /Z5bM8En7YMGAP7zY+BE95oLMOidQIAmE9FpbOVR2jtFdg+rL31C2ACPerXDyYQL5ePw
 AbZ/NID/G6gLBOEeTIRhN/QVlQoPAhucBnxmnCSLjgZzp6Vo+lN/IND9DQjMPZs4XQcY
 e0rw==
X-Gm-Message-State: AOAM530Dj8F7Bs/glVSo8wx+sNX0sAjDKnar6mUqHwuFH+UBXrJBy0Op
 eAcYG1e7pFfH3Fplm7/KbtcU3A==
X-Google-Smtp-Source: ABdhPJwQKsFEMRoWRT90TATQNSGem8urGVJxtEyweFNWlgRZJY8WyqNn0YwRQh2NawHUw0w9VJDm2Q==
X-Received: by 2002:a17:90a:7c0c:: with SMTP id
 v12mr2161626pjf.63.1614656887803; 
 Mon, 01 Mar 2021 19:48:07 -0800 (PST)
Received: from localhost ([122.171.124.15])
 by smtp.gmail.com with ESMTPSA id b26sm15332596pfo.1.2021.03.01.19.48.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Mar 2021 19:48:07 -0800 (PST)
Date: Tue, 2 Mar 2021 09:18:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 2/2] powerpc: Remove remaining parts of oprofile
Message-ID: <20210302034805.o7ozib4pxy3t33ly@vireshk-i7>
References: <50ad16925a66ac53890286ceafbf84f6fc324baa.1614600516.git.christophe.leroy@csgroup.eu>
 <0085280627ee44927fc3f07590a8b4909cf8e56d.1614600516.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0085280627ee44927fc3f07590a8b4909cf8e56d.1614600516.git.christophe.leroy@csgroup.eu>
User-Agent: NeoMutt/20180716-391-311a52
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
Cc: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Rashmica Gupta <rashmica.g@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01-03-21, 12:09, Christophe Leroy wrote:
> Commit 9850b6c69356 ("arch: powerpc: Remove oprofile") removed
> oprofile.
> 
> Remove all remaining parts of it.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/cputable.h       |  3 --
>  arch/powerpc/kernel/cputable.c            | 66 +----------------------
>  arch/powerpc/kernel/dt_cpu_ftrs.c         |  4 --
>  arch/powerpc/platforms/cell/spufs/spufs.h |  2 +-
>  4 files changed, 3 insertions(+), 72 deletions(-)

Great, I wasn't sure how the handle the cpu type stuff and so left it
for the right people to handle. :)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
