Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A87F113DAC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 10:20:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47T9D51R1LzDqZb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 20:20:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=2a01:4f8:151:8464::1:2;
 helo=ssl.serverraum.org; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=walle.cc header.i=@walle.cc header.b="lgf9fTIK"; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org
 [IPv6:2a01:4f8:151:8464::1:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47T9BC4j7lzDqYP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 20:18:27 +1100 (AEDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 27B372305C;
 Thu,  5 Dec 2019 10:18:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1575537492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2/Tl9y0vlxprYCBrvMb1aya8Frr3Lyxlo7NlxWTMqUU=;
 b=lgf9fTIKUVaOWWjXw/69XcooxlrBdTSukoRwUQcp1g0v/iSfnIdYWw+ete1aMsIxdMWXZO
 +36NxPACCHWHppH36Gg7oSGBQRvd7i3DE5L8XyacL/MHGEw5nVY8Nf1FE6RED7DZzTdSmC
 OMxzTgAFh2qQ1Csg8+1STlDZxi+7KTk=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 05 Dec 2019 10:18:10 +0100
From: Michael Walle <michael@walle.cc>
To: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: add IRQF_SHARED
In-Reply-To: <CAEnQRZCnQAUVowOJw5aPe9rYWU5DKR4bFbmQLYV2BzYqOhRJmQ@mail.gmail.com>
References: <20191128223802.18228-1-michael@walle.cc>
 <CAEnQRZCnQAUVowOJw5aPe9rYWU5DKR4bFbmQLYV2BzYqOhRJmQ@mail.gmail.com>
Message-ID: <a5accae02f840f7e25099c2ccd7b02ff@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.8
X-Spamd-Bar: +
X-Spam-Level: *
X-Rspamd-Server: web
X-Spam-Status: No, score=1.40
X-Spam-Score: 1.40
X-Rspamd-Queue-Id: 27B372305C
X-Spamd-Result: default: False [1.40 / 15.00]; TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com]; RCVD_COUNT_ZERO(0.00)[0];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 MID_RHS_MATCH_FROM(0.00)[]; ARC_NA(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; DKIM_SIGNED(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[12]; NEURAL_HAM(-0.00)[-0.696];
 FREEMAIL_CC(0.00)[alsa-project.org,lists.ozlabs.org,vger.kernel.org,kernel.org,gmail.com,perex.cz,suse.com];
 SUSPICIOUS_RECIPS(1.50)[]
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Daniel,

Am 2019-12-05 09:43, schrieb Daniel Baluta:
> On Fri, Nov 29, 2019 at 12:40 AM Michael Walle <michael@walle.cc> 
> wrote:
>> 
>> The LS1028A SoC uses the same interrupt line for adjacent SAIs. Use
>> IRQF_SHARED to be able to use these SAIs simultaneously.
> 
> Hi Michael,
> 
> Thanks for the patch. We have a similar change inside our internal tree
> (it is on my long TODO list to upstream :D).
> 
> We add the shared flag conditionally on a dts property.
> 
> Do you think it is a good idea to always add shared flag? I'm thinking
> on SAI IP integrations where the interrupt is edge triggered.

Mhh, I don't really get the point to make the flag conditionally. If
there is only one user, the flag won't hurt, correct?

If there are two users, we need the flag anyway.

> AFAIK edge triggered interrupts do not get along very well
> with sharing an interrupt line.

So in that case you shouldn't use shared edge triggered interrupts in 
the
SoC in the first place, I guess.

-michael
