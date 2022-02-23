Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 247424C162D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 16:10:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3fc72QdHz3cKM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 02:10:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=xS7aTKWI;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sxQAYgK9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=xS7aTKWI; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=sxQAYgK9; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3fbS2RsBz2xrd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 02:09:55 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 41C27212B8;
 Wed, 23 Feb 2022 15:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645628992;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+bG53Wp6Gl3zxi+iDVlP2+hLh3hp86ZbjZHuT6T3H4c=;
 b=xS7aTKWI8XT6G562T77CJH92o9fzp6NYMX790K0voS6SNKVFj5iAdczmeOdVLIiYNDLP70
 VoCtdAGAIaTilxlnT2pFdK2eknkRndK/LPY2z+NpatJ7jeR1VGtTmOubyMnlZDCKTGRz1+
 Ar7FNLNr9kWvEDB2sXkPsr0OuY7k52Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645628992;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+bG53Wp6Gl3zxi+iDVlP2+hLh3hp86ZbjZHuT6T3H4c=;
 b=sxQAYgK9otm3HSE0AEpEYEywkD0OFra5TTgWQTx83lUUmg9KFW+TiHb4MaQCtioGW3pf9E
 0YrDKER4+2oa62Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF94913D80;
 Wed, 23 Feb 2022 15:09:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Zo4FLT9OFmIiYAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 23 Feb 2022 15:09:51 +0000
Date: Wed, 23 Feb 2022 16:09:50 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH v3 1/2] crypto: vmx - merge CRYPTO_DEV_VMX_ENCRYPT into
 CRYPTO_DEV_VMX
Message-ID: <YhZOPvXEe1avs5uu@pevik>
References: <20220217105751.6330-1-pvorel@suse.cz>
 <20220217105751.6330-2-pvorel@suse.cz>
 <YhWirRLlQNs3jha/@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhWirRLlQNs3jha/@gondor.apana.org.au>
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Nicolai Stange <nstange@suse.de>, linux-kbuild@vger.kernel.org,
 Nayna Jain <nayna@linux.ibm.com>, Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 linux-crypto@vger.kernel.org, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On Thu, Feb 17, 2022 at 11:57:50AM +0100, Petr Vorel wrote:
> > CRYPTO_DEV_VMX_ENCRYPT is redundant with CRYPTO_DEV_VMX.

> > And it also forces CRYPTO_GHASH to be builtin even
> > CRYPTO_DEV_VMX_ENCRYPT was configured as module.

> Just because a tristate sits under a bool, it does not force
> the options that it selects to y/n.  The select still operates
> on the basis of the tristate.
I'm sorry, not sure what I did wrong before. Now it really behaves as expected.

> So I don't see the point to this code churn unless the powerpc
> folks want to move in this direction.
Sure (sending now just second commit as requested.

Thank for your review.

Kind regards,
Petr

> Thanks,
