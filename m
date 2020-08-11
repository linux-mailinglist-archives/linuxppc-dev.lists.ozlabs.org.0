Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89150241AFF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 14:34:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQshy4DvdzDqSg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 22:34:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQsf61WhXzDqQT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 22:31:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BQsf55W6Cz9sTW; Tue, 11 Aug 2020 22:31:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20200810102623.685083-1-aneesh.kumar@linux.ibm.com>
References: <20200810102623.685083-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pkeys: Fix boot failures with Nemo board (A-EON
 AmigaOne X1000)
Message-Id: <159714911022.583238.11748748466989507794.b4-ty@ellerman.id.au>
Date: Tue, 11 Aug 2020 22:31:57 +1000 (AEST)
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
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 10 Aug 2020 15:56:23 +0530, Aneesh Kumar K.V wrote:
> On p6 and before we should avoid updating UAMOR SPRN. This resulted
> in boot failure on Nemo board.

Applied to powerpc/fixes.

[1/1] powerpc/pkeys: Fix boot failures with Nemo board (A-EON AmigaOne X1000)
      https://git.kernel.org/powerpc/c/6553fb799f601497ca0703682e2aff131197dc5c

cheers
