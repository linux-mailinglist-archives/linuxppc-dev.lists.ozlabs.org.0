Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB84577527
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 11:14:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlztG6JPYz3c9k
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 19:13:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FhkQ0Svj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=sudipm.mukherjee@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FhkQ0Svj;
	dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Llzsc4d10z3051
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 19:13:23 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id y195so15993550yby.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 02:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uk9iE2xqsWDP3C6/qpL06kmkPCSpWSohZEixKNflFx4=;
        b=FhkQ0Svj/+tJNsDc6DNnIVS70lQM2tZNF65w+E2+XmCspafhyy1ZbmSSxFtKCs62Bw
         kR5R6AInk+RJVfOdkfa/kxDxYBuWaQa/Sc8Ytq+uOZB1j3NNM9QrG76BPsQa46KrmEaa
         omQgPKFQ02xqfcQMW2t4OjSVx56fbbMOKRVj1H6IBw4rS09VAU1+9+Z1jLWuYgIp6mlK
         F0ywUw3XJxW+T1E5aDt2V13U6Ec2zVnGbMRCMXQB0wiaU5RXgCEWnzloEi98Zi4Ox2nk
         LMv3sOPFciC/RvZtsLr9wC8Ne2u2jSiOA00h7rpHo/0iCk54CmMbCCHmftxi9Z09zdAQ
         009g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uk9iE2xqsWDP3C6/qpL06kmkPCSpWSohZEixKNflFx4=;
        b=p1PrqJeWFfAl8xwkaCowbalKxxf9ncBrPHv1+z7bJlHKSbUGVyCIIMu2Y7P4Rqh94a
         5i1vul0AzPp52mHgEPVbX/SPLKl6UybS8W8bc0aPoLeAAhtXMfYHuArJWvYF1xgt+p6L
         ALAtI4N+HD5doh9wur9xGyjmtg6mF4WwUT1yFT2I1uetoq1megaZqtV9qWWbceM9n8/u
         1W9cUM+tWwIFpR9YwpsquURvpHrfmkAgFYEr/WG199tsty6Z2A7JnmOG/gMce1gSlxBL
         jh0t3KyDym6FTE2GyKMk1156/vsZClkKlyR73i+P1Tk5NpC4qbKOTTVudCqkLbGibfKB
         72PA==
X-Gm-Message-State: AJIora+/7/9p5/GAfR86EQ8dllQEo+2xoyqIhTalS766T6uW2oRxYiKf
	r2NzQcx1J+zXmPZWa7sMP8toJmZ/B6+dVWAf5EI=
X-Google-Smtp-Source: AGRyM1uPYmGAEYb9p0WCn6+51xo81lzv+WhiEGpAx5V4Q7xhNVkaND+PiOC3wHRn30UHjy08DJZdv0dkPzxmu6zNlW4=
X-Received: by 2002:a25:3c45:0:b0:664:cf75:c2d6 with SMTP id
 j66-20020a253c45000000b00664cf75c2d6mr21223452yba.446.1658049198400; Sun, 17
 Jul 2022 02:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <Ys/aDKZNhhsENH9S@debian>
In-Reply-To: <Ys/aDKZNhhsENH9S@debian>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sun, 17 Jul 2022 10:12:42 +0100
Message-ID: <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com>
Subject: Re: mainline build failure of powerpc allmodconfig for prom_init_check
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Kees Cook <keescook@chromium.org>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 14, 2022 at 9:55 AM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi All,
>
> Not sure if it has been reported before but the latest mainline kernel
> branch fails to build for powerpc allmodconfig with gcc-12 and the error is:
>
> Error: External symbol 'memset' referenced from prom_init.c
> make[2]: *** [arch/powerpc/kernel/Makefile:204: arch/powerpc/kernel/prom_init_check] Error 1

I was trying to check it. With gcc-11 the assembly code generated is
not using memset, but using __memset.
But with gcc-12, I can see the assembly code is using memset. One
example from the assembly:

call_prom:
        .quad   .call_prom,.TOC.@tocbase,0
        .previous
        .size   call_prom,24
        .type   .call_prom,@function
.call_prom:
        mflr 0           #,
        std 29,-24(1)    #,
        std 30,-16(1)    #,
        std 31,-8(1)     #,
        mr 29,3          # tmp166, service
        mr 31,4          # nargs, tmp167
        mr 30,5          # tmp168, nret
 # arch/powerpc/kernel/prom_init.c:396:         struct prom_args args;
        li 4,254                 #,
        li 5,52          #,
 # arch/powerpc/kernel/prom_init.c:394: {
        std 0,16(1)      #,
        stdu 1,-208(1)   #,,
 # arch/powerpc/kernel/prom_init.c:396:         struct prom_args args;
        addi 3,1,112     # tmp174,,
 # arch/powerpc/kernel/prom_init.c:394: {
        std 9,304(1)     #,
        std 10,312(1)    #,
        std 6,280(1)     #,
        std 7,288(1)     #,
        std 8,296(1)     #,
 # arch/powerpc/kernel/prom_init.c:396:         struct prom_args args;
        bl .memset       #
        nop
        rldicl 9,31,0,32         # nargs, nargs
        addi 9,9,1       # tmp163, nargs,
        mtctr 9          # tmp163, tmp163



-- 
Regards
Sudip
