Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 925D67FCC8B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 03:08:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E8kmVjHN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sg2m20Vnjz3cbt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 13:08:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E8kmVjHN;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sg2lC64ndz3byh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 13:07:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701223639;
	bh=j/hShAFjLFKbLnJokxXlxYDYASj7Arzzxy1wQrHEz/M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=E8kmVjHN/g0xAO3PfilovTEvcvsGI8hAslJnL2zX4uo5z/BTzw2sHKS3rlWFCeHuc
	 xYI3jWb8iyjaUWvomFIcaJ6iSbUzsjxVg/abnjoo/KPwgNo6ea0ScJXFuWKwpkoD7Y
	 Yiq8FFleGv7gXNNyfm5uWsyyJZ3u++9ElvX0tlV8NZvmadr8TpuW5nuCsc4gsEiweZ
	 e2v8WiEzndbpefokdIqVVIZ2xjs74R8MX6XrnkF3CufIyOz0XlwrDm4ugRE2rqCye1
	 5VorWQTbeYFhWxhLfXgktZZ4sm6xOUPi1KvHsGBIC3vhat4DMsTrPdljjXmjzb1oKH
	 /+UlfLazAZNmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sg2lC2bMgz4wdD;
	Wed, 29 Nov 2023 13:07:19 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 09/13] powerpc/pseries: Add papr-vpd character driver
 for VPD retrieval
In-Reply-To: <20231117-papr-sys_rtas-vs-lockdown-v4-9-b794d8cb8502@linux.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-9-b794d8cb8502@linux.ibm.com>
Date: Wed, 29 Nov 2023 13:07:16 +1100
Message-ID: <87msux2tyj.fsf@mail.lhotse>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
writes:
> From: Nathan Lynch <nathanl@linux.ibm.com>
>
> PowerVM LPARs may retrieve Vital Product Data (VPD) for system
> components using the ibm,get-vpd RTAS function.
...
>
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index 4ea5b837399a..a950545bf7cd 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -349,6 +349,8 @@ Code  Seq#    Include File                                           Comments
>                                                                       <mailto:vgo@ratio.de>
>  0xB1  00-1F                                                          PPPoX
>                                                                       <mailto:mostrows@styx.uwaterloo.ca>
> +0xB2  00     arch/powerpc/include/uapi/asm/papr-vpd.h                powerpc/pseries VPD API
> +                                                                     <mailto:linuxppc-dev>
 
This hunk should probably go in the previous patch.

cheers
