Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F59B16C3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 01:53:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TwZ64BBszF53P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 09:53:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="CH+33i++"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TwXM4pc5zF52f
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 09:51:29 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id d3so12479453plr.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 16:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jwH7MEoAJ00c+7yFxXFsE0JEMDQRkeWQsif61Jhqi3M=;
 b=CH+33i++1Luzxl8HYawv8HE2blbAZ7swcTEJAA7tWhmDd6HBta3K9TBY1havYrrodJ
 7+wkJA0vugEJi+fuHOJLp/jNbRghNgF+owPo44A17sTvEiyTUWvxtD0KUsPdLov77ETE
 OjYMwTAAZV3vwkDzfhKUJVKbmZKGKwYbQk0kqGkGZta360oMD/mAHbxQhitLNDR53Ze4
 SU3HZZBIVazFcwyYjFmcc25pa7ILwXvs1ASWa6lXm+0opNIxy7ZFRchNNFkX/gIve+fu
 VhqfI5XkvWQj6su1zQCV3UB+uISGEbLxFeNhbQADYmagwaZTIUIIBmjZfZzWbiBWpD0s
 MiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jwH7MEoAJ00c+7yFxXFsE0JEMDQRkeWQsif61Jhqi3M=;
 b=UMw1brvOr5iqAaVhhDG/b6OIAa8ZAARZXfcuLZ8pucuC4OWpRh3FlrHE+572UsA+lq
 1Ld7QCFsz1KOzhvP9XgSY+nOlM/THPlVawPoSlzha7bZN4oyr23m5DVqAKqFlyB6CSyb
 pgiE7FT9mLgyKW983xfVV9ukeEn/KHS4HPJ13pEn7JQIV7s2Htv5l0LLK6xRTNrP/eLH
 YbTY9BFhyZ2Orff+UVlwSwTWJeMLWo+chuarvJs/fx0ko66xLwTU4kb3oE67wj1hlG07
 9xnzscfvBfeENZycxQNdiceoYmWLO+bmmsTlTdVNKpDbDXkIDF5cd9pp7oMyDLveBeAO
 EYpQ==
X-Gm-Message-State: APjAAAXzdguZ53JK/xioHHB4sX4odAI5E5OSczHmAuSKurrAIQHy3nNz
 TVW95+F3T7Or1Sn4ayMAe3t2PPvI
X-Google-Smtp-Source: APXvYqw8JsAO/ku52ctAh426YyLkFzzTSBnKNOrqkT8cXxA2Fn6w0cpGB8xMIpxVpQYBQQwfczK2/A==
X-Received: by 2002:a17:902:724c:: with SMTP id
 c12mr31734884pll.312.1568332285454; 
 Thu, 12 Sep 2019 16:51:25 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id u5sm27193129pfl.25.2019.09.12.16.51.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 12 Sep 2019 16:51:25 -0700 (PDT)
Date: Thu, 12 Sep 2019 16:51:03 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_asrc: update supported sample format
Message-ID: <20190912235103.GD24937@Asurada-Nvidia.nvidia.com>
References: <VE1PR04MB64791308D87F91C51412DF53E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB64791308D87F91C51412DF53E3B60@VE1PR04MB6479.eurprd04.prod.outlook.com>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>, "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 10, 2019 at 02:07:25AM +0000, S.j. Wang wrote:
> > On Mon, Sep 09, 2019 at 06:33:20PM -0400, Shengjiu Wang wrote:
> > > The ASRC support 24bit/16bit/8bit input width, so S20_3LE format
> > > should not be supported, it is word width is 20bit.
> > 
> > I thought 3LE used 24-bit physical width. And the driver assigns
> > ASRC_WIDTH_24_BIT to "width" for all non-16bit cases, so 20-bit would go
> > for that 24-bit slot also. I don't clearly recall if I had explicitly tested
> > S20_3LE, but I feel it should work since I put there...
> 
> For S20_3LE, the width is 20bit,  but the ASRC only support 24bit, if set the
> ASRMCR1n.IWD= 24bit, because the actual width is 20 bit, the volume is
> Lower than expected,  it likes 24bit data right shift 4 bit.
> So it is not supported.

Hmm..S20_3LE right-aligns 20 bits in a 24-bit slot? I thought
they're left aligned...

If this is the case...shouldn't we have the same lower-volume
problem for all hardwares that support S20_3LE now?
