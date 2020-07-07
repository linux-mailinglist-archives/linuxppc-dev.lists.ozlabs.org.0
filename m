Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5542166D8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 08:54:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1CpN0zxMzDqMx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 16:54:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1Cl42kCvzDqkV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 16:51:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=orQ7RC9s; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4B1Cl407xgz9sQt; Tue,  7 Jul 2020 16:51:12 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1Cl33l59z9sDX;
 Tue,  7 Jul 2020 16:51:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594104671;
 bh=oOXgPAgmimC+5OE9S4VzNRBLBVUe1Z5iRWSG3SmsNnU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=orQ7RC9s4UsZ5RZwELngkGP6M3YB0Jzi4XZFS5CBwtWWfBtjZ9dcUYXpNqEirOwdp
 dAMeUjR7JdOTAiGz9fr1Vs6i06qhy53bvEEZ7mIJc9QlnFSlR9q0R6z90spkoAGcMb
 qhH3IjcYuJEwPexfZnCSt7DXJFeSQ/jjdsFuIuDjnKwJZwAWERgpPbq1GaJ1ClZ+3u
 ioq9wspTfzA5OnDHoB1+oo0Y/zdpqx/O5SsJ88Rel32NI0kw74XYyGNeTHPE9mgYHZ
 IzttUCk1UeHIhsfwql9id9OC71X+BQA5A86fPuKFkRl16yT7cBlrGO3z8b3Vi+VnNw
 sZsIqfkFBwpXg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH 3/5] selftests/powerpc: Update the stack expansion test
In-Reply-To: <8f6c5175-32ce-34a2-873d-b5fb3a5d7c4c@csgroup.eu>
References: <20200703141327.1732550-1-mpe@ellerman.id.au>
 <20200703141327.1732550-3-mpe@ellerman.id.au>
 <8f6c5175-32ce-34a2-873d-b5fb3a5d7c4c@csgroup.eu>
Date: Tue, 07 Jul 2020 16:53:23 +1000
Message-ID: <87eepn4xzw.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, hughd@google.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 03/07/2020 =C3=A0 16:13, Michael Ellerman a =C3=A9crit=C2=A0:
>> Update the stack expansion load/store test to take into account the
>> new allowance of 4096 bytes below the stack pointer.
>
> [I didn't receive patch 2, don't know why, hence commenting patch 2 here.]
>
> Shouldn't patch 2 carry a fixes tag and be Cced to stable for=20
> application to previous kernel releases ?

Yes it should.

cheers
