Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6612A58DCA2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Aug 2022 19:00:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2K7h2JfYz30Dp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 03:00:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m1M1yMVB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=omosnacek@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m1M1yMVB;
	dkim-atps=neutral
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2K754Yzcz2ywN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Aug 2022 02:59:43 +1000 (AEST)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-32194238c77so118235267b3.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Aug 2022 09:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=QrQX8WK96u27I03TXOPBygFMgGD2Ibt/j+HCEDp++fQ=;
        b=m1M1yMVBnbgi7NhIwjdruOUQemUheuzKcNXghQUoailteEjFRoQBidSZMXENxUrPCj
         Tp1WnfFrrBzYRcJcIHBpnUbfK2ZAUS46AcAXmAJuFi2rgW5elvTWhoeN8aFmxpcz9XBN
         FHiFnGD56C2xbnyzh3cgcyMhrdUxL2KlXyoDZWlDQ+4/VaoXKDE0Ar4j99HPpRTgMJMt
         EZdISeeFd9OdLatpDDdWPxMq6C3v5eKdNyVRERxfF+G3Zbgn/bij81RWXs/uGLGcDAS1
         my10/om8ROtdy3n5qf2cPcd8JGXGArfLFDDNk8E/dzd/aiNFXa97mpuUBjVHD25kDY5W
         mrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=QrQX8WK96u27I03TXOPBygFMgGD2Ibt/j+HCEDp++fQ=;
        b=ZJDiveCwWn8J1F7g3tUTmQVnIZe13pgAtxiS7aE9SlofaAFgzydDIki9TX5h55y2Zb
         zBcmapshr//4GP9yIMnIN6IXW5M9MbHT+u4UvAB5p0fCliwMpRsD+wt8wto7EFxP10oX
         HpzzqEVSgJhP3mbfmro0FOK+f1dS25KxB72jkOiQHSPZL8ZavTovRYDUpCsJOB6lKlLa
         BzBAcT0rgdqBbuoQkhmq2HQ5xTFRXT7DZvzPx7nxBp2HKOoR6KP2YG2xbMAYYzzAhtfu
         OF8cIBt98Gc3BZqASA/dNL+3UKIkpM8LSvk3nvmtdrvPurtht03uqgsONwQPJ9GWxzVM
         nUUg==
X-Gm-Message-State: ACgBeo2BzhzcCji1opbDH7Hf1Au5jYMI5p8QVaMhVotxViZNxqg8kfAH
	XvGHO7i904g91bZo0MDtF8+0VdF24rEhKFmrgqQ=
X-Google-Smtp-Source: AA6agR7HD7MwWKvSVk7kde+m8xcp73ooya/ogS3zlQNjq0dZm4Jn67V4SprdkkazYRaHVukqADaNGkPcGF4Qdgi/q2E=
X-Received: by 2002:a81:1d09:0:b0:31d:a40:8332 with SMTP id
 d9-20020a811d09000000b0031d0a408332mr25309035ywd.138.1660064376070; Tue, 09
 Aug 2022 09:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220809095907.418764-1-naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <20220809095907.418764-1-naveen.n.rao@linux.vnet.ibm.com>
From: =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>
Date: Tue, 9 Aug 2022 18:59:24 +0200
Message-ID: <CAAUqJDsAWRedULdKx3rEK7jL4=gHfJebCT4ujzWq4vSXZbju3w@mail.gmail.com>
Subject: Re: [PATCH] powerpc64/ftrace: Fix ftrace for clang builds
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 9, 2022 at 11:59 AM Naveen N. Rao
<naveen.n.rao@linux.vnet.ibm.com> wrote:
> Clang doesn't support -mprofile-kernel ABI, so guard the checks against
> CONFIG_DYNAMIC_FTRACE_WITH_REGS, rather than the elf ABI version.
>
> Fixes: 23b44fc248f420 ("powerpc/ftrace: Make __ftrace_make_{nop/call}() common to PPC32 and PPC64")
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Reported-by: Ondrej Mosnacek <omosnacek@gmail.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/trace/ftrace.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

With this patch my reproducer [1] is passing, thanks!

Tested-by: Ondrej Mosnacek <omosnacek@gmail.com>

[1] https://github.com/ClangBuiltLinux/linux/issues/1682#issue-1330483247
