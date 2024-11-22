Return-Path: <linuxppc-dev+bounces-3463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F59A9D56F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 02:02:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvcJm49tSz2xrv;
	Fri, 22 Nov 2024 12:02:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732237352;
	cv=none; b=BnVhKr0o/A8C9wsQB6sRSd+umCRYIShOJhE/JJeyzMubS96GWRWyOLAR6/c3ql08rqJpEg67iwafoqN0cOEWZ0Mvn4eGRW0T6cADkQakzwx14B7mgWVfIR3Y4PphTeUtfElh0WpA8pos4sB1NCn1DP4x8Q3VT9L/MxpABAMmZQ5mgCVAM98kEzhsELt0yGa7iPDp1HQfNyAJOc7g0zVb5gNZqtDqi+nbmljJsZ7aOeVNUBPuXX8ZSMQW95r1WYTIm/pw6v8mh93tp7JqL9kIrjqXDMo00u1GbF3mgOAmQObPBg8QzdNbbsxXqTNlsA5D7rIBSD+P7u9OgGy5XHqfIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732237352; c=relaxed/relaxed;
	bh=FDUaf5mQgLqX7fwS6brwxsKX3Lly2Xe2pTNHm3Zr32k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X4KUweSIUk6bwQZYnC+D/ycBfyWnHr1wrXKmC2EWReel4x89mTYU5Fu38xc5p4HvG1ULXZuAnFQAF2oWpIVhoh056wP3xgRhe8o4LyJJl0i9DB3xpdtp+om9iRIkBMq9FKnGemVE65dVynULwjCcijsoiMIAYnVeVOmZEwrhbYoejuIztrCZTT6ueV66QNEGmMCje2KHr8Qi9OkpyzVCW0TfX7m3HlCLEhR+QQ2RbTL6d0KL3OfrjMkXNFXjWiJsPBa9TXaC13srbUB79cn99FFReIinuvAE59fSi6FNy1VTpidOy9D25SAwk9aerOFPeREurM3IyGhgbvxBgsBYfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=bRIXB5xm; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=bRIXB5xm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvcJk06XCz2xWS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 12:02:29 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5cfaeed515bso1983995a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 17:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1732237345; x=1732842145; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FDUaf5mQgLqX7fwS6brwxsKX3Lly2Xe2pTNHm3Zr32k=;
        b=bRIXB5xmp7IDb76/t1FVuLI8rXHIFaSa/ji1ksk7zG+oGY83xtO5U6wyIeHd5Pgmpd
         Ntrg/GIq8QpuP232BkOEFKCs9na68tLwm4EFVrAkcTztDasFglya8lJoNtJuBUIYUyN1
         5CRKWYTpKDhnec28K3KJx442RmeVtBqeo+580=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732237345; x=1732842145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDUaf5mQgLqX7fwS6brwxsKX3Lly2Xe2pTNHm3Zr32k=;
        b=lmLoB3BvIcp/+NDCAYMx6SKGadZdP9C0mehqSFNvRwoYlJjuSdmc/gykEhAKuEOSSo
         Np5nmD2/rOv+q26Cg9M5ao+F9UNhmAuFCW6mN2DiHz8+G92Li+F6Bvu7w8j0sZASUmOK
         lCFQddb8LwtOw132bZsEewnLLd8ow4A4Gzq7lVNuGDE+Hl2Eh+nAWOLbUtgPwbQS0mDZ
         6//4nlOr3mJzWUXLuOam2FIjOXtaAuUtJa4b36bS2JMUQFj/KrbVTjKwdbN+zNFrxASD
         5q6fTBxFYRNuViHFYRK0/f3Kk+NtsRo9aRzRRLVkWxl42f/dkUCWVAIQRPtNnd4pehAb
         d+tg==
X-Forwarded-Encrypted: i=1; AJvYcCUAitiNmX1DzKu7PF4UPep8KJijdxNHQvZ1M2dt3RvSzQd2hfv0brlAva4lmb8EJxm9D3xrMVsIf1jFlvk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywx51vSdQm1F+AaSBz1OiRjUUqIbI3XGuNJ+vcpmnRD7+AqRHan
	Co19fmTA5DXy0LhfY2zDbExv03YDB3S6esojdAdI6YQikCe2WzxYjSdftUIlcUS8SdImRmzjaWw
	qvKBnyg==
X-Gm-Gg: ASbGncteJ6f4MvxzHXFgepJRja2e2w+kV0dSezHChfW+aTVbRS1qX7l6nzbZGa3DJWc
	808bFsB9DgwvlGDnu+zZYTcDFbDXIPeNgaT/4MK1X0NHHgsf65QYdjtX54JVmO258h4ePEp0BBc
	uS6UTkIhytCWsSeiTiqQTGptVG6fJxQB0pxAPf7l5qi+ssYLf+1kYyWax+RMrAVfLVcPFYQjkte
	yzZlkGVRJ8QJmAq7sZ6wBxJbhqonGnSK//h8VlnKNk3reqWscsPyVFI4OAr9Z7kBSVPmvCcz2w4
	+k0NLWjwvvh+C8aOX2Plsw/m
