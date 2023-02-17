Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C020469A5EE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 08:08:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ2vz4B0gz3cj6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 18:08:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b7etjb20;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b7etjb20;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ2v22lQ3z3cfY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 18:07:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 887F1614D2;
	Fri, 17 Feb 2023 07:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B184FC433EF;
	Fri, 17 Feb 2023 07:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676617644;
	bh=PvVofmqibWP/gbcVj44VW7uOdDpvKUxGrEFRWwgvi2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b7etjb20mnR6TTob0enxP8UcggmYIXeZQQQ+cMwqRhL8OeXwJbbUn5xvkHYrh9eGe
	 p5nQ8qSj8KurULFsrzGEAnliCjkmAQw8CasJYVcM8s8MfZZ3zdJQ/LaFkPwztJwyqC
	 +y4UBEi6uZ0aTgRxHyauoKiD9FPfc9IUetrrEYr62pES4N9AxcTDwcFSjaR52v9r5V
	 ysxRPfCvwa0EJM/0FKG/sK2PsiUnsS6ikQz8hKNFsltPlve+MC8b7jE18drYPsD67K
	 L88TW+rEuvzZXLeWycqqkf65JJHB471Au5pE8OFhQaQs9wctdOuJzQmWS42hS/N5HA
	 yEVLuPjmIH7cA==
Date: Thu, 16 Feb 2023 23:07:21 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH] powerpc/64: Fix unannotated intra-function call warning
Message-ID: <20230217070721.2igpx33c5bqk5eke@treble>
References: <20230217043226.1020041-1-sv@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230217043226.1020041-1-sv@linux.ibm.com>
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
Cc: sfr@canb.auug.org.au, peterz@infradead.org, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 17, 2023 at 10:02:26AM +0530, Sathvika Vasireddy wrote:
> objtool throws the following warning:
>   arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x6128:
>   unannotated intra-function call
> 
> Fix the warning by annotating start_initialization_book3s symbol with the
> SYM_FUNC_START_LOCAL and SYM_FUNC_END macros.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>

Suggested-by: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
Josh
