Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E361F3A8E3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 03:21:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4S7j4JKHz306n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 11:21:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HMygLDrr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HMygLDrr; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4S7D1k3Dz2xZL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 11:20:56 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id m2so588418pgk.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 18:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=5YN+M8gn8L/rr2FIb7cskxHPprqhL8AORkwxQVWX7lY=;
 b=HMygLDrr3q1q6IW3VYIc5O2SQ3diAnTZesA+c9JBO+SR6UWD8GCaeREkq9fjJBUZZL
 C/8+n2t3adO8+GYjm87rlHBzhQabIdb3AwauE3qvLOYgHDymbK7PPs/jDhsqHWo8xF8a
 Vtf5dgQd5Zk9ecaOjdhhYkPtVekXYrF7KWz/XfHnzTBhEj+beLzHHFaQTkfq3XxDP57h
 WA6ZJTp4EgK5uTuS7qDUrbhnbrFB6bCzgzLtGthsPupjTb2gnZ6fhvlufRbNLNnfBCRz
 TdR3NOOQGGsngABYrNqy7jMmeQ+4R5ywdGAppm/uSEq5P5/m8wl4uZSmKc4k27/io6bw
 llpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=5YN+M8gn8L/rr2FIb7cskxHPprqhL8AORkwxQVWX7lY=;
 b=TDIODNiYgY4sWta8Syrc2myLz9IMmgX+lkqpoD4V+5Qg8mWwv6+aZgKWFlGX5lNCI+
 u6MT/82YmoGOrsTS5NzISdO1sYdOGiq+vaC+kwYzaM0iR8m6bsDeWB2qJuo7puoSKcxo
 BdkD+ooMWCLfbzpBvk42gL6i+iRL9alUyoEw7HPVCsd/vDgKiwu04pLbmBAcKWKMjm1B
 WmSgIecJNUaBB/O3fujR5yLx7523j4kg7P3YigHxib2JMJXVWq3pWkQA3iclccRyB21G
 PShZRJe+bqBf9aC/Dwb5tGEtA+q3GS7HEz5y4I4GJrXef8hWhIYaTlCsNqdCU/LbWSy7
 KeDw==
X-Gm-Message-State: AOAM531hlt/6LGfbtPDmsB9YnLyWUOh+6XJMTDWQjPThnUipZs8byVwB
 S0gUM3wn08lwJm0sOAOeeKUsnqVs/bk=
X-Google-Smtp-Source: ABdhPJyMzryi81WxUI10aH5NKUiyUeuWKkIZP97RA8fIQNuZx3cjXHsezVBYNi1ifANrg3uv/mrDGQ==
X-Received: by 2002:a65:6543:: with SMTP id a3mr2361968pgw.246.1623806452342; 
 Tue, 15 Jun 2021 18:20:52 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id fs10sm3541055pjb.31.2021.06.15.18.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:20:52 -0700 (PDT)
Date: Wed, 16 Jun 2021 11:20:46 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 11/11] powerpc/64: use interrupt restart table to speed
 up return from interrupt
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20210610130921.706938-1-npiggin@gmail.com>
 <20210610130921.706938-12-npiggin@gmail.com>
 <87bl87tf86.fsf@mpe.ellerman.id.au>
