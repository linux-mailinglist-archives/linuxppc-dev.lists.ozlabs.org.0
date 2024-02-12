Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6633C851DB1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 20:13:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q2/5f6/Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYYz727jvz3dKY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 06:13:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q2/5f6/Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYYyQ309Jz3cDy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 06:13:17 +1100 (AEDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-60778d7b02bso5561077b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 11:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707765195; x=1708369995; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AZe21kBcPy6KSx7IZa4AcUw4sbKfAv+h51Ru4ZWOH8U=;
        b=Q2/5f6/Y/DUk3PI2P3KUy4n1VDtHh+kaV1gR+jv8Q/AF1uWhv8FKXj1sxq8vAHSbRn
         B7Ncq2vkk9YhIojwJ0V9gV8+6zAmAbuz/MFoLgLwKGVabyqSgBqn1DIs29kGXf3rnrob
         1qMrFh9AnRgj4bBFU9PKJMuWw6tQVZPwqLjTNnLI9yqXf78JykoKa1eW7Qnb0wXiiKIh
         HHn0BsHx0Zbqgsb80VSYaEt5KGPKQ5REvzOMBv/dBoo3OG+Nuvc3K3g9pRwYCCvrcTHe
         z6LvNLic6ptcIgUHr1al19SYEmzlGk/IRqd1PN0mi1ncwtzxa5uGxkheUitmM1PJCVXF
         4hSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707765195; x=1708369995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZe21kBcPy6KSx7IZa4AcUw4sbKfAv+h51Ru4ZWOH8U=;
        b=K3urxFMpePWEc3Ujxr5DZNPfG/q4iBVX7Wfv5o5c04M0r7OcaEiFs9oNv0E7NfjKWz
         89eIviB4RJM8W0WUf/MEKZgtugnE3PMqQ74Qmf/udpRscgZ9O15F0bzBxOeblw8URAbD
         y9u/55WLHMPN4pmtEzhMcFN5BQYvWzV+F9NrGKeBvQhLJbDRJpYoR1JXiq/097fKMQ00
         SoqfRteUnEqonWR4F2B1v3PV2F3OdDSzU7xX1SWnOsV5/zQxb+wSjQxVrK7/1k1cB12A
         0xG4wmdnnefDLweuhfJm+A4CAoLarSSAnHGqvVfY/SfIspivX3hUEw+XorSYE5UYs3vp
         FmQA==
X-Forwarded-Encrypted: i=1; AJvYcCXj3N5HjNQNw2xt/miblOXpPT1mtIMayHYRBB40N/ay1atvLGlUUe3YJ8qxbGP/M4IIYncDf5HhVy9btJ5Gt7C70KgciHkoX9QvhFa2TQ==
X-Gm-Message-State: AOJu0YziqxxZ+JQ8eVvHIYc1sic3oxAjac19zgPZ0yXuuw5scP3bbk8b
	/QRxp9RBBrZW8887zzXX1e2Ba+OJibeR0eXSJ5OyZ0lGHB/L/YWZcIIvarpcLDQ=
X-Google-Smtp-Source: AGHT+IFl6LJsfG6jRVqYDLExIYsaAihqzqU6vk5Hqvlokz2+AkO7Jtfo5penBfmuwtQEibPQUzwGHw==
X-Received: by 2002:a81:c24d:0:b0:604:cd5c:a2f9 with SMTP id t13-20020a81c24d000000b00604cd5ca2f9mr5823219ywg.30.1707765194731;
        Mon, 12 Feb 2024 11:13:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1ASV0QDP7aeAOV6u2nseazEB/qvenVbrU9hUHMbQ9Qqunpn7PAMBP/3/ftCW7daPRa72DOTHC3OcdaNfQxEOQe/wHYvmmFicrxtfHW/G7nY+bxYpp8WBFszjlI/Ql0F+acf+jKtlXEVOPcUiKc9g3Xa0JKA1A4B8cQxGj0dCXL3lOSPRFq8kthiwn3DUxAa67S16uGWggx8BnE+sAqBMpInVM9xAQahdaaXfYc0UOBw9IcIeGpuUnhpUoNBNl+u1IvAPfRryOyZc+pzg1Js2pyon0cXL9MfxyNM33FZbY1rT+FlII54J2d5XOzIJq3uTNYktlARuzWfNvOG5ZNTHLTFrn57o7xpvpmWACOnrkYcqeCbB+TVV5Qgig4VK1q6fxROrcX6HDefkykpAMNsUokffnWEDckH+WfaerJHFE9VEcGQDCPg7kViWm4lDDUxNuA9bDLz3xro9emsTI7XNLodcPnsQ=
Received: from localhost ([2601:344:8301:57f0:85b5:dd54:cd99:b])
        by smtp.gmail.com with ESMTPSA id y5-20020a818805000000b006040f198d3esm1279723ywf.142.2024.02.12.11.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 11:13:14 -0800 (PST)
Date: Mon, 12 Feb 2024 11:13:13 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 RESEND 3/6] bitmap: Make bitmap_onto() available to
 users
Message-ID: <Zcptyd/AWrDD3EAL@yury-ThinkPad>
References: <20240212075646.19114-1-herve.codina@bootlin.com>
 <20240212075646.19114-4-herve.codina@bootlin.com>
 <ZcoOpPb9HfXOYmAr@smile.fi.intel.com>
 <20240212143753.620ddd6e@bootlin.com>
 <ZcokwpMb6SFWhLBB@smile.fi.intel.com>
 <20240212152022.75b10268@bootlin.com>
 <Zcos9F3ZCX5c936p@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zcos9F3ZCX5c936p@smile.fi.intel.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Herve Codina <herve.codina@bootlin.com>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 12, 2024 at 04:36:36PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 12, 2024 at 03:20:22PM +0100, Herve Codina wrote:
> > On Mon, 12 Feb 2024 16:01:38 +0200
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> ...
> 
> > Agree, the bitmap_onto() code is simpler to understand than its help.
> > 
> > I introduced bitmap_off() to be the "reverse" bitmap_onto() operations
> > and I preferred to avoid duplicating function that do the same things.
> > 
> > On my side, I initially didn't use the bitmap_*() functions and did the the
> > bits manipulation by hand.
> > During the review, it was suggested to use the bitmap_*() family and I followed
> > this suggestion.
> 
> I also would go this way, the problems I see with the current implementation are:

Sure, opencoding and duplicating the functionality is always a bad
idea.

> - being related to NUMA (and as Rasmus once pointed out better to be there);

It's 'related to NUMA' for the only reason - it's used by NUMA only.
Nothing NUMA-specific in the function itself.

Now that we've got a non-NUMA user, the bitmap_onto() is not related
to NUMA anymore.

> - unclear naming, esp. proposed bitmap_off();

That's I agree. Scatter/gather from your last approach sound better.
Do you plan to send a v2?

> - the quite hard to understand help text

Yes, we need a picture that would illustrate what actually happens

> - atomicity when it's not needed (AFAICT).

Agree. A series of atomic ops is not atomic. For example

        if (test_bit(n, map))
                set_bit(m, map);

is not atomic as a whole. And this is what we do in bitmap_onto/off()
in a loop. This must be fixed by using underscoded version.

> > I did tests to be sure that bitmap_onto() and bitmap_off() did
> > exactly the same things as my previous code did.
> 
> Yuri, what do you think about all this?

I think your scatter/gather is better then this onto/off by naming and
implementation. If you'll send a v2, and it would work for Herve, I'd
prefer scatter/gather. But we can live with onto/off as well.

Thanks,
Yury
