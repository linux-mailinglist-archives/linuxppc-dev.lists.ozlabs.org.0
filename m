Return-Path: <linuxppc-dev+bounces-1236-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DFF974C49
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 10:15:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3YKs6Vfpz2ygB;
	Wed, 11 Sep 2024 18:15:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726042545;
	cv=none; b=HVF+eoT/50Ly4kA/LJmkLSQINTPjwL0AfNigjs9Wxj9WC8m8z45+Tpv6UMjDWblyCDevi6ELbEROiZV8XtSsjkX/XSQp6PJA2rFqUAmu5ivWgBH47qtVFK1bkBvBPVi9fGFOKnA0fLrC4xm2DQ+fR+VUOf0T9q531Pfesnxp+G1xhjN3e+kWuz9H+4xdT0WMnc7BGg6qqDxXbdFYQbXhMKaDwD2t3JZSjMQ8tUWOvITAGbcAhNaNXs3WiWvwAIYf5MPJA8b0SXSe07a9/xvpvxxUern4W8ZbjIob629DKOZaphYp2XZ4wwVaKSOW5EQs+3RVHhRFIpUgHbbT+L0J7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726042545; c=relaxed/relaxed;
	bh=V987fBm6F9emK0J95GoYEdiv+Gd6fbUioktZ1lszOmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJAwTTSEtBVcrkmGbew/oi5j1aNV5xNr2P5AkRS/qZWbLlKUTQnWp5f4eWuKor1m/fXdk7teMrPadXIRCovBUGBiLGPwCTkH8h25bkTxPs7r1S4v+fBldlv2SrRjkM7aaHVbawzgtq+iNJZBcQ8rnmSTJrqq2VdS+1nZHXPFBmRRO1bVuyPuk0dyLia7V5j9/NgWJhRP5TNSCqxQs6Rvu1oT4mfVF5ESwHxiL8/E34mogNn/D8TzboSFZuHxnEsfC07Jn+E1U759fFnVW1aQFVnUo3U2L49u9MdJRQBYRuAjZL14NqtGMONDSDdZ0PSO2dlQaC1kz7B7pjg4s6Bilg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QH20hfCv; dkim-atps=neutral; spf=pass (client-ip=91.218.175.173; helo=out-173.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QH20hfCv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.173; helo=out-173.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3YKq61kzz2yft
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 18:15:42 +1000 (AEST)
Date: Wed, 11 Sep 2024 10:15:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1726042520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V987fBm6F9emK0J95GoYEdiv+Gd6fbUioktZ1lszOmg=;
	b=QH20hfCvh9Cvy1MeUujlEhHWUY3A3d/I1Y15631aaDCYouDnUvYEgYv1OOPLoU+JNzJQaz
	FcUHxiszgnbUqFJoRPq5D1Dlgfyo7jviih14D+7UJeIBS0ez7V96uKkLujVBgHmY5K4Imh
	SYjV42ODWjbbywoFaXc1JSYBM7/02a0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	pbonzini@redhat.com, thuth@redhat.com, lvivier@redhat.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, nrb@linux.ibm.com, atishp@rivosinc.com, 
	cade.richard@berkeley.edu, jamestiotio@gmail.com
Subject: Re: [kvm-unit-tests PATCH 1/2] configure: Introduce add-config
Message-ID: <20240911-d6ec4d38091c5f852f825d17@orel>
References: <20240903143946.834864-4-andrew.jones@linux.dev>
 <20240903143946.834864-5-andrew.jones@linux.dev>
 <D431AYECDJV3.1AVQCTIRV2J4G@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D431AYECDJV3.1AVQCTIRV2J4G@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Sep 11, 2024 at 10:39:03AM GMT, Nicholas Piggin wrote:
> On Wed Sep 4, 2024 at 12:39 AM AEST, Andrew Jones wrote:
> > Allow users to add additional CONFIG_* and override defaults
> > by concatenating a given file with #define's and #undef's to
> > lib/config.h
> 
> That's a horrible config format lol, but probbaly the simplest way to
> get something working. What if you included the user config first, then
> make the generated config test ifndef before defining the default?

User config first and then #ifndef would indeed be better.

> 
> Is it better to have a config file than to just add more --options to
> configure? If we had thousands of options maybe, but so far we are
> getting by with configure options.

I have some unposted patches where I introduce two more configs, which
is what inspired me to stop adding configure command line options.

> I think I prefer that for now
> unless we wholesale moved everything to a .config style.

Moving to .config would be good, and importing and applying Kconfiglib
doesn't look too daunting either. We can put this --add-config idea on
hold until we've had a chance to experiment.

Thanks,
drew

