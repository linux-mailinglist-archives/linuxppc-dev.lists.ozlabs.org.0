Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 497F968237
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 04:27:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45n6rF3M4FzDqVP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 12:27:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45n6lv5dYlzDqTq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 12:23:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45n6lv2p8Bz9sP0;
 Mon, 15 Jul 2019 12:23:55 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] KVM: PPC: Book3S HV: Always save guest pmu for guest
 capable of nesting
In-Reply-To: <1563156110.2145.5.camel@gmail.com>
References: <20190703012022.15644-1-sjitindarsingh@gmail.com>
 <87lfx2egt4.fsf@concordia.ellerman.id.au> <1563156110.2145.5.camel@gmail.com>
Date: Mon, 15 Jul 2019 12:23:55 +1000
Message-ID: <87blxw9gsk.fsf@concordia.ellerman.id.au>
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
Cc: kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Suraj Jitindar Singh <sjitindarsingh@gmail.com> writes:
> On Sat, 2019-07-13 at 13:47 +1000, Michael Ellerman wrote:
>> Suraj Jitindar Singh <sjitindarsingh@gmail.com> writes:
...
>> > 
>> > Fixes: 95a6432ce903 "KVM: PPC: Book3S HV: Streamlined guest
>> > entry/exit path on P9 for radix guests"
>> 
>> I'm not clear why this and the next commit are marked as fixing the
>> above commit. Wasn't it broken prior to that commit as well?
>
> That was the commit which introduced the entry path which we use for a
> nested guest, the path on which we need to be saving and restoring the
> pmu registers and so where the new code was introduced.

OK, I thought that commit was an unrelated optimisation. Agree that is a
good target if it is the commit that introduced the nested path.

cheers
