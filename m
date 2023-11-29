Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7677FCC99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 03:12:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OaF8aeHF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sg2rg5fyhz3dFH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 13:12:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OaF8aeHF;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (unknown [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sg2qp5fTtz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 13:11:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701223868;
	bh=UlWZqs2iX4cbndXYEkzZZGED9gNk3D0BaVxXgHLRrLU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OaF8aeHFKle8OaBkbRxcXFTqQDB4CUaRsnM2N2zB+r8YtMBSm85XnIXv45QYz/KLw
	 ugHBAnW9cnjY6o5ua5Po9ucYZaQO++2qj6cNL8X8zsU9FufWMmsjjdv6hyKKZkOVv6
	 FUai8hx5YGxxncghksav+NhUj+LPyl+ty0DqXhcUEM/4av7GQuz9GANuCAnkzRcvbk
	 E2Bhkp6nq8Qe/MHqY0F+ODUukji7yeL3TIdQXpsNXtgthCvpZyv2DSI7uuOy4kBBLZ
	 mNHOsCozpoj0avmx+iHH9McRoyfe4EtfLpQesMCdAsSzBGkoAkwKoQbE/KvJw7/Dso
	 4Ehr33Nxims9w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sg2qb6gMcz4wbk;
	Wed, 29 Nov 2023 13:11:07 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 05/13] powerpc/rtas: Facilitate high-level call
 sequences
In-Reply-To: <20231117-papr-sys_rtas-vs-lockdown-v4-5-b794d8cb8502@linux.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-5-b794d8cb8502@linux.ibm.com>
Date: Wed, 29 Nov 2023 13:11:07 +1100
Message-ID: <87jzq12ts4.fsf@mail.lhotse>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
writes:
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 1fc0b3fffdd1..52f2242d0c28 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -196,6 +224,12 @@ static struct rtas_function rtas_function_table[] __=
ro_after_init =3D {
>  			.buf_idx1 =3D 1, .size_idx1 =3D -1,
>  			.buf_idx2 =3D -1, .size_idx2 =3D -1,
>  		},
> +		/*
> +		 * PAPR+ R1=E2=80=937.3.19=E2=80=933 is explicit that the OS must not

When you cite PAPR+ can you please include the version number?

That's a general comment on this patch and in some other places in the
series too.

cheers
