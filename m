Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5D43A754E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 05:38:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3vDh5Q5zz306v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 13:38:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=V4AhZHiG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b34;
 helo=mail-yb1-xb34.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=V4AhZHiG; dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3vDF4RDPz2yXK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 13:38:21 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id e10so18455208ybb.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 20:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/XUOfUqfTAfZKjkDbz8URCssQM6wFC15YP6MEdCsnEs=;
 b=V4AhZHiGDcSAoKGd4li1VrGqwa0atky1ZWjy4PK8GFIfFPHtirrJIubkGA47nU5ngf
 FT3KHoby1zmeLQ0m5TnuP0N6Loa8o5p/9CINYfaNY4ZcowUpkG9XPYYHVSRU9dBR64IF
 WTgFAWAEZyyJ3xBf2hOlC+Q5kvPVN4kzIDkQX9ACe8SuZ0GS7SjLUE2Q0f3iRRWklCAd
 41fmORPId7SGei4NTXqqe0LPWdvyfEpJaJ7ChsQjP3rEu2naKL4cssByUFoVrFKCdfza
 h/peepqZ8l6cBDS2dkyLcjpeeTtFWcGdYLDQwffy95gO0gFVxfaYDjo0YnvDbMN9290b
 9aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/XUOfUqfTAfZKjkDbz8URCssQM6wFC15YP6MEdCsnEs=;
 b=ETzVeLk9XSZQjL47/mHEtj9YfxrtscadHkvuJD7uyAnM/TfuThWXfUEfx87aBPkqff
 01mLDZLihxLoxd6BwmEth6FLjx+Dm/lbEgN32UBsgv3y/rJrxpQ9oTcKAvDOJJzk0Vgb
 5Junw9ZSYaUMIvvOIU09koEny1p6AVLLgSPtzWWTov4uzwRAZt7s11TLjCMIyZokdnId
 J6KjK7eRFVil3oBhDB5i1jco3W/XaO6G6XCyhEzgEr6nxq7AqXw+/jjDKguoulC6XpuR
 OzUsiSBOX4L7k1S4brjE/SZBpUe2BVjqh2JYPXPTIcwvAkRwAy9gXCl2dq7Q2GpmzAc2
 0Exg==
X-Gm-Message-State: AOAM533nlp1jkSsUuzwbpc8v+PQjGfBR4zaUejoS6vzUQhwTxs8P/Jyo
 nl2olpsH7uAYqvAQ74lRkUgUjgfeS4LFBFmpTJY=
X-Google-Smtp-Source: ABdhPJyQSb9L5NmkZfVMh3Mhm4D7uk1nKnR93vM0a2IUycPGFER5W0DAW1c4sqf7g8PhjXQim3AEFZfCivg8cWkONBo=
X-Received: by 2002:a25:694d:: with SMTP id e74mr4712799ybc.377.1623728297445; 
 Mon, 14 Jun 2021 20:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621516826.git.christophe.leroy@csgroup.eu>
 <d8b155e930b7a9708ca110e8ff0ace6713a7af75.1621516826.git.christophe.leroy@csgroup.eu>
In-Reply-To: <d8b155e930b7a9708ca110e8ff0ace6713a7af75.1621516826.git.christophe.leroy@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 15 Jun 2021 13:38:06 +1000
Message-ID: <CACzsE9pYG2=FWnxb=gkd2WAFjfy3sLXN8mxsEP26zc7OHgX0Nw@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] powerpc/inst: Avoid pointer dereferencing in
 ppc_inst_equal()
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
> Avoid casting/dereferencing ppc_inst() as u64* , check each member
> of the struct when relevant.
>
> And remove the 0xff initialisation of the suffix for non
> prefixed instruction. An instruction with 0xff as a suffix
> might be invalid, but still is a prefixed instruction and
> has to be considered as this.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/inst.h | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
> index fc6adef528a5..5a0740ebf132 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -61,7 +61,7 @@ static inline int ppc_inst_primary_opcode(struct ppc_inst x)
>  }
>
>  #ifdef CONFIG_PPC64
> -#define ppc_inst(x) ((struct ppc_inst){ .val = (x), .suffix = 0xff })
> +#define ppc_inst(x) ((struct ppc_inst){ .val = (x) })
>
>  #define ppc_inst_prefix(x, y) ((struct ppc_inst){ .val = (x), .suffix = (y) })
>
> @@ -72,7 +72,7 @@ static inline u32 ppc_inst_suffix(struct ppc_inst x)
>
>  static inline bool ppc_inst_prefixed(struct ppc_inst x)
>  {
> -       return ppc_inst_primary_opcode(x) == OP_PREFIX && ppc_inst_suffix(x) != 0xff;
> +       return ppc_inst_primary_opcode(x) == OP_PREFIX;
>  }
>
>  static inline struct ppc_inst ppc_inst_swab(struct ppc_inst x)
> @@ -93,11 +93,6 @@ static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
>         }
>  }
>
> -static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
> -{
> -       return *(u64 *)&x == *(u64 *)&y;
> -}
> -
>  #else
>
>  #define ppc_inst(x) ((struct ppc_inst){ .val = x })
> @@ -124,13 +119,17 @@ static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
>         return *ptr;
>  }
>
> +#endif /* CONFIG_PPC64 */
> +
>  static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
>  {
> -       return ppc_inst_val(x) == ppc_inst_val(y);
> +       if (ppc_inst_val(x) != ppc_inst_val(y))
> +               return false;
> +       if (!ppc_inst_prefixed(x))
> +               return true;
> +       return ppc_inst_suffix(x) == ppc_inst_suffix(y);
>  }
>
> -#endif /* CONFIG_PPC64 */
> -
>  static inline int ppc_inst_len(struct ppc_inst x)
>  {
>         return ppc_inst_prefixed(x) ? 8 : 4;
> --
> 2.25.0
>
Reviewed by: Jordan Niethe <jniethe5@gmail.com>
