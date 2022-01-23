Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21091497174
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 13:17:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhXDH0Z1dz3bTg
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 23:17:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ezVPD2aR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a29;
 helo=mail-vk1-xa29.google.com; envelope-from=michael.heltne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ezVPD2aR; dkim-atps=neutral
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [IPv6:2607:f8b0:4864:20::a29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhXCZ0xlyz2xF9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 23:16:24 +1100 (AEDT)
Received: by mail-vk1-xa29.google.com with SMTP id 48so5267189vki.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 04:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=bHM5LPj+MWJ2EUEK2RZz+3kuQJJS+vxxq4N6devifCk=;
 b=ezVPD2aRv3Cm+xrqJK4ySjDB4fkIfpLfRGhFIL3fhmT9j8uZ8WMGTmRDv0c2NNK/o9
 srUR4H/7af/YZNjtoGxlc5TxNR5ebX2reB6knGS9zXN6fo0iBR8+lJQUxbGg+ig+iMlI
 vC+8CA7hoIakfSN1sV2XrH/V3bzuu9JEVm/wNDWPbeQv8G6ofYq2vcAO8T/7VGOR+73a
 iW1rDK8mMeI8Kl23yNIPf5n2roLdfCZyKWCYA98Sf5yVJL9+2TquSjy8yQEdfYCXbfJv
 47CWmG8cj4jEPP0CkHwQ7gbbppsuuDo2zkicOzlNhL5Dn3kn08CdYGGmoQuGLPEi3WLf
 6kEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=bHM5LPj+MWJ2EUEK2RZz+3kuQJJS+vxxq4N6devifCk=;
 b=R6oXmt7yI4OWMqtJMgrVTjDXL+jV+GxsZSCbjwV2To/LzinKlnPbax4+WdbtPLGEsH
 cIJwk1jN00CmgWiU+TU1jb+t0Fcdjf7QMFi5IjRWvPlGFH4BF32hjG+SK/NW7XFMIOsR
 IRV82nMaQkAlW8YUAXDVr3VkcHFdU1L39jKugz172cfQM+iW2LIQTuz0aKxdqStNsf7/
 tHOvmmrTD063sAtqZu/CMJR+tKHG19MvKEAglDxYKET2ORO/o+meWfY0EQciCwgTj/Ko
 +4TR4Ev4v0KrxbbfauyW4gst7pf/+ZjwHg+cX0/WZDjy5RmWDJcKhDaWmETr/8xjzvCw
 zehA==
X-Gm-Message-State: AOAM533jYB5h/fKK3C+cGJBwylMDlOINyOjyfDhrVS1KsmU93FWl9jWi
 PwhuJSzousA3u1CmxxFTWKQJ9ZCJYCIHjJg/mATXtPWQRkIA0w==
X-Google-Smtp-Source: ABdhPJyetrhH16GM9WUD+UF2y7PBp6s08DvoP9P/4yLc8VjNcifLlEQymxz0PKUZzL+o2n5ZfPRvZ+l1mjNXAcQvHxs=
X-Received: by 2002:a1f:b689:: with SMTP id g131mr4267868vkf.9.1642940180538; 
 Sun, 23 Jan 2022 04:16:20 -0800 (PST)
MIME-Version: 1.0
References: <CANtoAtP2QeH+fMqHo410H=nkjRiLhYNYjhKiEpMyWRHkMGw2iA@mail.gmail.com>
In-Reply-To: <CANtoAtP2QeH+fMqHo410H=nkjRiLhYNYjhKiEpMyWRHkMGw2iA@mail.gmail.com>
From: Mike <michael.heltne@gmail.com>
Date: Sun, 23 Jan 2022 15:18:54 +0100
Message-ID: <CANtoAtNFOJyqdiwBG9AfQTEZm91MUf5LUof88xwP-Ou7Uh4xYA@mail.gmail.com>
Subject: Re: [PATCH] powerpc: fix building after binutils changes.
To: "open list:LINUX FOR POWERPC..." <linuxppc-dev@lists.ozlabs.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Maybe cite the correct parts of the patch where my questions arose for context.
---
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index a94b0cd0bdc5ca..4ffd6791b03ec0 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1465,7 +1465,7 @@ int analyse_instr(struct instruction_op *op,
const struct pt_regs *regs,
  switch ((word >> 1) & 0x3ff) {
  case 598: /* sync */
  op->type = BARRIER + BARRIER_SYNC;
-#ifdef __powerpc64__
+#ifdef CONFIG_PPC64
  switch ((word >> 21) & 3) {
  case 1: /* lwsync */
  op->type = BARRIER + BARRIER_LWSYNC;
@@ -3267,9 +3267,11 @@ void emulate_update_regs(struct pt_regs *regs,
struct instruction_op *op)
  case BARRIER_LWSYNC:
  asm volatile("lwsync" : : : "memory");
  break;
+#ifdef CONFIG_PPC64
  case BARRIER_PTESYNC:
  asm volatile("ptesync" : : : "memory");
  break;
+#endif
  }
  break;
-----

On Sun, 23 Jan 2022 at 14:43, Mike <michael.heltne@gmail.com> wrote:
>
> As some have probably noticed, we are seeing errors like ' Error:
> unrecognized opcode: `ptesync'' 'dssall' and 'stbcix' as a result of
> binutils changes, making compiling all that more fun again. The only
> question on my mind still is this:
> ----
> diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
> index beba4979bff939..d3a9c91cd06a8b 100644
> --- a/arch/powerpc/include/asm/io.h
> +++ b/arch/powerpc/include/asm/io.h
> @@ -334,7 +334,7 @@ static inline void __raw_writel(unsigned int v,
> volatile void __iomem *addr)
>  }
>  #define __raw_writel __raw_writel
>
> -#ifdef __powerpc64__
> +#ifdef CONFIG_PPC64
>  static inline unsigned long __raw_readq(const volatile void __iomem *addr)
>  {
>   return *(volatile unsigned long __force *)PCI_FIX_ADDR(addr);
> @@ -352,7 +352,8 @@ static inline void __raw_writeq_be(unsigned long
> v, volatile void __iomem *addr)
>   __raw_writeq((__force unsigned long)cpu_to_be64(v), addr);
>  }
>  #define __raw_writeq_be __raw_writeq_be
> -
> +#endif
> +#ifdef CONFIG_POWER6_CPU
>  /*
>   * Real mode versions of the above. Those instructions are only supposed
>   * to be used in hypervisor real mode as per the architecture spec.
> @@ -417,7 +418,7 @@ static inline u64 __raw_rm_readq(volatile void
> __iomem *paddr)
>       : "=r" (ret) : "r" (paddr) : "memory");
>   return ret;
>  }
> -#endif /* __powerpc64__ */
>
> +#endif /* CONFIG_POWER6_CPU */
>
> ---
> Will there come a mail saying this broke the PPC6'ish based CPU
> someone made in their garage? And lwesync is a valid PPC32
> instruction, should i just follow the example above where
> BARRIER_LWESYNC is PPC64 only?
>
> https://github.com/threader/linux/commits/master-build-ppc - linux-next
>
> Best regards.
> Michael Heltne
