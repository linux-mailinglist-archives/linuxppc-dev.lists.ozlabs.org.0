Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 249E234A469
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 10:32:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6GwX12Kcz3c2m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 20:32:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18;
 helo=fornost.hmeau.com; envelope-from=herbert@gondor.apana.org.au;
 receiver=<UNKNOWN>)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6GwB3ZRCz3bp0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 20:32:24 +1100 (AEDT)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1lPiob-0003VV-8k; Fri, 26 Mar 2021 20:31:38 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 26 Mar 2021 20:31:36 +1100
Date: Fri, 26 Mar 2021 20:31:36 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 00/10] Rid W=1 warnings in Crypto
Message-ID: <20210326093136.GH12658@gondor.apana.org.au>
References: <20210318124422.3200180-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210318124422.3200180-1-lee.jones@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Aymen Sghaier <aymen.sghaier@nxp.com>, Kent Yoder <yoder1@us.ibm.com>,
 Ayush Sawal <ayush.sawal@chelsio.com>,
 Joakim Bech <joakim.xx.bech@stericsson.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Paul Mackerras <paulus@samba.org>,
 Andreas Westin <andreas.westin@stericsson.com>,
 Breno =?iso-8859-1?Q?Leit=E3o?= <leitao@debian.org>,
 Atul Gupta <atul.gupta@chelsio.com>,
 Niklas Hernaeus <niklas.hernaeus@stericsson.com>,
 M R Gowda <yeshaswi@chelsio.com>,
 Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
 Rohit Maheshwari <rohitm@chelsio.com>, Nayna Jain <nayna@linux.ibm.com>,
 Manoj Malviya <manojmalviya@chelsio.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jonas Linde <jonas.linde@stericsson.com>, Rob Rice <rob.rice@broadcom.com>,
 Zaibo Xu <xuzaibo@huawei.com>, Harsh Jain <harsh@chelsio.com>,
 Declan Murphy <declan.murphy@intel.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Shujuan Chen <shujuan.chen@stericsson.com>,
 Henrique Cerri <mhcerri@br.ibm.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Jonathan Cameron <jonathan.cameron@huawei.com>, linux-kernel@vger.kernel.org,
 Berne Hebark <berne.herbark@stericsson.com>, linux-crypto@vger.kernel.org,
 Jitendra Lulla <jlulla@chelsio.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 18, 2021 at 12:44:12PM +0000, Lee Jones wrote:
> This is set 1 of 2 sets required to fully clean Crypto.
> 
> v2: No functional changes since v1.
> v3: Description change and additional struct header fix
> 
> Lee Jones (10):
>   crypto: hisilicon: sec_drv: Supply missing description for
>     'sec_queue_empty()'s 'queue' param
>   crypto: bcm: Fix a whole host of kernel-doc misdemeanours
>   crypto: chelsio: chcr_core: Fix some kernel-doc issues
>   crypto: ux500: hash: hash_core: Fix worthy kernel-doc headers and
>     remove others
>   crypto: keembay: ocs-hcu: Fix incorrectly named functions/structs
>   crypto: atmel-ecc: Struct headers need to start with keyword 'struct'
>   crypto: caam: caampkc: Provide the name of the function and provide
>     missing descriptions
>   crypto: vmx: Source headers are not good kernel-doc candidates
>   crypto: nx: nx-aes-cbc: Repair some kernel-doc problems
>   crypto: cavium: nitrox_isr: Demote non-compliant kernel-doc headers
> 
>  drivers/crypto/atmel-ecc.c                |  2 +-
>  drivers/crypto/bcm/cipher.c               |  7 ++--
>  drivers/crypto/bcm/spu.c                  | 16 ++++-----
>  drivers/crypto/bcm/spu2.c                 | 43 +++++++++++++----------
>  drivers/crypto/bcm/util.c                 |  4 +--
>  drivers/crypto/caam/caamalg_qi2.c         |  3 ++
>  drivers/crypto/caam/caampkc.c             |  3 +-
>  drivers/crypto/cavium/nitrox/nitrox_isr.c |  4 +--
>  drivers/crypto/chelsio/chcr_algo.c        |  8 ++---
>  drivers/crypto/chelsio/chcr_core.c        |  2 +-
>  drivers/crypto/hisilicon/sec/sec_drv.c    |  1 +
>  drivers/crypto/keembay/ocs-hcu.c          |  8 ++---
>  drivers/crypto/nx/nx-aes-cbc.c            |  2 +-
>  drivers/crypto/nx/nx.c                    |  5 +--
>  drivers/crypto/nx/nx_debugfs.c            |  2 +-
>  drivers/crypto/ux500/cryp/cryp.c          |  5 +--
>  drivers/crypto/ux500/cryp/cryp_core.c     |  5 +--
>  drivers/crypto/ux500/cryp/cryp_irq.c      |  2 +-
>  drivers/crypto/ux500/hash/hash_core.c     | 15 +++-----
>  drivers/crypto/vmx/vmx.c                  |  2 +-
>  20 files changed, 73 insertions(+), 66 deletions(-)
> 
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Andreas Westin <andreas.westin@stericsson.com>
> Cc: Atul Gupta <atul.gupta@chelsio.com>
> Cc: Aymen Sghaier <aymen.sghaier@nxp.com>
> Cc: Ayush Sawal <ayush.sawal@chelsio.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Berne Hebark <berne.herbark@stericsson.com>
> Cc: "Breno Leitão" <leitao@debian.org>
> Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Declan Murphy <declan.murphy@intel.com>
> Cc: Harsh Jain <harsh@chelsio.com>
> Cc: Henrique Cerri <mhcerri@br.ibm.com>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: "Horia Geantă" <horia.geanta@nxp.com>
> Cc: Jitendra Lulla <jlulla@chelsio.com>
> Cc: Joakim Bech <joakim.xx.bech@stericsson.com>
> Cc: Jonas Linde <jonas.linde@stericsson.com>
> Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
> Cc: Kent Yoder <yoder1@us.ibm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-crypto@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Manoj Malviya <manojmalviya@chelsio.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: M R Gowda <yeshaswi@chelsio.com>
> Cc: Nayna Jain <nayna@linux.ibm.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Niklas Hernaeus <niklas.hernaeus@stericsson.com>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
> Cc: Rob Rice <rob.rice@broadcom.com>
> Cc: Rohit Maheshwari <rohitm@chelsio.com>
> Cc: Shujuan Chen <shujuan.chen@stericsson.com>
> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> Cc: Vinay Kumar Yadav <vinay.yadav@chelsio.com>
> Cc: Zaibo Xu <xuzaibo@huawei.com>

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
