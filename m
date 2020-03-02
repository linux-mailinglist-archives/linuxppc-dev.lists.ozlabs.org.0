Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9381758C5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 11:57:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WHDH5VjczDqHY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 21:57:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.a=rsa-sha256 header.s=google header.b=PPIU/iwx; 
 dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WHBR0z0fzDqHY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 21:56:12 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id h18so11054123ljl.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 02:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=nqMVuyS4CFOxlIAUHG8LbizmYBcid9hPW+nTGezNsFY=;
 b=PPIU/iwx8iRLuwOH+7C44gxAISsC3e13p6cXyZ4WlrwcTcSTY83YNmjvhQ+005D7LK
 MBW8hWONjaCZqMq3ippgKLQDW/eR3CWtL3H1azXkh8T0cIJOxnyrwhWvy9VKLu5PbE2L
 0pVWiQjom66WsaHJs6EBoaj5Y2TRT7GiJATUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=nqMVuyS4CFOxlIAUHG8LbizmYBcid9hPW+nTGezNsFY=;
 b=N1eAUnMyqCq0csWSGASR29dM+nFSj5ssJK3tf2NCbkQ2frPJbPL6LINAU0YLK+6eaM
 9ByeQnpwd/uzxnsNYhjcgdyzJ1G8gSe5eeUIrL7o75q79YBMYYMr2oFldcPawDa9QIMa
 yXtcflK6+z2d/5APzYdZRN3/bdJ3IZscmL8PCJUxf69WWEl1y+pnotiTd3EeixRiJDVX
 WgVA4Yx4atCZpPQClN2XCA+/snHCjBn8LcnkkA5T7w1trjQzfRkH5C747fo7En5rof/n
 7/rLPiKchpia9CtDVYzGjMO+/Z0I4VNYkdG9KPuf/LNjBrWai9XwUFMpz7TFoDRO7yzA
 NkOg==
X-Gm-Message-State: ANhLgQ3hYzXCNl3FRUmG9braxixfK4XytBpZ0e246ygaZKuXCT3hmgG4
 L3Xo8uOPcdBRdX6fLzoRYE93zMlvh66PZ0m/
X-Google-Smtp-Source: ADFU+vvItV4F44Kw96WD2QVFnEnYHkQqMrFYjSTlprO9G/f4U91MWBiMRQudjTiTkIKk+2eijAutgg==
X-Received: by 2002:a2e:a58c:: with SMTP id m12mr10192159ljp.141.1583146566633; 
 Mon, 02 Mar 2020 02:56:06 -0800 (PST)
Received: from [172.16.11.50] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id 67sm7213458ljj.31.2020.03.02.02.56.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 02:56:06 -0800 (PST)
To: LKML <linux-kernel@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: eh_frame confusion
Message-ID: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
Date: Mon, 2 Mar 2020 11:56:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I'm building a ppc32 kernel, and noticed that after upgrading from gcc-7
to gcc-8 all object files now end up having .eh_frame section. For
vmlinux, that's not a problem, because they all get discarded in
arch/powerpc/kernel/vmlinux.lds.S . However, they stick around in
modules, which doesn't seem to be useful - given that everything worked
just fine with gcc-7, and I don't see anything in the module loader that
handles .eh_frame.

The reason I care is that my target has a rather tight rootfs budget,
and the .eh_frame section seem to occupy 10-30% of the file size
(obviously very depending on the particular module).

Comparing the .foo.o.cmd files, I don't see change in options that might
explain this (there's a bunch of new -Wno-*, and the -mspe=no spelling
is apparently no longer supported in gcc-8). Both before and after, there's

-fno-dwarf2-cfi-asm

about which gcc's documentation says

'-fno-dwarf2-cfi-asm'
     Emit DWARF unwind info as compiler generated '.eh_frame' section
     instead of using GAS '.cfi_*' directives.

Looking into where that comes from got me even more confused, because
both arm and unicore32 say

# Never generate .eh_frame
KBUILD_CFLAGS           += $(call cc-option,-fno-dwarf2-cfi-asm)

while the ppc32 case at hand says

# FIXME: the module load should be taught about the additional relocs
# generated by this.
# revert to pre-gcc-4.4 behaviour of .eh_frame

but prior to gcc-8, .eh_frame didn't seem to get generated anyway.

Can .eh_frame sections be discarded for modules (on ppc32 at least), or
is there some magic that makes them necessary when building with gcc-8?

Rasmus
