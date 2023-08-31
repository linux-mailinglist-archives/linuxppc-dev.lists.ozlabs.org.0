Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7EF78E552
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 06:10:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RbnkN26bhz3f0Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 14:10:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RbncM4Q6cz30RV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 14:04:51 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RbncM3bgFz4x3k;
	Thu, 31 Aug 2023 14:04:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20230509091600.70994-1-npiggin@gmail.com>
References: <20230509091600.70994-1-npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/pseries: Fix hcall tracepoints with JUMP_LABEL=n
Message-Id: <169345455032.11824.91481275031519791.b4-ty@ellerman.id.au>
Date: Thu, 31 Aug 2023 14:02:30 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 09 May 2023 19:15:59 +1000, Nicholas Piggin wrote:
> With JUMP_LABEL=n, hcall_tracepoint_refcount's address is being tested
> instead of its value. This results in the tracing slowpath always being
> taken unnecessarily.
> 
> 

Applied to powerpc/next.

[1/2] powerpc/pseries: Fix hcall tracepoints with JUMP_LABEL=n
      https://git.kernel.org/powerpc/c/750bd41aeaeb1f0e0128aa4f8fcd6dd759713641
[2/2] powerpc/pseries: Remove unused hcall tracing instruction
      https://git.kernel.org/powerpc/c/61d7ebe0376e2640ba77be16e186b1a6c77eb3f7

cheers
