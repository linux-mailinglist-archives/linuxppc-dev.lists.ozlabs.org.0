Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 960007A1FD9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 15:30:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qScOy0tO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnFS23rdVz3cSR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 23:30:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qScOy0tO;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnFR71w0nz3c1L
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 23:29:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1694784578;
	bh=lXjvd3TJSQ6cqva6/5eqdL2+87WjyD9vjXEISda8nlY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qScOy0tOOQA6fnha+GtlosxQosWFpa5yzcf4gN/iBxpHFGLtceVHASAO5f8N/A246
	 EJF4P1xx5SfWr9sFNEVugnBpmH8/r7dVMPze1lFIHaFYTwADXAG6BpX4iyvYoYSkRG
	 oZMXwT0cTcFYnEbbINP7WafKHzB482xLt+zmv2tfk2iAKrPxFogFcN4AwbCFslCS2/
	 4iMwrYwffQ/6DzrxZjr5O/AGw4rv7/U7CFa9b4/od9odeGx9ZIkZgf2Hxu1W1YA7Y5
	 ry7p9r+oQ8Bl14KOojwwKhVIFYfcyqeyTAbDSM/dOP8psV7P3y8qw5vy2CKuo85pyR
	 w3eIK9le5FNyA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RnFR62VCtz4wxd;
	Fri, 15 Sep 2023 23:29:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2] crypto: vmx: Improved AES/XTS performance of 6-way
 unrolling for ppc.
In-Reply-To: <20230830134911.179765-1-dtsen@linux.ibm.com>
References: <20230830134911.179765-1-dtsen@linux.ibm.com>
Date: Fri, 15 Sep 2023 23:29:33 +1000
Message-ID: <8734zf7ef6.fsf@mail.lhotse>
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, Danny Tsen <dtsen@linux.ibm.com>, appro@cryptogams.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Danny Tsen <dtsen@linux.ibm.com> writes:
> Improve AES/XTS performance of 6-way unrolling for PowerPC up
> to 17% with tcrypt.  This is done by using one instruction,
> vpermxor, to replace xor and vsldoi.
>
> The same changes were applied to OpenSSL code and a pull request was
> submitted.

https://github.com/openssl/openssl/pull/21812

Still unmerged as of today.

cheers
