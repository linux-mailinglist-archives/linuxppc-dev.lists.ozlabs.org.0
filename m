Return-Path: <linuxppc-dev+bounces-3461-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AA09D5548
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2024 23:16:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvXdN0hvrz2yb9;
	Fri, 22 Nov 2024 09:16:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732227400;
	cv=none; b=OmE6QapE9iS1zgFLrkNj1D2NhR3BghSYslyVtw1f1F0+OLu9hL3XRxtaPckhyPYtOWkxXNwxS6mTVemUhP4VbaJEWzhOZB/TFC9lTNdcuXDWxXTgoOl+oaL0aQBdSBTszgVm7SgBHS4alcOOG76ZX/BoKfKA434U3kcIpvHlMKSfGOLH00ncIqERLQuFiaczCXCcYaaFjTuTVGW7c/YK+4gEZMGdewiX2zsRutZKQgVoktQNXIMGe2uOjemGXgxN2JyJ7O4RlFJmQyhDFHIr3GRoEytsPijLQ/SiPYo8et2gvV4aPxdAw7sIpZtwwBuZeCN+4KR6QfHAMhfKWBsltg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732227400; c=relaxed/relaxed;
	bh=nHdNuBjlvdOe2QnFjbNTu7sydbB8hdVPIUAgNsAEiuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVQDdh5E2K3DHEAEDTpQGEwYfYVl5QuXqngAJicG9FZXm3lL0cE4ChhdkdMNvhuxEm/S1ZV/7dp574N/0FDOZOc/n3L1+CEAXL0HYd+PxzOmqjm7vlP+LqEq/CMzAm2OsqNnLUSOf67GpTUco3WPmXr9Fo4j3U5thSsGpipF3ad565fxcwYMEES7cjk9qYTirDOt0Xn6EkQHRwHrTrCNLGg/94XizxWXD5F/TO4QldKad0Z0DMiGSVZMg4+4r0n3Su3Svy6y1IFc/ckQi4BIdjTs0NrdS79CxncAJIlDanKT0RS7N2UiQQl0o1hiuor5VEoVHd6rE9NotOmIKA6j3A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=NPcv3zyV; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=NPcv3zyV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvXdL480bz2yZ7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 09:16:36 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9aa8895facso250323566b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 14:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1732227392; x=1732832192; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nHdNuBjlvdOe2QnFjbNTu7sydbB8hdVPIUAgNsAEiuc=;
        b=NPcv3zyVf3cOuXjhPgf1oQ9srINL1qtG+ZpzUAapgPLnyiUvxwvKZsWLGHeT+W+J24
         xTXjFAwdzFwiOU8CoeYjP0MEwC4b5ZYjle+WM5y45iSHyFcUGvslxlDjfQZUrq2sZbnD
         WjgRUwTeiaVYsVwWDyghlkV96K3dOlDLMKW84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732227392; x=1732832192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHdNuBjlvdOe2QnFjbNTu7sydbB8hdVPIUAgNsAEiuc=;
        b=BIvBSVLweDvZtW2UJyoU01fa/1Y6vVivh06DwCl1iS1u33OEntdJIMGokrEg/mg/ql
         UlfdKgjCxy2wQgXQf1Mlzzh/hlyq+qdva7c1vH9nk7dH6t2OEvJa5VQnJDliW7WwtHqZ
         2HGg6niyB4s2gjsn///sOtNBXdppVnkKGdcmL0PBXmdu/wQIe8niuXR0dJPlqHJ6sMSu
         snN6X1Y8kamRpZR4Y3wHPWt0z8dveb1k8Yxd7Z82Jns+FbUCsT/Rw3PTJbHCY/VvZAGk
         sv+N5IoQW88VIHKDeTyvRhDobw849Lujlq0IvGl7AKjosfethhRktx6DiSARBUHQ2db5
         RbyA==
X-Forwarded-Encrypted: i=1; AJvYcCV2Elp1BNGMUweuLmfFG/idMwfkTRxZC3DtuhR2d/rPAIjXKheJGqhSz44zXfKpDlSlfQSdBFm6djvEAn0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy8r60oKXW/VSlqhMI2H/YEml2mn8+JOe+6jAht8VzXQJzJNons
	1mfiCjb17WGYrjHHW84KIe+1yfRVJyP4DULUzC9VC70QWnANjump/1VgEz5qcWuSTQadIbrOncM
	hnkE=
