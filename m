Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA312AA4E2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 13:05:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSwv16VjzzDrS5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 23:05:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=storix.com (client-ip=2607:f8b0:4864:20::d2c;
 helo=mail-io1-xd2c.google.com; envelope-from=cjacobsen@storix.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=storix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=storix-com.20150623.gappssmtp.com
 header.i=@storix-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ntDMgo2T; dkim-atps=neutral
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSq6C4Vj9zDrQ2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 18:44:48 +1100 (AEDT)
Received: by mail-io1-xd2c.google.com with SMTP id k21so3878104ioa.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 23:44:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=storix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mSODE6vONku0qlwDpUARupHOmjqNv2L4jAn1Cf+HNdI=;
 b=ntDMgo2TnMGfD2PdbqxboBtMOyGvc1UvrCGTmKMTGU6ms9eWmh8Wn6XPbjR5gDmhXr
 C0yN6EPdRl74Y6E4Bdv0jAo0hC8mhbCO+i6oQD9nqVu3KstWn8BtWiYAgvzpPsDLbtSA
 Oyn7h9ANo1PaOyuZ4BYmgGZQlMiNwWGFeA1UDswX/d25f8e0Bjuq9P81rZ4kQR48etZ2
 MlnPTMzD3Doo+uk+wJBLzKB1PdQ1kiGUmg+G54WpxCYVjhDvDdf9XVLifZVPJfVmg03I
 zZXDeobPsz1h5Yh5kRhT9l6efwMyWRQJpZbFaR6y8npjswc3U6uobkuUoTRZeEitoOv2
 P6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mSODE6vONku0qlwDpUARupHOmjqNv2L4jAn1Cf+HNdI=;
 b=lxQTohK3jnaWpgFqrtvhnhu/X0BeFMpTtfUYE7qaY2b/RhYCAMEv5PyyX8lKnqZKqn
 sjrnkUnwgUHBWi1gA0MD+4vSoHLXBwRPm+dqHN1zYNHvw7UfUuR9kWS0Bft68V8Djypd
 JSXnUBCRg4fY9cErP0a0uxBarOb4LVl/3shuQLklsG1hQevA2785c3XpFXgn+PmqRZtn
 mnmCqhewPTQgU4VBnyjtmmExsMgqBiRIXdjnXSjHZ5RMdbVV8YgFzarOZ5pZMYKBXh57
 1R2oakuI99SWQczCW8RmfCzqTZS6wIwTGEJgSPWV9WPm575xZowYyGA0u1GXvJSZdPxy
 fgGA==
X-Gm-Message-State: AOAM531oNCjNeqmSZo6+WsFCOxKMvXWKSRENsa2EkNJEox2s7rJaT0DG
 0rTS/nWF7FxHLTiliqThe/doRupXjJDVDLwxTAnCcg0NUTlNKWjE
X-Google-Smtp-Source: ABdhPJyo68YyHx0vGYQrXs/AAyoO+AY2V1PhOD0r/mvWH41MP4TrPHJAvL2El86HWtHnNx7tVC0pAeoBtznWKS+x8RU=
X-Received: by 2002:a05:6638:1022:: with SMTP id
 n2mr4773486jan.105.1604735083713; 
 Fri, 06 Nov 2020 23:44:43 -0800 (PST)
MIME-Version: 1.0
References: <CAKkwB_S6Bs_+5At2aajbQbJg==WE_4NLdhSK=Bj+td67215Htg@mail.gmail.com>
 <878sbjuqe6.fsf@mpe.ellerman.id.au>
 <CAKkwB_RD0_=9SSwyYn-8Vo2dr2Li4X-v_KJ4qBWZRgxZuGUeRw@mail.gmail.com>
 <87lffgt8b9.fsf@mpe.ellerman.id.au>
 <CAKkwB_TQJ=tg17SJd_s2SSXA7F3MeHmzjMC8f2uiV7yGvsLufg@mail.gmail.com>
 <875z6iu0xp.fsf@mpe.ellerman.id.au>
In-Reply-To: <875z6iu0xp.fsf@mpe.ellerman.id.au>
From: Carl Jacobsen <cjacobsen@storix.com>
Date: Fri, 6 Nov 2020 23:44:32 -0800
Message-ID: <CAKkwB_TbpU1uEJs=FY1Emm4LhLq91FBQYXGg=OLgnEwqsdxqjA@mail.gmail.com>
Subject: Re: Kernel panic from malloc() on SUSE 15.1?
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: multipart/alternative; boundary="0000000000009fa99d05b37f80ab"
X-Mailman-Approved-At: Sat, 07 Nov 2020 22:58:33 +1100
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

--0000000000009fa99d05b37f80ab
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 6, 2020 at 4:25 AM Michael Ellerman <mpe@ellerman.id.au> wrote:

> So something seems to have gone wrong linking this, I see eg:
>
> 0000000010004a8c <syscall_random>:
>     10004a8c:   2b 10 40 3c     lis     r2,4139
>     10004a90:   88 f7 42 38     addi    r2,r2,-2168
>     10004a94:   a6 02 08 7c     mflr    r0
>     10004a98:   10 00 01 f8     std     r0,16(r1)
>     10004a9c:   f8 ff e1 fb     std     r31,-8(r1)
>     10004aa0:   81 ff 21 f8     stdu    r1,-128(r1)
>     10004aa4:   78 0b 3f 7c     mr      r31,r1
>     10004aa8:   60 00 7f f8     std     r3,96(r31)
>     10004aac:   68 00 9f f8     std     r4,104(r31)
>     10004ab0:   00 00 00 60     nop
>     10004ab4:   30 80 22 e9     ld      r9,-32720(r2)
>     10004ab8:   00 00 a9 2f     cmpdi   cr7,r9,0
>     10004abc:   30 00 9e 41     beq     cr7,10004aec <syscall_random+0x60>
>     10004ac0:   60 00 7f e8     ld      r3,96(r31)
>     10004ac4:   68 00 9f e8     ld      r4,104(r31)
>     10004ac8:   39 b5 ff 4b     bl      10000000 <_init-0x1f00>
>
> Notice that last bl (branch and link) to 0x10000000. But there's no text
> at 0x10000000, that's the start of the page which happens to be the ELF
> magic.
>
> I've seen something like this before, but I can't remember when/where so
> I haven't been able to track down what the problem was.
>
> Anyway hopefully someone on the list will know.
>
> That still doesn't explain the kernel crash though.
>

Interesting. Sounds highly unlikely that the linker would have picked
that address at random, but it makes no sense. And, agreed, jumping
into junk should crash the program, not the kernel.


> On my machine it doesn't crash the kernel, so I can catch it later. For
> me it's here:
> ....

ie. in the syscall_random() that I mentioned above.
>
> You should be able to catch it there too if you do:
>
> (gdb) b *0x10000000
> (gdb) r
>
> Hopefully it will stop without crashing the kernel, and then a `bt` will
> show that you're in the same place as me.
>
> If you can get that to work, when you're stopped there, can you do an
> `info registers` and send us the output.
>

Indeed, setting the breakpoint you suggested works, and the stack looks
almost the same - only differences are a few bits off in main's argv
pointer, rand_drbg_get_entropy's pout pointer, and the final address - you
get 0x0000000010000004, I get 0x0000000010000000. Output, including "info
registers", below. Hoping they provide some useful clues. Thanks again for
looking into this.

# gdb --args /tmp/ossl/rand_test
...
(gdb) b *0x10000000
Breakpoint 1 at 0x10000000
(gdb) r
Starting program: /tmp/ossl/rand_test

Breakpoint 1, 0x0000000010000000 in ?? ()
(gdb) bt
#0  0x0000000010000000 in ?? ()
#1  0x0000000010004acc in syscall_random (buf=0x102b0730, buflen=32) at
crypto/rand/rand_unix.c:371
#2  0x00000000100053fc in rand_pool_acquire_entropy (pool=0x102b06e0) at
crypto/rand/rand_unix.c:636
#3  0x0000000010002b58 in rand_drbg_get_entropy (drbg=0x102b02e0,
pout=0x7fffffffecf0, entropy=256, min_len=32,
    max_len=2147483647, prediction_resistance=0) at
