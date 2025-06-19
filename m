Return-Path: <linuxppc-dev+bounces-9527-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8370AE0063
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 10:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNDpQ15pSz30MY;
	Thu, 19 Jun 2025 18:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750323038;
	cv=none; b=k+DhFHk1ilRCjma3ZFX1L2KcOfAVj6JMLq2A4yu8Mxm0ftTj6fEDhlURqgkiCUvRvOz0AJyE+WGg/PYVQSPhlxVvoj7MjxUqd7h8eybYlINsc8uQGIxAWhk6BEJsNv33GlmHIA069pcUg/IzIB98VILyUGIvYyawaxChObQ5PRY9/H5MvV4dhAywZG9MHdQToLHf4ufKGhHy/6rv6Fm9AuXZwI3cOR7ijvj4fGdAmYKZ6b2ZQ5gWk1qI60v7U46pCHdju4gtAJTGg5foynwYyLIjxzMFMXwjiXzqFb8sName+7oBZepzeCSQ87TQ4H/UqTBM1CqaAIXW+HriQF+uVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750323038; c=relaxed/relaxed;
	bh=LTj8xM2TR/lqvoVvPHJizZTsyvGRlEncFQI6noYeYPg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=oRAXF0UcNNEBVyJ4x4+Gvh6jYKwhON0ldJkwQsLyAzngH+KesdyJ2Wl8J0IOVXLhk/D2DZRnkuZnxBDVrnho7d1KKv8fsWsRM9J3hU0rpCCBFcoo2MZnwxwMnDzVbi3zF6uf2hKRXxtU76cTObOowZ6CnBeSAnzvtiE/EaGvtHC9l0G6ZDteo/2NjAq7E3SnztF8b6yi6vLImTr2ZMXxGbB3F6QQtiIi89hjpQdYmlxTAP3IbqzoZtSjmMrL+9lODxFD8XqAacbG+sfo970Rf/PvnRq6jsEqWOcpDLUF2kvZ2BNIZJCnUKXgQIzG+TrCsdSLgrq9aVUfnHzSNHouJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNDpN70nzz2xjN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 18:50:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bNDck1kVXz9tSq;
	Thu, 19 Jun 2025 10:42:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8n3SkZ0cbxug; Thu, 19 Jun 2025 10:42:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bNDck0sP1z9tHZ;
	Thu, 19 Jun 2025 10:42:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 183538B790;
	Thu, 19 Jun 2025 10:42:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Y0gL91Rd_iyf; Thu, 19 Jun 2025 10:42:14 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CDFC18B78C;
	Thu, 19 Jun 2025 10:42:13 +0200 (CEST)
Message-ID: <6f58923f-5ee2-41c6-bb73-8e0fb9ad9a96@csgroup.eu>
Date: Thu, 19 Jun 2025 10:42:13 +0200
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
Content-Language: fr-FR
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Daniel Borkmann
 <daniel@iogearbox.net>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Redundant barrier_nospec() added by commit 74e19ef0ff80 ("uaccess:
 Add speculation barrier to copy_from_user()")
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Dave,

In commit 74e19ef0ff80 ("uaccess: Add speculation barrier to 
copy_from_user()") you add barrier_nospec() to copy_from_user().

There is already a barrier_nospec() in allow_read_from_user() which is 
called by raw_copy_from_user(), see commit 8524e2e76441 
("powerpc/uaccess: Perform barrier_nospec() in KUAP allowance helpers"). 
Why do you need an additional one ?

And why only copy_from_user() and not also other places like 
copy_from_user_iter() for instance ?

Thanks
Christophe


