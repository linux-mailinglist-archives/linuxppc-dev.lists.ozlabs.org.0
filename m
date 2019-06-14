Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CE6463EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 18:21:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QQq46mdrzDrgV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 02:21:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="L8qaLG22"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QQnB5XVyzDrQw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 02:20:14 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B8542183E;
 Fri, 14 Jun 2019 16:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560529212;
 bh=+miqeMfSWkr4moUYw1GPgzK89cG9rhNix4a208bvm+U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L8qaLG22aoUH7W2zcf+EYqbggukwbugLjLyWZxukMUkndtgnt54icT8hgjuaOGrRJ
 O4kIGE/19aFlytfdvWsRaBhik8fY3OvW0GjKuHkAygAWFcVyaM6ZtLp9PB561shqVy
 I58hBLwe97fgUUV+D1oi9Q2q9NrujVPxy8kR7cYk=
Date: Fri, 14 Jun 2019 18:20:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH 00/14] Add support to generate ABI documentation at
 admin-guide
Message-ID: <20190614162009.GA25572@kroah.com>
References: <cover.1560477540.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1560477540.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
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
Cc: Sebastian Reichel <sre@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Andrew Donnellan <ajd@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-pm@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Andreas Klinger <ak@it-klinger.de>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, Tony Luck <tony.luck@intel.com>,
 Anton Vorontsov <anton@enomsg.org>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Colin Cross <ccross@android.com>, Frederic Barrat <fbarrat@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Stefan Achatz <erazor_de@users.sourceforge.net>,
 Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 13, 2019 at 11:04:06PM -0300, Mauro Carvalho Chehab wrote:
> Greg,
> 
> As promised, I'm resending the patch series with adds the Kernel ABI to
> Documentation/admin-guide.
> 
> Those patches are basically the version 3 patchset I sent back in 2017,
> rebased on the top of linux-next (next-20190613), and with some fixes
> in order for it to work.
> 
> - The 4 initial patches to fix some ABI descriptions that are violating 
>   the syntax described at Documentation/ABI/README;

These 4 are now applied to my driver-core tree, thanks.

greg k-h
