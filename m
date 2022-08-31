Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ACC5A746A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 05:24:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHV0j5DM6z3c7M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 13:24:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VttqN4Dv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VttqN4Dv;
	dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHV013lr0z2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 13:24:16 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id j5so9084501plj.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 20:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc;
        bh=kqwl44xXslk8mD4DJbfbDJIMb0fXoT8+FG8NxGiGLek=;
        b=VttqN4Dv/XpbYwDeiIEuhkKb4giGyoop4TZPUQ8jl5PN4HGb81TudvpjvLR1w8Oxjr
         Tq/Kz/CNf1Y0Y10p6QHUbY+kUV3+CwNQ2aF7BHlBThkO5n778gecnO4skc3smi+Ivref
         0vn1TAwn1SIJ2H07vT8qBXNRUZXribloDh7xnrv9BPaUwyHk5K6ysvgM97E7AVHISdBj
         /A17q2ayEPxz2eD+epuGkUlSwdoVqEk013suJ152e/+nx/nqZKLa1ydlJIphwI0rn9Zu
         zUrZDtkrZzjA8a+ES0ZsmjwakUUgNsgJ3k9ze3/69KWFZLSYVdqfea+UKlNW61ReXUyy
         2MQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc;
        bh=kqwl44xXslk8mD4DJbfbDJIMb0fXoT8+FG8NxGiGLek=;
        b=kpwkOJfrzq9uancw8iiD1L7eB0EkNfYnsarBkmb3Ikey986P6sV8yGj1ToRH4rJU2G
         QUT1XqFA3KKwiFs60TnF21IT43oZX7h66nH7ZcA7Q+b9xsd5avkfGgYhxa4IOFizqWDk
         6Wwy+amKMVnVSzirpJTtnUqxInD11wxMEElrRknXcMYo3WXfFDtDwR+BEdgvFvvPPDh7
         zq/zik5inpbMLQysiGAU6w0erhG1JCpd3I+XX+xIWePSDn2VMi98fzH49NTvG5Kocd2u
         ZAUFxNIeCAOax3BpBsQD5gZ1jUnmlpBzxx5KDwkFDOSemcLfQS3A3Jj5OgQt9oUy77ON
         jyNA==
X-Gm-Message-State: ACgBeo0au3M5F7e4/TpkfC0O9Ak+PtG7X8QflpVT3YpfaHnRX1I9kTHC
	YCZHYwdjLdBrUo0ANLPHGP0=
X-Google-Smtp-Source: AA6agR79FpJV09h+m0gsjjb1ok5GYy+zXsOSQDBQEuZJfswpToHFyHlCTjaLH8hHUo8Le+T2H764bg==
X-Received: by 2002:a17:903:244d:b0:175:3ead:4586 with SMTP id l13-20020a170903244d00b001753ead4586mr2289352pls.28.1661916253232;
        Tue, 30 Aug 2022 20:24:13 -0700 (PDT)
Received: from localhost (110-175-65-113.tpgi.com.au. [110.175.65.113])
        by smtp.gmail.com with ESMTPSA id k88-20020a17090a3ee100b001fd86f8dc03sm316052pjc.8.2022.08.30.20.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 20:24:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Aug 2022 13:24:05 +1000
Message-Id: <CMJW5375AS4G.3VZ0XK6D3OZ9O@bobo>
Subject: Re: [PATCH v2 02/16] powerpc: override __ALIGN() and __ALIGN_STR()
 macros
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Sathvika Vasireddy" <sv@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-3-sv@linux.ibm.com>
In-Reply-To: <20220829055223.24767-3-sv@linux.ibm.com>
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Aug 29, 2022 at 3:52 PM AEST, Sathvika Vasireddy wrote:
> Powerpc instructions must be word-aligned. Currently,
> there is an alignment of 16 bytes (by default), and it is
> much more than what is required for powerpc (4 bytes).
>
> The default expansion of __ALIGN() macro is:
> #define __ALIGN       .align 4,0x90
>
> Since Powerpc Linux does not require a 16 byte alignment,
> override __ALIGN() and __ALIGN_STR() macros to use required
> 4 byte alignment.

Alignment can be desirable beyond the minimum requirement, for
example 16 byte alignment for functions could be helpful for
instruction fetch. So it should be explained why possible
benefits of the larger alignment are not worth it.

And if you have the patch in a series, it should be explained
why the patch is required for the series if it is not obvious.

Thanks,
Nick

>
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/linkage.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/linkage.h b/arch/powerpc/include/as=
m/linkage.h
> index b71b9582e754..8df88fe61438 100644
> --- a/arch/powerpc/include/asm/linkage.h
> +++ b/arch/powerpc/include/asm/linkage.h
> @@ -2,8 +2,12 @@
>  #ifndef _ASM_POWERPC_LINKAGE_H
>  #define _ASM_POWERPC_LINKAGE_H
> =20
> +#include <linux/stringify.h>
>  #include <asm/types.h>
> =20
> +#define __ALIGN			.align 2
> +#define __ALIGN_STR		__stringify(__ALIGN)
> +
>  #ifdef CONFIG_PPC64_ELF_ABI_V1
>  #define cond_syscall(x) \
>  	asm ("\t.weak " #x "\n\t.set " #x ", sys_ni_syscall\n"		\
> --=20
> 2.31.1

