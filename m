Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03471585088
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:11:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSbH708Pz3bjX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:11:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSYv1CxRz2xkk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:10:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSYs5qW8z4x1d;
	Fri, 29 Jul 2022 23:10:41 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-doc-tw-discuss@lists.sourceforge.net, linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bagas Sanjaya <bagasdotme@gmail.com>, linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220728033332.27836-1-bagasdotme@gmail.com>
References: <20220727220050.549db613@canb.auug.org.au> <20220728033332.27836-1-bagasdotme@gmail.com>
Subject: Re: [PATCH 0/3] Documentation: powerpc: documentation fixes for Documentation/powerpc/elf_hwcaps.rst
Message-Id: <165909979455.253830.7633506902686535863.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:03:14 +1000
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
Cc: Yanteng Si <siyanteng@loongson.cn>, Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>, Alex Shi <alexs@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 28 Jul 2022 10:33:30 +0700, Bagas Sanjaya wrote:
> After merging powerpc tree for linux-next integration testing, Stephen
> Rothwell reported htmldocs warnings at [1]. Fix these with self-explanatory
> fixes in the shortlog below.
> 
> [1]: https://lore.kernel.org/linuxppc-dev/20220727220050.549db613@canb.auug.org.au/
> 
> Bagas Sanjaya (3):
>   Documentation: powerpc: fix indentation warnings
>   Documentation: use different label names for each arch's
>     elf_hwcaps.rst
>   Documentation: powerpc: add elf_hwcaps to table of contents
> 
> [...]

Applied to powerpc/next.

[1/3] Documentation: powerpc: fix indentation warnings
      https://git.kernel.org/powerpc/c/4515862b66d3bdaf681cade1c72f047c93d94d01
[2/3] Documentation: use different label names for each arch's elf_hwcaps.rst
      https://git.kernel.org/powerpc/c/0595a216920cb035030c73cec3ab9fe413ef1d77
[3/3] Documentation: powerpc: add elf_hwcaps to table of contents
      https://git.kernel.org/powerpc/c/a05aae92f84ba6d2705f6dac206ef5dcf097ea96

cheers
