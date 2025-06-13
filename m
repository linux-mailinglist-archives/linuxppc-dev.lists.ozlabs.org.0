Return-Path: <linuxppc-dev+bounces-9356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 467ADAD92D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 18:32:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJlL24Tdfz2yb9;
	Sat, 14 Jun 2025 02:32:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749832346;
	cv=none; b=jD7++UzDMIrw7cYpZbmO8f7PRiUm/aXXozBdejEaEQ1VmVbnxq1XV5VKtfg17le/qfClGi8lR3rdaS2KWHhbFnBmPPzhXhhE/xLZCnZ3youry8PqqZ7blRSQzc0hmRaa/UbbFdijGR6rhMuJH4BYsO5aYFhcwEbDd5vCwdmvChhXt14+H19XWrfTKDRIelR0IAOO3egM2f2O9LQ4Tn36+NLH9Y3+jjG6mMRzWk5o6V/XesS1rX2t6BpudEsypYmRGa8BwKOdObKp0/rI87RjbT9TW+ZZ9Gcec4E+FJm/Ig5s3DH44vBdSK4hhZi1YdCLrrs10NhQZB+9iTik+5qwDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749832346; c=relaxed/relaxed;
	bh=xEqA2rgzUrqdqvzIIlHQexCQxpPVrT09RNw2/6DLcsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnzJwfqlm2iwEwF8Ga5XbU8keFHEhZ+b33zZXWa8sIFTaVS/LUfTODBgVPjtHb8VNFSYkyeuL8YzQpcuEzv3ctK6+8DAUkDU0XiuRYO3tJWUaVIh3jSFvpoEfT225SePupposYaJJvGUy7gQHiEsZwQs60VySVS4r3OpXtOHTkMszKucuXy07LCmypfbbQT28c0iVbMl+qu31xnAblOHLUd8V5OYEOJIcnbnr6BAq2tM2Z5Nz332kbHzQlR59q+mRhj6LuJXjLqTJzVmUxjfdsWPsHIkWXKPVCnHDmc/2VbsmKrstp3zrHcs01W9c+u5GPXaelIaKvpYp3z+EMhBpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; dkim=pass (1024-bit key; secure) header.d=linuxtx.org header.i=@linuxtx.org header.a=rsa-sha256 header.s=google header.b=gZZNjeNt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com; envelope-from=jmforbes@linuxtx.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxtx.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=linuxtx.org header.i=@linuxtx.org header.a=rsa-sha256 header.s=google header.b=gZZNjeNt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxtx.org (client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com; envelope-from=jmforbes@linuxtx.org; receiver=lists.ozlabs.org)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJlKz5PMVz2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jun 2025 02:32:22 +1000 (AEST)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3d817bc6eb0so11816605ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 09:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1749832340; x=1750437140; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xEqA2rgzUrqdqvzIIlHQexCQxpPVrT09RNw2/6DLcsg=;
        b=gZZNjeNtH7AvxdyArQAK63uTzTUgHt+weunKbLVDN2FUEo5qdUM2t9Ibi3alEQdVtT
         iwohLw0w/EyRihZhUrnLEb+vkHebHQTuO3iSPqZibhWSYHMiFkqqniKQQib2JKasSDvu
         3Mw5tBBkUuWhigwYrE5oJcMLHobhTVoMTav/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749832340; x=1750437140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEqA2rgzUrqdqvzIIlHQexCQxpPVrT09RNw2/6DLcsg=;
        b=wDWcy/BrzvU4T5g5wd2Te6yyz8b2IZgyQM8NGV7JuPJg72cmf/oHNdWM8jFApkVz4m
         MVKoAsPp2emxThHtDjIY6oQxiDckmTZc+NDq5FuCc/eM3Jg7ycuUBFzlNXtiU9NTH2T0
         +uhVgHRuxKzQVdg6hmbN9nyfkI9CQTE48WfTUh3/loR8QXkfqk2w4WzOvFEtu6vEa6lL
         g/eMdxrYvtSmCEiH+mkYliAUsKBnyXRPehMVwJFTbUkM1AEMgsvtuoRXv7Xj4UpO8qN3
         FSa+VRoQFUrxe5JEq0IJOQlnF9umRfqzwnJMJOne7isKWWuRVbvPEZZkdRrc25zkRkij
         TCeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtqdFvfWF0x8+N0jxcBuBb+wnNAghz9/KhkK+ziSC5aYrTEIjjonljTm5PV8Bp0A54I8+lezF8kSeEK/Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwDu56jNFpmTcye8LfqaKERgUF7Kih9gbv3S7uI3Xz6m60YftZU
	xKmXOxxBtm5mMJtCxoLlTmASMzWAcvAGVChk6ICik1eOpaWnAlmGlHWT4TI6MFEf/A==
