Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7274C442D15
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:47:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7SR2swgz3g0T
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:47:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7Fx5gzrz304j
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:45 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7Fx4b6Gz4xdV;
 Tue,  2 Nov 2021 22:38:45 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20211013213438.675095-1-joel@jms.id.au>
References: <20211013213438.675095-1-joel@jms.id.au>
Subject: Re: [PATCH v2] powerpc/s64: Clarify that radix lacks DEBUG_PAGEALLOC
Message-Id: <163584789184.1845480.3901073706381572578.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:11:31 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 14 Oct 2021 08:04:38 +1030, Joel Stanley wrote:
> The page_alloc.c code will call into __kernel_map_pages when
> DEBUG_PAGEALLOC is configured and enabled.
> 
> As the implementation assumes hash, this should crash spectacularly if
> not for a bit of luck in __kernel_map_pages. In this function
> linear_map_hash_count is always zero, the for loop exits without doing
> any damage.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/s64: Clarify that radix lacks DEBUG_PAGEALLOC
      https://git.kernel.org/powerpc/c/4f703e7faa67a116016c4678fc88b507c12670c9

cheers
