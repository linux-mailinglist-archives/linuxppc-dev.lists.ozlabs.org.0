Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F14647014
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:52:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSYw13cVCz3fD2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:52:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYrh660Mz2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYrh50JTz4xZ7;
	Thu,  8 Dec 2022 23:49:40 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: bgray@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <f67d2a109404d03e8fdf1ea15388c8778337a76b.1669969781.git.christophe.leroy@csgroup.eu>
References: <f67d2a109404d03e8fdf1ea15388c8778337a76b.1669969781.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/5] powerpc/code-patching: Remove #ifdef CONFIG_STRICT_KERNEL_RWX
Message-Id: <167050321439.1457988.16908884696488370128.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:40:14 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2 Dec 2022 09:31:39 +0100, Christophe Leroy wrote:
> No need to have one implementation of patch_instruction() for
> CONFIG_STRICT_KERNEL_RWX and one for !CONFIG_STRICT_KERNEL_RWX.
> 
> In patch_instruction(), call raw_patch_instruction() when
> !CONFIG_STRICT_KERNEL_RWX.
> 
> In poking_init(), bail out immediately, it will be equivalent
> to the weak default implementation.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/code-patching: Remove #ifdef CONFIG_STRICT_KERNEL_RWX
      https://git.kernel.org/powerpc/c/84ecfe6f38ae4ee779ebd97ee173937fff565bf9
[2/5] powerpc/feature-fixups: Refactor entry fixups patching
      https://git.kernel.org/powerpc/c/6076dc349b1c587c74c37027efff76f0fa4646f4
[3/5] powerpc/feature-fixups: Refactor other fixups patching
      https://git.kernel.org/powerpc/c/3d1dbbca33a9c6dd3aafd4d14aaea9cc310723e1
[4/5] powerpc/feature-fixups: Do not patch init section after init
      https://git.kernel.org/powerpc/c/b988e7797d09379057cf991ae082f9ad7a309a63
[5/5] powerpc/code-patching: Remove protection against patching init addresses after init
      https://git.kernel.org/powerpc/c/6f3a81b60091031c2c14eb2373d1937b027deb46

cheers
