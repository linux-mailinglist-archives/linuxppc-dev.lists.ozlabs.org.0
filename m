Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA79618E36E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 18:45:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48l7ML3Fn7zDrD1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 04:45:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=afzal.mohd.ma@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UXIHaUBh; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48l7KL2h98zDqKL
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 04:43:16 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id a32so4787387pga.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 10:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3fStVl9rL3YRgIiAf/TzVVtMNrh3VX50fi0qgiiuA8o=;
 b=UXIHaUBhFEcnW+OMHvNaZ8x6pk7Kw7xSi1XSqUQ/ypXJwX+/0kjbU9/UcI39UYrFww
 L4SWYiuz/x5ZDo+euy1EVFm6/xEfsJuGVNtbr58w1aJIyLLbxr5Zvw2YV6+Jz2IFJLx1
 hSKDnD+ugCfCtYPbwa0qtQZzvaVCFI/U0Hh49Bh/9v4+8cPYNZpxmxPxHCL/ucL4FfPB
 t55wM9/sifQrsJ2x7qaYOUyTwSXOMqFFX7kbT5BvfLIkW8EyaBXHAHAACDZSlA65LB0e
 +oYG1mMj2pkG+negyyMWiq2E57sl6r93kYgmOlv5Tvke5FfWZ2pC2/wfVUCgtyT6TaL9
 9P/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3fStVl9rL3YRgIiAf/TzVVtMNrh3VX50fi0qgiiuA8o=;
 b=tfuhC1JuiCy94JPHlnn4Zvv2kAiUM91KCgIP9T8xYfPhFbcs3H/Ea457OFdq7+Dsq6
 YVvXf3O9WjufrcvepMCoBmC8Wnp+7HeW9SaA9mI4B1yHr1HfHQ0UosFLXx/ZJh78tHNS
 6IykM+a1kWhGr1uj5MKWnzLRA/Tpi+fT31dkdLMF9nRg1wwweT150VobZRyh8Sd22/GO
 w2+QyAa1wFyObQJDL6a2DvDvLUHYvUhCelSnRQ0tmdhhtuz7PxY8/sDcex22rh0Nbrm0
 Jsn5ce9bu8O/wk0SEoVRig9aDE8zr9Hx8h/JaiLHvIKI/XOVQhjQhf14OiQUh8H1/z0J
 Z8fQ==
X-Gm-Message-State: ANhLgQ39pXG/w7pim7Ev+HobzLnXbRI8va0Ptt+l9a/dLt0u6ZUaY5nh
 93ULVFlpLT3VPBKmMsjdhpI=
X-Google-Smtp-Source: ADFU+vtSB9sj3T3LCfhecLdyVMoQimjNCV0Ow3ys209048E+VImdKW1kqpUYGGvxT4nwaYSYvsoI7Q==
X-Received: by 2002:a63:e856:: with SMTP id a22mr1215468pgk.283.1584812590871; 
 Sat, 21 Mar 2020 10:43:10 -0700 (PDT)
Received: from localhost ([49.207.51.24])
 by smtp.gmail.com with ESMTPSA id f127sm8973833pfa.9.2020.03.21.10.43.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 21 Mar 2020 10:43:10 -0700 (PDT)
Date: Sat, 21 Mar 2020 23:13:03 +0530
From: afzal mohammed <afzal.mohd.ma@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 00/18] genirq: Remove setup_irq()
Message-ID: <20200321174303.GA7930@afzalpc>
References: <cover.1581478323.git.afzal.mohd.ma@gmail.com>
 <87y2somido.fsf@nanos.tec.linutronix.de>
 <20200227110713.GA5708@afzalpc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227110713.GA5708@afzalpc>
User-Agent: Mutt/1.9.3 (2018-01-21)
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org,
 Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>,
 linux-m68k@lists.linux-m68k.org, Michal Marek <michal.lkml@markovi.net>,
 linux-rpi-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 Gilles Muller <Gilles.Muller@lip6.fr>, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas,

On Thu, Feb 27, 2020 at 04:37:13PM +0530, afzal mohammed wrote:
> On Thu, Feb 27, 2020 at 11:31:15AM +0100, Thomas Gleixner wrote:

> > Vs. merging this series, I suggest the following approach:
> > 
> >    - Resubmit the individual changes as single patches or small series
> >      to the relevant maintainers and subsystem mailing lists. They have
> >      no dependency on a core change and can be applied where they belong
> >      to.
> > 
> >    - After 5.6-rc6, verify which parts have made their way into
> >      linux-next and resubmit the ignored ones as a series to me along
> >      with the removal of the core parts.
> > 
> > That way we can avoid conflicting changes between subsystems and the tip
> > irq/core branch as much as possible.
> 
> Okay, i will do accordingly.

i am on it, is delayed due to the reason as mentioned at,

https://lkml.kernel.org/r/20200321172626.GA6323@afzalpc

[ not repeating contents here since other mail was sent just now,
  cc'ing you ]

Regards
afzal

