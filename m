Return-Path: <linuxppc-dev+bounces-10971-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A9EB25D7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 09:34:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2cT71fXdz30T9;
	Thu, 14 Aug 2025 17:34:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.196
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755156891;
	cv=none; b=ODHCC8Bi2DVGNmY89fEDK+rCmQ6LkFQiq6nEbkeUvHZVyvF7U7zoMThY33DxHYb8l5XfDxqy9EbkZXSZYG9Ev/PrkjnWmlCHmoNEzuVMQKg/VR37iGSBOeB4N+nKuLpLd3LeqPQdusAZ5YqAGtZU/2b3VS6/u0hHgzTsPUPbdLhDKD54ELFJRlvUhRd1bvGFkZk1tVTpAI0/0teuQ150CPlSHee3ahOrOh/ABupZq6cgX5UQ+BkUQNOkI9ARJJ7X+MCHGLLWTCl8I/7E05Hn18gSPFrVkznPDwap2nHkVN2xjVmz6Nk55UcXTSQKb8khQaPlVzKJC9G56akcEh05yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755156891; c=relaxed/relaxed;
	bh=f5tAIsgzKuRELv1sm6eESXsPqoZSkkSUqkB2pMeL970=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rp6t+l6x8z0cvvidSeTuJJ5X4eaK9WL7uuISWPvSChQ1XrMDwVltCXQ8E7aLZ5vG1YBXk8pzvQpbfMvF4ucflO70VSf3eWp/i5aofPKxBzzOcBXX5K/niRHyE2vvQACbn5hgm+MFruOmDMbPnHV3Us43VKCm4TyNfeq4RjF1bxkoGsArUZdsotttyzkeqkjcsG6zKNsp1WGmr9ugjlDOUoCYh2pRUjq+BIpnRt8WHrUy0/VODYXcqYIO9IQKKWEAvzZAREz5t5jVpCd2M5mgTgsUwWztSix26u/Qw/WcXANd2ZCg9x+gvGuDY5Zqnz6Ut7N78L/QWZ8fb9lF0Snbuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=RnS1aIBf; dkim-atps=neutral; spf=pass (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=RnS1aIBf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 77267 seconds by postgrey-1.37 at boromir; Thu, 14 Aug 2025 17:34:49 AEST
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2cT55CTDz2yhX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 17:34:48 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0215444500;
	Thu, 14 Aug 2025 07:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1755156884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f5tAIsgzKuRELv1sm6eESXsPqoZSkkSUqkB2pMeL970=;
	b=RnS1aIBf3kPuNafBPr5O0T08jAPqeQ5PpdRcHNBXts4N2l7FzWgxEa6s2MzTJsWNvgoeJD
	rs8+UoZ/6KX/KVJx9TlJiusbzmgArqHlVRGeCLaSbEsBCU2HRcAMZ2Q5Qi8yQ9qqHxhaCY
	NQmY9HLvJ6a0YwkT+bGet4Q8QyI+Aj8y1e8qwovE6YeuPE7LJBJLThkwFB6wDIv/q3vUa2
	Y6BOmIXrewaucYGADm1kHYF/XC7OeNePDcd/Dn60VHLbxJgrXLJgPXdpZzOpr47yx6UAcQ
	3j7sr1Ocv7R9ogaltf0elyZxx3zqzbvSGBpnFIRzpAzDqPD8sZmkYmLXX95ChA==
Date: Thu, 14 Aug 2025 09:34:43 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/4] soc: fsl: qmc: Only set completion interrupt
 when needed
