Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFAC428CAF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 14:08:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HScyv2nMcz3cDB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 23:08:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HScxg63mnz2xsv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 23:07:51 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HScxg5VgDz4xqM;
 Mon, 11 Oct 2021 23:07:51 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <025754fde3d027904ae9d0191f395890bec93369.1631541649.git.christophe.leroy@csgroup.eu>
References: <025754fde3d027904ae9d0191f395890bec93369.1631541649.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/mem: Fix arch/powerpc/mm/mem.c:53:12: error: no
 previous prototype for 'create_section_mapping'
Message-Id: <163395400153.4094789.2095560885525137957.b4-ty@ellerman.id.au>
Date: Mon, 11 Oct 2021 23:06:41 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Sep 2021 17:17:26 +0200, Christophe Leroy wrote:
> Commit 8e11d62e2e87 ("powerpc/mem: Add back missing header to fix 'no
> previous prototype' error") was supposed to fix the problem, but in
> the meantime commit a927bd6ba952 ("mm: fix phys_to_target_node() and*
> memory_add_physaddr_to_nid() exports") moved create_section_mapping()
> prototype from asm/sparsemem.h to asm/mmzone.h
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/mem: Fix arch/powerpc/mm/mem.c:53:12: error: no previous prototype for 'create_section_mapping'
      https://git.kernel.org/powerpc/c/7eff9bc00ddf1e2281dff575884b7f676c85b006

cheers
