Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B2E6FED62
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 10:01:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QH49X2d0Bz3fLN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 18:01:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=danny.cz (client-ip=37.157.195.192; helo=redcrew.org; envelope-from=dan@danny.cz; receiver=<UNKNOWN>)
X-Greylist: delayed 312 seconds by postgrey-1.36 at boromir; Thu, 11 May 2023 18:01:19 AEST
Received: from redcrew.org (redcrew.org [37.157.195.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QH48v4j8Tz3bgT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 18:01:19 +1000 (AEST)
Received: from server.danny.cz (85-71-161-19.rce.o2.cz [85.71.161.19])
	by redcrew.org (Postfix) with ESMTP id C453E4130;
	Thu, 11 May 2023 09:55:59 +0200 (CEST)
Received: from talos.danny.cz (unknown [IPv6:2001:470:5c11:160:47df:83f6:718e:218])
	by server.danny.cz (Postfix) with SMTP id 6C06611AAAB;
	Thu, 11 May 2023 09:55:58 +0200 (CEST)
Date: Thu, 11 May 2023 09:55:58 +0200
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: linuxppc-dev@lists.ozlabs.org
Subject: a possible issue with radix MMU on P9
Message-Id: <20230511095558.56663a50f86bdc4cd97700b7@danny.cz>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; powerpc64le-redhat-linux-gnu)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

we have been struggling with an issue in the bdwgc project (garbage
collector) on P9 systems for a while [1]. There were some test failing
on P9, but not on P8 or other platforms (x86, s390x, aarch64). Recently
the upstream developer has found out there is likely a problem in the
kernel memory mgmt [2], there is a reproduction scenario included. I
have rechecked the original code on P9 with hash MMU and it worked. Thus
I believe there is a problem in the radix MMU code on Power, where it
behaves differently. My testing was using Fedora, which means recent
kernels up to 6.4-rc1.

[1] https://github.com/ivmai/bdwgc/issues/479
[2] https://github.com/ivmai/bdwgc/issues/479#issuecomment-1535274481


	Thanks,

		Dan
