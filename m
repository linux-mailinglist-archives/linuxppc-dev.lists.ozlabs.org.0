Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C4A1E5A70
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 10:11:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XgQ66ByfzDqXJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 May 2020 18:11:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XgN50PD4zDqJN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 18:09:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=syUcOpzn; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49XgN449znz8t65
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 18:09:40 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49XgN43vpjz9sSf; Thu, 28 May 2020 18:09:40 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=syUcOpzn; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49XgN4229Xz9sSd
 for <linuxppc-dev@ozlabs.org>; Thu, 28 May 2020 18:09:40 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id nu7so2829090pjb.0
 for <linuxppc-dev@ozlabs.org>; Thu, 28 May 2020 01:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=t+vS3wEUqkuYrqEPgP2BfvaS1js3qsg+GedWbO2fUjo=;
 b=syUcOpznM72bD2jIS4wA8UodBfePWr2g5H/iR5sOvkegrqjDpemrljX+BIbu86MlMe
 yCBK4mIajhLGYOSek2MHQ0T/3CMry8SWOtl9hDRc5liGqsOWwvG7xN7ZpWnOCWCbX/2j
 4G7W1UDi+z+1MSjj7OnJnxaRQtqDsyGqNI9feKJ5dgECR1JakEV+eF4cXSRV7PuSMqkE
 RhkkMaQRDUervryIrMsDKzydxQSVRjHC/TqgncjiQLA+TJqP5IPJLzaeG+Z0K4WavLIz
 cie0T9kCBWnqmThHM8VJh08JLeNb6GiqJG4ZW19LaM9A6C4jSwnCM0hqxPFE4olHgA3K
 dRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=t+vS3wEUqkuYrqEPgP2BfvaS1js3qsg+GedWbO2fUjo=;
 b=gjTYCMf566DmLea0Oi2HnLGm033lJiNCB8annSs1C8B0Kb/+TA3DowxVjB1BOddqaJ
 sK45Sd5ceknbgmzHUVX25UdNu87UJgqttlwnVbjdaBCyxXGkmbY4F8I7kZWUyXbiZN6E
 ATK/IgASyAt0bfFpKYUQkyjqRi+M+3mJplCdLj/3juvTqnajgtbFPSFcxQ7n4SQ5vSY/
 9hEFABr3dKhrmm2dNLdfxiTOueSxnOq7yMfiJK78dFZLX7AGBMGBVhI3jE6gbU6SzMWM
 QbcUD/IRepVzxd3lHbn7GvSuA95L+sohpaZ1comS5gxPc0bVEvjOoXbDcpGGaJBp/l48
 ygMw==
X-Gm-Message-State: AOAM530a5CXXvmYPfU0dOPWyw/w0whJhNf1OsxNrBmUH+iLopCls2D/u
 kUu/7VUNKYc9JRocwEKJVHFrrBsE
X-Google-Smtp-Source: ABdhPJwNl286E2FWcd6JfVpKv6arjFka9lyoF2CJk1tduboxM6DENM0Zu0CSzda97uUOMM4lpmadyw==
X-Received: by 2002:a17:90a:248:: with SMTP id t8mr2702495pje.67.1590653377493; 
 Thu, 28 May 2020 01:09:37 -0700 (PDT)
Received: from localhost (115-64-212-199.static.tpgi.com.au. [115.64.212.199])
 by smtp.gmail.com with ESMTPSA id
 y23sm3732867pgc.78.2020.05.28.01.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 01:09:36 -0700 (PDT)
Date: Thu, 28 May 2020 18:09:31 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 1/4] powerpc/64s: Don't init FSCR_DSCR in __init_FSCR()
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20200527145843.2761782-1-mpe@ellerman.id.au>
In-Reply-To: <20200527145843.2761782-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1590653317.v5039th2g7.astroid@bobo.none>
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
Cc: alistair@popple.id.au, mikey@neuling.org, jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of May 28, 2020 12:58 am:
> __init_FSCR() was added originally in commit 2468dcf641e4 ("powerpc:
> Add support for context switching the TAR register") (Feb 2013), and
> only set FSCR_TAR.
>=20
> At that point FSCR (Facility Status and Control Register) was not
> context switched, so the setting was permanent after boot.
>=20
> Later we added initialisation of FSCR_DSCR to __init_FSCR(), in commit
> 54c9b2253d34 ("powerpc: Set DSCR bit in FSCR setup") (Mar 2013), again
> that was permanent after boot.
>=20
> Then commit 2517617e0de6 ("powerpc: Fix context switch DSCR on
> POWER8") (Aug 2013) added a limited context switch of FSCR, just the
> FSCR_DSCR bit was context switched based on thread.dscr_inherit. That
> commit said "This clears the H/FSCR DSCR bit initially", but it
> didn't, it left the initialisation of FSCR_DSCR in __init_FSCR().
> However the initial context switch from init_task to pid 1 would clear
> FSCR_DSCR because thread.dscr_inherit was 0.
>=20
> That commit also introduced the requirement that FSCR_DSCR be clear
> for user processes, so that we can take the facility unavailable
> interrupt in order to manage dscr_inherit.
>=20
> Then in commit 152d523e6307 ("powerpc: Create context switch helpers
> save_sprs() and restore_sprs()") (Dec 2015) FSCR was added to
> thread_struct. However it still wasn't fully context switched, we just
> took the existing value and set FSCR_DSCR if the new thread had
> dscr_inherit set. FSCR was still initialised at boot to FSCR_DSCR |
> FSCR_TAR, but that value was not propagated into the thread_struct, so
> the initial context switch set FSCR_DSCR back to 0.
>=20
> Finally commit b57bd2de8c6c ("powerpc: Improve FSCR init and context
> switching") (Jun 2016) added a full context switch of the FSCR, and
> added an initialisation of init_task.thread.fscr to FSCR_TAR |
> FSCR_EBB, but omitted FSCR_DSCR.
>=20
> The end result is that swapper runs with FSCR_DSCR set because of the
> initialisation in __init_FSCR(), but no other processes do, they use
> the value from init_task.thread.fscr.
>=20
> Having FSCR_DSCR set for swapper allows it to access SPR 3 from
> userspace, but swapper never runs userspace, so it has no useful
> effect. It's also confusing to have the value initialised in two
> places to two different values.
>=20
> So remove FSCR_DSCR from __init_FSCR(), this at least gets us to the
> point where there's a single value of FSCR, even if it's still set in
> two places.

Thanks for sorting out this mess, everything looks good to me.

Thanks,
Nick
