Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB67C28F0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 23:39:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hwl45T5czDqP8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 07:38:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nefkom.net
 (client-ip=212.18.0.9; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hwjB00qvzDqP8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 07:37:14 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 46hwj16YXVz1rKXK;
 Mon, 30 Sep 2019 23:37:09 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 46hwj16KCDz1qqkG;
 Mon, 30 Sep 2019 23:37:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id AfVAdqVBm4_l; Mon, 30 Sep 2019 23:37:09 +0200 (CEST)
X-Auth-Info: V88X9RbJqyfnMXiIV1Umxnh8BQvXEVojhbQpWJLr3DSK6eOdvt/TiIFCl0uXEG6f
Received: from igel.home (ppp-46-244-162-36.dynamic.mnet-online.de
 [46.244.162.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 30 Sep 2019 23:37:09 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 70E2C2C01AC; Mon, 30 Sep 2019 23:37:08 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/6] powerpc/64s/radix: tidy up TLB flushing code
References: <20190902152931.17840-1-npiggin@gmail.com>
 <20190902152931.17840-3-npiggin__24629.6128186927$1567438719$gmane$org@gmail.com>
X-Yow: Now I'm telling MISS PIGGY about MONEY MARKET FUNDS!
Date: Mon, 30 Sep 2019 23:37:08 +0200
In-Reply-To: <20190902152931.17840-3-npiggin__24629.6128186927$1567438719$gmane$org@gmail.com>
 (Nicholas Piggin's message of "Tue, 3 Sep 2019 01:29:27 +1000")
Message-ID: <87k19pqxdn.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

arch/powerpc/mm/book3s64/pgtable.c: In function ‘flush_partition’:
arch/powerpc/mm/book3s64/pgtable.c:216:3: error: implicit declaration of function ‘radix__flush_all_lpid_guest’ [-Werror=implicit-function-declaration]
   radix__flush_all_lpid_guest(lpid);
   ^
cc1: all warnings being treated as errors
make[4]: *** [arch/powerpc/mm/book3s64/pgtable.o] Error 1

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
