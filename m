Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E762702379
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 07:49:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKT2P0H2fz3f66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 15:49:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Iy/Emt8j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Iy/Emt8j;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKT1b3d5hz3bbD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 15:48:19 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64ac461af60so3509687b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 22:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684129696; x=1686721696;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lKqp6WmHcJqq21uNLOFJBccUKu+cxU89IFAkkDJSno=;
        b=Iy/Emt8jgOOmw5lxUhYXYXR8xuDttCDi6Tx70w/rb93Rz/d4QDp778B3VvxAZ4YMEb
         P/ksMxGZRwZiRPfinoFClPmVTuajqZEvOHn7IPOmjzhT7KOMyODlHycWZKYkxbm9P8SG
         ZVoVqGVUlfyFFTUhGTMB5j0p3yis2lcp8n3cLnI5gaZpklE5uY6JyNCTefCEjPVklI1p
         Joie2wvEokW1khncPnWbN3CjAzG43JvnBKAxow0ig1Hm4Z04x9yAxBJQVIVqVaBwoEBb
         JgQobqf0TIDm4x7qB4wrJPVHzNA4YfOKk5xts+S87viaafGD2MuSuFN1bzxU3ZEoxXOM
         S4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129696; x=1686721696;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1lKqp6WmHcJqq21uNLOFJBccUKu+cxU89IFAkkDJSno=;
        b=ZcYxM2+e46rqG/fV2K2smAZdpTVHFLuZId3UBg8cjLrIIOGHvhiPypbjU9GXDV9vMB
         AknS30P7U6ksKFGVGiuhpyfPs6qb/ACbq9Jx3Fs4ShMNu5KSVRPa2ctbKpA2aPqThgWQ
         76EnOwlooK9X/iv2WiuR7gBzubJUpPCPw6v5SQV1BoEEbcykZqSpRuFaXdFQXQq5ly0Z
         2XbfyU/fZbZXMk6VgcyMSELC4Buh3D6QjBr4DJa2WHLi9KCUeJ/2ExU+eGPuOeciZ4Jg
         0ceXJPLGhU8bBA9EloTZxRN1xCgyMHSDtAQZONJteY2fPPGV5L5CFSHPkKcOr7fCHNzZ
         fidw==
X-Gm-Message-State: AC+VfDx9++qwmo6KEcQ7u93mBTq3jDSH+qhL/Fvf8tTdCT5/bGqnuGvw
	Tqwn22W+g9/ehGTdkAz71ts=
X-Google-Smtp-Source: ACHHUZ5dFomFERvRfJfCCS3uMgpcZhbwcjyNDz55eYQwQe2+kd4XIe95UPYBslXwvCPasbtSk49TaQ==
X-Received: by 2002:a05:6a00:21c9:b0:645:1081:98ec with SMTP id t9-20020a056a0021c900b00645108198ecmr36523772pfj.13.1684129696370;
        Sun, 14 May 2023 22:48:16 -0700 (PDT)
Received: from localhost ([1.146.119.84])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7818d000000b0063afb08afeesm10952813pfi.67.2023.05.14.22.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 22:48:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 May 2023 15:48:10 +1000
Message-Id: <CSMM5EX700IU.1TPP0VCNERWLJ@wheely>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2 03/11] asm-generic/mmiowb: Mark accesses to fix KCSAN
 warnings
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.14.0
References: <20230510033117.1395895-1-rmclure@linux.ibm.com>
 <20230510033117.1395895-4-rmclure@linux.ibm.com>
In-Reply-To: <20230510033117.1395895-4-rmclure@linux.ibm.com>
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
Cc: gautam@linux.ibm.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed May 10, 2023 at 1:31 PM AEST, Rohan McLure wrote:
> Prior to this patch, data races are detectable by KCSAN of the following
> forms:
>
> [1] Asynchronous calls to mmiowb_set_pending() from an interrupt context
>     or otherwise outside of a critical section
> [2] Interrupted critical sections, where the interrupt will itself
>     acquire a lock
>
> In case [1], calling context does not need an mmiowb() call to be
> issued, otherwise it would do so itself. Such calls to
> mmiowb_set_pending() are either idempotent or no-ops.
>
> In case [2], irrespective of when the interrupt occurs, the interrupt
> will acquire and release its locks prior to its return, nesting_count
> will continue balanced. In the worst case, the interrupted critical
> section during a mmiowb_spin_unlock() call observes an mmiowb to be
> pending and afterward is interrupted, leading to an extraneous call to
> mmiowb(). This data race is clearly innocuous.
>
> Mark all potentially asynchronous memory accesses with READ_ONCE or
> WRITE_ONCE, including increments and decrements to nesting_count. This
> has the effect of removing KCSAN warnings at consumer's callsites.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> Reported-by: Gautam Menghani <gautam@linux.ibm.com>
> Tested-by: Gautam Menghani <gautam@linux.ibm.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: Remove extraneous READ_ONCE in mmiowb_set_pending for nesting_count
> ---
>  include/asm-generic/mmiowb.h | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
> index 5698fca3bf56..6dea28c8835b 100644
> --- a/include/asm-generic/mmiowb.h
> +++ b/include/asm-generic/mmiowb.h
> @@ -37,25 +37,29 @@ static inline void mmiowb_set_pending(void)
>  	struct mmiowb_state *ms =3D __mmiowb_state();
> =20
>  	if (likely(ms->nesting_count))
> -		ms->mmiowb_pending =3D ms->nesting_count;
> +		WRITE_ONCE(ms->mmiowb_pending, ms->nesting_count);
>  }
> =20
>  static inline void mmiowb_spin_lock(void)
>  {
>  	struct mmiowb_state *ms =3D __mmiowb_state();
> -	ms->nesting_count++;
> +
> +	/* Increment need not be atomic. Nestedness is balanced over interrupts=
. */
> +	WRITE_ONCE(ms->nesting_count, READ_ONCE(ms->nesting_count) + 1);
>  }
> =20
>  static inline void mmiowb_spin_unlock(void)
>  {
>  	struct mmiowb_state *ms =3D __mmiowb_state();
> +	u16 pending =3D READ_ONCE(ms->mmiowb_pending);
> =20
> -	if (unlikely(ms->mmiowb_pending)) {
> -		ms->mmiowb_pending =3D 0;
> +	WRITE_ONCE(ms->mmiowb_pending, 0);
> +	if (unlikely(pending)) {
>  		mmiowb();
>  	}
> =20
> -	ms->nesting_count--;
> +	/* Decrement need not be atomic. Nestedness is balanced over interrupts=
. */
> +	WRITE_ONCE(ms->nesting_count, READ_ONCE(ms->nesting_count) - 1);

Still think the nesting_counts don't need WRITE_ONCE/READ_ONCE.
data_race() maybe but I don't know if it's even classed as a data
race. How does KCSAN handle/annotate preempt_count, for example?

Thanks,
Nick
