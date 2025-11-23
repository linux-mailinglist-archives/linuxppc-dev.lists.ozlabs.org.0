Return-Path: <linuxppc-dev+bounces-14433-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE34AC7E4A8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Nov 2025 18:11:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dDwTQ0jMgz2yvd;
	Mon, 24 Nov 2025 04:11:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763917865;
	cv=none; b=LcnwQ9PRmUS1SgSpVZ5CdIkXh94y4nrj6RMa8qbikefRX31n74H86Ep6l4w3rd0L7rdLll+bi5uZK0wAxe1vfR3yrqtymuQDtQQlPSlBEU7TU6XxH0H1G/VoxwoRzEHYXKC8RqF697iM919E7wFVAhqg7Yxa0Tk02QxfT5OBGsP7T2+B+AwFB9Klf88kcFkFmWibS7ohzX73KuNVPum2kJ1jEtdg3WsdQOewTNYE80aYcAKeU5RbFyYmjarWDB1N8GXaqsm/EA0USc1X4qwlrwjQDlCYwblqWxOzRNLExzqqhd5HJW2mXL/7AU9lqYRo4dJKU/29tZOl1PPZ3jNPXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763917865; c=relaxed/relaxed;
	bh=1TvV2CIHODDVvcsCFmEG146E5nX65wm9DJeM5XXQwW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISUg9jwLE9jBcWPcbhQ7AjLYmsgUs0ETVAbyK1sDgJk8wYF2mScd4Au1euqw3rpuK6ZzcfnUo4t2Zq0py4jcODPaZ+SPk3UG+JoXX3I+7xTuK9bDwU3uaJ/cUQSveCnVb9zjIVwP7blw2tgR22E9YXEDB1FRktgvc+2DCYSrWKqmORU39qhrl2w1MYR7XJWK5g4b3xJgqZzFRCQ5yd1NBgWWrPZvT7TqVustVRcgAfcAfo+7XMnkQfUEvM+HItNurTqI+ZUDFhp+kRoh2af6tgCyEZ1SY7A8Y+Du0J20QcOP1QveRkcfSKKhwmw2NglGKSrhW38IYrsxyNjW71Lebg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wo8WQpA6; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=H8a+b7E4; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wo8WQpA6;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=H8a+b7E4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dDwTM49vSz2xnh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Nov 2025 04:11:03 +1100 (AEDT)
Date: Sun, 23 Nov 2025 18:10:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763917856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TvV2CIHODDVvcsCFmEG146E5nX65wm9DJeM5XXQwW8=;
	b=wo8WQpA6NfO5oq1yU5MNIxMljtmOFymvIKwf+z4UpWIwlmWK66C9CioLMyGAOPzFA0j76x
	feTDuA2whfyAklcQwWO/kFWvgwWMGymo+2py2F9m0snFPcsiGb2px0IjJZXqcGHrvur9VH
	JltI0wdrt+vgV2fQLaCE9TaaYnJ1sEPv3Xcrqp0ibg+AnJOIAG+nn4YMVG874FGgvxpo2n
	MJMTZztLqBmS37z8mUn6XD5/rXrSl5JNZ15qQTziNCOzq622/JthL+xDeTbEIH+I9kWOCg
	JKL5L5uhHGwBitxvsz2++MsIcD4j/XrNx79t/M05VLbd8rdWlYJFtlifZn2GHw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763917856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TvV2CIHODDVvcsCFmEG146E5nX65wm9DJeM5XXQwW8=;
	b=H8a+b7E4pwlDvJgRrStalE/DblBpY6KGjVhb8qJAv2yo/f7vbjkwGdH54cVGXBkqaDHNNk
	EznfI2lT8cZDOYBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Paul Moore <paul@paul-moore.com>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Fabian =?utf-8?Q?Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>,
	Arnout Engelen <arnout@bzzt.net>,
	Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>,
	Christian Heusel <christian@heusel.eu>,
	=?utf-8?B?Q8OianU=?= Mihai-Drosi <mcaju95@gmail.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v3 7/9] module: Move lockdown check into generic module
 loader
Message-ID: <20251123171054.wnPvVQrF@linutronix.de>
References: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net>
 <20250429-module-hashes-v3-7-00e9258def9e@weissschuh.net>
 <20251119112055.W1l5FOxc@linutronix.de>
 <CAHC9VhTuf1u4B3uybZxdojcmz5sFG+_JHUCC=C0N=9gFDmurHg@mail.gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHC9VhTuf1u4B3uybZxdojcmz5sFG+_JHUCC=C0N=9gFDmurHg@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-11-19 14:55:47 [-0500], Paul Moore wrote:
> On Wed, Nov 19, 2025 at 6:20=E2=80=AFAM Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> > On 2025-04-29 15:04:34 [+0200], Thomas Wei=C3=9Fschuh wrote:
> > > The lockdown check buried in module_sig_check() will not compose well
> > > with the introduction of hash-based module validation.
> >
> > An explanation of why would be nice.
>=20
> /me shrugs
>=20
> I thought the explanation was sufficient.

Okay. So if it is just me and everyone is well aware then okay.

Sebastian

