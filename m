Return-Path: <linuxppc-dev+bounces-6411-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A509CA41F2E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 13:36:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1gFT6ktlz2ypP;
	Mon, 24 Feb 2025 23:35:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740400557;
	cv=none; b=iDxILF1mYKxWyhNplTnuS87uiZlz330I3HW0Lrun2laTUTVulM822ex9ocL6N+gG9PQshyQkBXNiyVMksK3SEccn7JmqapxAMCYKWOuBe1Pgiw7theVaLeORlo/diUKCqqr88TNVW/ThzjBCcJ2oDOVmhzKjfixCIEB9gSI9RZSuz9LipFl+1s4GaQG2ymljib0GCG53NVICgX8WGB0uNXaQySiIonsKsYgKh6+S5xiTRKkb6kkj3oS7iDkwy5HmHjY+GChxbMHRixK0I5eeNZkMZlE4HByrX6wbFu2ct6dIutgOj30A2u+A8nSlXzsgk1R1kcC3ZYlMK+2JHarnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740400557; c=relaxed/relaxed;
	bh=KjNIYWV63wd2ETJVPJjYoHVaRj09KcDEXGN6j/BKYZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUSW5lzr54p4qi/OT2nkzQBJzKwWgE1Hlc+96bSiOa+aRx8SiWbRPNv3sIe49D0Hn0ACJ21dfUCboOjWiEAaMKiURos1UerXbESh37Amxd2hIzDTWO9fVfESQtJrvlbg39f4ZRsWTvlgHtyK/PaeXC6kbgrUfgJ5K645AQnHgHBuxWaK3H1Cw97u1YDOX3wz6oqjmEcP//pbsYUZn+Ch4OzJ7M/GJOtXAo7oSEsnY5nuyfo08VKCgWQyBAvdo4zas9g0tzgz3E/Uox4uMAixixAqdum/o7e1DkFnWSwEFf/fWx5YOZD0WZ/JYKPQCCujQZiKUQgH19NyM+G4b8Whaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1gFL5ZBXz2yRM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 23:35:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KjNIYWV63wd2ETJVPJjYoHVaRj09KcDEXGN6j/BKYZs=; b=CiPkSzWklbhO7mPKl1Jriapzi/
	h9ZxgOOaJCqDCX7rY6o0B7nUEflSjApS0qhasUcWF4BOkhJEwhaYfuv99XToeUmJQw2+kR6W5WrhW
	OwHnhVNyz53GmSNgcjiXOMIlxaXMZ0jwdb4zAwnzMZ4zeug+JEniisIxMNgEmiqKuCkxUOCf72gjQ
	oTHbKpc43qi+xEsISsUdjmrcR0JdWeEOh3E9X9GVJYKXcwRew5f16ANwoYvi3KnMMjz5NxnyR5eZs
	Kaqfcp2voEqtm9ZcyMIA26TvS5hyeuZL36CiNSnC/JxZQm22QlYAxSDZQwcmduj7p2AXViJBxosAl
	/Ur+1niw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXgO-00000003Bsx-0elI;
	Mon, 24 Feb 2025 12:35:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B45A4300164; Mon, 24 Feb 2025 13:35:34 +0100 (CET)
Date: Mon, 24 Feb 2025 13:35:34 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, christophe.leroy@csgroup.eu,
	npiggin@gmail.com, maddy@linux.ibm.com,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: Re: [RFC PATCH] objtool: Skip unannotated intra-function call
 warning for bl+mflr pattern
Message-ID: <20250224123534.GB17456@noisy.programming.kicks-ass.net>
References: <20250219162014.10334-1-sv@linux.ibm.com>
 <20250220195940.ely2l2fpsozd2tuv@jpoimboe>
 <4bea75bc-d3f6-4972-b644-f9b5a4e8bb77@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bea75bc-d3f6-4972-b644-f9b5a4e8bb77@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 21, 2025 at 02:20:41PM +0530, Sathvika Vasireddy wrote:

> Also, just out of curiosity, how does x86 do it? Does it not use a branch to
> next instruction approach?

x86_64 can use LEA like:

  #define _THIS_IP_ ({ unsigned long __here; asm ("lea 0(%%rip), %0" : "=r" (__here)); __here; })

32bit needs to call a function, read the stack value and return.

