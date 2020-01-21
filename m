Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 398DA143586
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 03:02:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481sHG1P1rzDqfs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 13:02:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.31; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
X-Greylist: delayed 449 seconds by postgrey-1.36 at bilbo;
 Tue, 21 Jan 2020 13:00:52 AEDT
Received: from smtprelay.hostedemail.com (smtprelay0031.hostedemail.com
 [216.40.44.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481sFc5k14zDqW4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 13:00:50 +1100 (AEDT)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 10B091800864F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 01:53:30 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id 68169180A68AC;
 Tue, 21 Jan 2020 01:53:17 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::,
 RULES_HIT:41:355:379:599:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3351:3622:3865:3867:3874:4250:4321:5007:6119:6997:9592:10004:10400:10848:11026:11232:11657:11658:11914:12043:12048:12296:12297:12438:12555:12740:12760:12895:13069:13311:13357:13439:14096:14097:14659:14721:21080:21451:21627:30054:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: shake46_56b5e3c028834
X-Filterd-Recvd-Size: 1824
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Tue, 21 Jan 2020 01:53:15 +0000 (UTC)
Message-ID: <618f58cd46f0e4fd619cb2ee3c76665a28e30f4e.camel@perches.com>
Subject: Re: [PATCH -next] powerpc/maple: fix comparing pointer to 0
From: Joe Perches <joe@perches.com>
To: Chen Zhou <chenzhou10@huawei.com>, benh@kernel.crashing.org, 
 paulus@samba.org, mpe@ellerman.id.au
Date: Mon, 20 Jan 2020 17:52:15 -0800
In-Reply-To: <20200121013153.9937-1-chenzhou10@huawei.com>
References: <20200121013153.9937-1-chenzhou10@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 nivedita@alum.mit.edu, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org,
 allison@lohutok.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2020-01-21 at 09:31 +0800, Chen Zhou wrote:
> Fixes coccicheck warning:
> ./arch/powerpc/platforms/maple/setup.c:232:15-16:
> 	WARNING comparing pointer to 0

Does anyone have or use these powerpc maple boards anymore?

Maybe the whole codebase should just be deleted instead.

If not, setup.c has an unused DBG macro that could be removed too.
---
 arch/powerpc/platforms/maple/setup.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/platforms/maple/setup.c b/arch/powerpc/platforms/maple/setup.c
index 47f7310..d6a083c 100644
--- a/arch/powerpc/platforms/maple/setup.c
+++ b/arch/powerpc/platforms/maple/setup.c
@@ -57,12 +57,6 @@
 
 #include "maple.h"
 
-#ifdef DEBUG
-#define DBG(fmt...) udbg_printf(fmt)
-#else
-#define DBG(fmt...)
-#endif
-
 static unsigned long maple_find_nvram_base(void)
 {
 	struct device_node *rtcs;


