Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD87C4D513E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 19:22:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDy8g4GqXz30Dr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 05:22:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S/ra8oHP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S/ra8oHP; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDy7z4VCjz2yLX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 05:21:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 256B0618EE;
 Thu, 10 Mar 2022 18:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415CAC340E8;
 Thu, 10 Mar 2022 18:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646936505;
 bh=W4sOM9+B6L0c9LMgUrEbfgUrd76UKZTBgCwuqk0HzAE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=S/ra8oHP+rm+AWgS1iMavypZJ1MSEHgYve723Y7dEigN2WLgCCN+A2331kYtctj0n
 YkE+1KXYooU4r8d8lWLN5i8XR3sLJymAvzVQu7f+8HzKMwU3xQ/lT4IB00NRC9YGEw
 RzylTbxWCH1RDLP36ULbTaY65VJXT8ZErq0ksK6pEPUsk02M9rK0zgn1435HMbrzfE
 YPVnb0BREfPf0KsQzHb7tqiWomCWyaI2gJYyqoEUljMGHLayed5glbj+kMp1Sa/DUK
 QtmdEjPj9RgCtZ20P6/2SdaJBUkqBhkuxQrC4d/V5a+OyEGT+ANVadV9x2/3ewKtA4
 wrXWoY8VR3G/A==
Date: Thu, 10 Mar 2022 12:21:43 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v8 01/14] sizes.h: Add SZ_1T macro
Message-ID: <20220310182143.GA170924@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <969d885d-dcff-61b9-50cd-cdaf511505ab@csgroup.eu>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "alex@ghiti.fr" <alex@ghiti.fr>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "will@kernel.org" <will@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Toan Le <toan@os.amperecomputing.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 10, 2022 at 06:09:51PM +0000, Christophe Leroy wrote:
> 
> 
> Le 10/03/2022 à 17:52, Bjorn Helgaas a écrit :
> > On Wed, Mar 09, 2022 at 06:44:35PM +0100, Christophe Leroy wrote:
> >> Today drivers/pci/controller/pci-xgene.c defines SZ_1T
> >>
> >> Move it into linux/sizes.h so that it can be re-used elsewhere.
> >>
> >> Link: https://lore.kernel.org/r/575cb7164cf124c75df7cb9242ea7374733942bf.1642752946.git.christophe.leroy@csgroup.eu
> >> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> >> Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
> >> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> >> Cc: Toan Le <toan@os.amperecomputing.com>
> >> Cc: linux-pci@vger.kernel.org
> >> ---
> >>   This patch is already in linux-next but not in Linus' tree yet
> > 
> > What would you like me to do about this?  It's in linux-next, which
> > means it will go to Linus' tree during the next merge window.
> > 
> > But this is 01/14; are there other patches that I should be looking
> > at?  Do I need to coordinate this with other patches that depend on
> > it?
> 
> Yes sorry I should have said it. Patch 14/14 depends on it.
> 
> Don't know yet what's the merge strategy for this series, there as not 
> been any changes since v6 mid December and core parts are acked/reviewed 
> so I would be happy if at least core mm parts could go this cycle. I 
> sent a question to Michael and Andrew about it.

Since PCI is only minimally affected in this series, it would probably
make more sense for it to be merged along with the rest of the series
via a non-PCI tree.

It has my ack, so this can certainly happen.  If it does, I can easily
drop it from the PCI tree.

Bjorn