X-Gm-Gg: ASbGncsdSoS+exyOcz5HcxPc+4L3gTp6zmaJeYT9QKCQt9jHTlds5NmnSIbc4wGI+x2
	ybufvWU3P5J15xHLXlZcxr8nMqKsZ/HvjXWIZ8Yc2w9gSRtgNSDcdeskabx958D+IidhNoyYUy4
	6c0c/oYzBKpNQCsMBmbDd/MALytZjrw09WnxbZ2WfBnPCTuHxYM/iYcYDFdlBYiSU6mIihvROtO
	xGOj825fMdeYbUUwxmRoWwumt96sIoEO2shCPR/WcYsJ1BOqDDDVXIFKq58ehpQYE64gqny8Akp
	U4qTp5Rj9j2yff41zVjd7WS7
X-Google-Smtp-Source: AGHT+IHy2HAKYB7uOQAwQGuBUWPSrpuzQ2VqZ0+Rljxn47ufAi9D3gMwE9kY+h2ofst7R5AUrI4/mQ==
X-Received: by 2002:a17:906:9d2:b0:a9a:13f8:60b9 with SMTP id a640c23a62f3a-aa509985a54mr67839966b.36.1732227392270;
        Thu, 21 Nov 2024 14:16:32 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b344a8dsm19173366b.85.2024.11.21.14.16.29
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 14:16:29 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso221564766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 14:16:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXJ1987h38GEykji1L1H7C/Gg/Xq08wx8ce57UGpgylcsbC+DgRbZ8PavshWA+NDsr26fneB/SQxxDcUhQ=@lists.ozlabs.org
X-Received: by 2002:a17:906:1ba2:b0:aa5:1208:8a5b with SMTP id
 a640c23a62f3a-aa51208aa06mr5028966b.18.1732227389319; Thu, 21 Nov 2024
 14:16:29 -0800 (PST)
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
 <20241121214011.iiup2fdwsys7hhts@jpoimboe>
In-Reply-To: <20241121214011.iiup2fdwsys7hhts@jpoimboe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Nov 2024 14:16:12 -0800
X-Gmail-Original-Message-ID: <CAHk-=wigHm2J4LkUL1=y_H8zGwM0JsK2CrWyLNbz9fvXfbaBQA@mail.gmail.com>
Message-ID: <CAHk-=wigHm2J4LkUL1=y_H8zGwM0JsK2CrWyLNbz9fvXfbaBQA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="0000000000003663d40627739e4a"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--0000000000003663d40627739e4a
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Nov 2024 at 13:40, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> The profile is showing futex_get_value_locked():

Ahh.

> That has several callers, so we can probably just use get_user() there?

Yeah, that's the simplest thing. That thing isn't even some inline
function, so the real cost is the call.

That said, exactly because it's not inlined, and calls are expensive,
and this is apparently really critical, we can just do it with the
full "unsafe_get_user()" model.

It's not so complicated. The attached patch is untested, but I did
check that it generates almost perfect code:

    mov    %gs:0x0,%rax                 # current
    incl   0x1a9c(%rax)                 # current->pagefault_disable++
    movabs $0x123456789abcdef,%rcx      # magic virtual address size
    cmp    %rsi,%rcx                    # address masking
    sbb    %rcx,%rcx
    or     %rsi,%rcx
    stac                                # enable user space acccess
    mov    (%rcx),%ecx                  # get the value
    clac                                # disable user space access
    decl   0x1a9c(%rax)                 # current->pagefault_disable--
    mov    %ecx,(%rdi)                  # save the value
    xor    %eax,%eax                    # return 0
    ret

(with the error case for the page fault all out-of-line).

So this should be _faster_ than the old __get_user(), because while
the address masking is not needed, it's cheaper than the function call
used to be and the error handling is better.

If you can test this and verify that it actually help, I'll take it as
a patch. Consider it signed-off after testing.

