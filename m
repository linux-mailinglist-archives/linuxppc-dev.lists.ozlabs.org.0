Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F578A2A5D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 11:08:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tpn41BkW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VG9jG4wb8z3vdW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 19:08:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Tpn41BkW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=mingo.kernel.org@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VG9hY39bpz3dnN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 19:08:11 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a46a7208eedso89413566b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 02:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712912885; x=1713517685; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPUGnUPFGvIHpfCf2GVNK2vLyHGdD2DrkaoFCTmwcrI=;
        b=Tpn41BkWlIBgZsxdT1jzA8NjR8hg4Tik7h8IpprIMfzP2MxetxGO93VK+fxRuZU8AZ
         GSWHHtGtXgzWizQQ8ZngRLtDskyFjV7ber1Z0V078ibPg9vYpZyex3JppIVjEk/6Zn09
         DaEpZYGXVaUYo7GQEjziShRkLryR+Xc6MFkV1+dl4i5hhY7a7aAKIZFghaRNH+Ft9Oe9
         HX1YbBnRoimmeM3gsF4ZuSASat/21SBa+ryftLZspxg/Le419TTuHh2CqGkcl6uQ1z2N
         O1Do/xrHSh5k+DhathD1lo3SZ1lK7JxeMFMtpVA7PjkXrH9k/EJgI5JtqjSIlGj5QKlN
         IOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712912885; x=1713517685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPUGnUPFGvIHpfCf2GVNK2vLyHGdD2DrkaoFCTmwcrI=;
        b=PFaAZOzNRPWQ42Wuf+DR5UYUuT0S2P+dkp8l25p712crP8cNew7w9f8qOmm9aRh+oZ
         rHE25B76RYjoS956eiWcY1Vx5NG9rdLQJWscp8L2ynQvfD8FPnM3tjUPKdFkpWJVcEq3
         lo2+M3+a/wkBBmN/IRKPafMRZNaZwUw7mWDMafX/HZh8ESXD1xfNpZGWaa6/92MyXEHH
         z9HIL6DrnyRyCBGBua37uDsVOqnDBaMcg/l9x3ZDi4RRlC0ocDMathMjVCbyoXz4Pzb3
         XDO+cTL1ezNzqpOPy5v7f7PFP+EliJxb7N3xLnQlaG0oUdoHyoCmAelu6m1JHnMbIMcb
         Tlbg==
X-Forwarded-Encrypted: i=1; AJvYcCXOyuoiJH8kNeKxjHCMO4DMS3FnlhUtKpihn9CnW4vibfIq8FbJs6tWXGmZofFRXKe0ZrSsyjBicPRV0O4mlyvpNkBu+p956qy59zKr/g==
X-Gm-Message-State: AOJu0YzEVreoo4IekuGj164J1UHonF7sN8sBolwflzvsDXi9e8sXx45c
	oTRdiFc27uQiK2W4TRngNrc0pyZl+40Y846UuMjis70IVL58fyI9
X-Google-Smtp-Source: AGHT+IE1JXTG/LcQoI+lnHKGTMryNiPMKyUlJP80kVd4eHhaWi8p2N8JmnjvJqW2HLQ210FFl8qPZA==
X-Received: by 2002:a17:906:345a:b0:a51:80d9:56de with SMTP id d26-20020a170906345a00b00a5180d956demr1236428ejb.5.1712912884326;
        Fri, 12 Apr 2024 02:08:04 -0700 (PDT)
Received: from gmail.com (1F2EF1A5.nat.pool.telekom.hu. [31.46.241.165])
        by smtp.gmail.com with ESMTPSA id zg22-20020a170907249600b00a51b18a77b2sm1572994ejb.180.2024.04.12.02.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 02:08:03 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:08:00 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [RFC PATCH 5/7] x86/module: perpare module loading for ROX
 allocations of text
Message-ID: <Zhj58NVS/iQnPeIq@gmail.com>
References: <20240411160526.2093408-1-rppt@kernel.org>
 <20240411160526.2093408-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240411160526.2093408-6-rppt@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@infradead.org>, linux-trace-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Steven Rostedt <rostedt@goodmis.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
  linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Mike Rapoport <rppt@kernel.org> wrote:

>  	for (s = start; s < end; s++) {
>  		void *addr = (void *)s + *s;
> +		void *wr_addr = addr + module_writable_offset(mod, addr);

So instead of repeating this pattern in a dozen of places, why not use a 
simpler method:

		void *wr_addr = module_writable_address(mod, addr);

or so, since we have to pass 'addr' to the module code anyway.

The text patching code is pretty complex already.

Thanks,

	Ingo
