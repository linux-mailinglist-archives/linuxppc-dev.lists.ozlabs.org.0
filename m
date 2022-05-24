Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2205F532891
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:15:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6s7j11SGz2yhd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:15:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7N2ZQDz2yh9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7L1HTPz4xYX;
 Tue, 24 May 2022 21:15:26 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Reza Arbab <arbab@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220503170152.23412-1-arbab@linux.ibm.com>
References: <20220503170152.23412-1-arbab@linux.ibm.com>
Subject: Re: [PATCH] powerpc: Enable the DAWR on POWER9 DD2.3 and above
Message-Id: <165339059263.1718562.6276025985187883167.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:52 +1000
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
Cc: Michael Neuling <mikey@neuling.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 3 May 2022 12:01:52 -0500, Reza Arbab wrote:
> The hardware bug in POWER9 preventing use of the DAWR was fixed in
> DD2.3. Set the CPU_FTR_DAWR feature bit on these newer systems to start
> using it again, and update the documentation accordingly.
> 
> The CPU features for DD2.3 are currently determined by "DD2.2 or later"
> logic. In adding DD2.3 as a discrete case for the first time here, I'm
> carrying the quirks of DD2.2 forward to keep all behavior outside of
> this DAWR change the same. This leaves the assessment and potential
> removal of those quirks on DD2.3 for later.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Enable the DAWR on POWER9 DD2.3 and above
      https://git.kernel.org/powerpc/c/26b78c81e84c5133b299fb11bf17ec1a3d2ad217

cheers