X-Google-Smtp-Source: AGHT+IGSi1a2dzx+0sI+9/+BvyLqhFwescfv4HQ9eH9ONSXl3d05oUyV6/NtZK1KdRZznlYPc3XTGQ==
X-Received: by 2002:a17:906:18a1:b0:a7a:9144:e23a with SMTP id a640c23a62f3a-aa509c073femr92766366b.43.1732237345376;
        Thu, 21 Nov 2024 17:02:25 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b5b8b0asm30928166b.189.2024.11.21.17.02.23
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 17:02:24 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa1f73966a5so248721766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 17:02:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVI70taIZXhjd2JjoOEroL/cy6thORnq121QH9DywBK3pj0HekYwjb1jWzrebuTUG54nOcZpqqU/16Sb7g=@lists.ozlabs.org
X-Received: by 2002:a17:907:7852:b0:a9a:a7fd:d840 with SMTP id
 a640c23a62f3a-aa509976333mr95234166b.1.1732237343540; Thu, 21 Nov 2024
 17:02:23 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <cover.1730166635.git.jpoimboe@kernel.org> <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
 <20241029032735.pw3bg64bpneqnfhk@treble.attlocal.net> <76bb85ceeb854e3ab68d87f846515306@AcuMS.aculab.com>
 <20241115230653.hfvzyf3aqqntgp63@jpoimboe> <CAHk-=wgLCzEwa=S4hZFGeOPjix-1_fDrsqR-QLaBcDM-fgkvhw@mail.gmail.com>
 <20241121214011.iiup2fdwsys7hhts@jpoimboe> <CAHk-=wigHm2J4LkUL1=y_H8zGwM0JsK2CrWyLNbz9fvXfbaBQA@mail.gmail.com>
 <20241122001223.t4uywacusrplpefq@jpoimboe>
In-Reply-To: <20241122001223.t4uywacusrplpefq@jpoimboe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Nov 2024 17:02:06 -0800
X-Gmail-Original-Message-ID: <CAHk-=whm4fEYrzrrRrqEhELLFz2xNCMT9be+J0uiR_EwXwa0DA@mail.gmail.com>
Message-ID: <CAHk-=whm4fEYrzrrRrqEhELLFz2xNCMT9be+J0uiR_EwXwa0DA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit __get_user()
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: David Laight <David.Laight@aculab.com>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Mark Rutland <mark.rutland@arm.com>, "Kirill A . Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, 21 Nov 2024 at 16:12, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> The asm looks good, but the C exploded a bit... why not just have an
> inline get_user()?

That was originally one of my goals for the "unsafe" ones - if done
right, they'd be the proper building blocks for a get_user(), and we'd
only really need one single good implementation.

But it really does blow up the code size quite noticeably. The old
sign-based thing wasn't quite so bad, and was one of the main reasons
I really didn't like having to switch to the big constant thing, but
with the constant, the "get_user()" part is basically 27 bytes per
location.

The uninlined call is 5 bytes.

(And both then have the error handling - the inlined one can use the
asm goto to *maybe* make up for some of it because it avoids tests,
but I suspect it ends up being pretty similar in the end).

So I'm not really sure inlining makes sense - except if you have code
that you've profiled.

Part of the problem is that you can't really just make an inline
function. You need to make one for each size. Which we've done, but it
gets real messy real quick. I don't want to have yet another "switch
(sizeof..)" thing.

Or you'd make it a macro (which makes dealing with different types
easy), but then it would have to be a statement expression to return
the error, and to take advantage of that exception handling error
handling gets messed up real quick too.

End result: the

        if (can_do_masked_user_access())
                from = masked_user_access_begin(from);
        else if (!user_read_access_begin(from, sizeof(*from)))
                goto enable_and_error;

        unsafe_get_user(val, from, Efault);
        user_access_end();

pattern is very good for generating fine code, but it's rather nasty
to encapsulate as one single macro somewhere. It really ends up having
those two error cases: the one that just returns the error, and the
one that has to do user_access_end().

[ Time passes ]

Ugh. I tried it. It looks like this:

#define inlined_get_user(res, ptr) ({                           \
        __label__ fail2, fail1;                                 \
        __auto_type __up = (ptr);                               \
        int __ret = 0;                                          \
        if (can_do_masked_user_access())                        \
                __up = masked_user_access_begin(__up);          \
        else if (!user_read_access_begin(__up, sizeof(*__up)))  \
                goto fail1;                                     \
        unsafe_get_user(res, ptr, fail2);                       \
        user_access_end();                                      \
        if (0) {                                                \
fail2:  user_access_end();                                      \
fail1:  __ret = -EFAULT;                                        \
        }                                                       \
        __ret; })

and maybe that works. It generated ok code in this case, where I did

  int futex_get_value_locked(u32 *dest, u32 __user *from)
  {
        int ret;

        pagefault_disable();
        ret = inlined_get_user(*dest, from);
        pagefault_enable();
        return ret;
  }

but I'm not convinced it's better than open-coding it. We have some
ugly macros in the kernel, but that may be one of the ugliest I've
ever written.

> > How would you speed it up?
>
> I'm not sure if you saw the example code snippet I posted up-thread,
> here it is below.

Oh, ok, no I hadn't seen that one.

Yeah, it looks like that would work. What a horrendous crock. But your
point that it would find the nasty __get_user() cases is nicely made.

             Linus

