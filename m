Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6557C807FB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2019 21:06:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 461D6G6NyFzDqdc
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Aug 2019 05:06:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 461D3B1fVwzDqdj
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Aug 2019 05:04:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 461D3B0jwSz8shd
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Aug 2019 05:04:06 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 461D396Jmlz9sBF; Sun,  4 Aug 2019 05:04:05 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=informatik.wtf
 (client-ip=68.65.122.27; helo=mta-07-4.privateemail.com;
 envelope-from=cmr@informatik.wtf; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from MTA-07-4.privateemail.com (mta-07-4.privateemail.com
 [68.65.122.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 461D392cbVz9sMr
 for <linuxppc-dev@ozlabs.org>; Sun,  4 Aug 2019 05:04:05 +1000 (AEST)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 464C460046;
 Sat,  3 Aug 2019 15:04:03 -0400 (EDT)
Received: from APP-02 (unknown [10.20.147.152])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id 1D40A60045;
 Sat,  3 Aug 2019 19:04:03 +0000 (UTC)
Date: Sat, 3 Aug 2019 14:04:02 -0500 (CDT)
From: Christopher M Riedl <cmr@informatik.wtf>
To: Daniel Axtens <dja@axtens.net>, Andrew Donnellan <ajd@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, kernel-hardening@lists.openwall.com
Message-ID: <1642733335.91438.1564859043089@privateemail.com>
In-Reply-To: <87ef29gwa1.fsf@dja-thinkpad.axtens.net>
References: <20190524123816.1773-1-cmr@informatik.wtf>
 <81549d40-e477-6552-9a12-7200933279af@linux.ibm.com>
 <1146575236.484635.1559617524880@privateemail.com>
 <57844920-c17b-d93c-66c0-e6822af71929@linux.ibm.com>
 <87h88m2iu4.fsf@dja-thinkpad.axtens.net>
 <87ef29gwa1.fsf@dja-thinkpad.axtens.net>
Subject: Re: [RFC PATCH v2] powerpc/xmon: restrict when kernel is locked down
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev59
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: mjg59@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On July 29, 2019 at 2:00 AM Daniel Axtens <dja@axtens.net> wrote:
> 
> Would you be able to send a v2 with these changes? (that is, not purging
> breakpoints when entering integrity mode)
> 

Just sent out a v3 with that change among a few others and a rebase.

Thanks,
Chris R.
