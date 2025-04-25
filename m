Return-Path: <linuxppc-dev+bounces-7985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E57A9CBD6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 16:37:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zkb6C3mq9z2ytV;
	Sat, 26 Apr 2025 00:37:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745591859;
	cv=none; b=UScYTU0JN9zEs03Wld1yXRdxtvmXVw83i4Huib+pNzy5SqDGtI/Xf6tI/VEC2DNt6TEU7BLtoSmbl485v8aKIv8+Ns42Ay1ShHe5+M2ooLymQ4Ad+p6bbOn6EUUaih1MJUXTm42+KIeqx2Ult+lzBt+lmyiJuiWTlgyNsYjIxJhg4H2WvVkhs/VGTx7ecLHR10SoeWyJpxovA/pVENb4SO4C8v4iKu75YahTonS5tTge44qjMq062SSH+8GjSJShs4CWZTzknXWYYXQWhG0xSMCslwDvrJYGwTUTsxM/0ZfniCnPeCPtfaSrNvBQYN/shh6tbCIj0wQaRTbli2+gnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745591859; c=relaxed/relaxed;
	bh=Ujk3/IGYnXx3Wxmgegzw/+bFfTW+UygvpTNGj7Kcyas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=MIJ4sc6sDfCx3sIK81zXzLoZTnlq9v1qhp5RwI7b/gzLBDTZJevTxryn6LpTe17udbGdvzUITB6kfwuwJUnKFUuzn6jtC46B1POevflYSwKoh5SrWawsx4dCgX1/yBKiUDu6Fm6vKfdoyv2NnoBkqX1XT27mHUf4M02i+2FAAk0gh5Hgo0X5w/RIDocSvBWCXLNyIr/S/hCckxAQ1wzcNLpR0vHMtKsi1W2witoASTLZ3R6+86yzFyr8ZLuiPF1staROE/l6A7JkFYgx/xbShUejY3tW8RxLmUtUCUCD+tyRfljpwYAc7lsKIdfT9hMFFeKU35cUrUrcxOmi3EvTsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fHdvbbkR; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DQ9+0aEs; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fHdvbbkR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DQ9+0aEs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zkb695vr1z2yrt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 00:37:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745591852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ujk3/IGYnXx3Wxmgegzw/+bFfTW+UygvpTNGj7Kcyas=;
	b=fHdvbbkRnuAcHV9Ff2u63X4GfbPxUpdnRy9sJTjJLPaT2o7f1t76EuUJ/YGVRS0ccZQ48y
	ABI94Km6CDY2KnVZaZWMMNRHiEEUxRrejFxoKhMzKgm5vLGjX1VvHhSs9/qfgiYgQqobWi
	b5nMGD7FOSrPovktSzpepe2iGYwP4QY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745591853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ujk3/IGYnXx3Wxmgegzw/+bFfTW+UygvpTNGj7Kcyas=;
	b=DQ9+0aEsSIxBAwN0NHKmJTBjMC/QY0VdkWkjo8/gM70eXPFBFeOjZX8qZyvmVZZoUjycP5
	+B4O8pxU7g1aG9+9Pb7qrfakBF5jL4xbcfctTI9SgAR1U3VW/qb2LNJ1URn3B2B6gsH/Kd
	ykoDQhexwvT4XNjZeuoxXPvY/BEzmFc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-giXxFahTMwCNGAcmkwD27A-1; Fri, 25 Apr 2025 10:37:28 -0400
X-MC-Unique: giXxFahTMwCNGAcmkwD27A-1
X-Mimecast-MFC-AGG-ID: giXxFahTMwCNGAcmkwD27A_1745591848
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39ac9b0cb6aso1065377f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 07:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745591847; x=1746196647;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ujk3/IGYnXx3Wxmgegzw/+bFfTW+UygvpTNGj7Kcyas=;
        b=GJo3XkI3S5i9nFiwnIWunNqxwKOkhlV7BD32xcOiWjUMv2QULPcoQi/wTAJaj1quAY
         YEM3vtCl9zkMYefc+gEOVIi3s+T42iOiC1fVehD+Ol8R4KWN+z8sGbLZ+U29aRhNNU00
         DYHDlkHT4CoJZJRH2SWxZSYOjX9r6b9q6eP1MdRVbtmIS3NynRFXnpc/qk1+xygj7D2x
         1Ap9c9RnBJuXZdAMF1eeNK9sYtuEzJ6/QnkZf4c+UGz4FbMevL1NSVkcZunFXuHQSWaC
         5Pfou/vXCbnVkua1/72kRZ65HVzsqM38uhMJSLOJJ0TzPm4xnO02q+lTWrLBpseWpQBu
         cbxw==
