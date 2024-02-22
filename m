Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEEB860526
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 22:51:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZBAv4oL4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tgn0R43v5z3dTx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 08:51:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZBAv4oL4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tgmzh14G2z3bsw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 08:50:55 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-dcbd1d4904dso186086276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 13:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708638650; x=1709243450; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GbRtgjzmc+Ky8Y7MGw/x7vZn3ys1w90kiZLMg7mLUbQ=;
        b=ZBAv4oL4tz4MG7lRgUEBx/s0RE8EAw9OwL4M788fYevAv2aqebUEaUrevL4hrZE+WJ
         L9H8kst8nNogKe3m4Rui2I/GfMCOzjA4A5Ld5aXIT4fmfiPC1Garrj8VUpLWnRgC8xS3
         L7CHnVFDHofcI3rNycmCbcvgfSntINpSBf3Cp44J+nw014FyMyzQDjuYwY4ieJry8hYW
         DhjmMcJfkaYdN0TbWNphQ41ykE5J5c91BDtHDvJziHnQHrndrIHtUXOxZoEviLdoFOGM
         IHS/YqZ7Bm2OJLnzAw2188orUvBaQo1VTnoRgOiyp/2MMOkYqnr/HqwVy2tx5I2kwyE5
         XPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708638650; x=1709243450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbRtgjzmc+Ky8Y7MGw/x7vZn3ys1w90kiZLMg7mLUbQ=;
        b=MHXThsk5vybtpNjt+LgQreSPGlnkVebVP47owZHmdVfsq8hBndHy9uQ32pfgFbnYkq
         vmB+QzQ+wKNy4E2GwX52INslda90hFYDUWplt+tQwytPcO9tPgF7QiBpSJLdQBwENZ70
         4ofPbHp7X3DFMLBhrQ9B5TOEtKiKgzF6zgFc7zl0Lu0WYHumR15IfTj4JCqTaaOOlNIA
         bPynMH1OqTEYiBypCqX2ydH05gJ+q5Q3JzZzOcIfVI6mM8eRYg5lJlQ+nAirZ0unK6ck
         Gby/0+0nihSjOumlKd6HUEle9/UpYAS1vexWhWL6b8Fq5E6LipeQw4TJUL9Oad0eZOf8
         hSjA==
X-Forwarded-Encrypted: i=1; AJvYcCUD8WSokIZAntz10F3+dkIVmhq69IOzFxxYktA6UjRACHBv8os0WjwaZGb+BkognilSIAq6eFF4wqxqrpZceHAINkfWDt0is5U/FXyPCQ==
X-Gm-Message-State: AOJu0Yxfjh48qy6sBSPW/yImoylMYL5HoDUcmXmdCalIV34Tv8FkUOj7
	Fj7CnF5SrO8fDZ+op9oslg+S4d/iuGjsNkvr9J41AMRvmjdqfD6v
X-Google-Smtp-Source: AGHT+IEOh/Eyrxx3el8K1WT+YisZ+iESYEunMTfd0wrXySo4XFeTPixQN4F9T1qBJSrkKfSjcPdP4Q==
X-Received: by 2002:a05:6902:543:b0:dcf:3f11:633a with SMTP id z3-20020a056902054300b00dcf3f11633amr152678ybs.35.1708638649689;
        Thu, 22 Feb 2024 13:50:49 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:6d56:5106:b1c5:46d5])
        by smtp.gmail.com with ESMTPSA id e2-20020a256902000000b00dc6e5ea9152sm3072361ybc.29.2024.02.22.13.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 13:50:49 -0800 (PST)
Date: Thu, 22 Feb 2024 13:50:48 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 3/5] lib/bitmap: Introduce bitmap_scatter() and
 bitmap_gather() helpers
Message-ID: <ZdfBuFZ7tf4b+3n8@yury-ThinkPad>
References: <20240222142219.441767-1-herve.codina@bootlin.com>
 <20240222142219.441767-4-herve.codina@bootlin.com>
 <Zddqr3aN4rU-upai@smile.fi.intel.com>
 <20240222174959.7097c29b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222174959.7097c29b@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 22, 2024 at 05:49:59PM +0100, Herve Codina wrote:
> Hi Andy, Yury,
> 
> On Thu, 22 Feb 2024 17:39:27 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> ...
> > > + * bitmap_scatter() for the bitmap scatter detailed operations).  
> > 
> > > + * Suppose scattered computed using bitmap_scatter(scattered, src, mask, n).
> > > + * The operation bitmap_gather(result, scattered, mask, n) leads to a result
> > > + * equal or equivalent to src.  
> > 
> > This paragraph...
> > 
> > > + * The result can be 'equivalent' because bitmap_scatter() and bitmap_gather()
> > > + * are not bijective.  
> > 
> > 
> > > + * The result and src values are equivalent in that sense that a call to
> > > + * bitmap_scatter(res, src, mask, n) and a call to bitmap_scatter(res, result,
> > > + * mask, n) will lead to the same res value.  
> > 
> > ...seems duplicating this one.
> > 
> > I would drop the latter one.
> 
> I would like to give details about the 'equivalent' in this scatter/gather case.

If you would like - please do! :)
 
> If Yury is ok, I can drop this last paragraph.

The original bitmap_onto() description is 3 times longer, and barely
that descriptive. I'm OK with your working and especially pictures.

Thanks,
Yury
