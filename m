Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C71AF30D9C5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:28:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW1DX0rM6zF26v
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 23:28:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW09Y2gz9zDwt7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:33 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW09X2Ypnz9vFw; Wed,  3 Feb 2021 22:40:30 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 mpe@ellerman.id.au
In-Reply-To: <20210128104143.70668-1-ganeshgr@linux.ibm.com>
References: <20210128104143.70668-1-ganeshgr@linux.ibm.com>
Subject: Re: [PATCH v5 1/2] powerpc/mce: Reduce the size of event arrays
Message-Id: <161235200820.1516112.8436415234351555587.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:30 +1100 (AEDT)
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 28 Jan 2021 16:11:42 +0530, Ganesh Goudar wrote:
> Maximum recursive depth of MCE is 4, Considering the maximum depth
> allowed reduce the size of event to 10 from 100. This saves us ~19kB
> of memory and has no fatal consequences.

Applied to powerpc/next.

[1/2] powerpc/mce: Reduce the size of event arrays
      https://git.kernel.org/powerpc/c/17c5cf0fb993e219bda4f53aa9ec90d3cfcf92ab
[2/2] powerpc/mce: Remove per cpu variables from MCE handlers
      https://git.kernel.org/powerpc/c/923b3cf00b3ffc896543bac99affc0fa8553e41a

cheers
