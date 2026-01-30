Return-Path: <linuxppc-dev+bounces-16428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL4/J9dufGk/MgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 09:41:59 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 201F4B8855
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 09:41:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2TyW3q8mz2xpg;
	Fri, 30 Jan 2026 19:41:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::434" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769762515;
	cv=pass; b=KRm7HPfUU8zpHzxyisikQPOKqVUGmYhGHMzhdXo6G8yPcFCs3edOboJjxYQjRQNb5vRtz+JApWs+PAknA45Jn9+EfAGjlSehi7RsphNJNpzxoukWCGTDANb6rYgU4FEIoI1ub8lyF4Ws/gWjqhoTFeekXmQaGU+ryJ54m2uRUGziSojPLY+Y40bwVFlheX5KIrKIXEI2T3aKfTxdaL1xmAueCxB2+vgHVH4nvKgCUr/Y74aUjSjcQsM53/7sKhjf5DrFNncHxO6xwrrXiShy8QNJ8eok1gWmNDBoNn9mSnzA6mXy5JaFMBWxZVIMGoyzjUPnnpYhRVhRIE5ds2pzag==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769762515; c=relaxed/relaxed;
	bh=BV56aEy4iEWipVsvCNdGxXEd9oZgJvo/UWWOEB4PbTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AMQPM8VveLyYVwmjn85BmYc8wSRxLvmSfY2OM6wN8xkJZinNLZen8Vj2q2X8xQ5WipBOKMI2+HcKn4VusZz1P27oqCY/ixgHx2yTybCUZgSV4ubyqvyXplcUgSAqMl88G26LzzoBRCGGEJlNte6eaND4/LewAJdR7maUzOwN7RzBZv3dAaij98x2uxBydw2xMOFim5rCKeA+cH8tPHqce2IMmahE8OLBzAcTi6j2H2Rb94ZQ4wx40R3kENCacYV7zU1DwVhlUEr3gidvZnudqd3C91hT5J71Vg+CfMtTQHL64BBfl7Ls6OpRhC5c6Fz6mxyscY/Tzbmv6yB/NtsVDg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=iFCloK65; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=davidgow@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=iFCloK65;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=davidgow@google.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2TyT3kCJz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 19:41:53 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so1561621f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 00:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769762509; cv=none;
        d=google.com; s=arc-20240605;
        b=R47U/3hJASEQJb+F+MnRpivhy0d8NmCtg7AK38conzUiftdT/sBiGY0WhaqFOqgeK/
         8EQg7rWZPCjeT57iQ2AwE4+MjuaWxQ7THuoI+HRUKy+qwGvnH1OIToOVZyzu09R7Wzqg
         Zf3H4LSQGW6rVjJ5KAwiYQWm40XxDn/JmvbHe6Fge76zxE0wc0WZdF41ioDluo+eKUKL
         v8wroqWEuwRYP8C7EFjMYKrX2KeHMLCTihHOS7KOyMgw/m0QJZa2/Grr+eTG108Jdu+A
         +QYxxbLyVcSU9KkEhay7l+MiHLdcG7zzDYEgbsMmlAyoGFPOmpXRJ0Oplrrn3z7JhJhJ
         Q0gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BV56aEy4iEWipVsvCNdGxXEd9oZgJvo/UWWOEB4PbTQ=;
        fh=rrLqjN1yUFUbSrGsCEuu0RJu2bS3h5R60G2LMLerASE=;
        b=Go1T4XRk18iIgRlx8Glvoi60o4oyFEY0k9tH8TcZSl4uJ7lGz6VinrctvBasctQ1tY
         mfCEPHaZIs0DJ0zBGgYMftDHguJwDeMwht465NT2PIoguhMdgHcClIKgR60lsFqOgICd
         pdJAc+yfOu/OJI38f+ba/siUFr9qoxwgP4L+1iBbU2ol132RqqJCgB/NYZASj+9QI0dq
         3gA/Po0UOnQan7nVF9UlQmWJVKksrwAiSt6IYQK0o2UpwD3qJiMy3IJsN2842wFGIUth
         LgZFdElHxvzxYEmEZ0815S77u2f8XGGGgNvWA4IKUPNcO+m7E/+Gao334VgKErbszprv
         /lbQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769762509; x=1770367309; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BV56aEy4iEWipVsvCNdGxXEd9oZgJvo/UWWOEB4PbTQ=;
        b=iFCloK65cc58fqbLsbQG5LVnivxMBoJvSny/WRAYZfkAuwgMIEpTmBkByToAfJbmmK
         NfJwywx4l66owEABvt7+bXVcnOLhoPi2Cv1MuX+yHCDEEy07SxzyFoeTRqONyNeOjn0B
         QGY4JPmXD/fZ9+hGErcotkfXH0cBGMEDlwMWUvwJ0utuoUkX+/5EhbGgoAKYB2d0B/Ot
         Gj1gM8QqguMDO1p4XwtJBiGfgMaVqbFPo59B1Jm3qqUhAGEiwyjwEnl/FJ71aSM6BpXy
         KNaFhJTg/gbgWGb4ZUlRQfvbUvH3yLYf0vm1ow4X+VtB32iz6wcOICBuDi5FIE4IQXaK
         nLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769762509; x=1770367309;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BV56aEy4iEWipVsvCNdGxXEd9oZgJvo/UWWOEB4PbTQ=;
        b=UQPDWQiNxgl1DnO724hny6uXfzgInkAbuykvBoIUZhPxkrMg2g1IyPni6BNbph3QE9
         QIoL3IZ7FTMkqItWMjAU59y5iVnMkWDtHAbX0WwqxOVgIflfzpyQo2PWa5a+Yrmk2+EV
         teVfWmzbxyaY3at/Lw2g+/qMuxDuDo47R9fnPEkPTupQkTvEdv8zNQiGkGgBF7eqXvmr
         S0SV8RSlCrmUPTS+j8JnxV6WfkGxuyozncrAB2OK5adFwHoGfFlU/PDdyX8hWbWblmYf
         pwzy5Pfve4WTfrep8tFziqMeMPMcG2SLQObSFW/UFLRtZrFCUOmJbSea3EdZe+wPPl2Z
         pmOA==
