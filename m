Return-Path: <linuxppc-dev+bounces-13454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3106C159CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 16:54:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cww0Y4KzCz3cZl;
	Wed, 29 Oct 2025 02:54:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761666845;
	cv=none; b=PULwtcGaFG2s+Lh2KgzyQTMGMRPunvS5dvRtmWLG/SOrT8Macjc69zagDqlg+8NRiqGX90UicPjgsVsZ4xMIR2KVOq/LqF384dJs8Yrw0eRCHFM8pbhzifKA/xApiKPj3/U83VAR+R2FKaYs/ynfX2M5iBzcs0/A42pg+Ln98dmBklkkNPNHGG7PRfkNxdMuyKjKE8u6wuufesFgow+ZjjFR4I0XEroEzKJ29/bT2nLl2G/vhwd8TwGhdj/5+T5xDM7bmFSkrHLqvmWy0UOgx9y6ZIDBx24x+i5Vo6C7oSKD4WjPWJCYRUj2MDTCFBUBUksPKK1xf8acotsf7loHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761666845; c=relaxed/relaxed;
	bh=/KXDwBRP2WCWSb38HDbtSfBbdxVUxx52nxz6bCHrlpw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TxYwe8Lv2Jbqns4/xdFV3bOg21OvwMO83oCa8Oc65PUfpM6srzuTylpa05CqU3955bo4rA2fSDvLlHVzMjHfRifRLS9vQdUo5z4erHbo2sqecxqGmy8oDYy8mJuxhJiaG6hNR+XtjvAax6li0K05YL2zcHI6mh5gbKiJPGZNEtX8CYUZsuCDR4YfXB8YbBXjr5lY11khA+XL8VKdc+L63sRRxZV8qipCKikuwSbs2lMOdgEqXw1Fnz2bt9w5EZfTjtZV1NSV8gBt1gesJAO+dl47ppJTp3AZRT6CYkJhwM+03dVPEUThWbbRfwbGfjGFjq5uBrLtYh1eax62Mn4CPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OPEqap7k; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SARXk4Ru; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OPEqap7k;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=SARXk4Ru;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cww0W3XLpz3cZj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 02:54:03 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761666833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/KXDwBRP2WCWSb38HDbtSfBbdxVUxx52nxz6bCHrlpw=;
	b=OPEqap7k08VJelhy9WBQ/aL5T/8oowjEW/Fj5ejEzvuFUOJdHdYO+nY9g3zwtVd8QWDf1F
	3OycYZl/mXIIkjDEJbYqJn/3lZONlfMLSSkvOIeF5euOmDzhBeb9eL4MDJ07aVD52j+vc3
	2Ki2E0N97eFYWZ8+a5iDKRlRRUgRRS/Cia0Rk/IX+jL/+Yov9CCKMTIDCIZkBPTMJtSuC6
	TlGUy15ZD9OqxHiszUngKkX1GB7hr2PiWfv/E9vY6vQ531cTPrIrUUZLo9u4YJwZ5ShkEp
	MXYPHAOozI3S6XnQsFcoK8zfWpgofXu0Rlf3rxgsiAc0s0ZysVI8vQGLdVgzig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761666833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/KXDwBRP2WCWSb38HDbtSfBbdxVUxx52nxz6bCHrlpw=;
	b=SARXk4Ruf1xEZbt1pBhbOZgPe7j89e4OCU0if/0OgDMjDi4dxReWkPtapI3fZt2x6xbwVl
	0zokLNUUHORNRdCg==
To: Yann Ylavic <ylavic.dev@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix
 <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>, Darren
 Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?utf-8?Q?Andr=C3=A9?=
 Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V5 02/12] uaccess: Provide ASM GOTO safe wrappers for
 unsafe_*_user()
In-Reply-To: <CAKQ1sVO9YmWqo2uzk7NbssgWuwnQ-o4Yf2+bCP8UmHAU3u8KmQ@mail.gmail.com>
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.231716098@linutronix.de>
 <CAKQ1sVO9YmWqo2uzk7NbssgWuwnQ-o4Yf2+bCP8UmHAU3u8KmQ@mail.gmail.com>
Date: Tue, 28 Oct 2025 16:53:52 +0100
Message-ID: <87jz0fuinj.ffs@tglx>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28 2025 at 15:04, Yann Ylavic wrote:
> On Tue, Oct 28, 2025 at 10:32=E2=80=AFAM Thomas Gleixner <tglx@linutronix=
.de> wrote:
>> +
>> +#define __put_kernel_nofault(dst, src, type, label)            \
>> +do {                                                           \
>> +       __label__ local_label;                                  \
>> +       arch_get_kernel_nofault(dst, src, type, local_label);   \
>
> Probably arch_put_kernel_nofault() instead?

Duh. Indeed

