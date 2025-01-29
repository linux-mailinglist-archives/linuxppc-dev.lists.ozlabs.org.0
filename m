Return-Path: <linuxppc-dev+bounces-5692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4402A225FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 22:57:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yjwxf2wNpz2yZ6;
	Thu, 30 Jan 2025 08:57:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::230"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738186156;
	cv=none; b=EkFbrkeCeY1ggO1BNUdKexYztgamg/YdbKlL5e9wNVu1kQL/32zrqt3uUzsh+0DfwR4geez7xNUtC/PR0poFdpRcvJZlpaTJgz6MMtEt+HoAolz98tGEJWITB1p//6PNITipahv420CTlJ4LVZACC0vNFtnn3vv7SDLhBu9xD6j99uYwhe+LHe+z9uVhrVU+o9+IKuxeFyldL76GOEnMek+SmahfMUq+75TiygcYcFSgH2sMxz30QXFG9703dy4hF5NanbjeJBQMV3cKxbu/NMQNefMDX44XIjmMt/pZPHzhv5SafYHf80XSH2hAtBTtaL32QckZifyUIvIS3ps7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738186156; c=relaxed/relaxed;
	bh=GT0rFmaKToeuXSjRSzkL/lRENUooY068EpzaG7EWYO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=dCRnd7Tsq848YAYnsGOPyWkIykUcmIkO6tOk5FbIlL2quqyluNvQLAP58PdQDzYqnklijvnLXFXNlnxFFvDngklzvcqvlZdwFlipwTmt03SX4diuu3CVCzivIOOoVVubYmZ1BK/DTUHFlWfEPHDJs07Bp3LeT98Z4LNvJJi7xFfPovvt8LIb8pohISQS9upvVN7698cTCw41+p7AVxIldkhk3Z3vrpQmpgRci5bSbTnP5QdMbUGgxLq9r6Xbt2y6ncZJeueyXgieg9nOQanfxWqQ8SyB/XP7pzLU8Etq8LxN1PiGO2Dyx8pBVls5d8uRD/vrQr3qzaqA7y5FK4RIbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RTs4HpgP; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RTs4HpgP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=tamird@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjwJp6HK3z2xk7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 08:29:14 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-30229d5b229so724261fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 13:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738186149; x=1738790949; darn=lists.ozlabs.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GT0rFmaKToeuXSjRSzkL/lRENUooY068EpzaG7EWYO0=;
        b=RTs4HpgPEFQt7/XxmLEdCQ8kEwZre1z8RAQkzKzR68wCsA+pJdmd2TPlbM9lXYRefo
         KnDylhovdR43zEPmZdIzHrPC/crlxzANHn8aZLJefU1qBXOh8SZ90seCqKH1uGOLJ8rE
         CAHdEjrEo8SjzUth+aA7lDsmFAzKtfNMQ7fSZDXr88Nd0NOAmAHzLiqffCX/apMDje3S
         tLQRi/gRDtsqcZO9nMWdObS91afNhzyX6eAUFtWBCLs7Uxc3KewSL/djOF+CRWNOcYh2
         yVTfCwpTu4KDjSPh58tBQ01Vbk3NJL0Lro6EKpMtWVRbyvKB9JVpOFtdSyOvl7/ZHl7Z
         oQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186149; x=1738790949;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GT0rFmaKToeuXSjRSzkL/lRENUooY068EpzaG7EWYO0=;
        b=UyU60OXgZ/w8ePF+NflmqQ3LGqdwWA2yetqR2dFweclNVczboGevUV4jSoK5WlDb1i
         y6YH3jtjP+G98xeHezP3iEj9/FKph3PFKIqAhJI71V9cUiT3S1uV/aO4Gds5Br4NgeoL
         eMsdpIQSRVKpgGx57jiKM0tKgtCCJyLO9JwZSUFcnr8R5t01hoKPbTYh1vcXLoWR2dZm
         fcBplnKlzlfblcxy+MQ0TQiVqflUHjS6HE5pNgMYC0GtOxTUl3ZXwZUZsr5qC5dwgYkF
         EhGAwdk1z6b7TXCxiCkBhkSO8HWbJFyyKK6o+MfZopW6dOEG4Y29G47kofEyw/c0E9d/
         uvpA==
