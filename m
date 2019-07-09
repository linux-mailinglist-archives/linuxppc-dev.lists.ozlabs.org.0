Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6506262EFD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 05:37:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jSgF3c52zDqRf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 13:37:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jSdf6DdqzDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 13:35:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CJiBwLV5"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45jSdf2D28z8t7D
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 13:35:50 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45jSdd6Pgmz9sNH; Tue,  9 Jul 2019 13:35:49 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CJiBwLV5"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45jSdd3hlWz9sMQ;
 Tue,  9 Jul 2019 13:35:48 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id i10so40022553iol.13;
 Mon, 08 Jul 2019 20:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JaoS/xwrcMjIyr9vgUEMUpK0WXNWdCfn6nTIH2BE7qQ=;
 b=CJiBwLV5d+8M2nDN0l29OD9oOwFkZvQoIR4HUnv0UQ4NohKFOo1RKAcFeHlwOYMO9i
 f6jwhMx3F1p5VQOg0l1HpNW5pOO7dcJ95KmvIfsWjS12lEJmmeaV4T6XbSLmUzunL7Z4
 +zW6MwPB7bI6z6pSHSxdr0dEEsvafIfdE572BvarSbTMr+XUWVUTehcJG0/L1fcQ/Ci8
 olUrOBTiavU0DFXo41r7uzix7DUCrJbRzks//xpgHwAqMzeOJfoZ84MZH+HZfFd1nb6i
 gW/yDvsfm4d0/VKYH2AHJBhgTI9H8xG4tWym6ofLZUfHXD8+K2ifPy+8LRyVrq/DKF56
 QHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JaoS/xwrcMjIyr9vgUEMUpK0WXNWdCfn6nTIH2BE7qQ=;
 b=pLdbktQgcRCiafEsVQspvDYXhl8Ctt3cPDnqOkFSfq4RHhYSKTvIskmWPBYTzaGxml
 yQa950yRetUDHNhEeQ2lufTLHj0e3pFDF2ufa1nBZzR5m1/vRbMFImmSseP7TOAk9PU6
 ok6Lt4lKSRlaEcG7Zbp2xQIqYgKy3de21ikxqT0OWRxGGdBbCRoFbWmyM+YcWtjKCHth
 6HdFV1uObEaF282UXhk4f9OZHf9IuBzUXaQnavhGVFx9nNjgreZOPvhn6kQMXOYltd5w
 CUSqimNJIz1nfYIPfbqzlA9nfB9meq8ABKowEmjbZk6uwSyxZR/2fVue7eUKhrBjvDY8
 sYig==
X-Gm-Message-State: APjAAAV6u6e6sJh2fMG/ZNqp7oLmNNx+OvYRHfS4AIFc71PnqeVwgrcU
 9AQ30fWRw/np8z7R+jM4DC7RLBpzmf+v4sNlHlw=
X-Google-Smtp-Source: APXvYqw7JnmTFV0p9XmcusnvRmMRsnItsAf/xkVOhqmIsHhlm0im+EMiWG47Gg3GvkqR0idBrlfL2NC7mAiMrglhHsE=
X-Received: by 2002:a5d:8404:: with SMTP id i4mr8929682ion.146.1562643345658; 
 Mon, 08 Jul 2019 20:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190708201249.29649-1-cclaudio@linux.ibm.com>
In-Reply-To: <20190708201249.29649-1-cclaudio@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 9 Jul 2019 13:35:34 +1000
Message-ID: <CAOSf1CHmvvKHn4oHD28HcUHPh579ZjxQc50kBEMtrn60QiX1BA@mail.gmail.com>
Subject: Re: [RFC PATCH] powerpc/powernv: Add ultravisor message log interface
To: Claudio Carvalho <cclaudio@linux.ibm.com>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Ryan Grimm <grimm@linux.ibm.com>, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 9, 2019 at 6:12 AM Claudio Carvalho <cclaudio@linux.ibm.com> wrote:
>
> From: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
>
> Ultravisor provides an in-memory circular buffer containing a message
> log populated with various runtime message produced by firmware.
>
> Based on "powernv/opal-msglog.c", this patch provides a sysfs interface
> /sys/firmware/opal/uv_msglog for userspace to view the messages.

No, it's a copy and paste of the existing memcons code with "uv"
sprinked around the place. I don't mind stuff being c+p since it's
occasionally justified, but be honest about it.

