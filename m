Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB21D2827
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 08:47:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N2CB3fN3zDqN5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 16:47:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=buserror.net
 (client-ip=165.227.176.147; helo=baldur.buserror.net;
 envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=buserror.net
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49N2931lHVzDqcJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 16:45:11 +1000 (AEST)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1jZ7a4-00089d-4T; Thu, 14 May 2020 01:42:56 -0500
Message-ID: <6456c742fa178b54aadff5f0d4d7f28cb47c93a2.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Darren Stevens <darren@stevens-zone.net>
Date: Thu, 14 May 2020 01:42:55 -0500
In-Reply-To: <4fb03d6874.55cfc4a1@auth.smtp.1and1.co.uk>
References: <20200507223025.0164b95b@Cyrus.lan>
 <d64d04f010598ada6e7ddb3af63fee2592b3ebeb.camel@buserror.net>
 <4fb03d6874.55cfc4a1@auth.smtp.1and1.co.uk>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: darren@stevens-zone.net, linuxppc-dev@lists.ozlabs.org,
 chzigotzky@xenosoft.de
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 * -1.5 GREYLIST_ISWHITE The incoming server has been whitelisted for
 *      this recipient and sender
Subject: Re: powerpc/mpc85xx: Add Cyrus P5040 device tree source
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
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
Cc: linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-05-13 at 23:02 +0100, Darren Stevens wrote:
> Hello Scott
> 
> On 08/05/2020, Scott Wood wrote:
> > On Thu, 2020-05-07 at 22:30 +0100, Darren Stevens wrote:
> > > 
> > > +/include/ "p5040si-pre.dtsi"
> > > +
> > > +/ {
> > > +    model = "varisys,CYRUS5040";
> > > +    compatible = "varisys,CYRUS";
> > 
> > Is this board 100% compatible with the Cyrus P5020 board, down to every
> > last
> > quirk, except for the SoC plugged into it?  If not, they shouldn't have
> > the
> > same compatible.  If they are, then couldn't everything in this file but
> > the
> > SoC include be moved to a dtsi shared with cyrus_p5020.dts?
> 
> It's not 100% compatible, the mdio ports map to different fman ports, but
> both as are 'corenet generic' boards, I added varisys,CYRUS so it would be
> detected in corenet_generic.c - support for the 5020 was added by Andy
> Flemming, I've just tried to copy what he did.
> 
> I can add another entry to the table, but do we realy want a separate entry
> in the table for every supported board rather than using the device tree for
> similar boards?

A separate compatible for each board is generally what we've done, as it
allows for the possibility of board-specific quirks.  At least it's just a
table entry; back in the day it used to be a separate file. :-P

That said, if you're pretty sure that all potentially relevant differences are
described elsewhere in the device tree, I wouldn't mind too much if it
becomes:
	compatible = "varisys,CYRUS5040", "varisys,CYRUS";

-Scott


