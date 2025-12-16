Return-Path: <linuxppc-dev+bounces-14787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E83CDCC1266
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 07:41:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVnQs206Qz2yDk;
	Tue, 16 Dec 2025 17:41:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765867317;
	cv=none; b=BB6zeyJOXYYgTcrYLKMi7R4yAmc724oRkp3xIMwIEKJ1mSV9LgaPdx5SrPrGj2/sHqSDcSBONku7LFUCv6T+I/7Phi/DzBZ0OUe6hG+BkOWpN+QyQyq3j0di7+7gf7cFcFCzd0t2w2vyoJ6pXzI4nJxbJT3jvf+71aMNWbhvm3B1lQmZCmx8T6igfdwMH37jy/89tpwluGzGyIexUyBxfFvzE5lXpHXcr+JPcvcGhf8bDj2Rfr/hE8L8YHT84BZqW6EPnKvhaBRDhndZ0JxxCFvLgAULzoB+A+kJ2KY6vSebOH3QrJpHRRrcr+UWzhB+1G5TY0W257bQuqA24T1WLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765867317; c=relaxed/relaxed;
	bh=AVT2lXRyHglpvmfs/HlrGh5glhDS3Eo6Gmv/sk0rCyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EpOAaagDi7Crn4DhMz4EMpS/VsnfAZqer4IWPWESIQTJLEUP7gT+eVpyUoY4GDMFVZnKki63hIXG0Y48KQwjLhCeGCfqKeZ00XunNAQNelDJZaMyLcblNy1PQJ+MKqKrQOND4taz1K6eSmDBcDG8BOyc5Hiic3NvPagqo+fdMtexv1n1JFTEdDw/Q2aoxVieagJRA91JqWB4xuJmDaaog8KmGUqy++4yEGVrxjg0js2jhVOhXupCCGZvi9vgh/7RAW8GNJGnrai986WgA/JxVEynxpqvI6ufGiOXxkOgTKIbM3oNc9uEmHqsLP3UffcruxmpBHGOQOJe8L01BdvJJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FYpVz4RE; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FYpVz4RE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVnQq6tnyz2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 17:41:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 27F57441D5;
	Tue, 16 Dec 2025 06:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4434C113D0;
	Tue, 16 Dec 2025 06:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765867283;
	bh=4PEhX1VIcmn3P31EDve5NEQok3bWDI+LGvNj9DOUf2g=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=FYpVz4RESVNAw2Kklw7cWUVlEwEie41YHnsmem7aqDR7zR9e2sbrEkwbwlNFuVXFA
	 ebvf75JVQm+ZhZwwJ0nFRL1dYMbaWVialKcRyAv/zh56uLgz9DY7DqkN7cdcYaIPX/
	 3x/13ltZeFK4TcumU3IRZJJdd+5Njw3SaXwAoCWqF2w6us3e2GMmJl/vdq5UVZoIqc
	 HAbVH/wnjexjqmn4r8v/TtmNg9cHpblyEb2lsR6dI4bJ+CfrXA1s9W9olONQEwAzP3
	 t8DST/oLWQfOd+bdFYNIXMDgrPYYFEyoIWB7XrCEFfxspdHslP1HGHjM+VSqVBMLcH
	 STi3Hh5OKS0vg==
Message-ID: <065e3421-0ae1-4e1b-8384-2157d2c1daf9@kernel.org>
Date: Tue, 16 Dec 2025 07:41:11 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, oleg@redhat.com, kees@kernel.org,
 luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
 thuth@redhat.com, sshegde@linux.ibm.com, charlie@rivosinc.com,
 macro@orcam.me.uk, akpm@linux-foundation.org, ldv@strace.io, deller@gmx.de,
 ankur.a.arora@oracle.com, segher@kernel.crashing.org, tglx@linutronix.de,
 thomas.weissschuh@linutronix.de, peterz@infradead.org,
 menglong8.dong@gmail.com, bigeasy@linutronix.de, namcao@linutronix.de,
 kan.liang@linux.intel.com, mingo@kernel.org, atrajeev@linux.vnet.ibm.com,
 mark.barnett@arm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-9-mkchauras@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251214130245.43664-9-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> 
> Convert the PowerPC syscall entry and exit paths to use the generic
> entry/exit framework by selecting GENERIC_ENTRY and integrating with
> the common syscall handling routines.
> 
> This change transitions PowerPC away from its custom syscall entry and
> exit code to use the generic helpers such as:
>   - syscall_enter_from_user_mode()
>   - syscall_exit_to_user_mode()
> 
> As part of this migration:
>   - The architecture now selects GENERIC_ENTRY in Kconfig.
>   - Old tracing, seccomp, and audit handling in ptrace.c is removed in
>     favor of generic entry infrastructure.
>   - interrupt.c and syscall.c are simplified to delegate context
>     management and user exit handling to the generic entry path.
>   - The new pt_regs field `exit_flags` introduced earlier is now used
>     to carry per-syscall exit state flags (e.g. _TIF_RESTOREALL).
> 
> This aligns PowerPC with the common entry code used by other
> architectures and reduces duplicated logic around syscall tracing,
> context tracking, and signal handling.
> 
> The performance benchmarks from perf bench basic syscall are below:
> 
> perf bench syscall usec/op
> 
> | Test            | With Patch | Without Patch | % Change |
> | --------------- | ---------- | ------------- | -------- |
> | getppid usec/op | 0.207795   | 0.210373      | -1.22%   |
> | getpgid usec/op | 0.206282   | 0.211676      | -2.55%   |
> | fork usec/op    | 833.986    | 814.809       | +2.35%   |
> | execve usec/op  | 360.939    | 365.168       | -1.16%   |
> 
> perf bench syscall ops/sec
> 
> | Test            | With Patch | Without Patch | % Change |
> | --------------- | ---------- | ------------- | -------- |
> | getppid ops/sec | 48,12,433  | 47,53,459     | +1.24%   |
> | getpgid ops/sec | 48,47,744  | 47,24,192     | +2.61%   |
> | fork ops/sec    | 1,199      | 1,227         | -2.28%   |
> | execve ops/sec  | 2,770      | 2,738         | +1.16%   |

I get about 2% degradation on powerpc 8xx, and it is quite stable over 
time when repeating the test.

'perf bench syscall all' on powerpc 8xx (usec per op):

| Test            | With Patch | Without Patch | % Change |
| --------------- | ---------- | ------------- | -------- |
| getppid usec/op | 2.63       | 2.63          | ~ 0%     |
| getpgid usec/op | 2.26       | 2.22          | +2,80%   |
| fork usec/op    | 15300      | 15000         | +2,00%   |
| execve usec/op  | 45700      | 45200         | +1.10%   |

Christophe

