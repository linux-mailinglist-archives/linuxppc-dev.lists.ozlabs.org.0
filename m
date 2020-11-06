Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C675A2A9634
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 13:31:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSKWX2CjzzDr6y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 23:31:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSKNt46sPzDrL3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 23:25:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hkcZt1Lu; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CSKNh3QpCz9sTK;
 Fri,  6 Nov 2020 23:25:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1604665540;
 bh=M3MLLCdi469HVVuX1IFh0etxvDtXYdZtCGJFdJ+HAtU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hkcZt1LuBONwAVnUVObC94ACXMRMh3Ioej86BcBBgKrR8LdH0EmCWOFX8v9PTTI3e
 O7RsSvy/8pu8nn6QkstfUIW9yIxpvo/zlXbNw8J4fXXi91P952Y3RK6m2zcqCB+DKO
 t8xOBUcENGklVPLA6CPHO/Ma9bQBFcMcsMd9EzOiotfO3jxC9HVkyruFEYxskk3i9D
 alQVDspuBo30m6qbXX4F8rtPmLEWUn4yo9h3MfDdfkMLjwDPy38Lgj/lnbBgfCGAHu
 AVtR+8XGEFM30oitlrsGLNCRWtgWPzG4Dh6W22ouHVnxEW9Ofor8jQR+FesFcKjnJY
 FowVvMKuel8dA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Carl Jacobsen <cjacobsen@storix.com>
Subject: Re: Kernel panic from malloc() on SUSE 15.1?
In-Reply-To: <CAKkwB_TQJ=tg17SJd_s2SSXA7F3MeHmzjMC8f2uiV7yGvsLufg@mail.gmail.com>
References: <CAKkwB_S6Bs_+5At2aajbQbJg==WE_4NLdhSK=Bj+td67215Htg@mail.gmail.com>
 <878sbjuqe6.fsf@mpe.ellerman.id.au>
 <CAKkwB_RD0_=9SSwyYn-8Vo2dr2Li4X-v_KJ4qBWZRgxZuGUeRw@mail.gmail.com>
 <87lffgt8b9.fsf@mpe.ellerman.id.au>
 <CAKkwB_TQJ=tg17SJd_s2SSXA7F3MeHmzjMC8f2uiV7yGvsLufg@mail.gmail.com>
Date: Fri, 06 Nov 2020 23:25:38 +1100
Message-ID: <875z6iu0xp.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Carl Jacobsen <cjacobsen@storix.com> writes:
> On Thu, Nov 5, 2020 at 2:19 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
>> Carl Jacobsen <cjacobsen@storix.com> writes:
>> > The panic (on a call to malloc from static linked libcrypto) looks like
>> > this:
>>
>> What hardware is this on?
>>
>
> Thank you for looking into this.
>
> The system that's panicking identifies like this:
>     # uname -a
>     Linux sl151pwr8 4.12.14-197.18-default #1 SMP Tue Sep 17 14:26:49 UTC
> 2019
>     (d75059b) ppc64le ppc64le ppc64le GNU/Linux
>     #
>     # cat /etc/os-release
>     NAME="SLES"
>     VERSION="15-SP1"
>     VERSION_ID="15.1"
>     PRETTY_NAME="SUSE Linux Enterprise Server 15 SP1"
>     ID="sles"
>     ID_LIKE="suse"
>     ANSI_COLOR="0;32"
>     CPE_NAME="cpe:/o:suse:sles:15:sp1"
>
> The system is an LPAR running under PowerVM vios version 2.2.3.4.
> The underlying hardware is machine type-model 8284-22A.

OK thanks. That's a Power8.

>> Can you try booting with ppc_tm=off on the kernel command line, and see
>> if that changes anything?
>
> Yes. Output is down below. Doesn't appear to change much, but I don't have
> the background to interpret the registers.

Yeah looks like that's not the problem.

>> Can you put your compiled test program up somewhere we can download it
>> and look at? Or post the disassembly?
>>
>
> Here's the source file:
>     https://www.storix.com/download/support/misc/rand_test.c
>
> Here's the resulting executable:
>     https://www.storix.com/download/support/misc/rand_test

Thanks.

So something seems to have gone wrong linking this, I see eg:

0000000010004a8c <syscall_random>:
    10004a8c:   2b 10 40 3c     lis     r2,4139
    10004a90:   88 f7 42 38     addi    r2,r2,-2168
    10004a94:   a6 02 08 7c     mflr    r0
    10004a98:   10 00 01 f8     std     r0,16(r1)
    10004a9c:   f8 ff e1 fb     std     r31,-8(r1)
    10004aa0:   81 ff 21 f8     stdu    r1,-128(r1)
    10004aa4:   78 0b 3f 7c     mr      r31,r1
    10004aa8:   60 00 7f f8     std     r3,96(r31)
    10004aac:   68 00 9f f8     std     r4,104(r31)
    10004ab0:   00 00 00 60     nop
    10004ab4:   30 80 22 e9     ld      r9,-32720(r2)
    10004ab8:   00 00 a9 2f     cmpdi   cr7,r9,0
    10004abc:   30 00 9e 41     beq     cr7,10004aec <syscall_random+0x60>
    10004ac0:   60 00 7f e8     ld      r3,96(r31)
    10004ac4:   68 00 9f e8     ld      r4,104(r31)
    10004ac8:   39 b5 ff 4b     bl      10000000 <_init-0x1f00>

Notice that last bl (branch and link) to 0x10000000. But there's no text
at 0x10000000, that's the start of the page which happens to be the ELF
magic.

