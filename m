Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6682201A0B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 20:12:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pRjD5t3KzDrTL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 04:12:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.158; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0158.hostedemail.com
 [216.40.44.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pRdl6c5pzDrMf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 04:09:14 +1000 (AEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id DE1461313C2;
 Fri, 19 Jun 2020 18:09:09 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1381:1437:1515:1516:1518:1534:1538:1568:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3876:3877:4321:5007:6114:6642:10004:10400:10848:11232:11658:11914:12048:12296:12297:12740:12760:12895:13069:13311:13357:13439:14659:14721:21080:21627:30046:30054:30075:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: song67_620abc226e1b
X-Filterd-Recvd-Size: 1591
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf03.hostedemail.com (Postfix) with ESMTPA;
 Fri, 19 Jun 2020 18:09:08 +0000 (UTC)
Message-ID: <a70251985203280662cd0db2de05a9a0b1c5de7d.camel@perches.com>
Subject: Re: [PATCH] pci: pcie: AER: Fix logging of Correctable errors
From: Joe Perches <joe@perches.com>
To: Sinan Kaya <okaya@kernel.org>, Matt Jolly <Kangie@footclan.ninja>, 
 Russell Currey <ruscur@russell.cc>, Sam Bobroff <sbobroff@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>,  Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 19 Jun 2020 11:09:07 -0700
In-Reply-To: <d611dabd-b943-8492-a29e-0b7fb1980de8@kernel.org>
References: <20200618155511.16009-1-Kangie@footclan.ninja>
 <d611dabd-b943-8492-a29e-0b7fb1980de8@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-06-19 at 13:17 -0400, Sinan Kaya wrote:
> On 6/18/2020 11:55 AM, Matt Jolly wrote:
> 
> > +		pci_warn(dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
> > +			dev->vendor, dev->device,
> > +			info->status, info->mask);
> > +	} else {
> 
> <snip>
> 
> > +		pci_err(dev, "  device [%04x:%04x] error status/mask=%08x/%08x\n",
> > +			dev->vendor, dev->device,
> > +			info->status, info->mask);
> 
> Function pointers for pci_warn vs. pci_err ?

Not really possible as both are function-like macros.


