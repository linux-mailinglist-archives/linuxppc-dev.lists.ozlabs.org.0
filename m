Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FC67B0194
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 12:14:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Nnqv7eGD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwXXd5Jrfz3cCG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 20:14:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Nnqv7eGD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=ariel.miculas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwXWm2mRnz2xpd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 20:13:54 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c007d6159aso174729001fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 03:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695809626; x=1696414426; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/u3Zrh4RI0xKeh+3e3TWulmTeI9dbJqmlyHM38HtCjc=;
        b=Nnqv7eGD684JrlWkbufNRn6x47PV7Eq0Uma4KNHeZGUNb2q08B4lfH5pS4QL6P5jRc
         w8+9+VBWlQasgoEo72Q74olNNmJscIg14isXjYyb8dBVroFM+2fHiJTN2OkdLXhUN0JD
         9K/hQsZU7wSI76ZNpc/vkWv+9M7ymObxvs7JT0ozB5kax+fwuQbSvvCo1Y0mkXV6VFaB
         UJd/t4WyT9cIBD7h+hmKkKe4Ff5zMzQz64HcdDlKzHXjOeljnF6qLlRsqzdczyUlS6FS
         U87lSJ6jDRLBqCUkjhgsNMzsWR+DGRP5FrK10rwLA0lJ8jrxYZaMZRvGpmWmO3B3J0gX
         CUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695809626; x=1696414426;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/u3Zrh4RI0xKeh+3e3TWulmTeI9dbJqmlyHM38HtCjc=;
        b=oqgiiCpoGqh+G1nZlMGNgCOqgVcTV8cKS4jgbxMOo0FW3uKDKSPSeg8Kf9KiUAkw9g
         8bItbb7bU7Nt7dvvJnAmjgXUU30XmuV6E60yMvkBAvnAMOP0cMB9UvUkIE2ODrBXDEiT
         Xtzyfb3hadnCft/dm7+HeY2UHS+7OsskoQ8JH3vpRupDypFBblZwTNXRkS8vG5Kunnzi
         8a8XUE24dIDoUgDVGfzw+laEsE7spNA9+gwsuQX2dNsGhsKMBF+jGgvirGg4EcnWxl/A
         hBwJBK/gm4Qz9Mrq4/Tlianci1w7seZWk4N6pVoNEB7ino92UjlW/LrbLZrjFcxv0uau
         iVpQ==
X-Gm-Message-State: AOJu0YytcurrIfEvdcG5Ny8DeQHzZiPrgntngLL/GjNp+6AP+DzzuNbe
	4RSSrJAM/xTS5uho7iLkE1P4RhqvuJfTmkA8Ehhx58fvKeCaJw==
X-Google-Smtp-Source: AGHT+IHILvSLGRtgwWIbcfrZcmzkZ10z86Tmb9SB5Q/gh0TIdFywG+f85tsGn3w51GJjpWgQqmYmIt0bCNVGqRwfC+Y=
X-Received: by 2002:a05:651c:c1:b0:2bf:b133:dd65 with SMTP id
 1-20020a05651c00c100b002bfb133dd65mr1570766ljr.38.1695809626199; Wed, 27 Sep
 2023 03:13:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAPDJoNtU9Vuh87PxDkxo+7M_Kg_K4PPNGksPuW_guFbChYu-jA@mail.gmail.com>
 <20220601155702.176588-1-ariel.miculas@gmail.com> <CAPDJoNvZmeeU+T94rp8BJ0+bH5pDXQCEKPHiQF0Kcu=JrRRfrg@mail.gmail.com>
 <CAPDJoNsb-HtfOQhD6ntZ8Hqx3fv3WAh1U5Jd3GzyN5EwO8znWA@mail.gmail.com>
