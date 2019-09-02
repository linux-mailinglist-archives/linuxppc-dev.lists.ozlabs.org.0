Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D85DFA4D74
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 05:12:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MFWl4wQ8zDqbY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 13:12:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MFN75nZZzDqYj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 13:06:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46MFN73xhZz9sDB; Mon,  2 Sep 2019 13:06:15 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46MFN72Tz6z9sNF; Mon,  2 Sep 2019 13:06:15 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: dea45ea7775240047f70e2631e468f6b65d09493
In-Reply-To: <20190828130521.26764-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v4 1/2] powerpc/powernv/opal-msglog: Refactor memcons code
Message-Id: <46MFN72Tz6z9sNF@ozlabs.org>
Date: Mon,  2 Sep 2019 13:06:15 +1000 (AEST)
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
Cc: cclaudio@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-08-28 at 13:05:20 UTC, Michael Ellerman wrote:
> From: Claudio Carvalho <cclaudio@linux.ibm.com>
> 
> This patch refactors the code in opal-msglog that operates on the OPAL
> memory console in order to make it cleaner and also allow the reuse of
> the new memcons_* functions.
> 
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Series applied to powerpc topic/ppc-kvm.

https://git.kernel.org/powerpc/c/dea45ea7775240047f70e2631e468f6b65d09493

cheers
