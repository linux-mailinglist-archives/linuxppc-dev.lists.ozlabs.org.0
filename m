Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 218C61DB164
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 13:20:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rqzz2Vx0zDqL8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 21:20:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RqXP2F3TzDqdt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 21:00:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 49RqXN44mvz9sV7; Wed, 20 May 2020 21:00:04 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49RqXM6zl7z9sVM; Wed, 20 May 2020 21:00:03 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200426114410.3917383-1-mpe@ellerman.id.au>
References: <20200426114410.3917383-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Add a test of counting larx/stcx
Message-Id: <158997214003.943180.6678728141176435831.b4-ty@ellerman.id.au>
Date: Wed, 20 May 2020 21:00:03 +1000 (AEST)
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

On Sun, 26 Apr 2020 21:44:10 +1000, Michael Ellerman wrote:
> This is based on the count_instructions test.
> 
> However this one also counts the number of failed stcx's, and in
> conjunction with knowing the size of the stcx loop, can calculate the
> total number of instructions executed even in the face of
> non-deterministic stcx failures.

Applied to powerpc/next.

[1/1] selftests/powerpc: Add a test of counting larx/stcx
      https://git.kernel.org/powerpc/c/7481cad4747303442209bc5dba2f56c3afcea07d

cheers
