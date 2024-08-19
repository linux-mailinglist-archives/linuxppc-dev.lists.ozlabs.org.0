Return-Path: <linuxppc-dev+bounces-186-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E25A9576DC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2024 23:51:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnmXF1J2qz2y72;
	Tue, 20 Aug 2024 07:51:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::230"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fkDKbki1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnjNV1Jr8z2xtb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 05:29:59 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2f1a7faa4d5so58666381fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 12:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1724095793; x=1724700593; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3ie0bvC9ROJLnfutVE8C94bre2OY3y4q//fAPg+wLI0=;
        b=fkDKbki1qWfpaOX3KDEFK75AHXq7Cfyly+ZnOnQJHhoMWXYavpOHUik48/MvLA73Xs
         a9rIBJ8PS2tyY7ZTDSRoCLOF5yUhhZxh7Nl4RMMHuyAimzR7rid204oKBA8QDEVodMXa
         SjXRT8sdfVqkHs7AjSuB6+kWgBdoNPgCb9lec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724095793; x=1724700593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ie0bvC9ROJLnfutVE8C94bre2OY3y4q//fAPg+wLI0=;
        b=gZasme37D2ar3rFkATfUQ9yPXwNOjwqxg1n6rrYRSk2ERAvzp66akW70rGnHkpV3GQ
         +VIV4efajsHjmy6YkgPw0401W6hrd1eAFRw8gV16leHdmWqDsw4gdI9wM7rIq5ZwrUnH
         K0+XeuayJD1KZXzBURtowDQ5ghGKnAZ55ZcT7MgPZLZ1Na9ZFxLqJqJQ/tm/9PTWKVbx
         84DKO9xt9S/v6HDMspcQQCx23qSUJUP8V/aoxXFbbuebljEBKgvcgb/O2I6/JzM94o2r
         C4+Q9+m1JFjG+5vRV3QkwtrRSYD0jLQmCX1XBiGB28ITykOX8ZNWL1vf8SX7mJDXK2f8
         uasw==
X-Forwarded-Encrypted: i=1; AJvYcCWeFbSI8/fGckuisWMgWuCivEdzA35og12JsOmsXsuiyu5Vf+lwYrlDEhqTLjne9KbG8C10hkWGjN5xKcY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YweKmcJ4yr1pm1YlgnGcW5EIOkFUNQGITv0TwV3zsKN2wwTXubw
	vUZZKYHLUXg/5nAfACFcDyr2iVLjbO/PHZX3XoUpoG2Ie5XNGmx1FKMDz2EcElwOifVMyb+YoZc
	b41WduQ==
X-Google-Smtp-Source: AGHT+IGnHmIvhJumsQiFHFJZilGwDI73am3liAFw2E6e+Bcwe74/2rrwuPRScjxSVOcJafhsDKWITw==
X-Received: by 2002:a2e:4e01:0:b0:2ee:974c:596f with SMTP id 38308e7fff4ca-2f3be5bfe54mr82525721fa.28.1724095792140;
        Mon, 19 Aug 2024 12:29:52 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbe7fb5fsm5863872a12.68.2024.08.19.12.29.51
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 12:29:51 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a108354819so6117717a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 12:29:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+ioimF98VV9LJErojvFWU8ofJTSnhm0hwhw1sd+HFVA+18CCIJNLs7PB789B3qQcw8RjS/MUng1zTYz4=@lists.ozlabs.org
X-Received: by 2002:a05:6402:42d5:b0:5a2:68a2:ae52 with SMTP id
 4fb4d7f45d1cf-5beca26d2f5mr9265659a12.0.1724095790870; Mon, 19 Aug 2024
 12:29:50 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240812082605.743814-1-mpe@ellerman.id.au> <20240819185253.GA2333884@thelio-3990X>
