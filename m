Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2006A43D9A2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 05:04:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfr4Q6ydKz3c4y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 14:04:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EY7OQ7FX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EY7OQ7FX; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hfr3m00Cjz2xXD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 14:03:31 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id b1so1091017pfm.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 20:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=463/AMybRoabvVDu2DcKn//tNkuBN1MCjFKTLHz4IGM=;
 b=EY7OQ7FXlSGTQxCymG4F1tYka7G9wOL3GV6XB4X2OlrQ4UUQmNyagOy/ZrNqZHzOO3
 88Woj3vopMB+EeJTJdKONe+gsi4Q/1fCn+KkN+s+QKfQjSNKGzBTlejlP8HaCJmCmBeG
 NSXdW4hThIgDTUQKGR+0dT1pUSenf8IoSAcwdT/bckjnF3uhIyEnn0jTynX6KcC0NB1P
 KpEzWTCqrbKOQOotzl90WMw20IEXszyF8fAYOHOPrgH7NKU5tWwTBiW0UNlnFHPByBMQ
 JI+qi4dcfDMwz+FffE2fFYKaA26Gc8yDxja1Q7af1HncxLkG/9oMratO5orZbjMVd0x3
 4DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=463/AMybRoabvVDu2DcKn//tNkuBN1MCjFKTLHz4IGM=;
 b=eLiI0sVR8PsON4osr0JDc3Z09NsfxhxM7M0Tew8KK73ICcnDehYE6dJ8suX3WcqpTh
 f3Nhc1XVsHnWs+4xk/Wk/xg0rUVEGgA9/1CItWcMLkZP/0xDg3tMBrOouuG03N4Gxbtr
 3Gs2s+ktlBDuhucsl6JL2CJQ8wUlFWcifYGoCMew4EqVUtOScNc+xvbDUD8aQt0h0/6b
 z3x8FQyGYTL/PRQm7HTCu5ypJKEJ8d88evNuNScXNp9isUAtThU3VecNss8BTHcwspR8
 BYA2MeqaYxsc3CecOm3kiJBJWpIDLnjcVsiWENgBBn7zCrrwInvWQuq/P6jAqFznCg3A
 eEkg==
X-Gm-Message-State: AOAM530Ywt8vChG/cu/VCqZ7+TU2x36ggaIGvR8URJOElMji688msZ8g
 U01SFjELMLL8is2hiWKNr5AHdoqe2NI=
X-Google-Smtp-Source: ABdhPJweXqXBqdZv6l0ac7GihRnm2Pghp2U3v071OJkTm3ztFz4VZ2er0b5UTpW6nGAx44h+NTWpaw==
X-Received: by 2002:a63:7341:: with SMTP id d1mr1233985pgn.294.1635390209641; 
 Wed, 27 Oct 2021 20:03:29 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id i128sm1287134pfc.47.2021.10.27.20.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 20:03:29 -0700 (PDT)
Date: Thu, 28 Oct 2021 13:03:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/security: Use a mutex for interrupt exit code
 patching
To: linuxppc-dev@lists.ozlabs.org, Russell Currey <ruscur@russell.cc>
References: <20211027072410.40950-1-ruscur@russell.cc>
In-Reply-To: <20211027072410.40950-1-ruscur@russell.cc>
MIME-Version: 1.0
Message-Id: <1635390156.m54wv9anx4.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Russell Currey's message of October 27, 2021 5:24 pm:
> The mitigation-patching.sh script in the powerpc selftests toggles
> all mitigations on and off simultaneously, revealing that rfi_flush
> and stf_barrier cannot safely operate at the same time due to races
> in updating the static key.
>=20
> On some systems, the static key code throws a warning and the kernel
> remains functional.  On others, the kernel will hang or crash.
>=20
> Fix this by slapping on a mutex.
>=20
> Fixes: 13799748b957 ("powerpc/64: use interrupt restart table to speed up=
 return from interrupt")
> Signed-off-by: Russell Currey <ruscur@russell.cc>

Doh,

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/lib/feature-fixups.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature=
-fixups.c
> index cda17bee5afe..9956277fbd88 100644
> --- a/arch/powerpc/lib/feature-fixups.c
> +++ b/arch/powerpc/lib/feature-fixups.c
> @@ -228,6 +228,7 @@ static void do_stf_exit_barrier_fixups(enum stf_barri=
er_type types)
> =20
>  static bool stf_exit_reentrant =3D false;
>  static bool rfi_exit_reentrant =3D false;
> +static DEFINE_MUTEX(exit_flush_lock);
> =20
>  static int __do_stf_barrier_fixups(void *data)
>  {
> @@ -253,6 +254,9 @@ void do_stf_barrier_fixups(enum stf_barrier_type type=
s)
>  	 * low level interrupt exit code before patching. After the patching,
>  	 * if allowed, then flip the branch to allow fast exits.
>  	 */
> +
> +	// Prevent static key update races with do_rfi_flush_fixups()
> +	mutex_lock(&exit_flush_lock);
>  	static_branch_enable(&interrupt_exit_not_reentrant);
> =20
>  	stop_machine(__do_stf_barrier_fixups, &types, NULL);
> @@ -264,6 +268,7 @@ void do_stf_barrier_fixups(enum stf_barrier_type type=
s)
> =20
>  	if (stf_exit_reentrant && rfi_exit_reentrant)
>  		static_branch_disable(&interrupt_exit_not_reentrant);
> +	mutex_unlock(&exit_flush_lock);
>  }
> =20
>  void do_uaccess_flush_fixups(enum l1d_flush_type types)
> @@ -486,6 +491,9 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
>  	 * without stop_machine, so this could be achieved with a broadcast
>  	 * IPI instead, but this matches the stf sequence.
>  	 */
> +
> +	// Prevent static key update races with do_stf_barrier_fixups()
> +	mutex_lock(&exit_flush_lock);
>  	static_branch_enable(&interrupt_exit_not_reentrant);
> =20
>  	stop_machine(__do_rfi_flush_fixups, &types, NULL);
> @@ -497,6 +505,7 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
> =20
>  	if (stf_exit_reentrant && rfi_exit_reentrant)
>  		static_branch_disable(&interrupt_exit_not_reentrant);
> +	mutex_unlock(&exit_flush_lock);
>  }
> =20
>  void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void=
 *fixup_end)
> --=20
> 2.33.1
>=20
>=20
