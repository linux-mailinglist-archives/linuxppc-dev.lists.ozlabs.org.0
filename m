Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 764484B62B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:30:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyV6R0JrLz3cZT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:30:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV5z4xXrz30Dg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:29:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV5y05q0z4xcq;
 Tue, 15 Feb 2022 16:29:57 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20220202041837.65968-1-atrajeev@linux.vnet.ibm.com>
References: <20220202041837.65968-1-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] powerpc/perf: Fix task context setting for trace imc
Message-Id: <164490280012.270256.7699328630431193909.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:40 +1100
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
Cc: kjain@linux.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Feb 2022 09:48:37 +0530, Athira Rajeev wrote:
> Trace IMC (In-Memory collection counters) in powerpc is
> useful for application level profiling. For trace_imc,
> presently task context (task_ctx_nr) is set to
> perf_hw_context. But perf_hw_context is to be used for
> cpu PMU. So for trace_imc, even though it is per thread
> PMU, it is preferred to use sw_context inorder to be able
> to do application level monitoring. Hence change the
> task_ctx_nr to use perf_sw_context.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf: Fix task context setting for trace imc
      https://git.kernel.org/powerpc/c/0198322379c25215b2778482bf1221743a76e2b5

cheers
