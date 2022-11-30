Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC17763E2B8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 22:28:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMskX6VdRz3bm6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 08:28:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=buserror.net (client-ip=165.227.176.147; helo=baldur.buserror.net; envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
X-Greylist: delayed 2381 seconds by postgrey-1.36 at boromir; Thu, 01 Dec 2022 08:27:33 AEDT
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMsjx6cW4z2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 08:27:33 +1100 (AEDT)
Received: from [2601:447:c680:c050::b821]
	by baldur.buserror.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <oss@buserror.net>)
	id 1p0TxY-00ENdm-6p; Wed, 30 Nov 2022 14:45:36 -0600
Message-ID: <3d1a6cde6c8e108be77fa4a47666e14d06a91d74.camel@buserror.net>
From: Crystal Wood <oss@buserror.net>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Wed, 30 Nov 2022 14:45:34 -0600
In-Reply-To: <20221128043623.1745708-1-npiggin@gmail.com>
References: <20221128043623.1745708-1-npiggin@gmail.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2601:447:c680:c050::b821
X-SA-Exim-Rcpt-To: npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org, laurentiu.tudor@nxp.com, shentey@gmail.com, qemu-ppc@nongnu.org
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Report: 	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Subject: Re: [RFC PATCH] Disable Book-E KVM support?
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-11-28 at 14:36 +1000, Nicholas Piggin wrote:
> BookE KVM is in a deep maintenance state, I'm not sure how much testing
> it gets. I don't have a test setup, and it does not look like QEMU has
> any HV architecture enabled. It hasn't been too painful but there are
> some cases where it causes a bit of problem not being able to test, e.g.,
>=20
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-November/251452.html
>=20
> Time to begin removal process, or are there still people using it? I'm
> happy to to keep making occasional patches to try keep it going if
> there are people testing upstream. Getting HV support into QEMU would
> help with long term support, not sure how big of a job that would be.

Not sure what you mean about QEMU not having e500 HV support?  I don't know=
 if
it's bitrotted, but it's there.

I don't know whether anyone is still using this, but if they are, it's
probably e500mc and not e500v2 (which involved a bunch of hacks to get almo=
st-
sorta-usable performance out of hardware not designed for virtualization). =
 I
do see that there have been a few recent patches on QEMU e500 (beyond the
treewide cleanup type stuff), though I don't know if they're using KVM.  CC=
ing
them and the QEMU list.

I have an e6500 I could occasionally test on, if it turns out people do sti=
ll
care about this.  Don't count me as the use case, though. :-)

FWIW, as far as the RECONCILE_IRQ_STATE issue, that used to be done in
kvmppc_handle_exit(), but was moved in commit 9bd880a2c882 to be "cleaner a=
nd
faster". :-P

-Crystal

