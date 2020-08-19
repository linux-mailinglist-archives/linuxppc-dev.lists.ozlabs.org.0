Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60442249711
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 09:24:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWfR758rHzDqt0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 17:24:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWfP81262zDqhD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 17:22:19 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 60E246736F; Wed, 19 Aug 2020 09:22:13 +0200 (CEST)
Date: Wed, 19 Aug 2020 09:22:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Al Viro <viro@zeniv.linux.org.uk>
Subject: iter and normal ops on /dev/zero & co, was Re: remove the last
 set_fs() in common code, and remove it for x86 and powerpc
Message-ID: <20200819072213.GA21832@lst.de>
References: <20200817073212.830069-1-hch@lst.de>
 <319d15b1-cb4a-a7b4-3082-12bb30eb5143@csgroup.eu>
 <20200818180555.GA29185@lst.de>
 <e3781661-2e13-4f46-d892-181907a2e768@csgroup.eu>
 <f2e31c89-dd9e-f0f8-ef5c-e930d01a3b65@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2e31c89-dd9e-f0f8-ef5c-e930d01a3b65@csgroup.eu>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linux-arch@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 19, 2020 at 09:16:59AM +0200, Christophe Leroy wrote:
> I made a test with only the first patch of your series: That's definitely 
> the culprit. With only that patch applies, the duration is 6.64 seconds, 
> that's a 25% degradation.

For the record: the first patch is:

     mem: remove duplicate ops for /dev/zero and /dev/null

So these micro-optimizations matter at least for some popular
benchmarks.  It would be easy to drop, but that means we either:

 - can't support kernel_read/write on these files, which should not
   matter

or
 
 - have to drop the check for both ops being present

Al, what do you think?
