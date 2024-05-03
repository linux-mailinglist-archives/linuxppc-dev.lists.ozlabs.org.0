Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EE88BAAF5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 12:45:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW6rY1kGgz3dVx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 20:45:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW6nf0vGrz2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 20:42:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VW6nf008nz4xM5;
	Fri,  3 May 2024 20:42:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240419115913.3317575-1-mpe@ellerman.id.au>
References: <20240419115913.3317575-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/dart: Drop unnecessary call to kmemleak_no_scan()
Message-Id: <171473286293.451432.5977353003119585563.b4-ty@ellerman.id.au>
Date: Fri, 03 May 2024 20:41:02 +1000
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
Cc: erhard_f@mailbox.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Apr 2024 21:59:13 +1000, Michael Ellerman wrote:
> Erhard reported that kmemleak was showing a warning at boot:
> 
>   kmemleak: Not scanning unknown object at 0xc00000007f000000
>   CPU: 0 PID: 0 Comm: swapper Not tainted 5.19.0-rc3-PMacG5+ #2
>   Call Trace:
>    .dump_stack_lvl+0x7c/0xc4 (unreliable)
>    .kmemleak_no_scan+0xe0/0x100
>    .iommu_init_early_dart+0x2f0/0x924
>    .pmac_probe+0x1b0/0x20c
>    .setup_arch+0x1b8/0x674
>    .start_kernel+0xdc/0xb74
>    start_here_common+0x1c/0x44
>   DART table allocated at: (____ptrval____)
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/dart: Drop unnecessary call to kmemleak_no_scan()
      https://git.kernel.org/powerpc/c/4ccae23609f589dd69a593f457f76ee8b0e2d4e0

cheers
