Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E407C19454F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 18:20:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pBb45bZ1zDqVl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 04:20:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Vk72SUbH; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pBY13JlLzDqCW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 04:19:01 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id d17so3216433pgo.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 10:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0r/SurdDSCSAHVti9CZwgq0zi7acyKoJlvToplzgYwo=;
 b=Vk72SUbH0AvbkhQ5XzcwGL7Voe73IZEF73e/9vZHeWg3ayRXD7y/T9U7Uh5KWQjjP8
 CngWsDMtAPuLWsVlmB7aXos16mH3SNU0M8VlXfCMvp/8Bx9WCHkMBqDmkU0TZ7L01CCW
 e/AUEQ1wJPERfVcLRtO1/uNX+Ay7mqmrzOVwtTg97qIX6gAwTaUXjesu1tEQ/zlL9/rk
 1cmlxmMeuk46R2/U46OrkAlX4oM9FUMXLbvQnIGajbNyi8POyK6bFhuk1yWjrqUn7rqr
 ODl5/33x6szSqlJdysIchhk/nbfRB0LxnzH2MWIHVjMQ4woLENNRFnDJkF0NI40SjDXK
 iXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0r/SurdDSCSAHVti9CZwgq0zi7acyKoJlvToplzgYwo=;
 b=mR+zHtEZTD3D6uN7s8a/Mxfc/kBHVsKsH4Czw4CBmq40/eFhcM/4PAbCgMtHkkqF4a
 HozOCHKlai0amlp8/FxPwWxGK6jGkfsxOrxwZrfIJiNSKxHkIdv/S4SKQgz4ij3DU/zY
 8HUuXTlg1YFexm28kkGRjYmjTTnStUTPCtQpbhidlUB0M7uwcecjFjwv7UePC0Chn1c9
 ka2M0gwPX2YiA+9L2iQKlNBtZJANy5K187m0M/DlZKXuLIwkx6j7iraoveHgolzmNOZJ
 NqsB6GaGC+2dmpxl7VD0JJEh/HvtZ1lWWN78T21OYM3BVHOu0wITt+IbrSfRGqoplX34
 uM/w==
X-Gm-Message-State: ANhLgQ0kG3rg0/7zfUKvgkfkWRIyixfzv/bouoPJeVPjk9p1m1sJdsxJ
 WsX+Nh7MRq9xJYmVrSmGkBBPdYWGsIgPBRZDK06FnA==
X-Google-Smtp-Source: ADFU+vte/68TxLOoZDxjEk01TZmRSfqPyyu5ylgPkQx+VuS/XaqbzT6xAtlusN5AxnwbvbOL7dGPmztB+EKwgHNkl2Y=
X-Received: by 2002:a63:a34d:: with SMTP id v13mr9360167pgn.10.1585243137461; 
 Thu, 26 Mar 2020 10:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200323114207.222412-1-courbet@google.com>
 <20200326123841.134068-1-courbet@google.com>
In-Reply-To: <20200326123841.134068-1-courbet@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 26 Mar 2020 10:18:45 -0700
Message-ID: <CAKwvOdk0N96DOZCUob0b=0DuAxYFq7-3Ft=RToi7EC8vOAhQZw@mail.gmail.com>
Subject: Re: [PATCH] x86: Alias memset to __builtin_memset.
To: Clement Courbet <courbet@google.com>
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
Cc: "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@alien8.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "H. Peter Anvin" <hpa@zytor.com>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Joe Perches <joe@perches.com>, Bernd Petrovitsch <bernd@petrovitsch.priv.at>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 26, 2020 at 5:38 AM Clement Courbet <courbet@google.com> wrote:
>
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

Yes, I think the above diff and additionally cleaning up
-ffreestanding from arch/powerpc/kernel/Makefile and
arch/powerpc/xmon/Makefile would be a much better approach.  If that's
good enough to fix the warning, I kind of can't believe we didn't spot
that in the original code review!

Actually, the god awful warning was:
./arch/powerpc/include/asm/setjmp.h:10:13: error: declaration of
built-in function 'setjmp' requires the declaration of the 'jmp_buf'
type, commonly provided in the header <setjmp.h>.
[-Werror,-Wincomplete-setjmp-declaration]
extern long setjmp(long *) __attribute__((returns_twice));
            ^
So jmp_buf was missing, wasn't used, but also the long vs int confusion.

I tested the above diff, all calls to setjmp under arch/powerpc/ just
compare the return value against 0.  Callers of longjmp just pass 1
for the final parameter. So the above changes should be no functional
change.
-- 
Thanks,
~Nick Desaulniers
