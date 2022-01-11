Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 006D948A618
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 04:11:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXwhn5mZRz3bVL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 14:11:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cxfkFqPR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cxfkFqPR; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXwh95qPgz2yP9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 14:11:20 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id l8so12859877plt.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 19:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=zbUZ8MBTmVmuuh6nLO3oUSWnxXuwL880OdPfuGWzHYk=;
 b=cxfkFqPRjJsidUYoFqrkjQu+rytMjDJUVHRqWFdLhQu7zfbmc+PGsEdtTH6lq0LnJU
 f5llsTXt4jzLni4sIqAcUlN9VkfhJNiySYlWNNC80IBjoftWpG/WhY9heJDB24FqGmaG
 FAS3RDxvyPRGi8juK2nJRGYUBftDRSHQ+GD618Yb/syIM7tg4DpnVWnGwkVuVZpKHeMW
 kI7YgZVMdm3PbPuDtBH8+XvwzliKRslPcLotmZ3h2WyhJkvo/hZsHmLfpRfMPh1gQuLE
 p+xbSvu4WniS0b8Q0UD2Rao/OuI6yO+l3p3GlSi1Xvgm2a356mk5UVFvDeoRQJeHQm6J
 LT9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=zbUZ8MBTmVmuuh6nLO3oUSWnxXuwL880OdPfuGWzHYk=;
 b=QP5AEBPOhNbmypWeeMTZ8YXtuNo9XV4sdFNldNepSTzk3a1yT902yZotUysDB8xtH5
 MbLJeasSCP0ksWV1Yee1M2aqiExVhzVBZN/iyIHVbXw99P2QWwHwPl8M55BfRghoQJDJ
 GjsCbdshjvbt/JZaboOen/etJjslSUFwI4ZKKB1bSltc7aBgN+WVaX8PCQ2wWUh2wqlO
 PDGRyvOS5WMLdbOd0h7eTroohDj15b6WkIrlW/whpH/0JaKWm1+yXHOuu3DrwIrjRZlV
 zwt5WHod+If0V9wXiyFMYP91g5Y+fsQRtdwdBxEf8Ztpv4w4ogKjHRiMetCIayoOK3sD
 6VjQ==
X-Gm-Message-State: AOAM532dbna0q3hKdQIoZP2GnXHgleslNPa0fhLCZisfX0ldZE7PUmY8
 kZHGBUCb/kOC9Wl49wDTty4=
X-Google-Smtp-Source: ABdhPJwvS1ggfWVk1+YTM2VQ1yaJh/hW9pOxZQQtZVk1N6qWAZQMXv//b71/0S/AB/keLx9+1yye6Q==
X-Received: by 2002:a63:7a52:: with SMTP id j18mr2377642pgn.319.1641870676336; 
 Mon, 10 Jan 2022 19:11:16 -0800 (PST)
Received: from localhost (124-171-74-95.tpgi.com.au. [124.171.74.95])
 by smtp.gmail.com with ESMTPSA id g5sm8697284pfj.143.2022.01.10.19.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 19:11:16 -0800 (PST)
Date: Tue, 11 Jan 2022 13:11:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/time: Fix build failure due to
 do_hard_irq_enable() on PPC32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <247e01e0e10f4dbc59b5ff89e81702eb1ee7641e.1641828571.git.christophe.leroy@csgroup.eu>
In-Reply-To: <247e01e0e10f4dbc59b5ff89e81702eb1ee7641e.1641828571.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1641870650.jvmi84hc0s.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of January 11, 2022 1:29 am:
> 	  CC      arch/powerpc/kernel/time.o
> 	In file included from <command-line>:
> 	./arch/powerpc/include/asm/hw_irq.h: In function 'do_hard_irq_enable':
> 	././include/linux/compiler_types.h:335:45: error: call to '__compiletime=
_assert_35' declared with attribute error: BUILD_BUG failed
> 	  335 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
> 	      |                                             ^
> 	././include/linux/compiler_types.h:316:25: note: in definition of macro =
'__compiletime_assert'
> 	  316 |                         prefix ## suffix();                     =
        \
> 	      |                         ^~~~~~
> 	././include/linux/compiler_types.h:335:9: note: in expansion of macro '_=
compiletime_assert'
> 	  335 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
> 	      |         ^~~~~~~~~~~~~~~~~~~
> 	./include/linux/build_bug.h:39:37: note: in expansion of macro 'compilet=
ime_assert'
> 	   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
> 	      |                                     ^~~~~~~~~~~~~~~~~~
> 	./include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BU=
G_ON_MSG'
> 	   59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
> 	      |                     ^~~~~~~~~~~~~~~~
> 	./arch/powerpc/include/asm/hw_irq.h:483:9: note: in expansion of macro '=
BUILD_BUG'
> 	  483 |         BUILD_BUG();
> 	      |         ^~~~~~~~~
>=20
> should_hard_irq_enable() returns false on PPC32 so this BUILD_BUG() shoul=
dn't trigger.
>=20
> Force inlining of should_hard_irq_enable()
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Fixes: 0faf20a1ad16 ("powerpc/64s/interrupt: Don't enable MSR[EE] in irq =
handlers unless perf is in use")
> Cc: Nicholas Piggin <npiggin@gmail.com>

Acked-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

> ---
>  arch/powerpc/include/asm/hw_irq.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm=
/hw_irq.h
> index a58fb4aa6c81..674e5aaafcbd 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -473,7 +473,7 @@ static inline bool arch_irq_disabled_regs(struct pt_r=
egs *regs)
>  	return !(regs->msr & MSR_EE);
>  }
> =20
> -static inline bool should_hard_irq_enable(void)
> +static __always_inline bool should_hard_irq_enable(void)
>  {
>  	return false;
>  }
> --=20
> 2.33.1
>=20
