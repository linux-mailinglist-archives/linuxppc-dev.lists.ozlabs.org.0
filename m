Return-Path: <linuxppc-dev+bounces-15944-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62690D399F9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jan 2026 22:26:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvRVj4wHgz2xJ5;
	Mon, 19 Jan 2026 08:26:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=57.103.71.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768762201;
	cv=none; b=XlT4CgSqF0gG2EBeQD4MHFYOU4d8wr626wJxfLqmE6lhh1OFKi+7fSKxuwf9X+zSy8Of7sUqRP5Hz4F9dW6MmGl+KvDOg3rcfIaGruOtnFiZ0+o75OKSvbXd6XB8vpoUOlbXbVbUQIoGF+VziEJ9CV98eh3XmCASF7lmQ6RxJwOHNy8zXg9/q6BNJ+wErK4Aw0eFZFgSrdJ02LOEZeY75Y/Bi8N9mWovaeKTZLUEsTTbWuMVoDqrEFr8pqlm8fcnWAh8R0aBplHD24bjzBRUzdEYhg1CdVUJyM2gFj6CUojB11PxFNX60jUl6CqNb18m0B4CL1rxLjSpyF/R4JztXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768762201; c=relaxed/relaxed;
	bh=xjvMi6GFGlbqgGmmeOFvWqPwsPoBgy/JjXDenAmtqfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uauxn8Ox9GLexbnRktamFM/AMy9YnlXV84awLRbQ9WvHMkJoGG5DsSEC3FbHEYqAkVPJO7TNr56OubW7CBXaabvHU9IE4brigcH9u+zOGtnAcX3jRFlwhsfQKFb4r9GM4ziFGjjpxUe6cmzkRlDyUF8ATq8BCltR8Rpup5V+T+RGWBs0IKMLAlomW88GfeenzpIioVigm2TQH+EEDo5bVEUW06KvZ1mOzxTtriIdG2bMsVbZljz3q5wYC1Y753YzmJIq66ZXXPw+Vhisk2AvEWrfn6Kl7842lELhroCwwDBeXM2qdBm4hE6R/qhWN1QL5sbsTgGtSHTWogtp4ekEjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com; dkim=pass (2048-bit key; unprotected) header.d=mac.com header.i=@mac.com header.a=rsa-sha256 header.s=1a1hai header.b=lS58KSQU; dkim-atps=neutral; spf=pass (client-ip=57.103.71.27; helo=outbound.mr.icloud.com; envelope-from=cedarmaxwell@mac.com; receiver=lists.ozlabs.org) smtp.mailfrom=mac.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=mac.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mac.com header.i=@mac.com header.a=rsa-sha256 header.s=1a1hai header.b=lS58KSQU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mac.com (client-ip=57.103.71.27; helo=outbound.mr.icloud.com; envelope-from=cedarmaxwell@mac.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 490 seconds by postgrey-1.37 at boromir; Mon, 19 Jan 2026 05:49:59 AEDT
Received: from outbound.mr.icloud.com (p-west2-cluster5-host9-snip4-4.eps.apple.com [57.103.71.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvN1g6HMnz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 05:49:59 +1100 (AEDT)
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-0 (Postfix) with ESMTPS id 51D0518001CC;
	Sun, 18 Jan 2026 18:41:45 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=1a1hai; bh=xjvMi6GFGlbqgGmmeOFvWqPwsPoBgy/JjXDenAmtqfw=; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme; b=lS58KSQUIXGRZPrvj3fnSokrXvpFexaSb6sRzGfpY/OYR+egnKsRRmUc9ESl+eWQXWwSJNaO8I5zPqGsPL4BgPrUkllQmXj9PoPahiCP4k9ac64btshfIOPENqiABavwfnaowdyZNBFKLaR/Ww0118D2zyKduIcJ0qq4uVkm7MU1A8nOLxCmGxpQrFWNsxQBf9ko5VUlyM8ksme652oJGU92iFYlQPrEHXnDtWOMcesxDIAQ4JETW0RJ+fywKREn/1LkmgZ3tbXF81Dpv4ruurTEzlKDORLONlbiwPUo6yKMa+6ZEmg/UYFIQPaxwgfckwkedI5zQ01pVRd6rkxn0g==
Received: from [192.168.1.216] (unknown [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-60-percent-0 (Postfix) with ESMTPSA id CBF3218001FD;
	Sun, 18 Jan 2026 18:41:43 +0000 (UTC)
Message-ID: <4c70fe51-56c3-4292-9eda-f0f4535718fe@mac.com>
Date: Sun, 18 Jan 2026 12:41:42 -0600
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
Subject: Re: [PATCH v2] powerpc: Add reloc_offset() to font bitmap pointer
 used for bootx_printf()
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>, Finn Thain <fthain@linux-m68k.org>
Cc: Stan Johnson <userm57@yahoo.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <22b3b247425a052b079ab84da926706b3702c2c7.1762731022.git.fthain@linux-m68k.org>
 <176680916368.22434.818943585854783800.b4-ty@linux.ibm.com>
Content-Language: en-US
From: Cedar Maxwell <cedarmaxwell@mac.com>
In-Reply-To: <176680916368.22434.818943585854783800.b4-ty@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Info: v=2.4 cv=XrP3+FF9 c=1 sm=1 tr=0 ts=696d2969
 cx=c_apl:c_apl_out:c_pps a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=x7bEGLp0ZPQA:10 a=fPXO8E_wjBMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=JXPk7LadgWurrYbJNRoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE4MDE2NCBTYWx0ZWRfXwERN4npg9hhe
 QcSRTksUbDg8c5Aw8/AqjSopXXaAJ0IBhSDzpPGLBk39SaKa+6Yshw4eLS2GY57C/aZbh6SYq8M
 cgYuZqXW/WGKH6k7Srg5FNe1jK49aY9oAvVAF6igfb347JBnRsgN2ZIWmvpc6g+QT3gzusEFntS
 dOUbbLq7G1rUv0scG3vSUNQYI5rMLdJyz81qyJTeunI9+Zotbj37PwcIhuhQXa93Py8rTYVOf6t
 UCiC1q5u0666KCqRIFvcl2XEyMhguV44R5MPCVuRd3Mb16D9W/UX7x2J4j121FS7vKO9FgpsaPt
 vBOKSZGQDy+W3fNQPC4
X-Proofpoint-GUID: _RSHnb2iLwpQezYNpt68GTNW8-_s-jgY
X-Proofpoint-ORIG-GUID: _RSHnb2iLwpQezYNpt68GTNW8-_s-jgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 classifier=spam authscore=0
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2601180164
X-JNJ: AAAAAAABp+XWJIMWjaKg1EdVIkMHUHCSmlU1XHxVWa15/VQ0U2VsLzL9GZR7Uo3OClqmbEGo8uoab8ZBBVoVjXkyAgD2Kf9OWSpiapwKQZSsGBC27ZxsHkJqQN9PdSmqs56YIWKktDCNDr19o/w804prbHwLb2gXkZmYh5Zzm11Hcu5FgCt/1PrS8/lYRhkwWjegR9wUrpSfNW/KC1hZsO2FQcbmEN6C+Hy0wdcQg3yVf7EXGp2DVmNb3QvLxTL6btjRN/G0sjC/p/fq71pFA95BlDQc9GFF7IZ6AhbhV/MCxM1xS/Zg+Xw94Kr95eLK2Y3eT+Xv2yapS4NSXziqqw1klsCr35qMCzop4TbazjYevalyoI6XRA1OALJHN7WziTwo3s5nQbMrS/z8sF74EPBep0qVeiBNllvC7+kgGIRI8LHudTtDcg43X3ylciuJPrW+BUVTERC/BYk5YfXKKaLMCjia+hO+f0HSZJN/cpA4nsTsbwEbYXt+JDdNj3YV9OEMnLrVmthgkUqsPkcP+xRZy+kkAQoDt4H6MUe7PqyaIgR1s7uXuWXRhW0Vzrfblf4LTqHsgzWulX2Jn2EVxAZApKhnDqfkUcEJ6BRV+0ZAIRszUGB57WXry25k5ycYGK5lge69BF5Imz48ht134zhv56kpbF2zCHWPLUbb6TzRGB9hnPg2192rRRVNv/gxMETmo6+HVtOzovHPMZya8RJG6/rZ/OdMt/pUKKgqHo7SDA4LHVILM612ziFLpLXeNSBKxbFKKtOT3gqJQy7D97FV6S9t15BQ23PZKdSpw2BassMoCVXhnQZNiSeM68f1Ivb9phegIw==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Maddy (and everyone else),


Thank you all for your hard work in solving this issue!


Cedar Maxwell

On 12/26/25 10:23 PM, Madhavan Srinivasan wrote:
> On Mon, 10 Nov 2025 10:30:22 +1100, Finn Thain wrote:
>> Since Linux v6.7, booting using BootX on an Old World PowerMac produces
>> an early crash. Stan Johnson writes, "the symptoms are that the screen
>> goes blank and the backlight stays on, and the system freezes (Linux
>> doesn't boot)."
>>
>> Further testing revealed that the failure can be avoided by disabling
>> CONFIG_BOOTX_TEXT. Bisection revealed that the regression was caused by
>> a change to the font bitmap pointer that's used when btext_init() begins
>> painting characters on the display, early in the boot process.
>>
>> [...]
> Applied to powerpc/fixes.
>
> [1/1] powerpc: Add reloc_offset() to font bitmap pointer used for bootx_printf()
>        https://git.kernel.org/powerpc/c/b94b73567561642323617155bf4ee24ef0d258fe
>
> cheers

