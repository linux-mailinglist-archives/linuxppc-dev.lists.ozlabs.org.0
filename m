Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFD154E2AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 15:58:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP3gB0Xtpz3brl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 23:58:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=nGXEooab;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=nGXEooab;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP3fY0Pcsz3bhq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 23:58:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C8HUoWbkEZfFi5Ww+b/aIrWTUO0EXGNVkEGEo9LVJjo=; b=nGXEooabTbb0KLw5oHlgpsPeqx
	fPen/6rTxyKZGwJnQ0odoQUTMevOda2oR5cGjcV/WHjZ2cU/vnLk0Pu4ebiiZ0/Ypknuk2hdNVhNt
	igkit05wkwuyzfIBeeldUwXMzhFeoXk+gvHB8+U8bRfoct1HrVD6NsZXWHypy2pT3ShcPi2rKvDFP
	+xaiMXmZLXwOGyuqCH41y1mL7M+6bqy79sCWKcEXWtd04gnqfqu5QiXy2TV2w/F/6yAmVzvJXqml1
	SMjsMCswQo9c2WHhlfjZwM3EC8d0zQ7scoomQ8TU2hFZPpJuXXrmbLvLsEbbV9kmJKzs2Ghnekx2X
	zR+c3IGA==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1q0R-008QMy-3Z; Thu, 16 Jun 2022 13:57:55 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C474F300372;
	Thu, 16 Jun 2022 15:57:51 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id B17BF2029FD42; Thu, 16 Jun 2022 15:57:51 +0200 (CEST)
Date: Thu, 16 Jun 2022 15:57:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 4/4] objtool/powerpc: Add --mcount specific
 implementation
Message-ID: <Yqs235037JrOOhBA@hirez.programming.kicks-ass.net>
References: <20220523175548.922671-1-sv@linux.ibm.com>
 <20220523175548.922671-5-sv@linux.ibm.com>
 <6be5c941-07b0-64d5-7f36-fe5770fb5244@csgroup.eu>
 <59170f18-1356-1140-70e3-30cb627f00bc@linux.vnet.ibm.com>
 <578ec055-0d63-e579-0caa-ad57846b8995@csgroup.eu>
 <f1decbb7-b441-a241-469a-4ba118e08212@csgroup.eu>
 <c1e2cf35-2a8d-87e6-3a7e-7f144392db23@csgroup.eu>
 <1655386289.uh0k7sgl1r.naveen@linux.ibm.com>
 <30f3791c-0fdd-e635-4a85-ec457f990fae@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30f3791c-0fdd-e635-4a85-ec457f990fae@csgroup.eu>
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Sathvika Vasireddy <sv@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, Sathvika Vasireddy <sv@linux.ibm.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 16, 2022 at 01:40:34PM +0000, Christophe Leroy wrote:
> sizeof(u64) is always 8 by definition.
> 
> So if size is 8 we are working on a binary file for a 64 bits target, if 
> not it means we are working for a 32 bits target.

Cross-builds invalidate this I think. Best to look at something like:

  elf->ehdr.e_ident[EI_CLASS] == ELFCLASS32


