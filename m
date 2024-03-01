Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBAE86E320
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 15:15:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=YRahYDcW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmVVf0M2Cz3vZN
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Mar 2024 01:15:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=YRahYDcW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmVTq6tfJz307y
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Mar 2024 01:14:54 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-412c24280ffso11434785e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Mar 2024 06:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709302491; x=1709907291; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9+ahSplsrpMk5JPa0yOPjfO7AGvDqKLJSzvpgj67f0Y=;
        b=YRahYDcWzZ6KD3JY/Or2MKTYxkOHMTOzBTs98NK6O9K/dZWvYDbi1dKNfg4B6n2j8d
         SsJGKjw6iGtPl7rOo2EfjltTFrlOsqjDj9L3lHwb3BUwsLQReuSaVKdFu1jv4n0bZ8I/
         Ltkydi5Y4FGb15MsP061XHPdM4hWYiQ+bGDJRMRYIua9myBV6gPCaQ0I66BwywHHCW+o
         9B884iD9bk6MLBKDcqt9yapoyQLsEfTTnpW3sfh9m90XXGxgAJvBjM0g72nW0e9COmzV
         vBogjGbCz6o9Z/aA/s3MjiCrrzLlmXg+4WN6gSTQI5voUPElIn0rIdIVM2Bfrm8Q/hFQ
         o20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709302491; x=1709907291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+ahSplsrpMk5JPa0yOPjfO7AGvDqKLJSzvpgj67f0Y=;
        b=Yh3DGUeeh0raMO9pu/4KVk3wm2mXeJoLtyWah4zJJrACUcIULvU2WgZlF65DUsEGNB
         kMc6S6AJ9v57N1GuUQ1HQXahpzTUtzq1w664Qywt4F8DNmvicxONDm2wEQRsrqio+WQh
         51/fvLrxdQl3X/UlJMb6zp4b3ZbODFkz+qp9spzmhjdkeDuKcJ6AP5lMwfN45T+I09Qy
         MxQKRfl6x81POK9QJLMU4YhVKHrd2L0q+vrHCJEdsxeis3txh3cOENiDwmUhc4qQm+oj
         GxCg3ZiOSfShAJ38Mr9WzsRDjqvhuL/GW6Mh/jt5E5UkvOIxpITauhX9gxlZpkDjaHz6
         BZDg==
X-Forwarded-Encrypted: i=1; AJvYcCWLAa2zPC1SEX0jwhqgeDyv4+18kKR7KhZD31EG5tpj422I/14JLzE7CVuyPGzCDA1Heh+iVEF/ip/AH6ZOmOYGonr3lQmbGogJ6Udwjw==
X-Gm-Message-State: AOJu0Yz6nJEtMKlz17EWCH/uNbR1lALizn4q8Tsoh3IE8rpNxzVuXvTJ
	q14crWL1vSun0G51tHWNI8fe73CrpChnAdSPsczyWaXsXqVg1lIjkNX2BR7ZmFY=
X-Google-Smtp-Source: AGHT+IEl0jm9MbCywK4R1WKHEn5lIJp0R+fbP26gqjSgfLOcsDV2IXggp1N1gfgebXtPPiChzEKBDg==
X-Received: by 2002:a05:600c:4ed4:b0:412:c9d:9284 with SMTP id g20-20020a05600c4ed400b004120c9d9284mr1710063wmq.41.1709302490552;
        Fri, 01 Mar 2024 06:14:50 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id jd20-20020a05600c68d400b004128fa77216sm8636118wmb.1.2024.03.01.06.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 06:14:50 -0800 (PST)
Date: Fri, 1 Mar 2024 15:14:49 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH 14/32] powerpc: general interrupt tests
Message-ID: <20240301-0483593c146ffd3bbded2f69@orel>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-15-npiggin@gmail.com>
 <1b89e399-1160-4fca-a9d7-89d60fc9a710@redhat.com>
 <20240301-65a02dd1ea0bc25377fb248f@orel>
 <b4a1b995-e5cd-40e9-afc1-445a9e5f6fa5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4a1b995-e5cd-40e9-afc1-445a9e5f6fa5@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 01, 2024 at 02:57:04PM +0100, Thomas Huth wrote:
> On 01/03/2024 14.45, Andrew Jones wrote:
> > On Fri, Mar 01, 2024 at 01:41:22PM +0100, Thomas Huth wrote:
> > > On 26/02/2024 11.12, Nicholas Piggin wrote:
> > > > Add basic testing of various kinds of interrupts, machine check,
> > > > page fault, illegal, decrementer, trace, syscall, etc.
> > > > 
> > > > This has a known failure on QEMU TCG pseries machines where MSR[ME]
> > > > can be incorrectly set to 0.
> > > 
> > > Two questions out of curiosity:
> > > 
> > > Any chance that this could be fixed easily in QEMU?
> > > 
> > > Or is there a way to detect TCG from within the test? (for example, we have
> > > a host_is_tcg() function for s390x so we can e.g. use report_xfail() for
> > > tests that are known to fail on TCG there)
> > 
> > If there's nothing better, then it should be possible to check the
> > QEMU_ACCEL environment variable which will be there with the default
> > environ.
> 
> Well, but that's only available from the host side, not within the test
> (i.e. the guest). So that does not help much with report_xfail...

powerpc has had environment variables in guests since commit f266c3e8ef15
("powerpc: enable environ"). QEMU_ACCEL is one of the environment
variables given to unit tests by default when ENVIRON_DEFAULT is 'yes', as
is the default set in configure. But...

> I was rather thinking of something like checking the device tree, e.g. for
> the compatible property in /hypervisor to see whether it's KVM or TCG...?

...while QEMU_ACCEL will work when the environ is present, DT will always
be present, so checking the hypervisor node sounds better to me.

Thanks,
drew
