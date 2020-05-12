Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE821CF6E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 16:20:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49M0Lv6QX8zDqlS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 00:20:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=catalin.marinas@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 49M0Hz4vXszDqSZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 00:17:33 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30DF230E;
 Tue, 12 May 2020 07:17:31 -0700 (PDT)
Received: from gaia (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 032BB3F71E;
 Tue, 12 May 2020 07:17:29 -0700 (PDT)
Date: Tue, 12 May 2020 15:17:23 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH] powerpc/kvm: silence kmemleak false positives
Message-ID: <20200512141723.GB14943@gaia>
References: <87y2pybu38.fsf@mpe.ellerman.id.au>
 <44807D44-98D9-431C-9266-08014C4B47F6@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44807D44-98D9-431C-9266-08014C4B47F6@lca.pw>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 11, 2020 at 07:43:30AM -0400, Qian Cai wrote:
> On May 11, 2020, at 7:15 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> > There is kmemleak_alloc_phys(), which according to the docs can be used
> > for tracking a phys address.
> > 
> > Did you try that?
> 
> Catalin, feel free to give your thoughts here.
> 
> My understanding is that it seems the doc is a bit misleading.
> kmemleak_alloc_phys() is to allocate kmemleak objects for a physical
> address range, so  kmemleak could scan those memory pointers within
> for possible referencing other memory. It was only used in memblock so
> far, but those new memory allocations here contain no reference to
> other memory.
> 
> In this case, we have already had kmemleak objects for those memory
> allocation. It is just that other pointers reference those memory by
> their physical address which is a known kmemleak limitation won’t be
> able to track the the connection. Thus, we always use
> kmemleak_ignore() to not reporting those as leaks and don’t scan those
> because they do not contain other memory reference.

Indeed. I replied directly to Michael along the same lines.

-- 
Catalin
