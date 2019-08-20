Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCEB954F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 05:17:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CGF11clKzDqX7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 13:17:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U1jlEv+r"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CGC65hGszDqT6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 13:15:44 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id v15so1265766wml.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 20:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7pEz/mR885Taa0HQdSYyi+vy4Iw51smBsh3WTJyedOw=;
 b=U1jlEv+rIFTTstDRBwIEoGqTgrD45FhvGzyIMEsdvRzHezzDHoJxt+KZjIaN8foV6C
 PDj+JQd4Na9tvU5ifkiUeCfXMhi8cBR33rjszrFKZKssXU1wQL2BEOb0BNmUdvTVKCgT
 6E2m7yz5bPkgQtM+7oZbsN8l4a4o4Waz39jxOjtnZAOi7VOZywSueWL2y2iNs5glbEP4
 e2TzVXUwJ/06gWnC7soxIat0LCiBmnroUnJjQWtSZMigXFtwnJPzIu9mqQm4PPRrb+zD
 3wn0Oossx+TS3eLtb/Ij84UsuGOBzNWQA3VTVpIEh1Wa2rGTfeAbSu/oCxm3HWVBVZWS
 IQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7pEz/mR885Taa0HQdSYyi+vy4Iw51smBsh3WTJyedOw=;
 b=F7l28CGj1aFzzM+JpTWO3AClP+x1QhE2bEwDPCFa4U6jUrZ91cUQfGQ/ZR99KxtSJv
 HuHk0ZYfMy8PWoYAfb5gK+0bK6piM654GtZ2ptD/ve50oUsNvvkiY8veq5IweuW7xjy8
 q3lYXNKFXKUHHavRvuqlPsu2cd7basFaaZAls69qtTgW0iTf3piZUfxR1QRNZWsEedP1
 8O9mYP38fUpuKsKN7AxXjq9kZz6Bfk63zLZAsftZr8K94G6SqYibSzdOgzVAz4IM4qW+
 yGDB0zUY21YaqysybsJ0wZac7CPBvYJJ/0unzBZnaU8LExysXcj80Ll8n7llpZagZKpq
 hMVg==
X-Gm-Message-State: APjAAAVFAmwyxbT8PVC8YPKq+A7G/1hBk/xrd6XZ04WC5sKEJBcXKhzt
 41VpBegALNbGTTdpBGVvmOE=
X-Google-Smtp-Source: APXvYqzWwWuQcQkzT9jKY09rQLsUL79FaHwhNJesYyqzFa3UsHkj69Rf3jVuX1For+jGJHU+T/K1yw==
X-Received: by 2002:a1c:2582:: with SMTP id
 l124mr24669519wml.153.1566270940665; 
 Mon, 19 Aug 2019 20:15:40 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id a141sm1292983wmd.0.2019.08.19.20.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 20:15:40 -0700 (PDT)
Date: Mon, 19 Aug 2019 20:15:38 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Don't add -mabi= flags when building with Clang
Message-ID: <20190820031538.GC30221@archlinux-threadripper>
References: <20190818191321.58185-1-natechancellor@gmail.com>
 <20190819091930.GZ31406@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819091930.GZ31406@gate.crashing.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 19, 2019 at 04:19:31AM -0500, Segher Boessenkool wrote:
> On Sun, Aug 18, 2019 at 12:13:21PM -0700, Nathan Chancellor wrote:
> > When building pseries_defconfig, building vdso32 errors out:
> > 
> >   error: unknown target ABI 'elfv1'
> > 
> > Commit 4dc831aa8813 ("powerpc: Fix compiling a BE kernel with a
> > powerpc64le toolchain") added these flags to fix building GCC but
> > clang is multitargeted and does not need these flags. The ABI is
> > properly set based on the target triple, which is derived from
> > CROSS_COMPILE.
> 
> You mean that LLVM does not *allow* you to select a different ABI, or
> different ABI options, you always have to use the default.  (Everything
> else you say is true for GCC as well).

I need to improve the wording of the commit message as it is really that
clang does not allow a different ABI to be selected for 32-bit PowerPC,
as the setABI function is not overridden and it defaults to false.

https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0-rc2/clang/include/clang/Basic/TargetInfo.h#L1073-L1078

https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0-rc2/clang/lib/Basic/Targets/PPC.h#L327-L365

GCC appears to just silently ignores this flag (I think it is the
SUBSUBTARGET_OVERRIDE_OPTIONS macro in gcc/config/rs6000/linux64.h).

It can be changed for 64-bit PowerPC it seems but it doesn't need to be
with clang because everything is set properly internally (I'll find a
better way to clearly word that as I am sure I'm not quite getting that
subtlety right).

> (-mabi= does not set a "target ABI", fwiw, it is more subtle; please see
> the documentation.  Unless LLVM is incompatible in that respect as well?)

Are you referring to the error message? I suppose I could file an LLVM
bug report on that but that message applies to all of the '-mabi='
options, which may refer to a target ABI.

Cheers,
Nathan
