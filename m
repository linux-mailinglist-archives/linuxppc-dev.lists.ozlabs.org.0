Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D642405BA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 14:21:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQFSS6tfqzDqQn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 22:21:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQFPd3xYGzDqH2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 22:19:01 +1000 (AEST)
Received: from gaia (unknown [95.146.230.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C06D820709;
 Mon, 10 Aug 2020 12:18:57 +0000 (UTC)
Date: Mon, 10 Aug 2020 13:18:55 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Gregory Herrero <gregory.herrero@oracle.com>
Subject: Re: [PATCH] recordmcount: Fix build failure on non arm64
Message-ID: <20200810121855.GD9480@gaia>
References: <5ca1be21fa6ebf73203b45fd9aadd2bafb5e6b15.1597049145.git.christophe.leroy@csgroup.eu>
 <20200810091730.GA3099@ltoracle>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200810091730.GA3099@ltoracle>
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
Cc: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 10, 2020 at 11:17:30AM +0200, Gregory Herrero wrote:
> On Mon, Aug 10, 2020 at 08:48:22AM +0000, Christophe Leroy wrote:
> > Commit ea0eada45632 leads to the following build failure on powerpc:
> > 
> >   HOSTCC  scripts/recordmcount
> > scripts/recordmcount.c: In function 'arm64_is_fake_mcount':
> > scripts/recordmcount.c:440: error: 'R_AARCH64_CALL26' undeclared (first use in this function)
> > scripts/recordmcount.c:440: error: (Each undeclared identifier is reported only once
> > scripts/recordmcount.c:440: error: for each function it appears in.)
> > make[2]: *** [scripts/recordmcount] Error 1
> > 
> > Make sure R_AARCH64_CALL26 is always defined.
> > 
> Oops, thanks for fixing this.
> 
> Acked-by: Gregory Herrero <gregory.herrero@oracle.com>

Thanks. I'll queue it via the arm64 tree (as I did with the previous
fix) but I'll wait a bit for Steve to ack it.

-- 
Catalin
