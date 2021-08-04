Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C773E0594
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 18:13:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gfxby6BzMz3cXQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 02:13:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=c80rjbUq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=bxH9LDhF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mailbox.org (client-ip=80.241.56.172;
 helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256
 header.s=mail20150812 header.b=c80rjbUq; 
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.a=rsa-sha256 header.s=mail20150812 header.b=bxH9LDhF; 
 dkim-atps=neutral
X-Greylist: delayed 553 seconds by postgrey-1.36 at boromir;
 Thu, 05 Aug 2021 02:12:33 AEST
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfxbP24JFz30CJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 02:12:31 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4GfxNZ5fBXzQjZj;
 Wed,  4 Aug 2021 18:03:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:content-type:content-type:mime-version
 :references:in-reply-to:message-id:subject:subject:from:from
 :date:date:received; s=mail20150812; t=1628092986; bh=TM+WZzwYU0
 Lm6j6Qzm8nAT3NQhNm5ZYclbWOAybfy7Y=; b=c80rjbUq1wo3W4ZdL4IvkrSB0o
 zLManKwnKt9SzWCuu3zlrYGLk/LpPf31WIoxvPl+jP9PRQuF9PQmWoGw+Z96S4Fd
 zIpTMTT2t+IN8zTZ/d2nWz/g108qyo6w6opeT1SxtShm1cQNAGQKSo+4G/EAS9pV
 cmL07KwKtxfoFeQ7IR7pk9ApzeNBFqbpzmAS1nKD+Rvj/oILrb+SZ6bi0wvrpseA
 0/tqW5cN5eSlgkYM0ZANwoo001Irj1eMS8Jc8AGZfa8wRGIn1GUihje9/7FDTpH2
 asmgEV9DAZxiF34GGSGSkqJf94rCAn4fmNAy9GkU6BIElwMVGrNA629nOGOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1628092988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUq06+j2Wmg2v804uS+QhjX9jQCz9gGqu7h7NiOI7zc=;
 b=bxH9LDhF3U9VFvL2nDK/7YfNCfa8IBD3RrSfacAFJo8Kjl0OQJH4JvRKUQWRWKJWZefVcX
 saspQvVpU7Kj+dDG5FHr6jET0yatMqLLceqqcceOJPG2aPuaLvk5jjAZ7cdkNNXP1Hcw7h
 sPelXGBnV2k9vGFEhVS9IIMiVVJ7xPf68EyivVz4HkhrG4UpnNQQpTv+75v0C2TT0ctJBh
 h5Tyo6gqIPnRrgHg675cjnw12yUT14GqCLsrW+bl5QKfmu2my1tYRGDS3EFmXgfl44OhxY
 El/mSfwba1Ut0yHh6cgWnGh8pm/PhKMaDQlWGjz8LsyocCNv5dxYz5KuVjnCiw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id 3bnPq-h1gNh8; Wed,  4 Aug 2021 18:03:06 +0200 (CEST)
Date: Wed, 4 Aug 2021 18:03:03 +0200
From: "Erhard F." <erhard_f@mailbox.org>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH] powerpc: Always inline radix_enabled() to fix build
 failure
Message-ID: <20210804180303.63617c81@yea>
In-Reply-To: <20210804013724.514468-1-jniethe5@gmail.com>
References: <20210804013724.514468-1-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 48E55183A
X-Rspamd-UID: 3a33e5
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed,  4 Aug 2021 11:37:24 +1000
Jordan Niethe <jniethe5@gmail.com> wrote:

> This is the same as commit acdad8fb4a15 ("powerpc: Force inlining of
> mmu_has_feature to fix build failure") but for radix_enabled().  The
> config in the linked bugzilla causes the following build failure:
> [...]
> The code relies on constant folding of MMU_FTRS_POSSIBLE at buildtime
> and elimination of non possible parts of code at compile time. For this
> to work radix_enabled() must be inlined so make it __always_inline.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=213803
> Reported-by: Erhard F. <erhard_f@mailbox.org>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/include/asm/mmu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index 27016b98ecb2..8abe8e42e045 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -324,7 +324,7 @@ static inline void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
>  }
>  #endif /* !CONFIG_DEBUG_VM */
>  
> -static inline bool radix_enabled(void)
> +static __always_inline bool radix_enabled(void)
>  {
>  	return mmu_has_feature(MMU_FTR_TYPE_RADIX);
>  }
> -- 
> 2.25.1

Thanks Jordan!

Your patch works well and my kernel build completes. Tested on v5.14-rc4. Only getting some warnings now:

[...]
  CHK     include/generated/autoksyms.h
  GEN     .version
  CHK     include/generated/compile.h
  LD      vmlinux.o
  MODPOST vmlinux.symvers
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  LD      .tmp_vmlinux.kallsyms1
ld: warning: creating DT_TEXTREL in a PIE
  KSYMS   .tmp_vmlinux.kallsyms1.S
  AS      .tmp_vmlinux.kallsyms1.S
  LD      .tmp_vmlinux.kallsyms2
ld: warning: creating DT_TEXTREL in a PIE
  KSYMS   .tmp_vmlinux.kallsyms2.S
  AS      .tmp_vmlinux.kallsyms2.S
  LD      vmlinux
ld: warning: creating DT_TEXTREL in a PIE
  SORTTAB vmlinux
  SYSMAP  System.map
  CHKHEAD vmlinux
  CHKREL  vmlinux
  GEN     .version
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  AR      init/built-in.a
  LD      vmlinux.o
  MODPOST vmlinux.symvers
  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  LD      .tmp_vmlinux.kallsyms1
ld: warning: creating DT_TEXTREL in a PIE
  KSYMS   .tmp_vmlinux.kallsyms1.S
  AS      .tmp_vmlinux.kallsyms1.S
  LD      .tmp_vmlinux.kallsyms2
ld: warning: creating DT_TEXTREL in a PIE
  KSYMS   .tmp_vmlinux.kallsyms2.S
  AS      .tmp_vmlinux.kallsyms2.S
  LD      vmlinux
ld: warning: creating DT_TEXTREL in a PIE
  SORTTAB vmlinux
  SYSMAP  System.map
  CHKHEAD vmlinux
  CHKREL  vmlinux
  MODPOST modules-only.symvers
[...]
