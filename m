Return-Path: <linuxppc-dev+bounces-10177-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA9CB00C15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jul 2025 21:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdPng1q61z30P3;
	Fri, 11 Jul 2025 05:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752175239;
	cv=none; b=kHUu9CKTOLeRNGx+7wxJx0t+aOQHriCGN+yx4R2Hi0TxWpNOmGiIES1v/Y2hrlJNpqfTDvQ8Ap+FOdZwIX8q5HLqFI8efwRMqfudRhJSWuez00FJ9U1QddtYFQ0bho0w99TJFIqlE/cnynx7hOES3ZsAlcWr/1g/WRbbLBZQbuGgHa/mi1hKM8pwimgiXle+PolV5mOYpKrXB/s80sgD/nWfEPbVsEGe5rSCO0z5DsAx8i5j80A8OSj4efEPujqwFaVe6/wkNdLOIFhy0E093TeCrmksauFDOYnpZK6M87udYBzEc2nHRMtQ/enlBiCLUNl27ZhoBY5sQy2BS3zQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752175239; c=relaxed/relaxed;
	bh=oastZyNvyaETjRKEUDOivqLlSR18ntI13AfXvPPXdhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T6ar2tq8JOpJK9/7ZLePG1Vw6iZLuoo07EbwN7Cy4Erkv7EKZRnoQNF/ttKzLGXxwtbDsIPlpsgbihuOG0DwdEz18Kr4ml0/x8UEY6htA61WJJCbF2oE3KKX/HcYWX0jEYKx29lIJwgB7rmKxDJxmGc6E/G7MJH+i4ove+X76Kfkv8Qq4OLI8aiDSU9xqgGIlFjuG4WV2MsFFxRTYvqE/3Ab+cf4xXS5rrOqd/jw4hWtC64X/c/hyozM3+O6vrMTQRT0Ww8C8ZtKsQE87pA0s9JDneyw7J8Ip3us/w7V386QNcAfwlBDBzkuYn3Fezq1hav+zy63uhr4BpqXupFQVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bdPnf1LRBz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jul 2025 05:20:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bdP4J04BXz9sy4;
	Thu, 10 Jul 2025 20:48:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R1HCylfEBLNv; Thu, 10 Jul 2025 20:48:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bdP4H68w9z9sx4;
	Thu, 10 Jul 2025 20:48:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C419C8B76E;
	Thu, 10 Jul 2025 20:48:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id dC-o8g2953Tg; Thu, 10 Jul 2025 20:48:15 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5444E8B763;
	Thu, 10 Jul 2025 20:48:15 +0200 (CEST)
Message-ID: <e5de8010-5663-47f4-a2f0-87fd88230925@csgroup.eu>
Date: Thu, 10 Jul 2025 20:48:15 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Replace the obsolete address of the FSF
To: Thomas Huth <thuth@redhat.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
References: <20250710121657.169969-1-thuth@redhat.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250710121657.169969-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 10/07/2025 à 14:16, Thomas Huth a écrit :
> From: Thomas Huth <thuth@redhat.com>

As far as I know, licensing related stuff have to be copied to 
linux-spdx@vger.kernel.org

There is an entry for it in the MAINTAINERS file:

LICENSES and SPDX stuff
M:	Thomas Gleixner <tglx@linutronix.de>
M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
L:	linux-spdx@vger.kernel.org
S:	Maintained
T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/spdx.git
F:	COPYING
F:	Documentation/process/license-rules.rst
F:	LICENSES/
F:	scripts/spdxcheck-test.sh
F:	scripts/spdxcheck.py
F:	scripts/spdxexclude

Christophe