X-Forwarded-Encrypted: i=1; AJvYcCULFHwIv+bKSY05w9pj8owt4p0EW6W7HQyeCuDpj2MrC9/N/rlDGEFrMKdD4ubhT7Z/8V0pR5UpUuPVVyM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzU/3OZ6VEZ50vx2ReA0OcZoFrXZbqlzD6sSc5ncKm4RY2UlmrQ
	qd3oSEUL7ZCavgWcfk65b6N94HkVR3lygrcCejAjcysMNsmuYmiEviHuP90d1vwP/xbDfNI3vIy
	cRHipt1srZB5IPSncFphbJQWgj/+e13W4B+TbU3C1
X-Gm-Gg: AZuq6aID1QRjZe9yp5ZeSBhLS/3SxSmISybz9xPQjsMbG4g4k5UpaIc0GPpxY192qiD
	GUwRTx/D9hfUGPyjbW2FQS7QNm8Z5vCw/QMb/WeDyWOChhk4TW/HW0BwYM20g+1lsI5MsK6Lsqw
	ugOgujMaUE/2J4hPuhiOlwcnLkyOS7YgI/NEgzVkVXbyl3/Nsr+U9N2TRsOIUWl0WDCPW1sDXGr
	NeWp18SwIWTzf00YQW52cHhxYGHkm4jslfRmcdQ3oTWx9tPFAhiCD92ddM6Q6wc3VSkNg==
