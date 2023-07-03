Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFB47454EC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZQV1QGNz3cW9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:35:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZP15WZqz309D
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:34:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZP10R2dz4wqZ;
	Mon,  3 Jul 2023 15:34:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <20230616034846.311705-1-bgray@linux.ibm.com>
References: <20230616034846.311705-1-bgray@linux.ibm.com>
Subject: Re: [PATCH v3 00/11] Add static DEXCR support
Message-Id: <168836201894.50010.3030313933357760845.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:58 +1000
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Jun 2023 13:48:35 +1000, Benjamin Gray wrote:
> v3:	* Expose (H)DEXCR in ptrace as 64 bits
> 	* Remove build config for DEXCR, always enable NPHIE
> 	* Fix up documentation to reflect this
> 	* Some commit message fixes
> 
> Previous versions:
> v2: https://lore.kernel.org/all/20230330055040.434133-1-bgray@linux.ibm.com/
> v1: https://lore.kernel.org/all/20230322054612.1340573-1-bgray@linux.ibm.com/
> RFC: https://lore.kernel.org/all/20221128024458.46121-1-bgray@linux.ibm.com/
> 
> [...]

Applied to powerpc/next.

[01/11] powerpc/book3s: Add missing <linux/sched.h> include
        https://git.kernel.org/powerpc/c/7eec97b32e0b62f54b7f6afb5df189806b1bb87b
[02/11] powerpc/ptrace: Add missing <linux/regset.h> include
        https://git.kernel.org/powerpc/c/81e30a5412e4bcdc9d338ffa0cf1f4b90bc63abc
[03/11] powerpc/dexcr: Add initial Dynamic Execution Control Register (DEXCR) support
        https://git.kernel.org/powerpc/c/0ffd60b782ed79349baf28dd3259c872f39274e9
[04/11] powerpc/dexcr: Handle hashchk exception
        https://git.kernel.org/powerpc/c/5bcba4e6c13f0c889da1f9e67ee10accd9ca4c19
[05/11] powerpc/dexcr: Support userspace ROP protection
        https://git.kernel.org/powerpc/c/be98fcf7c10dea74e9c3e2cd0018e47bdee67442
[06/11] powerpc/ptrace: Expose DEXCR and HDEXCR registers to ptrace
        https://git.kernel.org/powerpc/c/884ad5c52da253e5d38f947cd8d1d9412a47429c
[07/11] powerpc/ptrace: Expose HASHKEYR register to ptrace
        https://git.kernel.org/powerpc/c/97228ca375c78bfd960767dcd4919c981add306f
[08/11] Documentation: Document PowerPC kernel DEXCR interface
        https://git.kernel.org/powerpc/c/65d6c884bfbd38235659e6df193345e5ad874043
[09/11] selftests/powerpc: Add more utility macros
        https://git.kernel.org/powerpc/c/b9125c9aa043a7556626e1aafb3190c61c1e2b2b
[10/11] selftests/powerpc/dexcr: Add hashst/hashchk test
        https://git.kernel.org/powerpc/c/bdb07f35a52f40c461c7da06ddcbaca1950fb9e0
[11/11] selftests/powerpc/dexcr: Add DEXCR status utility lsdexcr
        https://git.kernel.org/powerpc/c/a16e472c3546ba0b8a4be265c008d02ef6aed899

cheers
