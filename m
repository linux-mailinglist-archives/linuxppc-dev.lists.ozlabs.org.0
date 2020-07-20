Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3072261C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 16:18:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9P2T5sX5zDqhY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 00:17:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9NyD5GqdzDqZ9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 00:14:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B9NyD2Sgbz9sSt; Tue, 21 Jul 2020 00:14:12 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Bharata B Rao <bharata@linux.ibm.com>
In-Reply-To: <20200720044258.863574-1-bharata@linux.ibm.com>
References: <20200720044258.863574-1-bharata@linux.ibm.com>
Subject: Re: [FIX PATCH] powerpc/prom: Enable Radix GTSE in cpu pa-features
Message-Id: <159525443393.413344.4905765969586189810.b4-ty@ellerman.id.au>
Date: Tue, 21 Jul 2020 00:14:12 +1000 (AEST)
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
Cc: aneesh.kumar@linux.ibm.com, Qian Cai <cai@lca.pw>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 Jul 2020 10:12:58 +0530, Bharata B Rao wrote:
> When '029ab30b4c0a ("powerpc/mm: Enable radix GTSE only if supported.")'
> made GTSE an MMU feature, it was enabled by default in
> powerpc-cpu-features but was missed in pa-features. This causes
> random memory corruption during boot of PowerNV kernels where
> CONFIG_PPC_DT_CPU_FTRS isn't enabled.

Applied to powerpc/next.

[1/1] powerpc/prom: Enable Radix GTSE in cpu pa-features
      https://git.kernel.org/powerpc/c/9a77c4a0a12597c661be374b8d566516c0341570

cheers