I've seen something like this before, but I can't remember when/where so
I haven't been able to track down what the problem was.

Anyway hopefully someone on the list will know.

That still doesn't explain the kernel crash though.


> Executable is linked to libcrypto from openssl-1.1.1g, configured with:
>     ./config no-shared no-dso no-threads -fPIC -ggdb3 -debug -static
>
> Executable is built (on SUSE 12) with:
>     gcc -ggdb3 -o rand_test rand_test.c libcrypto.a


> And running the executable (on SUSE 15.1) through gdb goes like this:
>
>     # gdb --args ./rand_test
>     GNU gdb (GDB; SUSE Linux Enterprise 15) 8.3.1
>     << snip intro text >>
>     Reading symbols from ./rand_test...
>     (gdb) b main
>     Breakpoint 1 at 0x1000288c: file rand_test.c, line 6.
>     (gdb) r
>     Starting program: /tmp/ossl/rand_test
>
>     Breakpoint 1, main (argc=1, argv=0x7ffffffff798) at rand_test.c:6
>     6           int has_enough_data = RAND_status();
>     (gdb) s
>     RAND_status () at crypto/rand/rand_lib.c:958
>     958         const RAND_METHOD *meth = RAND_get_rand_method();
>     (gdb)
>     RAND_get_rand_method () at crypto/rand/rand_lib.c:844
>     844         const RAND_METHOD *tmp_meth = NULL;
>     (gdb)
>     846         if (!RUN_ONCE(&rand_init, do_rand_init))
>     (gdb)
>     CRYPTO_THREAD_run_once (once=0x102a7d88 <rand_init>, > init=0x10002f30 <do_rand_init_ossl_>) at crypto/threads_none.c:67
>     67          if (*once != 0)
>     (gdb)
>     70          init();
>     (gdb)
>     do_rand_init_ossl_ () at crypto/rand/rand_lib.c:306
>     306     DEFINE_RUN_ONCE_STATIC(do_rand_init)
>     (gdb)
>     do_rand_init () at crypto/rand/rand_lib.c:309
>     309         rand_engine_lock = CRYPTO_THREAD_lock_new();
>     (gdb)
>     CRYPTO_THREAD_lock_new () at crypto/threads_none.c:24
>     24          if ((lock = OPENSSL_zalloc(sizeof(unsigned int))) == NULL) {
>     (gdb)
>     CRYPTO_zalloc (num=4, file=0x1023a500 "crypto/threads_none.c", line=24) > at crypto/mem.c:230
>     230         void *ret = CRYPTO_malloc(num, file, line);
>     (gdb)
>     CRYPTO_malloc (num=4, file=0x1023a500 "crypto/threads_none.c", line=24) > at crypto/mem.c:194
>     194         void *ret = NULL;
>     (gdb)
>     197         if (malloc_impl != NULL && malloc_impl != CRYPTO_malloc)
>     (gdb)
>     200         if (num == 0)
>     (gdb)
>     204         if (allow_customize) {
>     (gdb)
>     210             allow_customize = 0;
>     (gdb)
>     222         ret = malloc(num);
>     (gdb)
>     Bad kernel stack pointer 7fffffffef20 at 700


On my machine it doesn't crash the kernel, so I can catch it later. For
me it's here:

Program received signal SIGILL, Illegal instruction.
0x0000000010000004 in ?? ()
(gdb) bt
#0  0x0000000010000004 in ?? ()
#1  0x0000000010004acc in syscall_random (buf=0x102b0730, buflen=32)
    at crypto/rand/rand_unix.c:371
#2  0x00000000100053fc in rand_pool_acquire_entropy (pool=0x102b06e0)
    at crypto/rand/rand_unix.c:636
#3  0x0000000010002b58 in rand_drbg_get_entropy (drbg=0x102b02e0, 
    pout=0x7ffffffff3f0, entropy=256, min_len=32, max_len=2147483647, 
    prediction_resistance=0) at crypto/rand/rand_lib.c:198
#4  0x000000001001ed9c in RAND_DRBG_instantiate (drbg=0x102b02e0, 
    pers=0x10248d00 <ossl_pers_string> "OpenSSL NIST SP 800-90A DRBG", 
    perslen=28) at crypto/rand/drbg_lib.c:338
#5  0x0000000010020300 in drbg_setup (parent=0x0) at crypto/rand/drbg_lib.c:895
#6  0x0000000010020414 in do_rand_drbg_init () at crypto/rand/drbg_lib.c:924
#7  0x000000001002034c in do_rand_drbg_init_ossl_ ()
    at crypto/rand/drbg_lib.c:909
#8  0x0000000010005d1c in CRYPTO_THREAD_run_once (
    once=0x102ab4d8 <rand_drbg_init>, 
    init=0x1002032c <do_rand_drbg_init_ossl_>) at crypto/threads_none.c:70
#9  0x00000000100209c4 in RAND_DRBG_get0_master ()
    at crypto/rand/drbg_lib.c:1102
#10 0x0000000010020914 in drbg_status () at crypto/rand/drbg_lib.c:1084
#11 0x0000000010004a58 in RAND_status () at crypto/rand/rand_lib.c:961
#12 0x0000000010002890 in main (argc=1, argv=0x7ffffffffa68) at rand_test.c:6
(gdb) 


ie. in the syscall_random() that I mentioned above.

You should be able to catch it there too if you do:

(gdb) b *0x10000000
(gdb) r

Hopefully it will stop without crashing the kernel, and then a `bt` will
show that you're in the same place as me.

If you can get that to work, when you're stopped there, can you do an
`info registers` and send us the output.

cheers
