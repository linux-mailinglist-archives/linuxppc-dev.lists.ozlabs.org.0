Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C31AA6FBCD6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 04:03:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFhKL498Yz3fM2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 12:03:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JHxoK9Cs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JHxoK9Cs;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFhJV6nWkz3bhx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 12:03:06 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1ab05018381so49683185ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 19:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683597783; x=1686189783;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaAeYFv7udNN0GYWv2zTb0pj6ejX9+MTZEeE0B+wMj0=;
        b=JHxoK9CsF0874TsF1M36UgkPE5jnLS3/9hNRPKQGYlwc5ERDid/+2ib4tR5ZlSc/uA
         YWihvUXsI1gAbY0x3rZuy6Hs1tU23+RyrgLnaJ8c6kzCjAcyFoV+UIEGd6UTrEGDBY9K
         kIiZU6+wV81+nGpi/qBBLRqKY5MWEiVUqd7f/B2vl3L6JOInsTPkt9SJz9qyvQ4QbN8j
         BQJYFF/WV++L5cPzG23MmMZaU6EIeQE9ZvnMd1H5HaHm9RfFzgu8o8yxYYEIyh6i7VA0
         z1pCtxKZYo0dOymU+nmepA6PYQ2P16CHa3irP4y5ovl4Jpw1QN4ClpH2vEdjuF11djfX
         gM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683597783; x=1686189783;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zaAeYFv7udNN0GYWv2zTb0pj6ejX9+MTZEeE0B+wMj0=;
        b=CxQ7dyE7fF0jow0biFcnRqeg6KCpx9L7VB4Q2JCH2OamlQLOiqn5vWt9AO5qxBNC41
         w6X9qbCqhNeaJu0eu9IlEGhK61zsJwpEDCKIhe1fLCsbKVKbBxiaUvJd9I+WF1uQrvth
         kETN/QHO2g1/OaSR1Bnhh1CoQD18WSw9oq4EsPJchzHkpVGrK+pyPSNw1lREVB5IF0YI
         ZyO6KX3Tieoya7uMCcGBhDCj+/QoEz9CCZlc1fVLsrECSAkzPbpxPiux4qSPHbCtGk9X
         5D3R00QdVznFirbjUM/zq6zH3Rc4RV64FlED2BJ3Vq816lOEFuwaX12MZtEZq+5k9HCI
         XOeA==
X-Gm-Message-State: AC+VfDx+Whg18Z5uo3NuAAlVIWo6zh/jT6BppGJ5XcpLzCJSDJN09YXR
	7b7w5NKS4Mj5g6RrPTlf6Ds=
X-Google-Smtp-Source: ACHHUZ439ZjXiKCY8yMRlXQKPCDmqtfEA8aHqCOn+w90AgDWIKB9jLhKcVtrvVUJSXBD7b8X50uatw==
X-Received: by 2002:a17:902:db0e:b0:1ab:12cf:9e1c with SMTP id m14-20020a170902db0e00b001ab12cf9e1cmr14525042plx.32.1683597783482;
        Mon, 08 May 2023 19:03:03 -0700 (PDT)
Received: from localhost (58-6-235-78.tpgi.com.au. [58.6.235.78])
        by smtp.gmail.com with ESMTPSA id y19-20020a170902b49300b001a1ccb37847sm155667plr.146.2023.05.08.19.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 19:03:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 May 2023 12:02:57 +1000
Message-Id: <CSHDLPIYXIFS.2XHMUEQ2D0E52@wheely>
Subject: Re: [PATCH 02/12] powerpc: qspinlock: Mark accesses to qnode lock
 checks
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-3-rmclure@linux.ibm.com>
In-Reply-To: <20230508020120.218494-3-rmclure@linux.ibm.com>
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
Cc: arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon May 8, 2023 at 12:01 PM AEST, Rohan McLure wrote:
> The powerpc implemenation of qspinlocks will both poll and spin on the
> bitlock guarding a qnode. Mark these accesses with READ_ONCE to convey
> to KCSAN that polling is intentional here.

Yeah, and obviously pairs with the WRITE_ONCE so comment isn't really
necessary.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
>  arch/powerpc/lib/qspinlock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 9cf93963772b..579290d55abf 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -435,7 +435,7 @@ static __always_inline bool yield_to_prev(struct qspi=
nlock *lock, struct qnode *
> =20
>  	smp_rmb(); /* See __yield_to_locked_owner comment */
> =20
> -	if (node->locked) {
> +	if (READ_ONCE(node->locked)) {
>  		yield_to_preempted(prev_cpu, yield_count);
>  		spin_begin();
>  		return preempted;
> @@ -584,7 +584,7 @@ static __always_inline void queued_spin_lock_mcs_queu=
e(struct qspinlock *lock, b
> =20
>  		/* Wait for mcs node lock to be released */
>  		spin_begin();
> -		while (node->locked) {
> +		while (READ_ONCE(node->locked)) {
>  			spec_barrier();
> =20
>  			if (yield_to_prev(lock, node, old, paravirt))
> --=20
> 2.37.2

