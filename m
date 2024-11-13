Return-Path: <linuxppc-dev+bounces-3138-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 822619C6996
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 07:59:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpDfN2xxHz2y8V;
	Wed, 13 Nov 2024 17:59:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731481148;
	cv=none; b=CwEemGhfWKDBAFXDpdTGNuJddqz9tpZtmMh/DUARPa2JFnN+gKfxTXgRyGwmrhsoSQBlKMaI+fnts5CNZ+doMHAhH/Qkay24VDbiItcskPU4TpsFrUZ1VS4Pd3U1n2rcsdenA+xOOJe6fnCn7hFWiM9Kk5UOtV75LnfkWfFdqopZeafAzDmbQ58urusxTDU8ZcV5Vdh3LlHdH84y4HMtXeTcDt2CA+i6cgB8IlIaI32iXSYuJUwS67w3mE6GJsS1f7nXrR8DvbQjFx+mxIY4aOF+Cluy6ZcMreeQmfa2D0l0JWlJP9DKhKWOth2l0dikFgVSatOXAjLQZ8xM4UtAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731481148; c=relaxed/relaxed;
	bh=4+IjrItEnmM1Ft064149oqvafYbtLXx8CF8pkXFZNZQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=owYguW5wqGUhyYS1ROx17OnrMCzY/lZvGgMDt9vlE+QSgoYoA15s+nLsV5uDxMDz5U/CXG4rg07bg+Zc9pncfOA44qpvTcupa3PTr1msIX3ppCBexaDQnlJoeTE1q8UvdtfBfJWgq+CzkD6OjANMt0zRAx1YrTIrAGJ2yESbmsxDSZDygJbJAGKCNp3j6xWjBU7VlIFa8M6mytkKN3pFnwNkYY7fGsdalazcMCppccKBR72nthaKeJWlPqLqJzTlIyQq9l1Rph/EZB053wtJoZcePGUmxw3PbxdPPTFQnl7X4Qi0OVY92lSgKj7w3N9jSHC3hrfOoDFUnsIdESor0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=yfjxYDHY; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=yfjxYDHY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpDfM1xrJz2xWT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 17:59:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F368AA40286;
	Wed, 13 Nov 2024 06:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D40C4CED0;
	Wed, 13 Nov 2024 06:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1731481143;
	bh=cVitClo5nRCBuMhUk5E/ANZSQvCkEAI1V3dKH5MbYt4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=yfjxYDHY+66a6yzeaEzS6U2vHqvLjdcnS2yWMkLZKPPl6kdMFcTg+0FKBSpTB3UVp
	 PW7XVxMKPki452DV2FgLy1TwvASS1aS5BO41qG7UYo90I4yuLIPmTUGXTnc0SN2vm4
	 asgG3aXDqDPQ8l0VP1V1HQ3feFsKSVLJpY6gIJ3E=
Date: Tue, 12 Nov 2024 22:59:02 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Sourabh Jain
 <sourabhjain@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Zi Yan
 <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mahesh J
 Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.vnet.ibm.com>, LKML
 <linux-kernel@vger.kernel.org>, Sachin P Bappalige <sachinpb@linux.ibm.com>
Subject: Re: [RFC v3 -next] cma: Enforce non-zero pageblock_order during
 cma_init_reserved_mem()
Message-Id: <20241112225902.f20215e5015f4d7cdf502302@linux-foundation.org>
In-Reply-To: <054b416302486c2d3fdd5924b624477929100bf6.1728656994.git.ritesh.list@gmail.com>
References: <054b416302486c2d3fdd5924b624477929100bf6.1728656994.git.ritesh.list@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 11 Oct 2024 20:26:09 +0530 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com> wrote:

> cma_init_reserved_mem() checks base and size alignment with
> CMA_MIN_ALIGNMENT_BYTES. However, some users might call this during
> early boot when pageblock_order is 0.

This sounds like "some users" are in error.  Please tell us precisely
which users we're talking about here.

Is there a startup ordering issue here?  It feels like a bad idea to
work around callers' flaws within the callee.

Please also describe the userspace-visible effects of this.  Because it
might be the case that we will want to backport any fix into earlier
kernels, and we shouldn't do that until we know how those kernels will
benefit.

And to aid all of this, please attempt to identify a Fixes: target, to
aid others in identifying which kernel version(s) need patching.

Please answer all the above in the next (non-RFC!) version's changelog.

Meanwhile, I'll queue up this version for some testing.

Thanks.

