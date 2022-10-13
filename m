Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFC65FD882
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 13:40:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mp6yC44QJz3drg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 22:40:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=strlen.de (client-ip=2a0a:51c0:0:12e:520::1; helo=chamillionaire.breakpoint.cc; envelope-from=fw@strlen.de; receiver=<UNKNOWN>)
X-Greylist: delayed 2560 seconds by postgrey-1.36 at boromir; Thu, 13 Oct 2022 21:59:35 AEDT
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [IPv6:2a0a:51c0:0:12e:520::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mp63W6XhQz2xtF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 21:59:35 +1100 (AEDT)
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1oivGV-00028B-QF; Thu, 13 Oct 2022 12:16:35 +0200
Date: Thu, 13 Oct 2022 12:16:35 +0200
From: Florian Westphal <fw@strlen.de>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Subject: Re: [PATCH v6 5/7] treewide: use get_random_u32() when possible
Message-ID: <20221013101635.GB11818@breakpoint.cc>
References: <20221010230613.1076905-1-Jason@zx2c4.com>
 <20221010230613.1076905-6-Jason@zx2c4.com>
 <3026360.ZldQQBzMgz@eto.sf-tec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3026360.ZldQQBzMgz@eto.sf-tec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 13 Oct 2022 22:37:49 +1100
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
Cc: linux-wireless@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-nvme@lists.infradead.org, patches@lists.linux.dev, linux-mm@kvack.org, linux-mtd@lists.infradead.org, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, linux-rdma@vger.kernel.org, x86@kernel.org, kasan-dev@googlegroups.com, linux-mips@vger.kernel.org, linux-media@vger.kernel.org, linux-um@lists.infradead.org, linux-block@vger.kernel.org, Thomas Graf <tgraf@suug.ch>, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rolf Eike Beer <eike-kernel@sf-tec.de> wrote:
> Florian, can you comment and maybe fix it?

Can't comment, do not remember -- this was 5 years ago.

> Or you wanted to move the variable before the loop and keep the random state
> between the loops and only reseed when all '1' bits have been consumed.

Probably.  No clue, best to NOT change it to not block Jasons series and
then just simplify this and remove all the useless shifts.
