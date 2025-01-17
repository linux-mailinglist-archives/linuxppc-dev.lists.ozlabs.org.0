Return-Path: <linuxppc-dev+bounces-5357-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C58A14F19
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2025 13:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZJhl50pJz30YZ;
	Fri, 17 Jan 2025 23:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737116407;
	cv=none; b=FIYY+fueU0+gD1Rm98HP6/30YrBhtFsJEsEnSfeA9poaF4IqBjZIaMndGr3eElFa6qbGbQTsnB7xjAf9Mv7XFXksGrUHplslQ+txc9JhLFDkezvtdnmmbw2Lm1YMtEGih6ZyQz7jtb+cuLXkPCYbtSwKfkCsOkNo73kbqxVQkBA0RDMpHmo41tgl/l+kYQrdQpUbxeLQtK0zJ7L1IzCZUft6Q1xLvb2HcT2rMytnHORIBHovOscYyjkdfOA2vY7z5kX40k6o/8w3R7po7fkVr6byyUmeXzAULTLD0NHCyX2D8bKrJi/Rg2mRQi0TxkiQ194jP7Ic6xk7YbDFENOwhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737116407; c=relaxed/relaxed;
	bh=fbKu4S8BLHjHV2QYTMDaNTxUO4LjGf0/XqJHgUwuAwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T+qJ4MdXo3LsIGFZeI1kZeQC2v46gFjLqrUTKJLV+/7sCZZrp2cQcra5drYDVmbv3X4cr+gh+qbEL24bkL3ZlSfRWOGXF5EdZ+kPj0MIhCorJDzBLSDVwsEEIS63GnGqN+L4NvsMW/yqS09qHtANF4ymvDS9jnyiJPnswen9RsSp6dsuYiKq2AErhYXgQ6W1dT4fYgC/HqeiROp/WM+mXTDUqNtIJFLBZkPoP4LcqmIpddBL2R8Z/BXNgRiVoPYaRzksSYpBcG7O67WnWfHWykR67EyvMcGd8Gu3wDzegX/FqB8r8fK6hkmum7IjWLriNTIL5ZXpSIL/zUMwMc3z8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZJhl01vxz30Vd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 23:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YZJYb6zlFz9sPd;
	Fri, 17 Jan 2025 13:13:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4w_vyT-8DwZH; Fri, 17 Jan 2025 13:13:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YZJYb6Bf2z9rvV;
	Fri, 17 Jan 2025 13:13:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C54188B77A;
	Fri, 17 Jan 2025 13:13:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id S-x_pj6MnNM9; Fri, 17 Jan 2025 13:13:55 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 689508B774;
	Fri, 17 Jan 2025 13:13:55 +0100 (CET)
Message-ID: <e5e51680-0e66-49ce-a523-1eb9d570e43a@csgroup.eu>
Date: Fri, 17 Jan 2025 13:13:55 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] powerpc/fadump: allocate memory for additional
 parameters early
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
References: <20241113070618.75744-1-sourabhjain@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241113070618.75744-1-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 13/11/2024 à 08:06, Sourabh Jain a écrit :
> From: Hari Bathini <hbathini@linux.ibm.com>
> 
> Memory for passing additional parameters to fadump capture kernel
> is allocated during subsys_initcall level, using memblock. But
> as slab is already available by this time, allocation happens via
> the buddy allocator. This may work for radix MMU but is likely to
> fail in most cases for hash MMU as hash MMU needs this memory in
> the first memory block for it to be accessible in real mode in the
> capture kernel (second boot). So, allocate memory for additional
> parameters area as soon as MMU mode is obvious.
> 
> Fixes: 683eab94da75 ("powerpc/fadump: setup additional parameters for dump capture kernel")
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
> Closes: https://lore.kernel.org/lkml/a70e4064-a040-447b-8556-1fd02f19383d@linux.vnet.ibm.com/T/#u
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>

Version v2 of this series was applied.

If needed, can you rebase this patch ?


