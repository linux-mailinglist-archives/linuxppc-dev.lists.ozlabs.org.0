Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD89871258
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 02:30:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=WDC8yP5c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpdL65s0lz3dKG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 12:30:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=WDC8yP5c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.172; helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpdKQ14Csz30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 12:29:58 +1100 (AEDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4TpdKB23X2z9sqs;
	Tue,  5 Mar 2024 02:29:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1709602190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NDOh5rkhtbjwKF9cqx25v2bYJ27KT6ltJhBfsKoGY5Y=;
	b=WDC8yP5c0gswYcXpPIa05oWX3XS2L7EWrIEa+4IKgfE/f+n48DC5poD6d/oQYhJzBoJAlQ
	rnLjaRKc3cfXxLVNyonAB4bOq4mjyTxZmuGyuvsvWwelRAj1QgkxqUEiRgyf4hAKLa7/uI
	nhXSUMRUGaDORicH2SX94nHXzU0m3S+NyFtfEbNVE8cJaR3w0zWJOp6649LtBCs+2fUgoO
	bHtTy4j5++WoKTzyjFlz1jMqIzrdQy3xpigPdMQd6807LeJ9oP8ooS6aAOUZuaq6l0qmUO
	UIErJy6Xk8XhG/WVxoRPKksDr9FBDvmQxkFHJ/bqh/KhpqyrmFmFyXYBCpno2A==
Date: Tue, 5 Mar 2024 02:29:41 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: BUG: Bad page map in process init pte:c0ab684c pmd:01182000 (on
 a PowerMac G4 DP)
Message-ID: <20240305022941.356139ba@yea>
In-Reply-To: <707f617f-45c8-4fa1-83aa-779f2b542871@csgroup.eu>
References: <20221130224402.15c0cf8b@yea>
	<COZK2W38W2NA.27P9YGDJYUOBO@bobo>
	<20240229020941.2b30abe0@yea>
	<707f617f-45c8-4fa1-83aa-779f2b542871@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: a6c62d67654acccb744
X-MBO-RS-META: tmdf7i516d3349gr8cjkjxtycpu9gx7r
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Feb 2024 17:11:28 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Interesting.
> 
> I guess 0xe0000000 is where linear RAM starts to be mapped with pages ? 
> Can you confirm with a dump of 
> /sys/kernel/debug/powerpc/block_address_translation ?

 # cat /sys/kernel/debug/powerpc/block_address_translation
---[ Instruction Block Address Translation ]---
0: 0xc0000000-0xc0ffffff 0x00000000        16M Kernel   x     m   
1: 0xc1000000-0xc13fffff 0x01000000         4M Kernel   x     m   
2: 0xc1400000-0xc15fffff 0x01400000         2M Kernel   x     m   
3: 0xc1600000-0xc16fffff 0x01600000         1M Kernel   x     m   
4:         -
5:         -
6:         -
7:         -

---[ Data Block Address Translation ]---
0: 0xc0000000-0xc0ffffff 0x00000000        16M Kernel r       m   
1: 0xc1000000-0xc17fffff 0x01000000         8M Kernel r       m   
2: 0xc1800000-0xc1bfffff 0x01800000         4M Kernel r       m   
3: 0xf8000000-0xfbffffff 0x7c000000        64M Kernel rw      m   
4: 0xfc000000-0xfdffffff 0x7a000000        32M Kernel rw      m   
5:         -
6:         -
7:         -

block_address_translation looks different after the page corruption:

 # cat /sys/kernel/debug/powerpc/block_address_translation
---[ Instruction Block Address Translation ]---
0: 0xc0000000-0xc1ffffff 0x00000000        32M Kernel   x     m   
1:         -
2:         -
3:         -
4:         -
5:         -
6:         -
7:         -

---[ Data Block Address Translation ]---
0: 0xc0000000-0xc0ffffff 0x00000000        16M Kernel rw      m   
1: 0xc1000000-0xc17fffff 0x01000000         8M Kernel rw      m   
2: 0xc1800000-0xc1bfffff 0x01800000         4M Kernel rw      m   
3: 0xf8000000-0xfbffffff 0x7c000000        64M Kernel rw      m   
4: 0xfc000000-0xfdffffff 0x7a000000        32M Kernel rw      m   
5:         -
6:         -
7:         -

> Do we have a problem of race with hash table ?
> 
> Would KCSAN help with that ?

KCSAN did not report any hits during "stress -m 2 --vm-bytes 965M". Options used: KCSAN_SELFTEST=y, KCSAN_REPORT_ONCE_IN_MS=12000, KCSAN_REPORT_RACE_UNKNOWN_ORIGIN=y, KCSAN_STRICT=y, KCSAN_WEAK_MEMORY=y.

Regards,
Erhard
