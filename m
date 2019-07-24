Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF3F730C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 16:03:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45txs21VnpzDqNx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 00:03:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45txnz66pJzDqDf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2019 00:00:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 45txny6Gypz9s8m; Thu, 25 Jul 2019 00:00:54 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45txnx6zqPz9s3l;
 Thu, 25 Jul 2019 00:00:53 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christian Brauner <christian@brauner.io>,
 Arseny Solokha <asolokha@kb.kras.ru>
Subject: Re: [PATCH] powerpc: Wire up clone3 syscall
In-Reply-To: <20190724093132.orflnhvyiff75yrd@brauner.io>
References: <20190722133701.g3w5g4crogqb7oi5@brauner.io>
 <87ftmwknr9.fsf@kb.kras.ru> <20190724093132.orflnhvyiff75yrd@brauner.io>
Date: Thu, 25 Jul 2019 00:00:51 +1000
Message-ID: <87lfwn5y7g.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christian Brauner <christian@brauner.io> writes:
> On Wed, Jul 24, 2019 at 12:25:14PM +0700, Arseny Solokha wrote:
>> Hi,
>> 
>> may I also ask to provide ppc_clone3 symbol also for 32-bit powerpc? Otherwise
>> Michael's patch breaks build for me:
>
> Makes sense. Michael, are you planning on picking this up? :)

Yes I obviously (I hope) am not going to merge a patch that breaks the
32-bit build :)

I'll send a v2.

cheers
