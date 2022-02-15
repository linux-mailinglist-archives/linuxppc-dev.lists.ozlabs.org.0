Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D11F34B62DA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:33:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyVB92Wxvz3dgL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:33:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV6B3SwQz3cSd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:30:10 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV6B3FFPz4y4G;
 Tue, 15 Feb 2022 16:30:10 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <bbc196451dd34521d239023ccca488db35b8fff1.1643567900.git.christophe.leroy@csgroup.eu>
References: <bbc196451dd34521d239023ccca488db35b8fff1.1643567900.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/ptdump: Fix sparse warning in hashpagetable.c
Message-Id: <164490279413.270256.17140116336898117103.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:34 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 30 Jan 2022 18:39:18 +0000, Christophe Leroy wrote:
>   arch/powerpc/mm/ptdump/hashpagetable.c:264:29: warning: restricted __be64 degrades to integer
>   arch/powerpc/mm/ptdump/hashpagetable.c:265:49: warning: restricted __be64 degrades to integer
>   arch/powerpc/mm/ptdump/hashpagetable.c:267:36: warning: incorrect type in assignment (different base types)
>   arch/powerpc/mm/ptdump/hashpagetable.c:267:36:    expected unsigned long long [usertype]
>   arch/powerpc/mm/ptdump/hashpagetable.c:267:36:    got restricted __be64 [usertype] v
>   arch/powerpc/mm/ptdump/hashpagetable.c:268:36: warning: incorrect type in assignment (different base types)
>   arch/powerpc/mm/ptdump/hashpagetable.c:268:36:    expected unsigned long long [usertype]
>   arch/powerpc/mm/ptdump/hashpagetable.c:268:36:    got restricted __be64 [usertype] r
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ptdump: Fix sparse warning in hashpagetable.c
      https://git.kernel.org/powerpc/c/961f649fb3ad9a9e384c695a050d776d970ddabd

cheers
