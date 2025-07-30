Return-Path: <linuxppc-dev+bounces-10466-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64087B16373
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 17:14:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsbNB2fscz30RK;
	Thu, 31 Jul 2025 01:14:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753888458;
	cv=none; b=VkOqiDEP3FG0LL1egkYjHZEHemQdJzf7wz9ukrboZ9Zzkgjt/reSfJ9T2kBBZnqcTOt08EIb8CmV2Kz5r9A+lp9ILhlZ20doJhTOtV0mRwY4irkIeKUbuzECNuR2YxZifEXt+vMGGBSMAZ5dIHTktLXaiOxOL4OW8DW/DaWr1YelX2+l0NcaXuPs9sldNi9NQRYwIGVL8c7t4BRYN6lbTYw7HV2gNCBUq2LXQ6DI23utUpZzx6T5N2O/DMV65YP9xR0uky3hkZ4So+IJgStM3uc19YKMrjccvkqB5rwUUO/BXgPUKXOmIDqbOAq5CDzToDQAJDIu57yY5uMbMwx9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753888458; c=relaxed/relaxed;
	bh=m+oXDpSbXkFh02pwXQyjxgNWqMEN7+TwK51jzavy4dI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2WLYHpuDbI/XnUcDdTg/SQBMS3EWJanK5mB15yBStV/yaOQnhw6fAm4shwKxc0apgh7g/cSwBKinY2Okf1pOHTEIbRCogFX370N2YHBCOLgJTGlZJ59saqTjaYI1fhfn9zqOUHSivsozIa/HWXH9/gK3JplXt+jER2xvODE+syRTiBYuddGtpCmzPLCx2mD4N6aoPiiVQjtqHt1AAN6bXDPiKNNQ2CZ5pRkSUM0tS5ws6HfSMODZT4sQyw6z8yw9v9g5nATSSvQhpZlXYwBFJIb9AMxq1tLC/4uuvOcTKh3aLZJU8T/B0qgDAnI8FZl5FMQZPZOumCcgXFhArJpAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aLKsDrfg; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aLKsDrfg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsbN43gQ2z2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 01:14:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=m+oXDpSbXkFh02pwXQyjxgNWqMEN7+TwK51jzavy4dI=; b=aLKsDrfgV3sov/S+dwotba19Rr
	NSv7IwEYsciotk4atSDJHXMTBFeSjc3JdOf5RA3qyzMIZ0kQYfUtDNlTPtzZoUlQ2W4f7NhMnY00A
	6Rcip4sjW0bCZBtxgXIlU4AbJta+AERHElD/pHf4ndlnYATDk4QBpVjwEDiY8oSwROZRydRu3yaTb
	dzXbcwVOvxMOSzQptRDj/mFimyhWizXZ7ez9UtCfeHBZVK0ZsuKO+fccFFNGrPAa5htWjgciTKp+Q
	jEcZlLepI7SKxc5DVbO2only1mreG1D+Kde/Xbnhnbsjz1JURzGwm5waVYXMcr6T/S2cyQwQiodho
	GIrMrxyQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8VK-00000001pES-3Y92;
	Wed, 30 Jul 2025 15:14:06 +0000
Message-ID: <7cedcdd9-c89e-4194-98ad-d3426a240863@infradead.org>
Date: Wed, 30 Jul 2025 08:14:05 -0700
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
Subject: Re: linux-next: build warning after merge of the jc_docs tree
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jonathan Corbet <corbet@lwn.net>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Vishal Parmar <vishistriker@gmail.com>,
 Brigham Campbell <me@brighamcampbell.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250730102931.6334022c@canb.auug.org.au>
 <87cy9hx272.fsf@trenco.lwn.net>
 <f10f6457-1a19-47cf-86d1-eb787badd6dd@csgroup.eu>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <f10f6457-1a19-47cf-86d1-eb787badd6dd@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 7/30/25 7:30 AM, Christophe Leroy wrote:
> 
> 
> Le 30/07/2025 à 15:01, Jonathan Corbet a écrit :
>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>>
>>> Hi all,
>>>
>>> After merging the jc_docs tree, today's linux-next build (htmldocs)
>>> produced this warning:
>>>
>>> Documentation/arch/powerpc/index.rst:7: WARNING: duplicated entry found in toctree: arch/powerpc/htm
>>>
>>> Introduced by commit
>>>
>>>    c361f76da696 ("docs: powerpc: Add htm.rst to table of contents")
>>>
>>> interacting with commit
>>>
>>>    19122a7c28ed ("docs: powerpc: add htm.rst to toctree")
>>>
>>> from the powerpc tree.
>>
>> Did that just get added there?  I've had that fix since early June...I'd
>> rather not drop it (and have to redo my 6.17 pull request) now if
>> possible...
>>
> 
> There was a ping from Randy about it recently so that Maddy added it the powerpc tree, see https://lore.kernel.org/all/5ac25ceb-023d-409d-8e7e-014d010c5028@infradead.org/

IDK. Maybe the patch that I replied to there was made against mainline instead of linux-next.
I should have checked linux-next.

-- 
~Randy


