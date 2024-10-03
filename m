Return-Path: <linuxppc-dev+bounces-1756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3BD98FA1A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2024 00:52:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XKRkw6bGwz3bZs;
	Fri,  4 Oct 2024 08:52:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727975152;
	cv=none; b=jyASbJ4DRZT2JmkCJ6HUNsJ9PZR/W73l59c2ZSZCNZR0wMdptfS4hWW7wv+hkJp1nOBDc+XZsJKskHWGyIzN2YFKgprWrE2U0Tq3JEu5Ty8KFAFcxvwmK7EIbmrwgsgdsKaTr+vZD2tYSvd4jH273IusYatd3w6+SoeBOW3gRc5H6BTiSaGZBfl9IhAZgYBFA5q2Dyu1zNVF9BLMINhx32yFiRS6Vet+fL69z4Wv/Y7WQPP4rmH91rjnJ3QUD6gwK9xIAALDd1w18hlKB9i4qqhrs7SR31eNCaXUS9sF8+xl8fNT39vrdnYiReIjI/jVkfx3mFix97wtqBqC8aZ6VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727975152; c=relaxed/relaxed;
	bh=x1aRqowk+avzQDXULHwlYV3N6dqI2bTShLMMxvbXA68=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lTmrXEEIgyk/xOnjaXauPULWoX5RcvF7xD0+h5y3gvR4q0RrZxkzfxrl2w2Lm9Q9NVvCIFRqEv4sBLNu+33R6nk1EZVbNru2WaAG3kAiZ6jUWztT04z/XRAfs+BNjLj+2OueXxH16dSKeQAiMSRA0rwE1/InVN3vQK0SVMfsyaT0QENuWyQ0/Q9ABioaY0K856+efjAlViumHBABAjeEENe7NrJnAWbzoL8G7EDeW5nuuoKImg6Ya5z/bUL+MPfopZ7BkaTtuzoIeIj7v7LtPG3G7Hu8ZctScOOWc+EM8SaHopq8GXnx4iCZJkoGiZL7D9OyWQev2VUNBRLvEDSl9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BI3RaFUO; dkim-atps=neutral; spf=pass (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BI3RaFUO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=217.72.192.78; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1623 seconds by postgrey-1.37 at boromir; Fri, 04 Oct 2024 03:05:49 AEST
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XKJ3K0Tc0z2xxp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2024 03:05:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727975111; x=1728579911; i=markus.elfring@web.de;
	bh=x1aRqowk+avzQDXULHwlYV3N6dqI2bTShLMMxvbXA68=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BI3RaFUO/IqVYSLIno2H+VgC6jRTGjRmvO6ARpvkaeM9bjGR7UaJ+cyudJiy/paW
	 SShRUCuF6za+2AiFLI6lVnpynfYCOXFXqTWcjjt7fFefj/HC/winOHm8gYeyejcNN
	 zep2PkPh2WYZ3TCEvTz9rAc3vK5rTllKtNDjXO1CUUSnbBNBtdzPnw+HR5gNCyRD2
	 yH2AErWcst71WingjBzq0LapmAha0LG4cBgLdfgq5fUlTQ9FtxwVnwfRpvI7mQIgi
	 yZC5IK52zBbs484UzS3E20fbAPULj0apH7OqA5yiGqdOAOiJQ+C6ZCGACWp/XGEwZ
	 ShT/jDC8FEPzfbNKXg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.87.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MJnrX-1sco2x49gP-00ID8K; Thu, 03
 Oct 2024 19:05:11 +0200
Message-ID: <434320e1-2a30-4362-9212-ca17cdde8b31@web.de>
Date: Thu, 3 Oct 2024 19:05:08 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] powerpc/pseries: Do not pass an error pointer to
 of_node_put() in pSeries_reconfig_add_node()
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <0981dc33-95d0-4a1b-51d9-168907da99e6@web.de> <871qln8quw.fsf@linux.ibm.com>
 <a01643fd-1e4a-1183-2fa6-000465bc81f3@web.de> <87v8iz75ck.fsf@linux.ibm.com>
 <2f5a00f6-f3fb-9f00-676a-acdcbef90c6c@web.de> <87pm9377qt.fsf@linux.ibm.com>
 <afb528f2-5960-d107-c3ba-42a3356ffc65@web.de>
 <d4bcde15-b4f1-0e98-9072-3153d1bd21bc@web.de>
 <8949eefb-30d3-3c51-4f03-4a3c6f1b15dc@web.de>
