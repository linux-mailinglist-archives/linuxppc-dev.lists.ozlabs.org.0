Return-Path: <linuxppc-dev+bounces-3612-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF8E9DE798
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2024 14:32:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y0Dcr3Fwhz2yZ7;
	Sat, 30 Nov 2024 00:32:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732887148;
	cv=none; b=ZfEDzetooaD1fMSyvjFUo/nadLHSkUcX1b2Q8/aVZXXWn2GaKMn7lzyG/55gXPk/wd+b9Wb8fglWUDmGeMpkGPj58uIJ42vfpGqg1SsF78QXe5kU1PNsIx2h514oQbX39ks3Wt3PSjLsUgp7M9E5by0wBfDYrxHZbKY78xm2m6Qg7zQKmzPbFCvICITrAclUCsMK3dsxKuOG7hbf7d+Su3cWluT9o0FMONc0vlzGOH0KQTyddqgCh6/0wThCnQ1rjMX15RXiVF7PWiwBpORu+i9EnE7pfGCjzH/lDvLKEKEWv4PeHlN4zehhvQtscH+x8BHnPo+MWTMReTmYfcCzKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732887148; c=relaxed/relaxed;
	bh=1EHb2L56DDpjtwU/UFh8uioIw0HOZZ1rlPpTrDEs14Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LRTErrORDR5Bf+9UaQFUNWfQME+5rvkzlI3YNPwAzFJcmnoyaH4N0UJY401sfn2jloyp0t6L6f/wZW4gDVBMj7MCSYKnj9iTJLqiWpaBrxBhUwQc5YZG8s0eVXDPiP8DCLkNecVeZO4GJDBSukrkfIttNlXfB5H4d8g1DnbAKQ1pzx+n+yjoa0FExsCYgYdKLzOx7uFD8dz3OsnJt7C897GuLiefrikqJ5AMCKGOChZh+kX4xg/ISygJiJhPlzb9SHbuw61HCISdIuMw4VUP3rgUEB2FG+wA5sWcfygN0SaTMnjwnWKAslHhsubr+0anX0WkQ+LreQhrAu80V4NT0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kLDb/kGR; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tzt4zpj9; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=kLDb/kGR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tzt4zpj9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y0Dcp6WXPz2xbS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2024 00:32:26 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732887138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1EHb2L56DDpjtwU/UFh8uioIw0HOZZ1rlPpTrDEs14Q=;
	b=kLDb/kGRwiapc8IEHEJjX9JdZsSzN8BsAPa2RTHUSmua6pSEIlHIgFPZAriB/53oNtf7JZ
	kb08bkLnlTRGxBCT6bQPVQNny0HqGd6tAYTMi9Ky0a0Gy7cSBBru647vBSJ2gbiGAnM8CL
	K4CmqKSsKg+gcvEgc6iOJ6ErKbBM4liqw7b9gDPy6Rcf0GPoHN55zf7xb0QNa4jQbf2LNg
	6Fsofl0Jz8ofxH91BOzO8OKVBTLnFc6gazkfCzTaMa9hSmcBXen8PnbIfJ9u7HsoethIoe
	w/hDPRTTj2EFL4BE8Lv7tMlbcNS/RKZZ/3BUP/X0yf0KDF2mzupUN8apxs4v2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732887138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1EHb2L56DDpjtwU/UFh8uioIw0HOZZ1rlPpTrDEs14Q=;
	b=tzt4zpj9BspmJyWB94OMHjwpdw2hmq+t+5FW1SE8HuJJfHm+iH++4n4CuIEmA74V5vgaEl
	zmueYz7U+7FFcBBg==
To: Eliav Farber <farbere@amazon.com>, linux@armlinux.org.uk,
 catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, ebiederm@xmission.com, akpm@linux-foundation.org,
 bhe@redhat.com, farbere@amazon.com, hbathini@linux.ibm.com,
 sourabhjain@linux.ibm.com, adityag@linux.ibm.com,
 songshuaishuai@tinylab.org, takakura@valinux.co.jp,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org
Cc: jonnyc@amazon.com
Subject: Re: [PATCH v4 2/2] kexec: Prevent redundant IRQ masking by checking
 state before shutdown
In-Reply-To: <20241129113119.26669-3-farbere@amazon.com>
References: <20241129113119.26669-1-farbere@amazon.com>
 <20241129113119.26669-3-farbere@amazon.com>
Date: Fri, 29 Nov 2024 14:32:17 +0100
Message-ID: <87wmgmw4gu.ffs@tglx>
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

On Fri, Nov 29 2024 at 11:31, Eliav Farber wrote:
>
> This patch addresses the issue by:

Again:  git grep 'This patch' Documentation/process/


