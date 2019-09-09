Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E91AD4BA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 10:21:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rh2n2nBLzDqLy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 18:21:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Rh0z0vPTzDqDr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2019 18:20:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46Rh0w5jnCz9s7T;
 Mon,  9 Sep 2019 18:19:59 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>,
 kexec@lists.infradead.org
Subject: Re: [PATCH v5 0/7] kexec: add generic support for elf kernel images
In-Reply-To: <22b40bb7-6f86-0a69-12b2-12d90124173d@gmx.de>
References: <20190823194919.30916-1-svens@stackframe.org>
 <22b40bb7-6f86-0a69-12b2-12d90124173d@gmx.de>
Date: Mon, 09 Sep 2019 18:20:03 +1000
Message-ID: <87v9u1zxsc.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Helge,

Sorry I meant to do something about this series but got swamped by other
things, as always.

Helge Deller <deller@gmx.de> writes:
> Hi all,
>
> This kexec patch series is the groundwork for kexec on the parisc architecture.
> Since we want kexec on parisc, I've applied it to my for-next-kexec tree [1],
> and can push it to Linus in the next merge window through the parisc tree [2].
>
> If someone has any objections, or if you prefer to take it through
> a kexec or powerpc tree, please let me know.

The ideal way to handle a series like this is to put it in a topic
branch based off rc1, so that both trees can merge it without pulling in
any unrelated arch changes.

But in this case I don't see any conflicts so I think it's fine for it
to go via your tree, it will get some testing in linux-next.

cheers

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next-kexec
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/log/?h=for-next
>
> On 23.08.19 21:49, Sven Schnelle wrote:
>> Changes to v4:
>>  - rebase on current powerpc/merge tree
>>  - fix syscall name in commit message
>>  - remove a few unused #defines in arch/powerpc/kernel/kexec_elf_64.c
>>...
>>  arch/Kconfig                                  |   3 +
>>  arch/powerpc/Kconfig                          |   1 +
>>  arch/powerpc/kernel/kexec_elf_64.c            | 545 +-----------------
>>  include/linux/kexec.h                         |  23 +
>>  kernel/Makefile                               |   1 +
>>  .../kexec_elf_64.c => kernel/kexec_elf.c      | 394 +++----------
>>  6 files changed, 115 insertions(+), 852 deletions(-)
>>  copy arch/powerpc/kernel/kexec_elf_64.c => kernel/kexec_elf.c (50%)
