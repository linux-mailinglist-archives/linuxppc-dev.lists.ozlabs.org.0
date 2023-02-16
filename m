Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FC76998B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:21:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHdvc3rRdz3cj2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 02:21:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=kan8aSq3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050:0:465::202; helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=kan8aSq3;
	dkim-atps=neutral
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050:0:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHdtg2B4Nz3c6W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 02:20:40 +1100 (AEDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4PHdtK2NS6z9sy6;
	Thu, 16 Feb 2023 16:20:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1676560825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UlqP8DSWoX4UKbyH5IcpBVIwt6VUAxwUAM7B5Uy4tZw=;
	b=kan8aSq33bhl6XipJAn9ndlcvpu3TFkzRh836zrAnmryUdj07DQrETlHlA/ILpbZQJLLsh
	YBQ7iiH6JoYM3qmEvRjiR7ELpW38XMjQZGETBi9NYOttXPbQLlDuE/yzjbEn6g5blyOYCk
	mjon8hTo4qiSRH34Q2tJnsS49z3fhjNcQtk/WLy4Bv1OSwTDProNtfJ0F2uJBrjw0UZvFZ
	/L/w6R2bLkioTtLjwFAFi8TWTHQCI03uvoz/MA7wcUaoN4ou6UtPiCrCz5gZDtLCJf9LNm
	x4YNGWFE94pL1F7E8r9fNFpf6j+ANzvzvHSgcnVUCRzELQ6ShcLVOwqN8aVqZQ==
Date: Thu, 16 Feb 2023 16:20:20 +0100
From: "Erhard F." <erhard_f@mailbox.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Bug: Write fault blocked by KUAP! (kernel 6.2-rc6, Talos II)
Message-ID: <20230216162020.0b90ed66@yea>
In-Reply-To: <65f1c4b4-a1f0-9eac-0ce3-70196a331052@csgroup.eu>
References: <20230203004649.1f59dbd4@yea>
	<5f0714428e4c696e3d5c00f3bafb4d2970cb6e2b.camel@linux.ibm.com>
	<CQ8L0O2CYDIX.8HICM7H2PCMN@bobo>
	<65f1c4b4-a1f0-9eac-0ce3-70196a331052@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: azhcmqg9yg9wz3k1mc9g3d61gbxayjwh
X-MBO-RS-ID: 64e495e9b355e3fb342
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 9 Feb 2023 07:21:55 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> An easy fix would probably be to also check the suffix as a prefixed 
> instruction with 0 as suffix is not valid :
> 
> diff --git a/arch/powerpc/include/asm/inst.h 
> b/arch/powerpc/include/asm/inst.h
> index 684d3f453282..87084a52598b 100644
> --- a/arch/powerpc/include/asm/inst.h
> +++ b/arch/powerpc/include/asm/inst.h
> @@ -86,7 +86,7 @@ static inline ppc_inst_t ppc_inst_read(const u32 *ptr)
> 
>   static inline bool ppc_inst_prefixed(ppc_inst_t x)
>   {
> -	return IS_ENABLED(CONFIG_PPC64) && ppc_inst_primary_opcode(x) == 
> OP_PREFIX;
> +	return IS_ENABLED(CONFIG_PPC64) && ppc_inst_primary_opcode(x) == 
> OP_PREFIX && ppc_inst_suffix(x);
>   }
> 
>   static inline ppc_inst_t ppc_inst_swab(ppc_inst_t x)

Your patch works fine for me! Applied on top of v6.2-rc7 and in the resulting kernel the Write fault is gone. Thanks!

Regards,
Erhard
