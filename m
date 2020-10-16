Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BA52903BD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 13:04:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCNb70fZJzDqxf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 22:04:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCNWv0DBMzDqYX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 22:02:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CCNWt4JGbz9sTv; Fri, 16 Oct 2020 22:02:02 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201014024711.1138386-1-oohall@gmail.com>
References: <20201014024711.1138386-1-oohall@gmail.com>
Subject: Re: [PATCH] selftests/powerpc: Fix eeh-basic.sh exit codes
Message-Id: <160284610607.1777686.10903297249798635302.b4-ty@ellerman.id.au>
Date: Fri, 16 Oct 2020 22:02:02 +1100 (AEDT)
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

On Wed, 14 Oct 2020 13:47:11 +1100, Oliver O'Halloran wrote:
> The kselftests test running infrastructure expects tests to finish with an
> exit code of 4 if the test decided it should be skipped. Currently
> eeh-basic.sh exits with the number of devices that failed to recover, so if
> four devices didn't recover we'll report a skip instead of a fail.
> 
> Fix this by checking if the return code is non-zero and report success
> and failure by returning 0 or 1 respectively. For the cases where should
> actually skip return 4.

Applied to powerpc/next.

[1/1] selftests/powerpc: Fix eeh-basic.sh exit codes
      https://git.kernel.org/powerpc/c/996f9e0f93f16211945c8d5f18f296a88cb32f91

cheers
