Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A22D334ABA8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 16:43:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6R834rxFz3cCl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 02:43:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DUfi5ugO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DUfi5ugO; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6R7c0NW4z3c0P
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 02:42:51 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49AFE61A1E
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 15:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616773369;
 bh=vsTZ/vYOkJZ+dX5RIeYP0sX4VHZ0dMLJGNZeZ1Bm2LQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DUfi5ugO3VGJM2909lBb9UInMPNrDa6EKQqVta1cIaa0jmi9PW3AK/KjrURwAztbo
 i8x5fBqV0zqtki7tKp5qsvRSp+6JN+/eJ6Ieou5FWpav1oVdXzMR9PQmnDp1YWOfOs
 rjJ3avEH5azOsGiVuuyxYhIiIBwrj4oZjmpnUvQIneHge5J52ma4iOUznrC66JY4V8
 tPmhAAColcWAlYEXk93IiPpU/VFt/H+KOGM/w6qxjuUILfYJP2A9DdngmKH0rgvYm1
 Dqclqe/hpH6HH+86ckSN06JT8aWetb7V0wJymW/nFAsU2yRrYVduN9qA2/Ow3crzZ9
 +c/utZ5v2WmJQ==
Received: by mail-ej1-f44.google.com with SMTP id u5so9081285ejn.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 08:42:49 -0700 (PDT)
X-Gm-Message-State: AOAM531DOvhAx3G5qz6oN1YvNL80EBT5gGJzfyDha8MsZ3cO6bWHvycy
 QQbDVc+uN+AzpvX4fWDcuNkmLzLfv8uMtHAhdw==
X-Google-Smtp-Source: ABdhPJw290YYi5Bn9eJbiCdu+yLMROaG22thNNy/WhodM/XBcUW19HUG6/I3aYcxY0qwZKx/hSfuN8oDM18cKkgl6sQ=
X-Received: by 2002:a17:906:7d48:: with SMTP id
 l8mr15784305ejp.108.1616773367877; 
 Fri, 26 Mar 2021 08:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
In-Reply-To: <878228ad88df38f8914c7aa25dede3ed05c50f48.1616765869.git.christophe.leroy@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Mar 2021 09:42:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKr3xekKSo3DtQvOOw_VoGC=FUTagZGY5g=CGGGdUZSMQ@mail.gmail.com>
Message-ID: <CAL_JsqKr3xekKSo3DtQvOOw_VoGC=FUTagZGY5g=CGGGdUZSMQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/17] cmdline: Add generic function to build command
 line.
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org, microblaze <monstr@monstr.eu>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 linux-xtensa@linux-xtensa.org, SH-Linux <linux-sh@vger.kernel.org>,
 Will Deacon <will@kernel.org>, X86 ML <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 nios2 <ley.foon.tan@intel.com>, "open list:MIPS" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, linux-hexagon@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Daniel Walker <danielwa@cisco.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 26, 2021 at 7:44 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> This code provides architectures with a way to build command line
> based on what is built in the kernel and what is handed over by the
> bootloader, based on selected compile-time options.

Note that I have this patch pending:

https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210316193820.3137-1-alex@ghiti.fr/

It's going to need to be adapted for this. I've held off applying to
see if this gets settled.

>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v3:
> - Addressed comments from Will
> - Added capability to have src == dst
> ---
>  include/linux/cmdline.h | 57 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 include/linux/cmdline.h
>
> diff --git a/include/linux/cmdline.h b/include/linux/cmdline.h
> new file mode 100644
> index 000000000000..dea87edd41be
> --- /dev/null
> +++ b/include/linux/cmdline.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_CMDLINE_H
> +#define _LINUX_CMDLINE_H
> +
> +#include <linux/string.h>
> +
> +/* Allow architectures to override strlcat, powerpc can't use strings so early */
> +#ifndef cmdline_strlcat
> +#define cmdline_strlcat strlcat
> +#endif
> +
> +/*
> + * This function will append or prepend a builtin command line to the command
> + * line provided by the bootloader. Kconfig options can be used to alter
> + * the behavior of this builtin command line.
> + * @dst: The destination of the final appended/prepended string.
> + * @src: The starting string or NULL if there isn't one.
> + * @len: the length of dest buffer.
> + */
> +static __always_inline void __cmdline_build(char *dst, const char *src, size_t len)
> +{
> +       if (!len || src == dst)
> +               return;
> +
> +       if (IS_ENABLED(CONFIG_CMDLINE_FORCE) || !src) {
> +               dst[0] = 0;
> +               cmdline_strlcat(dst, CONFIG_CMDLINE, len);
> +               return;
> +       }
> +
> +       if (dst != src)
> +               dst[0] = 0;
> +
> +       if (IS_ENABLED(CONFIG_CMDLINE_PREPEND))
> +               cmdline_strlcat(dst, CONFIG_CMDLINE " ", len);
> +
> +       cmdline_strlcat(dst, src, len);
> +
> +       if (IS_ENABLED(CONFIG_CMDLINE_EXTEND))

Should be APPEND.

> +               cmdline_strlcat(dst, " " CONFIG_CMDLINE, len);
> +}
> +
> +#define cmdline_build(dst, src, len) do {                              \

Perhaps a comment why we need this to be a define.

> +       char *__c_dst = (dst);                                          \
> +       const char *__c_src = (src);                                    \
> +                                                                       \
> +       if (__c_src == __c_dst) {                                       \
> +               static char __c_tmp[COMMAND_LINE_SIZE] __initdata = ""; \
> +                                                                       \
> +               cmdline_strlcat(__c_tmp, __c_src, COMMAND_LINE_SIZE);   \
> +               __cmdline_build(__c_dst, __c_tmp, (len));               \
> +       } else {                                                        \
> +               __cmdline_build(__c_dst, __c_src, (len));               \
> +       }                                                               \
> +} while (0)
> +
> +#endif /* _LINUX_CMDLINE_H */
> --
> 2.25.0
>
