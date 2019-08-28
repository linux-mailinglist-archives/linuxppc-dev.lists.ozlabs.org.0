Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C8BA06FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 18:10:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JW0z0sHQzDrHY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 02:10:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JVhX2PlDzDr81
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 01:55:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="pqTccn5J"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46JVhS6wXXz8x6w
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 01:55:52 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46JVhS4WGBz9sDB; Thu, 29 Aug 2019 01:55:52 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=jlayton@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="pqTccn5J"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46JVhR5FpQz9sBF
 for <linuxppc-dev@ozlabs.org>; Thu, 29 Aug 2019 01:55:51 +1000 (AEST)
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 765322064A;
 Wed, 28 Aug 2019 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567007749;
 bh=tm23iPOHz5qNiVmbKBRthv6o0H14qpr8dY7bd4MTQKs=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=pqTccn5JcnucNCAhPvukewbhK7LnqfZiA1JhrrT1FDFY4mCrVB8AZyQ8GN7mLjP8y
 7s9EDdOPkKuIVFWDEaVrPbihjrm8teyPYUCsz+WciUJXkEpW4kr0ySk55f/ASUGrn8
 zpEFoJeA5Hy5XDMtaE0vrkdWUVKHa2wWQhJO2xxg=
Message-ID: <4da231cd52880991d8a038adb8fbb2ef3d724db9.camel@kernel.org>
Subject: Re: [PATCH RESEND v11 7/8] open: openat2(2) syscall
From: Jeff Layton <jlayton@kernel.org>
To: sbaugh@catern.com, linux-fsdevel@vger.kernel.org
Date: Wed, 28 Aug 2019 11:55:47 -0400
In-Reply-To: <854l2366zp.fsf@catern.com>
References: <20190820033406.29796-1-cyphar@cyphar.com>
 <20190820033406.29796-8-cyphar@cyphar.com> <854l2366zp.fsf@catern.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@ozlabs.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-08-26 at 19:50 +0000, sbaugh@catern.com wrote:
> Aleksa Sarai <cyphar@cyphar.com> writes:
> > To this end, we introduce the openat2(2) syscall. It provides all of the
> > features of openat(2) through the @how->flags argument, but also
> > also provides a new @how->resolve argument which exposes RESOLVE_* flags
> > that map to our new LOOKUP_* flags. It also eliminates the long-standing
> > ugliness of variadic-open(2) by embedding it in a struct.
> 
> I don't like this usage of a structure in memory to pass arguments that
> would fit in registers. This would be quite inconvenient for me as a
> userspace developer.
> 
> Others have brought up issues with this: the issue of seccomp, and the
> issue of mismatch between the userspace interface and the kernel
> interface, are the most important for me. I want to add another,
> admittedly somewhat niche, concern.
> 
> This interfaces requires a program to allocate memory (even on the
> stack) just to pass arguments to the kernel which could be passed
> without allocating that memory. That makes it more difficult and less
> efficient to use this syscall in any case where memory is not so easily
> allocatable: such as early program startup or assembly, where the stack
> may be limited in size or not even available yet, or when injecting a
> syscall while ptracing.
> 
> A struct-passing interface was needed for clone, since we ran out of
> registers; but we have not run out of registers yet for openat, so it
> would be nice to avoid this if we can. We can always expand later...
> 

We can't really expand later like you suggest.

Suppose in a couple of years that we need to add some new argument to
openat2 that isn't just a new flag. If all these values are passed by
individual arguments, you can't add one later without adding yet another
syscall.

Using a struct for this allows this to be extended later, OTOH. You can
extend it, and add a flag that tells the kernel that it can access the
new field. No new syscall required.
-- 
Jeff Layton <jlayton@kernel.org>

