Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0746559A56
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 15:28:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTycp5GZqz3cfc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 23:28:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=i54nHJEc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTybc2ngMz2yWr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 23:27:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=i54nHJEc;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LTybX4Z9lz4xbd;
	Fri, 24 Jun 2022 23:27:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656077256;
	bh=5vrfcOv26V+lDLOC3WyTvVljocKADw4QjN6tnRjDRLw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i54nHJEcYvdKTWdeFqLo9vffKIdbdPfubQ3Hpb82tshH2oGFJosR+2Wpod0t8BKW2
	 MoMChAKFWXrwsKHz2OJy4Q2FnIJd77SglPdYLyNQdiNc5QcZ/DX0NcDDDKLSHv8X+P
	 JOWwX5oaPT5HX9Y0kh8xUU9FnBl7fufCmNO1IeNGT3JN5g3LIkh8ViXmrF3OAJptvA
	 7Xe6s5UXHs2Whu0CtTRtbEqkww2ZD2B7jZ9t8UTN+qVe3Yx+qfuPWdk4+gaikEGsKs
	 ArMKcq3BBJy5r0beQfdXzGaE+YGCwlHmBzFGdqhAyQUtV3CzslFY1w1O1LMBhgtHqO
	 oNnY1FUD6epOw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, Scott Cheloha
 <cheloha@linux.ibm.com>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 3/4] powerpc/pseries: register pseries-wdt device
 with platform bus
In-Reply-To: <874k0enied.fsf@linux.ibm.com>
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <20220602175353.68942-4-cheloha@linux.ibm.com>
 <874k0enied.fsf@linux.ibm.com>
Date: Fri, 24 Jun 2022 23:27:36 +1000
Message-ID: <87v8sq42ev.fsf@mpe.ellerman.id.au>
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
Cc: wvoigt@us.ibm.com, aik@ozlabs.ru, Scott Cheloha <cheloha@linux.ibm.com>, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Scott Cheloha <cheloha@linux.ibm.com> writes:
>> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
>> guest control of one or more virtual watchdog timers.
...
>
> Seems like we don't need pseries_wdt_pdev as it's unused elsewhere? But
> that's quite minor.

It's minor but please drop it in the next version.

cheers
