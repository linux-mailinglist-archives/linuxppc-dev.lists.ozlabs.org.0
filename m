Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 990527B4746
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Oct 2023 14:09:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cSPgCQWk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rz2vS2zPdz3vYl
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Oct 2023 23:09:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cSPgCQWk;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rz2tY4RCLz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Oct 2023 23:08:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1696162128;
	bh=HaGGZ/T1x2QqtiunV/yuLIU/Bf4cwKcDBuVOuiJdBO4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cSPgCQWkWl+vq4DTmWJc6it0Ms0qTx5xVyBHCROP8flRCcYQBo46bvVYp4E2EA7ul
	 EZZdeUl5yuLBpit32J1h8YCa9LI3abw66iRev20FBj7p6nCPFZeBdyrJ5a3zVq2nMs
	 Z022TiT0wJVeK7+5ni815zlvs7W2fdA1VYRuVWTHD2B+fLmqI1l9394pdu5PiVnDn8
	 3EQdrKicR+O5R2dFZmGxcOopnOzgTrqHUq90N+O7It+rNww+VTnRLL/qyRtHo/vc19
	 aX4D0eqRDiEC56nX2xLcmgg6seky89L3h9miRYiHlmdmTHDBFRO1ArW2Dk4Tdqt8WM
	 GSwYkmNqK0HFA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rz2tN0S4Tz4x2Y;
	Sun,  1 Oct 2023 23:08:43 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Dr. David Alan Gilbert" <linux@treblig.org>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, sam@ravnborg.org, benh@kernel.crashing.org
Subject: Re: [PATCH v4] powerpc: Use shared font data
In-Reply-To: <ZRgfVfaIkEWsL8Ha@gallifrey>
References: <20230825142754.1487900-1-linux@treblig.org>
 <ZRgfVfaIkEWsL8Ha@gallifrey>
Date: Sun, 01 Oct 2023 23:08:42 +1100
Message-ID: <87a5t2sfxx.fsf@mail.lhotse>
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
Cc: rdunlap@infradead.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Dr. David Alan Gilbert" <linux@treblig.org> writes:
> * linux@treblig.org (linux@treblig.org) wrote:
>> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>> 
>> PowerPC has a 'btext' font used for the console which is almost identical
>> to the shared font_sun8x16, so use it rather than duplicating the data.
>
> Hi Michael,
>   Are you going to pick this up for 6.7?

Yes I will.

cheers
