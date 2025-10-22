Return-Path: <linuxppc-dev+bounces-13165-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1049FBFC257
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 15:29:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cs94Y3pTTz2yFJ;
	Thu, 23 Oct 2025 00:29:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761139773;
	cv=none; b=D/5/HznFcX0W4WYcLHiM/8zUlYSPKGZrFitbaX1UhycOU9i8ta96VDJnitgDVXfhv0Yrki278DTSQk5LBcQHxKmoF6K+N34vzqOSQkwOpZ4Y3lImP/pLt40iNJQ0wxZDjEX++HELJ1mhBO2MvHiom80yMx0bMeYjWOI/mWAzwN2oHCB5v/RUC9oBocPpZKhusTb9676AnJF2nEbMmp0wry4xILvHEBQkf5z+SB93OYXeXRgRe+15r5GI8aU7BEpqj/+45ITADP8tkmVYmlf9ht79V10514Bl1wEIqTHJ7y6n6p/lAlQUpuZb6CUj9tdRU3acfE9uJUADTtlKvm7bqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761139773; c=relaxed/relaxed;
	bh=vI5ygdM2fUq0WhLkjqvyWdwalTGXtImKgD/K2E+hX2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gipEDup+Ibds/e1HNHBp0jeBPj1MyB7ezBWkkAl1eUqqy5crbDn4ez6RlP8vLiLNJMHoF2TeS24qRLAvIR5eDi7Ci23rjAoF9jW62wgACq1N+Y4CD7HsEmDFM1+MdVyWdKhseh8JlYx1wb57Yc08ChbON/RHDBsCKhmE3pK36syOkZqS2tu6gCXjVSOn752q+bUJDXLGImxEWTjkdpJEeDltUPM/pgoapnky+PI4kKImsMDpQwI+pmOWQctR6QAaz48u1P18NIefi5gpIvGX1fxbRjYWo5QmIKoR5NHBK32mfTDAQiwJTtI2M7jZzC0V275v8f8L8CCIV9zgLOjNuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cs94M1gtGz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 00:29:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vI5ygdM2fUq0WhLkjqvyWdwalTGXtImKgD/K2E+hX2M=; b=ZYwOhBusiUOSHhKLetWTNJNMjy
	bOFMKbx4lkmtmrO7n86UGdT9Kf1mBZ2CQzanXcplCmrt35Ffy7u8kJ4PXpYYAoyQ7w9LT6BL8cQsu
	PW0GEbL2LjAVq6xWvTlmWE/UmTIr5UKBTZDdwQTFoL+yMxe+9raqn9/DMtx0KaH9xWUFiN5fT1cMA
	9Uyt/h1JzFxUl6Gz+WZVYYAqcbxOJexz/7zuC7PQu03jBwQtGNfpf7iTJUvMlJo4svTajaxMxLcPG
	hZ9H7QIEIEqI2UQ3wSDJ6YzYR2PArEaH+qCVC3MCNssf15mS9nUiFou3pKuZjw17TFGNTrV218T/Z
	aj9uPCFQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYtb-00000006NrR-0yQr;
	Wed, 22 Oct 2025 13:28:56 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BF53130039F; Wed, 22 Oct 2025 15:28:55 +0200 (CEST)
Date: Wed, 22 Oct 2025 15:28:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	David Laight <david.laight.linux@gmail.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V4 00/12] uaccess: Provide and use scopes for user access
Message-ID: <20251022132855.GP4067720@noisy.programming.kicks-ass.net>
References: <20251022102427.400699796@linutronix.de>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022102427.400699796@linutronix.de>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 22, 2025 at 02:49:02PM +0200, Thomas Gleixner wrote:

> Thomas Gleixner (12):
>       ARM: uaccess: Implement missing __get_user_asm_dword()
>       uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
>       x86/uaccess: Use unsafe wrappers for ASM GOTO
>       powerpc/uaccess: Use unsafe wrappers for ASM GOTO
>       riscv/uaccess: Use unsafe wrappers for ASM GOTO
>       s390/uaccess: Use unsafe wrappers for ASM GOTO
>       uaccess: Provide scoped user access regions
>       uaccess: Provide put/get_user_scoped()
>       futex: Convert to scoped user access
>       x86/futex: Convert to scoped user access
>       select: Convert to scoped user access

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

