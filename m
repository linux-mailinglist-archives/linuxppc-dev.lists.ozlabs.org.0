Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB6655FF53
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 14:14:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY0lC6wnTz3dpS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 22:14:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY0kp0rXFz3bmM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 22:14:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LY0kn4Hmbz4xZB;
	Wed, 29 Jun 2022 22:14:25 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <20220627191119.142867-1-naveen.n.rao@linux.vnet.ibm.com>
References: <20220627191119.142867-1-naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH powerpc v2] powerpc/bpf: Fix use of user_pt_regs in uapi
Message-Id: <165650484996.3003821.13352352877965822708.b4-ty@ellerman.id.au>
Date: Wed, 29 Jun 2022 22:14:09 +1000
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jun 2022 00:41:19 +0530, Naveen N. Rao wrote:
> Trying to build a .c file that includes <linux/bpf_perf_event.h>:
>   $ cat test_bpf_headers.c
>   #include <linux/bpf_perf_event.h>
> 
> throws the below error:
>   /usr/include/linux/bpf_perf_event.h:14:28: error: field ‘regs’ has incomplete type
>      14 |         bpf_user_pt_regs_t regs;
> 	|                            ^~~~
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/bpf: Fix use of user_pt_regs in uapi
      https://git.kernel.org/powerpc/c/b21bd5a4b130f8370861478d2880985daace5913

cheers
