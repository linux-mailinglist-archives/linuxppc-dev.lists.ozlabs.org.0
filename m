Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C87F15653FE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:45:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3rZ4mxxz3gmw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:45:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DL5O9fjn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=DL5O9fjn;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3qR5mJ0z3gf6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:44:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XiB+m1tbZAMLJR0lpeEa1msl+Okwne9w6qdT+sTSXdI=; b=DL5O9fjnqjIlwKjHOj4LvSCbSv
	xg8Lk9q384dEivTYB93x6oCtZQM4qWhzjen7a88iTwvDjLzTKHiXHm1vcPKemPWv6UiFQGKdnlOnj
	gN5S1hAXoYRPwhZkBcrNz9wu+QhAvm4VbhqRB7mfSoiQfSRj+0ftuwUv8nzIRv46TWcLKwqmgJy4Q
	aNAGRWcxIZYAayFoSvey9CQxEvs53pIrOCtTzbaiXIlGVziUUK+3uVUFSwUSfFi+TaQpWABHtiyr1
	+7ucvluEhfmBqShzjEfz8UIXW3c5TlbVuCvdZuIPsFTcpTkd6DGkitpxqGMrAGFliw4dW6VfMRGm1
	eZ+LRikw==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KU1-00H70w-Uh; Mon, 04 Jul 2022 11:43:18 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DE2D830003A;
	Mon,  4 Jul 2022 13:43:15 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id C4F632028F029; Mon,  4 Jul 2022 13:43:15 +0200 (CEST)
Date: Mon, 4 Jul 2022 13:43:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
Message-ID: <YsLSU6idNME/BtwH@hirez.programming.kicks-ass.net>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-12-sv@linux.ibm.com>
 <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
 <92eae2ef-f9b6-019a-5a8e-728cdd9bbbc0@linux.vnet.ibm.com>
 <cce19b1c-449a-f306-533a-9edc855049aa@csgroup.eu>
 <1656572413.pbaqjnrrcl.naveen@linux.ibm.com>
 <da86c612-186d-364f-cc36-bcf942a97083@csgroup.eu>
 <1656583960.0nqsj977sr.naveen@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1656583960.0nqsj977sr.naveen@linux.ibm.com>
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
Cc: Marc Zyngier <maz@kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, Sathvika Vasireddy <sv@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chen Zhongjin <chenzhongjin@huawei.com>, "mingo@redhat.com" <mingo@redhat.com>, Sathvika Vasireddy <sv@linux.ibm.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 30, 2022 at 04:07:47PM +0530, Naveen N. Rao wrote:

> Objtool classifies 'ud2' as INSN_BUG, and 'int3' as INSN_TRAP. In x86 BUG(),

Yes, ud2 is the traditional 'kill' instruction and a number of emulators
treat it as such, however it also being the shortest encoding (2 bytes)
for #UD Linux has opted to (ab)use it to implement WARN/BUG.

As such interpretation of 'ud2' needs to assume control flow stops
(compiler will also emit ud2 in a number of cases with that intent).
However, if it's used as WARN we then need to annotate the thing to not
be terminal.

> there is no need for an annotation since objtool assumes that 'ud2'
> terminates control flow. But, for __WARN_FLAGS(), since 'ud2' is used, an
> explicit annotate_reachable() is needed. That's _reachable_, to indicate
> that the control flow can continue with the next instruction.
> 
> On powerpc, we should (eventually) classify all trap variants as INSN_TRAP.

Careful.. INSN_TRAP is mostly used for purposes of speculation stop and
padding. That is, INSN_TRAP does indeed not affect control flow, but the
way objtool treats it might not be quite what you want.

Specifically, straight-line-speculation checks want INT3 after indirect
control transfers (indirect jump and return -- indirect call is
'difficult'); these locations are architecturally not executed and as
such placing a random trap instruction there is 'harmless'. Of course,
were the branch predictor to go wobbly and attempt to execute it, the
fact that it's a trap will stop speculation dead.

Additionally, int3, being a single byte instruction, is also used to
fill dead code space, any #BP trap on it will not have a descriptor and
mostly cause the kernel to go splat.

Per the last usage, validate_reachable_instructions() will ignore it.
I'm not sure you want to always ignore all your (unreachable) trap
instructions.
