Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F6378F301
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 21:02:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rc9Wt0WD0z3c9c
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 05:02:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nefkom.net (client-ip=212.18.0.10; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=lists.ozlabs.org)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rc9WL1xkSz2xjw
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 05:01:48 +1000 (AEST)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Rc9W85fh1z1sCHT;
	Thu, 31 Aug 2023 21:01:39 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4Rc9W73sV1z1qqlY;
	Thu, 31 Aug 2023 21:01:39 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id 3t2LcBBBC5P6; Thu, 31 Aug 2023 21:01:38 +0200 (CEST)
X-Auth-Info: lXkH32dCcJBd+12DFQPqBK2TsYUkx9qeK/d1QE75ehLNaJXCOJQ9jpTXTWJ0N5Py
Received: from igel.home (aftr-62-216-205-244.dynamic.mnet-online.de [62.216.205.244])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 31 Aug 2023 21:01:38 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 3B0CF2C1069; Thu, 31 Aug 2023 21:01:38 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] maple_tree: Disable mas_wr_append() when other
 readers are possible
In-Reply-To: <87y1hr22o1.fsf@mail.lhotse> (Michael Ellerman's message of "Thu,
	31 Aug 2023 15:37:02 +1000")
References: <20230819004356.1454718-1-Liam.Howlett@oracle.com>
	<20230819004356.1454718-2-Liam.Howlett@oracle.com>
	<87bkeotin8.fsf@igel.home> <87y1hr22o1.fsf@mail.lhotse>
X-Yow: Everything will be ALL RIGHT if we can just remember things about
 ALGEBRA.. or SOCCER..  or SOCIALISM..
Date: Thu, 31 Aug 2023 21:01:38 +0200
Message-ID: <87cyz3594d.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, maple-tree@lists.infradead.org, linux-mm@kvack.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Aug 31 2023, Michael Ellerman wrote:

> Andreas Schwab <schwab@linux-m68k.org> writes:
>> This breaks booting on ppc32:
>
> Does enabling CONFIG_DEBUG_ATOMIC_SLEEP fix the crash?

Yes, it does.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
