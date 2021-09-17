Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F09FD40F7E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 14:36:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9tjw3ZrZz2yV4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 22:36:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4H9tjT1ZHLz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 22:36:10 +1000 (AEST)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 18HCXk9i027608;
 Fri, 17 Sep 2021 07:33:47 -0500
Message-ID: <55941ad30ce5515e6955565e3fa155f6caa2a896.camel@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: warn on emulation of dcbz instruction
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: David Laight <David.Laight@ACULAB.COM>, "'Christophe Leroy'"
 <christophe.leroy@csgroup.eu>, Paul Mackerras <paulus@samba.org>, Michael
 Ellerman <mpe@ellerman.id.au>
Date: Fri, 17 Sep 2021 22:33:46 +1000
In-Reply-To: <2fc6953808854149965e60f340eca94b@AcuMS.aculab.com>
References: <62b33ca839f3d1d7d4b64b6f56af0bbe4d2c9057.1631716292.git.christophe.leroy@csgroup.eu>
 <2c0fd775625c76c4dd09b3e923da4405a003f3bd.camel@kernel.crashing.org>
 <eb1a39368401bf46e805ca64256604cc649f771e.camel@kernel.crashing.org>
 <43f736d4-8625-2848-786f-79b902d5c753@csgroup.eu>
 <2fc6953808854149965e60f340eca94b@AcuMS.aculab.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Cc: Finn Thain <fthain@linux-m68k.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stan Johnson <userm57@yahoo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2021-09-16 at 14:36 +0000, David Laight wrote:
> > Does userspace accesses non-cached memory directly ?
> 
> 
> It probably can if a driver mmaps PCI space directly into user space.
> 
> That certainly works on x86-64.

The posterchild for that is Xorg

Cheers,
Ben.


