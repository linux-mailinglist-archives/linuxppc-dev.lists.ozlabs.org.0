Return-Path: <linuxppc-dev+bounces-1452-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6683997C3CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 07:12:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Nv85DGLz2yDk;
	Thu, 19 Sep 2024 15:12:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726722772;
	cv=none; b=awqizJDIfDRx9irkwnHfn4FWekMxwBWdb6sGRffcBH9hn5klsovehvmmk2vexjCOif7KzYBSlX1i0DJcyl0kTbeaOqOMdT6sqZ0a5TofgXa3703G33xvtG3j7shUbUUVmYpeniCIzQBaFOsCDN3TXjMkb+bGb0lPAEY6cO7LEsQoHDravMJZgWm9TDVvB5WmTxSSsd9mL3GuDycAXc64KwAaeF9zM5CJo4gWQXnQdXiJsutdM9mt4OW52DTNa1ytbKvUO4Nx9UFLlh4uUp8NW+2uRX6m2J0mt38g5utVo9i417Ru0aR4niaWghBQtRurk0S0taGs2H+8I/BW/kUPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726722772; c=relaxed/relaxed;
	bh=4zpcdFnCoTeK8iU0GeUVVMww8lNj1OYq8wkhh/Mkm4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VeYewyZPPb7EWJv5k/zfUf6AtuERqEpJtlFVxJCM5Qe5EXcLju8K3cv/fNDDVa8anKABrkkD+LtQXS6LL77txub1DHBosK+blQlRq1h+rQr/ruCaWQvFOgmGzi4PveZc4W4gf0ZbvVkDtb3EanEOMjmuaqwY1Co6Kk5zdRh/lJmLPTulCkXUr4D2uQGtvyEDlqB8s1EfvQf8UgxMuf1YwAcH6s+TNxaSIyAGDeKM+ymZdq3BOc3Kt126rNf46RF9wRozj4CTkmI66A8bvoxPjv9oyd0gWg0cWp/q7mYv4wxSRMY5y5Vwxok3lkk2SrBWpB7nWbCW5URYBRANrAIkQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Nv82z1Xz2y92
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 15:12:51 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X8Nv262lTz9tQt;
	Thu, 19 Sep 2024 07:12:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4RULTJogRSBh; Thu, 19 Sep 2024 07:12:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X8Nv25Brdz9tQC;
	Thu, 19 Sep 2024 07:12:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A1CF48B775;
	Thu, 19 Sep 2024 07:12:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9-15FAM90Jzf; Thu, 19 Sep 2024 07:12:46 +0200 (CEST)
Received: from [192.168.234.38] (unknown [192.168.234.38])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0416F8B763;
	Thu, 19 Sep 2024 07:12:45 +0200 (CEST)
Message-ID: <65664ab8-4250-47c2-be50-d56c112a17fb@csgroup.eu>
Date: Thu, 19 Sep 2024 07:12:43 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 02/13] powerpc: mm: Fix kfence page fault reporting
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Donet Tom <donettom@linux.vnet.ibm.com>,
 Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
 Nirjhar Roy <nirjhar@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, Disha Goel <disgoel@linux.ibm.com>
References: <cover.1726571179.git.ritesh.list@gmail.com>
 <87095ffca1e3b932c495942defc598907bf955f6.1726571179.git.ritesh.list@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87095ffca1e3b932c495942defc598907bf955f6.1726571179.git.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 19/09/2024 à 04:56, Ritesh Harjani (IBM) a écrit :
> copy_from_kernel_nofault() can be called when doing read of /proc/kcore.
> /proc/kcore can have some unmapped kfence objects which when read via
> copy_from_kernel_nofault() can cause page faults. Since *_nofault()
> functions define their own fixup table for handling fault, use that
> instead of asking kfence to handle such faults.
> 
> Hence we search the exception tables for the nip which generated the
> fault. If there is an entry then we let the fixup table handler handle the
> page fault by returning an error from within ___do_page_fault().

Searching the exception table is a heavy operation and all has been done 
in the past to minimise the number of times it is called, see for 
instance commit cbd7e6ca0210 ("powerpc/fault: Avoid heavy 
search_exception_tables() verification")

Also, by trying to hide false positives you also hide real ones. For 
instance if csum_partial_copy_generic() is using a kfence protected 
area, it will now go undetected.

IIUC, here your problem is limited to copy_from_kernel_nofault(). You 
should handle the root cause, not its effects. For that, you could 
perform additional verifications in copy_from_kernel_nofault_allowed().

Christophe

