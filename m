Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 055BE903BF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 16:15:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46952J436SzDrRs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 00:15:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nefkom.net
 (client-ip=2001:a60:0:28:0:1:25:1; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
X-Greylist: delayed 404 seconds by postgrey-1.36 at bilbo;
 Sat, 17 Aug 2019 00:13:07 AEST
Received: from mail-out.m-online.net (mail-out.m-online.net
 [IPv6:2001:a60:0:28:0:1:25:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4694zR3wyDzDrQ0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 00:13:06 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4694q964F9z1rY5c;
 Fri, 16 Aug 2019 16:05:57 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4694q94ZYpz1qqkc;
 Fri, 16 Aug 2019 16:05:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Fqta8ZAumElj; Fri, 16 Aug 2019 16:05:56 +0200 (CEST)
X-Auth-Info: diJfGt/M9slpnSuW7R94KZJVZk+HVANE2JID7Gh1OAc94xJZUSO+kK4qtxdlaSnz
Received: from igel.home (ppp-46-244-191-60.dynamic.mnet-online.de
 [46.244.191.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 16 Aug 2019 16:05:56 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id EFCA02C0E05; Fri, 16 Aug 2019 16:05:54 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Christian Marillat <marillat@debian.org>
Subject: Re: 5.2.7 kernel doesn't boot on G5
References: <87mugdtf08.fsf@christian.marillat.net>
 <CA+7wUsw5eTdwJG3UytWr9CajVhpUkyOGufmvUvqQJoEWq4nWhQ@mail.gmail.com>
 <a84c86b3-4c6c-f7a2-ad3f-6e075e6ebe25@c-s.fr>
 <87a7cal3pd.fsf@christian.marillat.net>
 <e582fcf0-a311-07f7-5445-c3471ec5c783@c-s.fr>
 <87zhk9tgdb.fsf__22033.2117214397$1565960670$gmane$org@christian.marillat.net>
X-Yow: Quick, sing me the BUDAPEST NATIONAL ANTHEM!!
Date: Fri, 16 Aug 2019 16:05:54 +0200
In-Reply-To: <87zhk9tgdb.fsf__22033.2117214397$1565960670$gmane$org@christian.marillat.net>
 (Christian Marillat's message of "Fri, 16 Aug 2019 15:00:16 +0200")
Message-ID: <87ef1ljjct.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2.90 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: Mathieu Malaterre <malat@debian.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Aug 16 2019, Christian Marillat <marillat@debian.org> wrote:

> On 15 août 2019 19:50, christophe leroy <christophe.leroy@c-s.fr> wrote:
>
> [...]
>
>> Can you test with latest stable version, ie 5.2.8 ?
>
> Built from my G5 with make-kpkg and still doesn't boot :

FWIW, 5.2.0 is working fine on my G5 (PowerMac7,3).

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
