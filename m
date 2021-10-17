Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D16A4308B3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 14:33:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXKDc0Rs4z3cP7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 23:33:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXKCn35hbz2yYd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Oct 2021 23:32:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXKCl3Qcxz4xbL;
 Sun, 17 Oct 2021 23:32:51 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20211007075121.28497-1-atrajeev@linux.vnet.ibm.com>
References: <20211007075121.28497-1-atrajeev@linux.vnet.ibm.com>
Subject: Re: [V2] powerpc/perf: Fix cycles/instructions as PM_CYC/PM_INST_CMPL
 in power10
Message-Id: <163447392991.1159469.14557180203895744207.b4-ty@ellerman.id.au>
Date: Sun, 17 Oct 2021 23:32:09 +1100
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
 linuxppc-dev@lists.ozlabs.org, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 7 Oct 2021 13:21:21 +0530, Athira Rajeev wrote:
> From: Athira Rajeev <atrajeev@linux.vnet.ibm.cm>
> 
> In power9 and before platforms, the default event used for cyles and
> instructions is PM_CYC (0x0001e) and PM_INST_CMPL (0x00002) respectively.
> These events uses two programmable PMCs and by default will count
> irrespective of the run latch state. But since it is using programmable
> PMCs, these events will cause multiplexing with basic event set supported
> by perf stat. Hence in power10, performance monitoring unit (PMU) driver
> uses performance monitor counter 5 (PMC5) and performance monitor counter6
> (PMC6) for counting instructions and cycles.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf: Fix cycles/instructions as PM_CYC/PM_INST_CMPL in power10
      https://git.kernel.org/powerpc/c/8f6aca0e0f26eaaee670cd27896993a45cdc8f9e

cheers
