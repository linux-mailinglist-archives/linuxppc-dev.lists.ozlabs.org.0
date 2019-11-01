Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C671EC52D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 15:57:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474QKH4s8wzF3nl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 01:57:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="pJiWpx1Q"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474PZX402RzF70s
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2019 01:24:04 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id s23so3210072pgo.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Nov 2019 07:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=IMfqZTNf1MKqWzQ6EZPjw+OGGIt0HqVhdg1aNy6jKk0=;
 b=pJiWpx1QEvl179v4Uf+NmtLlAgVIYbaD+xGWOlIR2EY6d5BII873FZds3gbkpd5M35
 pCo/CTgZMy0T9znBpC9u36nrbIS4k8CPwAHhRrJU9G8gsR/b9IMya9iBGujrLTssd/kJ
 o22QxXCSwphC0pHYD8zdsjvACwo3BuT4DakM4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=IMfqZTNf1MKqWzQ6EZPjw+OGGIt0HqVhdg1aNy6jKk0=;
 b=qP7d3KX/8X77gWzjXuDSWCkyN+ic5+V2LbODt2EDtDq/NU0hWfxcd/PjvoYekOotmk
 KIaV4cSAfjgcpLJMMOFxH2STQpT6Z2HTrWwY59pPXaDY24SnXn6hTPeIYgFKBP0NLaaq
 WFM2OnNDYSs2RYu8mEu5XVjk75ok1hSO0dvpxbmqXqVw3DFmGNZNmt+qKG0s7REs2hIi
 g4G/+eUdlZkpjWlAx9Z4Wgy7qphzUII2SkyMZFALjgQMa3dCylHDzxaZt6f7tmUj0qQJ
 CoEAhiHx1BO/1qYCTXct9tNhjY0DhcwWWVDC5R4b/3f1+/vFzHPk0xEwL3KlQyIuXviz
 WIlQ==
X-Gm-Message-State: APjAAAXA3z3hzNZcA2tp84YTsscqWObSVCPADcXn0SaCuMQc2Bl2AWL3
 OjbeKLvoDbsuu3TMIC8FOAa1vQ==
X-Google-Smtp-Source: APXvYqwFL0AJDhgZLbiWAevUOF5g87rSxWVhZ6TOxKYVcY5QEsRjFKfI9/sGgolt/ezIpb/xMBmzjQ==
X-Received: by 2002:a63:1b59:: with SMTP id b25mr13671933pgm.267.1572618239018; 
 Fri, 01 Nov 2019 07:23:59 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-40d3-eca3-e70b-6bc4.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:40d3:eca3:e70b:6bc4])
 by smtp.gmail.com with ESMTPSA id c12sm8296253pfp.67.2019.11.01.07.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 07:23:58 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 2/5] powerpc/kprobes: Mark newly allocated probes as RO
In-Reply-To: <20191030073111.140493-3-ruscur@russell.cc>
References: <20191030073111.140493-1-ruscur@russell.cc>
 <20191030073111.140493-3-ruscur@russell.cc>
Date: Sat, 02 Nov 2019 01:23:54 +1100
Message-ID: <8736f7n091.fsf@dja-thinkpad.axtens.net>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Russell Currey <ruscur@russell.cc> writes:

> With CONFIG_STRICT_KERNEL_RWX=y and CONFIG_KPROBES=y, there will be one
> W+X page at boot by default.  This can be tested with
> CONFIG_PPC_PTDUMP=y and CONFIG_PPC_DEBUG_WX=y set, and checking the
> kernel log during boot.
>
> powerpc doesn't implement its own alloc() for kprobes like other
> architectures do, but we couldn't immediately mark RO anyway since we do
> a memcpy to the page we allocate later.  After that, nothing should be
> allowed to modify the page, and write permissions are removed well
> before the kprobe is armed.
>
> Thus mark newly allocated probes as read-only once it's safe to do so.

So if I've got the flow right here:

register[_aggr]_kprobe
 -> prepare_kprobe
  -> arch_prepare_kprobe
       perform memcpy
       mark as readonly, after which no-one touches writes to the memory

which all seems right to me.

I have been trying to check if optprobes need special handling: it looks
like the buffer for them lives in kernel text, not dynamically allocated
memory, so it should be protected by the usual Strict RWX protections
without special treatment here.

So lgtm.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Regards,
Daniel

>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
>  arch/powerpc/kernel/kprobes.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 2d27ec4feee4..2610496de7c7 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -24,6 +24,7 @@
>  #include <asm/sstep.h>
>  #include <asm/sections.h>
>  #include <linux/uaccess.h>
> +#include <linux/set_memory.h>
>  
>  DEFINE_PER_CPU(struct kprobe *, current_kprobe) = NULL;
>  DEFINE_PER_CPU(struct kprobe_ctlblk, kprobe_ctlblk);
> @@ -131,6 +132,8 @@ int arch_prepare_kprobe(struct kprobe *p)
>  			(unsigned long)p->ainsn.insn + sizeof(kprobe_opcode_t));
>  	}
>  
> +	set_memory_ro((unsigned long)p->ainsn.insn, 1);
> +
>  	p->ainsn.boostable = 0;
>  	return ret;
>  }
> -- 
> 2.23.0
