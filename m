Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B1052445E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 06:38:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzJtR58Qtz3c87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 14:38:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=UDf+KO+3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.83;
 helo=conssluserg-04.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=UDf+KO+3; 
 dkim-atps=neutral
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com
 [210.131.2.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzJsp5C89z3bY8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 14:37:34 +1000 (AEST)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id 24C4b5vs004527
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 13:37:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 24C4b5vs004527
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1652330226;
 bh=tkmfQXshct+rM5sNv86ojAR4iOGgSUB8H7eo3J48fKg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UDf+KO+3kbwc37QIFSTV9bWAie+41gj2MeWrvLn98PFJeT68eleeY1AM7wSMxRyjU
 pPRvHVuTnkFix5D9kRIO45SdX/nvQQK1u5W7hb+YlXwaIc0eeRvA9RwDQSylp1+Rw0
 tSiITqUwWvLrx8H7s02aElsbROkTZEgun44WETgkYURxTeWPvY7S+12mOG+cdcCD7G
 q5xMLcI5JElKBcX3fWFRmxP+H0bOsKaLY1zOYZ3TWa6HI+pXOIz+m8XJYQLmoHFdl1
 lqNwhC1lG914gG/BmaAp50Ceg3Mk0V74KjqxzZzakr8LRAdYV/3YtH2W2wFjIN4Xeu
 pZDKO9J8l2e7Q==
X-Nifty-SrcIP: [209.85.214.182]
Received: by mail-pl1-f182.google.com with SMTP id i1so3786575plg.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 21:37:06 -0700 (PDT)
X-Gm-Message-State: AOAM532tSrAiMHNUBNa90s9Ulaq7+WfUlKMRTSfVhlFfkFwIgQzbQLuC
 FDIGu8YTvdUFcPoH2Qh1ZXa88CIpoH6YRSO7waA=
X-Google-Smtp-Source: ABdhPJzNzRosrbp98/vX8YbqZjlsEylacSahmJ3sX4Wd7I5BkGLdD5OHiq8O2NX6qWNfI9oi2eO8MzjRgcclDO8j9pE=
X-Received: by 2002:a17:902:7891:b0:15e:cae9:7620 with SMTP id
 q17-20020a170902789100b0015ecae97620mr28744958pll.136.1652330225331; Wed, 11
 May 2022 21:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-2-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-2-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 12 May 2022 13:35:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT3+rZTzt1Ed-V_pjA8wEFEVj7Uxo8PTtEhdyzFcqqM+g@mail.gmail.com>
Message-ID: <CAK7LNAT3+rZTzt1Ed-V_pjA8wEFEVj7Uxo8PTtEhdyzFcqqM+g@mail.gmail.com>
Subject: Re: [PATCH v4 01/14] modpost: remove left-over cross_compile
 declaration
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-modules <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 9, 2022 at 4:09 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This is a remnant of commit 6543becf26ff ("mod/file2alias: make
> modalias generation safe for cross compiling").
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.


>
> Changes in v4:
>   - New patch
>
>  scripts/mod/modpost.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index cfa127d2bb8f..d9daeff07b83 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -174,7 +174,6 @@ static inline unsigned int get_secindex(const struct elf_info *info,
>  }
>
>  /* file2alias.c */
> -extern unsigned int cross_build;
>  void handle_moddevtable(struct module *mod, struct elf_info *info,
>                         Elf_Sym *sym, const char *symname);
>  void add_moddevtable(struct buffer *buf, struct module *mod);
> --
> 2.32.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20220508190631.2386038-2-masahiroy%40kernel.org.



-- 
Best Regards
Masahiro Yamada
