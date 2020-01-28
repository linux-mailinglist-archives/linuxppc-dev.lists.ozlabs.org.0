Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B213E14B30E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 11:53:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486Nkl65RPzDqKW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 21:53:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bA6jUyMd; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486Nhv5DylzDqKW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 21:51:41 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id q127so6781499pga.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 02:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:mime-version:user-agent:message-id
 :content-transfer-encoding;
 bh=DzdGDVKVeO3wAlEL0UiWdC6FBKuQaEEusiSwawwBnbY=;
 b=bA6jUyMdolfaKI+c9meNA+tBrK157wpPvVEJeAc/JxbkxsdaVsqkS1ItZIvrrixvUZ
 bApYeoqh+mEaHTWr1CNt/S16myNJOJBufyCoaX10GmGayTsr+gHNGn8jNTRyc7mcMIIq
 ov9JUrtah4+uWwGIXUaTX2nXjoyKafyBgYcp7NlhHOWQ5xZI8kS01iX8vGkX/S6iN9jL
 G90RowTT6lFURbMuWrFM5Ldk+X8UQUD500n73pTGqLu5+nkoY7MB/nlqQF8l0nuFesnh
 FjbuljKWkCPBOV1izXcSvzQ8fuq4/w3TjoE6nE5GBczSWi0zsrgjK+CyrVOY0uTqix2g
 HEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=DzdGDVKVeO3wAlEL0UiWdC6FBKuQaEEusiSwawwBnbY=;
 b=i8v2cQvqUrneXU5go2sOMHm5xk3V7kKcoZxuX+6GbcHwwkHdnG/x6Zd0ManU0CuDZL
 VjkudfZzyG3J5tHcgqxBe7ngn2oa7zb3XDyl+t8WrkcD7a6z0ljSW1xFCK3mEDdub7kE
 Lmsi5ytz5FE/YFg2v3bo2mlzW0pHObNRMNnopC1JGgBpuWED049Dv05p+Izjwetdw+vR
 9Y7nkhdWZXdJefmhjt/msN+0dPtuim80Iq67u05Ak1mIRYGTLM/OtEatX44hqLf4bGOq
 KkttivFE1wDcBb52JLrMtc89H/hr/t57RjKR5EaHzDTbFQ4A8/vxWXHDews+CFnJ6zSz
 6ISg==
X-Gm-Message-State: APjAAAX2NHhG/qt6uQdZYOhfQgQbYtKYvld2y2HcfFlSda9hxvuXzu9M
 DZ9474PrSa2lBz3hZxCIO1RdArUH
X-Google-Smtp-Source: APXvYqwk9oYy0B0gEm+4Cgvp6SDZ5qgRkuDXsHTLWbimhic/CStXAT1I+gbmH+wPuN0DTZvowyr3Wg==
X-Received: by 2002:a62:f94d:: with SMTP id g13mr3302572pfm.60.1580208698938; 
 Tue, 28 Jan 2020 02:51:38 -0800 (PST)
Received: from localhost (203-219-188-70.tpgi.com.au. [203.219.188.70])
 by smtp.gmail.com with ESMTPSA id u1sm18874681pfn.133.2020.01.28.02.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 02:51:38 -0800 (PST)
Date: Tue, 28 Jan 2020 20:50:48 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: powerpc Linux scv support and scv system call ABI proposal
To: linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1580207907.c96c1lh9t0.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 libc-alpha@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I would like to enable support for the scv instruction to provide the Linux
system calls.

This requires two things to be defined, firstly how to advertise support
for scv and how to allocate and advertise support for individual scv
vectors. Secondly, how to define a Linux system call ABI with this new
instruction.

I have put together a rough proposal along with some options and=20
questions. Any thoughts or input would be welcome, I have probably
missed some things so please point them out.

(I will be on vacation for two weeks from the end of the week, may not
get to replying immediately)

Thanks,
Nick

System Call Vectored (scv) ABI

The scv instruction is introduced with POWER9 / ISA3, it comes with an
rfscv counter-part. The benefit of these instructions is performance
(trading slower SRR0/1 with faster LR/CTR registers, and entering the
kernel with MSR[EE] and MSR[RI] left enabled, which can avoid one mtmsrd
instruction. Another benefit is that the ABI can be changed if there is
a good reason to.

The scv instruction has 128 interrupt entry points (not enough to cover
the Linux system call space). The proposal is to assign scv numbers
conservatively. 'scv 0' could be used for the regular Linux system call
ABI initially. Examples of other assignments could be 32-bit compat
system calls, and firmware service calls.

Linux has not enabled FSCR[SCV] yet, so the instruction will trap with ille=
gal
instruction on current environments. Linux has defined a HWCAP2 bit
PPC_FEATURE2_SCV for SCV support, but does not set it.

One option is for PPC_FEATURE2_SCV to indicate 'scv 0' support, and a new H=
WCAP
bit assigned for each new scv vector supported for userspace. This is the m=
ost
regular and flexible approach. It requires the most HWCAP space, but vector
usage is not expected to grow quickly.

Another option is for PPC_FEATURE2_SCV to indicate 'scv 0', and other vecto=
rs
will each return -ENOSYS, then when they are assigned to a new ABI, it will
define a particular way they can be queried for support (which would return
something other than -ENOSYS if supported). This will not require more HWCA=
P
bits, but it's less regular and more complicated to determine.

* Proposal is for PPC_FEATURE2_SCV to indicate 'scv 0' support, all other
  vectors will return -ENOSYS, and the decision for how to add support for
  a new vector deferred until we see the next user.

* Proposal is for scv 0 to provide the standard Linux system call ABI with =
some
  differences:

- LR is volatile across scv calls. This is necessary for support because th=
e
  scv instruction clobbers LR.

- CR1 and CR5-CR7 are volatile. This matches the C ABI and would allow the
  system call exit to avoid restoring the CR register.

- Error handling: use of CR0[SO] to indicate error requires a mtcr / mtocr
  instruction on the kernel side, and it is currently not implemented well
  in glibc, requiring a mfcr (mfocr should be possible and asm goto support
  would allow a better implementation). Is it worth continuing this style o=
f
  error handling? Or just move to -ve return means error? Using a different
  bit would allow the kernel to piggy back the CR return code setting with
  a test for the error case exit.

- R2 could be volatile as though it's an external function call, which
  would avoid one store  in the system call entry path. However it would
  require the caller to load R2 after the system call returns, where the
  latency of the load can not be overlapped with the costly system call
  exit sequence. On balance, it may be better to keep R2 as non-volatile.

- Number of volatile registers available seems sufficient. Linux's 'sc'
  handler is badly constrained here, but that is because it is shared
  between both hypercall and syscall handlers, which have different
  call conventions that share no volatile GPR registers! r9-r12 should
  be quite enough.

- Should this be for 64-bit only? 'scv 1' could be reserved for 32-bit
  calls if there was interest in developing an ABI for 32-bit programs.
  Marginal benefit in avoiding compat syscall selection.

=
