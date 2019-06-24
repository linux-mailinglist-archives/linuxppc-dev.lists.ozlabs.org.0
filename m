Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE2501C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 08:02:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XJc15MzszDqGg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 16:02:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 45XJN404RnzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 15:52:18 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA957344;
 Sun, 23 Jun 2019 22:52:15 -0700 (PDT)
Received: from [10.162.41.123] (p8cg001049571a15.blr.arm.com [10.162.41.123])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 BCCE93F718; Sun, 23 Jun 2019 22:54:01 -0700 (PDT)
Subject: Re: [PATCH 0/3] fix vmalloc_to_page for huge vmap mappings
To: Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org
References: <20190623094446.28722-1-npiggin@gmail.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <f8139999-1624-617a-b7a5-df2846e6e25b@arm.com>
Date: Mon, 24 Jun 2019 11:22:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190623094446.28722-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Nicholas,

On 06/23/2019 03:14 PM, Nicholas Piggin wrote:
> This is a change broken out from the huge vmap vmalloc series as
> requested. There is a little bit of dependency juggling across

Thanks for splitting up the previous series and sending this one out.


> trees, but patches are pretty trivial. Ideally if Andrew accepts
> this patch and queues it up for next, then the arch patches would
> be merged through those trees then patch 3 gets sent by Andrew.

Fair enough.

> 
> I've tested this with other powerpc and vmalloc patches, with code
> that explicitly tests vmalloc_to_page on vmalloced memory and
> results look fine.

- Anshuman


