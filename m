Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A034545A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 12:25:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvLGC6dqKz3c5g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 22:25:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvLFr4wL3z2xSH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 22:25:36 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HvLFq2hpwz4xbH;
 Wed, 17 Nov 2021 22:25:35 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20211108040320.3857636-1-aik@ozlabs.ru>
References: <20211108040320.3857636-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel 0/3] powerpc/pseries/ddw: Fixes for persistent
 memory case
Message-Id: <163714821436.1508509.15353263275248043941.b4-ty@ellerman.id.au>
Date: Wed, 17 Nov 2021 22:23:34 +1100
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Leonardo Bras <leobras.c@gmail.com>, Brian King <brking@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 8 Nov 2021 15:03:16 +1100, Alexey Kardashevskiy wrote:
> This is based on sha1
> f855455dee0b Michael Ellerman "Automatic merge of 'next' into merge (2021-11-05 22:19)".
> 
> Please comment. Thanks.
> 
> 
> 
> [...]

Applied to powerpc/fixes.

[1/3] powerpc/pseries/ddw: Revert "Extend upper limit for huge DMA window for persistent memory"
      https://git.kernel.org/powerpc/c/2d33f5504490a9d90924476dbccd4a5349ee1ad0
[2/3] powerpc/pseries/ddw: simplify enable_ddw()
      https://git.kernel.org/powerpc/c/fb4ee2b30cd09e95524640149e4ee0d7f22c3e7b
[3/3] powerpc/pseries/ddw: Do not try direct mapping with persistent memory and one window
      https://git.kernel.org/powerpc/c/ad3976025b311cdeb822ad3e7a7554018cb0f83f

cheers
