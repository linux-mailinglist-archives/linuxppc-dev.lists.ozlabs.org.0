Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2743A87C507
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 23:13:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IECZdPuB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwhVV4vW4z3vYJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 09:13:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IECZdPuB;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwhTl6Lhhz3dTW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 09:13:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1710454394;
	bh=gEhbEPH5aj2Z/7UOp7mkhRqYJQi1PvcDq1cmOaQVYNc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IECZdPuB8mxs6KEW1DJaf4Mttp7mFL0NZ4N9gwYMd8u8af4NOt/CKMzgfbF1EJlJt
	 g2fBzevj2IyWMk/Wvine73Ph8/V8tnlaPGIHrgwuRsSWGNcXy/JoNZaYuVMi7GX2dm
	 XQuHo4uWY1NMN/BUYgRRxkA65k/hMND4FElAW7HttCDds2lDFL5ZfDv7EhnvSltRxq
	 vtUYgm28mPyTxy/DixOS/DaWwkAXYvBqDQ1Jk8HLLx5k8TrH8abfyOF9k1Ay1Dz+Ct
	 5+eR2AIx24QXmDWnEmOPGHmha5eNPNPpz6wyOhcsmXRm6Ara/4t5k5SZpvyVevZt4q
	 ByD5XMiLCnovw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TwhTh47qDz4wcR;
	Fri, 15 Mar 2024 09:13:12 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vignesh Balasubramanian <vigbalas@amd.com>,
 linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
In-Reply-To: <20240314112359.50713-2-vigbalas@amd.com>
References: <20240314112359.50713-1-vigbalas@amd.com>
 <20240314112359.50713-2-vigbalas@amd.com>
Date: Fri, 15 Mar 2024 09:13:10 +1100
Message-ID: <87o7bg31jd.fsf@mail.lhotse>
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@FreeBSD.org, bpetkov@amd.com, binutils@sourceware.org, x86@kernel.org, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vignesh,

Vignesh Balasubramanian <vigbalas@amd.com> writes:
> Add a new .note section containing type, size, offset and flags of
> every xfeature that is present.
>
> This information will be used by the debuggers to understand the XSAVE
> layout of the machine where the core file is dumped, and to read XSAVE
> registers, especially during cross-platform debugging.
>
> Co-developed-by: Jini Susan George <jinisusan.george@amd.com>
> Signed-off-by: Jini Susan George <jinisusan.george@amd.com>
> Signed-off-by: Vignesh Balasubramanian <vigbalas@amd.com>
> ---
>  arch/Kconfig                   |   9 +++
>  arch/powerpc/Kconfig           |   1 +
>  arch/powerpc/include/asm/elf.h |   2 -
>  arch/x86/Kconfig               |   1 +
>  arch/x86/include/asm/elf.h     |   7 +++
>  arch/x86/kernel/fpu/xstate.c   | 101 +++++++++++++++++++++++++++++++++
>  include/linux/elf.h            |   2 +-
>  include/uapi/linux/elf.h       |   1 +
>  8 files changed, 121 insertions(+), 3 deletions(-)

IMHO you should split the changes to replace ARCH_HAVE_EXTRA_ELF_NOTES
with CONFIG_ARCH_HAVE_EXTRA_ELF_NOTES into a lead-up patch.

cheers
