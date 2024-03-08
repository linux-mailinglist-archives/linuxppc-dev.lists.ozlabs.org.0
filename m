Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C405A875BFA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 02:30:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrTBn3zpnz3vfd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 12:30:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrT9z1kZCz3bZ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 12:29:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TrT9w5tqwz4wcT;
	Fri,  8 Mar 2024 12:29:56 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240301101035.1230024-1-mpe@ellerman.id.au>
References: <20240301101035.1230024-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Fix fpu_signal failures
Message-Id: <170986134195.348034.9863566992105017974.b4-ty@ellerman.id.au>
Date: Fri, 08 Mar 2024 12:29:01 +1100
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
Cc: spoorthy@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 01 Mar 2024 21:10:35 +1100, Michael Ellerman wrote:
> My recent commit e5d00aaac651 ("selftests/powerpc: Check all FPRs in
> fpu_preempt") inadvertently broke the fpu_signal test.
> 
> It needs to take into account that fpu_preempt now loads 32 FPRs, so
> enlarge darray.
> 
> Also use the newly added randomise_darray() to properly randomise darray.
> 
> [...]

Applied to powerpc/fixes.

[1/1] selftests/powerpc: Fix fpu_signal failures
      https://git.kernel.org/powerpc/c/380cb2f4df78433f64847cbc655fad2650e4769c

cheers
