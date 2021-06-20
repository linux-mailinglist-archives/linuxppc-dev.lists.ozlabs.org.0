Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7753F3ADDBD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 10:20:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G75FM6WcLz30BP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Jun 2021 18:20:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dy5yS+LB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=srs0=/1oi=lo=gmail.com=npiggin@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dy5yS+LB; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G75Dt2Dmyz2yXJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 18:19:57 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4G75Dl6T3Mz9sTD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Jun 2021 18:19:51 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G75Dl68p7z9sT6; Sun, 20 Jun 2021 18:19:51 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dy5yS+LB; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4G75Dl2xdPz9sS8;
 Sun, 20 Jun 2021 18:19:49 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id m17so3695841plx.7;
 Sun, 20 Jun 2021 01:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=D1aqSiYamKHvpWzysQWukR6r0hipBIfBZUVeW6esHoA=;
 b=dy5yS+LBQvxbF8SwIivcZvvzzEtGEoGgr623RfS48AeZIj8cP+kUNvGrcJs7wf7q2V
 hHXkAvfGlTcc4iOm27jsIqVX1aOLPIaqA8UsUrjg02AXxNzTPOdNiC7JDlRVrZRd/nf4
 yITVylTk1zmd23cM+7WquAFTI+K91IyyZuWUJgOWGNQQD/PXOfLsh0y70QK4fZh7Ija5
 u9AYXwjygol8t/HayroxpgUu6XVmPCfauOLofL48jZtAIo8LY3rRhtko64D5if1bIG+U
 thnSP3kn2a4VcxtXnkYJfynNYknKCHIBX8UizZW4w4mhWI1Ygqwyo1F3qeNmSi/OrX3p
 EdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=D1aqSiYamKHvpWzysQWukR6r0hipBIfBZUVeW6esHoA=;
 b=IKH7tAMa+IV2n1oUj3zoMfWBo1fTIsuJRZ1PUXLyUgt6O5Cp6UIOF7tKTW6PTqmU69
 h+E8x64rmdvalTSI6snigP0XHR6RpsvyU9OHuV/IYJNSkSuSwT9szsbZwe+xxfFgxuyo
 DxFvLacFjKkdyq4VR8YjrfOvGb06QYRtHQa+eP5m336eDLPPOAVV6nGnK9i8gfNIFzAy
 evGZ3XL8+qDaWKw75IQpB/7YouMuqOkXB/ZukI3reZepbSugHMy+f17Ihi7dhnLegdNK
 3NdEaaK2BQy9ZD4fpLWOynE1If3d0j76dJtA3+JdBoZN2IBPe3mRonAZCCfFi3JKI6AM
 M2pg==
X-Gm-Message-State: AOAM533qVkfXZL1nbfsMZ967QTM5z5Ym4g0kpFR+UdnPpbjwjmA+Ontp
 IehxZ+IYND5Yl5WXxaS1Bdo=
X-Google-Smtp-Source: ABdhPJwbIOjIkeXdNTID5AYGDQ9+h0dvYRoec3BUu7BH87peSw9LANpJ/1n4OYyJL4598T++DxB9Wg==
X-Received: by 2002:a17:902:e550:b029:110:3074:e7cd with SMTP id
 n16-20020a170902e550b02901103074e7cdmr12674739plf.25.1624177184614; 
 Sun, 20 Jun 2021 01:19:44 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id t19sm14755757pjq.44.2021.06.20.01.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 01:19:44 -0700 (PDT)
Date: Sun, 20 Jun 2021 18:19:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 6/9] powerpc/microwatt: Add support for hardware random
 number generator
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <YMwWPcsaWzMlDPqQ@thinks.paulus.ozlabs.org>
 <YMwXPHlV/ZleiQUY@thinks.paulus.ozlabs.org>
 <1624071936.oqwaldrt74.astroid@bobo.none>
 <20210619143640.GX5077@gate.crashing.org>
In-Reply-To: <20210619143640.GX5077@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1624176949.vsicfg0jsa.astroid@bobo.none>
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Segher Boessenkool's message of June 20, 2021 12:36 am:
> On Sat, Jun 19, 2021 at 01:08:51PM +1000, Nicholas Piggin wrote:
>> Excerpts from Paul Mackerras's message of June 18, 2021 1:47 pm:
>> > Microwatt's hardware RNG is accessed using the DARN instruction.
>>=20
>> I think we're getting a platforms/book3s soon with the VAS patches,=20
>> might be a place to add the get_random_darn function.
>>=20
>> Huh, DARN is unprivileged right?
>=20
> It is, that's the whole point: to make it very very cheap for user
> software it has to be an unprivileged instruction.

Right, I was just doing a double-take. In that case we should enable it=20
in the pseries random number code as well, so it really would be a=20
generic isa 3.0 function that all (microwatt, powernv, pseries) could
use AFAIKS.

Thanks,
Nick
