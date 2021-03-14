Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35ED133A40C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 11:05:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DywCd1GT3z3cZq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 21:05:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Dyw7G0JsPz3cZk
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 21:01:30 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Dyw7F5N7hz9sWH; Sun, 14 Mar 2021 21:01:29 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Uwe Kleine-König <uwe@kleine-koenig.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210225221834.160083-1-uwe@kleine-koenig.org>
References: <20210225221834.160083-1-uwe@kleine-koenig.org>
Subject: Re: [PATCH v2] vio: make remove callback return void
Message-Id: <161571587113.138988.9982686273330745874.b4-ty@ellerman.id.au>
Date: Sun, 14 Mar 2021 21:01:29 +1100 (AEDT)
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
Cc: , Cristobal Forno <cforno12@linux.ibm.com>,
	Tyrel Datwyler <tyreld@linux.ibm.com>,
	Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
	Breno Leitão <leitao@debian.org>,
	Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>, linux-scsi@vger.kernel.org,
	Nayna Jain <nayna@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Michael Cyr <mikecyr@linux.ibm.com>,
	Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Lijun Pan <ljp@linux.ibm.com>, Matt Mackall <mpm@selenic.com>,
	Steven Royer <seroyer@linux.ibm.com>, e@lists.ozlabs.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Huewe <peterhuewe@gmx.d>, linux-kernel@vger.kernel.org,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org, Dany Madden <drt@linux.ibm.com>,
	Paul Mackerras <paulus@samba.org>, linux-integrity@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	"David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 25 Feb 2021 23:18:34 +0100, Uwe Kleine-König wrote:
> The driver core ignores the return value of struct bus_type::remove()
> because there is only little that can be done. To simplify the quest to
> make this function return void, let struct vio_driver::remove() return
> void, too. All users already unconditionally return 0, this commit makes
> it obvious that returning an error code is a bad idea.
> 
> Note there are two nominally different implementations for a vio bus:
> one in arch/sparc/kernel/vio.c and the other in
> arch/powerpc/platforms/pseries/vio.c. This patch only adapts the powerpc
> one.
> 
> [...]

Applied to powerpc/fixes.

[1/1] vio: make remove callback return void
      https://git.kernel.org/powerpc/c/386a966f5ce71a0364b158c5d0a6971f4e418ea8

cheers
