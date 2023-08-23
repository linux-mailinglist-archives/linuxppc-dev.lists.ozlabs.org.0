Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A57C7857CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:19:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4z13ZVhz3hZc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:19:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4dY2KFxz3c3c
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:04:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4dW1J3dz4x2F;
	Wed, 23 Aug 2023 22:04:31 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>
In-Reply-To: <20230803-ppc_tlbilxlpid-v3-1-ca84739bfd73@google.com>
References: <20230803-ppc_tlbilxlpid-v3-1-ca84739bfd73@google.com>
Subject: Re: [PATCH v3] powerpc/inst: add PPC_TLBILX_LPID
Message-Id: <169279175566.797584.17891188620028353230.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
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
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 03 Aug 2023 11:33:52 -0700, Nick Desaulniers wrote:
> Clang didn't recognize the instruction tlbilxlpid. This was fixed in
> clang-18 [0] then backported to clang-17 [1].  To support clang-16 and
> older, rather than using that instruction bare in inline asm, add it to
> ppc-opcode.h and use that macro as is done elsewhere for other
> instructions.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/inst: add PPC_TLBILX_LPID
      https://git.kernel.org/powerpc/c/ae7936d232d862e5b8311180036281ffe93735b8

cheers
