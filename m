Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B5B745500
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:41:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZXs1XPBz3dsw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:41:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZPB1Mgjz3byX
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:34:38 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZPB0B09z4wy2;
	Mon,  3 Jul 2023 15:34:38 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Naveen N Rao <naveen@kernel.org>
In-Reply-To: <20230530061436.56925-1-naveen@kernel.org>
References: <20230530061436.56925-1-naveen@kernel.org>
Subject: Re: [PATCH v2] powerpc: Fail build if using recordmcount with binutils v2.37
Message-Id: <168836201907.50010.17773245679736568331.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:59 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 30 May 2023 11:44:36 +0530, Naveen N Rao wrote:
> binutils v2.37 drops unused section symbols, which prevents recordmcount
> from capturing mcount locations in sections that have no non-weak
> symbols. This results in a build failure with a message such as:
> 	Cannot find symbol for section 12: .text.perf_callchain_kernel.
> 	kernel/events/callchain.o: failed
> 
> The change to binutils was reverted for v2.38, so this behavior is
> specific to binutils v2.37:
> https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=c09c8b42021180eee9495bd50d8b35e683d3901b
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Fail build if using recordmcount with binutils v2.37
      https://git.kernel.org/powerpc/c/25ea739ea1d4d3de41acc4f4eb2d1a97eee0eb75

cheers
