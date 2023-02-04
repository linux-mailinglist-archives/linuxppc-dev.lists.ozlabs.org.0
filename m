Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C364968ABB2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 18:42:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8KbC4pcCz3f7v
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Feb 2023 04:41:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GHvi6mK2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GHvi6mK2;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8KZG3M0Vz3bVK
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Feb 2023 04:41:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 61553B80AB5
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F862C4339B
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 17:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675532465;
	bh=ybCstompzJL3UT6e7glRqC4C7D/BXVMzAo3mAy5m9U0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GHvi6mK2TZ40MUWWNoK0X5ZWqMudGGvdn1+VGfEzCi4QdBP3WQSJMJeJRxWq5af1g
	 4qpm5jJ+GpcWSLnY2s66pZYa7kRgLNRE/lCoqAv92+o7Q1jBaRMyPgjzMQtKmkNFag
	 hcDcFaSv7bvVMJnXkto9i7gKeTw3TnnMW0qOuD+uaSHf/0NHeM2F9UN//qELhFOb5V
	 8GdEVmbz6ZAiIGVipmYcCdPzrV/0vePfqoa22+TAuSzPOvXH8kkKB8KmOgvloFHuJz
	 VWCQMW0O3NmKxsCZF+QOunFyBdbOGTgwwQCw45LACQyv+2EnCSLx9Qxuh2XxGlwurn
	 qSlZbqKAbNyOg==
Received: by mail-oi1-f169.google.com with SMTP id bj22so6709961oib.11
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Feb 2023 09:41:05 -0800 (PST)
X-Gm-Message-State: AO0yUKX8yLyGix7Eyl3Sw0A1Z2ZyxXazoooNUmBm3JNeRGTR/rUi+Glo
	gW0uR9Vl+XKMPOcTIDWMS5YFeW++75ovkEY5nWA=
X-Google-Smtp-Source: AK7set+Gr77lG8/yFsySNN4RyXZfVByifEoYqVY2h08O6J7LA8RHp7QVS+b1LDdODkH/JX7Cq6rt8T5w+M0rEJm9jCk=
X-Received: by 2002:aca:6c6:0:b0:35e:7c55:b015 with SMTP id
 189-20020aca06c6000000b0035e7c55b015mr684583oig.287.1675532464295; Sat, 04
 Feb 2023 09:41:04 -0800 (PST)
MIME-Version: 1.0
References: <80c85984-7609-cab5-2341-48baeb67841e@infradead.org>
In-Reply-To: <80c85984-7609-cab5-2341-48baeb67841e@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 5 Feb 2023 02:40:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ2==FuLS9P3xqHocd_+4SxkP-Y45F038Y0o9SYwPR6SA@mail.gmail.com>
Message-ID: <CAK7LNAQ2==FuLS9P3xqHocd_+4SxkP-Y45F038Y0o9SYwPR6SA@mail.gmail.com>
Subject: Re: PPC64 TOC. warnings
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 5, 2023 at 2:30 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> I'm seeing thousands of these warnings:
> (gcc 12.2.0)
>
>
> ./include/generated/autoksyms.h:7:9: warning: ISO C99 requires whitespace after the macro name
>     7 | #define __KSYM_TOC. 1
>       |         ^~~~~~~~~~
>
> In file included from ../include/asm-generic/export.h:57,
>                  from ./arch/powerpc/include/generated/asm/export.h:1,
>                  from ../arch/powerpc/kernel/misc.S:17:
> ./include/generated/autoksyms.h:7:9: warning: missing whitespace after the macro name
>     7 | #define __KSYM_TOC. 1
>       |         ^~~~~~~~~~
>
>
> Can anything be done about them?
>
> Thanks.
> --
> ~Randy



Hmm, I just thought this issue was fixed by
commit 29500f15b54b63ad0ea60b58e85144262bd24df2



Does this happen only for GCC 12?

Does the following patch fix the issue?
(I did not test it.)





diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
index 12bcfae940ee..70d4ab3621f6 100755
--- a/scripts/gen_autoksyms.sh
+++ b/scripts/gen_autoksyms.sh
@@ -54,7 +54,7 @@ EOT
 } | sed -e 's/ /\n/g' | sed -n -e '/^$/!p' |
 # Remove the dot prefix for ppc64; symbol names with a dot (.) hold entry
 # point addresses.
-sed -e 's/^\.//' |
+sed -e 's/^\.//g' |
 sort -u |
 # Ignore __this_module. It's not an exported symbol, and will be resolved
 # when the final .ko's are linked.










-- 
Best Regards
Masahiro Yamada
