Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 464178563E3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 14:02:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbFZl1fnTz3vvy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 00:02:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbFX53jZNz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 23:59:49 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TbFX52KYJz4wyt;
	Thu, 15 Feb 2024 23:59:49 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Naveen N Rao <naveen@kernel.org>
In-Reply-To: <20240202154316.395276-1-naveen@kernel.org>
References: <20240202154316.395276-1-naveen@kernel.org>
Subject: Re: [PATCH v2] powerpc/64: Set task pt_regs->link to the LR value on scv entry
Message-Id: <170800185780.599237.2766564369956645037.b4-ty@ellerman.id.au>
Date: Thu, 15 Feb 2024 23:57:37 +1100
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
Cc: "Nysal Jan K.A" <nysal@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 02 Feb 2024 21:13:16 +0530, Naveen N Rao wrote:
> Nysal reported that userspace backtraces are missing in offcputime bcc
> tool. As an example:
>     $ sudo ./bcc/tools/offcputime.py -uU
>     Tracing off-CPU time (us) of user threads by user stack... Hit Ctrl-C to end.
> 
>     ^C
> 	write
> 	-                python (9107)
> 	    8
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64: Set task pt_regs->link to the LR value on scv entry
      https://git.kernel.org/powerpc/c/aad98efd0b121f63a2e1c221dcb4d4850128c697

cheers
