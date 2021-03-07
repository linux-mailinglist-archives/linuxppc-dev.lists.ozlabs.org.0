Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E05D32FF3D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Mar 2021 07:28:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DtWkR3tP2z3dGF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Mar 2021 17:28:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DtWk66SpNz30Gb
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Mar 2021 17:27:58 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1276NdCi026488;
 Sun, 7 Mar 2021 00:23:39 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 1276NbRn026484;
 Sun, 7 Mar 2021 00:23:37 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sun, 7 Mar 2021 00:23:36 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Fangrui Song <maskray@google.com>
Subject: Re: [PATCH] Replace __toc_start + 0x8000 with .TOC.
Message-ID: <20210307062336.GD29191@gate.crashing.org>
References: <20210307051433.2756645-1-maskray@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307051433.2756645-1-maskray@google.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 clang-built-linux <clang-built-linux@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Sat, Mar 06, 2021 at 09:14:33PM -0800, Fangrui Song wrote:
> TOC relocations are like GOT relocations on other architectures.
> However, unlike other architectures, GNU ld's ppc64 port defines .TOC.
> relative to the .got output section instead of the linker synthesized
> .got input section. LLD defines .TOC. as the .got input section plus
> 0x8000. When CONFIG_PPC_OF_BOOT_TRAMPOLINE=y,
> arch/powerpc/kernel/prom_init.o is built, and LLD computed .TOC. can be
> different from __toc_start defined by the linker script.
> 
> Simplify kernel_toc_addr with asm label .TOC. so that we can get rid of
> __toc_start.
> 
> With this change, powernv_defconfig with CONFIG_PPC_OF_BOOT_TRAMPOLINE=y
> is bootable with LLD. There is still an untriaged issue with Alexey's
> configuration.

Do you have any explanation why this *does* work, while the original
doesn't?  Some explanation that says *what* is wrong.  To me it doesn't
look like the kernel script is.


Segher
