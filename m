Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CCE18C66
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 16:53:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450GYb69PVzDqQ3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 00:53:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450GX76h58zDq9V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 00:52:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 450GX72r3Kz9s4Y; Fri, 10 May 2019 00:52:07 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 450GX673Z2z9s4V;
 Fri, 10 May 2019 00:52:06 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Borislav Petkov <bp@alien8.de>, Johannes Thumshirn <morbidrsa@gmail.com>
Subject: Re: [PATCH] EDAC, mpc85xx: Prevent building as a module
In-Reply-To: <20190508101238.GB19015@zn.tnic>
References: <20190502141941.12927-1-mpe@ellerman.id.au>
 <20190506065045.GA3901@x250> <20190508101238.GB19015@zn.tnic>
Date: Fri, 10 May 2019 00:52:05 +1000
Message-ID: <87o94bvfxm.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, mchehab@kernel.org, james.morse@arm.com,
 linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Borislav Petkov <bp@alien8.de> writes:
> On Mon, May 06, 2019 at 08:50:45AM +0200, Johannes Thumshirn wrote:
>> Acked-by: Johannes Thumshirn <jth@kernel.org>
>
> Queued, thanks.

Thanks. It would be nice if you could send it as a fix for 5.2, it's the
last thing blocking one of my allmodconfig builds. But if you don't
think it qualifies as a fix that's fine too, it can wait.

cheers
