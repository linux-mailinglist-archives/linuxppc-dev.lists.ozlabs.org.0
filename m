Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F90565405
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:46:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3sy6FTYz3fR1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:46:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=mSbUiv1/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=mSbUiv1/;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3sM6F0Gz304x
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:45:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4HrRuXuVA+Twe3QAd56nGmntiiPmbvBTaKZ1l1jeChc=; b=mSbUiv1/DRUA3lQIT0bPc7zWbu
	hYIsn/1ueg4pM4xgnObmk/HNo4XDuGhlHlQoQ3FijYv1D9Wz9sF4JRv8sECoVcNbUoBrI2j5nNB16
	Nhx3So2SdSRT4PWxWEpL2hOZzyZNk22odC2seMX4jYd+jvOgH/c0vjC3LF/dt3DR3Xv/BfU5vsdqn
	TMjFNJjQueSZWfe9JcXAOWc4raiUkoEAM8TaUSzi204T5B/T7Et2DyFHWWuTHxZMZcg2Hs6xGrbWI
	BQDraL1c4hIdfIa2nXqgvznU58iRnhuL+MNmPW8cqFSOa/haIukRZJtioNqImk/hZRwFqOBq+njBw
	4VnrMlyg==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KW5-00HE6L-Ke; Mon, 04 Jul 2022 11:45:25 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D81D8300362;
	Mon,  4 Jul 2022 13:45:23 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id BE0B42028F029; Mon,  4 Jul 2022 13:45:23 +0200 (CEST)
Date: Mon, 4 Jul 2022 13:45:23 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
Message-ID: <YsLS02T6TAxN/HcL@hirez.programming.kicks-ass.net>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-12-sv@linux.ibm.com>
 <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
 <92eae2ef-f9b6-019a-5a8e-728cdd9bbbc0@linux.vnet.ibm.com>
 <cce19b1c-449a-f306-533a-9edc855049aa@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cce19b1c-449a-f306-533a-9edc855049aa@csgroup.eu>
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
Cc: Marc Zyngier <maz@kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, Sathvika Vasireddy <sv@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, Chen Zhongjin <chenzhongjin@huawei.com>, "mingo@redhat.com" <mingo@redhat.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 29, 2022 at 06:30:23PM +0000, Christophe Leroy wrote:


> The problem is that that function has size 0:
> 
> 00000000000003d0 l     F .text	0000000000000000 
> qdisc_root_sleeping_lock.part.0

I'm somewhat confused; how is an empty STT_FUNC a valid construct on
Power?