In-Reply-To: <CAPDJoNsb-HtfOQhD6ntZ8Hqx3fv3WAh1U5Jd3GzyN5EwO8znWA@mail.gmail.com>
From: Ariel Miculas <ariel.miculas@gmail.com>
Date: Wed, 27 Sep 2023 13:13:34 +0300
Message-ID: <CAPDJoNuR8pNa+rp-PG_eeS14EvpMBLAmjNf9JvL=+0QTpwww-w@mail.gmail.com>
Subject: Fwd: [PATCH] powerpc/ptrace: Fix buffer overflow when handling
 PTRACE_PEEKUSER and PTRACE_POKEUSER
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

---------- Forwarded message ---------
From: Ariel Miculas <ariel.miculas@gmail.com>
Date: Thu, Jun 9, 2022 at 1:31=E2=80=AFPM
Subject: Fwd: [PATCH] powerpc/ptrace: Fix buffer overflow when
handling PTRACE_PEEKUSER and PTRACE_POKEUSER
To: <christophe.leroy@csgroup.eu>



Forwarded Conversation
Subject: [PATCH] powerpc/ptrace: Fix buffer overflow when handling
PTRACE_PEEKUSER and PTRACE_POKEUSER
------------------------

From: Ariel Miculas <ariel.miculas@gmail.com>
Date: Wed, Jun 1, 2022 at 12:36 PM
To: <security@kernel.org>
Cc: Ariel Miculas <ariel.miculas@gmail.com>


This fixes the gdbserver issue on PPC32 described here:
Link: https://linuxppc-dev.ozlabs.narkive.com/C46DRek4/debug-problems-on-pp=
c-83xx-target-due-to-changed-struct-task-struct

On PPC32, the user space code considers the floating point to be an
array of unsigned int (32 bits) - the index passed in is based on
this assumption.

fp_state is a matrix consisting of 32 lines
/* FP and VSX 0-31 register set /
struct thread_fp_state {
u64 fpr[32][TS_FPRWIDTH] attribute((aligned(16)));
u64 fpscr; / Floating point status */
};

On PPC32, PT_FPSCR is defined as: (PT_FPR0 + 2*32 + 1)

This means the fpr index validation allows a range from 0 to 65, leading
to out-of-bounds array access. This ends up corrupting
threads_struct->state, which holds the state of the task. Thus, threads
incorrectly transition from a running state to a traced state and get
stuck in that state.

On PPC32 it's ok to assume that TS_FPRWIDTH is 1 because CONFIG_VSX is
PPC64 specific. TS_FPROFFSET can be safely ignored, thus the assumption
that fpr is an array of 32 elements of type u64 holds true.

Solution taken from arch/powerpc/kernel/ptrace32.c
---
 arch/powerpc/kernel/ptrace/ptrace-fpu.c | 31 +++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-fpu.c
b/arch/powerpc/kernel/ptrace/ptrace-fpu.c
index 5dca19361316..4351f2bcd12d 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-fpu.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-fpu.c
@@ -6,9 +6,16 @@

 #include "ptrace-decl.h"

