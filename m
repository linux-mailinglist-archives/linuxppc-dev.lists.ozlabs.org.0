Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A38EC732
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 18:03:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474T6r4QNMzF6xQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 04:03:48 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 474T4P4kTtzF3pN
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2019 04:01:39 +1100 (AEDT)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1iQaGe-0005Iv-Bg; Fri, 01 Nov 2019 11:59:20 -0500
Message-ID: <cecd8cd067fe71f7de7db9e912f10244a44f530b.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Qiang Zhao <qiang.zhao@nxp.com>, Li Yang
 <leoyang.li@nxp.com>
Date: Fri, 01 Nov 2019 11:59:19 -0500
In-Reply-To: <5071118d-2008-7725-a6cd-ce14b49dfa20@c-s.fr>
References: <20191018125234.21825-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-1-linux@rasmusvillemoes.dk>
 <20191101124210.14510-27-linux@rasmusvillemoes.dk>
 <5071118d-2008-7725-a6cd-ce14b49dfa20@c-s.fr>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: christophe.leroy@c-s.fr, linux@rasmusvillemoes.dk,
 qiang.zhao@nxp.com, leoyang.li@nxp.com, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
Subject: Re: [PATCH v3 26/36] soc: fsl: move cpm.h from powerpc/include/asm
 to include/soc/fsl
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-11-01 at 17:18 +0100, Christophe Leroy wrote:
> 
> Le 01/11/2019 à 13:42, Rasmus Villemoes a écrit :
> > Some drivers, e.g. ucc_uart, need definitions from cpm.h. In order to
> > allow building those drivers for non-ppc based SOCs, move the header
> > to include/soc/fsl. For now, leave a trivial wrapper at the old
> > location so drivers can be updated one by one.
> 
> I'm not sure that's the correct way to go.
> 
> As far as I know, CPM is specific to powerpc (or maybe common to some 
> motorola 68000). So only powerpc specific drivers should need it.
> 
> If cpm.h includes items that are needed for QE, those items should go in 
> another .h
> 
> Of course, it doesn't mean we can't move cpm.h in include/soc/fsl, but 
> anyway only platforms having CPM1 or CPM2 should include it.

QE is basically CPM3 so it's not surprising that cpm.h would be needed.  I
wonder how much less unnecessary code duplication there would have been if
marketing hadn't decided to change the name.

-Scott


