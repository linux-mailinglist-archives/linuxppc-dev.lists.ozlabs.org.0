Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E79DD574C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2019 20:21:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46rqky3mjkzDqnk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 05:21:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46rqj1247zzDqjb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 05:19:30 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 5475E146D832C;
 Sun, 13 Oct 2019 11:19:22 -0700 (PDT)
Date: Sun, 13 Oct 2019 11:19:21 -0700 (PDT)
Message-Id: <20191013.111921.357704258801923369.davem@davemloft.net>
To: clg@kaod.org
Subject: Re: [PATCH] net/ibmvnic: Fix EOI when running in XIVE mode.
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191011055254.8347-1-clg@kaod.org>
References: <20191011055254.8347-1-clg@kaod.org>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sun, 13 Oct 2019 11:19:22 -0700 (PDT)
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
Cc: julietk@linux.vnet.ibm.com, tlfalcon@linux.ibm.com, jallen@linux.ibm.com,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: C=E9dric Le Goater <clg@kaod.org>
Date: Fri, 11 Oct 2019 07:52:54 +0200

> pSeries machines on POWER9 processors can run with the XICS (legacy)
> interrupt mode or with the XIVE exploitation interrupt mode. These
> interrupt contollers have different interfaces for interrupt
> management : XICS uses hcalls and XIVE loads and stores on a page.
> H_EOI being a XICS interface the enable_scrq_irq() routine can fail
> when the machine runs in XIVE mode.
> =

> Fix that by calling the EOI handler of the interrupt chip.
> =

> Fixes: f23e0643cd0b ("ibmvnic: Clear pending interrupt after device r=
eset")
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>

Applied and queued up for -stable, thanks.
