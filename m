Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C3B3167FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 14:27:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbLDC1CpTzDvbh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 00:27:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbKY34qTzzDr2w
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 23:57:27 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbKXy4HVgz9sS8; Wed, 10 Feb 2021 23:57:22 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <1612516492-1428-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1612516492-1428-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V2] powerpc/perf: Record counter overflow always if
 SAMPLE_IP is unset
Message-Id: <161296172306.3178259.2351405924746629740.b4-ty@ellerman.id.au>
Date: Wed, 10 Feb 2021 23:57:22 +1100 (AEDT)
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
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 5 Feb 2021 04:14:52 -0500, Athira Rajeev wrote:
> While sampling for marked events, currently we record the sample only
> if the SIAR valid bit of Sampled Instruction Event Register (SIER) is
> set. SIAR_VALID bit is used for fetching the instruction address from
> Sampled Instruction Address Register(SIAR). But there are some usecases,
> where the user is interested only in the PMU stats at each counter
> overflow and the exact IP of the overflow event is not required.
> Dropping SIAR invalid samples will fail to record some of the counter
> overflows in such cases.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf: Record counter overflow always if SAMPLE_IP is unset
      https://git.kernel.org/powerpc/c/d137845c973147a22622cc76c7b0bc16f6206323

cheers
