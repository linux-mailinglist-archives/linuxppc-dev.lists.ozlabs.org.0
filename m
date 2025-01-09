Return-Path: <linuxppc-dev+bounces-4894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 767CDA06E61
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 07:50:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTFlf6YQhz30hL;
	Thu,  9 Jan 2025 17:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736405406;
	cv=none; b=aC2pUF+wbzEftQfxARvlHcyMX7Pat6uyz5vZ+vUrj+yBOSnxaCoLZlgRyy+bw7ddNdmlKoErEgfEYtURBivY49KjhH+37Su4QxtDJcsI2OJmTjv4izEcOKBc9A3ya6ACmvvMME7ZgIs8e22X9HZ7XxApEXgqLCrFCox+8a80oiRQxOrptdvjnljCycZprOwtJxi9CDhYS/6W/bEuAFabzS/W62qC5Bz+y9bbx8m/4QtlTdDH9pqxOV7Hez+IlLHd4RDCVV501opey1S4djszinKSZqqjN34Vixg25p2WysCtdXSXghuxYrxfyYVkR2kgKGhbXLolXzSoqyZsQlgHgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736405406; c=relaxed/relaxed;
	bh=7kApxiwBrJbn373mMsKy31uaFq9SN2a0hkpqtwwOoSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqXXMTSOtE/dDD8DiUGrEFZiA28+SbSVntqdV0iTAud8xMnaU7Fy6NvOP3t/aAhmDXV2UcUcxVIV0qbU0G/JO56wU0WfAX6WR02b1GHfAi4KmqMFQRqc2zLpcSjwCbWQvH5Vi0UGWNaDdqS1bzqCII03g8hpGVrSGXLfpPyUMEQK4uPDDCxnf9gUqD9/LFqV9ucC+0AiHFr+gHTrHdc3JgHfVcmavbU+nb0AcvWp+H+NSmRPnHwDHV07lAHR28XsUCuqpCVH5axTsp7bqynrNQl1HlGCShu0bJJXuFUT8nMAOkkIyLQyG1/26COAQxHBF9Ut1qmjdeV0wR6wCIfXkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTFld3y9Hz30gv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 17:50:03 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YTFV64Thlz9sPd;
	Thu,  9 Jan 2025 07:38:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wFVIK4wTVg1Y; Thu,  9 Jan 2025 07:38:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YTFV63Lt0z9rvV;
	Thu,  9 Jan 2025 07:38:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5C7298B783;
	Thu,  9 Jan 2025 07:38:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id novq1XGp-0SK; Thu,  9 Jan 2025 07:38:22 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B8D7C8B768;
	Thu,  9 Jan 2025 07:38:21 +0100 (CET)
Message-ID: <e2ec27b9-77d5-4224-b66a-1ef353e6c848@csgroup.eu>
Date: Thu, 9 Jan 2025 07:38:21 +0100
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
Subject: Re: [PATCH] perf machine: Don't ignore _etext when not a text symbol
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>, Song Liu <songliubraving@fb.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-perf-users@vger.kernel.org
References: <b3ee1994d95257cb7f2de037c5030ba7d1bed404.1736327613.git.christophe.leroy@csgroup.eu>
 <Z37cuobj6NVRUKoo@x1>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <Z37cuobj6NVRUKoo@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 08/01/2025 à 21:14, Arnaldo Carvalho de Melo a écrit :
> On Wed, Jan 08, 2025 at 10:15:24AM +0100, Christophe Leroy wrote:
>> Depending on how vmlinux.lds is written, _etext might be the very
>> first data symbol instead of the very last text symbol.
>>
>> Don't require it to be a text symbol, accept any symbol type.
> 
> I'm adding a Link:
> 
> Link: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F752a31b0-4370-4f52-b7cc-45f0078c1d6c%40csgroup.eu&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C914f4c7995574ee91f5c08dd30211dd6%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638719640997470461%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=kqCNbhhgKri3TlJaUb3mkTU6NyFRzhnb%2BDiK93h9aSQ%3D&reserved=0
> 
> To give more context as where this has been observed, and also add a
> snippet of your explanation there, this:
> 
> ----
> # grep -e _stext -e _etext -e _edata /proc/kallsyms
> c0000000 T _stext
> c08b8000 D _etext
> 
> So there is no _edata and _etext is not text

For the absence of _edata, I sent another patch, will you take it as 
well ? :

https://lore.kernel.org/linux-perf-users/2fec8c50c271dff59f0177ff0884b6c374486ba5.1736327770.git.christophe.leroy@csgroup.eu/T/#u

Thanks
Christophe


