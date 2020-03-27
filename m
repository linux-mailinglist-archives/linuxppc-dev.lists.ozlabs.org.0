Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFF7194FEC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 05:07:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pSxS4s58zDr4g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 15:07:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pSvq08BJzDqwY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 15:06:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=RhdHyhJP; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48pSvf1RWFz9sSN;
 Fri, 27 Mar 2020 15:06:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585281973;
 bh=kg/R97OXCQPDDw7FjCMRczi3AXDimlrIJshJ+0pnob4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=RhdHyhJPd79i6SoBIDesf0HUyhI9j0YvFvyFh9Gf/MXAKdkl710wlwwmaGbyJ6zh+
 bivuu8WPX+4dFuoK0stxg431SLoKSzazK993OZta6D9Bo7/utRu7ukDFwmbhm/s0Lb
 umLyukSNtKydfA0L0rpPhFpPoyHtlSPLlqg7yUhvyr6BW2dc7YUUU7Jh5hxOsepzLk
 1atEgTiCDrRyWeXv3WYWvCb1kEuQ3c8HOEEa6hjRnD2CR7hK9GWRnmdXwB+8QH01Ad
 +3De2LQ6NAOBujDlYtt0CxcL9YWGmSWUzht4KUV4r/QXPalxXplngcIyL/9uj0A3fI
 nOXiUI31uJNVA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Clement Courbet <courbet@google.com>
Subject: Re: [PATCH]     x86: Alias memset to __builtin_memset.
In-Reply-To: <20200326123841.134068-1-courbet@google.com>
References: <20200323114207.222412-1-courbet@google.com>
 <20200326123841.134068-1-courbet@google.com>
Date: Fri, 27 Mar 2020 15:06:14 +1100
Message-ID: <87a742wifd.fsf@mpe.ellerman.id.au>
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
Cc: Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@alien8.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Clement Courbet <courbet@google.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Joe Perches <joe@perches.com>,
 Bernd Petrovitsch <bernd@petrovitsch.priv.at>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clement Courbet <courbet@google.com> writes:
> I discussed with the original authors who added freestanding to our
> build. It turns out that it was added globally but this was just to
> to workaround powerpc not compiling under clang, but they felt the
> fix was appropriate globally.
>
> Now Nick has dug up https://lkml.org/lkml/2019/8/29/1300, which
> advises against freestanding. Also, I've did some research and
> discovered that the original reason for using freestanding for
> powerpc has been fixed here:
> https://lore.kernel.org/linuxppc-dev/20191119045712.39633-3-natechancellor@gmail.com/
>
> I'm going to remove -ffreestanding from downstream, so we don't really need
> this anymore, sorry for waisting people's time.
>
> I wonder if the freestanding fix from the aforementioned patch is really needed
> though. I think that clang is actually right to point out the issue.
> I don't see any reason why setjmp()/longjmp() are declared as taking longs
> rather than ints. The implementation looks like it only ever propagates the
> value (in longjmp) or sets it to 1 (in setjmp), and we only ever call longjmp
> with integer parameters. But I'm not a PowerPC expert, so I might
> be misreading the code.
>
>
> So it seems that we could just remove freestanding altogether and rewrite the
> code to:
>
> diff --git a/arch/powerpc/include/asm/setjmp.h b/arch/powerpc/include/asm/setjmp.h
> index 279d03a1eec6..7941ae68fe21 100644
> --- a/arch/powerpc/include/asm/setjmp.h
> +++ b/arch/powerpc/include/asm/setjmp.h
> @@ -12,7 +12,9 @@
>
>  #define JMP_BUF_LEN    23
> -extern long setjmp(long *);
> -extern void longjmp(long *, long);
> +typedef long * jmp_buf;
> +
> +extern int setjmp(jmp_buf);
> +extern void longjmp(jmp_buf, int);
>
> I'm happy to send a patch for this, and get rid of more -ffreestanding.
> Opinions ?

If it works then it looks like a much better fix than using -ffreestanding.

Please submit a patch with a change log etc. and I'd be happy to merge
it.

cheers