> Also, is there any harm in speeding up __get_user()?  It still has ~80
> callers and it's likely to be slowing down things we don't know about.

How would you speed it up?  We definitely can't replace the fence with
addressing tricks. So we can't just replace it with "get_user()",
because of those horrid architecture-specific kernel uses.

Now, we could possibly say "just remove the fence in __get_user()
entirely", but that would involve moving it to access_ok().

And then it wouldn't actually speed anything up (except the horrid
architecture-specific kernel uses that then don't call access_ok() at
all - and we don't care about *those*).

               Linus

--0000000000003663d40627739e4a
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_m3rvg3zg0>
X-Attachment-Id: f_m3rvg3zg0

IGtlcm5lbC9mdXRleC9jb3JlLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9rZXJuZWwvZnV0ZXgvY29yZS5jIGIva2VybmVsL2Z1dGV4L2NvcmUuYwppbmRleCAzMjZiZmU2
NTQ5ZDcuLjllMWJkNzY2NTJkOCAxMDA2NDQKLS0tIGEva2VybmVsL2Z1dGV4L2NvcmUuYworKysg
Yi9rZXJuZWwvZnV0ZXgvY29yZS5jCkBAIC00NjQsMTMgKzQ2NCwzMiBAQCBpbnQgZnV0ZXhfY21w
eGNoZ192YWx1ZV9sb2NrZWQodTMyICpjdXJ2YWwsIHUzMiBfX3VzZXIgKnVhZGRyLCB1MzIgdXZh
bCwgdTMyIG5ldwogCiBpbnQgZnV0ZXhfZ2V0X3ZhbHVlX2xvY2tlZCh1MzIgKmRlc3QsIHUzMiBf
X3VzZXIgKmZyb20pCiB7Ci0JaW50IHJldDsKKwl1MzIgdmFsOwogCiAJcGFnZWZhdWx0X2Rpc2Fi
bGUoKTsKLQlyZXQgPSBfX2dldF91c2VyKCpkZXN0LCBmcm9tKTsKKwkvKgorCSAqIFRoZSB1c2Vy
IGFkZHJlc3MgaGFzIGJlZW4gdmVyaWZpZWQgYnkgZ2V0X2Z1dGV4X2tleSgpLAorCSAqIGFuZCBm
dXRleF9jbXB4Y2hnX3ZhbHVlX2xvY2tlZCgpIHRydXN0cyB0aGF0LCBidXQgd2UgZG8KKwkgKiBu
b3QgaGF2ZSBhbnkgb3RoZXIgd2F5cyB0byBkbyBpdCB3ZWxsLCBzbyB3ZSBkbyB0aGUKKwkgKiBm
dWxsIHVzZXIgYWNjZXNzIHNvbmcgYW5kIGRhbmNlIGhlcmUuCisJICovCisJaWYgKGNhbl9kb19t
YXNrZWRfdXNlcl9hY2Nlc3MoKSkKKwkJZnJvbSA9IG1hc2tlZF91c2VyX2FjY2Vzc19iZWdpbihm
cm9tKTsKKwllbHNlIGlmICghdXNlcl9yZWFkX2FjY2Vzc19iZWdpbihmcm9tLCBzaXplb2YoKmZy
b20pKSkKKwkJZ290byBlbmFibGVfYW5kX2Vycm9yOworCisJdW5zYWZlX2dldF91c2VyKHZhbCwg
ZnJvbSwgRWZhdWx0KTsKKwl1c2VyX2FjY2Vzc19lbmQoKTsKIAlwYWdlZmF1bHRfZW5hYmxlKCk7
CiAKLQlyZXR1cm4gcmV0ID8gLUVGQVVMVCA6IDA7CisJKmRlc3QgPSB2YWw7CisJcmV0dXJuIDA7
CisKK0VmYXVsdDoKKwl1c2VyX2FjY2Vzc19lbmQoKTsKK2VuYWJsZV9hbmRfZXJyb3I6CisJcGFn
ZWZhdWx0X2VuYWJsZSgpOworCXJldHVybiAtRUZBVUxUOwogfQogCiAvKioK
--0000000000003663d40627739e4a--

