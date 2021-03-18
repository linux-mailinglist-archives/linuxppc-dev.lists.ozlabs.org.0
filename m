Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4259340C64
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 19:04:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1ZfC4Mgbz3c18
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 05:04:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=mansr.com (client-ip=2001:8b0:ca0d:8d8e::2;
 helo=unicorn.mansr.com; envelope-from=mans@mansr.com; receiver=<UNKNOWN>)
X-Greylist: delayed 3273 seconds by postgrey-1.36 at boromir;
 Fri, 19 Mar 2021 05:03:46 AEDT
Received: from unicorn.mansr.com (unicorn.mansr.com
 [IPv6:2001:8b0:ca0d:8d8e::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1Zdt31DSz3014
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 05:03:45 +1100 (AEDT)
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:8d8e::3])
 by unicorn.mansr.com (Postfix) with ESMTPS id C65CC15361;
 Thu, 18 Mar 2021 18:03:42 +0000 (GMT)
Received: by raven.mansr.com (Postfix, from userid 51770)
 id B967B219C32; Thu, 18 Mar 2021 18:03:42 +0000 (GMT)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/10] alpha: use libata instead of the legacy ide driver
References: <20210318045706.200458-1-hch@lst.de>
 <20210318045706.200458-2-hch@lst.de>
 <YFLrLwjZubWUvA2J@zeniv-ca.linux.org.uk>
 <20210318060724.GA29117@lst.de> <yw1x1rccie35.fsf@mansr.com>
Date: Thu, 18 Mar 2021 18:03:42 +0000
In-Reply-To: <yw1x1rccie35.fsf@mansr.com> (=?iso-8859-1?Q?=22M=E5ns_Rullg?=
 =?iso-8859-1?Q?=E5rd=22's?= message of "Thu,
 18 Mar 2021 17:09:02 +0000")
Message-ID: <yw1xwnu4gwzl.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
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
Cc: Jens Axboe <axboe@kernel.dk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

M=E5ns Rullg=E5rd <mans@mansr.com> writes:

> Christoph Hellwig <hch@lst.de> writes:
>
>> On Thu, Mar 18, 2021 at 05:54:55AM +0000, Al Viro wrote:
>>> On Thu, Mar 18, 2021 at 05:56:57AM +0100, Christoph Hellwig wrote:
>>> > Switch the alpha defconfig from the legacy ide driver to libata.
>>>=20
>>> Umm...  I don't have an IDE alpha box in a usable shape (fans on
>>> CPU module shat themselves), and it would take a while to resurrect
>>> it, but I remember the joy it used to cause in some versions.
>>>=20
>>> Do you have reports of libata variants of drivers actually tested on
>>> those?
>>
>> No, I haven't.  The whole point is that we're not going to keep 40000
>> lines of code around despite notice for users that don't exist or
>> care.  If there is a regression we'll fix it, but we're not going to
>> make life miserable just because we can.
>
> The pata_ali driver works fine on my UP1500 machine, unless something
> broke recently.  I'll build the latest kernel and report back.

5.11.7 seems fine too.

--=20
M=E5ns Rullg=E5rd
