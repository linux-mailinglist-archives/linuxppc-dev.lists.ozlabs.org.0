Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 759F845465
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 07:58:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Q8zw0QgxzDrPR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 15:58:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::344; helo=mail-ot1-x344.google.com;
 envelope-from=ego.lkml@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fFLtEYN/"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Q8yK4Q7VzDr6Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 15:57:13 +1000 (AEST)
Received: by mail-ot1-x344.google.com with SMTP id 107so1543511otj.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 22:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=G6P7y2hjx17T43txWpbVd2awuwjIpioQ54mi2MK0UIw=;
 b=fFLtEYN/jLudZsmOpQD9ZR6hQM5nGCKCNSaPAuU92Jesi2ycnoNFQ1EJgs1qrBJ1xF
 kqJ+ESNqF/W8P8sXSpWgSlmvaiCxAuN0yacFj+TQIbyUiCSIbK5pajIeTA7xi31j+2xI
 G+1jmP7y3NcoQ0NuibG3zx0IfdYEKIrwmtZQcBM7oZAlVKsj3altIfKVZAUDM4sxts5g
 DElEOHRhRbhjD+hCGhXNHuy4sSwEwOz/Wy+XvcwLjQrAmcL72BdwAP1LUsPEjJC80NIx
 3AaFHDVFe3XDqQFLTi7Edagtr9iu8FqUGaaja6kujS186ExfAYeb3FCmDdi8SrtD+SLM
 fTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=G6P7y2hjx17T43txWpbVd2awuwjIpioQ54mi2MK0UIw=;
 b=XRT3K58BLkhaKUJkIkz1TOcfjZf0s7hmtOrcoA02+2Gno5LqKNVUWorNuhgrB3OadY
 vx/6bunYolXuBBbceu1JAbCrLjEuKdo903qXKQKAo7iUU+D4sHMwxWj8ekqHpzesTWgD
 W5XrAiiXQbUr/4t2PHKeWkRQpiJcUgwUrvJnA3jMMyCgHqDdKQuSiuCVt0rQ3Gox67e0
 5DEKvV+Zs1DN6RP6VjzAVZLxjSwduQRt2woN+iEfn0QWGaglWJF2QHGRxRmf8khtc5bh
 tmzpSX9jOuTWJOgfgUxMK28fWzjdff3bx2M2fBqlGAt2aKrubi3HE5IhV7IGAt+bAztH
 Ph4w==
X-Gm-Message-State: APjAAAWGTkCBKs9g5YSxLN26u3vgjiJ0WYSWFCz9VWp9ZHf4bANhmLpm
 UgABGythi9Q1fTk1EWpvgc2iZZwevfjiayPrAQhTwg==
X-Google-Smtp-Source: APXvYqzOJskhV9yqWV8dsTmYJ3lO8r7xM1JUEpCME+kdDVX/IKTivqcLKwegqr2U2Garg0BMnmulpt3284vt0sQmr7A=
X-Received: by 2002:a05:6830:114d:: with SMTP id
 x13mr4198521otq.162.1560491830264; 
 Thu, 13 Jun 2019 22:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190612044506.16392-1-nathanl@linux.ibm.com>
 <20190612044506.16392-4-nathanl@linux.ibm.com>
In-Reply-To: <20190612044506.16392-4-nathanl@linux.ibm.com>
From: Gautham R Shenoy <ego.lkml@gmail.com>
Date: Fri, 14 Jun 2019 11:26:59 +0530
Message-ID: <CAHZ_5WxOCCSTOYUJYU84sPpwEkrnSQP=zWPcfGziLv8GSSBWOQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] powerpc/pseries/mobility: rebuild cacheinfo hierarchy
 post-migration
To: Nathan Lynch <nathanl@linux.ibm.com>
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

On Wed, Jun 12, 2019 at 10:17 AM Nathan Lynch <nathanl@linux.ibm.com> wrote:
>
> It's common for the platform to replace the cache device nodes after a
> migration. Since the cacheinfo code is never informed about this, it
> never drops its references to the source system's cache nodes, causing
> it to wind up in an inconsistent state resulting in warnings and oopses
> as soon as CPU online/offline occurs after the migration, e.g.
>
> cache for /cpus/l3-cache@3113(Unified) refers to cache for /cpus/l2-cache@200d(Unified)
> WARNING: CPU: 15 PID: 86 at arch/powerpc/kernel/cacheinfo.c:176 release_cache+0x1bc/0x1d0
> [...]
> NIP [c00000000002d9bc] release_cache+0x1bc/0x1d0
> LR [c00000000002d9b8] release_cache+0x1b8/0x1d0
> Call Trace:
> [c0000001fc99fa70] [c00000000002d9b8] release_cache+0x1b8/0x1d0 (unreliable)
> [c0000001fc99fb10] [c00000000002ebf4] cacheinfo_cpu_offline+0x1c4/0x2c0
> [c0000001fc99fbe0] [c00000000002ae58] unregister_cpu_online+0x1b8/0x260
> [c0000001fc99fc40] [c000000000165a64] cpuhp_invoke_callback+0x114/0xf40
> [c0000001fc99fcd0] [c000000000167450] cpuhp_thread_fun+0x270/0x310
> [c0000001fc99fd40] [c0000000001a8bb8] smpboot_thread_fn+0x2c8/0x390
> [c0000001fc99fdb0] [c0000000001a1cd8] kthread+0x1b8/0x1c0
> [c0000001fc99fe20] [c00000000000c2d4] ret_from_kernel_thread+0x5c/0x68
>
> Using device tree notifiers won't work since we want to rebuild the
> hierarchy only after all the removals and additions have occurred and
> the device tree is in a consistent state. Call cacheinfo_teardown()
> before processing device tree updates, and rebuild the hierarchy
> afterward.
>
> Fixes: 410bccf97881 ("powerpc/pseries: Partition migration in the kernel")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> ---
>  arch/powerpc/platforms/pseries/mobility.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
> index edc1ec408589..b8c8096907d4 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -23,6 +23,7 @@
>  #include <asm/machdep.h>
>  #include <asm/rtas.h>
>  #include "pseries.h"
> +#include "../../kernel/cacheinfo.h"
>
>  static struct kobject *mobility_kobj;
>
> @@ -345,11 +346,20 @@ void post_mobility_fixup(void)
>          */
>         cpus_read_lock();
>
> +       /*
> +        * It's common for the destination firmware to replace cache
> +        * nodes.  Release all of the cacheinfo hierarchy's references
> +        * before updating the device tree.
> +        */
> +       cacheinfo_teardown();
> +
>         rc = pseries_devicetree_update(MIGRATION_SCOPE);
>         if (rc)
>                 printk(KERN_ERR "Post-mobility device tree update "
>                         "failed: %d\n", rc);
>
> +       cacheinfo_rebuild();
> +
>         cpus_read_unlock();
>
>         /* Possibly switch to a new RFI flush type */
> --
> 2.20.1
>


-- 
Thanks and Regards
gautham.