X-Forwarded-Encrypted: i=1; AJvYcCW7eEGCV5qvWVExNFrowh2M79OyxFT/4ae+IEmKxGkJOdfeVhj6YGenLoZpUyepe/wumL3V1iuBVWx1zL8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YztXL3Wsu1e9zyt8jjL0usSU21p+579IUaHWz5RR7jMo+zJkaVk
	jgvk9Co/100reGtyq4qXu2aIq9Jj6ZNHl49P7S/Vb1oibtGuppIncOxBUZP4uoJM1f4H6xdIoDY
	ekwG55jX7CGd+1sfpIGKew92NW6k=
X-Gm-Gg: ASbGncteI8293pUSwFq5af+tgEKWlAZWvGsqiQCf8THXfecKf8xV73YNFDT6duIkLox
	/63a9ERrm4QV4F3M/QWOiDrgQJHUBxDluJjUpwogWkO+ZyjKgYLBhM+ECdRgOdWiROT2vkE2U1C
	6jRmp5dmRCwYvYOFpQI9vAzgiQTqdDMA==
X-Google-Smtp-Source: AGHT+IEini7TIAvHWFfZWJAA/DIhlgY7ELxTDYTMmVhvFmOP3+WEeVrbZSpqp7JMDeFBEGMKPTMSdGVLiQ0G7+RO3zE=
X-Received: by 2002:a2e:bc26:0:b0:302:49ba:2550 with SMTP id
 38308e7fff4ca-307968572cemr17704121fa.21.1738186149080; Wed, 29 Jan 2025
 13:29:09 -0800 (PST)
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
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
In-Reply-To: <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 29 Jan 2025 16:28:32 -0500
X-Gm-Features: AWEUYZm30qzC7OYicUCyM7022EFlqK5dvrSLqA0Ri2_QEk_6Vs9gveN9uXDYy-8
Message-ID: <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	tamird@gmail.com, akpm@linux-foundation.org, christophe.leroy@csgroup.eu, 
	geert@linux-m68k.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, 
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 4:26=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Sidhartha Kumar <sidhartha.kumar@oracle.com> [250129 16:02]:
> > + Liam, Matthew
>
> + linux-mm
>
> Thank you Sid.
>
> >
> > Hello,
> >
> > I believe this patch needs to be reverted for now as it breaks the
> > user-space build of /tools/testing/radix-tree with:
> >
> > In file included from xarray.c:11:
> > ../../../lib/test_xarray.c:9:10: fatal error: kunit/test.h: No such fil=
e
> > or directory
> >      9 | #include <kunit/test.h>
> >        |          ^~~~~~~~~~~~~~
> > compilation terminated.
> > make: *** [<builtin>: xarray.o] Error 1
> > make: *** Waiting for unfinished jobs....
> >
> > this then prevents the maple tree test suite from building.
>
> How are grammar corrections going to the right person (but not the
> mailing list) while an entire conversion to kunit is not [1]?

Very simple: the tests are not properly included in MAINTAINERS. I
sent https://lore.kernel.org/all/20250129-xarray-test-maintainer-v1-1-482e3=
1f30f47@gmail.com/
a few minutes ago for this reason.

> Does the patch really need to drop the module testing too?
>
> What exactly is the point of converting one testing system to another
> besides disruption of actual work?  Who asked for this?  What is the
> point?

All this is described in the commit message.

> Is anyone doing work on the xarray running the kunit tests?

I was doing work on xarray and I was running the kunit tests.

> This should be reverted as it should never have been merged.
>
> Regards,
> Liam
>
> [1]. https://lore.kernel.org/all/20241009193602.41797-2-tamird@gmail.com/

