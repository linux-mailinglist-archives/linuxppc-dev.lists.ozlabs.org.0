Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 155CE5F44F6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 15:59:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhfTh0q5Fz3fBW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 00:59:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mhf1r2DFdz3brF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 00:39:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mhf1r14cFz4xHl;
	Wed,  5 Oct 2022 00:39:12 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220916040755.2398112-1-npiggin@gmail.com>
References: <20220916040755.2398112-1-npiggin@gmail.com>
Subject: Re: [PATCH v2 0/7] powerpc: build / linker improvements
Message-Id: <166488984825.779920.16579265711784950572.b4-ty@ellerman.id.au>
Date: Wed, 05 Oct 2022 00:24:08 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Sep 2022 14:07:48 +1000, Nicholas Piggin wrote:
> This series is mainly about moving more things out of writable and
> executable memory, and slightly moving the linker script in the
> direction of the binutils ld internal linker script as we do.
> 
> Thanks,
> Nick
> 
> [...]

Applied to powerpc/next.

[1/7] powerpc: move __end_rodata to cover arch read-only sections
      https://git.kernel.org/powerpc/c/7082f8e7d2276575a8806370007cbb4a7b9abdce
[2/7] powerpc/32/build: move got1/got2 sections out of text
      https://git.kernel.org/powerpc/c/1faa1235c1a00614bc4849a8dbd0790363c9a22f
[3/7] powerpc/build: move got, toc, plt, branch_lt sections to read-only
      https://git.kernel.org/powerpc/c/f21ba4499a15b76ad6013ca0a60873dbcf164c7b
[4/7] powerpc/build: move .data.rel.ro, .sdata2 to read-only
      https://git.kernel.org/powerpc/c/b6adc6d6d327229d75607a948cde2349d317f366
[5/7] powerpc/64/build: only include .opd with ELFv1
      https://git.kernel.org/powerpc/c/c787fed11890babda1e4882cd3b6efaf412e1bde
[6/7] powerpc/64/build: merge .got and .toc input sections
      https://git.kernel.org/powerpc/c/1e9eca485a840985a663080eb049c420272d4bdd
[7/7] powerpc/build: put sys_call_table in .data.rel.ro if RELOCATABLE
      https://git.kernel.org/powerpc/c/fdfdcfd504933ed06eb6b4c9df21eede0e213c3e

cheers