crypto/rand/rand_lib.c:198
#4  0x000000001001ed9c in RAND_DRBG_instantiate (drbg=0x102b02e0,
    pers=0x10248d00 <ossl_pers_string> "OpenSSL NIST SP 800-90A DRBG",
perslen=28) at crypto/rand/drbg_lib.c:338
#5  0x0000000010020300 in drbg_setup (parent=0x0) at
crypto/rand/drbg_lib.c:895
#6  0x0000000010020414 in do_rand_drbg_init () at crypto/rand/drbg_lib.c:924
#7  0x000000001002034c in do_rand_drbg_init_ossl_ () at
crypto/rand/drbg_lib.c:909
#8  0x0000000010005d1c in CRYPTO_THREAD_run_once (once=0x102ab4d8
<rand_drbg_init>,
    init=0x1002032c <do_rand_drbg_init_ossl_>) at crypto/threads_none.c:70
#9  0x00000000100209c4 in RAND_DRBG_get0_master () at
crypto/rand/drbg_lib.c:1102
#10 0x0000000010020914 in drbg_status () at crypto/rand/drbg_lib.c:1084
#11 0x0000000010004a58 in RAND_status () at crypto/rand/rand_lib.c:961
#12 0x0000000010002890 in main (argc=1, argv=0x7ffffffff368) at
rand_test.c:6
(gdb) info registers
r0             0x100053fc          268456956
r1             0x7fffffffeaf0      140737488349936
r2             0x102af788          271251336
r3             0x102b0730          271255344
r4             0x20                32
r5             0x30                48
r6             0x102b0760          271255392
r7             0x1                 1
r8             0x0                 0
r9             0x7fffb7dacc00      140736277957632
r10            0x102b0730          271255344
r11            0x10                16
r12            0x7fffb7e19280      140736278401664
r13            0x7fffb7ffa100      140736280371456
r14            0x0                 0
r15            0x0                 0
r16            0x0                 0
r17            0x0                 0
r18            0x0                 0
r19            0x0                 0
r20            0x0                 0
r21            0x0                 0
r22            0x0                 0
r23            0x0                 0
r24            0x0                 0
r25            0x0                 0
r26            0x0                 0
r27            0x7fffb7fef4b8      140736280327352
r28            0x7fffb7ff0000      140736280330240
r29            0x0                 0
r30            0x0                 0
r31            0x7fffffffeaf0      140737488349936
pc             0x10000000          0x10000000
msr            0x800000010002d033  9223372041149927475
cr             0x44000844          1140852804
lr             0x10004acc          0x10004acc <syscall_random+64>
ctr            0x0                 0
xer            0x20000000          536870912
fpscr          0x0                 0
vscr           0x0                 0
vrsave         0xffffffff          -1
ppr            0xc000000000000     3377699720527872
dscr           0x0                 0
tar            0x0                 0
bescr          <unavailable>
ebbhr          <unavailable>
ebbrr          <unavailable>
mmcr0          0x0                 0
mmcr2          0x0                 0
siar           0x0                 0
sdar           0x0                 0
sier           0x0                 0
tfhar          0x0                 0
texasr         0x0                 0
tfiar          0x0                 0
cr0            <unavailable>
cr1            <unavailable>
cr2            <unavailable>
cr3            <unavailable>
cr4            <unavailable>
cr5            <unavailable>
cr6            <unavailable>
cr7            <unavailable>
cr8            <unavailable>
cr9            <unavailable>
cr10           <unavailable>
cr11           <unavailable>
cr12           <unavailable>
cr13           <unavailable>
cr14           <unavailable>
cr15           <unavailable>
cr16           <unavailable>
cr17           <unavailable>
cr18           <unavailable>
cr19           <unavailable>
cr20           <unavailable>
cr21           <unavailable>
cr22           <unavailable>
cr23           <unavailable>
cr24           <unavailable>
cr25           <unavailable>
cr26           <unavailable>
cr27           <unavailable>
cr28           <unavailable>
cr29           <unavailable>
cr30           <unavailable>
cr31           <unavailable>
ccr            <unavailable>
cxer           <unavailable>
clr            <unavailable>
cctr           <unavailable>
cfpscr         <unavailable>
cvscr          <unavailable>
cvrsave        <unavailable>
cppr           <unavailable>
cdscr          <unavailable>
ctar           <unavailable>
orig_r3        0x10004ac8          268454600
trap           0x700               1792
(gdb)