+#ifdef CONFIG_PPC32
+/* Macros to workout the correct index for the FPR in the thread struct */
+#define FPRNUMBER(i) (((i) - PT_FPR0) >> 1)
+#define FPRHALF(i) (((i) - PT_FPR0) & 1)
+#define FPRINDEX(i) TS_FPRWIDTH * FPRNUMBER(i) * 2 + FPRHALF(i)
+#endif
+
 int ptrace_get_fpr(struct task_struct *child, int index, unsigned long *da=
ta)
 {
-#ifdef CONFIG_PPC_FPU_REGS
+#if defined(CONFIG_PPC_FPU_REGS) && !defined(CONFIG_PPC32)
        unsigned int fpidx =3D index - PT_FPR0;
 #endif

@@ -16,11 +23,21 @@ int ptrace_get_fpr(struct task_struct *child, int
index, unsigned long *data)
                return -EIO;

 #ifdef CONFIG_PPC_FPU_REGS
+#ifdef CONFIG_PPC32
+       /*
+        * the user space code considers the floating point
+        * to be an array of unsigned int (32 bits) - the
+        * index passed in is based on this assumption.
+        */
+       *data =3D ((unsigned int *)child->thread.fp_state.fpr)
+               [FPRINDEX(index)];
+#else
        flush_fp_to_thread(child);
        if (fpidx < (PT_FPSCR - PT_FPR0))
                memcpy(data, &child->thread.TS_FPR(fpidx), sizeof(long));
        else
                *data =3D child->thread.fp_state.fpscr;
+#endif
 #else
        *data =3D 0;
 #endif
@@ -30,7 +47,7 @@ int ptrace_get_fpr(struct task_struct *child, int
index, unsigned long *data)

 int ptrace_put_fpr(struct task_struct *child, int index, unsigned long dat=
a)
 {
-#ifdef CONFIG_PPC_FPU_REGS
+#if defined(CONFIG_PPC_FPU_REGS) && !defined(CONFIG_PPC32)
        unsigned int fpidx =3D index - PT_FPR0;
 #endif

@@ -38,11 +55,21 @@ int ptrace_put_fpr(struct task_struct *child, int
index, unsigned long data)
                return -EIO;

 #ifdef CONFIG_PPC_FPU_REGS
+#ifdef CONFIG_PPC32
+       /*
+        * the user space code considers the floating point
+        * to be an array of unsigned int (32 bits) - the
+        * index passed in is based on this assumption.
+        */
+       ((unsigned int *)child->thread.fp_state.fpr)
+               [FPRINDEX(index)] =3D data;
+#else
        flush_fp_to_thread(child);
        if (fpidx < (PT_FPSCR - PT_FPR0))
                memcpy(&child->thread.TS_FPR(fpidx), &data, sizeof(long));
        else
                child->thread.fp_state.fpscr =3D data;
+#endif
 #endif

        return 0;
--
2.36.1



----------
From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, Jun 1, 2022 at 12:44 PM
To: Ariel Miculas <ariel.miculas@gmail.com>
Cc: <security@kernel.org>


On Wed, Jun 01, 2022 at 12:35:09PM +0300, Ariel Miculas wrote:
> This fixes the gdbserver issue on PPC32 described here:
> Link: https://linuxppc-dev.ozlabs.narkive.com/C46DRek4/debug-problems-on-=
ppc-83xx-target-due-to-changed-struct-task-struct

If this is a public issue, just post to the public mailing list for the
subsystem and the developers and maintainers there can help you get this
merged properly.

>
> On PPC32, the user space code considers the floating point to be an
> array of unsigned int (32 bits) - the index passed in is based on
> this assumption.
>
> fp_state is a matrix consisting of 32 lines
> /* FP and VSX 0-31 register set /
> struct thread_fp_state {
> u64 fpr[32][TS_FPRWIDTH] attribute((aligned(16)));
> u64 fpscr; / Floating point status */
> };
>
> On PPC32, PT_FPSCR is defined as: (PT_FPR0 + 2*32 + 1)
>
> This means the fpr index validation allows a range from 0 to 65, leading
> to out-of-bounds array access. This ends up corrupting
> threads_struct->state, which holds the state of the task. Thus, threads
> incorrectly transition from a running state to a traced state and get
> stuck in that state.
>
> On PPC32 it's ok to assume that TS_FPRWIDTH is 1 because CONFIG_VSX is
> PPC64 specific. TS_FPROFFSET can be safely ignored, thus the assumption
> that fpr is an array of 32 elements of type u64 holds true.
>
> Solution taken from arch/powerpc/kernel/ptrace32.c

Note, you did not properly sign-off on this commit, so it couldn't be
applied anyway :(

thanks,

greg k-h



----------
From: Ariel Miculas <ariel.miculas@gmail.com>
Date: Wed, Jun 1, 2022 at 12:47 PM
To: Greg KH <gregkh@linuxfoundation.org>


I wasn't sure about the security impact of this issue, that's why I
sent it to this list.
I will go ahead and send it to public lists if it's not a security
sensitive issue.


----------
From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, Jun 1, 2022 at 1:00 PM
To: Ariel Miculas <ariel.miculas@gmail.com>
Cc: <security@kernel.org>


Please do not drop the list, that's a bit harsh for everyone else on
it, now added back.

On Wed, Jun 01, 2022 at 12:47:34PM +0300, Ariel Miculas wrote:
> I wasn't sure about the security impact of this issue, that's why I sent =
it
> to this list.
> I will go ahead and send it to public lists if it's not a security
> sensitive issue.

I do not know if this is a security issue, sorry, that wasn't very
obvious from your patch submission.  And you were pointing at a very
very old email thread, so are you sure nothing has happened there since
then?

thanks,

greg k-h


----------
From: Ariel Miculas <ariel.miculas@gmail.com>
Date: Wed, Jun 1, 2022 at 2:40 PM
To: Greg KH <gregkh@linuxfoundation.org>
Cc: <security@kernel.org>


Sorry for dropping the list.
To give a bit of context: I was working on the gdbserver issue (the
one described in the link) on PPC32.
I was able to find the root cause: a buffer overflow in thread_struct,
more specifically in the field fpr in the structure thread_fp_state.
I've validated this fix, but for an older kernel version: 4.14. I did
not reproduce nor test the issue on the latest kernel version.
However, by looking at the code and also the git logs, I've noticed
that this is still an issue in the latest kernel version.
To be on the safe side, I've emailed this list first because this
might also be a security issue, unfortunately I do not have enough
expertise to say for sure whether or not it is a security issue.
Why I suspected it might be a security issue: this buffer overflow
overwrites fields in the task_struct of other threads/processes.
In the issue I was facing, a field that was overwritten was the state
field, leading to a neighboring thread transitioning from the 'S'
state to the 't' state, leading to that specific thread to no longer
be scheduled.
Maybe this could lead to a DOS since you could stop another process
from being scheduled.
Overwriting other fields may lead to some privilege escalation issue,
but this is just a wild guess.
So I need some help on this matter.

Thanks,
Ariel


----------
From: Eric W. Biederman <ebiederm@xmission.com>
Date: Wed, Jun 1, 2022 at 6:04 PM
To: Ariel Miculas <ariel.miculas@gmail.com>
Cc: <security@kernel.org>


Ariel Miculas <ariel.miculas@gmail.com> writes:

> This fixes the gdbserver issue on PPC32 described here:
> Link: https://linuxppc-dev.ozlabs.narkive.com/C46DRek4/debug-problems-on-=
ppc-83xx-target-due-to-changed-struct-task-struct
>
> On PPC32, the user space code considers the floating point to be an
> array of unsigned int (32 bits) - the index passed in is based on
> this assumption.
>
> fp_state is a matrix consisting of 32 lines
> /* FP and VSX 0-31 register set /
> struct thread_fp_state {
> u64 fpr[32][TS_FPRWIDTH] attribute((aligned(16)));
> u64 fpscr; / Floating point status */
> };
>
> On PPC32, PT_FPSCR is defined as: (PT_FPR0 + 2*32 + 1)
>
> This means the fpr index validation allows a range from 0 to 65, leading
> to out-of-bounds array access. This ends up corrupting
> threads_struct->state, which holds the state of the task. Thus, threads
> incorrectly transition from a running state to a traced state and get
> stuck in that state.
>
> On PPC32 it's ok to assume that TS_FPRWIDTH is 1 because CONFIG_VSX is
> PPC64 specific. TS_FPROFFSET can be safely ignored, thus the assumption
> that fpr is an array of 32 elements of type u64 holds true.
>
> Solution taken from arch/powerpc/kernel/ptrace32.c

I have a little familiarity with ptrace, so I took a quick look,
and I am confused.

Doesn't sizeof(long) =3D=3D sizeof(int) =3D=3D 4  on 32bit power pc?
I don't understand why you need a big comment about how
the index is computed when that isn't changing.

Doesn't the 32bit code need flush_fp_to_thread(child)?

Don't the overflow checks for an index out of bounds need to be
preserved?

I am a bit lost about what makes the TS_FPR calculation wrong on 32bit?

Eric

----------
From: Ariel Miculas <ariel.miculas@gmail.com>
Date: Wed, Jun 1, 2022 at 6:48 PM
To: Eric W. Biederman <ebiederm@xmission.com>
Cc: <security@kernel.org>


> Doesn't sizeof(long) =3D=3D sizeof(int) =3D=3D 4  on 32bit power pc?
> I don't understand why you need a big comment about how
> the index is computed when that isn't changing.
I copied the comment from arch/powerpc/kernel/ptrace/ptrace32.c

> Doesn't the 32bit code need flush_fp_to_thread(child)?
Yes, you are right, this is my mistake.

> Don't the overflow checks for an index out of bounds need to be
> preserved?
There is already a check at the beginning of the function:
if (index > PT_FPSCR)
   return -EIO;

The other check was confusing for me also, but basically what happens is th=
is:
for the last valid index, the field fpscr in the structure
thread_fp_state is returned/updated.

On PPC32 bit, this check is not needed because the code is
functionally equivalent:
accessing fpr[32] will lead to accessing the next field in the
structure, i.e. the field fpscr (the same thing that if/else condition
is accomplishing).
This happens because TS_FPRWIDTH is 1 on PPC32.

> I am a bit lost about what makes the TS_FPR calculation wrong on 32bit?
TS_FPR(i) uses i for indexing fp_state.fpr[i][TS_FPROFFSET]
But fpr is defined as follows:
 u64 fpr[32][TS_FPRWIDTH] __attribute__((aligned(16)));

It is an array of size 32.
However, fpidx is validated like this:
if (fpidx < (PT_FPSCR - PT_FPR0))

And PT_FPSCR is defined as:
#define PT_FPSCR (PT_FPR0 + 2*32 + 1)

So PT_FPSCR - PT_FPR0 is 2*32+1 =3D 65
Meaning fpidx has a maximum value of 64.
fp_state.fpr[64][TS_FPROFFSET] is an out-of-range memory access.


----------
From: Ariel Miculas <ariel.miculas@gmail.com>
Date: Wed, Jun 1, 2022 at 6:57 PM
To: <security@kernel.org>
Cc: Ariel Miculas <ariel.miculas@gmail.com>


This fixes the gdbserver issue on PPC32 described here:
Link: https://linuxppc-dev.ozlabs.narkive.com/C46DRek4/debug-problems-on-pp=
c-83xx-target-due-to-changed-struct-task-struct

On PPC32, the user space code considers the floating point to be an
array of unsigned int (32 bits) - the index passed in is based on
this assumption.

fp_state is a matrix consisting of 32 lines
/* FP and VSX 0-31 register set /
struct thread_fp_state {
u64 fpr[32][TS_FPRWIDTH] attribute((aligned(16)));
u64 fpscr; / Floating point status */
};

