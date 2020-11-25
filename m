Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8EB2C3F94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 13:09:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch07k3zXBzDqFJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 23:09:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgzsd0kcKzDqdW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 22:57:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cgzsc5H4Bz9sT6; Wed, 25 Nov 2020 22:57:40 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
In-Reply-To: <20201007053305.232879-1-aneesh.kumar@linux.ibm.com>
References: <20201007053305.232879-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/mm: Update tlbiel loop on POWER10
Message-Id: <160630540077.2174375.16552927002109921815.b4-ty@ellerman.id.au>
Date: Wed, 25 Nov 2020 22:57:40 +1100 (AEDT)
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Oct 2020 11:03:05 +0530, Aneesh Kumar K.V wrote:
> With POWER10, single tlbiel instruction invalidates all the congruence
> class of the TLB and hence we need to issue only one tlbiel with SET=0.

Applied to powerpc/next.

[1/1] powerpc/mm: Update tlbiel loop on POWER10
      https://git.kernel.org/powerpc/c/e80639405c40127727812a0e1f8a65ba9979f146

cheers
