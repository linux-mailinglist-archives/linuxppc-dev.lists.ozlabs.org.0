Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 973DE77B185
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 08:25:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gCJQuA3d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPPXC32BWz30GC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 16:25:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=gCJQuA3d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPPWG5DpRz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 16:24:25 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-686ba29ccb1so2623230b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Aug 2023 23:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691994260; x=1692599060;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVal+SmPwyPXEWd8E/hW8Myn0EzYgFGiM97Uxtw14hQ=;
        b=gCJQuA3dsTfDJieIBSLrO57qTyyDyVyxEU+8UhRnxnPwlSoGZXlUqghn2upnUe+Mxp
         VbeISFKHoYYJy9eDGjF7uge9P3/hsVvZhbx4oHsnGttRZ+1Q2fBoOL3vjsXDUl0qHg4f
         i4fFIIlLGkuAU6O3tu9et3SlBYczV6tpUl5NxbdUHKGKAiMq5dAg15PX1v97Jv7TOvXt
         ROijNORYbXf47zQrEVWvS4AgAuw308X6aw2/uthYKEcDcw7uOxw4m5G+agmTpwFrPw5I
         nYLHGAIG8VFmzEFqTrgLMsUo1tH9I42+KbIUEV0/TaZkxSDVEausufKUbOrIh/VhjCzf
         S+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691994260; x=1692599060;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JVal+SmPwyPXEWd8E/hW8Myn0EzYgFGiM97Uxtw14hQ=;
        b=YJsNAtpoUKAzzJitQikBsveSObajDt0VPoirH6ghsZq7q9aDw1P7FDLXkfHY21j4d9
         WYfwYYfe/2D+g0oAu0HEA53jeIvYMJVvycOnlCtX0Xw/eaxl2w+dSXH2WO/2INeNIbm3
         oDKchqErXO4pum3zYj/xb4SsqbmDkZrdsXyGVX0mIeoODqsV2t6OD+mz6OvytELXaG0D
         9n9/89jImDUAiGQUvSPS8zw1/8cWLINMPkfW8kkibG5OsU00472Aitwb+CGAlRtdpK4u
         n+6bJknCHXnlu6POkvWgZBoGOfOock0WWSRSYaTw1yyFhnYENfSy8zugOzvthpBehUik
         l8iQ==
X-Gm-Message-State: AOJu0Yw08WrV7E5eUFNH3isR7Vtu7pm6nfD/GK1GU94zF/LVnp0Se2bu
	87QATOlGhRh5RtWXIA2hI2Q=
X-Google-Smtp-Source: AGHT+IG3UeHMP3uaM2nERoAOz2IwLxw1P/hOZpeV5uvZekc4E/A4TSFDrOfU7cwHb3eu20J/EFyE0Q==
X-Received: by 2002:a05:6a00:1915:b0:666:eaaf:a2af with SMTP id y21-20020a056a00191500b00666eaafa2afmr10781211pfi.14.1691994260525;
        Sun, 13 Aug 2023 23:24:20 -0700 (PDT)
Received: from localhost ([1.146.8.58])
        by smtp.gmail.com with ESMTPSA id 8-20020aa79108000000b00686da0e163bsm7372165pfh.11.2023.08.13.23.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Aug 2023 23:24:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Aug 2023 16:24:15 +1000
Message-Id: <CUS1WM4XRDIT.2GTHPR1FHQKS2@wheely>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Michael Ellerman"
 <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/radix: Move some functions into #ifdef
 CONFIG_KVM_BOOK3S_HV_POSSIBLE
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.15.2
References: <3d72efd39f986ee939d068af69fdce28bd600766.1691568093.git.christophe.leroy@csgroup.eu>
In-Reply-To: <3d72efd39f986ee939d068af69fdce28bd600766.1691568093.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Aug 9, 2023 at 6:01 PM AEST, Christophe Leroy wrote:
> With skiboot_defconfig, Clang reports:
>
>   CC      arch/powerpc/mm/book3s64/radix_tlb.o
> arch/powerpc/mm/book3s64/radix_tlb.c:419:20: error: unused function '_tlb=
ie_pid_lpid' [-Werror,-Wunused-function]
> static inline void _tlbie_pid_lpid(unsigned long pid, unsigned long lpid,
>                    ^
> arch/powerpc/mm/book3s64/radix_tlb.c:663:20: error: unused function '_tlb=
ie_va_range_lpid' [-Werror,-Wunused-function]
> static inline void _tlbie_va_range_lpid(unsigned long start, unsigned lon=
g end,
>                    ^
>
> This is because those functions are only called from functions
> enclosed in a #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
>
> Move below functions inside that #ifdef
> * __tlbie_pid_lpid(unsigned long pid,
> * __tlbie_va_lpid(unsigned long va, unsigned long pid,
> * fixup_tlbie_pid_lpid(unsigned long pid, unsigned long lpid)
> * _tlbie_pid_lpid(unsigned long pid, unsigned long lpid,
> * fixup_tlbie_va_range_lpid(unsigned long va,
> * __tlbie_va_range_lpid(unsigned long start, unsigned long end,
> * _tlbie_va_range_lpid(unsigned long start, unsigned long end,

Thanks for doing this. Functions vaguely belong where they are, which
makes it slightly annoying to move them. Is it also annoying to add
ifdefs for each one where they are?

Thanks,
Nick
