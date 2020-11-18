Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB342B87F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 23:57:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cbyqt39WHzDqc9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 09:57:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=maskray@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=M9S8YxVn; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cbyny735pzDqWb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 09:55:32 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id y22so1844147plr.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 14:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XUhiSEOyfPErO2z1AoYVgWv/RFM18Wm47SCXm7VABWk=;
 b=M9S8YxVnDv7lv+TGjTNQ7d6WtuAatM2QSAPfcDMnzfWtUQb4jOexDMLwq4zFvv9qoK
 7ISCNPFXf6NQbDMNIaRgid7/cm0xHjmSmnI7Jr8OqszKdVghzqNwtT3z+vwAElom+i5Z
 Q9E5xqgs3I2XP4lPVQVTQeih9LTJktmhhP/7Z2ZbqGKGsBUccEphtXDuBwQvYcD0dGVS
 wxF+es0klpYUBN6bt/mc+t/iRWsrTlcgmNlGzPU/Dpvc/8lBCJNrgE3XptRzFfj+xi3m
 qbFzAA3IKTBokUF8IRi1NuOQf8LLwt/s4LH59akqdB9bOxEVnZXl37sk9ZO4H5IFgpDG
 NNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XUhiSEOyfPErO2z1AoYVgWv/RFM18Wm47SCXm7VABWk=;
 b=rR+PdLQDHC/FSeGPKEZls8N7Rx2JsvTu8JVX7YD/g0aVUYLPxV9CYNILaQvfNgjhQM
 OFknkcE71BByidi8h1peLZdnqkqves42ow4UsBL6cmFq63HRef+DkPv4u7ELA0lsVAh1
 jUy4tVMo+NG3chwDfgB3h7TgJ/tTrSSWCmrMQvlpcRhUfIToAXgQgoPKVXHqRoR4nVma
 mSqbdsEegHxWJDCFcpQNCGjUwYhLYW/bPy2r9pYSPkZc9c4TCKBlmWKo8+bcw+pZI4gB
 cjw4guGaa5WkWQSqpGHAwv+fzdFNKGgLQ73/mBltwnvzDR9pQt9g7TxwaPbcNVMDRzJ0
 GWXg==
X-Gm-Message-State: AOAM533WegtPBlh3+MMnthngXu5hibDaa5Y5ZhbWgDukdS83C+989cZL
 L+Xea12jjmuaAsikewTJ1FVwI2qTs5Qovw==
X-Google-Smtp-Source: ABdhPJwwAOOZfECwME3HTToueuKqihtDLBxFcUCj+/LawPnOVpgQEm35zvTlndncG9QSjfINv949ow==
X-Received: by 2002:a17:902:eaca:b029:d6:807e:95b8 with SMTP id
 p10-20020a170902eacab02900d6807e95b8mr6237699pld.33.1605740129433; 
 Wed, 18 Nov 2020 14:55:29 -0800 (PST)
Received: from google.com ([100.117.212.88])
 by smtp.gmail.com with ESMTPSA id y24sm26348462pfn.176.2020.11.18.14.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 14:55:28 -0800 (PST)
Date: Wed, 18 Nov 2020 14:55:26 -0800
From: Fangrui Song <maskray@google.com>
To: Bill Wendling <morbo@google.com>
Subject: Re: [PATCH] powerpc/wrapper: add "-z rodynamic" when using LLD
Message-ID: <20201118225526.ps7iw46sxjo5rmbr@google.com>
References: <20201017000151.150788-1-morbo@google.com>
 <20201118223910.2711337-1-morbo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201118223910.2711337-1-morbo@google.com>
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
Cc: Alan Modra <amodra@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We could wait for https://lkml.org/lkml/2020/11/13/19
"[PATCH] kbuild: Always link with '-z norelro'"

Then we would not need -z rodynamic to work around a -z relro issue.

(The issue is that some sections don't strictly follow the normal
R/RX/RW(RELRO)/RW(non-RELRO) section flag partition. As a linker person
I would suggest that we don't create multiple clusters with the same
section flags (e.g. RW in two separate places), but this is my very
minor complaint.)

On 2020-11-18, Bill Wendling wrote:
>Normally all read-only sections precede SHF_WRITE sections. .dynamic and
>.got have the SHF_WRITE flag; .dynamic probably because of DT_DEBUG. LLD
>emits an error when this happens, so use "-z rodynamic" to mark .dynamic
>as read-only.
>
>Cc: Fangrui Song <maskray@google.com>
>Cc: Alan Modra <amodra@gmail.com>
>Signed-off-by: Bill Wendling <morbo@google.com>
>---
> arch/powerpc/boot/wrapper | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
>index cd58a62e810d..e1194955adbb 100755
>--- a/arch/powerpc/boot/wrapper
>+++ b/arch/powerpc/boot/wrapper
>@@ -46,6 +46,7 @@ compression=.gz
> uboot_comp=gzip
> pie=
> format=
>+rodynamic=
>
> # cross-compilation prefix
> CROSS=
>@@ -353,6 +354,7 @@ epapr)
>     platformo="$object/pseries-head.o $object/epapr.o $object/epapr-wrapper.o"
>     link_address='0x20000000'
>     pie=-pie
>+    rodynamic=$(if ${CROSS}ld -V 2>&1 | grep -q LLD ; then echo "-z rodynamic"; fi)
>     ;;
> mvme5100)
>     platformo="$object/fixed-head.o $object/mvme5100.o"
>@@ -493,7 +495,7 @@ if [ "$platform" != "miboot" ]; then
>         text_start="-Ttext $link_address"
>     fi
> #link everything
>-    ${CROSS}ld -m $format -T $lds $text_start $pie $nodl -o "$ofile" $map \
>+    ${CROSS}ld -m $format -T $lds $text_start $pie $nodl $rodynamic -o "$ofile" $map \
> 	$platformo $tmp $object/wrapper.a
>     rm $tmp
> fi
>-- 
>2.29.2.454.gaff20da3a2-goog
>
