Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7089C5A9FF3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 21:29:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJWLj1kj6z3bZ2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 05:29:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fcgpRgFE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fcgpRgFE;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJWL63MMVz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 05:28:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DVqvYmW8GcL7wXAJ/UsUeOny/43FV7uLCqc3mx9G/g4=; b=fcgpRgFENgCiZXhWtjPlxmfzAx
	8DT9AJql7ya0UIHLRlSd+ep4qitdoi81b+aU3AaUWcpjYG63aravYTPYGfYYg1z3izXoUEH4k6gt4
	FKWa4sVl1S6+qvgCCGvF/2ZbJrNKn0Wnl6RjgzCnwoXsEMVkPBMtk1zq7vwkjWYGPk2VDtWL70feI
	3hoGdn0wqBnw435OAqesICkPK40EcsCiqV36hQqflN+9rVXg/9Gwoqh1PkfTyP8UDJML7rsm0pfS5
	ql5MSbUGjpV5/WwUYSR5TOGpVRMc+p+pDlpTyG0GSRaUPcpnyvPDA0xc//QzGnv4uFBTiStiElGGE
	mL55im9g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTprR-006Ike-Mj; Thu, 01 Sep 2022 19:28:21 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0D5D230010B;
	Thu,  1 Sep 2022 21:28:20 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id E9ABF2B8D5A28; Thu,  1 Sep 2022 21:28:19 +0200 (CEST)
Date: Thu, 1 Sep 2022 21:28:19 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH v2 13/16] objtool: Use macros to define arch specific
 reloc types
Message-ID: <YxEH05wtANcr9g83@hirez.programming.kicks-ass.net>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-14-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829055223.24767-14-sv@linux.ibm.com>
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
Cc: aik@ozlabs.ru, chenzhongjin@huawei.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, mingo@redhat.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 29, 2022 at 11:22:20AM +0530, Sathvika Vasireddy wrote:
> Make relocation types architecture specific.
> 
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
