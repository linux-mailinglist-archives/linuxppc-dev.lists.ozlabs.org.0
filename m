Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EBD1ED09C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 15:16:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cTtn3SvPzDqXN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 23:16:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=jroedel@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cTrF47VfzDqHK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 23:13:49 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 62077AF95;
 Wed,  3 Jun 2020 12:58:32 +0000 (UTC)
Date: Wed, 3 Jun 2020 14:58:26 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Subject: Re: [mainline][Oops][bisected 2ba3e6 ] 5.7.0 boot fails with kernel
 panic on powerpc
Message-ID: <20200603125826.GK6857@suse.de>
References: <1591181457.9020.13.camel@abdul>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1591181457.9020.13.camel@abdul>
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
Cc: sachinp <sachinp@linux.vnet.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 manvanth <manvanth@linux.vnet.ibm.com>,
 linux-next <linux-next@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>, akpm@linux-foundation.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hch <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hi Abdul,

On Wed, Jun 03, 2020 at 04:20:57PM +0530, Abdul Haleem wrote:
> Greeting's
> 
> Today's mainline kernel panics when booting on my powerpc lpar

Thanks for the report, I am looking into it with my limited powerpc
knowledge. But I have an idea and will send you something to test later
today.

Thanks,

	Joerg

