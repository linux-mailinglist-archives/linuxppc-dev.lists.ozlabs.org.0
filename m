Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E79D65A9FCD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 21:21:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJWBB6GVRz30M2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 05:21:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SA4u3MTj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=SA4u3MTj;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJW9X4C4wz2xGt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 05:21:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+roK5D09xrSmOTu3P9Sq1+swSxQSmI55Rozlj/752hc=; b=SA4u3MTjdtlR0YA+gRA5r1ludD
	tFMeaLbxOMYjCyzsUlZvpXhnZc4YYAS+moqdo47PM5WidLL4S5706TPZjOCTaAc+q0My20kmvYY39
	AMHI8bcNaChVJ5vhxGmFOFvqu6WTutPz1gb+a+AZOf/OiqM7bJWaG+eBEaXMe507tvVwSU3kQ+9PR
	UMudahAcskOEDdsg+B4RhmOmTrxVayyUw1n1EAYDo6BDXX0lei+V2/CqeRPZoI4yBMiLxwpYjFhf0
	KsMI/65uOfgkVeJvu1gDAwCq4qvSd0X2PqPYYDcI3sNhxfcYiczEpAcYSNIUXRitYrpiKF2sqHlgc
	9DL1ZnHg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTpk8-008TE7-39; Thu, 01 Sep 2022 19:20:48 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B5DC130010B;
	Thu,  1 Sep 2022 21:20:47 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id A69332B8BD272; Thu,  1 Sep 2022 21:20:47 +0200 (CEST)
Date: Thu, 1 Sep 2022 21:20:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH v2 08/16] objtool: Fix SEGFAULT
Message-ID: <YxEGD0TVWtXTjcGR@hirez.programming.kicks-ass.net>
References: <20220829055223.24767-1-sv@linux.ibm.com>
 <20220829055223.24767-9-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220829055223.24767-9-sv@linux.ibm.com>
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

On Mon, Aug 29, 2022 at 11:22:15AM +0530, Sathvika Vasireddy wrote:
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> find_insn() will return NULL in case of failure. Check insn in order
> to avoid a kernel Oops for NULL pointer dereference.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  tools/objtool/check.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> index 91678252a9b6..ed2fdfeb1d9c 100644
> --- a/tools/objtool/check.c
> +++ b/tools/objtool/check.c
> @@ -205,7 +205,7 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
>  		return false;
>  
>  	insn = find_insn(file, func->sec, func->offset);
> -	if (!insn->func)
> +	if (!insn || !insn->func)
>  		return false;

I suppose this is ok, but how can the lookup for func->sec, func->offset
*not* find an instruction ?!
