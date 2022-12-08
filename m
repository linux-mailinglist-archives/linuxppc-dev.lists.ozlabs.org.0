Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F36D0647073
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 14:07:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSZDk6qWrz3frr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 00:07:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSZDB3VBGz2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 00:06:34 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSZD92gzCz4xGj;
	Fri,  9 Dec 2022 00:06:33 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221114175754.1131267-1-sv@linux.ibm.com>
References: <20221114175754.1131267-1-sv@linux.ibm.com>
Subject: Re: [PATCH v6 00/16] objtool: Enable and implement --mcount option on powerpc
Message-Id: <167050454403.1468634.5855487994223245890.b4-ty@ellerman.id.au>
Date: Fri, 09 Dec 2022 00:02:24 +1100
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
Cc: aik@ozlabs.ru, npiggin@gmail.com, linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, rostedt@goodmis.org, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 14 Nov 2022 23:27:38 +0530, Sathvika Vasireddy wrote:
> This patchset enables and implements objtool --mcount
> option on powerpc. This applies atop powerpc/merge branch.
> 
> Changelog:
> 
> ----
> v6:
> 
> [...]

Applied to powerpc/next (and topic/objtool).

[01/16] powerpc: Fix __WARN_FLAGS() for use with Objtool
        https://git.kernel.org/powerpc/c/93e3f45a26310e3f3f8558be40df411e23ab742c
[02/16] powerpc: Override __ALIGN and __ALIGN_STR macros
        https://git.kernel.org/powerpc/c/01f2cf0b990e58ae89142f57c7e02d33621311d2
[03/16] powerpc: Fix objtool unannotated intra-function call warnings
        https://git.kernel.org/powerpc/c/29a011fc79e625b2b02f25262657f7c4c59ae9f7
[04/16] powerpc: Curb objtool unannotated intra-function call warnings
        https://git.kernel.org/powerpc/c/8d0c21b50655bfe136a76cf384495ba1f9c87224
[05/16] powerpc: Skip objtool from running on drivers/crypto/vmx/aesp8-ppc.o
        https://git.kernel.org/powerpc/c/1c137323e9a2a970b4a5bf8cf3c50e0ea1cefbeb
[06/16] powerpc: Fix objtool unannotated intra-function call warnings on PPC32
        https://git.kernel.org/powerpc/c/2da37761671b5bdedbe04e6469cfa57cd6b6ae45
[07/16] powerpc: Skip objtool from running on VDSO files
        https://git.kernel.org/powerpc/c/d0160bd5d389da247fb5affb6a35ea393d22fedb
[08/16] objtool: Fix SEGFAULT
        https://git.kernel.org/powerpc/c/efb11fdb3e1a9f694fa12b70b21e69e55ec59c36
[09/16] objtool: Use target file endianness instead of a compiled constant
        https://git.kernel.org/powerpc/c/0646c28b417b7fe307c9da72ca1c508e43b57dc0
[10/16] objtool: Use target file class size instead of a compiled constant
        https://git.kernel.org/powerpc/c/86ea7f361537f825a699e86fdc9e49be19f128d1
[11/16] objtool: Add --mnop as an option to --mcount
        https://git.kernel.org/powerpc/c/280981d6994e0700abd36647b141e73059851e66
[12/16] objtool: Read special sections with alts only when specific options are selected
        https://git.kernel.org/powerpc/c/de6fbcedf5abce4c321eeb15d7d286b79804b8b6
[13/16] objtool: Use macros to define arch specific reloc types
        https://git.kernel.org/powerpc/c/c1449735211dd8c4c2d54fa0ece6890ecbd74e24
[14/16] objtool: Add arch specific function arch_ftrace_match()
        https://git.kernel.org/powerpc/c/4ca993d498987332ceeedee5380101b84accaf35
[15/16] objtool/powerpc: Enable objtool to be built on ppc
        https://git.kernel.org/powerpc/c/e52ec98c5ab18c0710ea22bf52f45e60a725adaf
[16/16] objtool/powerpc: Add --mcount specific implementation
        https://git.kernel.org/powerpc/c/c984aef8c8326035570ff6e01d0ff9e79a5dfa76

cheers
