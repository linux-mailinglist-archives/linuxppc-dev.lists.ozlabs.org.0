Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53761297BD5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 12:32:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJHTt2QvRzDqXr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 21:32:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJHNt4GgczDqlR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Oct 2020 21:27:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CJHNt3PVzz9sVD; Sat, 24 Oct 2020 21:27:58 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Jordan Niethe <jniethe5@gmail.com>
In-Reply-To: <20200827035529.900-1-jniethe5@gmail.com>
References: <20200827035529.900-1-jniethe5@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Remove TM from Power10 features
Message-Id: <160353524000.3419015.13643609591414847651.b4-ty@ellerman.id.au>
Date: Sat, 24 Oct 2020 21:27:58 +1100 (AEDT)
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

On Thu, 27 Aug 2020 13:55:29 +1000, Jordan Niethe wrote:
> ISA v3.1 removes transactional memory and hence it should not be present
> in cpu_features or cpu_user_features2. Remove CPU_FTR_TM_COMP from
> CPU_FTRS_POWER10. Remove PPC_FEATURE2_HTM_COMP and
> PPC_FEATURE2_HTM_NOSC_COMP from COMMON_USER2_POWER10.

Applied to powerpc/fixes.

[1/1] powerpc/64s: Remove TM from Power10 features
      https://git.kernel.org/powerpc/c/ec613a57fa1d57381f890c3166175fe68cf43f12

cheers
