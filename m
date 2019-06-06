Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDE1375A1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 15:48:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KRnX4BYZzDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 23:48:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=radu.rendec@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mRWpWXNn"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KRkC6KcGzDqNS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2019 23:45:23 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id 14so2712094qtf.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 06:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=cbWHU2TAAmriqlsqy0lbK2IJbHWP0xfk7NysNgwfeo8=;
 b=mRWpWXNnd6IloiFR3j9MKpFCeFiw5eb1UTxh/Yna9fXaG+lS69+4dSNYnb+ZLnYefm
 gPr+q3EmChGjEwQ/QsjmeL2PWVMa1vGeEanLMVasS083LSUVwNI0sEYqaKlXqRp42dK5
 E1c15vyvwU3PfVG2Np1fEQASww6/BPoacCL97GaatofPLmvt5qQ0SfcveAKYTEczXzzU
 YKaYRIulLlJEhR+l7TkrEg978aCeHaJ0BRmtqynJOtn+d4OhMdh0t59zOE1o6PzHnwGZ
 EjO9rlJDr6i8cX+MpDS1Y0QrZZQZY8AP3uJEuehjwFA3w8ajfBrystuCnH803KySqAsP
 /Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=cbWHU2TAAmriqlsqy0lbK2IJbHWP0xfk7NysNgwfeo8=;
 b=nLsLKHCH2pt5miYGnWm+XbGSHnnbYYx0sHCW1RbHljtcZYqKW7BxDJMzBwWyS6jzW6
 1dlf/jlwxLUyil2hlDr8+GHdpwNXASX41DgK5s6TqBTWzLgA/wzjdN+V1hYfoYCuI9u6
 B5iPKeHr5G+NO5A6E2ID1/lMrHccRuDLcEVRXlnefDj0m2LVFkSwYFnyI1AawzfYoJJV
 QCqDpfCBD+fnlHZbbab1F4U+WSbB/jx5iaP4DwWY8Ct3zbqnzBxOtuE2qnUaDjm/IKqJ
 67A6PL4Yvr5uvNSJMUQiKpxgZ7IePb82JMAAt4DodjZ+1EP9NT/Bud3iBYOKc0Njs6GM
 qDiQ==
X-Gm-Message-State: APjAAAUtWPyl1dtw565DPkFgShIFDup1D5TlF3CQfYvrPY8b8i4iAKkB
 dz285ONNyre4CNQunvH+sQo=
X-Google-Smtp-Source: APXvYqyIQracPlFANu0gkJzTq/eda8YSkMBqTyT1yJOPRhYGrfUBvdRsWrfXGwUXRdGyeSrl0Qmi7w==
X-Received: by 2002:ac8:1a39:: with SMTP id v54mr41116077qtj.21.1559828718157; 
 Thu, 06 Jun 2019 06:45:18 -0700 (PDT)
Received: from bat.mindbit.ro (ftp.optelian.com. [216.13.53.98])
 by smtp.gmail.com with ESMTPSA id u8sm871366qkk.7.2019.06.06.06.45.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 06:45:17 -0700 (PDT)
Message-ID: <62eaddb44743811a8b2cf4da5aa85f5b61662539.camel@gmail.com>
Subject: Re: PowerPC arch_ptrace() writes beyond thread_struct/task_struct
From: Radu Rendec <radu.rendec@gmail.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 06 Jun 2019 09:45:16 -0400
In-Reply-To: <84012c6a-befa-5091-ee13-4da5d5eb7d75@c-s.fr>
References: <CAD5jUk-meCjEoqJqwriEZxfXQqWvObZUPq0MP=pSQmAbAbXMkw@mail.gmail.com>
 <84012c6a-befa-5091-ee13-4da5d5eb7d75@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Oleg Nesterov <oleg@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-06-06 at 07:15 +0200, Christophe Leroy wrote:
> 
> Le 05/06/2019 à 23:45, Radu Rendec a écrit :
> > Hi Everyone,
> > 
> > I'm seeing some weird memory corruption that I have been able to isolate
> > to arch_ptrace() [arch/powerpc/kernel/ptrace.c] and PTRACE_POKEUSR. I am
> > on PowerPC 32 (MPC8378), kernel 4.9.179.
> > 
> > It's not very easy for me to test on the latest kernel, but I guess
> > little has changed since 4.9 in either the architecture specific ptrace
> > code or PowerPC register data structures.
> > 
> > What happens is that gdb calls ptrace(PTRACE_POKEUSER) with addr=0x158.
> > This goes down to arch_ptrace() [arch/powerpc/kernel/ptrace.c], inside
> > `case PTRACE_POKEUSR`, on the branch that does this:
> > 
> >      memcpy(&child->thread.TS_FPR(fpidx), &data,
> >              sizeof(long));
> > 
> > where:
> >      index = addr >> 2 = 0x56 = 86
> >      fpidx = index - PT_FPR0 = 86 - 48 = 38
> 
> In struct thread_fp_state, fpr field is u64, so I guess we should have 
> the following on PPC32:
> 
> fpidx = (index - PT_FPR0) >> 1;

I guess this would only apply to PPC32, since everything up to fpidx is
calculated in units of sizeof(long) - which is 4 on PPC32 and 8 on
PPC64. But fpr[0:31] is always u64.

It also looks odd that only sizeof(long) bytes are ever copied for any
given fpr[fpidx], which means one half of the u64 is never accessible on
PPC32.

Ont other thing I don't get is the "+1" in the definition of PT_FPSCR
for PPC32:

    #define PT_FPSCR (PT_FPR0 + 2*32 + 1)

Looking at struct thread_fp_state, fpscr follows immediately after
fpr[31]. Is the FPSCR register only 32-bit on PPC32? Is it stored in the
2nd half of (struct thread_fp_state).fpscr? This line:

    child->thread.fp_state.fpscr = data;

suggests so. And in that case, the "+1" in PT_FPSCR makes sense, but
only for big endian: assigning `data` (which is "long", 32-bit) to the
`fpscr` field (which is "u64") would go to the higher address, which is
indeed "+1" in units of 32-bit words.

Then there is also a problem is the condition that determines whether
memcpy() is used to access one of the fpr[0:31] or fpscr is assigned
directly:

    if (fpidx < (PT_FPSCR - PT_FPR0))

The case when the supplied addr points to the lower half of fpscr (which
is unused on PPC32?) erroneously indexes into fpr[0:31].

Is there any documentation of what "addr" is supposed to mean?


> >      &child->thread.TS_FPR(fpidx) = (void *)child + 1296
> > 
> >      offsetof(struct task_struct, thread) = 960
> >      sizeof(struct thread_struct) = 336
> >      sizeof(struct task_struct) = 1296
> > 
> > In other words, the memcpy() call writes just beyond thread_struct
> > (which is also beyond task_struct, for that matter).
> > 
> > This should never get past the bounds checks for `index`, so perhaps
> > there is a mismatch between ptrace macros and the actual register data
> > structures layout.
> > 
> > I will continue to investigate, but I'm not familiar with the PowerPC
> > registers so it will take a while before I make sense of all the data
> > structures and macros. Hopefully this rings a bell to someone who is
> > already familiar with those and could figure out quickly what the
> > problem is.


