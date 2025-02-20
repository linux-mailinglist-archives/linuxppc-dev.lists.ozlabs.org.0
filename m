Return-Path: <linuxppc-dev+bounces-6371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF7DA3E56B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2025 20:59:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YzPHT4zVBz2yDk;
	Fri, 21 Feb 2025 06:59:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740081589;
	cv=none; b=kfpj3WGnt58rRhmqQ7t0l7zAJhU6fcnJIomEeOC56wFETZTryKc2CXojccou4T18+R4l/CRdrR0lhrzkOgSS3WJ5eNXf89M/cCNY/NSQ8w7kkj66+0sqoUCgYy0TvyLplC3t/wT880/vlImBa3Kmstc2RmzLpFeQ82yy27TDVRBxUr5cRju6JMPsmHPzlqNaNaG/SUaM2HWkEaHC24zdA0BnKVGoFytbqZSGe0OpajJgdYTOf+Qnv0WmVWcbKPOdGLn8WWAZN76fyjzKIBYvJMcFoFjWMTmKEAE4yNtW4cyJTCUp2q7B+SyuyAp+SrmvqYzdmyMvZJRzPoBLlyJzlg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740081589; c=relaxed/relaxed;
	bh=57jy6IJbBpOf0mv8xQxTKQEE1f82a0djX7hcxZ3+3lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XAUgH7dgSIV13+1977UnwQR14DMkQhFWOT8jf1VPHDSovNWVzWkS+vxvs0BTJvmIWtqDNOB0TqUZAIss+QnHmDhusFgvpq9x3eLNb8YjfATksPwlpFV+MGEkqQzGkwyUUJiUfOeKICiTm4/0jy2JXnN5DihKfEhA0bRdpPuGzmDRvYH3HxHGA7pbbq+Eprl3JM/U7yKvgcUyUJPOs2RBFWfKe3R2xeNZnVecOKl80MbsfsWpOaHIIv5WgBaTJpBY67Io7icBp+iFyy/LEc1j0jlKVmFOs2WmcIqm5/aytWr8FTBK1mxb/8L2pKJ/feTukIWeAwtsQTa0mgxbUWU9nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GXsvJpQR; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GXsvJpQR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YzPHR2zq7z2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2025 06:59:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D8465C3CD0;
	Thu, 20 Feb 2025 19:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8405DC4CED1;
	Thu, 20 Feb 2025 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740081582;
	bh=vbTftWsandQc7OcCjdvC6lWo4bRP8tGg5iJy8RM0ZFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GXsvJpQRWYxUzYNPalhxtohdI0AQWCuZrKMRe+zMsiOQU1NqkxGyTjkAJg7dgfF0j
	 H+NxkGor/y1JBg3WjGrp1BlXUk+j2axZX5spQg2SacrxeCOx6g7Sz90Trll76DUK83
	 Azeuwk2Kljsz8E83cxHVQ2j6Hf6vwB2mOnD1bnwGd9/tuA5laaLroqHqgMJY73pqFi
	 8mawiI6SMrl2dxX3DZ8eHPROef9AsHe3Ch9aOeT2/7dDdVTfZSzB12xjP6vTwKTxA+
	 67aCzncwDRT2ts/DRekiofNn/2sEZp18FuRR8tHxR0fgFwWkk7RJH9fo9hY8IYKLts
	 RrQBHHjtAc8Fg==
Date: Thu, 20 Feb 2025 11:59:40 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Cc: peterz@infradead.org, christophe.leroy@csgroup.eu, npiggin@gmail.com,
	maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH] objtool: Skip unannotated intra-function call
 warning for bl+mflr pattern
Message-ID: <20250220195940.ely2l2fpsozd2tuv@jpoimboe>
References: <20250219162014.10334-1-sv@linux.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219162014.10334-1-sv@linux.ibm.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Feb 19, 2025 at 09:50:14PM +0530, Sathvika Vasireddy wrote:
> Architectures like PowerPC use a pattern where the compiler generates a
> branch-and-link (bl) instruction that targets the very next instruction,
> followed by loading the link register (mflr) later. This pattern appears
> in the code like:
> 
>  bl .+4
>  li r5,0
>  mflr r30

If I understand correctly, this is basically a fake call which is used
to get the value of the program counter?

> Objtool currently warns about this as an "unannotated intra-function
> call" because find_call_destination() fails to find any symbol at the
> target offset. Add a check to skip the warning when a branch targets
> the immediate next instruction in the same function.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502180818.XnFdv8I8-lkp@intel.com/
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>

This should have a Fixes tag as well.

>  static int add_call_destinations(struct objtool_file *file)
>  {
> +	struct instruction *next_insn;
>  	struct instruction *insn;
>  	unsigned long dest_off;
>  	struct symbol *dest;
> @@ -1625,6 +1626,11 @@ static int add_call_destinations(struct objtool_file *file)
>  		reloc = insn_reloc(file, insn);
>  		if (!reloc) {
>  			dest_off = arch_jump_destination(insn);
> +
> +			next_insn = next_insn_same_func(file, insn);
> +			if (next_insn && dest_off == next_insn->offset)
> +				continue;
> +

This won't work on x86, where an intra-function call is converted to a
stack-modifying JUMP.  So this should probably be checked in an
arch-specific function.

-- 
Josh

