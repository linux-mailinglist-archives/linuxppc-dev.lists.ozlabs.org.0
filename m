Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE4F4C3C89
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 04:43:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4bGB3JMhz3bck
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 14:43:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=DUYSouvn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=DUYSouvn; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4bFY6nK8z2yfm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 14:42:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7485361694;
 Fri, 25 Feb 2022 03:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961F2C340E9;
 Fri, 25 Feb 2022 03:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1645760557;
 bh=JZCoydRhQbd5ynjiTJUqKGhOB0u3EUOlJHTgG/64KGw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DUYSouvn1MTAZzvJbIBSXzipqyMXDfgrastK5SzAL2ZPAHKJzlCUmLdzYTQPIIHAB
 rmEXYi3pyTjPumH7Ghl5N6Qm0x5w3MALJ70CsMxWWg2HSyOu0KuZXVrwkBkqYpYebs
 SQ9AE4coybrHUNP/Mhi98KseHyKn+Tf0oEx2eBDA=
Date: Thu, 24 Feb 2022 19:42:36 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] selftest/vm: Add util.h and and move helper
 functions there
Message-Id: <20220224194236.ce6b6c3576c254d751d9814a@linux-foundation.org>
In-Reply-To: <20220217083537.374160-1-aneesh.kumar@linux.ibm.com>
References: <20220217083537.374160-1-aneesh.kumar@linux.ibm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-mm@kvack.org, Shuah Khan <shuah@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Feb 2022 14:05:36 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> Avoid code duplication by adding util.h. No functional change
> in this patch.

Sorry, but changes in linux-next have messed this patch up a bit more
than I'm prepared to fix.  Could you please redo these two against
linux-next after it has settled down a little?  Next week would be
good, thanks.