In-Reply-To: <20240819185253.GA2333884@thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 19 Aug 2024 12:29:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj9QPhG4CjiX8YLRC1wHj_Qs-T8wJi0WEhkfp0cszvB9w@mail.gmail.com>
Message-ID: <CAHk-=wj9QPhG4CjiX8YLRC1wHj_Qs-T8wJi0WEhkfp0cszvB9w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Add optional close() to struct vm_special_mapping
To: Nathan Chancellor <nathan@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, jeffxu@google.com, 
	Liam.Howlett@oracle.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, 
	oliver.sang@intel.com, pedro.falcato@gmail.com, linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Aug 2024 at 11:53, Nathan Chancellor <nathan@kernel.org> wrote:
>
>
> Modules linked in:
> Pid: 24, comm: mount Not tainted 6.11.0-rc4-next-20240819
> RIP: 0033:0x68006f6c
> RSP: 000000006c8bfc68  EFLAGS: 00010206
> RAX: 0000000068006f6c RBX: 0000000068a0aa18 RCX: 00000000600d8b09
> RDX: 0000000000000000 RSI: 0000000068a0aa18 RDI: 0000000068805120
> RBP: 000000006c8bfc70 R08: 0000000000000001 R09: 0000000068ae0308
> R10: 000000000000000e R11: ffffffffffffffff R12: 0000000000000001
> R13: 0000000068a0aa18 R14: 0000000000000015 R15: 0000000068944a88
> Kernel panic - not syncing: Segfault with no mm
> CPU: 0 UID: 0 PID: 24 Comm: mount Not tainted 6.11.0-rc4-next-20240819 #1
> Stack:
>  600caeff 6c8bfc90 600d8b2a 68944a80
>  00000047 6c8bfda0 600cbfd9 6c8bfd50
>  68944ad0 68944a88 7f7ffff000 7f7fffffff
> Call Trace:
>  [<600caeff>] ? special_mapping_close+0x16/0x19

Hmm. No "Code:" line? Did you just edit that out, or maybe UML doesn't
print one out?

Anyway, for me that special_mapping_close() disassembles to


 <+0>:  mov    %rdi,%rsi
 <+3>:  mov    0x78(%rdi),%rdi
 <+7>:  mov    0x20(%rdi),%rax
 <+11>: test   %rax,%rax
 <+14>: je     0x600caa11 <special_mapping_close+24>
 <+16>: push   %rbp
 <+17>: mov    %rsp,%rbp
 <+20>: call   *%rax
 <+22>: pop    %rbp
 <+23>: ret
 <+24>: ret

which may just match yours, because special_mapping_close+0x16 is
obviously that +22, and it's the return point for that call.

And your %rax value does match that invalid %rip value of 0x68006f6c.

So it does look like it's jumping off to la-la-land, and the problem is the code

        const struct vm_special_mapping *sm = vma->vm_private_data;

        if (sm->close)
                sm->close(sm, vma);

where presumably 'vm_private_data' isn't a "struct vm_special_mapping *" at all.

And I think I see the problem.

When we have that 'legacy_special_mapping_vmops', then the
vm_private_data field actually points to 'pages'.

So the 'legacy_special_mapping_vmops' can *only* contain the '.fault'
handler, not the other handlers.

IOW, does something like this fix it?

  --- a/mm/mmap.c
  +++ b/mm/mmap.c
  @@ -2095,7 +2095,6 @@ static const struct vm_operations_struct
special_mapping_vmops = {
   };

   static const struct vm_operations_struct legacy_special_mapping_vmops = {
  -       .close = special_mapping_close,
          .fault = special_mapping_fault,
   };

and honestly, we should have different 'fault' functions instead of
having the same fault function and then making the function
dynamically see which vm_operations_struct it was. But that's a
separate issue.

And oh Christ, the difference between "_install_special_mapping()"
(which installs the modern style special mapping) and
"install_special_mapping()" (which installs the legacy special
mapping) is truly horrendously disgusting.

And yes, UML uses that legacy crap, which explains why it happens on
UML but not on sane architectures.

As does csky, hexagon, and nios2.

We should get rid of the legacy case entirely, and remove that insane
difference between _install_special_mapping() and
install_special_mapping().

But in the meantime, the one-liner fix *should* fix it. The four
architectures that uses the legacy crud don't care about the close
function anyway.

What a horrid thing.

                Linus

