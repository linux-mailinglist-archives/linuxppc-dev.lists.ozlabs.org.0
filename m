Return-Path: <linuxppc-dev+bounces-14345-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB43C6E335
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 12:21:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBJvV1rCsz3c2Z;
	Wed, 19 Nov 2025 22:21:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763551270;
	cv=none; b=G6NKxvlNF7fx6Hk4U0XnQfGKRV177hIOGJ/PRH8SL6ilYbjCzrA0xSqVnq9dH2yQ7FxKbV1iEkb/5jUiYRpFVR6opv41LHu94/znk/cDZ5f3x+1WKY5V+uf8jMslbVu+lXgu4C+g3hckcBNFCGyiYJYc0EAjuO3M0gLAda3+60fCwCOeCyTUVps4ZJgmbCWjy3gpndr+jEfwizI1XMkJgUJwxuZf8CLKYKxRRjPkpI2ZUxp2O03qzMssSblRE6+vVTYkSvqpHy3Eg8JeFoY69EfxAmhNj/rMFkaXkJmEm833fbLgASFmhMU35Nc+8sH8As2MBL57u67vx+4ftf6S9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763551270; c=relaxed/relaxed;
	bh=wUSBlZZ9YDio7KtZN+X06BL6FGFKBS5aTCskRkM16k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhQMN3mVPBeXyzHAYNCa9G64i2CAiv32bq3RVT1Mg2y+sHUKCnS3PJgrxz6tXpef3zrPU+PAU89LfYeqHDzyxPKWOazjM6+eOt5mrZDfDPUFBgFlCAJkrvZupyxMZ9BrWTn5ug72/iDTEW9j9MQxzJ0WDGXowiZueDX3+OdvQqw3pEYQVSMZCw4ER9PYfRm7vIK/6oVRS0N6Fq451w/IMCHu0hbn4HVAidLocgwixSvxlhdiu6qqtLoSsh0Gtk1KgtRj4HTHXhUdRnBb+EYQixhwJdYnqT/tfeM4S8qEMiMoacPwYuoUGlPLgp0Nia98HUr/taAundNVyNBrs36zyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JwIBFnys; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=PaAcT0Pa; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JwIBFnys;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=PaAcT0Pa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBJvN5CLgz3c2P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 22:21:04 +1100 (AEDT)
Date: Wed, 19 Nov 2025 12:20:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763551257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wUSBlZZ9YDio7KtZN+X06BL6FGFKBS5aTCskRkM16k8=;
	b=JwIBFnysf2LFLEtQg0xbgBLVccfduk/drgzvy4AakLpJLS1rDRyQ3SzGNJg3IqMxpjwJlF
	cJrockj9vsQL4Rudtcco4j++0lF0oIiyoJs3cMm0ClblnX8RsGH/ozyLeD57cKb8+aSSJA
	QI9lVHLOUmernjmTs12vttLTxWC+aCvD6dUgyV5Kjfq3bliqCoXkbvquz3cuHyK0cs9QMH
	YMMKDLmCGd5XtftYaZeXwOfc8qiUI6pUaSfM6z2O3TCfhMLq5vQPTSpyC606DZEbtIpXr0
	7C9H0dgS3L9wYZ1tvhxQJHgIS2xnolt2VlX39CkSU6ia9+iUQslt8YQZYkLMHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763551257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wUSBlZZ9YDio7KtZN+X06BL6FGFKBS5aTCskRkM16k8=;
	b=PaAcT0Pa0I47odYk/hl8N5o9JPaoc9DwKGKLs5RMYXX+0Dgn5BKBKHZSE3snhCH4dps8hX
	5JRbzpviPWRRL3Dw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
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
Message-ID: <20251119112055.W1l5FOxc@linutronix.de>
References: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net>
 <20250429-module-hashes-v3-7-00e9258def9e@weissschuh.net>
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
In-Reply-To: <20250429-module-hashes-v3-7-00e9258def9e@weissschuh.net>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-04-29 15:04:34 [+0200], Thomas Wei=C3=9Fschuh wrote:
> The lockdown check buried in module_sig_check() will not compose well
> with the introduction of hash-based module validation.

An explanation of why would be nice.=20

> Move it into module_integrity_check() which will work better.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

Sebastian

