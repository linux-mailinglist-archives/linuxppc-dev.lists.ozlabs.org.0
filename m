Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 460AE35D81A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 08:32:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKG3k1bx0z3bTN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 16:32:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o2/PtY2p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=o2/PtY2p; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKG3H0W7Hz2xy7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 16:31:37 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FKG3970gmz9sVb;
 Tue, 13 Apr 2021 16:31:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618295497;
 bh=tMH4STlE0KCPkig0ixz3tk4Pi9eX9DRFBNDHWYY01Ts=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=o2/PtY2poIFEx77VRY0BfPEzN/kb88EHi7/vCJWpPx+lINy6RBoE2ODKSw8EAuoS0
 pqMFuC4cNfJ1iKEu61nuc50SL+B2Vf3oH/z+eufKAVYJLlj9ryfjyDNy02Rz2u2qJM
 yv+EoMmVWFFCbKMeNmTast89xuFs+sBbNFOe4myjLJ+02Ej+NMfYfy/1QeRdJaV/vV
 y4+hQOjO7Kw4uW47mSQQMfxcibmWTRihbkri1Hp8VJvrarJ2rYsWSm3eHbOs86hgWC
 VTaicS0GIPCdSyviECNSmn6tTP6yVjhLG3IXo0yAw9hQMp5PfVEiRpq5vz4VQhsvoY
 1abQoEgmQRejg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas Gleixner <tglx@linutronix.de>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH RESEND v1 0/4] powerpc/vdso: Add support for time
 namespaces
In-Reply-To: <87mtu31xd3.ffs@nanos.tec.linutronix.de>
References: <cover.1617209141.git.christophe.leroy@csgroup.eu>
 <87mtu31xd3.ffs@nanos.tec.linutronix.de>
Date: Tue, 13 Apr 2021 16:31:33 +1000
Message-ID: <87tuoag0fu.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, dima@arista.com,
 linux-kernel@vger.kernel.org, avagin@gmail.com, luto@kernel.org,
 vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thomas Gleixner <tglx@linutronix.de> writes:
> On Wed, Mar 31 2021 at 16:48, Christophe Leroy wrote:
>> [Sorry, resending with complete destination list, I used the wrong script on the first delivery]
>>
>> This series adds support for time namespaces on powerpc.
>>
>> All timens selftests are successfull.
>
> If PPC people want to pick up the whole lot, no objections from my side.

Thanks, will do.

cheers
