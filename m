Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE58BA54B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 04:21:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D+JzxUYE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVvgB12TNz3cZF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 12:21:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=D+JzxUYE;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVvfV49Jwz2xb2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 12:20:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1714702834;
	bh=MQk7po5n+RKxEap5EeHFeD0GZgMLnbUNtMLDr+iX+h4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D+JzxUYEk/MFVM6kZOJvpdN2i8LT5EkdneB9Z/FjhMGUVVhIjlPPafwt05CMhDq+O
	 t0KLqbLrKOpHMf3OiyeC2Y0kK2DZPAkkZwbgA5Hh2zfqgbHLFu0xlw16LMMl75wmag
	 WTt+di0laj0Oawe7ZWZ/Mx1P5xG0UtO7WWsYuhnUU64O+qddt+9wEiVArny6qDpeu0
	 j2W+3XChJApQDyQdftc2FXcGswVfrhwYTf72zD9ZENPdXQeXFAsdpZ8oGfOP8RtTe9
	 QEbt+T8RechjCSEYXBmfsfXskzdXvUQIC2EKxv+ruSZ0wL7RlJ3AUlJA1ZjRymX4DT
	 1/dd+TjL5SPwg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VVvfV32dPz4wd3;
	Fri,  3 May 2024 12:20:34 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joel Savitz <jsavitz@redhat.com>, aneesh.kumar@kernel.org
Subject: Re: [PATCH 1/3] powerpc/mm: Align memory_limit value specified
 using mem= kernel parameter
In-Reply-To: <CAL1p7m65qzeQ-RsOiQ1X737mr2xr9WYn1g0Wn_nKAzx55jD=Ag@mail.gmail.com>
References: <20240403083611.172833-1-aneesh.kumar@kernel.org>
 <20240417143631.253489-1-jsavitz@redhat.com>
 <CAL1p7m65qzeQ-RsOiQ1X737mr2xr9WYn1g0Wn_nKAzx55jD=Ag@mail.gmail.com>
Date: Fri, 03 May 2024 12:20:33 +1000
Message-ID: <87fruz3aby.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, naveen@kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Savitz <jsavitz@redhat.com> writes:
> On Wed, Apr 17, 2024 at 10:36=E2=80=AFAM Joel Savitz <jsavitz@redhat.com>=
 wrote:
>>
>> Acked-by: Joel Savitz <jsavitz@redhat.com>
>>
>
> Hi,
>
> What is the status of this? This patch fixes a bug where a powerpc
> machine hangs at boot when passed an unaligned value in the mem=3D
> kernel parameter.

It's in linux-next for v6.10

cheers
