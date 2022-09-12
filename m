Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C65B572B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 11:27:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR1Tb4YMkz3bsS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 19:27:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i4flAiAl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i4flAiAl;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR1Sw54FJz2xy4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 19:26:54 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id bh13so7718655pgb.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 02:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=qLj9+IbUiwxeZPK09jgL3jSJrKT6fN1NGRF1KB7hdpQ=;
        b=i4flAiAlXVxwo+kbQMdXCEy5N4gaAXp5sqNDiPWAnS7E+5D7Hxa25MEs6oFGX0xHbf
         C4FE/CO1ixs1lavteHv6HOrylFwdLhzUMT/Asm4x2p9Ma0+ODWbIfYJVoCqt+RNvbLe5
         KULcPfJBiJdwEfWCvHgjjC6bSjIbomR5qivgcAqzXQcCefSpSdUA2KkKI+pohxsTi1Te
         QQl/LcvIxnGGEmTAbx+YIpfhlxUTdIKCwbQcpEXH8b2d81U7Wh5ZRu7bzXzBzKYDeq+l
         lp03YyxTzkEiXd0yLbkmWnifAkHzZIqidmzioVekSwoo0R7cZXxZbXBNqcD/n14A14QR
         tEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=qLj9+IbUiwxeZPK09jgL3jSJrKT6fN1NGRF1KB7hdpQ=;
        b=j88z0sZK2KLaLjeydz15mE/cpFccHcPW46d4VulXB6TtqKqPYa23sWy6ScE7USPzeX
         x8JwHZBeOOs0+VXIpbbq8QvH+JeLP4dP6UFoMOpEITgyku02r33ktSJSCFt7m/KE6hw8
         NR2Zn7/jePV/2k5fMPjv4onOWWQMGWRs/qzplEIgYRU8OkRMQh1/Oke7zfpUXsFZZydA
         msJpa56/b433UhaalYJFphzNsh6Y0PFAdE7BMkJxgjj2dWM5WaR7a1az3Ssz1f8Ukz7A
         g3nl77S1AZux2pskuAx59ksmchXJwN0mqsIieDER0rU3w0W2r7IiyVuVQYE450KnRqrk
         wHqg==
X-Gm-Message-State: ACgBeo2udUfK0sO+1xB2bQaC/H4mlfaGwvgI8boGcOheqocqmABuAULS
	WTRlFwcNKcepMzjko3B9Voo=
X-Google-Smtp-Source: AA6agR4mFcNK9cWZULvBq+y/w2Yw82N0vChE3BiRwDCPjl+eVRg5ae4gX1hzWo5cbK4I5tnms+QeNw==
X-Received: by 2002:a05:6a00:1907:b0:534:f2ef:e8fe with SMTP id y7-20020a056a00190700b00534f2efe8femr26571527pfi.65.1662974811454;
        Mon, 12 Sep 2022 02:26:51 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id p23-20020a17090a429700b002003464d81fsm4737033pjg.0.2022.09.12.02.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 02:26:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 19:26:46 +1000
Message-Id: <CMUBDBMO6LS9.2PCTV5RAWBDWS@bobo>
Subject: Re: [PATCH v4 04/20] powerpc: Provide do_ppc64_personality helper
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-5-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-5-rmclure@linux.ibm.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
> Avoid duplication in future patch that will define the ppc64_personality
> syscall handler in terms of the SYSCALL_DEFINE and COMPAT_SYSCALL_DEFINE
> macros, by extracting the common body of ppc64_personality into a helper
> function.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V2  -> V3: New commit.
> ---
>  arch/powerpc/kernel/syscalls.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscall=
s.c
> index ef5896bee818..9f29e451e2de 100644
> --- a/arch/powerpc/kernel/syscalls.c
> +++ b/arch/powerpc/kernel/syscalls.c
> @@ -64,7 +64,7 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, len,
>  }
> =20
>  #ifdef CONFIG_PPC64
> -long ppc64_personality(unsigned long personality)
> +static inline long do_ppc64_personality(unsigned long personality)
>  {
>  	long ret;
> =20

If this was merged in patch 7 it would just include the above, right?
I don't really mind if you prefer to split it this way though and make
fewer changes in patch 7.

Could you drop the 'inline'? I don't think it's necessary for modern
compliers. do_mmap2 could drop it too.

I did have a question about the duplication in patch 7, but assuming
you still need this patch

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> =20
>  long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_lo=
w,
> --=20
> 2.34.1

