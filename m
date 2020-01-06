Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9F3131771
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2020 19:24:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47s3nL4QD2zDqD1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 05:24:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=buserror.net
 (client-ip=165.227.176.147; helo=baldur.buserror.net;
 envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=buserror.net
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47s3X66LPgzDqFs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 05:12:54 +1100 (AEDT)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1ioWlM-0008D1-Mb; Mon, 06 Jan 2020 12:06:01 -0600
Message-ID: <d8cddd005901e64133e9ecbb14ec8fdf3269972d.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: yingjie_bai@126.com, Kumar Gala <galak@kernel.crashing.org>
Date: Mon, 06 Jan 2020 12:05:59 -0600
In-Reply-To: <20200106042957.26494-2-yingjie_bai@126.com>
References: <20200106042957.26494-1-yingjie_bai@126.com>
 <20200106042957.26494-2-yingjie_bai@126.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: yingjie_bai@126.com, galak@kernel.crashing.org,
 byj.tea@gmail.com, benh@kernel.crashing.org, paulus@samba.org,
 mpe@ellerman.id.au, christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com,
 yanaijie@huawei.com, diana.craciun@nxp.com, nsaenzjulienne@suse.de,
 npiggin@gmail.com, tglx@linutronix.de, gregkh@linuxfoundation.org,
 allison@lohutok.net, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 * -1.5 GREYLIST_ISWHITE The incoming server has been whitelisted for
 *      this recipient and sender
Subject: Re: [PATCH v3 2/2] powerpc/mpc85xx: also write addr_h to spin table
 for 64bit boot entry
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: Jason Yan <yanaijie@huawei.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Diana Craciun <diana.craciun@nxp.com>, Paul Mackerras <paulus@samba.org>,
 Allison Randal <allison@lohutok.net>, Bai Yingjie <byj.tea@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-01-06 at 12:29 +0800, yingjie_bai@126.com wrote:
> From: Bai Yingjie <byj.tea@gmail.com>
> 
> CPU like P4080 has 36bit physical address, its DDR physical
> start address can be configured above 4G by LAW registers.
> 
> For such systems in which their physical memory start address was
> configured higher than 4G, we need also to write addr_h into the spin
> table of the target secondary CPU, so that addr_h and addr_l together
> represent a 64bit physical address.
> Otherwise the secondary core can not get correct entry to start from.
> 
> Signed-off-by: Bai Yingjie <byj.tea@gmail.com>
> ---
>  arch/powerpc/platforms/85xx/smp.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Acked-by: Scott Wood <oss@buserror.net>

-Scott


