Return-Path: <linuxppc-dev+bounces-4710-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D978A026E7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 14:42:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRb2b6xZrz30Nc;
	Tue,  7 Jan 2025 00:42:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736170935;
	cv=none; b=S1Ku0Q01IaU5Y0HLp5P0dBYvxh9gOG7RRPboYXvh1KqJc2Rg9PTXfHjwqdd68VaDf+X+9M7VdPO/VdEzhHQeAGYH6Vj/xeepiyNn/1KmAQGaZjcJEWmJGN0EGj1sOWHjLblEakj+nRQOPuLvD6ZMQ/TKnQYhHq5UfXRY2IdEWLVo8K83YvLDd+ouKq4j2GLTIJefY8jzuZoSVWX3cY473bCGr1RzBz7XGpTRBH/vUccLbmFmKPtEldkyxfmSNbR54ZZlHMjSOmRAY1j4xe9OzE8cbL2b9SujqE+gotgcIPDXI2hevfHQjF1mkbUG4Ar5qRcCe7IUbsseENzDpcQbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736170935; c=relaxed/relaxed;
	bh=hIKi5tvHgn4oTtsQ0CTNkhMCpwV6e41GG155vwUVdx8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=g3OrhmGIveQfg4yuSVN9ARWZLlkOD+GqDWtad77mJLo/BymAlSSmq0a8SDYZSknL65J3x0T4ISkSXxpdiLNd5dRLdXUHg2iCHNy9HffgsdtUTuR2jj1jq4wFdBGbV9/IHh6kJfWEF3OZVdYOJj601uwOuSxHG9XaLEB8I6YDYzyEIKXBipWHxNzRwed52276MpfFT7k3jCpbrnNsurIi2dLbEGJlYCVy8h3f6is54Eqc+DVZcrglv+PXyBxOHMABKRD+9RZx/JhM4NaXglFl+YeEcrx8EaJblnLDXmVQoh8fXfU5vN8XSU7XChXZpC83OtxYM1TvPGpYPZ+zOfT9nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Ra5wQQ7S; dkim-atps=neutral; spf=pass (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=Ra5wQQ7S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.3; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 336 seconds by postgrey-1.37 at boromir; Tue, 07 Jan 2025 00:42:11 AEDT
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRb2X04Plz3050
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 00:42:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1736170914; x=1736775714; i=markus.elfring@web.de;
	bh=hIKi5tvHgn4oTtsQ0CTNkhMCpwV6e41GG155vwUVdx8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ra5wQQ7SOWCKVOlK0dltQ012zpUHubByQ2Wq2og0VDBV2PenPHswIBZSySJ5EmUK
	 DJBPmHJQEQWVYP9NcqPN7q1dj3f6NVX3LGSdctnxilFfpfpXd0RLWDQahaPSlmHhm
	 6/PSZKC14lVSHfuV4CRJATTmxrr86TjTMd5iTi7q+JSXsfdX7+xRHjtSEyNsR7LPB
	 Jk4z9Cnxx675j1QlHDTk3IkiAxY4v+ZLzSAO4z8ZytRime9kbTLQC3lmsF3FKiGDo
	 F8DrkKS2/+Qo1uZZEVCSP+vYeoeZXMuTWY27x+WGwdP88p27UAHKG8WNVr48f/rn4
	 RCMjmuWoLMpfEQckZQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.38]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MWiA0-1sxjfk2S4W-00SY5k; Mon, 06
 Jan 2025 14:36:00 +0100
Message-ID: <484f8c43-2c50-4467-be3f-8fe02f36e6b0@web.de>
Date: Mon, 6 Jan 2025 14:35:51 +0100
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
To: Colin Ian King <colin.i.king@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Haren Myneni <haren@linux.ibm.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20250106123241.161225-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] powerpc/pseries/vas: Fix typo
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250106123241.161225-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uvnSiY72c0gNk8bkKVCMJNKPDVix8JfGj166yYbGYi1kojtpQM3
 DoX0jzxO13Tdz2m+X1lbGxtK11KwGFgNrpYw6SsMthzelXqTGlc9dLkBv/A49h+JJUpjqgq
 4TEcgDX6oyiO79amjYPL8LpWEpmr8NqisOcR7SPrBrfq2ItVxgtt9MHAIaPZCb5YM3rW8iI
 625UjMFnolUwdobkqORuA==
UI-OutboundReport: notjunk:1;M01:P0:wGKTVeYmOPQ=;vBjDB6ty8VwHfATNkcHldKvUIPY
 cpmvk2KbP3USKIgeCG8MxrorBvbB0wcFw9bLu7NidLFpOezC4zegXn5pUt59k04i4WFV/iIqv
 Jr0QOblTzgazRqvFYDguyxd19o4gum1nk0I6xc7TfGFNVbXIJlRqIVIbGRNYvJXOr1idZkdlA
 GWvp0wT4eT1SzKyiDyvEc/UvhcwySkicBh+EpVTcZOMhiGRZYL5T9sp9Knx/fiAa25UHqRRyk
 drjQsVfjJIEgoUXQxTjwZvlqMDux4onWNqTddwgSyCZ0JvLKGTh5hNyUudBfVe8D8Zrfy0V/3
 NXcBnLP1l0jP6qRI5BuYomL11lSLluc+CIuk/WWjAyLAeDQVpAQtkePUTiTEJTuJxf9QTrGFZ
 czRFeVyoTq3uxemGr6K36sO9wWe9zbx4VpGBxg5IVt1RhO3UeoBLXwrSvgnEELth+s7P5Tnii
 Zmu5E/7NgDWQIEbIuWNVjUnvORaAa8WzGrR/pQhJS/6Fc+kJfX2X1xvujUCftsM7ZUBOByp4/
 1w72AFmQEnk/BigzGLo6Jw9xkYTWAKRalW3HR7raeagVdDgiHs9oIYsAA0t1Pw/s8n1sE7UAe
 5Lvz7WAIHpR07pkyiLsCiBHONGJVqhCds4QFemwkEViRBMzKOykYsj50fhg+NPTir5NmphYin
 pEiREY7q3qsXMe0lMj0cHksLL6Z5CjsIsNgxyy+Y+j5km/DQC5fIjgi027P3qsnI9nG8v23ix
 PeacAfQunTFLFo/KCrzLRTCbzLcNxbb3TCBs0TafXi8JLtvYN5legwNKdztjGImxfmGPxjf2p
 UWn4EWDN+7ahVsYI84ZWKbu0O1dhC6fkVM0Bqg0WOvsqM0WM7rpAvei6L5FjEZSjLtqqxXLEV
 W6RLuLDH2pXiQqLVSZrdvCAveWPo/SyLu99BsKWGg8CrXSCHnqkWpILzDqrrkxESaR9sUcJLt
 IJ+bI8sI3gUr2zmM1fJ9wJFjKVLHQ1Zqo+kTO5ti+xgKN1mrIk0J2/bFvCiQWQVqBgnovwVaB
 tZOk7neYydLKbZixfzHWmAVnQtRLNr+gQb32yEgy7SIxWVquy85L9ETQEPg02qRyVm4EIAF6Q
 +NmUSw3Sw=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

=E2=80=A6
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -490,7 +490,7 @@ static void vas_mmap_close(struct vm_area_struct *vm=
a)
>  	 * address. So it has to be the same VMA that is getting freed.
>  	 */
>  	if (WARN_ON(txwin->task_ref.vma !=3D vma)) {
> -		pr_err("Invalid paste address mmaping\n");
> +		pr_err("Invalid paste address mmapping\n");

                                              mapping?


>  		return;
>  	}


Regards,
Markus

