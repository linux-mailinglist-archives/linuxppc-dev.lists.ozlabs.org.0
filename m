Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5802B3F9A46
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:34:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx1062GS0z3gV1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:34:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0qN5nW8z3dyt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:26:40 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0qM6Gz8z9sRf;
 Fri, 27 Aug 2021 23:26:39 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, fthain@linux-m68k.org,
 userm57@yahoo.com, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <4856f5574906e2aec0522be17bf3848a22b2cd0b.1629269345.git.christophe.leroy@csgroup.eu>
References: <4856f5574906e2aec0522be17bf3848a22b2cd0b.1629269345.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/32s: Fix random crashes by adding isync()
 after locking/unlocking KUEP
Message-Id: <163007070021.56462.16976826768640062743.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:25:00 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 18 Aug 2021 06:49:29 +0000 (UTC), Christophe Leroy wrote:
> Commit b5efec00b671 ("powerpc/32s: Move KUEP locking/unlocking in C")
> removed the 'isync' instruction after adding/removing NX bit in user
> segments. The reasoning behind this change was that when setting the
> NX bit we don't mind it taking effect with delay as the kernel never
> executes text from userspace, and when clearing the NX bit this is
> to return to userspace and then the 'rfi' should synchronise the
> context.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/32s: Fix random crashes by adding isync() after locking/unlocking KUEP
      https://git.kernel.org/powerpc/c/ef486bf448a057a6e2d50e40ae879f7add6585da

cheers
