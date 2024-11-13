Return-Path: <linuxppc-dev+bounces-3135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A319C6975
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2024 07:48:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpDQ22LcVz2xF8;
	Wed, 13 Nov 2024 17:48:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731480506;
	cv=none; b=LyYFbUD36Uj4GseszPfGTLha3oQmxaheOrrRaYhwkPXUZrQYvjnwaWiEsAzS1geaMpq9bnyxZjfzoL+MB78oAV5MwBg7ruBGQUTRDYLUTvyxlEhqZKPjry60VkL0pi86U/G9HzEHqnhl9uEd3TnEjKGoCkkI9xzaFLEdC6+FshbAtb9phxPTV7rBQF3X8x/mzmgIGOJOl8Iheh0JHDv8SqCGXXzFWtNb5XwWkAac2undNMkF9OGjB4jR0+9cZjANwAlPdv9KFjK6JxAjlofNi2biR+H9QOxOveKAgBcbf0jgAG8Fu8R42zjBbDF/Oyq5kMHxtpxy1D6HYy2l+Dzbrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731480506; c=relaxed/relaxed;
	bh=UR7iHX45jbd3zRVPmJ4qHkxT+yZlpGkin9tX25AvgR0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FfvHPk5geqZGsx+F4H07jE9mdKNUaUPA6SYIRimq4BIPwCSgdKbnog0L4kwrpPfxAutZLX4+n8QihL5AMhzKefet/f4fzR+u6NCMzkiaBoabGTsIvjOH4ulqfHsX4Few0yFHtplF+0RwofYtj4T0gcqXnarMWg/mrbECdSkyLC8K4lD1UpqH+BmKwr74QnYhtzgb1D0G+otMJhcHtD/3Kzpzed28KPjlAuVNo9ikTxx1Y0rHSIIvDoHpL2Qj9MjI75aPFbD0j83WINDze0BVl6tAfT5VFqBpd6OZcAuRxOUU6cxt/CRReUbe3LXqKkP4EKg2g8+M+BrOeWCr98F/LQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3ZsovUEn; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ba9jOIpj; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3ZsovUEn;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ba9jOIpj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpDQ10FLTz2xBx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 17:48:24 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731480502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UR7iHX45jbd3zRVPmJ4qHkxT+yZlpGkin9tX25AvgR0=;
	b=3ZsovUEn7U16XXODrRWvxNWP2Mgzs/aXaJj1/eAlbViEspVwXOBG+W6vn1RY9ptwtFU312
	zK8FrIbQBaNPBD9jw71eQ9jXXlOv8TcaEID3LE12iHO0DOZ0PJssOUWiFNZTVSc4TvD8xp
	UMiBYwuzcx0jqOvaQdBKSQAMwFh2XfK1NWZvkKrrmIElipF5LHDIcSNhE6uEwfYBvVJPCk
	3607pwdXWYX5pWw2sF/maxJ2x8pAwWW2G4G7+38H9Qds7QiWTZw7v75QxTMUsBrXRwRmv+
	NpS1Kf1rSDX6pMI65yuPvm7/uhimYjEhFKaG2whfkI+/PpBpPEDf5yfQfCLLLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731480502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UR7iHX45jbd3zRVPmJ4qHkxT+yZlpGkin9tX25AvgR0=;
	b=ba9jOIpj4HnkGH2jX2YjXl87zvrewCJ07aMGMo/cWthoagyG2h2Fo2HQ4s0kJJJbANLLlT
	zKEShp2MRIZfW6Dw==
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: Re: [PATCH v2 3/8] powerpc/debug: implement HAVE_USER_RETURN_NOTIFIER
In-Reply-To: <027637B09D70E22F+20241111031934.1579-6-luming.yu@shingroup.cn>
References: <20241111031934.1579-2-luming.yu@shingroup.cn>
 <027637B09D70E22F+20241111031934.1579-6-luming.yu@shingroup.cn>
Date: Wed, 13 Nov 2024 07:48:37 +0100
Message-ID: <874j4bmxx6.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 11 2024 at 11:19, Luming Yu wrote:
> enable the common entry of user return notifier for powerpc as
> a debug feature.

What's the debug feature?

There are ZERO user return notifiers registered in PowerPC, so your
"debug feature" is just a waste of CPU cycles.

Thanks,

        tglx

