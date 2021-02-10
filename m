Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C0E31676C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 14:04:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbKjX44C3zDvbg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 00:04:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbKY15fPxzDr2w
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 23:57:24 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbKXx50djz9sW2; Wed, 10 Feb 2021 23:57:21 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: acme@kernel.org, jolsa@kernel.org,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <1612335337-1888-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1612335337-1888-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] powerpc/perf: Add Performance Monitor Counters to
 extended regs
Message-Id: <161296172072.3178259.17210261647266833001.b4-ty@ellerman.id.au>
Date: Wed, 10 Feb 2021 23:57:21 +1100 (AEDT)
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 3 Feb 2021 01:55:34 -0500, Athira Rajeev wrote:
> Patch set to add Performance Monitor Counter SPR's as
> part of extended regs in powerpc.
> 
> Patch 1/3 saves the PMC values in the perf interrupt
> handler as part of per-cpu array.
> Patch 2/3 adds PMC1 to PMC6 as part of the extended
> regs mask.
> Patch 3/3 includes perf tools side changes to add
> PMC1 to PMC6 to sample_reg_mask to use with -I? option.
> 
> [...]

Patches 1 & 2 applied to powerpc/next.

[1/3] powerpc/perf: Include PMCs as part of per-cpu cpuhw_events struct
      https://git.kernel.org/powerpc/c/91f3469a43fd1fb831649c2a2e684bf5ad4818b2
[2/3] powerpc/perf: Expose Performance Monitor Counter SPR's as part of extended regs
      https://git.kernel.org/powerpc/c/e79b76e03b712e42c58d9649c92571e346abc38b

cheers
