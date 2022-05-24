Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E815328CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:21:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6sGY74yQz3dys
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:21:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7k43W2z3cCN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7k3J4fz4ySv;
 Tue, 24 May 2022 21:15:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220506061015.43916-1-kjain@linux.ibm.com>
References: <20220506061015.43916-1-kjain@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/perf: Fix the threshold compare group
 constraint for power10
Message-Id: <165339057636.1718562.13444860575931956627.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:36 +1000
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 6 May 2022 11:40:14 +0530, Kajol Jain wrote:
> Thresh compare bits for a event is used to program thresh compare
> field in Monitor Mode Control Register A (MMCRA: 8-18 bits for power10).
> When scheduling events as a group, all events in that group should
> match value in threshold bits. Otherwise event open for the sibling
> events should fail. But in the current code, incase thresh compare bits are
> not valid, we are not failing in group_constraint function which can result
> in invalid group schduling.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/perf: Fix the threshold compare group constraint for power10
      https://git.kernel.org/powerpc/c/505d31650ba96d6032313480fdb566d289a4698c
[2/2] powerpc/perf: Fix the threshold compare group constraint for power9
      https://git.kernel.org/powerpc/c/ab0cc6bbf0c812731c703ec757fcc3fc3a457a34

cheers
