Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CE26AD638
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 05:29:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PW2Xj4bcfz3cBk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 15:29:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fyIzTEhB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fyIzTEhB;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PW2Wk3K93z2xjR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 15:28:48 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id oj5so12014467pjb.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 20:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678163326;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hp9R6vPlKnj/ILvnBD3pKbQA35hbCkoBxOAhDB5hqKo=;
        b=fyIzTEhBz1mQ8ft2bA/ZOMCA8Gtuj0t/ia4tsMxWGXX0X1UbNw3hA0LuAZsN/6AtAL
         m611u35Lk8ixB39pGiK1zyUUCpuMX8ulBZiDRCKnIX4g0LHjgdB1yrDyc4KYgDiba+hQ
         EfR5IiIGpX8g8SkPJ6+inj3fNgQSGf4H9ZDFjcVkd7b+4blE//8FR/cnbI8ZwjkZwepP
         I8xzCcyB2i5KExRwPB+XsiitnXddxCAHXGILHdP2MjBJFYYRJw/NURVjj8+Adm+59Uvc
         jdYFrwB3psWPk+1xW5nqE8o5AC6AcqhamSPeG/+Q3wpzBgO45SdUAutZJku0/Jllaoxq
         VWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678163326;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hp9R6vPlKnj/ILvnBD3pKbQA35hbCkoBxOAhDB5hqKo=;
        b=EwLdBbqTqtjO/sxu5y96yOVoM7NeJ1fdLDvGDC+dZqeq2l5tgQRh2ZqQDNHM6tlMM9
         25432dMo5ZvkPFTJHf+MDMB7WR8L4epUxh90ogsUJwFJRFUq4kwfM+FSg6S12HIaqOPT
         k16LeOu7VOc9GmFgyENOaIROjwt7ssq75CH+aZHq4ia79l2FDnHnoTGsYGb4/UFg3oVX
         LHHKk1ejNHz5w5r0QZRuxG06mHNSHVXJTvL6wsM+ljU/4RZqORYFGFV44BY+MX61FRIg
         LKkFFGlShB/6SBSZiLApGr0pVvfzl1zttc1TUiIF1P3w9yQFFo4Y8nR/KL5mIH5kJE7d
         n1Fg==
X-Gm-Message-State: AO0yUKU5AEuAvEHR6+djAe7+nYsd3Un8SaEneRbDOucc004Nqy0riI6u
	w+7nN4xYUf69aimQW7fUEXs=
X-Google-Smtp-Source: AK7set+ZoCXFRxmw3xfg33gXM2P3tsLEJa9DJEocvO6lGYXdWADo1YI5Lmv+//q2f/ncJIF4ss17GQ==
X-Received: by 2002:a17:90b:4d0a:b0:23a:87d1:9586 with SMTP id mw10-20020a17090b4d0a00b0023a87d19586mr12039984pjb.23.1678163326158;
        Mon, 06 Mar 2023 20:28:46 -0800 (PST)
Received: from localhost ([203.220.77.23])
        by smtp.gmail.com with ESMTPSA id r3-20020a17090aa08300b00230befd3b2csm8767326pjp.6.2023.03.06.20.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 20:28:44 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Mar 2023 14:28:39 +1000
Message-Id: <CQZV8XYSLJEU.PYMU50J2TDQH@bobo>
To: "Benjamin Gray" <bgray@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 01/13] powerpc/book3s: Add missing <linux/sched.h>
 include
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.13.0
References: <20221128024458.46121-1-bgray@linux.ibm.com>
 <20221128024458.46121-2-bgray@linux.ibm.com>
In-Reply-To: <20221128024458.46121-2-bgray@linux.ibm.com>
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
Cc: linux-hardening@vger.kernel.org, ajd@linux.ibm.com, cmr@bluescreens.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 28, 2022 at 12:44 PM AEST, Benjamin Gray wrote:
> The functions here use struct thread_struct fields, so need to import
> the full definition from <linux/sched.h>. The <asm/current.h> header
> that defines current only forward declares struct thread_struct.
>
> Failing to include this <linux/sched.h> header leads to a compilation
> error when a translation unit does not also include <linux/sched.h>
> indirectly.
>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/include/asm/book3s/64/kup.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/incl=
ude/asm/book3s/64/kup.h
> index 54cf46808157..84c09e546115 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
> @@ -194,6 +194,7 @@
>  #else /* !__ASSEMBLY__ */
> =20
>  #include <linux/jump_label.h>
> +#include <linux/sched.h>
> =20
>  DECLARE_STATIC_KEY_FALSE(uaccess_flush_key);
> =20
> --=20
> 2.38.1

