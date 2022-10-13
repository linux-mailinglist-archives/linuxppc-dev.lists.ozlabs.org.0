Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 467775FCF2B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 02:06:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnqZD1J70z3drk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 11:06:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QL6/XY/v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QL6/XY/v;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnqYH53v1z2xmw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 11:05:55 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 04C2FB81629;
	Thu, 13 Oct 2022 00:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E58DC433D7;
	Thu, 13 Oct 2022 00:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665619550;
	bh=YvYXcOXGUUew1LRS4jWpVLBEaW0yYPl59TADZ8wHhu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QL6/XY/vt3YZNIKJ7oFIEcyv/LHaN15JwtPu1BCMEtJoUBgl21dbMwsqejhr//sBr
	 lGZpKNVQUrZXzfOzfdUQj+6CWryE2Sm66tIvFxEWhxGfxjjlxdCgpooEizULzSseIE
	 GgtqgfUcedUjaXqqmZQUWsMtscX36cyJTAKfCjmWrZX6rtiebFEr9peWkud+OaL9Xo
	 g/RkWYVHmUXeaSNEiItUR7gEsBqAlptimdALaTGCe7F9uoMNa50IlGt4kmpzu1xaas
	 va1HETefXg9goGMsDV9CSqTP5LZ2CiNyBCzszv2ezzkmIVZZlYVD/80PGI0GvqddRj
	 1KODv/8HS0lyw==
Date: Wed, 12 Oct 2022 17:05:48 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 00/16] objtool: Enable and implement --mcount option
 on powerpc
Message-ID: <20221013000548.d2m65fozzdvdsj5u@treble>
References: <20221002104240.1316480-1-sv@linux.ibm.com>
 <1665401892.qmrp2qjj9t.naveen@linux.ibm.com>
 <notmuch-sha1-66fb111b87471c685a53b80a0502d959f90d07a7>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <notmuch-sha1-66fb111b87471c685a53b80a0502d959f90d07a7>
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
Cc: aik@ozlabs.ru, chenzhongjin@huawei.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org, peterz@infradead.org, mingo@redhat.com, Sathvika Vasireddy <sv@linux.ibm.com>, npiggin@gmail.com, jpoimboe@redhat.com, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 11, 2022 at 01:20:02PM -0700, Josh Poimboeuf wrote:
> On Mon, Oct 10, 2022 at 05:19:02PM +0530, Naveen N. Rao wrote:
> > All the above changes are down to compiler optimizations and shuffling due
> > to CONFIG_OBJTOOL being enabled and changing annotate_unreachable().
> > 
> > As such, for this series:
> > Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> > Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> > 
> > 
> > Josh,
> > Are you ok if this series is taken in through the powerpc tree?
> 
> Yes, it looks ok to me.  Let me run it through a round of testing.

The testing looked good, so:

  Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh
