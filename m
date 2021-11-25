Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6E445D7A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 10:50:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Cmh2sqsz3cBl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 20:50:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0CjG5tZtz3cQP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 20:47:46 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0CjG2rdkz4xdS;
 Thu, 25 Nov 2021 20:47:46 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211116215806.928235-1-nathanl@linux.ibm.com>
References: <20211116215806.928235-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: kernel-doc fixes
Message-Id: <163783299298.1228879.8391991927384573552.b4-ty@ellerman.id.au>
Date: Thu, 25 Nov 2021 20:36:32 +1100
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Nov 2021 15:58:06 -0600, Nathan Lynch wrote:
> Fix the following issues reported by kernel-doc:
> 
> $ scripts/kernel-doc -v -none arch/powerpc/kernel/rtas.c
> arch/powerpc/kernel/rtas.c:810: info: Scanning doc for function rtas_activate_firmware
> arch/powerpc/kernel/rtas.c:818: warning: contents before sections
> arch/powerpc/kernel/rtas.c:841: info: Scanning doc for function rtas_call_reentrant
> arch/powerpc/kernel/rtas.c:893: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Find a specific pseries error log in an RTAS extended event log.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/rtas: kernel-doc fixes
      https://git.kernel.org/powerpc/c/53cadf7deee0ce65d7c33770b7810c98a2a0ee6a

cheers
