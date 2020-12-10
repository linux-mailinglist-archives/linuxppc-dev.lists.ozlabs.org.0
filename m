Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1B42D6013
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 16:42:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsJ8J20TDzDqj1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 02:42:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=jzuzGeJw; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsGvk5q1nzDqFY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 01:46:42 +1100 (AEDT)
Date: Thu, 10 Dec 2020 15:47:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1607611598;
 bh=8roGAcaqdWV7Cx09/qYtV5EtfHdEnYqtywgHdVmgwQk=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=jzuzGeJwxxrfyurgYKXmQEv0RmrKj0q3aVAr8MampgupErIRCWrDwttbbsyj8Irne
 3NM4NP5OQ3eYqUzIj21UyFrikfMa9m70g19KwKQQ1rMk4RXUZlXScLznpcDZNiMOdA
 PnzoAkjWVN0o1SUe5Zxd/6FVF56Hs6xskQfgt6lU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH] cxl: Reduce scope =?utf-8?Q?fo?=
 =?utf-8?B?ciB0aGUgdmFyaWFibGUg4oCcbW3igJ0=?= in cxllib_get_PE_attributes()
Message-ID: <X9I1GLYCkw/q/xMu@kroah.com>
References: <5cee2b25-71e0-15aa-fba6-12211b8308aa@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cee2b25-71e0-15aa-fba6-12211b8308aa@web.de>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 10, 2020 at 03:35:38PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 10 Dec 2020 14:14:07 +0100
> 
> A local variable was used only within an if branch.
> Thus move the definition for the variable “mm” into the corresponding
> code block.

You did nothing here except add a checkpatch warning :(

dropped.

greg k-h
