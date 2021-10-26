Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E058143B65C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 18:02:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdxRN5YMCz3bhg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 03:02:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HdxQw2bMFz2yK2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 03:01:59 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 19QFxfkQ012472;
 Tue, 26 Oct 2021 10:59:41 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 19QFxeef012468;
 Tue, 26 Oct 2021 10:59:40 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 26 Oct 2021 10:59:40 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc/boot: Set LC_ALL=C in wrapper script
Message-ID: <20211026155940.GX614@gate.crashing.org>
References: <a9ff3bc98035f63b122c051f02dc47c7aed10430.1635256089.git.christophe.leroy@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a9ff3bc98035f63b122c051f02dc47c7aed10430.1635256089.git.christophe.leroy@csgroup.eu>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 26, 2021 at 03:48:29PM +0200, Christophe Leroy wrote:
> While trying to build a simple Image for ACADIA platform, I got the
> following error:
> 
> 	  WRAP    arch/powerpc/boot/simpleImage.acadia
> 	INFO: Uncompressed kernel (size 0x6ae7d0) overlaps the address of the wrapper(0x400000)
> 	INFO: Fixing the link_address of wrapper to (0x700000)
> 	powerpc64-linux-gnu-ld : mode d'émulation non reconnu : -T
> 	Émulations prises en charge : elf64ppc elf32ppc elf32ppclinux elf32ppcsim elf64lppc elf32lppc elf32lppclinux elf32lppcsim
> 	make[1]: *** [arch/powerpc/boot/Makefile:424 : arch/powerpc/boot/simpleImage.acadia] Erreur 1
> 	make: *** [arch/powerpc/Makefile:285 : simpleImage.acadia] Erreur 2
> 
> Trying again with V=1 shows the following command
> 
> 	powerpc64-linux-gnu-ld -m -T arch/powerpc/boot/zImage.lds -Ttext 0x700000 --no-dynamic-linker -o arch/powerpc/boot/simpleImage.acadia -Map wrapper.map arch/powerpc/boot/fixed-head.o arch/powerpc/boot/simpleboot.o ./zImage.3278022.o arch/powerpc/boot/wrapper.a
> 
> The argument of '-m' is missing.
> 
> This is due to the wrapper script calling 'objdump -p vmlinux' and
> looking for 'file format', whereas the output of objdump is:
> 
> 	vmlinux:     format de fichier elf32-powerpc
> 
> 	En-tête de programme:
> 	    LOAD off    0x00010000 vaddr 0xc0000000 paddr 0x00000000 align 2**16
> 	         filesz 0x0069e1d4 memsz 0x006c128c flags rwx
> 	    NOTE off    0x0064591c vaddr 0xc063591c paddr 0x0063591c align 2**2
> 	         filesz 0x00000054 memsz 0x00000054 flags ---
> 
> Add LC_ALL=C at the beginning of the wrapper script in order to get the
> output expected by the script:
> 
> 	vmlinux:     file format elf32-powerpc
> 
> 	Program Header:
> 	    LOAD off    0x00010000 vaddr 0xc0000000 paddr 0x00000000 align 2**16
> 	         filesz 0x0069e1d4 memsz 0x006c128c flags rwx
> 	    NOTE off    0x0064591c vaddr 0xc063591c paddr 0x0063591c align 2**2
> 	         filesz 0x00000054 memsz 0x00000054 flags ---
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Segher Boessenkool <segher@kernel.crashing.org>

Thanks,


Segher