X-Received: by 2002:a05:6000:4007:b0:435:a2f8:1515 with SMTP id
 ffacd0b85a97d-435f3a62efamr3285444f8f.10.1769762508484; Fri, 30 Jan 2026
 00:41:48 -0800 (PST)
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
Precedence: list
MIME-Version: 1.0
References: <20260123073916.956498-1-mkchauras@linux.ibm.com>
In-Reply-To: <20260123073916.956498-1-mkchauras@linux.ibm.com>
From: David Gow <davidgow@google.com>
Date: Fri, 30 Jan 2026 16:41:36 +0800
X-Gm-Features: AZwV_QhyRvW1YTL7t6hK5HsBTRNnJfnMIpMe6PWoXpn4YBgsHcUOCZVRIGxOSCA
Message-ID: <CABVgOSkkS5vU0AJ-8xZgdebjdaPjBnVDBA2rUSzBmkxjRVMQww@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] Generic IRQ entry/exit support for powerpc
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ryabinin.a.a@gmail.com, glider@google.com, 
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com, 
	oleg@redhat.com, kees@kernel.org, luto@amacapital.net, wad@chromium.org, 
	mchauras@linux.ibm.com, thuth@redhat.com, ruanjinjie@huawei.com, 
	sshegde@linux.ibm.com, akpm@linux-foundation.org, charlie@rivosinc.com, 
	deller@gmx.de, ldv@strace.io, macro@orcam.me.uk, segher@kernel.crashing.org, 
	peterz@infradead.org, bigeasy@linutronix.de, namcao@linutronix.de, 
	tglx@linutronix.de, mark.barnett@arm.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000b1670e064996f1be"