> diff --git a/arch/powerpc/platforms/powernv/opal-uv-msglog.c b/arch/powerpc/platforms/powernv/opal-uv-msglog.c
> new file mode 100644
> index 000000000000..87d665d7e6ad
> --- /dev/null
> +++ b/arch/powerpc/platforms/powernv/opal-uv-msglog.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * PowerNV OPAL in-memory ultravisor console interface
> + *
> + * Copyright 2018 IBM Corp.
> + */
> +#include <asm/io.h>
> +#include <asm/opal.h>
> +#include <linux/debugfs.h>
> +#include <linux/of.h>
> +#include <linux/types.h>
> +#include <asm/barrier.h>
> +
> +/* OPAL in-memory console. Defined in OPAL source at core/console.c */
> +struct memcons {
> +       __be64 magic;
> +#define MEMCONS_MAGIC  0x6630696567726173L
> +       __be64 obuf_phys;
> +       __be64 ibuf_phys;
> +       __be32 obuf_size;
> +       __be32 ibuf_size;
> +       __be32 out_pos;
> +#define MEMCONS_OUT_POS_WRAP   0x80000000u
> +#define MEMCONS_OUT_POS_MASK   0x00ffffffu
> +       __be32 in_prod;
> +       __be32 in_cons;
> +};
> +
> +static struct memcons *opal_uv_memcons;
> +
> +ssize_t opal_uv_msglog_copy(char *to, loff_t pos, size_t count)
> +{
> +       const char *conbuf;
> +       ssize_t ret;
> +       size_t first_read = 0;
> +       uint32_t out_pos, avail;
> +
> +       if (!opal_uv_memcons)
> +               return -ENODEV;
> +
> +       out_pos = be32_to_cpu(READ_ONCE(opal_uv_memcons->out_pos));
> +
> +       /*
> +        * Now we've read out_pos, put a barrier in before reading the new data
> +        * it points to in conbuf.
> +        */
> +       smp_rmb();
> +
> +       conbuf = phys_to_virt(be64_to_cpu(opal_uv_memcons->obuf_phys));
> +
> +       /*
> +        * When the buffer has wrapped, read from the out_pos marker to the end
> +        * of the buffer, and then read the remaining data as in the un-wrapped
> +        * case.
> +        */
> +       if (out_pos & MEMCONS_OUT_POS_WRAP) {
> +
> +               out_pos &= MEMCONS_OUT_POS_MASK;
> +               avail = be32_to_cpu(opal_uv_memcons->obuf_size) - out_pos;
> +
> +               ret = memory_read_from_buffer(to, count, &pos,
> +                               conbuf + out_pos, avail);
> +
> +               if (ret < 0)
> +                       goto out;
> +
> +               first_read = ret;
> +               to += first_read;
> +               count -= first_read;
> +               pos -= avail;
> +
> +               if (count <= 0)
> +                       goto out;
> +       }
> +
> +       /* Sanity check. The firmware should not do this to us. */
> +       if (out_pos > be32_to_cpu(opal_uv_memcons->obuf_size)) {
> +               pr_err("OPAL: memory console corruption. Aborting read.\n");
> +               return -EINVAL;
> +       }
> +
> +       ret = memory_read_from_buffer(to, count, &pos, conbuf, out_pos);
> +
> +       if (ret < 0)
> +               goto out;
> +
> +       ret += first_read;
> +out:
> +       return ret;
> +}
Make this take an struct memcons as an argument and use the same
function for the opal and UV consoles. Two copies of the same code
with tricky barrier crap in them is not a good idea.

> +static struct bin_attribute opal_uv_msglog_attr = {
> +       .attr = {.name = "uv_msglog", .mode = 0444},
We made the OPAL console only readable to root recently, so the mode
should be 0400.
> +       .read = opal_uv_msglog_read
> +};
> +

> +void __init opal_uv_msglog_init(void)
> +{
> +       u64 mcaddr;
> +       struct memcons *mc;
Declarations are reverse-christmas-tree, so these should be the other
way around.

> +
> +       if (of_property_read_u64(opal_node, "ibm,opal-uv-memcons", &mcaddr)) {
> +               pr_warn("OPAL: Property ibm,opal-uv-memcons not found\n");
> +               return;
> +       }
> +
> +       mc = phys_to_virt(mcaddr);
> +       if (!mc) {
> +               pr_warn("OPAL: uv memory console address is invalid\n");
> +               return;
> +       }
> +
> +       if (be64_to_cpu(mc->magic) != MEMCONS_MAGIC) {
> +               pr_warn("OPAL: uv memory console version is invalid\n");
> +               return;
> +       }
> +
> +       /* Report maximum size */
> +       opal_uv_msglog_attr.size =  be32_to_cpu(mc->ibuf_size) +
> +               be32_to_cpu(mc->obuf_size);
> +
> +       opal_uv_memcons = mc;
> +}

You can probably share this too if you make it take the DT property
name of the memcons address as an argument, e.g:

struct memcons *opal_uv_msglog_init(const char *dt_prop_name)

> +
> +void __init opal_uv_msglog_sysfs_init(void)
> +{
> +       if (!opal_uv_memcons) {
> +               pr_warn("OPAL: message log initialisation failed, not creating sysfs entry\n");
> +               return;
> +       }
> +
> +       if (sysfs_create_bin_file(opal_kobj, &opal_uv_msglog_attr) != 0)
> +               pr_warn("OPAL: sysfs file creation failed\n");
> +}

> diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
> index 89b6ddc3ed38..ed000a788456 100644
> --- a/arch/powerpc/platforms/powernv/opal.c
> +++ b/arch/powerpc/platforms/powernv/opal.c
> @@ -946,6 +946,7 @@ static int __init opal_init(void)
>
>         /* Initialise OPAL message log interface */
>         opal_msglog_init();
> +       opal_uv_msglog_init();

Gate this behind a FW_FEATURE_ULTRAVISOR (or whatever it is) check.
The opal_uv_msglog_init() prints errors at pr_warn() which is going to
be spurious for non-uv systems.

>         /* Create "opal" kobject under /sys/firmware */
>         rc = opal_sysfs_init();
> @@ -964,6 +965,7 @@ static int __init opal_init(void)
>                 opal_sys_param_init();
>                 /* Setup message log sysfs interface. */
>                 opal_msglog_sysfs_init();
> +               opal_uv_msglog_sysfs_init();
Also gate this.

Basicly, fold this all into the existing memcons code and ifdef the UV
specific bits. They're just not different enough to justify doing
otherwise.

Oliver
