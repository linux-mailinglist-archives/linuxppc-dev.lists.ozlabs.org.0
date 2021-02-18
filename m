Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6739231E88A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 11:47:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhBHQ3ttWz30MP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Feb 2021 21:47:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YqYRf21K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YqYRf21K; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhBH26lHnz30KT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 21:47:10 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DhBH15dZlz9sBy;
 Thu, 18 Feb 2021 21:47:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1613645230;
 bh=EKQFq6vpmkbDSEblNkTK4SHWV0oMhCYhSsyZaMd0VxM=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=YqYRf21KzNhnXhkea06tmykyfKq5MGeZBu28Tw0DNLix3/W2U02NqzskuCRofYVRI
 ihuHL6CFfUI5QSULFlhYPhveEfeZkeeCBC8BvpVxYVQ4J6ANpmSDA6Xi+n99Axnvnx
 zsu8vB1i6Q+tFG+ht4x7QV7bgCGwOJUFuL7BKMDLUhrldTW6CgSCo6WEgtCICh0IKq
 Ur/WkilsY8FzSy72BjtrIsh9oBtRoEs1QUBlze5iPX1vjwdAcZyCIaMvHZKYTS/qdE
 RcvYYXBKmerk/Ie5axLVtP+0IKFtORLtUCeO0NO2AmgHGSb6sQIJC4Oj9+8wZo+Bps
 7yVlJNJHwor4g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Christopher M. Riedl" <cmr@codefail.de>, Daniel Axtens
 <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 05/10] powerpc/signal64: Remove TM ifdefery in middle
 of if/else block
In-Reply-To: <C9C1XKNVRQC4.LHKIIQAIC3L7@oc8246131445.ibm.com>
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-6-cmr@codefail.de>
 <874kiheu93.fsf@dja-thinkpad.axtens.net>
 <C9C1XKNVRQC4.LHKIIQAIC3L7@oc8246131445.ibm.com>
Date: Thu, 18 Feb 2021 21:47:08 +1100
Message-ID: <871rddvej7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

"Christopher M. Riedl" <cmr@codefail.de> writes:
> On Thu Feb 11, 2021 at 11:21 PM CST, Daniel Axtens wrote:
...
>>
>> My only concern here was whether it was valid to access
>> if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
>> if CONFIG_PPC_TRANSACTIONAL_MEM was not defined, but I didn't think of
>> any obvious reason why it wouldn't be...
>
> Hmm, we don't really need it for the non-TM case and it is another extra
> uaccess. I will take your suggestion to remove the need for the other
> ifdefs but might keep this one. Keeping it also makes it very clear this
> call is only here for TM and possible to remove in a potentially TM-less
> future :)

Yep I agree.

cheers
