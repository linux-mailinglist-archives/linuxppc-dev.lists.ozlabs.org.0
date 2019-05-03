Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 285A112F6F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 15:42:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wYGb3VjPzDqCT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 23:42:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wY4x4tswzDqld
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 23:34:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 44wY4w4qpzz9sBb;
 Fri,  3 May 2019 23:34:08 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joe Perches <joe@perches.com>,
 Michael Ellerman <patch-notifications@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/powernv/ioda2: Add __printf format/argument
 verification
In-Reply-To: <cf6948fb8ab8e395e139a3440f3600a6050c1efa.camel@perches.com>
References: <44wNKc0KZFz9sPd@ozlabs.org>
 <cf6948fb8ab8e395e139a3440f3600a6050c1efa.camel@perches.com>
Date: Fri, 03 May 2019 23:33:57 +1000
Message-ID: <87bm0jy856.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joe Perches <joe@perches.com> writes:
> On Fri, 2019-05-03 at 16:59 +1000, Michael Ellerman wrote:
>> On Thu, 2017-03-30 at 10:19:25 UTC, Joe Perches wrote:
>> > Fix fallout too.
>> > 
>> > Signed-off-by: Joe Perches <joe@perches.com>
>> 
>> Applied to powerpc next, thanks.
>> 
>> https://git.kernel.org/powerpc/c/1e496391a8452101308a23b7395cdd49
>
> 2+ years later.

I was hoping for a new record.

cheers
