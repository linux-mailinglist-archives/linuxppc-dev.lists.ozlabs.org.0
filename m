Return-Path: <linuxppc-dev+bounces-13167-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD087BFC6F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Oct 2025 16:20:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csBC36Njvz30Vl;
	Thu, 23 Oct 2025 01:20:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761142815;
	cv=none; b=PvEdGmmvU6S0tssI/K5fhKo1CI+47zwr7JWSo7S3X53SytW7+Zs3gbktDOvYB00yIJHXa9QKeqrANlol6KH4z/8OeGUqiGqI6KincA5/zxO0ulIOrN4rINO9LgScORSuqaR5WcGfE76nV/wXF+UxNr443R5TMz6Qc3d3tfejVOnx1/u/GWyyxzx9dE+ET4yKpc93AGn68zUY+uvp+L7/ciI3AMuX8UAE7qkoSfsPa9TvB/z7hlKuM4dn7qCUwavbqOX0irBJsI1JIwig2sksVUYIwAPKJTlQzUNoUzO4C2uDGYLkPdnoWX6M1it6vU3jQU82ex58RF88n6riBhfA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761142815; c=relaxed/relaxed;
	bh=wcGPa9BZoRh/cXSf6MM7skWFc5+sWNLhhAzz4IrXMW8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fh4jlDWksvOy2tM3R7R/GBAq1eyqGOfKrldvalb4JVllM2Eq5kugyH3hoPG5QVZ+HVsd94t7GJXAHnst68w3byO+F9QvAtediighCXwc5n5NfluzDHiJ56n/+quVPyags/4Ht0JZaYF7jRyZ9b3TXB2RVTNUO6aXQIB/D2yOmdCnTo7/czo8tpts8Lhe1z0kMe7O7GfU7+zsavVKjvnZ9lcr5RuJToLJl/5DInPBhgagM/yfRehUTj1rPioiWG3MYUbXO+qJd/miLSASYsPSsBPycXc0PnB2TAHd25ckiINa2pTMt0iOlbP6twExNlpCygSg1QOgCMUap9mjCKwiMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AOvTIEh2; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AOvTIEh2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csBC2121vz2xxS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 01:20:13 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47106fc51faso82701825e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142809; x=1761747609; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcGPa9BZoRh/cXSf6MM7skWFc5+sWNLhhAzz4IrXMW8=;
        b=AOvTIEh2MiQRqZfh7+jSlmHqtTT7IdB2m8s/so/sOLZ6wgpMnhAtLQKzGfjX2GBhDY
         usMLoW55f/CBbUphX44ZQhDTB1UpgziFA2O7F1tlZbUYy4wzMO14DoxqrRzCe6MTWZVM
         F+rqTGLidLwsq2g4M08VbE4CpdhjZuFgYcIa5rU5zZz20kAP3sX8Y7OOVHdGr0C8yMIg
         0811BDpNKzbJDkF/kF+AIpuM9EW51WP4hiafHEsoJ21YZ9Bn2F5Il5b8rvdn8FSyIiUw
         Ty022pTIrvdPRr+Iaz/xMIYAQ7Uzwb4+tcf5QV/LEUV5P7BEEUrRCE7zhXGnf8PjmwZS
         QtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142809; x=1761747609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcGPa9BZoRh/cXSf6MM7skWFc5+sWNLhhAzz4IrXMW8=;
        b=tNfAwgwOHM1hoOpCwtyD2Sgk38P4dMqbHGg63NOoUHpA5so7vYfTbmf+R5t7G43ijH
         gHpZU7MaAlOG3EpArAKoQwqD0Xe87VxSK0Fq0YYeqIDdI/qDG/KbDaxKQihwqHdQbhfG
         oQS2y8d++ZyN2cr2cUWvFYCM1fM/KAlmQCUCAOEdV7A4wVPaeyXsxIIa2QKPV5COCsHo
         6EhVn9WBBvxX2H34MHigtynf1iQhRoYJzKRVSKh6PcUWix2fwRXuFlKEBc9D+3w+o+MD
         Qx9Si0frEKPcKcF1TaAK/8mwydT7y9ZBjozCp2irSpXp56oCqgGBpweKcFn2F40Wcv2c
         tBFw==
X-Forwarded-Encrypted: i=1; AJvYcCUnCsLQVPPFS6VYbrJrDaf8bj0FkC2jVmRCF/xPv5PwBddf+bOQhzlmbWsQdP2Sn37rhH2niIS4anXvs6A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzn+jBlLSHTrI62Qz/OsTa07aufErFNvYTuPWi10DxotzM+5wn9
	EjM27zIE6K1qAjkUNqnpv7MMGUQEnrSkhKep1kBzMwRgddZqjrh0vs9v
