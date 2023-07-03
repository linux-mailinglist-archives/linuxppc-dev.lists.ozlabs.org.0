Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 697C67454D0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:26:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZCj2Y9Pz3cdY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:26:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZ8J6YFwz30N3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:23:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZ8J4CWDz4wxp;
	Mon,  3 Jul 2023 15:23:28 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <20230427-remove-power10-args-from-boot-aflags-clang-v1-1-9107f7c943bc@kernel.org>
References: <20230427-remove-power10-args-from-boot-aflags-clang-v1-1-9107f7c943bc@kernel.org>
Subject: Re: [PATCH] powerpc/boot: Disable power10 features after BOOTAFLAGS assignment
Message-Id: <168836167604.46386.2142822866200803568.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:21:16 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com, patches@lists.linux.dev, npiggin@gmail.com, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 27 Apr 2023 12:34:53 -0700, Nathan Chancellor wrote:
> When building the boot wrapper assembly files with clang after
> commit 648a1783fe25 ("powerpc/boot: Fix boot wrapper code generation
> with CONFIG_POWER10_CPU"), the following warnings appear for each file
> built:
> 
>   '-prefixed' is not a recognized feature for this target (ignoring feature)
>   '-pcrel' is not a recognized feature for this target (ignoring feature)
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/boot: Disable power10 features after BOOTAFLAGS assignment
      https://git.kernel.org/powerpc/c/2b694fc96fe33a7c042e3a142d27d945c8c668b0

cheers
