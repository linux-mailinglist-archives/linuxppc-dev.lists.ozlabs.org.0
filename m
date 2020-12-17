Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0067D2DCC60
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 07:13:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CxM9p4xxVzDqSV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Dec 2020 17:13:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=alexei.starovoitov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vL7fHqO0; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CxM8H2l33zDqQL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Dec 2020 17:11:41 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id be12so1509471plb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 22:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JJLPgf2Y0mDkkc1vkHFYGNB370dPas8KyACzY3FeqzM=;
 b=vL7fHqO0ocxoX4dWHMTH6KNpp87dPd0r38MbUvgR4gCkuQs/y90jrKVH8Poz6i1Gpn
 x/vo5Lnk/uZoE3vTPABxrvIzmNzl/DHzCd+KGx8Wc9MSF4eGxeHq/ndreKB+a7KltsAt
 Bev9L30t7HbRmXL149D+mr5NhMDDRcwl+Sy1q7PQFByFzRMkojk7MLPXIO17j4TH2fCl
 6yS5yVLB7yaXyPVNnF7ba30KMpMjqqAijyRlBmI5XbcgSC1b0BWdsVzwVYBVb79zSQQe
 yzcNRezdeqfM9irSiSTNYmnWOmZGsnvRt3mD/6eNEp5vjvX79yjv6VmDX1Hq9ijfuW5L
 FZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JJLPgf2Y0mDkkc1vkHFYGNB370dPas8KyACzY3FeqzM=;
 b=SvBKvb9cPmziAvHaym0bTg1+qOoyPR4nIk98Mi8759X1n0vYxtT3kLuzonh4tIeWMX
 ujYUDlEsEMX42NR2wWePpJ5peF0LoRUaLZ+EUM2OzIvN0B6+AumqYauhLTk0AazXz8ZQ
 KnT/x7Gtn/TGE8aEvmcnzkPB1H/MRFZhdatFojnfH60GaRG/JSzpYD1vBo72398pVjOZ
 +ZV0R2clbsHSrPMiiLZ8k8nKg4IkTuN5WBAuVi1Ph1aVY1rZTKLs7WW/ZV59nQhvirhx
 m9p1xSqHnNQhTUyDVA9RsWgigPKR8Zw/b1LXpCM5ibR5K+z8PDc6UeTm881P0MpSN1s4
 FZOQ==
X-Gm-Message-State: AOAM530/HR2FNJuMmR8gLsc4VOIeqONVNH88jCQEiwXRc6PFiMfPQTm0
 D4DkxDnVEXJg0EkHdaqjaOs=
X-Google-Smtp-Source: ABdhPJzh6V3z7p7nJ1vaEisJTTrE1URn14pIf3oVCHL1wcbE9UoQ7+WJlT220V+87qqpph+fQYJgZw==
X-Received: by 2002:a17:90a:66ce:: with SMTP id
 z14mr6398972pjl.153.1608185497134; 
 Wed, 16 Dec 2020 22:11:37 -0800 (PST)
Received: from ast-mbp ([2620:10d:c090:400::5:5c8d])
 by smtp.gmail.com with ESMTPSA id j17sm4225112pfh.183.2020.12.16.22.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 22:11:36 -0800 (PST)
Date: Wed, 16 Dec 2020 22:11:33 -0800
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v1 7/7] powerpc/bpf: Implement extended BPF on PPC32
Message-ID: <20201217061133.lnfnhbzvikgtjb3i@ast-mbp>
References: <cover.1608112796.git.christophe.leroy@csgroup.eu>
 <1fed5e11ba08ee28d12f3f57986e5b143a6aa937.1608112797.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fed5e11ba08ee28d12f3f57986e5b143a6aa937.1608112797.git.christophe.leroy@csgroup.eu>
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
Cc: songliubraving@fb.com, daniel@iogearbox.net, john.fastabend@gmail.com,
 andrii@kernel.org, ast@kernel.org, naveen.n.rao@linux.ibm.com,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 sandipan@linux.ibm.com, kpsingh@chromium.org, yhs@fb.com, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kafai@fb.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 16, 2020 at 10:07:37AM +0000, Christophe Leroy wrote:
> Implement Extended Berkeley Packet Filter on Powerpc 32
> 
> Test result with test_bpf module:
> 
> 	test_bpf: Summary: 378 PASSED, 0 FAILED, [354/366 JIT'ed]

nice!

> Registers mapping:
> 
> 	[BPF_REG_0] = r11-r12
> 	/* function arguments */
> 	[BPF_REG_1] = r3-r4
> 	[BPF_REG_2] = r5-r6
> 	[BPF_REG_3] = r7-r8
> 	[BPF_REG_4] = r9-r10
> 	[BPF_REG_5] = r21-r22 (Args 9 and 10 come in via the stack)
> 	/* non volatile registers */
> 	[BPF_REG_6] = r23-r24
> 	[BPF_REG_7] = r25-r26
> 	[BPF_REG_8] = r27-r28
> 	[BPF_REG_9] = r29-r30
> 	/* frame pointer aka BPF_REG_10 */
> 	[BPF_REG_FP] = r31
> 	/* eBPF jit internal registers */
> 	[BPF_REG_AX] = r19-r20
> 	[TMP_REG] = r18
> 
> As PPC32 doesn't have a redzone in the stack,
> use r17 as tail call counter.
> 
> r0 is used as temporary register as much as possible. It is referenced
> directly in the code in order to avoid misuse of it, because some
> instructions interpret it as value 0 instead of register r0
> (ex: addi, addis, stw, lwz, ...)
> 
> The following operations are not implemented:
> 
> 		case BPF_ALU64 | BPF_DIV | BPF_X: /* dst /= src */
> 		case BPF_ALU64 | BPF_MOD | BPF_X: /* dst %= src */
> 		case BPF_STX | BPF_XADD | BPF_DW: /* *(u64 *)(dst + off) += src */
> 
> The following operations are only implemented for power of two constants:
> 
> 		case BPF_ALU64 | BPF_MOD | BPF_K: /* dst %= imm */
> 		case BPF_ALU64 | BPF_DIV | BPF_K: /* dst /= imm */

Those are sensible limitations. MOD and DIV are rare, but XADD is common.
Please consider doing it as a cmpxchg loop in the future.

Also please run test_progs. It will give a lot better coverage than test_bpf.ko
