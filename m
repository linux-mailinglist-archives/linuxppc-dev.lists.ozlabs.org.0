Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB012052D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 14:48:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rmKR1gsLzDqTb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 22:48:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=web.de
 (client-ip=212.227.15.14; helo=mout.web.de;
 envelope-from=markus.elfring@web.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=dbaedf251592 header.b=rV+QlZOD; 
 dkim-atps=neutral
Received: from mout.web.de (mout.web.de [212.227.15.14])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rmGW5JpgzDqTX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 22:45:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1592916323;
 bh=wZeKsBjYqwbsphXGlDIEV2mIF1HfcLK+v/WhnvkUt5c=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=rV+QlZODDElPKUt/DEVWGjgzY1ulPUTC/muQB97XJIkoq3tgV/NIcH1/r9ZNRzznO
 qQj6AR99Wbjwri66EOiNpaBeFCKnt9tztPYvJn6XpuqJlvsf+Adq34+u0i9VZ7geDJ
 HEIfgRCSXprtPtmzdxXTvHcD5v1CDJr2IO0rnO4I=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.105.198]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MLyCC-1jmamU3N3U-007izh; Tue, 23
 Jun 2020 14:45:22 +0200
Subject: Re: [v2 1/2] ASoC: fsl_mqs: Don't check clock is NULL before calling
 clk API
To: Shengjiu Wang <shengjiu.wang@gmail.com>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <39ac8f24-3148-2a3d-3f8d-91567b3c4c9e@web.de>
 <CAA+D8APR2NGAn9jRDSZzr1fgj5u0hAvH19VxZS+tj2A7j3PCuw@mail.gmail.com>
 <24be48d2-63de-b900-cec7-d21e83a89ca2@web.de>
 <CAA+D8AMSVCbJtcDoCbsMeV6ygrSdARpn3_PWE83mitcnkA1Tog@mail.gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <a2a5d4d7-748b-e164-09c9-13245b64b9cc@web.de>
Date: Tue, 23 Jun 2020 14:45:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAA+D8AMSVCbJtcDoCbsMeV6ygrSdARpn3_PWE83mitcnkA1Tog@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IW6xw4Oh/6fwz4+xqE2R2RDQ+woXbhCvtwX6iDCexDp7OcRNmia
 NsTx1XNMvlwvz8fQVX7vtTuhrLgVP8dCt0O1sNfOmk071rND3KePF6vTUdHzWBJAItPGCFQ
 MplFmdGPjJYCtT0HeSxvinmKlY6DJlnRspauGLU8un9QEZixPuCY7f3oDe+b1dH0lnLY5e2
 sx7WenpXdvMzqTvlL4LTA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xMWpbwgtIMQ=:nYWve4H8NKJIAGdhlYaBe3
 CVofffNYNFUUbwfybc5ghddxL7OfUryL/vNn1clWZTzV7HQjXCBftRVeOxfx+4O9ZmP1UkjCw
 V7qWKjwuVXxC2xYq2RYZQHktRc8cnlpq44OQx8CyL3Wzw/ppU3qpa0OXXuWWzTmidaub8zeEy
 iHDqfhnCM0NnXJbtp/DuMPLt7WRR7z9W4eDJlqnBU/nWwuOXMh+8G8XiGf3kpDzGZ5bkh/Lo4
 az5VDqisNTCeH5j06aU1UNeq9bnKfaxsWpdBNl4FDA04kbOud9hTK2L2dBawwdIQi1DPKpOIG
 /Z57dbUE/3npP2CdthTkjfBFG1msnlExj0ywlZvACUmJxLgnfEitU7thMYezTL05P892nROmI
 w9Bd5RfMOikaltjj7LLZeLBqPBidqBuMRJgmUKiimSi8+gRLRB8ksgeiO+3pgg9CWInS12h4A
 Mu/ULvJHNoDAZB/ZDMGQ0xceMOb85UwVZVnjdpBuo9rMSxZT6gXjua6AXMypXWQnL142D2dpt
 GAfcIBV7N26tVjBCh9bo08Hu07ZwW1HXDRuC5L9JYH2bBIDEaWOJR+BWK2wHRe9JK7Xuosgoy
 37AF/GXslHSlEe8xvv1Mq/mc1eH5Gz37S4NF5Z2Xe1q4c6gA6cG+qR3PO1YRMP4wBwkxYY84W
 eYoF1gwoVx2RaplP9Z+xMpSXpykzfOehynqmKFeYRqYuKuihBmsZrXwGQMwQlU5LkgRaiMDY2
 I549eLD1F0rQ33WK+6SJxjiYn+Yb696v5WkmJM/OeZPtOxQQtyq7oc3/m2SOBpBkUsBAvZ2ap
 IVNwOkRenWFSostS0v0fM3Ghs4eTTKuxVfBiLRKLItttGMhoNe4AZhzvpnfTILIm9saH8fpCp
 QAWRBHvjjPXURGkbb1WvhkcSqyeZ8/kQCCOZ5uleRg84KuQAfhhIK7HUAO+TGDB6Y0nlD+7dc
 qjWPpVI9pDyiFjF+s8LeV/cayXc7DqZG6nAW9lYW7PlENSqRTUtNslcb9hRfUB7gr7pcuk+fb
 UhOqTtr2+KtTAKT+OzDXftDHjzF7hoOxmrm/QSlJsEYRLBMZJLktA+rt9dLoT1v0fDSBGe32d
 YRCZ0YRKISQeoUjAgXIuV0K8LPfftnGxHGFmdcLNKr2ZPW2LoHqJdp334986g8QjzjERBHK92
 jSb8qfHHZVR0HO28jlfRt+EhXNKajyExguQ6GSTP//8hqmjd1y3HZqAsZ8SC5xmxsFQm2u8rw
 thpJzPA7Oav4sojXt
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
Cc: Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>>>                                                       if the parameter
>>>     is NULL, clk_prepare_enable and clk_disable_unprepare will
>>>     return immediately.
>>
>> The interpretation of these function implementations seems to be reason=
able.
>> Would you like to achieve any improvements for the corresponding softwa=
re documentation?
>
> Which document do you mean?

Example:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/in=
clude/linux/clk.h?id=3Ddd0d718152e4c65b173070d48ea9dfc06894c3e5#n905
https://elixir.bootlin.com/linux/v5.7.2/source/include/linux/clk.h#L905

Regards,
Markus