X-Forwarded-Encrypted: i=1; AJvYcCUftNHkF9gEj7wlhr1s60jkzb7Shb+2ggsuvYeGj5WYaKybbne5Mt3MUyxItep0MLnrNwrOo0q1Vtviees=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyq2RHFnYKIxTs+8dAdhCOPJ+he54AZ42J8XOmOq2EyjwK8/4hb
	RGF0kvlMzJsRHahvsXNSP5hC8wNhYrXO86E+wDTaWJH8GmnTHMBJap+kQ9gfMM/A9V0CPBBVF0m
	PKEDwDo7jhRNvDoSn/4jWsLX2e+Z7i9MAZpDGYniqfp+5IQIhUZOeDxG+1RGfldo=
X-Gm-Gg: ASbGncu6ymQUmo1A17nnrqo7SWJN+210zcAfRslq6eZDckwlzW+N4VA/UJVmq/vclDD
	5KN2/PgMzf2r9QJC6qSA2ir41/GRjbwfYjNMOn1g/GjkviXuB7V0HjV4ZLoTL0d75nhFopLfemC
	mXZ/YJIgnQKlKC9xk3Rt6QOv0AKTh/8UBCnkVQYwODStHgeLZHJ0lwnqy547pJ3A2WnDAILJzJA
	TLMjuoYFDisuKjzD5Zld4ghdciUzQCBIc38sGXpq26w5oZEPaB9MoPe5B9Y4JK1tBcT2hLq/g3l
	lCLrZH0STpSpDRTEkBPK3pEnag==
X-Received: by 2002:a5d:47ad:0:b0:39e:cbca:8a4b with SMTP id ffacd0b85a97d-3a074e0e1a8mr2130263f8f.6.1745591847600;
        Fri, 25 Apr 2025 07:37:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHQ8vRI/X7PrO43k0DiFqkqa4Uk8XRAM7d2gJ9xafb1xfkOT7jJlK6mrbxxsPSXHf+XLM2Jg==
X-Received: by 2002:a5d:47ad:0:b0:39e:cbca:8a4b with SMTP id ffacd0b85a97d-3a074e0e1a8mr2130242f8f.6.1745591847204;
        Fri, 25 Apr 2025 07:37:27 -0700 (PDT)
