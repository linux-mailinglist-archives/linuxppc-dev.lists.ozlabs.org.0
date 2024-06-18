Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9351F90CB5D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 14:13:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y8+dWJEN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3Qdg2xCTz3cSp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 22:13:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y8+dWJEN;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3Qcx66YNz2xcw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 22:13:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1718712777;
	bh=T4jI7ACDqQnw0bojt0S04qj2GeD1CauQlFBbE9LYOKo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Y8+dWJENQPWQqn3HIgtWB4uC1HDsRmQXrHWy8h/M+eJrLid+GLPp+kMZz0yjgTCK2
	 yOvhcpodtmtIQg6gNbLAGfPYCzsuMI+JCmi6iOG4jMKUFSXHvfjZBYs69W+iQclBzU
	 pptEeYm2K6ltDPiS2pp2AP2Xs9gAy9TUeeNLpezid/hbJcwayl5nEY4SHElAmiJIQv
	 YIC3BKHBGFSv1p+8/I0W+fr8GYJUI5NnfcUkd+z/w7jiDezdBEJoAgQBnEUKRsWAhM
	 LK2IRhTmhCnJQJz6+XnK15GmNTs4h03iV1j7VP0iv5O/pwJTCBgyR9GL3Msbagijq0
	 xBRccyindPQwQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W3Qcm4MFWz4wbp;
	Tue, 18 Jun 2024 22:12:56 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Segher Boessenkool <segher@kernel.crashing.org>, Jinglin Wen
 <jinglin.wen@shingroup.cn>
Subject: Re: [PATCH] powerpc: Fixed duplicate copying in the early boot.
In-Reply-To: <20240617161336.GM19790@gate.crashing.org>
References: <20240617023509.5674-1-jinglin.wen@shingroup.cn>
 <20240617161336.GM19790@gate.crashing.org>
Date: Tue, 18 Jun 2024 22:12:54 +1000
Message-ID: <87cyoe1mbd.fsf@mail.lhotse>
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
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:
> Hi!
>
> On Mon, Jun 17, 2024 at 10:35:09AM +0800, Jinglin Wen wrote:
>> +	cmplwi	cr0,r4,0	/* runtime base addr is zero */
>
> Just write
>    cmpwi r4,0
>
> cr0 is the default, also implicit in many other instructions, please
> don't clutter the source code.  All the extra stuff makes you miss the
> things that do matter!
>
> The "l" is unnecessary, you only care about equality here after all.

In my mind it's an unsigned comparison, so I'd use cmpld, even though as
you say all we actually care about is equality.

cheers