Content-Language: en-GB
In-Reply-To: <8949eefb-30d3-3c51-4f03-4a3c6f1b15dc@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:l3pgyZOI07Bh3dnf7Bb4Ey6oOw4CTctWcTQzVYrYpobYkMHHXRn
 OPk51Q8pvjKkh1GXivyDLMXfVDWgV17SXTn7dpTpoMJKyR5B9MPUpKdLhFHDwMw8X8qTCY/
 MpN6c2xOvsHPMUhN+ZeRQBCKXhtupcUjNvgF5A5UqRZRi7WsV5o26c+nIi+Rs4CrKnwe0r+
 5GUf7Wh3YrZvtuVgD4Hgw==
UI-OutboundReport: notjunk:1;M01:P0:H1JxztHArQo=;cU/Cb9YdbVJnqdRJnvh/1yWlVIo
 FGsQCXXnJYaq1CgPuH5q2GZ+CEH611VtAZDvcnNaGLpYX5BAgU4/XAHIGBlD/nTs+SKQg71Ez
 OqRQzxJYKJQgHvBjH/Z3o/sbKrzHDdmuYxN2uclk4dh6P+Jbe/MRnSqDS+MIl9WYxEv/jicPY
 1b2dUSlzSK0eKhi+sgXZo9KRzMsNPW+qBmWJam+j9YiRegdxCFUbfXcYdNhK/tDWO1IL3+jqy
 nBYxZRnoPVlchx9XTqwMsdaZYe8l/AgKKocM1pMgMSuRmm58aosPDTFYVsufYGzywLcfZliC0
 3hE/79L+d227eg3CTeVTOtM8jBn0rVNPi7PP9dnEzC6or/Glmcj+XM9GI41j5wa9sxcbrg0c6
 lGSFR1BDbgrt2/hdpzqcC3WjkI6vWr7RwClPiGauzR4cczbL0e3fop8rCFfywcqDIJGkvxhXR
 HY1MS/npuLYQx3WGJ9ffLQXU+COEPhJY72h9c+PXAgywK/94sl6ixVNdjM21TSKjBojX1HNk+
 DNDyc0aTgcDPS9Es0t0e+ublIE6/Yu9+v04wYA0YydWiIBFpCCF/QQDk16KtCGoky/vjMSxS5
 rSMpHM5W8Zg6tUgI5+imto0tftAzfI7VtYpz3cu/N86DzcbS2Ck5gTdhC2QhHkMoR12wxpAhT
 6sCMn3+R0HBf9Jn6d+YPSY9H4cJ2VVkDCGyX9ARdlrnB6TkaqIhiWoinZUGYEXL3H8SJgArqf
 xkum2OQsKay1suUH7SACttEn9BJIMJyw2iwJw1kz0ZBhc+rKR3Pghhl3e8Qgv/SoLiSp5sEhT
 bbNhhBUhEWjGPwtEl3UmwuBw==
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> Date: Tue, 21 Mar 2023 10:30:23 +0100
>
> It can be determined in the implementation of the function
> =E2=80=9CpSeries_reconfig_add_node=E2=80=9D that an error code would occ=
asionally
> be provided by a call of a function like pseries_of_derive_parent().
> This error indication was passed to an of_node_put() call according to
> an attempt for exception handling so far.
=E2=80=A6

I was notified also about the following adjustment.

=E2=80=A6
 * linuxppc-dev: [resent,v2,1/2] powerpc/pseries: Do not pass an error poi=
nter to of_node_put() in pSeries_reconfig_add_node()
     - http://patchwork.ozlabs.org/project/linuxppc-dev/patch/f5ac19db-c7d=
5-9a94-aa37-9bb448fe665f@web.de/
     - for: Linux PPC development
    was: New
    now: Changes Requested
=E2=80=A6

It seems that I can not see so far why this status update happened
for any reasons.
Will further clarifications become helpful here?

Regards,
Markus

