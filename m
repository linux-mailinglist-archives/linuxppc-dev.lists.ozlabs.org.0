Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AFA26A5AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 14:57:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrNYN54y9zDqNN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 22:57:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrNTm2TF8zDqMx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Sep 2020 22:54:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=PBeNJaRg; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BrNTk57kBz9sVK;
 Tue, 15 Sep 2020 22:54:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1600174458;
 bh=cPMdzE3BW/hsrod/8cZNP4NMSHeYaoQDjzF2d0zvAjc=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=PBeNJaRgUe3r6Ez7HdzZY1UaMkCGbObAvnAC+kjQhe930kYEZGVNb4zPZTJdKDr1S
 3/qvV8D4tGGEsKFbMuBsi3nfCtSnogejYpSAnnUd/1BMDwTsa7AEcxMwddZ5fFv6jc
 j7pX9P0BVu+Dr4PZdkF4MBU6rc8TgCCFZfOgIMIE37u/OBUrvt/BqtNCVxwdKnhcmk
 kjFqwAsj9QZVcWrywfoSVYWPOusTLoYtcXOMNwL6zAFbMIJTuIFAlr9W/WGlmcD4vW
 zNU1Q18yjacQbWpeSpEZL9cB9hyWGj1AJal9XCVg9QLksKnEwx6kduPYLbKty/osKf
 JNuG5KKHJjEMg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
	linuxppc-dev@lists.ozlabs.org, mahesh@lists.ozlabs.org
Subject: Re: Injecting SLB miltihit crashes kernel 5.9.0-rc5
In-Reply-To: <20200915084302.GG29778@kitsune.suse.cz>
References: <20200915084302.GG29778@kitsune.suse.cz>
Date: Tue, 15 Sep 2020 22:54:18 +1000
Message-ID: <87bli7p5dx.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> Hello,
>
> Using the SLB mutihit injection test module (which I did not write so I
> do not want to post it here) to verify updates on my 5.3 frankernekernel
> I found that the kernel crashes with Oops: kernel bad access.
>
> I tested on latest upstream kernel build that I have at hand and the
> result is te same (minus the message - nothing was logged and the kernel
> simply rebooted).

That's disappointing.

> Since the whole effort to write a real mode MCE handler was supposed to
> prevent this maybe the SLB injection module should be added to the
> kernel selftests?

Yes I'd like to see it upstream. I think it should be integrated into
LKDTM, which contains other dangerous things like that and is designed
for testing how the kernel handles/recovers from bad conditions.

cheers
