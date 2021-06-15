Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B4A3A7563
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 05:49:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3vSY6KPVz3bw6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 13:49:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Gtt8sv2K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d;
 helo=mail-yb1-xb2d.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Gtt8sv2K; dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3vS71lDBz2yjS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 13:48:38 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id c14so18507226ybk.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 20:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yin680PxT32vvsFD3cgHVsiUYZwQgvezq1Xoe5O317c=;
 b=Gtt8sv2KPRSl3UIUPDmkHcCj5XNL9oJgV5f0w/jrE0nVN+X7LEPbj9GYDUSZUOLt59
 3+4MSm+kzX1CI1uGiVaMTwsYAjxaniKbGnZQBvQQOMCgjMcIrw7G40ZbTN8dxIyH2vTy
 dKjtCe62Q/S9r2ydzl4PIPvj4jNGchg1hh5t2ix/VFXfOdANxJNieil5BlOsOVxZpVrs
 AEthIhdk68OmQIK4voYsCn/fr+djO8sbdGu27V3Zh1eTSj0m0VNFDMbdYmK7lMVsSx9G
 mlSdeWF4kfTvsg+SO1jRk9voBPSf8IFk2Otha7XhpL6LcpMnVUXbiFCqO22Ss8eqkv4l
 Fl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yin680PxT32vvsFD3cgHVsiUYZwQgvezq1Xoe5O317c=;
 b=S7Tv0e3/5FivBw+HGi+Z4iA4DeUDgKhXAKFCUZbdd+iRqFXFSPWVQK6gd/9n+uv6g6
 XIeydHsk2fQM+SNxpyFzNXdbdlLztMBGYz5E3GZusuClvwCJpXa6XqvGaF8YJFUw3uDq
 j0VyfbXNSyAP92pm45uZssRDcGYptQwGqFgHPlSfsTO2q8eOQq4a7p7LfzXRUJCgBgR5
 LbovRotkQvF0tWNAOy+zEfJ1vCUW4TYg+BZWArnv2FBevHY78BC+sz4K0iZIWzEPs/yL
 Cqc7eSCBeLIoORZ7j5Tt49yR9AHK8vAsFvpbZEAjHW8hOFsGcAFPCihleNfX6kFvmlbu
 GdWA==
X-Gm-Message-State: AOAM533PCyCT+hBrk3RB/vZvzna4N3xv2C8xDbIrae/sRi/K205GDjDn
 1MYKGcW3cuHxtEDRdcD8muc6tvxp4yGzZuOw43A=
X-Google-Smtp-Source: ABdhPJw9ZI06p4bfDSpDF6e0BS6jWeKMJll3l4TO6xyULMQ8kEUfjDXChwtGw/ohDBpgxouXzBoBnVm+ngQlBvjB6Ek=
X-Received: by 2002:a25:607:: with SMTP id 7mr3224929ybg.343.1623728915277;
 Mon, 14 Jun 2021 20:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621516826.git.christophe.leroy@csgroup.eu>
 <d54c63dcac6d190e1cc0d2fe3259d6e621928cdf.1621516826.git.christophe.leroy@csgroup.eu>
In-Reply-To: <d54c63dcac6d190e1cc0d2fe3259d6e621928cdf.1621516826.git.christophe.leroy@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 15 Jun 2021 13:48:23 +1000
Message-ID: <CACzsE9qX3TT07QXBECdB4EJq70KGB0UPn3kfk3WfS-jTQgaAvQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] powerpc/inst: Refactor PPC32 and PPC64 versions
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 11:50 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> ppc_inst() ppc_inst_prefixed() ppc_inst_swab() can easily
> be made common to both PPC32 and PPC64.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/inst.h | 49 +++++++++------------------------
>  1 file changed, 13 insertions(+), 36 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
> index 32d318c3b180..e009e94e90b2 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -60,9 +60,9 @@ static inline int ppc_inst_primary_opcode(struct ppc_inst x)
>         return ppc_inst_val(x) >> 26;
>  }
>
> -#ifdef CONFIG_PPC64
>  #define ppc_inst(x) ((struct ppc_inst){ .val = (x) })
>
> +#ifdef CONFIG_PPC64
>  #define ppc_inst_prefix(x, y) ((struct ppc_inst){ .val = (x), .suffix = (y) })
>
>  static inline u32 ppc_inst_suffix(struct ppc_inst x)
> @@ -70,57 +70,34 @@ static inline u32 ppc_inst_suffix(struct ppc_inst x)
>         return x.suffix;
>  }
>
> -static inline bool ppc_inst_prefixed(struct ppc_inst x)
> -{
> -       return ppc_inst_primary_opcode(x) == OP_PREFIX;
> -}
> +#else
> +#define ppc_inst_prefix(x, y) ppc_inst(x)
>
> -static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
> +static inline u32 ppc_inst_suffix(struct ppc_inst x)
>  {
> -       return ppc_inst_prefix(swab32(ppc_inst_val(x)), swab32(ppc_inst_suffix(x)));
> +       return 0;
>  }
>
> +#endif /* CONFIG_PPC64 */
> +
>  static inline struct ppc_inst ppc_inst_read(const unsigned int *ptr)
>  {
> -       u32 val, suffix;
> -
> -       val = *ptr;
> -       if ((val >> 26) == OP_PREFIX) {
> -               suffix = *(ptr + 1);
> -               return ppc_inst_prefix(val, suffix);
> -       } else {
> -               return ppc_inst(val);
> -       }
> +       if (IS_ENABLED(CONFIG_PPC64) && (*ptr >> 26) == OP_PREFIX)
> +               return ppc_inst_prefix(*ptr, *(ptr + 1));
> +       else
> +               return ppc_inst(*ptr);
>  }
>
> -#else
> -
> -#define ppc_inst(x) ((struct ppc_inst){ .val = x })
> -
> -#define ppc_inst_prefix(x, y) ppc_inst(x)
> -
>  static inline bool ppc_inst_prefixed(struct ppc_inst x)
>  {
> -       return false;
> -}
> -
> -static inline u32 ppc_inst_suffix(struct ppc_inst x)
> -{
> -       return 0;
> +       return IS_ENABLED(CONFIG_PPC64) && ppc_inst_primary_opcode(x) == OP_PREFIX;
>  }
>
>  static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
>  {
> -       return ppc_inst(swab32(ppc_inst_val(x)));
> -}
> -
> -static inline struct ppc_inst ppc_inst_read(const unsigned int *ptr)
> -{
> -       return ppc_inst(*ptr);
> +       return ppc_inst_prefix(swab32(ppc_inst_val(x)), swab32(ppc_inst_suffix(x)));
>  }
>
> -#endif /* CONFIG_PPC64 */
> -
>  static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
>  {
>         if (ppc_inst_val(x) != ppc_inst_val(y))
> --
> 2.25.0
>
Reviewed by: Jordan Niethe <jniethe5@gmail.com>