Message-ID: <20250814093443.1506b49f@bootlin.com>
In-Reply-To: <20250813120651.27dc8467@bootlin.com>
References: <cover.1754993232.git.christophe.leroy@csgroup.eu>
	<badb68a85910e5e6f1094ef3b01805209ac21854.1754993232.git.christophe.leroy@csgroup.eu>
	<20250813120651.27dc8467@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedtgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtkeertdertdejnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveeiffefgeeitdelleeigefhjeelueeuveekveetgeffheeltdekgeduiefggfdvnecukfhppedvrgdtudemtggstdekmeelkeeltgemkedttddtmehfugekudemleehgegvmedvudehrgemfeeluddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdtkeemleeklegtmeektddttdemfhgukedumeelheegvgemvdduhegrmeefledutddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepqhhirghnghdriihhrghosehngihprdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrghilhdrtghomhdprhgtphhtthhop
 egiihhusghordfnvggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: herve.codina@bootlin.com
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe,

On Wed, 13 Aug 2025 12:06:51 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi Christophe,
> 
> On Tue, 12 Aug 2025 12:50:55 +0200
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
> > When no post-completion processing is expected, don't waste time
> > handling useless interrupts.
> > 
> > Only set QMC_BD_[R/T]X_I when a completion function is passed in,
> > and perform seamless completion on submit for interruptless buffers.
> > 
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > ---
> > v2: Keep the UB flag to mark not completed buffers and seamlessly flag them as completed during next submit.
> > ---
> >  drivers/soc/fsl/qe/qmc.c | 44 ++++++++++++++++++++++++++++++----------
> >  1 file changed, 33 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> > index 36c0ccc06151f..8f76b9a5e385d 100644
> > --- a/drivers/soc/fsl/qe/qmc.c
> > +++ b/drivers/soc/fsl/qe/qmc.c
> > @@ -461,9 +461,16 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
> >  
> >  	ctrl = qmc_read16(&bd->cbd_sc);
> >  	if (ctrl & (QMC_BD_TX_R | QMC_BD_TX_UB)) {
> > -		/* We are full ... */
> > -		ret = -EBUSY;
> > -		goto end;
> > +		if (!(ctrl & QMC_BD_TX_I) && bd == chan->txbd_done) {
> > +			if (ctrl & QMC_BD_TX_W)
> > +				chan->txbd_done = chan->txbds;
> > +			else
> > +				chan->txbd_done++;
> > +		} else {
> > +			/* We are full ... */
> > +			ret = -EBUSY;
> > +			goto end;
> > +		}
> >  	}
> >  
> >  	qmc_write16(&bd->cbd_datlen, length);
> > @@ -475,6 +482,10 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
> >  
> >  	/* Activate the descriptor */
> >  	ctrl |= (QMC_BD_TX_R | QMC_BD_TX_UB);
> > +	if (complete)
> > +		ctrl |= QMC_BD_TX_I;
> > +	else
> > +		ctrl &= ~QMC_BD_TX_I;
> >  	wmb(); /* Be sure to flush the descriptor before control update */
> >  	qmc_write16(&bd->cbd_sc, ctrl);
> >    
> 
> You try to purge one descriptor for which the transfer is done but you do that
> when you have no more free descriptors.
> 
> You end up with all descriptor "used". I think a better way to do that is
> to purge all "done" descriptor configured to work without interrupts until a
> descriptor with interrupt is found.

I have looked again at your code and looking for a free descriptor only when it
is needed is sufficient. You can forget my previous proposal.

Back to your code, I think you need to be sure that the descriptor you want to
re-use is really available and so you need to check the 'R' bit to be sure
that we are not with 'R' = 1 and 'UB' = 1 which means "BD is used, waiting for
a transfer".

For instance:

	if (ctrl & (QMC_BD_TX_R | QMC_BD_TX_UB)) {
		if (!(ctrl & (QMC_BD_TX_I | QMC_BD_TX_R) &&
		    bd == chan->txbd_done) {
			if (ctrl & QMC_BD_TX_W)
				chan->txbd_done = chan->txbds;
			else
				chan->txbd_done++;
		} else {
			/* We are full ... */
			ret = -EBUSY;
			goto end;
		}
	}

Best regards,
Hervé

