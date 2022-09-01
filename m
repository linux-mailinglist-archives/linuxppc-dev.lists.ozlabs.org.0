Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D995A9FD8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 21:24:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJWFc0s9Nz304j
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 05:24:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BiKYZO7c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BiKYZO7c;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJWF13XtZz2xGt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 05:24:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hy5o61o9Oglth8HH2RjC1xWHND1RP4dktCh8fxtlJ7s=; b=BiKYZO7comEUiIgcSUEUEiRy+h
	NkHMhqsOiNSFJm/CsNEbBkgFYl5Bu5OJwlnL3cV0mN5WewmHr9rBBhU3BvuZs0jBmYnsZ9bIFIV9D
	0mstv9BDRyCAMLFPsJvtRjjCGG5WRVLvmzvHyiNT5AV1J2MtbL+rcz3VA7KYo17o+Y7ZpN6IoLM7S
	a2GoYUkZaAipbGJBgvqeK9IkIvR/IXrTdTe2ZmqWMNKlxR6C3G0LSvywrEtWh+1H7DuDQm5yZ9gaR
	p/lvmcUUMiOXBas4boRm1dF3+Y63e601/0cHbOhr7VL301ghhsc16aB/uBVZzJY/eAGBGpyFumE7o
	RD+BYk/Q==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTpn7-008TG9-Bq; Thu, 01 Sep 2022 19:23:53 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0323630010B;
	Thu,  1 Sep 2022 21:23:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id E8B1E2B8BD272; Thu,  1 Sep 2022 21:23:52 +0200 (CEST)
Date: Thu, 1 Sep 2022 21:23:52 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH v2 10/16] objtool: Use target file class size instead of
 a compiled constant
Message-ID: <YxEGyMkLTsjoP2BP@hirez.programming.kicks-ass.net>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-11-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829055223.24767-11-sv@linux.ibm.com>
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

On Mon, Aug 29, 2022 at 11:22:17AM +0530, Sathvika Vasireddy wrote:
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> In order to allow using objtool on cross-built kernels,
> determine size of long from elf data instead of using
> sizeof(long) at build time.
> 
> For the time being this covers only mcount.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> ---
>  tools/objtool/check.c               | 16 +++++++++-------
>  tools/objtool/elf.c                 |  8 ++++++--
>  tools/objtool/include/objtool/elf.h |  8 ++++++++
>  3 files changed, 23 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index a948b2551520..0ecf41ee73f0 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -851,9 +851,9 @@ static int create_ibt_endbr_seal_sections(struct objtool_file *file)
>  static int create_mcount_loc_sections(struct objtool_file *file)
>  {
>  	struct section *sec;
> -	unsigned long *loc;
>  	struct instruction *insn;
>  	int idx;
> +	int addrsize = elf_class_addrsize(file->elf);

If there is a respin, please make this a reverse-x-mas-tree thingy.

>  
>  	sec = find_section_by_name(file->elf, "__mcount_loc");
>  	if (sec) {
> @@ -869,23 +869,25 @@ static int create_mcount_loc_sections(struct objtool_file *file)

> --- a/tools/objtool/elf.c
> +++ b/tools/objtool/elf.c
> @@ -1124,6 +1124,7 @@ static struct section *elf_create_rela_reloc_section(struct elf *elf, struct sec
>  {
>  	char *relocname;
>  	struct section *sec;
> +	int addrsize = elf_class_addrsize(elf);
>  

idem.
