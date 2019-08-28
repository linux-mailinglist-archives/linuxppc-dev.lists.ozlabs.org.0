Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F97CA02A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 15:07:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JQyS50f3zDqDs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 23:07:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JQqM5pZnzDr75
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 23:01:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46JQqK61lWz9sBF;
 Wed, 28 Aug 2019 23:01:33 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Scott Wood <oss@buserror.net>
Subject: Re: [PATCH v6 00/12] implement KASLR for powerpc/fsl_booke/32
In-Reply-To: <827cc152757906a0ebc04bbe56cdf44683721eb4.camel@buserror.net>
References: <20190809100800.5426-1-yanaijie@huawei.com>
 <ed96199d-715c-3f1c-39db-10a569ba6601@huawei.com>
 <529fd908-42d6-f96f-daa2-9010f3035879@huawei.com>
 <878srf4cjk.fsf@concordia.ellerman.id.au>
 <827cc152757906a0ebc04bbe56cdf44683721eb4.camel@buserror.net>
Date: Wed, 28 Aug 2019 23:01:28 +1000
Message-ID: <87h861v3yv.fsf@mpe.ellerman.id.au>
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
Cc: wangkefeng.wang@huawei.com, keescook@chromium.org,
 Jason Yan <yanaijie@huawei.com>, kernel-hardening@lists.openwall.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, jingxiangfeng@huawei.com,
 diana.craciun@nxp.com, paulus@samba.org, zhaohongjiang@huawei.com,
 thunder.leizhen@huawei.com, fanchengyang@huawei.com,
 linuxppc-dev@lists.ozlabs.org, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Scott Wood <oss@buserror.net> writes:
> On Tue, 2019-08-27 at 11:33 +1000, Michael Ellerman wrote:
>> Jason Yan <yanaijie@huawei.com> writes:
>> > A polite ping :)
>> > 
>> > What else should I do now?
>> 
>> That's a good question.
>> 
>> Scott, are you still maintaining FSL bits, 
>
> Sort of... now that it's become very low volume, it's easy to forget when
> something does show up (or miss it if I'm not CCed).  It'd probably help if I
> were to just ack patches instead of thinking "I'll do a pull request for this
> later" when it's just one or two patches per cycle.

Yep, understand. Just sending acks is totally fine if you don't have
enough for a pull request.

cheers