X-Gm-Gg: ASbGnctDOX2xLvEfiFWTZ8euSOvg8CMSi6pukIpw7QEYETHGG8pzYqm7p+7T3OZjqUX
	khpoNYnDj95lpad1yzUHvu5IdqfGPl1YbbUqH1ezy2hXFkw4x6FRVe879NtV5UGvLURUU8ixxnK
	ravL3xtoMzAZzeSABYttBF6FQTaTFEHs1GjzpJJriCiApI2R+08NRW3xfmZM3rdB9iDx3sjQJr8
	TcnUReIfWKOQOnLhyFvDFHdDNiPBeSzarcRJxeXEt0T4s2GElol+5pX6LZ6Mfg9LbK8KsfuLijh
	gPffnKm7Y01JXZf/u/ZEfRQtr4jOu2D3dQh1pCCVCLXdIB5XKH9tajsA4ome6KbkcUkw7GoWyKq
	QUoZ5jIXRKN3rHyGwNjwTNV4NftJ5pCNUNCanmY4AVLtxFAEbkuS6Yy57v1CajArrbKHCCZWfN9
	HATVvLF+fCTbrwLT5JcwF3nV3fEMTy24JNwJwmDP1yXulpTrGBOntB
X-Google-Smtp-Source: AGHT+IHX7Sum1LYsRGk4yzm8MqGMXKVdeHe0F7N67aNpUhUFJkxVcT5YpUlblTfJtsz2LXnINVBACA==
X-Received: by 2002:a05:600c:3e05:b0:471:16f3:e542 with SMTP id 5b1f17b1804b1-47117870720mr183174425e9.2.1761142809122;
        Wed, 22 Oct 2025 07:20:09 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428c62fsm48753105e9.8.2025.10.22.07.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:20:08 -0700 (PDT)
Date: Wed, 22 Oct 2025 15:20:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V4 07/12] uaccess: Provide scoped user access regions
Message-ID: <20251022152006.4d461c8b@pumpkin>
In-Reply-To: <20251022103112.294959046@linutronix.de>
References: <20251022102427.400699796@linutronix.de>
	<20251022103112.294959046@linutronix.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 22 Oct 2025 14:49:10 +0200 (CEST)
Thomas Gleixner <tglx@linutronix.de> wrote:

> User space access regions are tedious and require similar code patterns all
> over the place:
> 
>      	if (!user_read_access_begin(from, sizeof(*from)))
> 		return -EFAULT;
> 	unsafe_get_user(val, from, Efault);
> 	user_read_access_end();
> 	return 0;
> Efault:
> 	user_read_access_end();
> 	return -EFAULT;
> 
> This got worse with the recent addition of masked user access, which
> optimizes the speculation prevention:
> 
> 	if (can_do_masked_user_access())
> 		from = masked_user_read_access_begin((from));
> 	else if (!user_read_access_begin(from, sizeof(*from)))
> 		return -EFAULT;
> 	unsafe_get_user(val, from, Efault);
> 	user_read_access_end();
> 	return 0;
> Efault:
> 	user_read_access_end();
> 	return -EFAULT;
> 
> There have been issues with using the wrong user_*_access_end() variant in
> the error path and other typical Copy&Pasta problems, e.g. using the wrong
> fault label in the user accessor which ends up using the wrong accesss end
> variant. 
> 
> These patterns beg for scopes with automatic cleanup. The resulting outcome
> is:
>     	scoped_user_read_access(from, Efault)
> 		unsafe_get_user(val, from, Efault);
> 	return 0;
>   Efault:
> 	return -EFAULT;
> 
> The scope guarantees the proper cleanup for the access mode is invoked both
> in the success and the failure (fault) path.
> 
> The scoped_user_$MODE_access() macros are implemented as self terminating
> nested for() loops. Thanks to Andrew Cooper for pointing me at them. The
> scope can therefore be left with 'break', 'goto' and 'return'.  Even
> 'continue' "works" due to the self termination mechanism.

I think that 'feature' should be marked as a 'bug', consider code like:
	for (; len >= sizeof (*uaddr); uaddr++; len -= sizeof (*uaddr)) {
		scoped_user_read_access(uaddr, Efault) {
			int frag_len;
			unsafe_get_user(frag_len, &uaddr->len, Efault);
			if (!frag_len)
				break;
			...
		}
		...
	}

The expectation would be that the 'break' applies to the visible 'for' loop.
But you need a 'goto' to escape from the visible loop.

Someone who groks the static checkers might want to try to detect
continue/break in those loops.

	David


