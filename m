Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAC55A9FD0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 21:23:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJWCh4BhZz303t
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 05:22:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=HHrdNv6A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=HHrdNv6A;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJWC61jqrz2xGt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 05:22:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vymNTjSXwJnNsXJPg+cP79HIcPwkreZQDqVTNDdjveI=; b=HHrdNv6AMAl5SlNNAOe09sQ+cL
	SHuLWSoy1IK2Gd2FLQLKRF8RHZZrcmHzMKSNOM5G3V4wqbE1ZJ1zKYUeTsV0pNqfSiPRxeEhpAmgi
	xXZKiD3aKghMlXekpEOuAx3O6tyVPPBL6bo+iCRHknw1RKwl7lpRsKQHT+R8v1sPNKLeQYaIt2juE
	C1KJNETkkUzM92pIvIj4zvMNzC48RBIcjjAGTAFmaBa3t2mBqHqgZK39Ps7b6PFoaWj3eDYTNAJTO
	q7jWQQK80RuU86vWqg3jIPDEuyrDNVvchb2yGpKku+ZxFJPeDNbluJZD5GhpLwBzUk/JJv/efUxsn
	isAcz+Gg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTpla-006IUK-KN; Thu, 01 Sep 2022 19:22:18 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 12C4230010B;
	Thu,  1 Sep 2022 21:22:17 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0348A2B8D5A27; Thu,  1 Sep 2022 21:22:17 +0200 (CEST)
Date: Thu, 1 Sep 2022 21:22:16 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH v2 09/16] objtool: Use target file endianness instead of
 a compiled constant
Message-ID: <YxEGaOAasQLMUcBN@hirez.programming.kicks-ass.net>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-10-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829055223.24767-10-sv@linux.ibm.com>
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

On Mon, Aug 29, 2022 at 11:22:16AM +0530, Sathvika Vasireddy wrote:
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Some architectures like powerpc support both endianness, it's
> therefore not possible to fix the endianness via arch/endianness.h
> because there is no easy way to get the target endianness at
> build time.
> 
> Use the endianness recorded in the file objtool is working on.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
