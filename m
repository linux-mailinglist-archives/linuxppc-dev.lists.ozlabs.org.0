Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0AF200634
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 12:27:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pFNc31ndzDrNB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 20:27:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pFLr4GFszDqTZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 20:25:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aVcWrsEr; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49pFLq6hSbz9sSd; Fri, 19 Jun 2020 20:25:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49pFLp73VDz9sSJ;
 Fri, 19 Jun 2020 20:25:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592562339;
 bh=v3lZ1zhxm30dbuwgJcVNBDOXwalAnBkaTaUQ7+IoMNs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aVcWrsEruaaErbDP8NVcrNS+EK8+wxDbELGLevLdX9mcDCpb2pHRbgdeARe5/0EAL
 HesWHI6KgwsqORqKaT58fELkECtqgo2D4W9poc7mZN1pDn08e6v1zwhsW8Q0bQ4BIQ
 6GRgbhI4Wh5rwGGp8dFKkH1goaM4iZMptx53G0/eTk9OLEZJ4Kj1ZdvcCQ7vNDxmnm
 KcVGCIcLF/uOJg6YXgAM+fVIWQ9RuTLN8p/6GvgtoRZX1B2nfBLgz/NZ9MeMofKBaU
 x6S5cFKqCuS38FqqKoevBr+TYTdwgNwV5GXeBTi6ct72b3/mDTums4QVH+QXSuzlva
 Rjvb3HigWEwpA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/syscalls: Split SPU-ness out of ABI
In-Reply-To: <20200616135617.2937252-2-mpe@ellerman.id.au>
References: <20200616135617.2937252-1-mpe@ellerman.id.au>
 <20200616135617.2937252-2-mpe@ellerman.id.au>
Date: Fri, 19 Jun 2020 20:26:05 +1000
Message-ID: <87h7v7cpxe.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> Using the ABI field to encode whether a syscall is usable by SPU
> programs or not is a bit of kludge.
>
> The ABI of the syscall doesn't change depending on the SPU-ness, but
> in order to make the syscall generation work we have to pretend that
> it does.
>
> It also means we have more duplicated syscall lines than we need to,
> and the SPU logic is not well contained, instead all of the syscall
> generation targets need to know if they are spu or nospu.
>
> So instead add a separate file which contains the information on which
> syscalls are available for SPU programs. It's just a list of syscall
> numbers with a single "spu" field. If the field has the value "spu"
> then the syscall is available to SPU programs, any other value or no
> entry entirely means the syscall is not available to SPU programs.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/syscalls/Makefile      |  16 +-
>  arch/powerpc/kernel/syscalls/spu.tbl       | 430 +++++++++++++++++++++
>  arch/powerpc/kernel/syscalls/syscall.tbl   | 195 ++++------
>  arch/powerpc/kernel/syscalls/syscalltbl.sh |  10 +-
>  4 files changed, 523 insertions(+), 128 deletions(-)
>  create mode 100644 arch/powerpc/kernel/syscalls/spu.tbl

For the archives, the changes to the syscall table & the generation of
the spu.tbl can be more-or-less generated with the script below
(ignoring whitespace & comments).

cheers


#!/bin/bash

git checkout v5.8-rc1

table=arch/powerpc/kernel/syscalls/syscall.tbl

for number in {0..439}
do
    line=$(grep -E "^$number\s+(common|spu)" $table)
    if [[ -n "$line" ]]; then
	read number abi name syscall compat <<< "$line"
	if [[ "$syscall" != "sys_ni_syscall" ]]; then
	    if [[ "$name" == "utimesat" ]]; then # fix typo
		name="futimesat"
	    fi
	    echo -e "$number\t$name\tspu"
	    continue
	fi
    fi

    line=$(grep -m 1 -E "^$number\s+" $table)
    read number abi name syscall compat <<< "$line"
    if [[ -n "$name" ]]; then
	echo -e "$number\t$name\t-"
    fi
done > spu-generated.tbl

cat $table | while read line
do
    read number abi name syscall compat <<< "$line"

    if [[ "$number" == "#" ]]; then
	echo $line
	continue
    fi

    case "$abi" in
	"nospu")	;&
	"common")	;&
	"32")		;&
	"64") echo "$line" | sed -e "s/nospu/common/" ;;
    esac
done > syscall-generated.tbl

git cat-file -p 35e32a6cb5f6:$table | diff -w -u - syscall-generated.tbl
git cat-file -p 35e32a6cb5f6:arch/powerpc/kernel/syscalls/spu.tbl | diff -w -u - spu-generated.tbl

