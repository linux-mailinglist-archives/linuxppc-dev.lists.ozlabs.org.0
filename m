Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6D0420788
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 10:44:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNDmD6wQPz2yPs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 19:44:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=i76Zi2TS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNDlZ6ZmCz2yJF
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Oct 2021 19:43:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=i76Zi2TS; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HNDlR0VHPz4xb7;
 Mon,  4 Oct 2021 19:43:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1633337027;
 bh=lGiN5YFpQQ1dHQyebaZ+eHrMLRHhQ/tolfu0dgF5gdc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=i76Zi2TSGeV/SugFPxQ1z4T2iU1ASdx//IkawvUKouym9vTGxNS/l44JjRpp/bKMh
 ycR5XDmgaXz9dy6S7vSzUfIZv3ZnxtgBsM7JtFy0VAT23ry4u5akHXi5yPg3mGm1Cq
 432dQTzCNawvET02o1vnkxzZBrlzTX9L6OktpqwbD43j1UigtcxhY+BF7fMni1088k
 yDdSZnkf6LxzVOwaOtFOfHBHCnQWvctEvcHkzUkzNEPC1RZ7f/39PILfKZl/mjbFJQ
 0DxCYPOk2N3wsyNdEZooAysOtkASbhdXLyNQXVfPW9tdeuraegK/06qP+hCdbq7xl0
 rmtbbwBbg6rHg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Borkmann <daniel@iogearbox.net>, Hari Bathini
 <hbathini@linux.ibm.com>, naveen.n.rao@linux.ibm.com,
 christophe.leroy@csgroup.eu, ast@kernel.org
Subject: Re: [PATCH v4 0/8] bpf powerpc: Add BPF_PROBE_MEM support in
 powerpc JIT compiler
In-Reply-To: <768469ec-a596-9e0c-541c-aca5693d69e7@iogearbox.net>
References: <20210929111855.50254-1-hbathini@linux.ibm.com>
 <88b59272-e3f7-30ba-dda0-c4a6b42c0029@iogearbox.net>
 <87o885raev.fsf@mpe.ellerman.id.au>
 <768469ec-a596-9e0c-541c-aca5693d69e7@iogearbox.net>
Date: Mon, 04 Oct 2021 19:43:45 +1100
Message-ID: <87lf39qiwu.fsf@mpe.ellerman.id.au>
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
Cc: songliubraving@fb.com, netdev@vger.kernel.org, john.fastabend@gmail.com,
 andrii@kernel.org, kpsingh@kernel.org, paulus@samba.org, yhs@fb.com,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kafai@fb.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Borkmann <daniel@iogearbox.net> writes:
> On 10/4/21 12:49 AM, Michael Ellerman wrote:
>> Daniel Borkmann <daniel@iogearbox.net> writes:
>>> On 9/29/21 1:18 PM, Hari Bathini wrote:
>>>> Patch #1 & #2 are simple cleanup patches. Patch #3 refactors JIT
>>>> compiler code with the aim to simplify adding BPF_PROBE_MEM support.
>>>> Patch #4 introduces PPC_RAW_BRANCH() macro instead of open coding
>>>> branch instruction. Patch #5 & #7 add BPF_PROBE_MEM support for PPC64
>>>> & PPC32 JIT compilers respectively. Patch #6 & #8 handle bad userspace
>>>> pointers for PPC64 & PPC32 cases respectively.
>>>
>>> Michael, are you planning to pick up the series or shall we route via bpf-next?
>> 
>> Yeah I'll plan to take it, unless you think there is a strong reason it
>> needs to go via the bpf tree (doesn't look like it from the diffstat).
>
> Sounds good to me, in that case, please also route the recent JIT fixes from
> Naveen through your tree.

Will do.

cheers
