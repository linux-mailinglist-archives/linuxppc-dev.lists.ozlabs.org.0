Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 240522A9F46
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 22:43:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSYlt6cLmzDrRQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 08:43:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r6p4t2hB; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSYgd4fCrzDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 08:39:24 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id g12so1955596pgm.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 13:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7aTWPGVFVbBWyajMT43VMslcFxXhz4VtDG2Makyw31Y=;
 b=r6p4t2hBK6TaeQb58ushb4iE+SAEpBwSj1UGF6u7fYvIqBs1cEHVzdSxjnk/UvBUhQ
 W8cQNHQveNpdu6qA1gOQgeBjly7CjVn0ieNdMmJ4AE1PhT0tBGdqAE2ATyQXtl53Rdac
 ZSEHU6hmqv482cXm79+gjmSgYiVcLHmHBSB9ASlPgGe12tTIZ7BslHv0PrUoTc6QNCzB
 Y4D1M3FoogsQTPU2TEZ8iGOdBXFfpwexcOJliySVCXgf/GT2xq991kkYGm2s66q1CwTr
 P9yJmfhZKmDkC/LbEoObcnYCPuhL8uq3lxzJN/aUEe2Rfj/NIp1IosQuoV/x4T5dC36U
 Xlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7aTWPGVFVbBWyajMT43VMslcFxXhz4VtDG2Makyw31Y=;
 b=olMBn2sUX+3G8xiu2Xq4uefOlgBQOMzkBtWVCtf7YHesnMU5hG+LNEKCh77nnW7pFG
 33gE1BRZ7QlrGuTC/tefVH8fYdV98QvVtyxrXHvUQtrgrbfGcvYgBD3r8tILKA7/AdUl
 3UbkFJCp8RoBYyqJPT8UZkqVyZaq2QUsvNaVqjTMVGAdW484tGeeQWojyEqqAtVJ/iHU
 BxnN75rYfxQiYCXteUXOLPY51ya/ouTlfrQVSEy9a9rwXsYKkQjSS16JflAom4FzvF0u
 /oAZN4IUbuPMNnWbp4iLsjNb5IivTeWdhgDu/25V6A5BA+kYM4DqQNT/66sevpONeQYQ
 tINw==
X-Gm-Message-State: AOAM531V8xy4ESYaa7bXEw4ntTWE0wPwQRLKsS3mUQdHgd8be96MbN/3
 xXUulE8eALufRxLFoNmjwUk=
X-Google-Smtp-Source: ABdhPJwpIojmp9b1+/us6ZoC1XobJl4twTivXTCrNIPeHZ3z7HJtN7EZ21TixK2ffUkYFiMgVC+9xw==
X-Received: by 2002:a17:90a:1f0b:: with SMTP id
 u11mr1596531pja.105.1604698761088; 
 Fri, 06 Nov 2020 13:39:21 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id u22sm2689423pgf.24.2020.11.06.13.39.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Nov 2020 13:39:20 -0800 (PST)
Date: Fri, 6 Nov 2020 13:27:08 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: fsl_aud2htx: Add binding doc
 for aud2htx module
Message-ID: <20201106212707.GA3927@Asurada-Nvidia>
References: <1604281947-26874-1-git-send-email-shengjiu.wang@nxp.com>
 <160466365499.22812.9217467877032314221.b4-ty@kernel.org>
 <20201106122013.GB49612@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106122013.GB49612@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 06, 2020 at 12:20:13PM +0000, Mark Brown wrote:
> On Fri, Nov 06, 2020 at 11:54:23AM +0000, Mark Brown wrote:
> > On Mon, 2 Nov 2020 09:52:26 +0800, Shengjiu Wang wrote:
> > > AUD2HTX (Audio Subsystem TO HDMI TX Subsystem) is a new
> > > IP module found on i.MX8MP.
> > 
> > Applied to
> > 
> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Sorry, looks like me queueing this raced with the review comments coming
> in.  I think the review commments are small enough that it'll be OK to
> fix incrementally?

Yes. I am okay if we move forward with this version.

Thanks
