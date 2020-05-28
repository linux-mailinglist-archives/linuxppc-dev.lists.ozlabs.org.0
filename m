Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D001E625F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 15:34:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XpZW1Mj5zDqc2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 23:34:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XpX55zWRzDqDh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 23:32:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=S7lLmzfT; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49XpX46yFYz9sSJ;
 Thu, 28 May 2020 23:32:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590672725;
 bh=0sJJ11D8pW/bxn58Yyk4JUx2OhJl8nn/ry1kzGYvIA4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=S7lLmzfTbleQxCIXEp5wejgCFp06D8FgfRoukDWeaIxQOU3NOnI87fXfV2MfQGsts
 G5cQDAqms4IXi4coEhnmcUtEm3XHi+C3fb+0Is66Jwsqa37eqA88mCn6/WjbQnqo7G
 HnhSL61dJ5SoCXLdkG6WreBn8C3hnSahyMT9bb+LfCAAzM9jpErN1rA4tkokzUzF41
 FZKDt1Fzm3Cp/ofOZAjb/y24PFt0FiulUDihrHqL078aV+nyfStp4iHSr5vXM4mK8Z
 yoe/xu57ErV+3RKAQ7l6ChDsZJ/mtRi8WFzEQ/LY7EWgkZvVQaw0P2SoRw/dNDcArz
 JrBWOiOBBCbHg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH v2] powerpc/wii: Fix declaration made after definition
In-Reply-To: <20200526205756.2952882-1-natechancellor@gmail.com>
References: <20200413190644.16757-1-natechancellor@gmail.com>
 <20200526205756.2952882-1-natechancellor@gmail.com>
Date: Thu, 28 May 2020 23:32:29 +1000
Message-ID: <871rn4jic2.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kbuild test robot <lkp@intel.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <natechancellor@gmail.com> writes:
> A 0day randconfig uncovered an error with clang, trimmed for brevity:
>
> arch/powerpc/platforms/embedded6xx/wii.c:195:7: error: attribute
> declaration must precede definition [-Werror,-Wignored-attributes]
>         if (!machine_is(wii))
>              ^
>
> The macro machine_is declares mach_##name but define_machine actually
> defines mach_##name, hence the warning.
>
> To fix this, move define_machine after the machine_is usage.
>
> Fixes: 5a7ee3198dfa ("powerpc: wii: platform support")
> Reported-by: kbuild test robot <lkp@intel.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/989
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>
> v1 -> v2:
>
> * s/is_machine/machine_is/ (Nick)
>
> * Add Nick's reviewed-by tag.

I already picked up v1, and it's behind a merge so I don't want to
rebase it. I'll live with the typo. Thanks.

cheers
