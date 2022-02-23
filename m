Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B424C09C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 03:58:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3LMY6rTJz3cBr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 13:58:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18;
 helo=fornost.hmeau.com; envelope-from=herbert@gondor.apana.org.au;
 receiver=<UNKNOWN>)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3LM61Hd5z2x9F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 13:58:08 +1100 (AEDT)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1nMhqf-0006CX-PL; Wed, 23 Feb 2022 13:57:50 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Wed, 23 Feb 2022 14:57:49 +1200
Date: Wed, 23 Feb 2022 14:57:49 +1200
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Petr Vorel <pvorel@suse.cz>
Subject: Re: [PATCH v3 1/2] crypto: vmx - merge CRYPTO_DEV_VMX_ENCRYPT into
 CRYPTO_DEV_VMX
Message-ID: <YhWirRLlQNs3jha/@gondor.apana.org.au>
References: <20220217105751.6330-1-pvorel@suse.cz>
 <20220217105751.6330-2-pvorel@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217105751.6330-2-pvorel@suse.cz>
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
Cc: Nicolai Stange <nstange@suse.de>, linux-kbuild@vger.kernel.org,
 Nayna Jain <nayna@linux.ibm.com>, Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 linux-crypto@vger.kernel.org, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 17, 2022 at 11:57:50AM +0100, Petr Vorel wrote:
> CRYPTO_DEV_VMX_ENCRYPT is redundant with CRYPTO_DEV_VMX.
> 
> And it also forces CRYPTO_GHASH to be builtin even
> CRYPTO_DEV_VMX_ENCRYPT was configured as module.

Just because a tristate sits under a bool, it does not force
the options that it selects to y/n.  The select still operates
on the basis of the tristate.

So I don't see the point to this code churn unless the powerpc
folks want to move in this direction.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
