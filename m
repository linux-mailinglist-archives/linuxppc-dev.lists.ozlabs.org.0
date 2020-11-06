Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 184562A9E3F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 20:43:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSW5v2d2CzDrQ4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 06:43:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=wMKjo9VU; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSW4P1J3szDrKj;
 Sat,  7 Nov 2020 06:42:13 +1100 (AEDT)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E0ADB2151B;
 Fri,  6 Nov 2020 19:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604691730;
 bh=s2Inx9eYd7uxPfxMoT0GW2my3r/hMV9mLcWCvGtA9Go=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=wMKjo9VUyquDqCH96i/MBZ2LCvtnZNzxxmEnuNfrQudXAqxt8ctW7jsmMo2Ua590J
 b5CZJ6lwMC99NRf8D64/ZJ7w55itrQa8xdeSs0pivYu8MfS4H+I4LpfGNUKFAV8asZ
 tNzVRyqaLLcbGWOtnY0yiqxEdXnvTh/5t6p4CBvg=
Date: Fri, 6 Nov 2020 11:42:08 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: ljp <ljp@linux.vnet.ibm.com>
Subject: Re: [PATCH net-next] Revert ibmvnic merge do_change_param_reset
 into do_reset
Message-ID: <20201106114208.4b0e8eec@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <0ff353cbada91b031d1bbae250a975d5@linux.vnet.ibm.com>
References: <20201106191745.1679846-1-drt@linux.ibm.com>
 <0ff353cbada91b031d1bbae250a975d5@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: wvoigt@us.ibm.com, netdev@vger.kernel.org,
 Linuxppc-dev <linuxppc-dev-bounces+ljp=linux.ibm.com@lists.ozlabs.org>,
 Dany Madden <drt@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 06 Nov 2020 13:30:25 -0600 ljp wrote:
> On 2020-11-06 13:17, Dany Madden wrote:
> > This reverts commit 16b5f5ce351f8709a6b518cc3cbf240c378305bf
> > where it restructures do_reset. There are patches being tested that
> > would require major rework if this is committed first.
> > 
> > We will resend this after the other patches have been applied.  
> 
> I discussed with my manager, and he has agreed not revert this one
> since it is in the net-next tree and will not affect net tree for
> current bug fix patches.

We merge net into net-next periodically (~every week or so) so if you
keep making changes to both branches I will have to deal with the
fallout.

I'm assuming that the resolution for the current conflict which Stephen
Rothwell sent from linux-next is correct. Please confirm.

I will resolve it like he did when Linus pulls from net (hopefully
later today).

But if you know you have more fixes I'd rather revert this, get all the
relevant fixed into net, wait for net to be merged into net-next and
then redo the refactoring.

Hope that makes sense.
