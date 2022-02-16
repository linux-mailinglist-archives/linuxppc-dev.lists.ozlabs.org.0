Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA874B851B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 11:02:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzD603BPRz3cV9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 21:02:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=RpMDLxm2;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PXDUbz8P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=RpMDLxm2; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PXDUbz8P; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzD5P3JQ9z2xBP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 21:02:01 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 437A31F37D;
 Wed, 16 Feb 2022 10:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645005719;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VdVQOy+sPvfsqUg3D3Kt7VC/vYBeiMYJP+Nr1pAL6C8=;
 b=RpMDLxm2DyHTo2IGX3scsEDsfOp0N/EWj04ADtUqQ3S6F8E+F2NnaNtFWYYfWsq23blUmz
 PU7KJeOauwnJex1ZW7T9phOlLsbaIeXvmubu8oBfNI4yuDr13rMPk+qdy/bWxRkf4+QUpA
 LCHJ+lqPucID808yQ7lG+RcXnO4NMCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645005719;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VdVQOy+sPvfsqUg3D3Kt7VC/vYBeiMYJP+Nr1pAL6C8=;
 b=PXDUbz8PtUHVLzXWRgvX3mKns1tmElrGsi+O1s67OEHrSSzbmn6Np7NeJ2Em+n+9dJ4nc1
 t+blfLrvWmgDFHDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E349113A9F;
 Wed, 16 Feb 2022 10:01:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CFaNNZbLDGIjAgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 16 Feb 2022 10:01:58 +0000
Date: Wed, 16 Feb 2022 11:01:57 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Nicolai Stange <nstange@suse.de>
Subject: Re: [PATCH v2 1/2] crypto: vmx: Turn CRYPTO_DEV_VMX_ENCRYPT into
 tristate
Message-ID: <YgzLlZRAk21HwCzV@pevik>
References: <20220215185936.15576-1-pvorel@suse.cz>
 <20220215185936.15576-2-pvorel@suse.cz> <87tuczf96a.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuczf96a.fsf@suse.de>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-kbuild@vger.kernel.org,
 Nayna Jain <nayna@linux.ibm.com>, Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 linux-crypto@vger.kernel.org, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

side notes about the subject (following private notes from Nicolai):

I dared to use "crypto: vmx: " in subject, next version I'll use "crypto: vmx - "
as it's used in crypto.

Also continue the subject line into the rest of the commit message isn't
probably wanted.

Kind regards,
Petr
