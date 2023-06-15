Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BB8731836
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 14:11:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nd/u8l+l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qhh2r2l83z3bWr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 22:11:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nd/u8l+l;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qhh1t2ZXtz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 22:10:10 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Qhh1t2Jplz4wjD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 22:10:10 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Qhh1t2Gvfz4wjF; Thu, 15 Jun 2023 22:10:10 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nd/u8l+l;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Qhh1t2CF9z4wjD
	for <linuxppc-dev@ozlabs.org>; Thu, 15 Jun 2023 22:10:10 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b521cc07c8so1371255ad.0
        for <linuxppc-dev@ozlabs.org>; Thu, 15 Jun 2023 05:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686831007; x=1689423007;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvn3HgszZdVzbUDOlI5eM0Jg4zz/FHP/oLjV87FZBGE=;
        b=nd/u8l+l7ObB/1yrOZvUHIWdhEtuV3nl7hhDDPdhPIIFhbBLPgTX27XmIoMkbIkUn/
         DNY0guMdFZ+b0jzKwG9yQmBToQ/BEOM/1ouRioFCTfAwZmUlFp7/Vw2C5FwBhqzaB9+z
         SBCCCClFbzQ0LsWw2ogqlQuIUm1lw5Tf/KM95RUK866XCoDai5FT5mgRKBtZ//V3RLck
         PAi2IQlU3vKGy5ZviabtPy9ASNblRTxK7GAB8PucGr1S66pQ9i5SyvmdbTW0mUQEuCO9
         XanVmv2ugqFhbj1dlug4TvcYyt20t1GnsSKHLAEN4pcj7+tcNlgUxyn/4tgtB+fDAySB
         6ozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686831007; x=1689423007;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lvn3HgszZdVzbUDOlI5eM0Jg4zz/FHP/oLjV87FZBGE=;
        b=CJwCuEiHqwCmXZpTpFJeAaHCq3lJc9/ftHCR0TqWS5HaZJaDfgqgld+qpK4y0P4FyZ
         nS3rOcOlT1kXkyOIrC5T98K4IUvCC8iSO/0Q7hq0EA4p3ZJyAt9Z4l/qXD1zDL+oySpC
         Rcm5h3XbPbIf/juzIWXxPB9dC4QETbWU+K2EIYHH6RSroJVc4vLqbJ/SodeaFUNjucpJ
         6EN2j6ZGd4IhfQ7qOxX5RCm20xIM9epQXzNuUsmkx37mfJnYuV5A6igL8SoovHhgSAmb
         YNzsuFt0NOk4Iqx4Pw7otKP9vAT9vxnrgQgIF2UImLiG01KjnGGFhT7UP1tLaxO9wvT6
         KbkQ==
X-Gm-Message-State: AC+VfDz2H+m08cWdeQpP0TNpk5/9UoOwc5es8k5f7ysfz90QF9ZjlrjI
	guVOYq9PdpllLy+ee4teyv0=
X-Google-Smtp-Source: ACHHUZ4LWRiEwvEZHFSbwS1aWLsvfcUFhbrmSqlC/R/yuV8SJPFvwko8AK6eu9N//AByYM2IGxSqpw==
X-Received: by 2002:a17:902:830c:b0:1b5:79b:8b14 with SMTP id bd12-20020a170902830c00b001b5079b8b14mr3271695plb.26.1686831007091;
        Thu, 15 Jun 2023 05:10:07 -0700 (PDT)
Received: from localhost (14-203-144-223.static.tpgi.com.au. [14.203.144.223])
        by smtp.gmail.com with ESMTPSA id a17-20020a170902ee9100b001b5115b16a1sm1805681pld.94.2023.06.15.05.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 05:10:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Jun 2023 22:10:01 +1000
Message-Id: <CTD7OOB3NTH8.1QSVBACQ2VI3V@wheely>
Subject: Re: [RFC PATCH v2 1/1] powerpc: update ppc_save_regs to save
 current r1 in pt_regs
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Aditya Gupta" <adityag@linux.ibm.com>, <linuxppc-dev@ozlabs.org>,
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.14.0
References: <20230615091047.90433-1-adityag@linux.ibm.com>
In-Reply-To: <20230615091047.90433-1-adityag@linux.ibm.com>
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
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, "Naveen
 N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Jun 15, 2023 at 7:10 PM AEST, Aditya Gupta wrote:
