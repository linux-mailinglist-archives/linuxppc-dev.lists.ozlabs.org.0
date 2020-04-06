Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2E219F6C8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 15:21:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wrlx33MrzDr8m
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 23:21:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wrPf04lNzDqbt
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 23:05:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48wrPW5nRgz9sSK; Mon,  6 Apr 2020 23:05:35 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a36e8ba60b991d563677227f172db69e030797e6
In-Reply-To: <20200313055238.8656-1-anju@linux.vnet.ibm.com>
To: Anju T Sudhakar <anju@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v4 1/2] powerpc/perf: Implement a global lock to avoid
 races between trace, core and thread imc events.
Message-Id: <48wrPW5nRgz9sSK@ozlabs.org>
Date: Mon,  6 Apr 2020 23:05:35 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, harihare@in.ibm.com,
 maddy@linux.vnet.ibm.com, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-03-13 at 05:52:37 UTC, Anju T Sudhakar wrote:
> IMC(In-memory Collection Counters) does performance monitoring in
> two different modes, i.e accumulation mode(core-imc and thread-imc events),
> and trace mode(trace-imc events). A cpu thread can either be in
> accumulation-mode or trace-mode at a time and this is done via the LDBAR
> register in POWER architecture. The current design does not address the
> races between thread-imc and trace-imc events.
> 
> Patch implements a global id and lock to avoid the races between
> core, trace and thread imc events. With this global id-lock
> implementation, the system can either run core, thread or trace imc
> events at a time. i.e. to run any core-imc events, thread/trace imc events
> should not be enabled/monitored.
> 
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a36e8ba60b991d563677227f172db69e030797e6

cheers
