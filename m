Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 682C46D8C99
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 03:14:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsNnp1wDcz3fWB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 11:14:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsNjr6Tk3z3cLx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 11:11:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PsNjr5kM9z4xFj;
	Thu,  6 Apr 2023 11:11:12 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Miehlbradt <nicholas@linux.ibm.com>
In-Reply-To: <20230228054355.300628-1-nicholas@linux.ibm.com>
References: <20230228054355.300628-1-nicholas@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc: Implement arch_within_stack_frames
Message-Id: <168074339917.3678997.7175238870685255123.b4-ty@ellerman.id.au>
Date: Thu, 06 Apr 2023 11:09:59 +1000
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
Cc: ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Feb 2023 05:43:55 +0000, Nicholas Miehlbradt wrote:
> Walks the stack when copy_{to,from}_user address is in the stack to
> ensure that the object being copied is entirely a single stack frame and
> does not contain stack metadata.
> 
> Substantially similar to the x86 implementation. The back chain is used
> to traverse the stack and identify stack frame boundaries.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Implement arch_within_stack_frames
      https://git.kernel.org/powerpc/c/ac9c8901cb10aab043bf3599d19eebacfcda2858

cheers
