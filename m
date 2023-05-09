Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AB16FBCD1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 04:02:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFhHv1VJtz3fNg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 12:02:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Z1Us0E4V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Z1Us0E4V;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFhH10hzRz30Qg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 12:01:46 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5144a9c11c7so4962387a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 19:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683597704; x=1686189704;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMal9qMmlmz+4Ta3/kSEeyBhxY5YcPJzzn4GGqRIQc4=;
        b=Z1Us0E4Vj2VW2k3ErtigDOZjWuIga/J7oQ9oqPScONRjRDbLhdJ7kwQcDggRtMRPWs
         htXs25NGS/JYXTLq6RWiwJliQegiOp8zmF+ssjnx/DetzDY3NjPgG76ZZqaS8RZw0izu
         93V+XLaFkCRXeCWUPlUgy/GY6ktZgw7F+2rGdJZ25H4OtSSmrPdf7G49NkoARdi/ISQ2
         ttGgEeIUFtA4E7g4egDFH/6IL3dCW8od5ZRxEiz5rbFHy1PKuP0hHC0ycO8PC210NJcD
         3mq9/I9qFh43t7/mF/OTrOCaX3dNRW85D9cMA9OQDIbeLtGqLoNYGoQWbl/hFbjGhiP0
         iPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683597704; x=1686189704;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZMal9qMmlmz+4Ta3/kSEeyBhxY5YcPJzzn4GGqRIQc4=;
        b=OtxgU6hSDjzP16zQctREQz86eN0oxrlp5jWvrXiElK2ZsEax6O0oehHHwdYb1q7df0
         tRS7vbIxettj555aII7jzwc490GbhIBuW5jvGHQU+ZFUDG32VXfxUarBa4FGUp8hVthG
         Kqqo9UMygj4fEIHZ4h+rJhSENUCvDmhWHWxf+4a73CXn2q+tQfFag4H4KJ5Q0iMpq/oI
         /0uwP0yGtB6H/NMMWdBBouGdUKlYkosFK+PCN2/0aGg/0+hEu/A7odufen6yw5Maiu74
         RSHbii6SwBtUrfppHsicqIBX9QhZpW6pILLwaAymwSykhdFSkDEHXnUZ3ggZ4XgwLEA9
         W8ug==
X-Gm-Message-State: AC+VfDxzK1fB8P3MpybC6JZIcPN1sh56pY4zVWmJ6LuFR3g3kMMtaTEO
	P6UK9V4dheEXebMenISX0Rc=
X-Google-Smtp-Source: ACHHUZ5I6DHHKS6mWD9rg61SuTx3veymRYZgNpiy02tw4zkyqK77DsJBobnSjbScGu5soN6msHiOvQ==
X-Received: by 2002:a05:6a21:6317:b0:eb:6e43:8e1b with SMTP id wu23-20020a056a21631700b000eb6e438e1bmr12951056pzb.30.1683597704044;
        Mon, 08 May 2023 19:01:44 -0700 (PDT)
Received: from localhost (58-6-235-78.tpgi.com.au. [58.6.235.78])
        by smtp.gmail.com with ESMTPSA id p15-20020a63fe0f000000b00514256c05c2sm167661pgh.7.2023.05.08.19.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 19:01:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 May 2023 12:01:37 +1000
Message-Id: <CSHDKOPMRIG3.11WU7D9VOFHWE@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 01/12] powerpc: qspinlock: Fix qnode->locked value
 interpretation
X-Mailer: aerc 0.14.0
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-2-rmclure@linux.ibm.com>
In-Reply-To: <20230508020120.218494-2-rmclure@linux.ibm.com>
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
> A comment accompanying the locked attribute of a qnode assigns a value
> of 1 to mean that the lock has been acquired. The usages of this
> variable however assume opposite semantics. Update usages so that the
> assertions of this comment are reflected in this file.

1 actually means if the lock is acquired for this waiter. The
previous owner sets it to 1 which means we now have the lock.
It's slightly confusing but that's how generic qspinlock calls
it too.

It actually doesn't even really mean we have acquired the lock
though, it means we got through the MCS queue. "Waiting" or
"released" or something like that might be a better name.

Could change the name or comment to make that a bit clearer, but
while it'the same as kernel/locking/qspinlock.c then better
keep polarity the same.

Thanks,
Nick

>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
>  arch/powerpc/lib/qspinlock.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index e4bd145255d0..9cf93963772b 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -435,7 +435,7 @@ static __always_inline bool yield_to_prev(struct qspi=
nlock *lock, struct qnode *
> =20
>  	smp_rmb(); /* See __yield_to_locked_owner comment */
> =20
> -	if (!node->locked) {
> +	if (node->locked) {
>  		yield_to_preempted(prev_cpu, yield_count);
>  		spin_begin();
>  		return preempted;
> @@ -566,7 +566,7 @@ static __always_inline void queued_spin_lock_mcs_queu=
e(struct qspinlock *lock, b
>  	node->lock =3D lock;
>  	node->cpu =3D smp_processor_id();
>  	node->yield_cpu =3D -1;
> -	node->locked =3D 0;
> +	node->locked =3D 1;
> =20
>  	tail =3D encode_tail_cpu(node->cpu);
> =20
> @@ -584,7 +584,7 @@ static __always_inline void queued_spin_lock_mcs_queu=
e(struct qspinlock *lock, b
> =20
>  		/* Wait for mcs node lock to be released */
>  		spin_begin();
> -		while (!node->locked) {
> +		while (node->locked) {
>  			spec_barrier();
> =20
>  			if (yield_to_prev(lock, node, old, paravirt))
> @@ -693,13 +693,13 @@ static __always_inline void queued_spin_lock_mcs_qu=
eue(struct qspinlock *lock, b
>  	 */
>  	if (paravirt && pv_prod_head) {
>  		int next_cpu =3D next->cpu;
> -		WRITE_ONCE(next->locked, 1);
> +		WRITE_ONCE(next->locked, 0);
>  		if (_Q_SPIN_MISO)
>  			asm volatile("miso" ::: "memory");
>  		if (vcpu_is_preempted(next_cpu))
>  			prod_cpu(next_cpu);
>  	} else {
> -		WRITE_ONCE(next->locked, 1);
> +		WRITE_ONCE(next->locked, 0);
>  		if (_Q_SPIN_MISO)
>  			asm volatile("miso" ::: "memory");
>  	}
> --=20
> 2.37.2

