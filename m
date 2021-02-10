Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD516315FBF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 07:54:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Db9VQ6kzTzDsq5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 17:54:38 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Db9S72VmZzDsmf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 17:52:37 +1100 (AEDT)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1l9jLs-0000uS-0W; Wed, 10 Feb 2021 17:51:53 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Wed, 10 Feb 2021 17:51:51 +1100
Date: Wed, 10 Feb 2021 17:51:51 +1100
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 00/20] Rid W=1 warnings in Crypto
Message-ID: <20210210065151.GA15914@gondor.apana.org.au>
References: <20210204111000.2800436-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204111000.2800436-1-lee.jones@linaro.org>
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
 Aymen Sghaier <aymen.sghaier@nxp.com>, Takashi Iwai <tiwai@suse.de>,
 Kent Yoder <yoder1@us.ibm.com>, Ayush Sawal <ayush.sawal@chelsio.com>,
 Joakim Bech <joakim.xx.bech@stericsson.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
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
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
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

On Thu, Feb 04, 2021 at 11:09:40AM +0000, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> This is set 1 of 2 sets required to fully clean Crypto.
> 
> Lee Jones (20):
>   crypto: hisilicon: sec_drv: Supply missing description for
>     'sec_queue_empty()'s 'queue' param
>   crypto: bcm: util: Repair a couple of documentation formatting issues
>   crypto: chelsio: chcr_core: File headers are not good candidates for
>     kernel-doc
>   crypto: ux500: hash: hash_core: Fix worthy kernel-doc headers and
>     remove others
>   crypto: bcm: spu: Fix formatting and misspelling issues
>   crypto: keembay: ocs-hcu: Fix incorrectly named functions/structs
>   crypto: bcm: spu2: Fix a whole host of kernel-doc misdemeanours
>   crypto: ux500: cryp: Demote some conformant non-kernel headers fix
>     another
>   crypto: ux500: cryp_irq: File headers are not good kernel-doc
>     candidates
>   crypto: chelsio: chcr_algo: Fix a couple of kernel-doc issues caused
>     by doc-rot
>   crypto: ux500: cryp_core: Fix formatting issue and add description for
>     'session_id'
>   crypto: atmel-ecc: Struct headers need to start with keyword 'struct'
>   crypto: bcm: cipher: Provide description for 'req' and fix formatting
>     issues
>   crypto: caam: caampkc: Provide the name of the function
>   crypto: caam: caamalg_qi2: Supply a couple of 'fallback' related
>     descriptions
>   crypto: vmx: Source headers are not good kernel-doc candidates
>   crypto: nx: nx-aes-cbc: Headers comments should not be kernel-doc
>   crypto: nx: nx_debugfs: Header comments should not be kernel-doc
>   crypto: nx: Demote header comment and add description for 'nbytes'
>   crypto: cavium: nitrox_isr: Demote non-compliant kernel-doc headers

Thanks for doing this.  But please don't split the patches at the
file level.  Instead split them at the driver level.  For example,
all of your bcm changes should be one patch.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
