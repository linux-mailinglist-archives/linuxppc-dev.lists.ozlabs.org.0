Return-Path: <linuxppc-dev+bounces-16461-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGMdOBDUfGlbOwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16461-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 16:53:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E33DBC436
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 16:53:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2gXs4S3dz2xWJ;
	Sat, 31 Jan 2026 02:53:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769788429;
	cv=none; b=EaFiMPuBenO8fTRJ+4e42AevE5309aUhGOy0/+wtX9n9RqIwagoPbLoA9GUFtsqjq2r67zdeJgrZHQLRfnWCl/ar1nTTcg05AsILLmeRwS1WuVPX12gdR5URhltZv3eDv/Hc/Fsg/ntLOOZ2pNDS1VGQ3eM5gr7UPVE/0aFI1LL6QpydkifK+JCUW1i/eDeBBMZD196tKlzYK+azIBY3sqJA6cHA4ZuX26Dki8vMqOHwqaDW/oIBJ/LDC8RqTF1NZKopqFHGkWh+H5iGWEKAyNmVx2Glfv5js6JD1e/Aw3XoywILzvyCEMV++NHp4shHlpt7/sy4Zm/J+rBrK/++0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769788429; c=relaxed/relaxed;
	bh=/N/gdqXNSxjGhSy6xlZCb5nNS6V3s9YjmXiDnl7X37k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcPh9cUqPJB5soZzk20W7zduG7Eq2vZ5dR/+FV4sqEAWPf126PlmCyx3x3/45OldjBcO+D8FbdNHNvt6eLj5CR0Jmg23Lijiq6H1MwXzlync0FD/OO81QMWnpM2lUJBkzMMHGZHbySGVBEfWW6/B1M9wvfkVGmqQr4T5DIzgjpOBeiI/Xv2hEemZ/FyBzy+UG+p5xnyNuloKTdVzVsKudGn3eLWeoIlOH+X8tnmG3Z/Akw8P8Yek5tuWa+N889hgUw0n1408nwB/FGshiBqFOA3jmXwcEf9+RuDyFw+k+nHeqklY+iYUoiHBlXPcSy+1QETEwSxEnnUEV8ArJpfiwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2gXr2ZZjz2xPW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 02:53:47 +1100 (AEDT)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 60UFreJP3403643;
	Fri, 30 Jan 2026 09:53:40 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 60UFre7G3403642;
	Fri, 30 Jan 2026 09:53:40 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 30 Jan 2026 09:53:40 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: Failure to build with LLVM for the Wii
Message-ID: <aXzUBHQR7ZJ4nVAA@gate>
References: <aXs8sgAcci9FKKpx@luna>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXs8sgAcci9FKKpx@luna>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.01 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[crashing.org];
	FORGED_RECIPIENTS(0.00)[m:linkmauve@linkmauve.fr,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[segher@kernel.crashing.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16461-lists,linuxppc-dev=lfdr.de];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XAW(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[segher@kernel.crashing.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 0E33DBC436
X-Rspamd-Action: no action

Hi!

On Thu, Jan 29, 2026 at 11:55:46AM +0100, Link Mauve wrote:
> I’m trying to build the kernel for the Nintendo Wii, using LLVM instead
> of gcc, in order to bring Rust support to this architecture (and also
> because my distribution doesn’t ship a cross-compiling gcc), but I get
> this build issue near the end:
> ```
> % make O=wii LLVM=1 ARCH=powerpc -j1
> make[1]: Entering directory '/home/linkmauve/dev/linux/wii'
>   GEN     Makefile
>   CALL    ../scripts/checksyscalls.sh
>   DESCEND objtool
>   INSTALL libsubcmd_headers
>   WRAP    arch/powerpc/boot/dtbImage.wii
> objcopy: Unable to recognise the format of the input file `vmlinux'
> make[3]: *** [../arch/powerpc/boot/Makefile:394: arch/powerpc/boot/dtbImage.wii] Error 1
> make[2]: *** [../arch/powerpc/Makefile:236: zImage] Error 2
> make[1]: *** [/home/linkmauve/dev/linux/Makefile:248: __sub-make] Error 2
> make[1]: Leaving directory '/home/linkmauve/dev/linux/wii'
> make: *** [Makefile:248: __sub-make] Error 2
> ```
> 
> I believe it should use $(OBJCOPY) instead of objcopy, which is set to
> llvm-objcopy, but couldn’t figure out where it is misconfigured.

Other people already pointed you places, but to find out for yourself:

   make V=1

will tell you all that happens.  The kernel build system tries to not
say much at all normally, but sometimes you want to see whatever is
happening :-)


Segher

