Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0098C45461
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 07:56:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Q8xs4CdnzDr6Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 15:56:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::244; helo=mail-oi1-x244.google.com;
 envelope-from=ego.lkml@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TxpzZpCq"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Q8wD4n1tzDr6Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 15:55:24 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id a127so437092oii.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 22:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=iwpuu5wCpuYiSfmZzEXzYD+dXFYfwzinCc1ry+q/KxA=;
 b=TxpzZpCqtVt4FFWuw218Wu0n3+XDJONggkyxyt9HenQvc9ZWSSuJBU1xFQiz7goH+X
 XIhI5WIno+VjKIX7rIUGNQN19XOhSK7POkhw/V6cpZ8zD7Umzu87hA43Jzy0FQBRsAzJ
 hKs8B/fODl1InOPK1QX662W4dgI2KH/wul7xFx8PtfjWfhiVvFmbMSqyOYDadBCVy0GQ
 tEgDrkXoHkGooOWMYwy/r3phqgHCGLSNmZQ5qlfWo8hw/gvqOaJPSQqdnm9WZA5PuHCo
 Pnk2xL9d5c5+Prw6qySnZj26bm/wFdpIsOoUAW/FCjHg3IwPjLfL3328NL72v19UjRKe
 PuVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=iwpuu5wCpuYiSfmZzEXzYD+dXFYfwzinCc1ry+q/KxA=;
 b=G4X7HlOW3G+HQmluxkEVg3K9JtetS9EYuHMYhiWNRIxWw9ghJZR2t6+oQQ/Lla8Od5
 1XkCnTAZA6t/rd5NzS5dCS4mjzdkxNrUPP5/RQ4MzUdcfjJtN9RmcmbbtDDdGGZxkaIe
 8Iz0rAAemNwROOoWkdGqZOzUOctjN0/cwThxzKZIISH0iMXlNWKukb/ZFvQS+9YegHe5
 /2Dv+pYVsFagv5Ja4MSkYzhBjRGBOnJ2AY1iVfv88enasYyzqYPQgPIyLmtEaxZiZvSE
 gWgP9lPgrVgWnZF7QBzs3OnnHBlvkhpMzgH/uJZrWEXziUejKsB3b4ooepxSABsJ1NuH
 6WhQ==
X-Gm-Message-State: APjAAAWibZ/7p7whqBP1VZfS4gFh9NoTg6H3ufQ5Jj19HyYsJBgtSc3P
 ub9KCnJ2A41uGHPIBVj3Nz1R8fqpB1/Z7UxnpvU=
X-Google-Smtp-Source: APXvYqw8zOoUIFQymcz5vSUvvJz3TfXTwoqfZJtUBhTdbKAM2upFI3SZ2gwbSe+AnSuNMmFbKUY9BWU3fgrRgZI8Gvw=
X-Received: by 2002:aca:cfd0:: with SMTP id f199mr744433oig.50.1560491720799; 
 Thu, 13 Jun 2019 22:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190612044506.16392-1-nathanl@linux.ibm.com>
 <20190612044506.16392-2-nathanl@linux.ibm.com>
In-Reply-To: <20190612044506.16392-2-nathanl@linux.ibm.com>
From: Gautham R Shenoy <ego.lkml@gmail.com>
Date: Fri, 14 Jun 2019 11:25:09 +0530
Message-ID: <CAHZ_5Wx12GBbBw1caWa8c31XOE3pVSOTHAYdJ37mdheFjn58Kw@mail.gmail.com>
Subject: Re: [PATCH 1/3] powerpc/cacheinfo: add cacheinfo_teardown,
 cacheinfo_rebuild
To: Nathan Lynch <nathanl@linux.ibm.com>, ego@linux.vnet.ibm.com
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
Reply-To: ego@linux.vnet.ibm.com
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 12, 2019 at 10:15 AM Nathan Lynch <nathanl@linux.ibm.com> wrote:
>
> Allow external callers to force the cacheinfo code to release all its
> references to cache nodes, e.g. before processing device tree updates
> post-migration, and to rebuild the hierarchy afterward.
>
> CPU online/offline must be blocked by callers; enforce this.
>
> Fixes: 410bccf97881 ("powerpc/pseries: Partition migration in the kernel")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/cacheinfo.c | 21 +++++++++++++++++++++
>  arch/powerpc/kernel/cacheinfo.h |  4 ++++
>  2 files changed, 25 insertions(+)
>
> diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
> index 862e2890bd3d..42c559efe060 100644
> --- a/arch/powerpc/kernel/cacheinfo.c
> +++ b/arch/powerpc/kernel/cacheinfo.c
> @@ -896,4 +896,25 @@ void cacheinfo_cpu_offline(unsigned int cpu_id)
>         if (cache)
>                 cache_cpu_clear(cache, cpu_id);
>  }
> +
> +void cacheinfo_teardown(void)
> +{
> +       unsigned int cpu;
> +
> +       lockdep_assert_cpus_held();
> +
> +       for_each_online_cpu(cpu)
> +               cacheinfo_cpu_offline(cpu);
> +}
> +
> +void cacheinfo_rebuild(void)
> +{
> +       unsigned int cpu;
> +
> +       lockdep_assert_cpus_held();
> +
> +       for_each_online_cpu(cpu)
> +               cacheinfo_cpu_online(cpu);
> +}
> +
>  #endif /* (CONFIG_PPC_PSERIES && CONFIG_SUSPEND) || CONFIG_HOTPLUG_CPU */
> diff --git a/arch/powerpc/kernel/cacheinfo.h b/arch/powerpc/kernel/cacheinfo.h
> index 955f5e999f1b..52bd3fc6642d 100644
> --- a/arch/powerpc/kernel/cacheinfo.h
> +++ b/arch/powerpc/kernel/cacheinfo.h
> @@ -6,4 +6,8 @@
>  extern void cacheinfo_cpu_online(unsigned int cpu_id);
>  extern void cacheinfo_cpu_offline(unsigned int cpu_id);
>
> +/* Allow migration/suspend to tear down and rebuild the hierarchy. */
> +extern void cacheinfo_teardown(void);
> +extern void cacheinfo_rebuild(void);
> +
>  #endif /* _PPC_CACHEINFO_H */
> --
> 2.20.1
>


-- 
Thanks and Regards
gautham.