-- 
Carl Jacobsen
Storix, Inc.

--0000000000009fa99d05b37f80ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+T24gRnJpLCBOb3YgNiwgMjAyMCBhdCA0OjI1
IEFNIE1pY2hhZWwgRWxsZXJtYW4gJmx0OzxhIGhyZWY9Im1haWx0bzptcGVAZWxsZXJtYW4uaWQu
YXUiPm1wZUBlbGxlcm1hbi5pZC5hdTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48ZGl2IGNsYXNz
PSJnbWFpbF9xdW90ZSI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFy
Z2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwy
MDQpO3BhZGRpbmctbGVmdDoxZXgiPlNvIHNvbWV0aGluZyBzZWVtcyB0byBoYXZlIGdvbmUgd3Jv
bmcgbGlua2luZyB0aGlzLCBJIHNlZSBlZzo8YnI+DQo8YnI+DQowMDAwMDAwMDEwMDA0YThjICZs
dDtzeXNjYWxsX3JhbmRvbSZndDs6PGJyPg0KwqAgwqAgMTAwMDRhOGM6wqAgwqAyYiAxMCA0MCAz
Y8KgIMKgIMKgbGlzwqAgwqAgwqByMiw0MTM5PGJyPg0KwqAgwqAgMTAwMDRhOTA6wqAgwqA4OCBm
NyA0MiAzOMKgIMKgIMKgYWRkacKgIMKgIHIyLHIyLC0yMTY4PGJyPg0KwqAgwqAgMTAwMDRhOTQ6
wqAgwqBhNiAwMiAwOCA3Y8KgIMKgIMKgbWZscsKgIMKgIHIwPGJyPg0KwqAgwqAgMTAwMDRhOTg6
wqAgwqAxMCAwMCAwMSBmOMKgIMKgIMKgc3RkwqAgwqAgwqByMCwxNihyMSk8YnI+DQrCoCDCoCAx
MDAwNGE5YzrCoCDCoGY4IGZmIGUxIGZiwqAgwqAgwqBzdGTCoCDCoCDCoHIzMSwtOChyMSk8YnI+
DQrCoCDCoCAxMDAwNGFhMDrCoCDCoDgxIGZmIDIxIGY4wqAgwqAgwqBzdGR1wqAgwqAgcjEsLTEy
OChyMSk8YnI+DQrCoCDCoCAxMDAwNGFhNDrCoCDCoDc4IDBiIDNmIDdjwqAgwqAgwqBtcsKgIMKg
IMKgIHIzMSxyMTxicj4NCsKgIMKgIDEwMDA0YWE4OsKgIMKgNjAgMDAgN2YgZjjCoCDCoCDCoHN0
ZMKgIMKgIMKgcjMsOTYocjMxKTxicj4NCsKgIMKgIDEwMDA0YWFjOsKgIMKgNjggMDAgOWYgZjjC
oCDCoCDCoHN0ZMKgIMKgIMKgcjQsMTA0KHIzMSk8YnI+DQrCoCDCoCAxMDAwNGFiMDrCoCDCoDAw
IDAwIDAwIDYwwqAgwqAgwqBub3A8YnI+DQrCoCDCoCAxMDAwNGFiNDrCoCDCoDMwIDgwIDIyIGU5
wqAgwqAgwqBsZMKgIMKgIMKgIHI5LC0zMjcyMChyMik8YnI+DQrCoCDCoCAxMDAwNGFiODrCoCDC
oDAwIDAwIGE5IDJmwqAgwqAgwqBjbXBkacKgIMKgY3I3LHI5LDA8YnI+DQrCoCDCoCAxMDAwNGFi
YzrCoCDCoDMwIDAwIDllIDQxwqAgwqAgwqBiZXHCoCDCoCDCoGNyNywxMDAwNGFlYyAmbHQ7c3lz
Y2FsbF9yYW5kb20rMHg2MCZndDs8YnI+DQrCoCDCoCAxMDAwNGFjMDrCoCDCoDYwIDAwIDdmIGU4
wqAgwqAgwqBsZMKgIMKgIMKgIHIzLDk2KHIzMSk8YnI+DQrCoCDCoCAxMDAwNGFjNDrCoCDCoDY4
IDAwIDlmIGU4wqAgwqAgwqBsZMKgIMKgIMKgIHI0LDEwNChyMzEpPGJyPg0KwqAgwqAgMTAwMDRh
Yzg6wqAgwqAzOSBiNSBmZiA0YsKgIMKgIMKgYmzCoCDCoCDCoCAxMDAwMDAwMCAmbHQ7X2luaXQt
MHgxZjAwJmd0Ozxicj4NCjxicj4NCk5vdGljZSB0aGF0IGxhc3QgYmwgKGJyYW5jaCBhbmQgbGlu
aykgdG8gMHgxMDAwMDAwMC4gQnV0IHRoZXJlJiMzOTtzIG5vIHRleHQ8YnI+DQphdCAweDEwMDAw
MDAwLCB0aGF0JiMzOTtzIHRoZSBzdGFydCBvZiB0aGUgcGFnZSB3aGljaCBoYXBwZW5zIHRvIGJl
IHRoZSBFTEY8YnI+DQptYWdpYy48YnI+DQo8YnI+DQpJJiMzOTt2ZSBzZWVuIHNvbWV0aGluZyBs
aWtlIHRoaXMgYmVmb3JlLCBidXQgSSBjYW4mIzM5O3QgcmVtZW1iZXIgd2hlbi93aGVyZSBzbzxi
cj4NCkkgaGF2ZW4mIzM5O3QgYmVlbiBhYmxlIHRvIHRyYWNrIGRvd24gd2hhdCB0aGUgcHJvYmxl
bSB3YXMuPGJyPg0KPGJyPg0KQW55d2F5IGhvcGVmdWxseSBzb21lb25lIG9uIHRoZSBsaXN0IHdp
bGwga25vdy48YnI+DQo8YnI+DQpUaGF0IHN0aWxsIGRvZXNuJiMzOTt0IGV4cGxhaW4gdGhlIGtl
cm5lbCBjcmFzaCB0aG91Z2guPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxicj48L2Rpdj5JbnRlcmVz
dGluZy4gU291bmRzIGhpZ2hseSB1bmxpa2VseSB0aGF0IHRoZSBsaW5rZXIgd291bGQgaGF2ZSBw
aWNrZWQ8YnI+dGhhdCBhZGRyZXNzIGF0IHJhbmRvbSwgYnV0IGl0IG1ha2VzIG5vIHNlbnNlLiBB
bmQsIGFncmVlZCwganVtcGluZzxicj5pbnRvIGp1bmsgc2hvdWxkIGNyYXNoIHRoZSBwcm9ncmFt
LCBub3QgdGhlIGtlcm5lbC48YnI+PGRpdj7CoDwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHgg
c29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5PbiBteSBtYWNoaW5lIGl0
IGRvZXNuJiMzOTt0IGNyYXNoIHRoZSBrZXJuZWwsIHNvIEkgY2FuIGNhdGNoIGl0IGxhdGVyLiBG
b3I8YnI+DQptZSBpdCYjMzk7cyBoZXJlOjxicj4uLi4uPC9ibG9ja3F1b3RlPjxibG9ja3F1b3Rl
IGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3Jk
ZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCmll
LiBpbiB0aGUgc3lzY2FsbF9yYW5kb20oKSB0aGF0IEkgbWVudGlvbmVkIGFib3ZlLjxicj4NCjxi
cj4NCllvdSBzaG91bGQgYmUgYWJsZSB0byBjYXRjaCBpdCB0aGVyZSB0b28gaWYgeW91IGRvOjxi
cj4NCjxicj4NCihnZGIpIGIgKjB4MTAwMDAwMDA8YnI+DQooZ2RiKSByPGJyPg0KPGJyPg0KSG9w
ZWZ1bGx5IGl0IHdpbGwgc3RvcCB3aXRob3V0IGNyYXNoaW5nIHRoZSBrZXJuZWwsIGFuZCB0aGVu
IGEgYGJ0YCB3aWxsPGJyPg0Kc2hvdyB0aGF0IHlvdSYjMzk7cmUgaW4gdGhlIHNhbWUgcGxhY2Ug
YXMgbWUuPGJyPg0KPGJyPg0KSWYgeW91IGNhbiBnZXQgdGhhdCB0byB3b3JrLCB3aGVuIHlvdSYj
Mzk7cmUgc3RvcHBlZCB0aGVyZSwgY2FuIHlvdSBkbyBhbjxicj4NCmBpbmZvIHJlZ2lzdGVyc2Ag
YW5kIHNlbmQgdXMgdGhlIG91dHB1dC48YnI+PC9ibG9ja3F1b3RlPjwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+SW5kZWVkLCBzZXR0aW5nIHRoZSBicmVha3BvaW50IHlvdSBzdWdnZXN0ZWQgd29y
a3MsIGFuZCB0aGUgc3RhY2sgbG9va3MgYWxtb3N0IHRoZSBzYW1lIC0gb25seSBkaWZmZXJlbmNl
cyBhcmUgYSBmZXcgYml0cyBvZmYgaW4gbWFpbiYjMzk7cyBhcmd2IHBvaW50ZXIsIHJhbmRfZHJi
Z19nZXRfZW50cm9weSYjMzk7cyBwb3V0IHBvaW50ZXIsIGFuZCB0aGUgZmluYWwgYWRkcmVzcyAt
IHlvdSBnZXQgMHgwMDAwMDAwMDEwMDAwMDA0LCBJIGdldCAweDAwMDAwMDAwMTAwMDAwMDAuIE91
dHB1dCwgaW5jbHVkaW5nICZxdW90O2luZm8gcmVnaXN0ZXJzJnF1b3Q7LCBiZWxvdy4gSG9waW5n
IHRoZXkgcHJvdmlkZSBzb21lIHVzZWZ1bCBjbHVlcy4gVGhhbmtzIGFnYWluIGZvciBsb29raW5n
IGludG8gdGhpcy48YnI+PGJyPiMgZ2RiIC0tYXJncyAvdG1wL29zc2wvcmFuZF90ZXN0PGJyPi4u
Ljxicj4oZ2RiKSBiICoweDEwMDAwMDAwPGJyPkJyZWFrcG9pbnQgMSBhdCAweDEwMDAwMDAwPGJy
PihnZGIpIHI8YnI+U3RhcnRpbmcgcHJvZ3JhbTogL3RtcC9vc3NsL3JhbmRfdGVzdCA8YnI+PGJy
PkJyZWFrcG9pbnQgMSwgMHgwMDAwMDAwMDEwMDAwMDAwIGluID8/ICgpPGJyPihnZGIpIGJ0PGJy
PiMwIMKgMHgwMDAwMDAwMDEwMDAwMDAwIGluID8/ICgpPGJyPiMxIMKgMHgwMDAwMDAwMDEwMDA0
YWNjIGluIHN5c2NhbGxfcmFuZG9tIChidWY9MHgxMDJiMDczMCwgYnVmbGVuPTMyKSBhdCBjcnlw
dG8vcmFuZC9yYW5kX3VuaXguYzozNzE8YnI+IzIgwqAweDAwMDAwMDAwMTAwMDUzZmMgaW4gcmFu
ZF9wb29sX2FjcXVpcmVfZW50cm9weSAocG9vbD0weDEwMmIwNmUwKSBhdCBjcnlwdG8vcmFuZC9y
YW5kX3VuaXguYzo2MzY8YnI+IzMgwqAweDAwMDAwMDAwMTAwMDJiNTggaW4gcmFuZF9kcmJnX2dl
dF9lbnRyb3B5IChkcmJnPTB4MTAyYjAyZTAsIHBvdXQ9MHg3ZmZmZmZmZmVjZjAsIGVudHJvcHk9
MjU2LCBtaW5fbGVuPTMyLCA8YnI+wqAgwqAgbWF4X2xlbj0yMTQ3NDgzNjQ3LCBwcmVkaWN0aW9u
X3Jlc2lzdGFuY2U9MCkgYXQgY3J5cHRvL3JhbmQvcmFuZF9saWIuYzoxOTg8YnI+IzQgwqAweDAw
MDAwMDAwMTAwMWVkOWMgaW4gUkFORF9EUkJHX2luc3RhbnRpYXRlIChkcmJnPTB4MTAyYjAyZTAs
IDxicj7CoCDCoCBwZXJzPTB4MTAyNDhkMDAgJmx0O29zc2xfcGVyc19zdHJpbmcmZ3Q7ICZxdW90
O09wZW5TU0wgTklTVCBTUCA4MDAtOTBBIERSQkcmcXVvdDssIHBlcnNsZW49MjgpIGF0IGNyeXB0
by9yYW5kL2RyYmdfbGliLmM6MzM4PGJyPiM1IMKgMHgwMDAwMDAwMDEwMDIwMzAwIGluIGRyYmdf
c2V0dXAgKHBhcmVudD0weDApIGF0IGNyeXB0by9yYW5kL2RyYmdfbGliLmM6ODk1PGJyPiM2IMKg
MHgwMDAwMDAwMDEwMDIwNDE0IGluIGRvX3JhbmRfZHJiZ19pbml0ICgpIGF0IGNyeXB0by9yYW5k
L2RyYmdfbGliLmM6OTI0PGJyPiM3IMKgMHgwMDAwMDAwMDEwMDIwMzRjIGluIGRvX3JhbmRfZHJi
Z19pbml0X29zc2xfICgpIGF0IGNyeXB0by9yYW5kL2RyYmdfbGliLmM6OTA5PGJyPiM4IMKgMHgw
MDAwMDAwMDEwMDA1ZDFjIGluIENSWVBUT19USFJFQURfcnVuX29uY2UgKG9uY2U9MHgxMDJhYjRk
OCAmbHQ7cmFuZF9kcmJnX2luaXQmZ3Q7LCA8YnI+wqAgwqAgaW5pdD0weDEwMDIwMzJjICZsdDtk
b19yYW5kX2RyYmdfaW5pdF9vc3NsXyZndDspIGF0IGNyeXB0by90aHJlYWRzX25vbmUuYzo3MDxi
cj4jOSDCoDB4MDAwMDAwMDAxMDAyMDljNCBpbiBSQU5EX0RSQkdfZ2V0MF9tYXN0ZXIgKCkgYXQg
Y3J5cHRvL3JhbmQvZHJiZ19saWIuYzoxMTAyPGJyPiMxMCAweDAwMDAwMDAwMTAwMjA5MTQgaW4g
ZHJiZ19zdGF0dXMgKCkgYXQgY3J5cHRvL3JhbmQvZHJiZ19saWIuYzoxMDg0PGJyPiMxMSAweDAw
MDAwMDAwMTAwMDRhNTggaW4gUkFORF9zdGF0dXMgKCkgYXQgY3J5cHRvL3JhbmQvcmFuZF9saWIu
Yzo5NjE8YnI+IzEyIDB4MDAwMDAwMDAxMDAwMjg5MCBpbiBtYWluIChhcmdjPTEsIGFyZ3Y9MHg3
ZmZmZmZmZmYzNjgpIGF0IHJhbmRfdGVzdC5jOjY8YnI+KGdkYikgaW5mbyByZWdpc3RlcnM8YnI+
cjAgwqAgwqAgwqAgwqAgwqAgwqAgMHgxMDAwNTNmYyDCoCDCoCDCoCDCoCDCoDI2ODQ1Njk1Njxi
cj5yMSDCoCDCoCDCoCDCoCDCoCDCoCAweDdmZmZmZmZmZWFmMCDCoCDCoCDCoDE0MDczNzQ4ODM0
OTkzNjxicj5yMiDCoCDCoCDCoCDCoCDCoCDCoCAweDEwMmFmNzg4IMKgIMKgIMKgIMKgIMKgMjcx
MjUxMzM2PGJyPnIzIMKgIMKgIMKgIMKgIMKgIMKgIDB4MTAyYjA3MzAgwqAgwqAgwqAgwqAgwqAy
NzEyNTUzNDQ8YnI+cjQgwqAgwqAgwqAgwqAgwqAgwqAgMHgyMCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoDMyPGJyPnI1IMKgIMKgIMKgIMKgIMKgIMKgIDB4MzAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqA0ODxicj5yNiDCoCDCoCDCoCDCoCDCoCDCoCAweDEwMmIwNzYwIMKgIMKgIMKgIMKgIMKgMjcx
MjU1MzkyPGJyPnI3IMKgIMKgIMKgIMKgIMKgIMKgIDB4MSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAxPGJyPnI4IMKgIMKgIMKgIMKgIMKgIMKgIDB4MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAw
PGJyPnI5IMKgIMKgIMKgIMKgIMKgIMKgIDB4N2ZmZmI3ZGFjYzAwIMKgIMKgIMKgMTQwNzM2Mjc3
OTU3NjMyPGJyPnIxMCDCoCDCoCDCoCDCoCDCoCDCoDB4MTAyYjA3MzAgwqAgwqAgwqAgwqAgwqAy
NzEyNTUzNDQ8YnI+cjExIMKgIMKgIMKgIMKgIMKgIMKgMHgxMCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoDE2PGJyPnIxMiDCoCDCoCDCoCDCoCDCoCDCoDB4N2ZmZmI3ZTE5MjgwIMKgIMKgIMKgMTQw
NzM2Mjc4NDAxNjY0PGJyPnIxMyDCoCDCoCDCoCDCoCDCoCDCoDB4N2ZmZmI3ZmZhMTAwIMKgIMKg
IMKgMTQwNzM2MjgwMzcxNDU2PGJyPnIxNCDCoCDCoCDCoCDCoCDCoCDCoDB4MCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAwPGJyPnIxNSDCoCDCoCDCoCDCoCDCoCDCoDB4MCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAwPGJyPnIxNiDCoCDCoCDCoCDCoCDCoCDCoDB4MCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAwPGJyPnIxNyDCoCDCoCDCoCDCoCDCoCDCoDB4MCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAwPGJyPnIxOCDCoCDCoCDCoCDCoCDCoCDCoDB4MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAwPGJyPnIxOSDCoCDCoCDCoCDCoCDCoCDCoDB4MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAw
PGJyPnIyMCDCoCDCoCDCoCDCoCDCoCDCoDB4MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwPGJy
PnIyMSDCoCDCoCDCoCDCoCDCoCDCoDB4MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwPGJyPnIy
MiDCoCDCoCDCoCDCoCDCoCDCoDB4MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwPGJyPnIyMyDC
oCDCoCDCoCDCoCDCoCDCoDB4MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwPGJyPnIyNCDCoCDC
oCDCoCDCoCDCoCDCoDB4MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwPGJyPnIyNSDCoCDCoCDC
oCDCoCDCoCDCoDB4MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwPGJyPnIyNiDCoCDCoCDCoCDC
oCDCoCDCoDB4MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwPGJyPnIyNyDCoCDCoCDCoCDCoCDC
oCDCoDB4N2ZmZmI3ZmVmNGI4IMKgIMKgIMKgMTQwNzM2MjgwMzI3MzUyPGJyPnIyOCDCoCDCoCDC
oCDCoCDCoCDCoDB4N2ZmZmI3ZmYwMDAwIMKgIMKgIMKgMTQwNzM2MjgwMzMwMjQwPGJyPnIyOSDC
oCDCoCDCoCDCoCDCoCDCoDB4MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwPGJyPnIzMCDCoCDC
oCDCoCDCoCDCoCDCoDB4MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwPGJyPnIzMSDCoCDCoCDC
oCDCoCDCoCDCoDB4N2ZmZmZmZmZlYWYwIMKgIMKgIMKgMTQwNzM3NDg4MzQ5OTM2PGJyPnBjIMKg
IMKgIMKgIMKgIMKgIMKgIDB4MTAwMDAwMDAgwqAgwqAgwqAgwqAgwqAweDEwMDAwMDAwPGJyPm1z
ciDCoCDCoCDCoCDCoCDCoCDCoDB4ODAwMDAwMDEwMDAyZDAzMyDCoDkyMjMzNzIwNDExNDk5Mjc0
NzU8YnI+Y3IgwqAgwqAgwqAgwqAgwqAgwqAgMHg0NDAwMDg0NCDCoCDCoCDCoCDCoCDCoDExNDA4
NTI4MDQ8YnI+bHIgwqAgwqAgwqAgwqAgwqAgwqAgMHgxMDAwNGFjYyDCoCDCoCDCoCDCoCDCoDB4
MTAwMDRhY2MgJmx0O3N5c2NhbGxfcmFuZG9tKzY0Jmd0Ozxicj5jdHIgwqAgwqAgwqAgwqAgwqAg
wqAweDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMDxicj54ZXIgwqAgwqAgwqAgwqAgwqAgwqAw
eDIwMDAwMDAwIMKgIMKgIMKgIMKgIMKgNTM2ODcwOTEyPGJyPmZwc2NyIMKgIMKgIMKgIMKgIMKg
MHgwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDA8YnI+dnNjciDCoCDCoCDCoCDCoCDCoCAweDAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMDxicj52cnNhdmUgwqAgwqAgwqAgwqAgMHhmZmZmZmZm
ZiDCoCDCoCDCoCDCoCDCoC0xPGJyPnBwciDCoCDCoCDCoCDCoCDCoCDCoDB4YzAwMDAwMDAwMDAw
MCDCoCDCoCAzMzc3Njk5NzIwNTI3ODcyPGJyPmRzY3IgwqAgwqAgwqAgwqAgwqAgMHgwIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIDA8YnI+dGFyIMKgIMKgIMKgIMKgIMKgIMKgMHgwIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIDA8YnI+YmVzY3IgwqAgwqAgwqAgwqAgwqAmbHQ7dW5hdmFpbGFibGUm
Z3Q7PGJyPmViYmhyIMKgIMKgIMKgIMKgIMKgJmx0O3VuYXZhaWxhYmxlJmd0Ozxicj5lYmJyciDC
oCDCoCDCoCDCoCDCoCZsdDt1bmF2YWlsYWJsZSZndDs8YnI+bW1jcjAgwqAgwqAgwqAgwqAgwqAw
eDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMDxicj5tbWNyMiDCoCDCoCDCoCDCoCDCoDB4MCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAwPGJyPnNpYXIgwqAgwqAgwqAgwqAgwqAgMHgwIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIDA8YnI+c2RhciDCoCDCoCDCoCDCoCDCoCAweDAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgMDxicj5zaWVyIMKgIMKgIMKgIMKgIMKgIDB4MCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAwPGJyPnRmaGFyIMKgIMKgIMKgIMKgIMKgMHgwIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIDA8YnI+dGV4YXNyIMKgIMKgIMKgIMKgIDB4MCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAwPGJyPnRmaWFyIMKgIMKgIMKgIMKgIMKgMHgwIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDA8
YnI+Y3IwIMKgIMKgIMKgIMKgIMKgIMKgJmx0O3VuYXZhaWxhYmxlJmd0Ozxicj5jcjEgwqAgwqAg
wqAgwqAgwqAgwqAmbHQ7dW5hdmFpbGFibGUmZ3Q7PGJyPmNyMiDCoCDCoCDCoCDCoCDCoCDCoCZs
dDt1bmF2YWlsYWJsZSZndDs8YnI+Y3IzIMKgIMKgIMKgIMKgIMKgIMKgJmx0O3VuYXZhaWxhYmxl
Jmd0Ozxicj5jcjQgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7dW5hdmFpbGFibGUmZ3Q7PGJyPmNyNSDC
oCDCoCDCoCDCoCDCoCDCoCZsdDt1bmF2YWlsYWJsZSZndDs8YnI+Y3I2IMKgIMKgIMKgIMKgIMKg
IMKgJmx0O3VuYXZhaWxhYmxlJmd0Ozxicj5jcjcgwqAgwqAgwqAgwqAgwqAgwqAmbHQ7dW5hdmFp
bGFibGUmZ3Q7PGJyPmNyOCDCoCDCoCDCoCDCoCDCoCDCoCZsdDt1bmF2YWlsYWJsZSZndDs8YnI+
Y3I5IMKgIMKgIMKgIMKgIMKgIMKgJmx0O3VuYXZhaWxhYmxlJmd0Ozxicj5jcjEwIMKgIMKgIMKg
IMKgIMKgICZsdDt1bmF2YWlsYWJsZSZndDs8YnI+Y3IxMSDCoCDCoCDCoCDCoCDCoCAmbHQ7dW5h
dmFpbGFibGUmZ3Q7PGJyPmNyMTIgwqAgwqAgwqAgwqAgwqAgJmx0O3VuYXZhaWxhYmxlJmd0Ozxi
cj5jcjEzIMKgIMKgIMKgIMKgIMKgICZsdDt1bmF2YWlsYWJsZSZndDs8YnI+Y3IxNCDCoCDCoCDC
oCDCoCDCoCAmbHQ7dW5hdmFpbGFibGUmZ3Q7PGJyPmNyMTUgwqAgwqAgwqAgwqAgwqAgJmx0O3Vu
YXZhaWxhYmxlJmd0Ozxicj5jcjE2IMKgIMKgIMKgIMKgIMKgICZsdDt1bmF2YWlsYWJsZSZndDs8
YnI+Y3IxNyDCoCDCoCDCoCDCoCDCoCAmbHQ7dW5hdmFpbGFibGUmZ3Q7PGJyPmNyMTggwqAgwqAg
wqAgwqAgwqAgJmx0O3VuYXZhaWxhYmxlJmd0Ozxicj5jcjE5IMKgIMKgIMKgIMKgIMKgICZsdDt1
bmF2YWlsYWJsZSZndDs8YnI+Y3IyMCDCoCDCoCDCoCDCoCDCoCAmbHQ7dW5hdmFpbGFibGUmZ3Q7
PGJyPmNyMjEgwqAgwqAgwqAgwqAgwqAgJmx0O3VuYXZhaWxhYmxlJmd0Ozxicj5jcjIyIMKgIMKg
IMKgIMKgIMKgICZsdDt1bmF2YWlsYWJsZSZndDs8YnI+Y3IyMyDCoCDCoCDCoCDCoCDCoCAmbHQ7
dW5hdmFpbGFibGUmZ3Q7PGJyPmNyMjQgwqAgwqAgwqAgwqAgwqAgJmx0O3VuYXZhaWxhYmxlJmd0
Ozxicj5jcjI1IMKgIMKgIMKgIMKgIMKgICZsdDt1bmF2YWlsYWJsZSZndDs8YnI+Y3IyNiDCoCDC
oCDCoCDCoCDCoCAmbHQ7dW5hdmFpbGFibGUmZ3Q7PGJyPmNyMjcgwqAgwqAgwqAgwqAgwqAgJmx0
O3VuYXZhaWxhYmxlJmd0Ozxicj5jcjI4IMKgIMKgIMKgIMKgIMKgICZsdDt1bmF2YWlsYWJsZSZn
dDs8YnI+Y3IyOSDCoCDCoCDCoCDCoCDCoCAmbHQ7dW5hdmFpbGFibGUmZ3Q7PGJyPmNyMzAgwqAg
wqAgwqAgwqAgwqAgJmx0O3VuYXZhaWxhYmxlJmd0Ozxicj5jcjMxIMKgIMKgIMKgIMKgIMKgICZs
dDt1bmF2YWlsYWJsZSZndDs8YnI+Y2NyIMKgIMKgIMKgIMKgIMKgIMKgJmx0O3VuYXZhaWxhYmxl
Jmd0Ozxicj5jeGVyIMKgIMKgIMKgIMKgIMKgICZsdDt1bmF2YWlsYWJsZSZndDs8YnI+Y2xyIMKg
IMKgIMKgIMKgIMKgIMKgJmx0O3VuYXZhaWxhYmxlJmd0Ozxicj5jY3RyIMKgIMKgIMKgIMKgIMKg
ICZsdDt1bmF2YWlsYWJsZSZndDs8YnI+Y2Zwc2NyIMKgIMKgIMKgIMKgICZsdDt1bmF2YWlsYWJs
ZSZndDs8YnI+Y3ZzY3IgwqAgwqAgwqAgwqAgwqAmbHQ7dW5hdmFpbGFibGUmZ3Q7PGJyPmN2cnNh
dmUgwqAgwqAgwqAgwqAmbHQ7dW5hdmFpbGFibGUmZ3Q7PGJyPmNwcHIgwqAgwqAgwqAgwqAgwqAg
Jmx0O3VuYXZhaWxhYmxlJmd0Ozxicj5jZHNjciDCoCDCoCDCoCDCoCDCoCZsdDt1bmF2YWlsYWJs
ZSZndDs8YnI+Y3RhciDCoCDCoCDCoCDCoCDCoCAmbHQ7dW5hdmFpbGFibGUmZ3Q7PGJyPm9yaWdf
cjMgwqAgwqAgwqAgwqAweDEwMDA0YWM4IMKgIMKgIMKgIMKgIMKgMjY4NDU0NjAwPGJyPnRyYXAg
wqAgwqAgwqAgwqAgwqAgMHg3MDAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMTc5Mjxicj4oZ2RiKcKg
PC9kaXY+PGRpdj48YnI+PC9kaXY+LS0gPGJyPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9z
aWduYXR1cmUiPjxkaXYgZGlyPSJsdHIiPkNhcmwgSmFjb2JzZW48ZGl2PlN0b3JpeCwgSW5jLjwv
ZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pg0K
--0000000000009fa99d05b37f80ab--
