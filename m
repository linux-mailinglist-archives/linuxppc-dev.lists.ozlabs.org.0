Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1B32A8992
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 23:12:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRyS35K89zDrBJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 09:12:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=storix.com (client-ip=2607:f8b0:4864:20::d32;
 helo=mail-io1-xd32.google.com; envelope-from=cjacobsen@storix.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=storix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=storix-com.20150623.gappssmtp.com
 header.i=@storix-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=VI5AH0cF; dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRv9M5n07zDr02
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 06:44:21 +1100 (AEDT)
Received: by mail-io1-xd32.google.com with SMTP id n129so3024788iod.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 11:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=storix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l1TXn21LVcX2X+fvwvrUIHNzQaJxJ3y+h0YqGu0tDtY=;
 b=VI5AH0cFzeFKvZoRPIT0NsihKt/iGtzdIz5UIuTbhV8BuECuN0ImIfVTwdLSJsQ7qw
 kcz4poSatcdTDPH/t7yEC6qxpshcc0H+X5/zvBd1w8B1nBw3lUdRjCVwkJmXZs9PCq36
 CvEtWaOInyrsA3fyEYwU5Fe5IVKiG4nWQTzrsyQRNH3JDkk/b2bh0kziGxRoez46ZBTs
 HvigUpsX9wg4TTzmprGMj0mZUl5qOMc4KTGYDRNSkbWA7JOQwDWYkbWve4g2A657COUC
 YdGc9yz0V/K2g8DLGDzJw9PFYZ7SEmsHNls6G/AyhFcHnDcgCESeoDw3bDfq6GoxJZ21
 zPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l1TXn21LVcX2X+fvwvrUIHNzQaJxJ3y+h0YqGu0tDtY=;
 b=UNh4IkuXOs0TFzTz5Qulh5fX41278EA9oClRQ8CK8wBREZsmHw2xc7pEGcXTvwnynI
 97TNaHJ4CWtqZrTXscC3/NijJ0l5XCspSpGsLkpE3eJfR0eWbf1+SMSgNzt5Y0n/9aqF
 XzrhdNVPtYo9TfxSoutayU3pf4NYR2z9L3vF3IzZDNap92LlFTHOj+02GmHVuIlba2Ns
 b56nrR0TO14kxCJ+8djMNOL3qV2RmIOu+HTkVrIfoXKTTtBZo+TbefYXQrMvVfykbk5O
 ivrEFBt0JyGOh80RnbVDkfkRM3wfq10djuesVH3pSK5A5CD2N3thCInRUFWaB8zBZDoN
 RLSQ==
X-Gm-Message-State: AOAM532/L2VV2FGgRHY5ydCNogJ5PELK3lrYvvQtLl+0yPejo8typ1Qg
 v4gfa15YeQSxfM6S7UJxewO7yVJ5TNm3MNYvclJIww==
X-Google-Smtp-Source: ABdhPJwO947bIhosrHlUuvhoKxeyJl9Wzhbg13qsRVS03UQ/H7pZ7wV0dTfoPSm81u0ve6VcB8yrr3H9JrGkMNeml0k=
X-Received: by 2002:a02:cbde:: with SMTP id u30mr3559356jaq.69.1604605457563; 
 Thu, 05 Nov 2020 11:44:17 -0800 (PST)
MIME-Version: 1.0
References: <CAKkwB_S6Bs_+5At2aajbQbJg==WE_4NLdhSK=Bj+td67215Htg@mail.gmail.com>
 <878sbjuqe6.fsf@mpe.ellerman.id.au>
 <CAKkwB_RD0_=9SSwyYn-8Vo2dr2Li4X-v_KJ4qBWZRgxZuGUeRw@mail.gmail.com>
 <87lffgt8b9.fsf@mpe.ellerman.id.au>
In-Reply-To: <87lffgt8b9.fsf@mpe.ellerman.id.au>
From: Carl Jacobsen <cjacobsen@storix.com>
Date: Thu, 5 Nov 2020 11:44:06 -0800
Message-ID: <CAKkwB_TQJ=tg17SJd_s2SSXA7F3MeHmzjMC8f2uiV7yGvsLufg@mail.gmail.com>
Subject: Re: Kernel panic from malloc() on SUSE 15.1?
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: multipart/alternative; boundary="0000000000004dac1405b3615278"
X-Mailman-Approved-At: Fri, 06 Nov 2020 09:10:36 +1100
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

--0000000000004dac1405b3615278
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 5, 2020 at 2:19 AM Michael Ellerman <mpe@ellerman.id.au> wrote:

> Carl Jacobsen <cjacobsen@storix.com> writes:
> > The panic (on a call to malloc from static linked libcrypto) looks like
> > this:
>
> What hardware is this on?
>

Thank you for looking into this.

The system that's panicking identifies like this:
    # uname -a
    Linux sl151pwr8 4.12.14-197.18-default #1 SMP Tue Sep 17 14:26:49 UTC
2019
    (d75059b) ppc64le ppc64le ppc64le GNU/Linux
    #
    # cat /etc/os-release
    NAME="SLES"
    VERSION="15-SP1"
    VERSION_ID="15.1"
    PRETTY_NAME="SUSE Linux Enterprise Server 15 SP1"
    ID="sles"
    ID_LIKE="suse"
    ANSI_COLOR="0;32"
    CPE_NAME="cpe:/o:suse:sles:15:sp1"

The system is an LPAR running under PowerVM vios version 2.2.3.4.
The underlying hardware is machine type-model 8284-22A.


> Can you try booting with ppc_tm=off on the kernel command line, and see
> if that changes anything?
>

Yes. Output is down below. Doesn't appear to change much, but I don't have
the background to interpret the registers.


> Can you put your compiled test program up somewhere we can download it
> and look at? Or post the disassembly?
>

Here's the source file:
    https://www.storix.com/download/support/misc/rand_test.c

Here's the resulting executable:
    https://www.storix.com/download/support/misc/rand_test

Executable is linked to libcrypto from openssl-1.1.1g, configured with:
    ./config no-shared no-dso no-threads -fPIC -ggdb3 -debug -static

Executable is built (on SUSE 12) with:
    gcc -ggdb3 -o rand_test rand_test.c libcrypto.a


And running the executable (on SUSE 15.1) through gdb goes like this:

    # gdb --args ./rand_test
    GNU gdb (GDB; SUSE Linux Enterprise 15) 8.3.1
    << snip intro text >>
    Reading symbols from ./rand_test...
    (gdb) b main
    Breakpoint 1 at 0x1000288c: file rand_test.c, line 6.
    (gdb) r
    Starting program: /tmp/ossl/rand_test

    Breakpoint 1, main (argc=1, argv=0x7ffffffff798) at rand_test.c:6
    6           int has_enough_data = RAND_status();
    (gdb) s
    RAND_status () at crypto/rand/rand_lib.c:958
    958         const RAND_METHOD *meth = RAND_get_rand_method();
    (gdb)
    RAND_get_rand_method () at crypto/rand/rand_lib.c:844
    844         const RAND_METHOD *tmp_meth = NULL;
    (gdb)
    846         if (!RUN_ONCE(&rand_init, do_rand_init))
    (gdb)
    CRYPTO_THREAD_run_once (once=0x102a7d88 <rand_init>,
init=0x10002f30 <do_rand_init_ossl_>) at crypto/threads_none.c:67
    67          if (*once != 0)
    (gdb)
    70          init();
    (gdb)
    do_rand_init_ossl_ () at crypto/rand/rand_lib.c:306
    306     DEFINE_RUN_ONCE_STATIC(do_rand_init)
    (gdb)
    do_rand_init () at crypto/rand/rand_lib.c:309
    309         rand_engine_lock = CRYPTO_THREAD_lock_new();
    (gdb)
    CRYPTO_THREAD_lock_new () at crypto/threads_none.c:24
    24          if ((lock = OPENSSL_zalloc(sizeof(unsigned int))) == NULL) {
    (gdb)
    CRYPTO_zalloc (num=4, file=0x1023a500 "crypto/threads_none.c", line=24)
at crypto/mem.c:230
    230         void *ret = CRYPTO_malloc(num, file, line);
    (gdb)
    CRYPTO_malloc (num=4, file=0x1023a500 "crypto/threads_none.c", line=24)
at crypto/mem.c:194
    194         void *ret = NULL;
    (gdb)
    197         if (malloc_impl != NULL && malloc_impl != CRYPTO_malloc)
    (gdb)
    200         if (num == 0)
    (gdb)
    204         if (allow_customize) {
    (gdb)
    210             allow_customize = 0;
    (gdb)
    222         ret = malloc(num);
    (gdb)
    Bad kernel stack pointer 7fffffffef20 at 700
    Oops: Bad kernel stack pointer, sig: 6 [#1]
    SMP NR_CPUS=2048
    NUMA
    pSeries
    Modules linked in: scsi_transport_iscsi af_packet xt_tcpudp
ip6t_rpfilter ip6t_REJECT ipt_REJECT xt_conntrack ip_set nfnetlink
ebtable_nat ebtable_broute br_netfilter bridge stp llc ip6table_nat
nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6 ip6table_mangle ip6table_raw
ip6table_security iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4
nf_nat nf_conntrack libcrc32c iptable_mangle iptable_raw iptable_security
ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter ip_tables
x_tables ibmveth(X) vmx_crypto gf128mul crct10dif_vpmsum rtc_generic btrfs
xor zstd_decompress zstd_compress xxhash raid6_pq sr_mod cdrom sd_mod
ibmvscsi(X) scsi_transport_srp crc32c_vpmsum sg dm_multipath dm_mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua scsi_mod autofs4
    Supported: Yes, External
    CPU: 4 PID: 3082 Comm: rand_test Tainted: G
4.12.14-197.18-default #1 SLE15-SP1
    task: c00000002e226100 task.stack: c0000000387c8000
    NIP: 0000000000000700 LR: 0000000010004acc CTR: 0000000000000000
    REGS: c00000001ebffd40 TRAP: 0300   Tainted: G
 (4.12.14-197.18-default)
    MSR: 8000000000001000 <SF,ME>
      CR: 44000844  XER: 20000000
    CFAR: 00000000000010f0 DAR: ffffffffffffb27a DSISR: 40000000 SOFTE: 0
    GPR00: 0000000020000000 00007fffffffef20 00000000102af788
fffffffffffffffd
    GPR04: 0000000000000020 0000000000000030 00000000102b0760
0000000000000001
    GPR08: 0000000000000000 00007fffb7dacc00 00000000102b0730
800000010280f033
    GPR12: 0000000000004000 00007fffb7ffa100 0000000000000000
0000000000000000
    GPR16: 0000000000000000 0000000000000000 0000000000000000
0000000000000000
    GPR20: 0000000000000000 0000000000000000 0000000000000000
0000000000000000
    GPR24: 0000000000000000 0000000000000000 0000000000000000
00007fffb7fef4b8
    GPR28: 00007fffb7ff0000 0000000000000000 0000000000000000
00007fffffffef20
    NIP [0000000000000700] 0x700
    LR [0000000010004acc] 0x10004acc
    Call Trace:
    Instruction dump:
    00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
    00000000 00000000 00000000 00000000 7db243a6 7db142a6 f92d0080 7d20e2a6
    ---[ end trace 167d5d3b2e8a06e9 ]---

    Sending IPI to other CPUs
    IPI complete
    kexec: Starting switchover sequence.
    I'm in purgatory
     -> smp_release_cpus()
    spinning_secondaries = 0
     <- smp_release_cpus()
    Kernel panic - not syncing: Out of memory and no killable processes...

    CPU: 4 PID: 1 Comm: swapper/4 Not tainted 4.12.14-197.18-default #1
SLE15-SP1
    Call Trace:
    [c000000012457210] [c000000008a20140] dump_stack+0xb0/0xf0 (unreliable)
    [c000000012457250] [c000000008a1ccd4] panic+0x144/0x31c
    [c0000000124572e0] [c0000000082efcc0] out_of_memory+0x3f0/0x700
    [c000000012457380] [c0000000082f7ed4]
__alloc_pages_nodemask+0x1004/0x10b0
    [c000000012457570] [c00000000837f4d8] alloc_page_interleave+0x58/0x110
    [c0000000124575b0] [c0000000083800bc] alloc_pages_current+0x16c/0x1d0
    [c000000012457610] [c0000000082e8398] __page_cache_alloc+0xd8/0x150
    [c000000012457650] [c0000000082e8574] pagecache_get_page+0x164/0x440
    [c0000000124576b0] [c0000000082e8884]
grab_cache_page_write_begin+0x34/0x70
    [c0000000124576e0] [c00000000840ede8] simple_write_begin+0x48/0x190
    [c000000012457720] [c0000000082e7c7c] generic_perform_write+0xec/0x270
    [c0000000124577b0] [c0000000082ea2e0]
__generic_file_write_iter+0x250/0x2a0
    [c000000012457810] [c0000000082ea53c]
generic_file_write_iter+0x20c/0x2e0
    [c000000012457850] [c0000000083cc0e0] __vfs_write+0x120/0x1e0
    [c0000000124578e0] [c0000000083cdfc8] vfs_write+0xd8/0x220
    [c000000012457930] [c0000000083cfeec] SyS_write+0x6c/0x110
    [c000000012457980] [c000000008d154c4] xwrite+0x54/0xb8
    [c0000000124579c0] [c000000008d15574] do_copy+0x4c/0x17c
    [c0000000124579f0] [c000000008d15140] write_buffer+0x64/0x90
    [c000000012457a20] [c000000008d151d4] flush_buffer+0x68/0xf4
    [c000000012457a70] [c000000008d62268] unxz+0x210/0x398
    [c000000012457b10] [c000000008d15efc] unpack_to_rootfs+0x1f0/0x360
    [c000000012457bc0] [c000000008d16108] populate_rootfs+0x9c/0x188
    [c000000012457c40] [c00000000800f5d4] do_one_initcall+0x64/0x1d0
    [c000000012457d00] [c000000008d14474] kernel_init_freeable+0x294/0x388
    [c000000012457dc0] [c00000000801026c] kernel_init+0x2c/0x160
    [c000000012457e30] [c00000000800b560] ret_from_kernel_thread+0x5c/0x7c
    ------------[ cut here ]------------


Doing the same thing but with ppc_tm=off...
    # cat /proc/cmdline
    BOOT_IMAGE=/boot/vmlinux-4.12.14-197.18-default
root=UUID=0e795e37-3692-465a-a037-c2935a9fde7a mitigations=auto quiet
crashkernel=197M ppc_tm=off


Results in a panic at the same point, with a few registers changed:

    << snip down to panic at malloc >>
    (gdb)
    Bad kernel stack pointer 7fffffffef20 at 700
    Oops: Bad kernel stack pointer, sig: 6 [#1]
    SMP NR_CPUS=2048
    NUMA
    pSeries
    Modules linked in: scsi_transport_iscsi af_packet xt_tcpudp
ip6t_rpfilter ip6t_REJECT ipt_REJECT xt_conntrack ip_set nfnetlink
ebtable_nat ebtable_broute br_netfilter bridge stp llc ip6table_nat
nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6 ip6table_mangle ip6table_raw
ip6table_security iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4
nf_nat nf_conntrack libcrc32c iptable_mangle iptable_raw iptable_security
ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter ip_tables
x_tables ibmveth(X) vmx_crypto gf128mul crct10dif_vpmsum rtc_generic btrfs
xor zstd_decompress zstd_compress xxhash raid6_pq sr_mod cdrom sd_mod
ibmvscsi(X) scsi_transport_srp crc32c_vpmsum sg dm_multipath dm_mod
scsi_dh_rdac scsi_dh_emc scsi_dh_alua scsi_mod autofs4
    Supported: Yes, External
    CPU: 2 PID: 3079 Comm: rand_test Tainted: G
4.12.14-197.18-default #1 SLE15-SP1
    task: c00000002f6bcc00 task.stack: c0000000321fc000
    NIP: 0000000000000700 LR: 0000000010004acc CTR: 0000000000000000
    REGS: c00000001ec17d40 TRAP: 0300   Tainted: G
 (4.12.14-197.18-default)
    MSR: 8000000000001000 <SF,ME>
      CR: 44000844  XER: 20000000
    CFAR: 00000000000010f0 DAR: ffffffffffffb27a DSISR: 40000000 SOFTE: 0
    GPR00: 0000000020000000 00007fffffffef20 00000000102af788
fffffffffffffffd
    GPR04: 0000000000000020 0000000000000030 00000000102b0760
0000000000000001
    GPR08: 0000000000000000 00007fffb7dacc00 00000000102b0730
800000000280f033
    GPR12: 0000000000004000 00007fffb7ffa100 0000000000000000
0000000000000000
    GPR16: 0000000000000000 0000000000000000 0000000000000000
0000000000000000
    GPR20: 0000000000000000 0000000000000000 0000000000000000
0000000000000000
    GPR24: 0000000000000000 0000000000000000 0000000000000000
00007fffb7fef4b8
    GPR28: 00007fffb7ff0000 0000000000000000 0000000000000000
00007fffffffef20
    NIP [0000000000000700] 0x700
    LR [0000000010004acc] 0x10004acc
    Call Trace:
    Instruction dump:
    00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
    00000000 00000000 00000000 00000000 7db243a6 7db142a6 f92d0080 7d20e2a6
    ---[ end trace 436f626dd098548c ]---

    Sending IPI to other CPUs
    IPI complete
    kexec: Starting switchover sequence.
    I'm in purgatory
     -> smp_release_cpus()
    spinning_secondaries = 0
     <- smp_release_cpus()
    Kernel panic - not syncing: Out of memory and no killable processes...

    CPU: 2 PID: 1 Comm: swapper/2 Not tainted 4.12.14-197.18-default #1
SLE15-SP1
    Call Trace:
    [c000000012457210] [c000000008a20140] dump_stack+0xb0/0xf0 (unreliable)
    [c000000012457250] [c000000008a1ccd4] panic+0x144/0x31c
    [c0000000124572e0] [c0000000082efcc0] out_of_memory+0x3f0/0x700
    [c000000012457380] [c0000000082f7ed4]
__alloc_pages_nodemask+0x1004/0x10b0
    [c000000012457570] [c00000000837f4d8] alloc_page_interleave+0x58/0x110
    [c0000000124575b0] [c0000000083800bc] alloc_pages_current+0x16c/0x1d0
    [c000000012457610] [c0000000082e8398] __page_cache_alloc+0xd8/0x150
    [c000000012457650] [c0000000082e8574] pagecache_get_page+0x164/0x440
    [c0000000124576b0] [c0000000082e8884]
grab_cache_page_write_begin+0x34/0x70
    [c0000000124576e0] [c00000000840ede8] simple_write_begin+0x48/0x190
    [c000000012457720] [c0000000082e7c7c] generic_perform_write+0xec/0x270
    [c0000000124577b0] [c0000000082ea2e0]
__generic_file_write_iter+0x250/0x2a0
    [c000000012457810] [c0000000082ea53c]
generic_file_write_iter+0x20c/0x2e0
    [c000000012457850] [c0000000083cc0e0] __vfs_write+0x120/0x1e0
    [c0000000124578e0] [c0000000083cdfc8] vfs_write+0xd8/0x220
    [c000000012457930] [c0000000083cfeec] SyS_write+0x6c/0x110
    [c000000012457980] [c000000008d154c4] xwrite+0x54/0xb8
    [c0000000124579c0] [c000000008d15574] do_copy+0x4c/0x17c
    [c0000000124579f0] [c000000008d15140] write_buffer+0x64/0x90
    [c000000012457a20] [c000000008d151d4] flush_buffer+0x68/0xf4
    [c000000012457a70] [c000000008d62268] unxz+0x210/0x398
    [c000000012457b10] [c000000008d15efc] unpack_to_rootfs+0x1f0/0x360
    [c000000012457bc0] [c000000008d16108] populate_rootfs+0x9c/0x188
    [c000000012457c40] [c00000000800f5d4] do_one_initcall+0x64/0x1d0
    [c000000012457d00] [c000000008d14474] kernel_init_freeable+0x294/0x388
    [c000000012457dc0] [c00000000801026c] kernel_init+0x2c/0x160
    [c000000012457e30] [c00000000800b560] ret_from_kernel_thread+0x5c/0x7c
    ------------[ cut here ]------------


Diffing the panic output looks like this (highlighting register changes?):

    74,75c79,80
    < CPU: 4 PID: 3082 Comm: rand_test Tainted: G
4.12.14-197.18-default #1 SLE15-SP1
    < task: c00000002e226100 task.stack: c0000000387c8000
    ---
    > CPU: 2 PID: 3079 Comm: rand_test Tainted: G
4.12.14-197.18-default #1 SLE15-SP1
    > task: c00000002f6bcc00 task.stack: c0000000321fc000
    77c82
    < REGS: c00000001ebffd40 TRAP: 0300   Tainted: G
 (4.12.14-197.18-default)
    ---
    > REGS: c00000001ec17d40 TRAP: 0300   Tainted: G
 (4.12.14-197.18-default)
    83c88
    < GPR08: 0000000000000000 00007fffb7dacc00 00000000102b0730
800000010280f033
    ---
    > GPR08: 0000000000000000 00007fffb7dacc00 00000000102b0730
800000000280f033
    95c100
    < ---[ end trace 167d5d3b2e8a06e9 ]---
    ---
    > ---[ end trace 436f626dd098548c ]---
    106c111
    < CPU: 4 PID: 1 Comm: swapper/4 Not tainted 4.12.14-197.18-default #1
SLE15-SP1
    ---
    > CPU: 2 PID: 1 Comm: swapper/2 Not tainted 4.12.14-197.18-default #1
SLE15-SP1

-- 
Carl Jacobsen
Storix, Inc.

--0000000000004dac1405b3615278
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Nov 5, 2020 at 2:19 AM Michael El=
lerman &lt;<a href=3D"mailto:mpe@ellerman.id.au">mpe@ellerman.id.au</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Carl Jacobsen &lt;<a href=3D"mailto:cjacobsen@storix.com=
" target=3D"_blank">cjacobsen@storix.com</a>&gt; writes:<br>
&gt; The panic (on a call to malloc from static linked libcrypto) looks lik=
e<br>
&gt; this:<br><br>
What hardware is this on?<br></blockquote><div><br></div><div>Thank you for=
 looking=C2=A0into this.</div><div><br></div><div>The system that&#39;s pan=
icking identifies like this:<br>=C2=A0 =C2=A0 # uname -a<br>=C2=A0 =C2=A0 L=
inux sl151pwr8 4.12.14-197.18-default #1 SMP Tue Sep 17 14:26:49 UTC 2019<b=
r>=C2=A0 =C2=A0 (d75059b) ppc64le ppc64le ppc64le GNU/Linux<br>=C2=A0 =C2=
=A0 #<br>=C2=A0 =C2=A0 # cat /etc/os-release<br>=C2=A0 =C2=A0 NAME=3D&quot;=
SLES&quot;<br>=C2=A0 =C2=A0 VERSION=3D&quot;15-SP1&quot;<br>=C2=A0 =C2=A0 V=
ERSION_ID=3D&quot;15.1&quot;<br>=C2=A0 =C2=A0 PRETTY_NAME=3D&quot;SUSE Linu=
x Enterprise Server 15 SP1&quot;<br>=C2=A0 =C2=A0 ID=3D&quot;sles&quot;<br>=
=C2=A0 =C2=A0 ID_LIKE=3D&quot;suse&quot;<br>=C2=A0 =C2=A0 ANSI_COLOR=3D&quo=
t;0;32&quot;<br>=C2=A0 =C2=A0 CPE_NAME=3D&quot;cpe:/o:suse:sles:15:sp1&quot=
;<br><br>The system is an LPAR running under PowerVM vios version 2.2.3.4.<=
br>The underlying hardware is machine type-model 8284-22A.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Can you try booting with ppc_tm=3Doff on the kernel command line, and see<b=
r>
if that changes anything?<br></blockquote><div><br></div><div>Yes. Output i=
s down below. Doesn&#39;t appear to change much, but I don&#39;t have</div>=
<div>the background to interpret the registers.</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
Can you put your compiled test program up somewhere we can download it<br>
and look at? Or post the disassembly?<br></blockquote><div><br></div><div>H=
ere&#39;s the source file:<br>=C2=A0 =C2=A0 <a href=3D"https://www.storix.c=
om/download/support/misc/rand_test.c">https://www.storix.com/download/suppo=
rt/misc/rand_test.c</a><br><br>Here&#39;s the resulting executable:<br>=C2=
=A0 =C2=A0 <a href=3D"https://www.storix.com/download/support/misc/rand_tes=
t">https://www.storix.com/download/support/misc/rand_test</a><br></div><div=
><br></div><div>Executable is linked to libcrypto from openssl-1.1.1g, conf=
igured with:<br>=C2=A0 =C2=A0 ./config no-shared no-dso no-threads -fPIC -g=
gdb3 -debug -static<br><br>Executable is built (on SUSE 12) with:<br>=C2=A0=
 =C2=A0 gcc -ggdb3 -o rand_test rand_test.c libcrypto.a<br><br><br>And runn=
ing the executable (on SUSE 15.1) through gdb goes like this:<br><br>=C2=A0=
 =C2=A0 # gdb --args ./rand_test</div><div>=C2=A0 =C2=A0 GNU gdb (GDB; SUSE=
 Linux Enterprise 15) 8.3.1</div><div>=C2=A0 =C2=A0 &lt;&lt; snip intro tex=
t &gt;&gt;</div><div>=C2=A0 =C2=A0 Reading symbols from ./rand_test...<br>=
=C2=A0 =C2=A0 (gdb) b main<br>=C2=A0 =C2=A0 Breakpoint 1 at 0x1000288c: fil=
e rand_test.c, line 6.<br>=C2=A0 =C2=A0 (gdb) r<br>=C2=A0 =C2=A0 Starting p=
rogram: /tmp/ossl/rand_test <br><br>=C2=A0 =C2=A0 Breakpoint 1, main (argc=
=3D1, argv=3D0x7ffffffff798) at rand_test.c:6<br>=C2=A0 =C2=A0 6 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 int has_enough_data =3D RAND_status();<br>=C2=A0 =
=C2=A0 (gdb) s<br>=C2=A0 =C2=A0 RAND_status () at crypto/rand/rand_lib.c:95=
8<br>=C2=A0 =C2=A0 958 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const RAND_METHOD *meth =
=3D RAND_get_rand_method();<br>=C2=A0 =C2=A0 (gdb) <br>=C2=A0 =C2=A0 RAND_g=
et_rand_method () at crypto/rand/rand_lib.c:844<br>=C2=A0 =C2=A0 844 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 const RAND_METHOD *tmp_meth =3D NULL;<br>=C2=A0 =C2=
=A0 (gdb) <br>=C2=A0 =C2=A0 846 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!RUN_ONCE(&=
amp;rand_init, do_rand_init))<br>=C2=A0 =C2=A0 (gdb) <br>=C2=A0 =C2=A0 CRYP=
TO_THREAD_run_once (once=3D0x102a7d88 &lt;rand_init&gt;, <br>	init=3D0x1000=
2f30 &lt;do_rand_init_ossl_&gt;) at crypto/threads_none.c:67<br>=C2=A0 =C2=
=A0 67 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (*once !=3D 0)<br>=C2=A0 =C2=A0=
 (gdb) <br>=C2=A0 =C2=A0 70 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0init();<br>=
=C2=A0 =C2=A0 (gdb) <br>=C2=A0 =C2=A0 do_rand_init_ossl_ () at crypto/rand/=
rand_lib.c:306<br>=C2=A0 =C2=A0 306 =C2=A0 =C2=A0 DEFINE_RUN_ONCE_STATIC(do=
_rand_init)<br>=C2=A0 =C2=A0 (gdb) <br>=C2=A0 =C2=A0 do_rand_init () at cry=
pto/rand/rand_lib.c:309<br>=C2=A0 =C2=A0 309 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ra=
nd_engine_lock =3D CRYPTO_THREAD_lock_new();<br>=C2=A0 =C2=A0 (gdb) <br>=C2=
=A0 =C2=A0 CRYPTO_THREAD_lock_new () at crypto/threads_none.c:24<br>=C2=A0 =
=C2=A0 24 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((lock =3D OPENSSL_zalloc(si=
zeof(unsigned int))) =3D=3D NULL) {<br>=C2=A0 =C2=A0 (gdb) <br>=C2=A0 =C2=
=A0 CRYPTO_zalloc (num=3D4, file=3D0x1023a500 &quot;crypto/threads_none.c&q=
uot;, line=3D24)<br>	at crypto/mem.c:230<br>=C2=A0 =C2=A0 230 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 void *ret =3D CRYPTO_malloc(num, file, line);<br>=C2=A0 =C2=
=A0 (gdb) <br>=C2=A0 =C2=A0 CRYPTO_malloc (num=3D4, file=3D0x1023a500 &quot=
;crypto/threads_none.c&quot;, line=3D24)<br>	at crypto/mem.c:194<br>=C2=A0 =
=C2=A0 194 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *ret =3D NULL;<br>=C2=A0 =C2=A0=
 (gdb) <br>=C2=A0 =C2=A0 197 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (malloc_impl !=
=3D NULL &amp;&amp; malloc_impl !=3D CRYPTO_malloc)<br>=C2=A0 =C2=A0 (gdb) =
<br>=C2=A0 =C2=A0 200 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (num =3D=3D 0)<br>=C2=
=A0 =C2=A0 (gdb) <br>=C2=A0 =C2=A0 204 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (allo=
w_customize) {<br>=C2=A0 =C2=A0 (gdb) <br>=C2=A0 =C2=A0 210 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 allow_customize =3D 0;<br>=C2=A0 =C2=A0 (gdb) <=
br>=C2=A0 =C2=A0 222 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D malloc(num);<br>=
=C2=A0 =C2=A0 (gdb) <br>=C2=A0 =C2=A0 Bad kernel stack pointer 7fffffffef20=
 at 700<br>=C2=A0 =C2=A0 Oops: Bad kernel stack pointer, sig: 6 [#1]<br>=C2=
=A0 =C2=A0 SMP NR_CPUS=3D2048 <br>=C2=A0 =C2=A0 NUMA <br>=C2=A0 =C2=A0 pSer=
ies<br>=C2=A0 =C2=A0 Modules linked in: scsi_transport_iscsi af_packet xt_t=
cpudp ip6t_rpfilter ip6t_REJECT ipt_REJECT xt_conntrack ip_set nfnetlink eb=
table_nat ebtable_broute br_netfilter bridge stp llc ip6table_nat nf_conntr=
ack_ipv6 nf_defrag_ipv6 nf_nat_ipv6 ip6table_mangle ip6table_raw ip6table_s=
ecurity iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_=
conntrack libcrc32c iptable_mangle iptable_raw iptable_security ebtable_fil=
ter ebtables ip6table_filter ip6_tables iptable_filter ip_tables x_tables i=
bmveth(X) vmx_crypto gf128mul crct10dif_vpmsum rtc_generic btrfs xor zstd_d=
ecompress zstd_compress xxhash raid6_pq sr_mod cdrom sd_mod ibmvscsi(X) scs=
i_transport_srp crc32c_vpmsum sg dm_multipath dm_mod scsi_dh_rdac scsi_dh_e=
mc scsi_dh_alua scsi_mod autofs4<br>=C2=A0 =C2=A0 Supported: Yes, External<=
br>=C2=A0 =C2=A0 CPU: 4 PID: 3082 Comm: rand_test Tainted: G =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4.12.14-197.18-default #1 =
SLE15-SP1<br>=C2=A0 =C2=A0 task: c00000002e226100 task.stack: c0000000387c8=
000<br>=C2=A0 =C2=A0 NIP: 0000000000000700 LR: 0000000010004acc CTR: 000000=
0000000000<br>=C2=A0 =C2=A0 REGS: c00000001ebffd40 TRAP: 0300 =C2=A0 Tainte=
d: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
4.12.14-197.18-default)<br>=C2=A0 =C2=A0 MSR: 8000000000001000 &lt;SF,ME&gt=
;<br>=C2=A0 =C2=A0 =C2=A0 CR: 44000844 =C2=A0XER: 20000000<br>=C2=A0 =C2=A0=
 CFAR: 00000000000010f0 DAR: ffffffffffffb27a DSISR: 40000000 SOFTE: 0 <br>=
=C2=A0 =C2=A0 GPR00: 0000000020000000 00007fffffffef20 00000000102af788 fff=
ffffffffffffd <br>=C2=A0 =C2=A0 GPR04: 0000000000000020 0000000000000030 00=
000000102b0760 0000000000000001 <br>=C2=A0 =C2=A0 GPR08: 0000000000000000 0=
0007fffb7dacc00 00000000102b0730 800000010280f033 <br>=C2=A0 =C2=A0 GPR12: =
0000000000004000 00007fffb7ffa100 0000000000000000 0000000000000000 <br>=C2=
=A0 =C2=A0 GPR16: 0000000000000000 0000000000000000 0000000000000000 000000=
0000000000 <br>=C2=A0 =C2=A0 GPR20: 0000000000000000 0000000000000000 00000=
00000000000 0000000000000000 <br>=C2=A0 =C2=A0 GPR24: 0000000000000000 0000=
000000000000 0000000000000000 00007fffb7fef4b8 <br>=C2=A0 =C2=A0 GPR28: 000=
07fffb7ff0000 0000000000000000 0000000000000000 00007fffffffef20 <br>=C2=A0=
 =C2=A0 NIP [0000000000000700] 0x700<br>=C2=A0 =C2=A0 LR [0000000010004acc]=
 0x10004acc<br>=C2=A0 =C2=A0 Call Trace:<br>=C2=A0 =C2=A0 Instruction dump:=
<br>=C2=A0 =C2=A0 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000 00000000 <br>=C2=A0 =C2=A0 00000000 00000000 00000000 00000000 7db243=
a6 7db142a6 f92d0080 7d20e2a6 <br>=C2=A0 =C2=A0 ---[ end trace 167d5d3b2e8a=
06e9 ]---<br><br>=C2=A0 =C2=A0 Sending IPI to other CPUs<br>=C2=A0 =C2=A0 I=
PI complete<br>=C2=A0 =C2=A0 kexec: Starting switchover sequence.<br>=C2=A0=
 =C2=A0 I&#39;m in purgatory<br>=C2=A0 =C2=A0 =C2=A0-&gt; smp_release_cpus(=
)<br>=C2=A0 =C2=A0 spinning_secondaries =3D 0<br>=C2=A0 =C2=A0 =C2=A0&lt;- =
smp_release_cpus()<br>=C2=A0 =C2=A0 Kernel panic - not syncing: Out of memo=
ry and no killable processes...<br><br>=C2=A0 =C2=A0 CPU: 4 PID: 1 Comm: sw=
apper/4 Not tainted 4.12.14-197.18-default #1 SLE15-SP1<br>=C2=A0 =C2=A0 Ca=
ll Trace:<br>=C2=A0 =C2=A0 [c000000012457210] [c000000008a20140] dump_stack=
+0xb0/0xf0 (unreliable)<br>=C2=A0 =C2=A0 [c000000012457250] [c000000008a1cc=
d4] panic+0x144/0x31c<br>=C2=A0 =C2=A0 [c0000000124572e0] [c0000000082efcc0=
] out_of_memory+0x3f0/0x700<br>=C2=A0 =C2=A0 [c000000012457380] [c000000008=
2f7ed4] __alloc_pages_nodemask+0x1004/0x10b0<br>=C2=A0 =C2=A0 [c00000001245=
7570] [c00000000837f4d8] alloc_page_interleave+0x58/0x110<br>=C2=A0 =C2=A0 =
[c0000000124575b0] [c0000000083800bc] alloc_pages_current+0x16c/0x1d0<br>=
=C2=A0 =C2=A0 [c000000012457610] [c0000000082e8398] __page_cache_alloc+0xd8=
/0x150<br>=C2=A0 =C2=A0 [c000000012457650] [c0000000082e8574] pagecache_get=
_page+0x164/0x440<br>=C2=A0 =C2=A0 [c0000000124576b0] [c0000000082e8884] gr=
ab_cache_page_write_begin+0x34/0x70<br>=C2=A0 =C2=A0 [c0000000124576e0] [c0=
0000000840ede8] simple_write_begin+0x48/0x190<br>=C2=A0 =C2=A0 [c0000000124=
57720] [c0000000082e7c7c] generic_perform_write+0xec/0x270<br>=C2=A0 =C2=A0=
 [c0000000124577b0] [c0000000082ea2e0] __generic_file_write_iter+0x250/0x2a=
0<br>=C2=A0 =C2=A0 [c000000012457810] [c0000000082ea53c] generic_file_write=
_iter+0x20c/0x2e0<br>=C2=A0 =C2=A0 [c000000012457850] [c0000000083cc0e0] __=
vfs_write+0x120/0x1e0<br>=C2=A0 =C2=A0 [c0000000124578e0] [c0000000083cdfc8=
] vfs_write+0xd8/0x220<br>=C2=A0 =C2=A0 [c000000012457930] [c0000000083cfee=
c] SyS_write+0x6c/0x110<br>=C2=A0 =C2=A0 [c000000012457980] [c000000008d154=
c4] xwrite+0x54/0xb8<br>=C2=A0 =C2=A0 [c0000000124579c0] [c000000008d15574]=
 do_copy+0x4c/0x17c<br>=C2=A0 =C2=A0 [c0000000124579f0] [c000000008d15140] =
write_buffer+0x64/0x90<br>=C2=A0 =C2=A0 [c000000012457a20] [c000000008d151d=
4] flush_buffer+0x68/0xf4<br>=C2=A0 =C2=A0 [c000000012457a70] [c000000008d6=
2268] unxz+0x210/0x398<br>=C2=A0 =C2=A0 [c000000012457b10] [c000000008d15ef=
c] unpack_to_rootfs+0x1f0/0x360<br>=C2=A0 =C2=A0 [c000000012457bc0] [c00000=
0008d16108] populate_rootfs+0x9c/0x188<br>=C2=A0 =C2=A0 [c000000012457c40] =
[c00000000800f5d4] do_one_initcall+0x64/0x1d0<br>=C2=A0 =C2=A0 [c0000000124=
57d00] [c000000008d14474] kernel_init_freeable+0x294/0x388<br>=C2=A0 =C2=A0=
 [c000000012457dc0] [c00000000801026c] kernel_init+0x2c/0x160<br>=C2=A0 =C2=
=A0 [c000000012457e30] [c00000000800b560] ret_from_kernel_thread+0x5c/0x7c<=
br>=C2=A0 =C2=A0 ------------[ cut here ]------------<br><br><br>Doing the =
same thing but with ppc_tm=3Doff...<br>=C2=A0 =C2=A0 # cat /proc/cmdline <b=
r>=C2=A0 =C2=A0 BOOT_IMAGE=3D/boot/vmlinux-4.12.14-197.18-default root=3DUU=
ID=3D0e795e37-3692-465a-a037-c2935a9fde7a mitigations=3Dauto quiet crashker=
nel=3D197M ppc_tm=3Doff<br><br><br>Results in a panic at the same point, wi=
th a few registers changed:<br><br>=C2=A0 =C2=A0 &lt;&lt; snip down to pani=
c at malloc &gt;&gt;<br>=C2=A0 =C2=A0 (gdb) <br>=C2=A0 =C2=A0 Bad kernel st=
ack pointer 7fffffffef20 at 700<br>=C2=A0 =C2=A0 Oops: Bad kernel stack poi=
nter, sig: 6 [#1]<br>=C2=A0 =C2=A0 SMP NR_CPUS=3D2048 <br>=C2=A0 =C2=A0 NUM=
A <br>=C2=A0 =C2=A0 pSeries<br>=C2=A0 =C2=A0 Modules linked in: scsi_transp=
ort_iscsi af_packet xt_tcpudp ip6t_rpfilter ip6t_REJECT ipt_REJECT xt_connt=
rack ip_set nfnetlink ebtable_nat ebtable_broute br_netfilter bridge stp ll=
c ip6table_nat nf_conntrack_ipv6 nf_defrag_ipv6 nf_nat_ipv6 ip6table_mangle=
 ip6table_raw ip6table_security iptable_nat nf_conntrack_ipv4 nf_defrag_ipv=
4 nf_nat_ipv4 nf_nat nf_conntrack libcrc32c iptable_mangle iptable_raw ipta=
ble_security ebtable_filter ebtables ip6table_filter ip6_tables iptable_fil=
ter ip_tables x_tables ibmveth(X) vmx_crypto gf128mul crct10dif_vpmsum rtc_=
generic btrfs xor zstd_decompress zstd_compress xxhash raid6_pq sr_mod cdro=
m sd_mod ibmvscsi(X) scsi_transport_srp crc32c_vpmsum sg dm_multipath dm_mo=
d scsi_dh_rdac scsi_dh_emc scsi_dh_alua scsi_mod autofs4<br>=C2=A0 =C2=A0 S=
upported: Yes, External<br>=C2=A0 =C2=A0 CPU: 2 PID: 3079 Comm: rand_test T=
ainted: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4.=
12.14-197.18-default #1 SLE15-SP1<br>=C2=A0 =C2=A0 task: c00000002f6bcc00 t=
ask.stack: c0000000321fc000<br>=C2=A0 =C2=A0 NIP: 0000000000000700 LR: 0000=
000010004acc CTR: 0000000000000000<br>=C2=A0 =C2=A0 REGS: c00000001ec17d40 =
TRAP: 0300 =C2=A0 Tainted: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(4.12.14-197.18-default)<br>=C2=A0 =C2=A0 MSR: 8000=
000000001000 &lt;SF,ME&gt;<br>=C2=A0 =C2=A0 =C2=A0 CR: 44000844 =C2=A0XER: =
20000000<br>=C2=A0 =C2=A0 CFAR: 00000000000010f0 DAR: ffffffffffffb27a DSIS=
R: 40000000 SOFTE: 0 <br>=C2=A0 =C2=A0 GPR00: 0000000020000000 00007fffffff=
ef20 00000000102af788 fffffffffffffffd <br>=C2=A0 =C2=A0 GPR04: 00000000000=
00020 0000000000000030 00000000102b0760 0000000000000001 <br>=C2=A0 =C2=A0 =
GPR08: 0000000000000000 00007fffb7dacc00 00000000102b0730 800000000280f033 =
<br>=C2=A0 =C2=A0 GPR12: 0000000000004000 00007fffb7ffa100 0000000000000000=
 0000000000000000 <br>=C2=A0 =C2=A0 GPR16: 0000000000000000 000000000000000=
0 0000000000000000 0000000000000000 <br>=C2=A0 =C2=A0 GPR20: 00000000000000=
00 0000000000000000 0000000000000000 0000000000000000 <br>=C2=A0 =C2=A0 GPR=
24: 0000000000000000 0000000000000000 0000000000000000 00007fffb7fef4b8 <br=
>=C2=A0 =C2=A0 GPR28: 00007fffb7ff0000 0000000000000000 0000000000000000 00=
007fffffffef20 <br>=C2=A0 =C2=A0 NIP [0000000000000700] 0x700<br>=C2=A0 =C2=
=A0 LR [0000000010004acc] 0x10004acc<br>=C2=A0 =C2=A0 Call Trace:<br>=C2=A0=
 =C2=A0 Instruction dump:<br>=C2=A0 =C2=A0 00000000 00000000 00000000 00000=
000 00000000 00000000 00000000 00000000 <br>=C2=A0 =C2=A0 00000000 00000000=
 00000000 00000000 7db243a6 7db142a6 f92d0080 7d20e2a6 <br>=C2=A0 =C2=A0 --=
-[ end trace 436f626dd098548c ]---<br><br>=C2=A0 =C2=A0 Sending IPI to othe=
r CPUs<br>=C2=A0 =C2=A0 IPI complete<br>=C2=A0 =C2=A0 kexec: Starting switc=
hover sequence.<br>=C2=A0 =C2=A0 I&#39;m in purgatory<br>=C2=A0 =C2=A0 =C2=
=A0-&gt; smp_release_cpus()<br>=C2=A0 =C2=A0 spinning_secondaries =3D 0<br>=
=C2=A0 =C2=A0 =C2=A0&lt;- smp_release_cpus()<br>=C2=A0 =C2=A0 Kernel panic =
- not syncing: Out of memory and no killable processes...<br><br>=C2=A0 =C2=
=A0 CPU: 2 PID: 1 Comm: swapper/2 Not tainted 4.12.14-197.18-default #1 SLE=
15-SP1<br>=C2=A0 =C2=A0 Call Trace:<br>=C2=A0 =C2=A0 [c000000012457210] [c0=
00000008a20140] dump_stack+0xb0/0xf0 (unreliable)<br>=C2=A0 =C2=A0 [c000000=
012457250] [c000000008a1ccd4] panic+0x144/0x31c<br>=C2=A0 =C2=A0 [c00000001=
24572e0] [c0000000082efcc0] out_of_memory+0x3f0/0x700<br>=C2=A0 =C2=A0 [c00=
0000012457380] [c0000000082f7ed4] __alloc_pages_nodemask+0x1004/0x10b0<br>=
=C2=A0 =C2=A0 [c000000012457570] [c00000000837f4d8] alloc_page_interleave+0=
x58/0x110<br>=C2=A0 =C2=A0 [c0000000124575b0] [c0000000083800bc] alloc_page=
s_current+0x16c/0x1d0<br>=C2=A0 =C2=A0 [c000000012457610] [c0000000082e8398=
] __page_cache_alloc+0xd8/0x150<br>=C2=A0 =C2=A0 [c000000012457650] [c00000=
00082e8574] pagecache_get_page+0x164/0x440<br>=C2=A0 =C2=A0 [c0000000124576=
b0] [c0000000082e8884] grab_cache_page_write_begin+0x34/0x70<br>=C2=A0 =C2=
=A0 [c0000000124576e0] [c00000000840ede8] simple_write_begin+0x48/0x190<br>=
=C2=A0 =C2=A0 [c000000012457720] [c0000000082e7c7c] generic_perform_write+0=
xec/0x270<br>=C2=A0 =C2=A0 [c0000000124577b0] [c0000000082ea2e0] __generic_=
file_write_iter+0x250/0x2a0<br>=C2=A0 =C2=A0 [c000000012457810] [c000000008=
2ea53c] generic_file_write_iter+0x20c/0x2e0<br>=C2=A0 =C2=A0 [c000000012457=
850] [c0000000083cc0e0] __vfs_write+0x120/0x1e0<br>=C2=A0 =C2=A0 [c00000001=
24578e0] [c0000000083cdfc8] vfs_write+0xd8/0x220<br>=C2=A0 =C2=A0 [c0000000=
12457930] [c0000000083cfeec] SyS_write+0x6c/0x110<br>=C2=A0 =C2=A0 [c000000=
012457980] [c000000008d154c4] xwrite+0x54/0xb8<br>=C2=A0 =C2=A0 [c000000012=
4579c0] [c000000008d15574] do_copy+0x4c/0x17c<br>=C2=A0 =C2=A0 [c0000000124=
579f0] [c000000008d15140] write_buffer+0x64/0x90<br>=C2=A0 =C2=A0 [c0000000=
12457a20] [c000000008d151d4] flush_buffer+0x68/0xf4<br>=C2=A0 =C2=A0 [c0000=
00012457a70] [c000000008d62268] unxz+0x210/0x398<br>=C2=A0 =C2=A0 [c0000000=
12457b10] [c000000008d15efc] unpack_to_rootfs+0x1f0/0x360<br>=C2=A0 =C2=A0 =
[c000000012457bc0] [c000000008d16108] populate_rootfs+0x9c/0x188<br>=C2=A0 =
=C2=A0 [c000000012457c40] [c00000000800f5d4] do_one_initcall+0x64/0x1d0<br>=
=C2=A0 =C2=A0 [c000000012457d00] [c000000008d14474] kernel_init_freeable+0x=
294/0x388<br>=C2=A0 =C2=A0 [c000000012457dc0] [c00000000801026c] kernel_ini=
t+0x2c/0x160<br>=C2=A0 =C2=A0 [c000000012457e30] [c00000000800b560] ret_fro=
m_kernel_thread+0x5c/0x7c<br>=C2=A0 =C2=A0 ------------[ cut here ]--------=
----<br><br><br>Diffing the panic output looks like this (highlighting regi=
ster changes?):<br><br>=C2=A0 =C2=A0 74,75c79,80<br>=C2=A0 =C2=A0 &lt; CPU:=
 4 PID: 3082 Comm: rand_test Tainted: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 4.12.14-197.18-default #1 SLE15-SP1<br>=C2=A0 =
=C2=A0 &lt; task: c00000002e226100 task.stack: c0000000387c8000<br>=C2=A0 =
=C2=A0 ---<br>=C2=A0 =C2=A0 &gt; CPU: 2 PID: 3079 Comm: rand_test Tainted: =
G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4.12.14-19=
7.18-default #1 SLE15-SP1<br>=C2=A0 =C2=A0 &gt; task: c00000002f6bcc00 task=
.stack: c0000000321fc000<br>=C2=A0 =C2=A0 77c82<br>=C2=A0 =C2=A0 &lt; REGS:=
 c00000001ebffd40 TRAP: 0300 =C2=A0 Tainted: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(4.12.14-197.18-default)<br>=C2=A0=
 =C2=A0 ---<br>=C2=A0 =C2=A0 &gt; REGS: c00000001ec17d40 TRAP: 0300 =C2=A0 =
Tainted: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0(4.12.14-197.18-default)<br>=C2=A0 =C2=A0 83c88<br>=C2=A0 =C2=A0 &lt;=
 GPR08: 0000000000000000 00007fffb7dacc00 00000000102b0730 800000010280f033=
 <br>=C2=A0 =C2=A0 ---<br>=C2=A0 =C2=A0 &gt; GPR08: 0000000000000000 00007f=
ffb7dacc00 00000000102b0730 800000000280f033 <br>=C2=A0 =C2=A0 95c100<br>=
=C2=A0 =C2=A0 &lt; ---[ end trace 167d5d3b2e8a06e9 ]---<br>=C2=A0 =C2=A0 --=
-<br>=C2=A0 =C2=A0 &gt; ---[ end trace 436f626dd098548c ]---<br>=C2=A0 =C2=
=A0 106c111<br>=C2=A0 =C2=A0 &lt; CPU: 4 PID: 1 Comm: swapper/4 Not tainted=
 4.12.14-197.18-default #1 SLE15-SP1<br>=C2=A0 =C2=A0 ---<br>=C2=A0 =C2=A0 =
&gt; CPU: 2 PID: 1 Comm: swapper/2 Not tainted 4.12.14-197.18-default #1 SL=
E15-SP1<br>=C2=A0<br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_sig=
nature"><div dir=3D"ltr">Carl Jacobsen<div>Storix, Inc.</div></div></div></=
div>

--0000000000004dac1405b3615278--