X-Spam-Status: No, score=-15.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.81 / 15.00];
	SIGNED_SMIME(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16428-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mkchauras@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:oleg@redhat.com,m:kees@kernel.org,m:luto@amacapital.net,m:wad@chromium.org,m:mchauras@linux.ibm.com,m:thuth@redhat.com,m:ruanjinjie@huawei.com,m:sshegde@linux.ibm.com,m:akpm@linux-foundation.org,m:charlie@rivosinc.com,m:deller@gmx.de,m:ldv@strace.io,m:macro@orcam.me.uk,m:segher@kernel.crashing.org,m:peterz@infradead.org,m:bigeasy@linutronix.de,m:namcao@linutronix.de,m:tglx@linutronix.de,m:mark.barnett@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[davidgow@google.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidgow@google.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,google.com,arm.com,redhat.com,amacapital.net,chromium.org,huawei.com,linux-foundation.org,rivosinc.com,gmx.de,strace.io,orcam.me.uk,kernel.crashing.org,infradead.org,linutronix.de,lists.ozlabs.org,vger.kernel.org,googlegroups.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,googlegroups.com:email]
X-Rspamd-Queue-Id: 201F4B8855
X-Rspamd-Action: no action

--000000000000b1670e064996f1be
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Jan 2026 at 15:39, Mukesh Kumar Chaurasiya
<mkchauras@linux.ibm.com> wrote:
>
> Adding support for the generic irq entry/exit handling for PowerPC. The
> goal is to bring PowerPC in line with other architectures that already
> use the common irq entry infrastructure, reducing duplicated code and
> making it easier to share future changes in entry/exit paths.
>
> This is slightly tested of ppc64le and ppc32.
>
> The performance benchmarks are below:
>
> perf bench syscall usec/op (-ve is improvement)
>
> | Syscall | Base        | test        | change % |
> | ------- | ----------- | ----------- | -------- |
> | basic   | 0.093543    | 0.093023    | -0.56    |
> | execve  | 446.557781  | 450.107172  | +0.79    |
> | fork    | 1142.204391 | 1156.377214 | +1.24    |
> | getpgid | 0.097666    | 0.092677    | -5.11    |
>
> perf bench syscall ops/sec (+ve is improvement)
>
> | Syscall | Base     | New      | change % |
> | ------- | -------- | -------- | -------- |
> | basic   | 10690548 | 10750140 | +0.56    |
> | execve  | 2239     | 2221     | -0.80    |
> | fork    | 875      | 864      | -1.26    |
> | getpgid | 10239026 | 10790324 | +5.38    |
>
>
> IPI latency benchmark (-ve is improvement)
>
> | Metric         | Base (ns)     | New (ns)      | % Change |
> | -------------- | ------------- | ------------- | -------- |
> | Dry run        | 583136.56     | 584136.35     | 0.17%    |
> | Self IPI       | 4167393.42    | 4149093.90    | -0.44%   |
> | Normal IPI     | 61769347.82   | 61753728.39   | -0.03%   |
> | Broadcast IPI  | 2235584825.02 | 2227521401.45 | -0.36%   |
> | Broadcast lock | 2164964433.31 | 2125658641.76 | -1.82%   |
>
>
> Thats very close to performance earlier with arch specific handling.
>
> Tests done:
>  - Build and boot on ppc64le pseries.
>  - Build and boot on ppc64le powernv8 powernv9 powernv10.
>  - Build and boot on ppc32.
>  - Performance benchmark done with perf syscall basic on pseries.
>

Passes the irq_test_cases KUnit suite on (qemu) powerpc(64),
powerpcle, and powerpc32 targets.

./tools/testing/kunit/kunit.py run --arch powerpc  irq_test_cases
./tools/testing/kunit/kunit.py run --arch powerpcle  irq_test_cases
./tools/testing/kunit/kunit.py run --arch powerpc32  irq_test_cases

Tested-by: David Gow <davidgow@google.com>

Cheers,
-- David

> Changelog:
> V3 -> V4
>  - Fixed the issue in older gcc version where linker couldn't find
>    mem functions
>  - Merged IRQ enable and syscall enable into a single patch
>  - Cleanup for unused functions done in separate patch.
>  - Some other cosmetic changes
> V3: https://lore.kernel.org/all/20251229045416.3193779-1-mkchauras@linux.ibm.com/
>
> V2 -> V3
>  - #ifdef CONFIG_GENERIC_IRQ_ENTRY removed from unnecessary places
>  - Some functions made __always_inline
>  - pt_regs padding changed to match 16byte interrupt stack alignment
>  - And some cosmetic changes from reviews from earlier patch
> V2: https://lore.kernel.org/all/20251214130245.43664-1-mkchauras@linux.ibm.com/
>
> V1 -> V2
>  - Fix an issue where context tracking was showing warnings for
>    incorrect context
> V1: https://lore.kernel.org/all/20251102115358.1744304-1-mkchauras@linux.ibm.com/
>
> RFC -> PATCH V1
>  - Fix for ppc32 spitting out kuap lock warnings.
>  - ppc64le powernv8 crash fix.
>  - Review comments incorporated from previous RFC.
> RFC https://lore.kernel.org/all/20250908210235.137300-2-mchauras@linux.ibm.com/
>
> Mukesh Kumar Chaurasiya (8):
>   powerpc: rename arch_irq_disabled_regs
>   powerpc: Prepare to build with generic entry/exit framework
>   powerpc: introduce arch_enter_from_user_mode
>   powerpc: Introduce syscall exit arch functions
>   powerpc: add exit_flags field in pt_regs
>   powerpc: Prepare for IRQ entry exit
>   powerpc: Enable GENERIC_ENTRY feature
>   powerpc: Remove unused functions
>
>  arch/powerpc/Kconfig                    |   1 +
>  arch/powerpc/include/asm/entry-common.h | 533 ++++++++++++++++++++++++
>  arch/powerpc/include/asm/hw_irq.h       |   4 +-
>  arch/powerpc/include/asm/interrupt.h    | 386 +++--------------
>  arch/powerpc/include/asm/kasan.h        |  15 +-
>  arch/powerpc/include/asm/ptrace.h       |   6 +-
>  arch/powerpc/include/asm/signal.h       |   1 -
>  arch/powerpc/include/asm/stacktrace.h   |   6 +
>  arch/powerpc/include/asm/syscall.h      |   5 +
>  arch/powerpc/include/asm/thread_info.h  |   1 +
>  arch/powerpc/include/uapi/asm/ptrace.h  |  14 +-
>  arch/powerpc/kernel/interrupt.c         | 254 ++---------
>  arch/powerpc/kernel/ptrace/ptrace.c     | 142 +------
>  arch/powerpc/kernel/signal.c            |  25 +-
>  arch/powerpc/kernel/syscall.c           | 119 +-----
>  arch/powerpc/kernel/traps.c             |   2 +-
>  arch/powerpc/kernel/watchdog.c          |   2 +-
>  arch/powerpc/perf/core-book3s.c         |   2 +-
>  18 files changed, 690 insertions(+), 828 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/entry-common.h
>
> --
> 2.52.0
>
> --
> You received this message because you are subscribed to the Google Groups "kasan-dev" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kasan-dev+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/kasan-dev/20260123073916.956498-1-mkchauras%40linux.ibm.com.

--000000000000b1670e064996f1be
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
Dxz3AgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFHZtY3XkWtC2
e2Idfk+0JyK7BLzzMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBo
hqjbVaHxZoT6HHUuwQcTlbgXpuVi59bQPrSwb/6Pn1t3h3SLeuUCvOYpoQjxlWy/FexsPW+nWS0I
PUmWpt6sxbIRTKPfb7cPk32XezfnA0jexucybiXzkZKTrbI7zoMOzDIWpTKYZAonB9Zzi7Dso4An
ZOtz/E3yhdR/q1MK30d5fiCS0vorEd0Oy8Jzcc7TJ2HGMzEEXiFFvVrJYJHvfYOeXE4ywAG6YWO0
x78+bXeB9vkeWHhOYKyYXuAXrnHASddEICg1QlJCHDAISMC1Wn/tjqTMTt3sDAe+dhi9V1FEGTbG
g9PxPVP4huJEMIBu/MWNMzHfiW4E7eCHVPrmtX7CFDlMik7qsgQBbO5h6EcxBamhIflfMgoISsRJ
Vyll2E5BNVwkNstMgU3WMg5yIaQcuGFgFnMTrQcaLEEFPV3cCP9pgXovYDirnB7FKNdCZNHfeBY1
HEXJ2jIPDP6nWSbYoRry0TvPgxh5ZeM5+sc1L7kY75C8U4FV3t4qdC+p7rgqfAggdvDPa5BJbTRg
KAzwyf3z7XUrYp38pXybmDnsEcRNBIOEqBXoiBxZXaKQqaY921nWAroMM/6I6CVpTnu6JEeQkoi4
IgGIEaTFPcgAjvpDQ8waLJL84EP6rbLW6dop+97BXbeO9L/fFf40kBhve6IggpJSeU9RdCQ5czGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAYQLf/BIzLow9kWqD8My
PzANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgODfHES73TzkasZ+vqr8fZhjjS9Xr
ecEGJcMV1nyHrD8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYw
MTMwMDg0MTQ5WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAKFxxTWR2iRbVXKjUTI1DMX6nOIJMi7NXfIfqiwLsGkQhPl9TMhC/z6LqxFZ0JBBp
NvwLlLPWExKdpU8x1d7CFv1IU5PexMxyXDjKXrMJK9wL727lWdEln77mVy/duQpMPXxTQeG70fTZ
c/BJSLZIIOSuON9kEoZUrLdGyNoHPXEM1UL7YBGG5krObWvfnc1fNPnEUbJKLG2msH6NhOAcDEkr
yQOxkInfnGBpZpMyYca0gmKW0+DCozT09iwGfo6YhaoznnC5AlRPoTg5EwuTAhAYIuT8SDuV89qu
JL1Q+jmz0heXMSYdLeqbKlP2mXTtQf69z6aixCXzw18eWIGRgA==
--000000000000b1670e064996f1be--