Received: from t14ultra (109-81-82-22.rct.o2.cz. [109.81.82.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a530a6e9sm26807935e9.16.2025.04.25.07.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:37:26 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:37:47 +0200
From: Jan Stancek <jstancek@redhat.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 08/19] vdso/gettimeofday: Prepare do_hres_timens() for
 introduction of struct vdso_clock
Message-ID: <aAueO89ng7GX2iyl@t14ultra>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
 <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de>
 <aApGPAoctq_eoE2g@t14ultra>
 <20250424173908-ffca1ea2-e292-4df3-9391-24bfdaab33e7@linutronix.de>
 <CAASaF6xsMOWkhPrzKQWNz5SXaROSpxzFVBz+MOA-MNiEBty7gQ@mail.gmail.com>
 <20250425104552-07539a73-8f56-44d2-97a2-e224c567a2fc@linutronix.de>
 <CAASaF6yxThX3HTHgY_AGqNr7LJ-erdG09WV5-HyfN1fYN9pStQ@mail.gmail.com>
 <20250425152733-0ff10421-b716-4a55-9b60-cb0a71769e56@linutronix.de>
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
In-Reply-To: <20250425152733-0ff10421-b716-4a55-9b60-cb0a71769e56@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h1mZFwoPaYOqessNjqdOB49B6_eI2zCIP-Z-4Y9wvq4_1745591848
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 25, 2025 at 03:40:55PM +0200, Thomas Weiﬂschuh wrote:

<snip>

>
>Some more information:
>
>The crash comes from the address arithmetic in "vc = &vc[CS_RAW]" going wrong.

That appears to be because it's not doing any arithmetic, but using value
from some linker-generated symbol (I'll refer to it as "7a8").

The below is presumably the check that compares clk != CLOCK_MONOTONIC_RAW,
CLOCK_MONOTONIC_RAW is 4. And it should choose between first and second vdso_clock
in 2nd vvar page:

# readelf -a /root/kernel-ark/arch/arm64/kernel/vdso/vdso.so.dbg | grep 7a8
     25: 00000000000007a8     0 NOTYPE  LOCAL  DEFAULT    7 $d

objdump -d -S:
  658:   17ffffef        b       614 <__cvdso_clock_gettime_data.constprop.0+0x104>
                 vc = &vc[CS_HRES_COARSE];
  65c:   58000a62        ldr     x2, 7a8 <__cvdso_clock_gettime_data.constprop.0+0x298>
  660:   7100101f        cmp     w0, #0x4
  664:   10e7cce3        adr     x3, fffffffffffd0000 <vdso_u_data+0x10000>
  668:   9a821063        csel    x3, x3, x2, ne  // ne = any
         while (unlikely((seq = READ_ONCE(vc->seq)) & 1))
  66c:   b9400065        ldr     w5, [x3]
...
  7a8:   fffd00e0        .word   0xfffd00e0
  7ac:   ffffffff        .word   0xffffffff


(gdb) r
Thread 2.1 "a.out" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0xfffff7ff2dc0 (LWP 44638)]
0x0000fffff7fa066c in ?? ()

(gdb) disassemble 0x0000fffff7fa0658,0x0000fffff7fa067c
--Type <RET> for more, q to quit, c to continue without paging--
    0x0000fffff7fa0658:  b       0xfffff7fa0614
    0x0000fffff7fa065c:  ldr     x2, 0xfffff7fa07a8
    0x0000fffff7fa0660:  cmp     w0, #0x4
    0x0000fffff7fa0664:  adr     x3, 0xfffff7f70000
    0x0000fffff7fa0668:  csel    x3, x3, x2, ne  // ne = any
=> 0x0000fffff7fa066c:  ldr     w5, [x3]

$x3 here is using correct vvar runtime address, but $x2 uses
a bogus one from "7a8". And when it tries to load from it, it crashes:

(gdb) info proc map
process 44638
Mapped address spaces:

Start Addr         End Addr           Size               Offset             Perms File
0x0000000000400000 0x0000000000410000 0x10000            0x0                r-xp  /root/ltp/testcases/kernel/syscalls/clock_gettime/a.out
0x0000000000410000 0x0000000000420000 0x10000            0x0                r--p  /root/ltp/testcases/kernel/syscalls/clock_gettime/a.out
0x0000000000420000 0x0000000000430000 0x10000            0x10000            rw-p  /root/ltp/testcases/kernel/syscalls/clock_gettime/a.out
0x0000fffff7d80000 0x0000fffff7f30000 0x1b0000           0x0                r-xp  /usr/lib64/libc.so.6
0x0000fffff7f30000 0x0000fffff7f40000 0x10000            0x1a0000           r--p  /usr/lib64/libc.so.6
0x0000fffff7f40000 0x0000fffff7f50000 0x10000            0x1b0000           rw-p  /usr/lib64/libc.so.6
0x0000fffff7f60000 0x0000fffff7fa0000 0x40000            0x0                r--p  [vvar]
0x0000fffff7fa0000 0x0000fffff7fb0000 0x10000            0x0                r-xp  [vdso]
0x0000fffff7fb0000 0x0000fffff7fe0000 0x30000            0x0                r-xp  /usr/lib/ld-linux-aarch64.so.1
0x0000fffff7fe0000 0x0000fffff7ff0000 0x10000            0x20000            r--p  /usr/lib/ld-linux-aarch64.so.1
0x0000fffff7ff0000 0x0000fffff8000000 0x10000            0x30000            rw-p  /usr/lib/ld-linux-aarch64.so.1
0x0000fffffffd0000 0x0001000000000000 0x30000            0x0                rw-p  [stack]

$x3 was the beginning of 2nd vvar page (1st vdso_clock), and $x2 looks
like it should have been 2nd vdso_clock, but the value that is used is not
the address of vvar during runtime. 

vdso_clock has size 224 == 0xe0 (according to pahole)

(gdb) x/2x 0xfffff7fa07a8
0xfffff7fa07a8: 0xfffd00e0      0xffffffff
(gdb) p/x $x2
$1 = 0xfffffffffffd00e0
(gdb) x/1x $x2
0xfffffffffffd00e0:     Cannot access memory at address 0xfffffffffffd00e0

But it does match the symbol value from vdso.so:

# readelf -a /root/kernel-ark/arch/arm64/kernel/vdso/vdso.so.dbg | grep vdso_u
     37: fffffffffffc0000     0 NOTYPE  LOCAL  DEFAULT    1 vdso_u_data
     39: fffffffffffc0000     0 NOTYPE  LOCAL  DEFAULT  ABS vdso_u_time_data
     40: fffffffffffe0000     0 NOTYPE  LOCAL  DEFAULT  ABS vdso_u_rng_data

>>> print(hex(0xfffffffffffc0000+65536+224))
0xfffffffffffd00e0 -> and this is address where it crashes

Regards,
Jan

>This should just do "vc = vc + 1", advancing the pointer by sizeof(*vc).
>But I get these example values of "vc" before and after the arithmetic:
>0x00ffffbc060000 -> 0xfffffffffffd00e8
>Which is obviously wrong.
>
>The arithmetic can be fixed with any one of the following changes:
>* OPTIMIZER_HIDE_VAR() as above
>* Replacement of -mcmodel=tiny with -mcmode=small in arch/arm64/kernel/vdso/Makefile
>  -mcmodel=tiny is supposed to cover 1MiB programs, the vDSO only needs 300KiB here
>* Removal of the (clk != CLOCK_MONOTONIC_RAW) case
>
>Shuffling code around, even without any impact on semantics, sometimes fixes
>the issue. Compiling the vDSO with UBSAN didn't show anything.
>
>
>Thomas
>
>> > > > > [1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
>> > > > > [2] https://koji.fedoraproject.org/koji/buildinfo?buildID=2704401
>> > > >
>> >
>>
>


