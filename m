Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5996C390DBC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 03:03:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqXkm2QVNz3c4x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 May 2021 11:03:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nJAwQcEu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nJAwQcEu; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqXjy2K2zz3bs3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 May 2021 11:02:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FqXjx4gnZz9sRN;
 Wed, 26 May 2021 11:02:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1621990965;
 bh=rx1tm0TLPgtBFnBfSkDH7Uwyg2ciXNNEGytx0IeGM+M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nJAwQcEuq3pWOkzumB+pjJtT4iRoZolBsMBlfJpv8WuZyOdDa+nPMC7Ydu+MKq2OQ
 vUdNIt8hhT7t7zwKHH9PsDwj36hSW9ZK7mXBoC4fNFSfL33cg5MTbdtFsFJ+emqgcF
 /AwNRvIkACY6YdDkSp+TFEYs6EkFojMe7JxcpkO7DFWwGheVGt/VHGNOsDxcL1S1Il
 ARCF9xXCRx/DKEUmqTo/Kt9oN8A+Xz0EqTgsRkuLL+SosEEiDwjQz/QJ2CIQqBqo10
 mrzeGh/MwckVdewII2oY5pRXo0wqgQ7Wvwtr1icTRkzarbM5OQpVQj8CWDRoGAOwju
 1hVyI5KJotMBw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Wolfram Sang <wsa@kernel.org>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
In-Reply-To: <YK1HqE+3ILtGXZ7E@kunai>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
 <YK1HqE+3ILtGXZ7E@kunai>
Date: Wed, 26 May 2021 11:02:45 +1000
Message-ID: <87zgwigvd6.fsf@mpe.ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andy.shevchenko@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wolfram Sang <wsa@kernel.org> writes:
> On Wed, May 12, 2021 at 09:20:48AM +1200, Chris Packham wrote:
>> The P2040/P2041 has an erratum where the i2c recovery scheme
>> documented in the reference manual (and currently implemented
>> in the i2c-mpc.c driver) does not work. The errata document
>> provides an alternative that does work. This series implements
>> that alternative and uses a property in the devicetree to
>> decide when the alternative mechanism is needed.
>
> The series looks good to me. Usually, I don't take DTS patches. This
> time I'd make an exception and apply all patches to for-current because
> this is clearly a bugfix. For that, I'd need an ack from PPC
> maintainers. Could I have those for patches 2+3?

Yep, done.

cheers