> ppc_save_regs() skips one stack frame while saving the CPU register state=
s.
> Instead of saving current R1, it pulls the previous stack frame pointer.
>
> When vmcores caused by direct panic call (such as `echo c >
> /proc/sysrq-trigger`), are debugged with gdb, gdb fails to show the
> backtrace correctly. On further analysis, it was found that it was becaus=
e
> of mismatch between r1 and NIP.
>
> GDB uses NIP to get current function symbol and uses corresponding debug
> info of that function to unwind previous frames, but due to the
> mismatching r1 and NIP, the unwinding does not work, and it fails to
> unwind to the 2nd frame and hence does not show the backtrace.
>
> GDB backtrace with vmcore of kernel without this patch:
>
> ---------
> (gdb) bt
>  #0  0xc0000000002a53e8 in crash_setup_regs (oldregs=3D<optimized out>,
>     newregs=3D0xc000000004f8f8d8) at ./arch/powerpc/include/asm/kexec.h:6=
9
>  #1  __crash_kexec (regs=3D<optimized out>) at kernel/kexec_core.c:974
>  #2  0x0000000000000063 in ?? ()
>  #3  0xc000000003579320 in ?? ()
> ---------
>
> Further analysis revealed that the mismatch occurred because
> "ppc_save_regs" was saving the previous stack's SP instead of the current
> r1. This patch fixes this by storing current r1 in the saved pt_regs.
>
> GDB backtrace with vmcore of patched kernel:
>
> --------
> (gdb) bt
>  #0  0xc0000000002a53e8 in crash_setup_regs (oldregs=3D0x0, newregs=3D0xc=
00000000670b8d8)
>     at ./arch/powerpc/include/asm/kexec.h:69
>  #1  __crash_kexec (regs=3Dregs@entry=3D0x0) at kernel/kexec_core.c:974
>  #2  0xc000000000168918 in panic (fmt=3Dfmt@entry=3D0xc000000001654a60 "s=
ysrq triggered crash\n")
>     at kernel/panic.c:358
>  #3  0xc000000000b735f8 in sysrq_handle_crash (key=3D<optimized out>) at =
drivers/tty/sysrq.c:155
>  #4  0xc000000000b742cc in __handle_sysrq (key=3Dkey@entry=3D99, check_ma=
sk=3Dcheck_mask@entry=3Dfalse)
>     at drivers/tty/sysrq.c:602
>  #5  0xc000000000b7506c in write_sysrq_trigger (file=3D<optimized out>, b=
uf=3D<optimized out>,
>     count=3D2, ppos=3D<optimized out>) at drivers/tty/sysrq.c:1163
>  #6  0xc00000000069a7bc in pde_write (ppos=3D<optimized out>, count=3D<op=
timized out>,
>     buf=3D<optimized out>, file=3D<optimized out>, pde=3D0xc00000000362cb=
40) at fs/proc/inode.c:340
>  #7  proc_reg_write (file=3D<optimized out>, buf=3D<optimized out>, count=
=3D<optimized out>,
>     ppos=3D<optimized out>) at fs/proc/inode.c:352
>  #8  0xc0000000005b3bbc in vfs_write (file=3Dfile@entry=3D0xc000000006aa6=
b00,
>     buf=3Dbuf@entry=3D0x61f498b4f60 <error: Cannot access memory at addre=
ss 0x61f498b4f60>,
>     count=3Dcount@entry=3D2, pos=3Dpos@entry=3D0xc00000000670bda0) at fs/=
read_write.c:582
>  #9  0xc0000000005b4264 in ksys_write (fd=3D<optimized out>,
>     buf=3D0x61f498b4f60 <error: Cannot access memory at address 0x61f498b=
4f60>, count=3D2)
>     at fs/read_write.c:637
>  #10 0xc00000000002ea2c in system_call_exception (regs=3D0xc00000000670be=
80, r0=3D<optimized out>)
>     at arch/powerpc/kernel/syscall.c:171
>  #11 0xc00000000000c270 in system_call_vectored_common ()
>     at arch/powerpc/kernel/interrupt_64.S:192
> --------
>
> Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>

So this now saves regs as though it was an interrupt taken in the
caller, at the instruction after the call to ppc_save_regs, whereas
previously the NIP was there, but R1 came from the caller's caller
and that mismatch is what causes gdb's dwarf unwinder to go haywire.

Nice catch, and I think I follow the fix and I think I agree with it.
Before the bug was introduced, NIP also came from the grandparent.
Which is what xmon presumably wanted, but since then I think maybe it
makes more sense to just have the parent caller.

Reivewed-by: Nicholas Piggin <npiggin@gmail.com>
Fixes: d16a58f8854b1 ("powerpc: Improve ppc_save_regs()")

Thanks,
Nick
