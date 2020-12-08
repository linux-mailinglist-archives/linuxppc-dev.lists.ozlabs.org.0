Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9AA2D28F2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 11:33:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqxNS0QXxzDqKL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 21:33:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqxLj35f4zDqXd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Dec 2020 21:31:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hO16MBQU; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CqxLh0QD9z9sVq;
 Tue,  8 Dec 2020 21:31:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1607423516;
 bh=MPcF67N3v1hOIbxAgpuRIEx1XawE6aPP8gebLHzgzPU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hO16MBQU6Y0fcx6t4JGyGF22L8FtI41d1pO7lYZM5nPWJsO5QShz9rw3vuiw042Lf
 ndVlOvdnp9ekCgTA5yt1bPwkk++eE5p/dHjib+DKpbM1R5+uyWHYX13pCInF5vF+MG
 9xLS654YFD0yYEc5sAFfDlBrV34Xft9jOlLz1CytjlBY4NYB5TjQvVRmXubI894ptI
 ouyVnidXavMVgw0QwuSa6aX5spMRuSdereta3jBUqMsIJuTo9Wb8/HhKEia9FHEKk9
 bqn9aadiMgjVLGO1zq6G0D5PhZT48qO2ocNGqY7RR16pyNEQpYGvQ3UyBo+4Ikrb4B
 siy9pJcoF7X1w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/mce: Remove per cpu variables from MCE handlers
In-Reply-To: <20201204102310.76213-1-ganeshgr@linux.ibm.com>
References: <20201204102310.76213-1-ganeshgr@linux.ibm.com>
Date: Tue, 08 Dec 2020 21:31:55 +1100
Message-ID: <871rg0twpw.fsf@mpe.ellerman.id.au>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
> diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
> index 9454d29ff4b4..4769954efa7d 100644
> --- a/arch/powerpc/include/asm/paca.h
> +++ b/arch/powerpc/include/asm/paca.h
> @@ -273,6 +274,17 @@ struct paca_struct {
>  #ifdef CONFIG_MMIOWB
>  	struct mmiowb_state mmiowb_state;
>  #endif
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	int mce_nest_count;
> +	struct machine_check_event mce_event[MAX_MC_EVT];
> +	/* Queue for delayed MCE events. */
> +	int mce_queue_count;
> +	struct machine_check_event mce_event_queue[MAX_MC_EVT];
> +
> +	/* Queue for delayed MCE UE events. */
> +	int mce_ue_count;
> +	struct machine_check_event  mce_ue_event_queue[MAX_MC_EVT];
> +#endif /* CONFIG_PPC_BOOK3S_64 */
>  } ____cacheline_aligned;

How much does this expand the paca by?

pahole can tell you.

cheers
