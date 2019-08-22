Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7768A995CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 16:05:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DmWS68b4zDqjT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 00:05:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DlGw4v00zDrPg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 23:09:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46DlGv5YRdz9sPl; Thu, 22 Aug 2019 23:09:11 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 415480dce2ef03bb8335deebd2f402f475443ce0
In-Reply-To: <80432f71194d7ee75b2f5043ecf1501cf1cca1f3.1566196646.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Doug Crawford <doug.crawford@intelight-its.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/603: fix handling of the DIRTY flag
Message-Id: <46DlGv5YRdz9sPl@ozlabs.org>
Date: Thu, 22 Aug 2019 23:09:11 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-08-19 at 06:40:25 UTC, Christophe Leroy wrote:
> If a page is already mapped RW without the DIRTY flag, the DIRTY
> flag is never set and a TLB store miss exception is taken forever.
> 
> This is easily reproduced with the following app:
> 
> void main(void)
> {
> 	volatile char *ptr = mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANONYMOUS, -1, 0);
> 
> 	*ptr = *ptr;
> }
> 
> When DIRTY flag is not set, bail out of TLB miss handler and take
> a minor page fault which will set the DIRTY flag.
> 
> Fixes: f8b58c64eaef ("powerpc/603: let's handle PAGE_DIRTY directly")
> Cc: stable@vger.kernel.org
> Reported-by: Doug Crawford <doug.crawford@intelight-its.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/415480dce2ef03bb8335deebd2f402f475443ce0

cheers
