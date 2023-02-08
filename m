Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB5668EE5B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 12:58:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBdmQ3hZnz3f50
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 22:57:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QwKGZvoM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBdlX4ls2z303P
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 22:57:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QwKGZvoM;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PBdlX38R6z4xP9;
	Wed,  8 Feb 2023 22:57:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675857432;
	bh=xdJPhY6WPjUPWKWWfsqTPtWGggaWrMgbhzibTDjwISM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QwKGZvoMI+cNYa8lhdwK7WrgKEGJ726GBaLIFvKTiMRA8phBG8A9io8bdrL36XRkb
	 Di1w5lWMw9NrC5r34RmXkHOCR3NTxznkJkCgWL68KMSm9Tro+438vqPVmb0EMwGSu+
	 nZ6HtI4Ued9GihsSnY+cQGL3FbRkQNMAaqvs5VdlGKeZMtXp9sHFsEIFurFVzaQ7SM
	 mt3WVzWOYv2tTaoXigu2XDB+o/57/SagIhyGda1NLEFeGt8c5v2bXc85umGGzaAoX5
	 CrcwfS/6BR4h0d4JFymtxOJjD4EwPXklsvDXW/zhqonSUweb1moVXk2bOflukorZ8T
	 Ldh6AAyH5WZRQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Kajol
 Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, Mahesh
 J Salgaonkar <mahesh@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Nick Child <nnac123@linux.ibm.com>
Subject: Re: [PATCH v2 07/19] powerpc/rtas: improve function information
 lookups
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v2-7-9aa6bd058063@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
 <20230125-b4-powerpc-rtas-queue-v2-7-9aa6bd058063@linux.ibm.com>
Date: Wed, 08 Feb 2023 22:57:09 +1100
Message-ID: <87pmakwesq.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Submission Endpoint
<devnull+nathanl.linux.ibm.com@kernel.org> writes:
> From: Nathan Lynch <nathanl@linux.ibm.com>
>
> The core RTAS support code and its clients perform two types of lookup
> for RTAS firmware function information.
> 
...
> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> index 479a95cb2770..14fe79217c26 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -16,6 +16,93 @@
>   * Copyright (C) 2001 PPC 64 Team, IBM Corp
>   */
>  
> +#define rtas_fnidx(x_) RTAS_FNIDX__ ## x_

I'd prefer we just spelt it out in full, to aid grepability and
cscope/tags etc.

> +enum rtas_function_index {
> +	rtas_fnidx(CHECK_EXCEPTION),
> +	rtas_fnidx(DISPLAY_CHARACTER),
> +	rtas_fnidx(EVENT_SCAN),
> +	rtas_fnidx(FREEZE_TIME_BASE),
> +	rtas_fnidx(GET_POWER_LEVEL),
> +	rtas_fnidx(GET_SENSOR_STATE),
> +	rtas_fnidx(GET_TERM_CHAR),
> +	rtas_fnidx(GET_TIME_OF_DAY),
> +	rtas_fnidx(IBM_ACTIVATE_FIRMWARE),
> +	rtas_fnidx(IBM_CBE_START_PTCAL),
> +	rtas_fnidx(IBM_CBE_STOP_PTCAL),
> +	rtas_fnidx(IBM_CHANGE_MSI),



cheers
