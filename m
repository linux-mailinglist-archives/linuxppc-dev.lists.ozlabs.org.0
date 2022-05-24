Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE9A532FFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 20:01:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L727N0VZ0z3c8R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 04:01:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EjJTKKQY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L726c60tdz3bcv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 04:00:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=y3aUQdLDs72jwQMclOfWKd9fujycyfSnuRptoFLfjIA=; b=EjJTKKQYh9pdLcDTSbGVJTdCiC
 W+Ajh4wyDAp3O3Q7hPTKQBKK2ZQLtN9gwecWnygYCqRdrcg1gEvWGbP+QX7QqLEmd1Luv0pXbTKU9
 SVAky/DxDZQ2OsPscIJ/T5ketroO0TGNjCTmTvDs1Lv2jSsJ1VZBEVwtFlHtKKMEOGQosnqv7ustw
 +E3yUHk/e870X2w1fFYrsxDZC1jSAl0y71K8OD9ZiBtoUyajf7kVsLI3gYdtxbZro9a0MwRADRF6y
 ube6ghSWXHT5ADL+26tODlO0LfRvrRt0SoRVVRI8EO3QkXbsdP07R/TgolVSjx9jiad5ndsdQLJU/
 EnilShiQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntYp7-001OXR-Du; Tue, 24 May 2022 18:00:01 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DEC08300222;
 Tue, 24 May 2022 19:59:57 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A553E201A996B; Tue, 24 May 2022 19:59:57 +0200 (CEST)
Date: Tue, 24 May 2022 19:59:57 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v2 3/7] objtool: Use target file class size instead
 of a compiled constant
Message-ID: <Yo0dHcq7VYlt79nj@hirez.programming.kicks-ass.net>
References: <cover.1653398233.git.christophe.leroy@csgroup.eu>
 <c4b06b5b314183d85615765a5ce421a057674bd8.1653398233.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4b06b5b314183d85615765a5ce421a057674bd8.1653398233.git.christophe.leroy@csgroup.eu>
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
Cc: aik@ozlabs.ru, jpoimboe@redhat.com, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, sv@linux.ibm.com, Paul Mackerras <paulus@samba.org>,
 naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 24, 2022 at 03:17:43PM +0200, Christophe Leroy wrote:
> -	sec = elf_create_section(elf, relocname, 0, sizeof(GElf_Rela), 0);
> +	if (size == sizeof(u32))
> +		sec = elf_create_section(elf, relocname, 0, sizeof(Elf32_Rela), 0);
> +	else
> +		sec = elf_create_section(elf, relocname, 0, sizeof(GElf_Rela), 0);

Probably best to use Elf64_* here instead of GElf_*.
