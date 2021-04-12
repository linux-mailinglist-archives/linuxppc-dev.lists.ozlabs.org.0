Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BB635C6D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 14:56:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJpdw6NY6z30Gd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 22:56:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ctnylBHF;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=rCz08sj8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=ctnylBHF; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=rCz08sj8; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJpdW0sjLz30BV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 22:56:15 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1618231670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XDUgZVHsV7/vHCbmfDZhFYUbv1Qm8FRk0fOlAV4IBn0=;
 b=ctnylBHFtV4GSt7oxiFjMPSTheoqRRPDVjTVvDiKGe7EYKwowFtZXntvohPz09OyXmo6Ge
 Tlh5OIYTmAN2Mp3aShUrlGOVcSEVdYopsWflLA15/mCCPF6qjaLD0ERd/ogiqBtc7zRCQp
 ucSKvEUYbb2RzWENP+EOLUDWbTLz7mUFJjYEA2wNAq0aURiejvFcmySEoxg/RU8imxLFYX
 4ZBHSBvUobC2Nfzo+h3/BTwtMvgMbT8nZv8PjRB7T/TS0eW7dB/aPwLxUhDk1JGop/RjYM
 UXAPZR63YLOIAj+NOISgSQwdo66GiNIHAPSWlXw+CJtkdyjK6dab4/xRfPPpmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1618231670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XDUgZVHsV7/vHCbmfDZhFYUbv1Qm8FRk0fOlAV4IBn0=;
 b=rCz08sj8BXMgUVLsgDotEOxcVLgGrnuIVx/2ybSd/XFsXsmTp2mLdwFk0arl2G6Jr/08vS
 aCPvCbZrIZh0C/Dg==
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH RESEND v1 1/4] lib/vdso: Mark do_hres_timens() and
 do_coarse_timens() __always_inline()
In-Reply-To: <90dcf45ebadfd5a07f24241551c62f619d1cb930.1617209142.git.christophe.leroy@csgroup.eu>
References: <cover.1617209141.git.christophe.leroy@csgroup.eu>
 <90dcf45ebadfd5a07f24241551c62f619d1cb930.1617209142.git.christophe.leroy@csgroup.eu>
Date: Mon, 12 Apr 2021 14:47:49 +0200
Message-ID: <87r1jf1xfu.ffs@nanos.tec.linutronix.de>
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, dima@arista.com,
 linux-kernel@vger.kernel.org, avagin@gmail.com, luto@kernel.org,
 vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 31 2021 at 16:48, Christophe Leroy wrote:
> In the same spirit as commit c966533f8c6c ("lib/vdso: Mark do_hres()
> and do_coarse() as __always_inline"), mark do_hres_timens() and
> do_coarse_timens() __always_inline.
>
> The measurement below in on a non timens process, ie on the fastest path.
>
> On powerpc32, without the patch:
>
> clock-gettime-monotonic-raw:    vdso: 1155 nsec/call
> clock-gettime-monotonic-coarse:    vdso: 813 nsec/call
> clock-gettime-monotonic:    vdso: 1076 nsec/call
>
> With the patch:
>
> clock-gettime-monotonic-raw:    vdso: 1100 nsec/call
> clock-gettime-monotonic-coarse:    vdso: 667 nsec/call
> clock-gettime-monotonic:    vdso: 1025 nsec/call
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