X-Gm-Gg: ASbGncsEr8VknGMCUw23wbVYP0UCOUi4f6J47NnHxl6p8nRAzj3GjJqOyB1ayD4CeGg
	/k+AAqS/fSPmgiwkb/1uTpsbhddyTipc/V1CEEuuCyY7hWll+XPqk+F7CIoDQAfTH4Ak3PM7eZo
	JhwjpPVanbYpVP1p3/yZMumNmEaKR7U09lazK3iuOBw6YpDP9PHXLdwMPIBfJeV6R0RM5tDR0rt
	oAOWK/gXPS4po0SCwpe0VfW2/RJ4DzjhJRiZIZ5wzhtka9HwDg3l1GOjP8GwYNGybQi91l9/Ztt
	Aab5yCIwHnmKriuAv9+qTULimHlWGJ6j2dt5xkyNZTosCqfxT003YsU6lu+q2e8EFq7S/MNBf7/
	9R/U=
X-Google-Smtp-Source: AGHT+IEUOtIH02TbeFjpbYW6ra64Vute5G6gCQYMPDrPy1z/5rqHUAr3f/Acz2D0WiJSa+FLrubL/g==
X-Received: by 2002:a05:6e02:184a:b0:3dd:f745:89 with SMTP id e9e14a558f8ab-3de07cf7df0mr2913895ab.20.1749832339565;
        Fri, 13 Jun 2025 09:32:19 -0700 (PDT)
Received: from fedora64.linuxtx.org ([72.42.103.70])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de01a453casm3818425ab.42.2025.06.13.09.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:32:19 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Date: Fri, 13 Jun 2025 10:32:17 -0600
From: Justin Forbes <jforbes@fedoraproject.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org,
	linuxppc-dev@lists.ozlabs.org, Tulio Magno <tuliom@ascii.art.br>
Subject: Re: [PATCH v2] powerpc: Fix struct termio related ioctl macros
Message-ID: <aExSkR32YIgXtEHm@fedora64.linuxtx.org>
References: <20250517142237.156665-1-maddy@linux.ibm.com>
 <87zff7fu1p.fsf@mpe.ellerman.id.au>
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
In-Reply-To: <87zff7fu1p.fsf@mpe.ellerman.id.au>
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 20, 2025 at 08:36:18PM +1000, Michael Ellerman wrote:
> Madhavan Srinivasan <maddy@linux.ibm.com> writes:
> > Since termio interface is now obsolete, include/uapi/asm/ioctls.h
> > has some constant macros referring to "struct termio", this caused
> > build failure at userspace.
> >
> > In file included from /usr/include/asm/ioctl.h:12,
> >                  from /usr/include/asm/ioctls.h:5,
> >                  from tst-ioctls.c:3:
> > tst-ioctls.c: In function 'get_TCGETA':
> > tst-ioctls.c:12:10: error: invalid application of 'sizeof' to incomplete type 'struct termio'
> >    12 |   return TCGETA;
> >       |          ^~~~~~
> >
> > Even though termios.h provides "struct termio", trying to juggle definitions around to
> > make it compile could introduce regressions. So better to open code it.
> >
> > Reported-by: Tulio Magno <tuliom@ascii.art.br>
> > Closes: https://lore.kernel.org/linuxppc-dev/8734dji5wl.fsf@ascii.art.br/
> > Suggested-by: Nicholas Piggin <npiggin@gmail.com>
> > Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> > ---
> > Changelog v1:
> > - mpe pointing out mistake in hardcoded values.
> >   Fixed the same.
> >
> >  arch/powerpc/include/uapi/asm/ioctls.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/powerpc/include/uapi/asm/ioctls.h b/arch/powerpc/include/uapi/asm/ioctls.h
> > index 2c145da3b774..b5211e413829 100644
> > --- a/arch/powerpc/include/uapi/asm/ioctls.h
> > +++ b/arch/powerpc/include/uapi/asm/ioctls.h
> > @@ -23,10 +23,10 @@
> >  #define TCSETSW		_IOW('t', 21, struct termios)
> >  #define TCSETSF		_IOW('t', 22, struct termios)
> >  
> > -#define TCGETA		_IOR('t', 23, struct termio)
> > -#define TCSETA		_IOW('t', 24, struct termio)
> > -#define TCSETAW		_IOW('t', 25, struct termio)
> > -#define TCSETAF		_IOW('t', 28, struct termio)
> > +#define TCGETA		0x40147417 /* _IOR('t', 23, struct termio) */
> > +#define TCSETA		0x80147418 /* _IOW('t', 24, struct termio) */
> > +#define TCSETAW		0x80147419 /* _IOW('t', 25, struct termio) */
> > +#define TCSETAF		0x8014741c /* _IOW('t', 28, struct termio) */
> 
> These values look right to me. And the values should never change, so
> hard-coding them is a reasonable solution.
> 
> Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>

Has this been forgotten? We are having to carry it for userspace to
continue, and this should really be pushed to Linus.

Tested-by: Justin M. Forbes <jforbes@fedoraproject.org>

> 
> cheers
> 

