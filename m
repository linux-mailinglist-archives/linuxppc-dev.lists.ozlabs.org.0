Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2389734F82C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 06:59:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9DcQ6bR1z3c9D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 15:59:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=vSoQ47XO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=vSoQ47XO; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9Dc20V2Yz2xxn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 15:58:42 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4F9Dc15vyQz9sWX; Wed, 31 Mar 2021 15:58:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1617166721; bh=1Jp2PVYuBwxl9vR5J6ojXLJS2rIfGO+/7iEhzEz4i1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vSoQ47XO0dYsl0+qzBNZxQdkJD6eb8YSctBF9MF5c5z8E0O65eE2BpsvvntgrZDca
 1aPkpWlPW2BJsfnkzQo8Da44xc0yq0BG1mMZpw4i4SCWq7bUEAO+cT3QrR3yQ9SYqE
 1bC7TOqqPjxMjEyjqI/OlV+ELiQXxdNrPOlz9uA1QFEUg7mwC3432daWIddv473Stg
 PwOkLH4zGfPPmVfu7uDG8yKCPR48ybjYGJHz27HQHy1718HBb9BsUyLHQnEHGXKj1R
 DMCjv/ukgdYSBZz4GnplBj7/ncF/unU9L2KOgftl6diMmItBDWmDpIXq9oxB7ry8sw
 GTo7EfSqmw7Yg==
Date: Wed, 31 Mar 2021 15:58:29 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 11/46] KVM: PPC: Book3S HV: Ensure MSR[HV] is always
 clear in guest MSR
Message-ID: <YGQBdVntWnG/ewtj@thinks.paulus.ozlabs.org>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-12-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323010305.1045293-12-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 23, 2021 at 11:02:30AM +1000, Nicholas Piggin wrote:
> Rather than clear the HV bit from the MSR at guest entry, make it clear
> that the hypervisor does not allow the guest to set the bit.
> 
> The HV clear is kept in guest entry for now, but a future patch will
> warn if it's not present.

Will warn if it *is* present, surely?

> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Acked-by: Paul Mackerras <paulus@ozlabs.org>
