Return-Path: <linuxppc-dev+bounces-14465-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A366FC8240E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 20:15:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFbBz3Yb9z2xS2;
	Tue, 25 Nov 2025 06:15:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764011755;
	cv=none; b=E/oX8UPHXwfAB1ZZwEKIdlJ+CxN4PPmNGnJhG4sC4cKqaMOwMX266gFuN2iJ5dmldhYCM2PHnoU6SfwUt+lWQ58+XuFcbV7qUMRKCu+qvAJqhxMhp3w3pO/LStBUz0iQ2e1eXr5ER2SoNTIwyOyBt3t+4CYgXZiSpdqTS7DBnieO/RVTMWfbMe4gur4NSvJOBag5sU+UrcL2Sy3FDvEj0+/OniLibUeKEYB3ouK1wkUkEYf/VPqFXVhDeHwtU2Ipru0xnkXe6GKNINv+PQzpSC2ysw2W9RP/ZW75t6FrxHHzsahNpEK2bjHSUcgL8wgtee+k+8DdOnSVoVcjPIiO0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764011755; c=relaxed/relaxed;
	bh=tFNtQO4MJezSq1Da7LRhRWoB6TraF4nvtRNwdskfv0c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ArUyhFjv71LleokNtXZAnNRdnU3ZH5arRQswqVE5wFnN3Lmu/XVu/qy+4imErK+irXznWIV53VIYZ4TSSEPX2cNPC5ZD4Y9V1/+8n2qCgQJhYLzlBEm3apQEXFnRRKiKcVEbFkyE876GZXg6ecSUBvnAI4dcfiyWev8ILaitxrZPqJ2amP7gEHKcFq6d9GdGN8TS/ORQ27jqXx/bh7Ef7PwsGZ0fz1sTiCk4oSqqRhDvCOD3ia6Ysx5K6gkxmG0G4PcIiD1DWX+HF67R6D3rriZg0SCm953NogCxci7rHlJsxbMwtY89NAsRR9f3O4A82gjxkTAe4z+8RRWsX8ua6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AN/txhTo; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BUHhE29l; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AN/txhTo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BUHhE29l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFbBx4fWPz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 06:15:53 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764011748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tFNtQO4MJezSq1Da7LRhRWoB6TraF4nvtRNwdskfv0c=;
	b=AN/txhToM6VlnwEgn7HGPRictojfH48IrjrQmrfx8FKoMe1uAPwHyw9DVXi9+p/zBA4OL1
	GjcGXbDQxc+wtE/nTiHWgzAahjG9JmRcY0zwQElGZAl6ao3WjA7xgG2wVgn/7TLVtKFFXM
	Egk201XAqXpEjCivCkaQwqEa7CoVeKRb2tsuV69zjlykGLOxSNiNuBxLKls83K6AkzIjOr
	Xj1rANFRnN5K0wfExrcRYzdFEsdabGo5kr8ZsKOBr+hlGcoRlFDS8bDR8qe4mnCB0gBXwY
	rprUBY1b5Y9EN3OcSAOlXsOkQ+KyM4nInQI/fuAKv58k7u7XNWYCqYipSTn8uA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764011748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tFNtQO4MJezSq1Da7LRhRWoB6TraF4nvtRNwdskfv0c=;
	b=BUHhE29l2/cUl/S02UwFWAk8sb5W32l+hFpPVkHbR/s4lrnRqcOvRh24aTl+iTO7o9hQ8C
	7rWaGHg6/XZcxeCA==
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar
 <mingo@kernel.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [tip:core/rseq 25/39] include/linux/rseq_entry.h:132:3: error:
 invalid operand for instruction
In-Reply-To: <202511250134.i0Jm8d7I-lkp@intel.com>
References: <202511250134.i0Jm8d7I-lkp@intel.com>
Date: Mon, 24 Nov 2025 20:15:46 +0100
Message-ID: <874iqji6n1.ffs@tglx>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 25 2025 at 01:37, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/rseq
> head:   21782b3a5cd40892cb2995aa1ec3e74dd1112f1d
> commit: abc850e7616c91ebaa3f5ba3617ab0a104d45039 [25/39] rseq: Provide and use rseq_update_user_cs()
> config: powerpc-randconfig-002-20251124 (https://download.01.org/0day-ci/archive/20251125/202511250134.i0Jm8d7I-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250134.i0Jm8d7I-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511250134.i0Jm8d7I-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from kernel/rseq.c:75:
>>> include/linux/rseq_entry.h:132:3: error: invalid operand for instruction
>                    unsafe_get_user(start_ip, &ucs->start_ip, efault);
>                    ^
>    include/linux/uaccess.h:606:2: note: expanded from macro 'unsafe_get_user'
>            arch_unsafe_get_user(x, ptr, local_label);      \
>            ^
>    arch/powerpc/include/asm/uaccess.h:458:2: note: expanded from macro 'arch_unsafe_get_user'
>            __get_user_size_goto(__gu_val, __gu_addr, sizeof(*(p)), e); \
>            ^
>    arch/powerpc/include/asm/uaccess.h:282:2: note: expanded from macro '__get_user_size_goto'
>            __get_user_size_allowed(x, ptr, size, __gus_retval);    \
>            ^
>    arch/powerpc/include/asm/uaccess.h:273:10: note: expanded from macro '__get_user_size_allowed'
>            case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;  \
>                    ^
>    arch/powerpc/include/asm/uaccess.h:256:4: note: expanded from macro '__get_user_asm2'
>                    "       li %1+1,0\n"                    \
>                     ^
>    <inline asm>:7:5: note: instantiated into assembly here
>            li 31+1,0

Definitely not a problem of tip core/rseq. It just ends up in
__get_user_asm2() and then the compiler gets unhappy about the PowerPC
inline assembly for whatever reason.

Thanks,

        tglx
 


