Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2EE16E6C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 02:43:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zHlq6NPzzDqPB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 10:43:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zHkS600kzDqLr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 10:42:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44zHkQ6mGQz9s00;
 Wed,  8 May 2019 10:42:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Yury Norov <yury.norov@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] powerpc: restore current_thread_info()
In-Reply-To: <20190507230746.GA19259@yury-thinkpad>
References: <20190507225121.18676-1-ynorov@marvell.com>
 <20190507225856.GP23075@ZenIV.linux.org.uk>
 <20190507230746.GA19259@yury-thinkpad>
Date: Wed, 08 May 2019 10:42:37 +1000
Message-ID: <87h8a5wzcy.fsf@concordia.ellerman.id.au>
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
Cc: Yury Norov <ynorov@marvell.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yury Norov <yury.norov@gmail.com> writes:
> On Tue, May 07, 2019 at 11:58:56PM +0100, Al Viro wrote:
>> On Tue, May 07, 2019 at 03:51:21PM -0700, Yury Norov wrote:
>> > Commit ed1cd6deb013 ("powerpc: Activate CONFIG_THREAD_INFO_IN_TASK")
>> > removes the function current_thread_info(). It's wrong because the
>> > function is used in non-arch code and is part of API.
>> 
>> In include/linux/thread_info.h:
>> 
>> #ifdef CONFIG_THREAD_INFO_IN_TASK
>> /*
>>  * For CONFIG_THREAD_INFO_IN_TASK kernels we need <asm/current.h> for the
>>  * definition of current, but for !CONFIG_THREAD_INFO_IN_TASK kernels,
>>  * including <asm/current.h> can cause a circular dependency on some platforms.
>>  */
>> #include <asm/current.h>
>> #define current_thread_info() ((struct thread_info *)current)
>> #endif
>
> Ah, sorry. Then it might be my rebase issue. I was confused because Christophe
> didn't remove the comment to current_thread_info(), so I decided he
> removed it erroneously.

Yeah you're right, that comment should have been removed too.

cheers
