Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AD739FC40
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 18:20:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzwSv4Zbdz3c1r
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 02:20:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Be8aPjdZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Be8aPjdZ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzwSV3f50z2xtk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Jun 2021 02:20:10 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46D7A6128E;
 Tue,  8 Jun 2021 16:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623169206;
 bh=qkkyaNSTG8jKDhH3l2/+Ytp2W/YqYbwhA582jK1SRa0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Be8aPjdZ0EtnXdxKyRzx3MB64aOGcU7P5UxQ60lFZJ+Mi3PrAXxve5Kh7ozb6Tst1
 qvq7+rUkGafYRbTp1qyWzVF2n74c0jxpemsTz89k34Sg5GKkitFEgkg/Hy8xQTBO/G
 4Lk64TKYlnvU5TH0F2//tJ9AAIFZwe3CqujZmuLOImNtMXGTiLdshYsjGnuiYZT7Vm
 reo0ICVt6+1ECIYZjX5QbWJ/c1/dTnob5vROygOAmKdZSOrmAwcSFXqsTDg4EbYUTY
 lA/Rbq8XmdekAwv73UgdeNdNqpVAQy91fVbb2tohvlwpmV1x1nhF3fPrwidswlVRB9
 DfX8/CWS7kisg==
Subject: Re: [PATCH v4 2/4] lazy tlb: allow lazy tlb mm refcounting to be
 configurable
To: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20210605014216.446867-1-npiggin@gmail.com>
 <20210605014216.446867-3-npiggin@gmail.com>
From: Andy Lutomirski <luto@kernel.org>
Message-ID: <8ac1d420-b861-f586-bacf-8c3949e9b5c4@kernel.org>
Date: Tue, 8 Jun 2021 09:20:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210605014216.446867-3-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/4/21 6:42 PM, Nicholas Piggin wrote:
> Add CONFIG_MMU_TLB_REFCOUNT which enables refcounting of the lazy tlb mm
> when it is context switched. This can be disabled by architectures that
> don't require this refcounting if they clean up lazy tlb mms when the
> last refcount is dropped. Currently this is always enabled, which is
> what existing code does, so the patch is effectively a no-op.
> 
> Rename rq->prev_mm to rq->prev_lazy_mm, because that's what it is.

I am in favor of this approach, but I would be a lot more comfortable
with the resulting code if task->active_mm were at least better
documented and possibly even guarded by ifdefs.

x86 bare metal currently does not need the core lazy mm refcounting, and
x86 bare metal *also* does not need ->active_mm.  Under the x86 scheme,
if lazy mm refcounting were configured out, ->active_mm could become a
dangling pointer, and this makes me extremely uncomfortable.

So I tend to think that, depending on config, the core code should
either keep ->active_mm [1] alive or get rid of it entirely.

[1] I don't really think it belongs in task_struct at all.  It's not a
property of the task.  It's the *per-cpu* mm that the core code is
keeping alive for lazy purposes.  How about consolidating it with the
copy in rq?

I guess the short summary of my opinion is that I like making this
configurable, but I do not like the state of the code.

--Andy
