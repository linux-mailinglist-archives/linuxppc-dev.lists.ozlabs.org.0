Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5969C91DAF6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 11:02:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Sp4TjD3S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCKnD0zJjz3fwH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 19:02:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Sp4TjD3S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCKmX6CMxz3fSF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 19:02:04 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fa75f53f42so11613545ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2024 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719824522; x=1720429322; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AZjFIWKODzM/NcTqJf05rFl20Hxp9H5fZbg5Tl9cDM=;
        b=Sp4TjD3S9BQkbLv2M09H6W09qn/lzQfnihqkbcXT05y18gqWwuaZ0TYzWolN97DfqY
         Dy3whwCyuZCHKj4P3pRTsuJyt3iQbJKWGrtF4jG+rDSsTQkgpv63aWVevjRrha9JF5bh
         pJbdqhhwOCTxpB0aUXBUkxFBQWMx0B8XC++r4w+Whei5V9Y4Py46e7R6H0DLrrpSRXzf
         5TmRCo3Ff5XuyIBHGtQE7R+XjFh/5LKmDjx8VfwFGrxvNqU4YhhtzXZReu2ZsZUAHJFY
         ThpluEFE6dcE2qAKVl+KFfkMqD8Vq+atvqZPd/PMKNxdhU1c2wggus+NApSITbQOA2iQ
         R7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719824522; x=1720429322;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8AZjFIWKODzM/NcTqJf05rFl20Hxp9H5fZbg5Tl9cDM=;
        b=iq36AN75PBKdS9ES9sua7SkKdzo+iWWtjhl15S3bCm+PUQaW8dlm9enZhfb/eJKJHk
         4sDdByMTcscz77RjKE/dsWPeCLU+9dTbgHbH0xYDeBi+mToR1NsL2JdWOZb3CClMclIC
         boeR0xH9Ombjr+z1KbfF/QbCKp7/l0DzyPUskYH2WA8JesMtCtwdcoh1iJxsYsaeZt9Z
         Qlsb7uvasa5c5HDvM6/vsMfyVG7ld8WhgTsEZ/Xi1WuLJ1oAAdcu5KMyzmj8u6UFm8j9
         rZzaZb+DhcNpTu9B3fswwKuiqEnXDtRSv//ld7JAgZ7rt9DSwlF3+FVJH+A7RbPs4tBY
         9zSg==
X-Forwarded-Encrypted: i=1; AJvYcCWzyYB7fFWHQszrh41eyzs2gdK9uTIy8YIMqp5SR+N6KETM3I1mM4reBM7pPAwRp7PcgDGZG7Z6XNExP/6FG6bOlENnub2E01AdSprxGA==
X-Gm-Message-State: AOJu0YzNgqqfv0LI2lNtpZIqjA9ZVVUw0kYAN6bmS4BPkZ//xxUkq8Zy
	dHYYbDRTFsxrM8Po60VYrQ6WqAk7zToRQThL8KYpqgNQrgNkJBEP
X-Google-Smtp-Source: AGHT+IGsrF3+f846+0ll/nXhZ5ebUEruoSp54Z7Zxn3+lFCS9qSPb8kXe8eT8SjoYF/hztGBwmF+Vg==
X-Received: by 2002:a17:902:e54f:b0:1f7:1655:825c with SMTP id d9443c01a7336-1fadbca1794mr29389455ad.36.1719824522032;
        Mon, 01 Jul 2024 02:02:02 -0700 (PDT)
Received: from localhost (118-211-5-80.tpgi.com.au. [118.211.5.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1568ea7sm59477635ad.186.2024.07.01.02.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 02:02:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jul 2024 19:01:53 +1000
Message-Id: <D2E2WQD0YGWH.11G3KU8SYPPZE@gmail.com>
To: "Naveen N Rao" <naveen@kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-trace-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
Subject: Re: [RFC PATCH v3 03/11] powerpc/module_64: Convert #ifdef to
 IS_ENABLED()
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.17.0
References: <cover.1718908016.git.naveen@kernel.org>
 <e0782cdf680a645d7f8d311a16530be7004bb0ef.1718908016.git.naveen@kernel.org>
In-Reply-To: <e0782cdf680a645d7f8d311a16530be7004bb0ef.1718908016.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Alexei
 Starovoitov <ast@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Jiri Olsa <jolsa@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Jun 21, 2024 at 4:54 AM AEST, Naveen N Rao wrote:
> Minor refactor for converting #ifdef to IS_ENABLED().
>
> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> ---
>  arch/powerpc/kernel/module_64.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module=
_64.c
> index e9bab599d0c2..c202be11683b 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -241,14 +241,13 @@ static unsigned long get_stubs_size(const Elf64_Ehd=
r *hdr,
>  		}
>  	}
> =20
> -#ifdef CONFIG_DYNAMIC_FTRACE
>  	/* make the trampoline to the ftrace_caller */
> -	relocs++;
> -#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
> +	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE))
> +		relocs++;
> +
>  	/* an additional one for ftrace_regs_caller */
> -	relocs++;
> -#endif
> -#endif
> +	if (IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS))
> +		relocs++;
> =20
>  	pr_debug("Looks like a total of %lu stubs, max\n", relocs);
>  	return relocs * sizeof(struct ppc64_stub_entry);

LGTM. Hmm, you could get even cleverer

    // make the trampoline to the ftrace_caller and ftrace_regs_caller
    relocs +=3D IS_ENABLED(CONFIG_DYNAMIC_FTRACE) +
              IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS);

But either way

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

