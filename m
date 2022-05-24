Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 250665328A0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:17:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6s9x0cdrz3f7f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:17:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6s7V42tVz3bn5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:15:34 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L6s7V0g8Wz4ySb;
 Tue, 24 May 2022 21:15:34 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <2e35f0fd649c83c5add17a99514ac040767be93a.1652981047.git.christophe.leroy@csgroup.eu>
References: <2e35f0fd649c83c5add17a99514ac040767be93a.1652981047.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/fsl_book3e: Don't set rodata RO too early
Message-Id: <165339059929.1718562.6708480994090360470.b4-ty@ellerman.id.au>
Date: Tue, 24 May 2022 21:09:59 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 19 May 2022 19:24:15 +0200, Christophe Leroy wrote:
> On fsl_book3e, rodata is set read-only at the same time as
> init text is set NX at the end of init. That's too early.
> 
> As both action are performed at the same time, delay both
> actions to the time rodata is expected to be made read-only.
> 
> It means we will have a small window with init mem freed but
> still executable. It shouldn't be an issue though, especially
> because the said memory gets poisoned and should therefore
> result to a bad instruction fault in case it gets executer.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/fsl_book3e: Don't set rodata RO too early
      https://git.kernel.org/powerpc/c/ad91f66f5fa7c6f9346e721c3159ce818568028b

cheers