In-Reply-To: <87bl87tf86.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1623806397.npajv1psxa.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of June 15, 2021 11:44 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/featur=
e-fixups.c
>> index fe26f2fa0f3f..fbe94e2d5011 100644
>> --- a/arch/powerpc/lib/feature-fixups.c
>> +++ b/arch/powerpc/lib/feature-fixups.c
>> @@ -412,12 +430,19 @@ void do_entry_flush_fixups(enum l1d_flush_type typ=
es)
>>  	stop_machine(__do_entry_flush_fixups, &types, NULL);
>>  }
>> =20
>> -void do_rfi_flush_fixups(enum l1d_flush_type types)
>> +static int __do_rfi_flush_fixups(void *data)
>>  {
>> +	enum l1d_flush_type types =3D *(enum l1d_flush_type *)data;
>>  	unsigned int instrs[3], *dest;
>>  	long *start, *end;
>>  	int i;
>> =20
>> +	if (types & L1D_FLUSH_FALLBACK)
>> +		rfi_exit_not_reentrant =3D true;
>> +	else
>> +		rfi_exit_not_reentrant =3D false;
>> +	update_interrupt_exit();
>=20
> This is not happy:

Ah, needs a static_key_enable_cpuslocked. I'll fix.

Thanks,
Nick

>=20
> [    0.000000][    T0] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> [    0.000000][    T0] WARNING: possible recursive locking detected
> [    0.000000][    T0] 5.13.0-rc2-00118-gca433a3a44e3 #1 Not tainted
> [    0.000000][    T0] --------------------------------------------
> [    0.000000][    T0] swapper/0 is trying to acquire lock:
> [    0.000000][    T0] c00000000252fa10 (cpu_hotplug_lock){....}-{0:0}, a=
t: static_key_enable+0x24/0x50
> [    0.000000][    T0]
> [    0.000000][    T0] but task is already holding lock:
> [    0.000000][    T0] c00000000252fa10 (cpu_hotplug_lock){....}-{0:0}, a=
t: stop_machine+0x2c/0x60
> [    0.000000][    T0]
> [    0.000000][    T0] other info that might help us debug this:
> [    0.000000][    T0]  Possible unsafe locking scenario:
> [    0.000000][    T0]
> [    0.000000][    T0]        CPU0
> [    0.000000][    T0]        ----
> [    0.000000][    T0]   lock(cpu_hotplug_lock);
> [    0.000000][    T0]   lock(cpu_hotplug_lock);
> [    0.000000][    T0]
> [    0.000000][    T0]  *** DEADLOCK ***
> [    0.000000][    T0]
> [    0.000000][    T0]  May be due to missing lock nesting notation
> [    0.000000][    T0]
> [    0.000000][    T0] 1 lock held by swapper/0:
> [    0.000000][    T0]  #0: c00000000252fa10 (cpu_hotplug_lock){....}-{0:=
0}, at: stop_machine+0x2c/0x60
> [    0.000000][    T0]
> [    0.000000][    T0] stack backtrace:
> [    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.0-rc2=
-00118-gca433a3a44e3 #1
> [    0.000000][    T0] Call Trace:
> [    0.000000][    T0] [c0000000027db8f0] [c00000000093dd28] dump_stack+0=
xec/0x144 (unreliable)
> [    0.000000][    T0] [c0000000027db940] [c0000000001ed5b4] __lock_acqui=
re+0x1744/0x28b0
> [    0.000000][    T0] [c0000000027dba70] [c0000000001ef338] lock_acquire=
+0x128/0x600
> [    0.000000][    T0] [c0000000027dbb70] [c00000000015035c] cpus_read_lo=
ck+0x4c/0x170
> [    0.000000][    T0] [c0000000027dbba0] [c0000000003c2594] static_key_e=
nable+0x24/0x50
> [    0.000000][    T0] [c0000000027dbbd0] [c0000000000ae87c] __do_rfi_flu=
sh_fixups+0x7c/0x300
> [    0.000000][    T0] [c0000000027dbc80] [c0000000002ab7e4] stop_machine=
_cpuslocked+0xe4/0x200
> [    0.000000][    T0] [c0000000027dbcf0] [c0000000002ab940] stop_machine=
+0x40/0x60
> [    0.000000][    T0] [c0000000027dbd30] [c0000000000aef30] do_rfi_flush=
_fixups+0x30/0x50
> [    0.000000][    T0] [c0000000027dbd60] [c000000000040890] setup_rfi_fl=
ush+0xa0/0x140
> [    0.000000][    T0] [c0000000027dbdd0] [c00000000201c6c4] pnv_setup_ar=
ch+0x304/0x4ac
> [    0.000000][    T0] [c0000000027dbe60] [c00000000200a31c] setup_arch+0=
x374/0x3c4
> [    0.000000][    T0] [c0000000027dbee0] [c000000002003d08] start_kernel=
+0xb0/0x790
> [    0.000000][    T0] [c0000000027dbf90] [c00000000000d79c] start_here_c=
ommon+0x1c/0x600
> [    0.000000][    T0] rfi-flush: patched 12 locations (fallback displace=
ment flush)
>=20
>=20
> cheers
>=20
