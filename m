Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3F434D18D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 15:41:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8DHg4z4yz2yxn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 00:41:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8DHM4nwcz2yxc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 00:40:46 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F8DHC1pQJz9sVS; Tue, 30 Mar 2021 00:40:39 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20210326070755.304625-1-aneesh.kumar@linux.ibm.com>
References: <20210326070755.304625-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mm/book3s64: Use the correct storage key value
 when calling H_PROTECT
Message-Id: <161702520473.3080836.1729450250731388537.b4-ty@ellerman.id.au>
Date: Tue, 30 Mar 2021 00:40:04 +1100
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
Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 26 Mar 2021 12:37:55 +0530, Aneesh Kumar K.V wrote:
> H_PROTECT expect the flag value to include
> flags: AVPN, pp0, pp1, pp2, key0-key4, Noexec, CMO Option flags
> 
> This patch updates hpte_updatepp() to fetch the storage key value from the linux page
> table and use the same in H_PROTECT hcall.
> 
> native_hpte_updatepp() is not updated because the kernel doesn't clear the existing
> storage key value there. The kernel also doesn't use hpte_updatepp() callback for
> updating storage keys.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/mm/book3s64: Use the correct storage key value when calling H_PROTECT
      https://git.kernel.org/powerpc/c/53f1d31708f6240e4615b0927df31f182e389e2f

cheers
