Return-Path: <linuxppc-dev+bounces-14596-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A240ACA34B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 11:48:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMWT56gW3z2xGg;
	Thu, 04 Dec 2025 21:48:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764845321;
	cv=none; b=BzBQ8XbyO2xF7gvGllTJ9+vHUxUq/ZR0K1ZOLb1swB5z3t9LceSwrcd98eKEy+jJnsI2l6KDcjlriaXin4z5f7tORHBOb6yRaME7SKAulrzbfSs0PkCADIkkr6D9lfBY6IJodKPxMx0vMnVTbYSmEXLhApcd1KjuVHLd7XBMDacJj45ClK/BGnUEHJMbBAHVlM00GTageE1zkJ84dT4oG8ON5UCce7fXjtKG6tRNaeeZFdFoTqWQyZiq0yXmi4JiPD5Q/3iCRSkFoMMz8eiqruoEtY+yD+uOU2NpGIq2wPThNv7WOEDAn61x0w7giMCTpS20d7gHuiMh6cyk0dF5SA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764845321; c=relaxed/relaxed;
	bh=zsR3r9aqDhGcgbcWiFA4n+1mhNVg/YnZy7yLS/c5SpM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HejNEOlp09D0ZHL9hyLqGYTmlnErjWrwavMAIgcy3no11keg0xLFzkNAxACVSSoDOCyUozupvOHu8v9ofszPGiwerSMdKEcG4r4bG21TjMoHnCz7LcTMoNM+khXClTFA/d8panx78XkRnQJiFXW9dsKoA811jHr2e0yqYjkK3tSlgXFQukjgDNYh3XqbcUVrVtaIqN8NrlGziIZtuyAU/2AFVvJXfqELPE1zWTuJPWljBYKRDjdd+JWrHnWY/jNYHFILM4Mxv7VuF61H8rgrRYpOjfNtmoE/DJouAEPGYXFCKniVKnokBz4sIay2f5oqHFUfAa7au3SK3JiymjT8yQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EejxskfV; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lcJkEDBD; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EejxskfV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=lcJkEDBD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMWT366T9z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 21:48:39 +1100 (AEDT)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1764845305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zsR3r9aqDhGcgbcWiFA4n+1mhNVg/YnZy7yLS/c5SpM=;
	b=EejxskfV2zM6m+UtiD8RINAbnMrJ7dtxXkeHpywGNM6m4W2dYnZtHK7AOqye20+lPVNNlN
	CE3STjvHuQl85JhgZQgYEjkPZkmjL4ofMl6t1D3/wWfrc/leuHiuaCwAvMtF2z+bRhOZZB
	w2hAxCZjC3fKc8HRJ5qqpasxfooRuk6P7e25U3UFIcq3oEw41EgJWF0lYcMGOUFZHdnpI6
	+LtL8ZAGXjTOuS/5NVryl3WNOxXs3K9z+salJqbX7GZxvxORHz9X9pFQY+Y4HHKoHlZ6g2
	Wj02SUud7RA3ltPpQkx1zMX1dX+6FJwCSDYRU9u0TMiNwoaGIpXGXIR5fu2Kgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1764845305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zsR3r9aqDhGcgbcWiFA4n+1mhNVg/YnZy7yLS/c5SpM=;
	b=lcJkEDBDEt7ndcVmwzMSrOZNHL3WnvWmOvSoGBJS7YSuyWzPhq+LFFk6MgrrvlOwDOkI5D
	qfOfXXf5H1tFSvCQ==
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de,
 maz@kernel.org, gautam@linux.ibm.com, Gregory Joyce <gjoyce@ibm.com>
Subject: Re: [bug report] powerpc: per device MSI irq domain
In-Reply-To: <6af2c4c2-97f6-4758-be33-256638ef39e5@linux.ibm.com>
References: <6af2c4c2-97f6-4758-be33-256638ef39e5@linux.ibm.com>
Date: Thu, 04 Dec 2025 11:48:24 +0100
Message-ID: <87qztawmiv.fsf@yellow.woof>
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Nilay,

Nilay Shroff <nilay@linux.ibm.com> writes:
> I have been using an NVMe disk on my PowerPC system that supports up to
> 129 MSI-X interrupt vectors. Everything worked fine until Linux kernel
> v6.18, after which the NVMe driver stopped detecting the disk because
> the driver probe now fails.
>
> After further investigation, I found that the probe failure in v6.18
> occurs during PCI/MSI-X vector allocation. A git bisect identified
> commit daaa574aba6f (=E2=80=9Cpowerpc/pseries/msi: Switch to msi_create_p=
arent_
> irq_domain()=E2=80=9D) as the first bad commit.

Thanks for the report. I can (kind of) reproduce the problem with QEMU.

I think moving rtas_prepare_msi_irqs() into pseries_irq_domain_alloc()
should resolve the problem. But I'm not sure because I don't understand
how RTAS works.

Does IBM have some documentation describing the RTAS API? I failed to
google it.

Best regards,
Nam

