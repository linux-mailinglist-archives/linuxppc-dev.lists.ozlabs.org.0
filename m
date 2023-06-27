Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB50740446
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 22:06:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZjE+m6Ts;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrG1m2473z3bT1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 06:06:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZjE+m6Ts;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=dinguyen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrG0w0nFLz2yGY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 06:05:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B06F61187;
	Tue, 27 Jun 2023 20:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7059C433C8;
	Tue, 27 Jun 2023 20:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687896331;
	bh=nxdHwM18qWYe/olgwzu19FISC5RuQmNbEVvkLxl2VBY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZjE+m6TsP7/JcneLIcHUQel0hil1iUviVqfTyM+RmrZXtI/kbVQFRNoD4ArZJbLU5
	 4zXDW9VUtIBpTBpsYvBq5PnpEDQDOlXJKhHy+sm7jtZkBQvoQSE1wSsOzbpudlC+Pd
	 sL4Mh0jQneg4s31yTcnwH46d5iOXHuw/38OyZqmz/LfqWaBAbJU7kwNjDJPcPN9MhY
	 5TVIOZI5hoLTyoGuAsXGQTmXmS3NexTmFkWRmRChTwd7DACRyJXRXzGHrpU99Dq1ux
	 qzo4guCFMo24k0Ik6ctKYSpdIkJqigF4j5lDwN6AneeMBgw/flE/ruM58JFYwrciDp
	 T1OMj/Q26nvmA==
Message-ID: <c3751051-7fc7-7129-b9a7-ead71c576ace@kernel.org>
Date: Tue, 27 Jun 2023 15:05:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 26/33] nios2: Convert __pte_free_tlb() to use ptdescs
Content-Language: en-US
To: Vishal Moola <vishal.moola@gmail.com>, Guenter Roeck <linux@roeck-us.net>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
 <20230622205745.79707-27-vishal.moola@gmail.com>
 <13bab37c-0f0a-431a-8b67-4379bf4dc541@roeck-us.net>
 <CAOzc2px6VutRkMUTn+M5LFLf1YbRVZFgJ=q7StaApwYRxUWqQA@mail.gmail.com>
 <cc954b15-63ab-9d9f-2d37-1aea78b7f65f@roeck-us.net>
 <b6a5753b-8874-6465-f690-094ee753e038@roeck-us.net>
 <CAOzc2pxdqeaRjYLfOqvMW-AEobTzD9xOP+MyP9nxgEbi1T2r7Q@mail.gmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <CAOzc2pxdqeaRjYLfOqvMW-AEobTzD9xOP+MyP9nxgEbi1T2r7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-openrisc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, xen-devel@lists.xenproject.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/27/23 14:56, Vishal Moola wrote:
> On Tue, Jun 27, 2023 at 12:14 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 6/27/23 12:10, Guenter Roeck wrote:
>>> On 6/27/23 10:42, Vishal Moola wrote:
>>>> On Mon, Jun 26, 2023 at 10:47 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>
>>>>> On Thu, Jun 22, 2023 at 01:57:38PM -0700, Vishal Moola (Oracle) wrote:
>>>>>> Part of the conversions to replace pgtable constructor/destructors with
>>>>>> ptdesc equivalents.
>>>>>>
>>>>>> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>>>>>> Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
>>>>>
>>>>> This patch causes all nios2 builds to fail.
>>>>
>>>> It looks like you tried to apply this patch on its own. This patch depends
>>>> on patches 01-12 of this patchset to compile properly. I've cross-compiled
>>>> this architecture and it worked, but let me know if something fails
>>>> when its applied on top of those patches (or the rest of the patchset).
>>>
>>>
>>> No, I did not try to apply this patch on its own. I tried to build yesterday's
>>> pending-fixes branch of linux-next.
>>>
>>
>> A quick check shows that the build fails with next-20230627. See log below.
> 
> Ah it looks like this one slipped into -next on its own somehow? Stephen, please
> drop this patch from -next; it shouldn't be in without the rest of the
> patchset which
> I intend to have Andrew take through the mm tree.
> 

I apologize, but I queue this patch up for Linus and it's been pulled 
for this merge window. I didn't realize you were going to take this 
patchset through another tree.

Sorry about that.

Dinh
