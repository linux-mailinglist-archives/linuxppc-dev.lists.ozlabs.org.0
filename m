Return-Path: <linuxppc-dev+bounces-12793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E0EBD26B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 12:00:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clXst5hQZz2yrm;
	Mon, 13 Oct 2025 21:00:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760349650;
	cv=none; b=dZ0A8v30FB1/RgepTDmjDso1JOavMDY8svKkzBOi1Edn0nD/BiVUf5F47LSicQrt0mgfSrf1MVATp+HXlC9KENtaC8DWbqlQUDyocQZKxQdd/cqcaUSg+/UL9qe+DCsPLBq1IpmoZpuM177H03U6vgNPrY31Hcab2173yPdXoBWvF0N9xbLk2So38ODQrZ/OriQsNwN0MVojXkrl/IQ3CXSXMFVStxVyCdqNqbRLqN4CMpVBYnma+St/0315ayLYH4/9SOnPFIulthvE/dwCN0NjBVasT9jBDqXqJgbGNl6BeShFdVk2kRSmrnrwERwiOSsC2Rti/rYZtmjiw0DLuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760349650; c=relaxed/relaxed;
	bh=Sa0hyLl/CuAPqN8piNUXRod9YatWS5sLJjv2OTB79g8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=krhlP7Gs1yUOd8fSrMwOU/aa/U9orK6YhUPTz+D22GowTbus77goPPAhmNswlu0Wb0BUa847fXDXTEvEf9+cULzlLlHNEqMicx3//Af2AcKJEPOI4wpv1A1dKJS57d79ywaCpbo0qcHgUg4mz26dZNt7lzLKMfVd2mNv3WrY+iHv119f/4O97AvaNBGKDJjyc+zA8Hs+9tGT3bmfYoBKlzUFzqVCjAuSn6r+Hd/Q9psI5jrqodnv8CwtnR+WOz6uxixQr4BiaaC4uZB1s1Imsn7Lrj9U0q20Oa0Vvdv3mIMhDPI0t4WhTu556yfF1VaMsD4AxI5UvUaBzfGFynZ5Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1li8TwzZ; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aPGeZ/XY; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1li8TwzZ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aPGeZ/XY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clXss0M63z2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 21:00:48 +1100 (AEDT)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760349643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sa0hyLl/CuAPqN8piNUXRod9YatWS5sLJjv2OTB79g8=;
	b=1li8TwzZhoICH9uuKMFiVylAENaNEecMvoJE4L/hJWX0yks3goxmK5aCyM8L3Lk7tDpWOP
	BFasLTqJbp7IRj1C738QUlRBfGaX/T6Xu/INu7xA0xpkzFkK1FA/BpsJvGxFLnst0N1ufR
	fvkjBa5T8jfYisZWR4cHHYA8xbdvNxxBCi1twl9TwwNie+dwdUy7wOAoCqwW2qyVfiI4k6
	VVLMMhBOWYLSRJDz7zQRchVYCBQibBLQREC9UfFEZ+agxKImmrL9Kks4wt6sK1pHnWanWv
	iWnKl6aV+fM+QQrlC1XvzasgnqDbJmY/dxmOFI2b1osfqn67B1ZiVfuRcB/9xA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760349643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sa0hyLl/CuAPqN8piNUXRod9YatWS5sLJjv2OTB79g8=;
	b=aPGeZ/XYOy7puJGDMk1N9AIu2A71OJ+SNAdl88f+tdLjG+uu3h9AgJbCcHKYhlFN6F2j+l
	ehc8X3iOzGsiaDAw==
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, tglx@linutronix.de, maz@kernel.org,
 gautam@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Linux List Kernel
 Mailing <linux-kernel@vger.kernel.org>, "linux-nvme@lists.infradead.org"
 <linux-nvme@lists.infradead.org>
Subject: Re: [bug report][PPC]: rmod nvme driver causes the kernel panic
In-Reply-To: <31838b50-e420-405a-af23-6c6ede281386@linux.ibm.com>
References: <31838b50-e420-405a-af23-6c6ede281386@linux.ibm.com>
Date: Mon, 13 Oct 2025 12:00:42 +0200
Message-ID: <87h5w3f7ed.fsf@yellow.woof>
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

Nilay Shroff <nilay@linux.ibm.com> writes:
> Hi Nam,
Hi Nilay,

> On the latest upstream mainline kernel, I am encountering a kernel
> crash when attempting to unload the NVMe driver module (rmmod nvme)
> on a POWER9 system. The crash appears to be triggered by the recent
> work on using MSI parent domains, discussed here:=20
> https://lore.kernel.org/all/cover.1754903590.git.namcao@linutronix.de/

Thanks for the detailed analysis. This should be fixed by:
https://lore.kernel.org/linuxppc-dev/20251010120307.3281720-1-namcao@linutr=
onix.de/T/#u

which currently is in powerpc/fixes-test

> Possible Cause:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This looks like a cleanup ordering issue introduced by the recent MSI par=
ent
> domain rework. The PCI/MSI teardown seems to assume that the MSI descript=
or
> remains valid until after the domain teardown path executes =E2=80=94 whi=
ch no longer
> appears to hold true in this sequence.

I think the reason is more idiotic than that, the msi_alloc_info_t
passed to pseries_msi_ops_teardown() is always all zeroes, thus we have
the NULL pointer deref regardless of the sequence. See the patch I
mentioned.

Nam

