Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DEC4E5812
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 19:03:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNx6q076Bz30Qx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 05:03:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=jv8WdjAt;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SCqhS6nM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=mbenes@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=jv8WdjAt; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=SCqhS6nM; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNx663f92z2ypV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 05:02:53 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id A3E54210F4;
 Wed, 23 Mar 2022 18:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1648058569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PH6z87ZT6oLdaXVcqGtAs/3h7ivkY3xB/i0TfcTIX5U=;
 b=jv8WdjAtfSPahs8a0C++jvpJEJDKQ+fsP21x42FtoS69DQROpOhlReP14kr2DY2KhnF1N1
 YuFgd8cE7bKVNnyU1G8ysaULWhsAPs3Pfgl/GSbfDFQxdTfexeEVlDsPcgTlm9tnSBhYl4
 2VLx6nxSj5oaDLJOqbG0uePwa3b22xM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1648058569;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PH6z87ZT6oLdaXVcqGtAs/3h7ivkY3xB/i0TfcTIX5U=;
 b=SCqhS6nM2K2a36VQe2YNroDZ/MzJFif/cIueWn7mxCBYA1ausDCAYM75kA6ZfJpu+hqce5
 0kMTRuKSQQ+mHeCg==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 12FEDA3B88;
 Wed, 23 Mar 2022 18:02:48 +0000 (UTC)
Date: Wed, 23 Mar 2022 19:02:47 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [RFC PATCH 1/3] objtool: Move common code to utils.c
In-Reply-To: <20220318105140.43914-2-sv@linux.ibm.com>
Message-ID: <alpine.LSU.2.21.2203231859420.10670@pobox.suse.cz>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-2-sv@linux.ibm.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 aik@ozlabs.ru, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +#define sym_for_each_insn(file, sym, insn)                              \
> +	for (insn = find_insn(file, sym->sec, sym->offset);             \
> +	     insn && &insn->list != &file->insn_list &&                 \
> +		insn->sec == sym->sec &&                                \
> +		insn->offset < sym->offset + sym->len;                  \
> +	     insn = list_next_entry(insn, list))
> +
> +#endif /* UTILS_H */

Since you include <objtool/utils.h> in check.c, you can remove the 
definition of sym_for_each_insn() macro from check.c as well.

I wonder if it would make sense to move all these helper functions to 
utils.c and utils.h. Might be connected to what Josh wrote about his work 
on objtool interface.

Regards
Miroslav
