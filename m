Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C235661537
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 13:51:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqcPx35Tjz3cfj
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 23:51:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqcPM0g2qz30hh
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 23:50:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NqcPJ65Trz4xwl;
	Sun,  8 Jan 2023 23:50:28 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230105132349.384666-1-mpe@ellerman.id.au>
References: <20230105132349.384666-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/3] powerpc/vmlinux.lds: Define RUNTIME_DISCARD_EXIT
Message-Id: <167318219560.903173.5982638830598181633.b4-ty@ellerman.id.au>
Date: Sun, 08 Jan 2023 23:49:55 +1100
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
Cc: linux-arch@vger.kernel.org, masahiroy@kernel.org, linux-kernel@vger.kernel.org, nathan@kernel.org, schwab@linux-m68k.org, ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 6 Jan 2023 00:23:47 +1100, Michael Ellerman wrote:
> The powerpc linker script explicitly includes .exit.text, because
> otherwise the link fails due to references from __bug_table and
> __ex_table. The code is freed (discarded) at runtime along with
> .init.text and data.
> 
> That has worked in the past despite powerpc not defining
> RUNTIME_DISCARD_EXIT because DISCARDS appears late in the powerpc linker
> script (line 410), and the explicit inclusion of .exit.text
> earlier (line 280) supersedes the discard.
> 
> [...]

Applied to powerpc/fixes.

[1/3] powerpc/vmlinux.lds: Define RUNTIME_DISCARD_EXIT
      https://git.kernel.org/powerpc/c/4b9880dbf3bdba3a7c56445137c3d0e30aaa0a40
[2/3] powerpc/vmlinux.lds: Don't discard .rela* for relocatable builds
      https://git.kernel.org/powerpc/c/07b050f9290ee012a407a0f64151db902a1520f5
[3/3] powerpc/vmlinux.lds: Don't discard .comment
      https://git.kernel.org/powerpc/c/be5f95c8779e19779dd81927c8574fec5aaba36c

cheers