On PPC32, PT_FPSCR is defined as: (PT_FPR0 + 2*32 + 1)

This means the fpr index validation allows a range from 0 to 65, leading
to out-of-bounds array access. This ends up corrupting
threads_struct->state, which holds the state of the task. Thus, threads
incorrectly transition from a running state to a traced state and get
stuck in that state.

On PPC32 it's ok to assume that TS_FPRWIDTH is 1 because CONFIG_VSX is
PPC64 specific. TS_FPROFFSET can be safely ignored, thus the assumption
that fpr is an array of 32 elements of type u64 holds true.

Solution taken from arch/powerpc/kernel/ptrace32.c

Signed-off-by: Ariel Miculas <ariel.miculas@gmail.com>
---
 arch/powerpc/kernel/ptrace/ptrace-fpu.c | 31 +++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-fpu.c
b/arch/powerpc/kernel/ptrace/ptrace-fpu.c
index 5dca19361316..93695abbbdfb 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-fpu.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-fpu.c
@@ -6,9 +6,16 @@

 #include "ptrace-decl.h"

+#ifdef CONFIG_PPC32
+/* Macros to workout the correct index for the FPR in the thread struct */
+#define FPRNUMBER(i) (((i) - PT_FPR0) >> 1)
+#define FPRHALF(i) (((i) - PT_FPR0) & 1)
+#define FPRINDEX(i) TS_FPRWIDTH * FPRNUMBER(i) * 2 + FPRHALF(i)
+#endif
+
 int ptrace_get_fpr(struct task_struct *child, int index, unsigned long *da=
ta)
 {
-#ifdef CONFIG_PPC_FPU_REGS
+#if defined(CONFIG_PPC_FPU_REGS) && !defined(CONFIG_PPC32)
        unsigned int fpidx =3D index - PT_FPR0;
 #endif

@@ -17,10 +24,20 @@ int ptrace_get_fpr(struct task_struct *child, int
index, unsigned long *data)

 #ifdef CONFIG_PPC_FPU_REGS
        flush_fp_to_thread(child);
+#ifdef CONFIG_PPC32
+       /*
+        * the user space code considers the floating point
+        * to be an array of unsigned int (32 bits) - the
+        * index passed in is based on this assumption.
+        */
+       *data =3D ((unsigned int *)child->thread.fp_state.fpr)
+               [FPRINDEX(index)];
+#else
        if (fpidx < (PT_FPSCR - PT_FPR0))
                memcpy(data, &child->thread.TS_FPR(fpidx), sizeof(long));
        else
                *data =3D child->thread.fp_state.fpscr;
+#endif
 #else
        *data =3D 0;
 #endif
@@ -30,7 +47,7 @@ int ptrace_get_fpr(struct task_struct *child, int
index, unsigned long *data)

 int ptrace_put_fpr(struct task_struct *child, int index, unsigned long dat=
a)
 {
-#ifdef CONFIG_PPC_FPU_REGS
+#if defined(CONFIG_PPC_FPU_REGS) && !defined(CONFIG_PPC32)
        unsigned int fpidx =3D index - PT_FPR0;
 #endif

@@ -39,10 +56,20 @@ int ptrace_put_fpr(struct task_struct *child, int
index, unsigned long data)

 #ifdef CONFIG_PPC_FPU_REGS
        flush_fp_to_thread(child);
+#ifdef CONFIG_PPC32
+       /*
+        * the user space code considers the floating point
+        * to be an array of unsigned int (32 bits) - the
+        * index passed in is based on this assumption.
+        */
+       ((unsigned int *)child->thread.fp_state.fpr)
+               [FPRINDEX(index)] =3D data;
+#else
--
2.36.1



----------
From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, Jun 2, 2022 at 9:27 AM
To: Ariel Miculas <ariel.miculas@gmail.com>
Cc: <security@kernel.org>


THis type of #ifdef in .c code is unmaintainable over time.  Can you put
it properly in a .h file somehow to make it simpler and easier to
understand and support?

thanks,

greg k-h


----------
From: Ariel Miculas <ariel.miculas@gmail.com>
Date: Thu, Jun 2, 2022 at 12:24 PM
To: Greg KH <gregkh@linuxfoundation.org>
Cc: <security@kernel.org>


I will send it to you shortly, but I will switch to my corporate email addr=
ess.


----------
From: Ariel Miculas <ariel.miculas@gmail.com>
Date: Mon, Jun 6, 2022 at 7:45 PM
To: <ariel.miculas@belden.com>, <mpe@ellerman.id.au>
