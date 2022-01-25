Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E3049BF3C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 00:00:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jk2PK3zMqz3cWV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jan 2022 10:00:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ebb.org
 (client-ip=50.56.179.12; helo=protestant.ebb.org; envelope-from=bkuhn@ebb.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 531 seconds by postgrey-1.36 at boromir;
 Wed, 26 Jan 2022 00:59:10 AEDT
Received: from protestant.ebb.org (protestant.ebb.org [50.56.179.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjpPB456Zz2xBq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 00:59:10 +1100 (AEDT)
Received: from localhost (unknown [216.161.86.19])
 (Authenticated sender: bkuhn)
 by protestant.ebb.org (Postfix) with ESMTPSA id CC12F820C4;
 Tue, 25 Jan 2022 05:50:13 -0800 (PST)
Date: Tue, 25 Jan 2022 05:47:39 -0800
From: "Bradley M. Kuhn" <bkuhn@ebb.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc: Add missing SPDX license identifiers
Message-ID: <Ye//e3q46n57x/1l@ebb.org>
References: <d2c52284244d6dcb3472d2041abe43b456d116df.1642762977.git.christophe.leroy@csgroup.eu>
 <YerEuE6XlslE3Goo@kroah.com>
 <24829c2f-6855-c8d6-7ae4-17c5517f890d@csgroup.eu>
 <YerO8MjbXlvbMEsZ@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YerO8MjbXlvbMEsZ@kroah.com>
X-Mailman-Approved-At: Wed, 26 Jan 2022 09:58:59 +1100
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
Cc: "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On Fri, Jan 21, 2022 at 03:13:50PM +0000, Christophe Leroy wrote:
> > Isn't it what GPL-2.0+ means ?

Greg Kroah-Hartman wrote:
> Yes, but look further down, as I point out below...
>
> > >> 	include/asm/epapr_hcalls.h:/* SPDX-License-Identifier: GPL-2.0+ OR BSD */
> > >> 	include/asm/fsl_hcalls.h:/* SPDX-License-Identifier: GPL-2.0+ OR BSD */
> > >> 	include/asm/ibmebus.h:/* SPDX-License-Identifier: GPL-2.0 OR OpenIB BSD */
> > >> 	include/asm/sfp-machine.h:/* SPDX-License-Identifier: LGPL-2.0+ */
> > >> 	kvm/mpic.c:// SPDX-License-Identifier: GPL-2.0
> > >> 	lib/crtsavres.S:/* SPDX-License-Identifier: GPL-2.0+ */
> > >> 	mm/book3s64/hash_4k.c:// SPDX-License-Identifier: LGPL-2.0
> > >> 	mm/book3s64/hash_64k.c:// SPDX-License-Identifier: LGPL-2.0
> > >> 	mm/book3s64/hash_hugepage.c:// SPDX-License-Identifier: LGPL-2.1
> > >> 	platforms/pseries/ibmebus.c:// SPDX-License-Identifier: GPL-2.0 OR OpenIB BSD
> > >> 	tools/head_check.sh:# SPDX-License-Identifier: GPL-2.0+
> > >> 	xmon/ppc.h:/* SPDX-License-Identifier: GPL-1.0+ */

If you're combining GPLv2-or-later works with LGPLv2.0/2.1 works, you'll have
to normalize to some GPLv2-based license (such as GPLv2-or-later), since
LGPLv2.1 requires that for combinations.  You won't be able to carry along
the "OR 3-Clause-BSD" part once the combination is made.  Similarly true with
GPLv2-or-later, but LGPL is the interesting one because it's explicit about
the need to change license notices to GPL notices when you combine.

 -- bkuhn
