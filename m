Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A6878577E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:05:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4g81p9Cz3dhd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:05:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4cb3ZJ9z2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:03:43 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4cb2JwRz4wy4;
	Wed, 23 Aug 2023 22:03:43 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <20230725005841.28854-1-bgray@linux.ibm.com>
References: <20230725005841.28854-1-bgray@linux.ibm.com>
Subject: Re: (subset) [PATCH v1 0/4] Improve ptrace selftest usability
Message-Id: <169279175563.797584.17410071728478653237.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
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

On Tue, 25 Jul 2023 10:58:37 +1000, Benjamin Gray wrote:
> While trying to test changes to the breakpoint implementation in the kernel, I
> tried to run the ptrace tests and met many unexplained skips and failures.
> 
> This series addresses the pain points of trying to run these tests and learn
> what they are doing.
> 
> Benjamin Gray (4):
>   Documentation/powerpc: Fix ptrace request names
>   selftests/powerpc/ptrace: Explain why tests are skipped
>   selftests/powerpc/ptrace: Fix typo in pid_max search error
>   selftests/powerpc/ptrace: Declare test temporary variables as volatile
> 
> [...]

Patch 1 applied to powerpc/next.

[1/4] Documentation/powerpc: Fix ptrace request names
      https://git.kernel.org/powerpc/c/0e216fa576e1cdea3913fe82b7283fdfb58c5c07

cheers
