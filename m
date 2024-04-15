Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 745248A495C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 09:50:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=iBwpdq/R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VHzqC1rhWz3dRm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Apr 2024 17:50:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=iBwpdq/R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.14; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 340 seconds by postgrey-1.37 at boromir; Mon, 15 Apr 2024 17:49:34 AEST
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VHzpQ1PJ1z3cRd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Apr 2024 17:49:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713167355; x=1713772155; i=markus.elfring@web.de;
	bh=Ehw3JP9/jH11oJR68DQOEghJBea6xoCh7eHWITgqHRM=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:
	 In-Reply-To;
	b=iBwpdq/RO58ICbaUPRRSA5P5ZLc4xyuONdOC/5En/PYU3A4y45FsuO7D32qI9o7F
	 vQSkClUlYOGcWjGmraIVWnlCIVGPL7Nb/eK7FsoFfhTFt+haURvGfyxWe4H0iUkSL
	 bZdlF73hB+UEALaPjejDBDtgF3eb81VTiSQzneWAAdPxy0zffLVWieIrtVqeWwR9M
	 sP6rnsnv0WV3nCT9nLDL1P37W7SkgVp90ZLDTv0ftebyJ9ZIvZel1h7xxeAFogm4J
	 ySfdypimUqwi4Q6heZyz6yu0Ne1GDVKq9taJkOo/k+Iq5fRYXt896CMLc8AEUmRqj
	 PLNkaAVCzhGhOdEhbw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.80.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MLzin-1sE4zj2557-00Hz6h; Mon, 15
 Apr 2024 09:43:14 +0200
Message-ID: <ee6022b8-3aeb-4e6e-99f5-2668dd344e0a@web.de>
Date: Mon, 15 Apr 2024 09:42:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [0/2] powerpc/powernv/vas: Adjustments for two function
 implementations
From: Markus Elfring <Markus.Elfring@web.de>
To: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
References: <7be66990-de9e-488b-ad6d-fafd1c7bb34c@web.de>
Content-Language: en-GB
In-Reply-To: <7be66990-de9e-488b-ad6d-fafd1c7bb34c@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:clWA/QkEMk1zwMQrfsyv96T78gaWC3LvgzWJUo1bf0wfhW8Ib83
 dTf4utj1Tw3KMQwJMwkvi+LGtQt2GBBMU6UbPuBwVyePLDUe3W71tPDnKSa9VsvT3sqgU2D
 caERPxmHaL4CoVKIpUQiXoj+F2s2abtVqYEeEsw4j8HcEgYEFMKkhherMm4g5b+S9nrXboa
 OH2uBab55WhqqaOsclLAA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XDGvqtlbsvw=;clok6l8u7F4e0BKTPzsmYyV60Cx
 7MxfXEqWOcKc7FswsTSQ4FAY9hIfdAXPmkzH8pAngwkyaBwB04EFbVSxQ2CuS71g+K5FNxIh7
 4gISIXZ1CkoJaFRwrsnfc9hUmYkGB/xA0WQQpWm/MqYH0nBm6Nrv1cpBSMSA998ZO+lxdinAo
 fXEzlwTIRXSxS7Fi826RQrPY5VQuhoaaDS9zCEHQZ02G6z3RtiUOFiX9xEh4ZR3W2Y+8F74bu
 JQ/7okl6l9GnlPw21wCK44UtKshQ8RUkcAVCyFoSTQQuWQONYiOV4F6qcd5G9hgZh/jreJZ3n
 cJ7m8uyDSd3RTTXm9KNgexZf+mqoPMFEg6oxVCUf69+tP9V7/yxLVGu/OMVo3O4DaJGt5QDod
 X+6KUwGdP1N5/37IKUayGR5TKWFN6OYRISaGsgFBDBJMNpakRaN8ifLPG25VSSi1aujQFq85L
 xcVCdUWQzKf1nAHKPxkvSmLcUv403IxBT1cD3Gaa2NKQjmDG/MRTZ+HPuoIb47qR8R85ERFmT
 LrILgHfWThMWBMS6S0viMPM7A4BaMfbsRSamNgmT71rz7gfbj0MUml/QJgEG0dYodz39EM39U
 XtQgQ/hJf+D4cvQ2pvZ+xhrfpzpWJ1HToH3hb1BjdY8wJCnVjgLoGlOrXo9vIlRysz74iOgDv
 a9ejOenqdQ0GRrVudb1xryuCZetlQe7CkI12WsJMwH7SYmTb/HMVPn2VLFp+nm5b33KeUmEv1
 F4QTQewWadtwsZeV2vO3a1anBcReyZZa68xBnYo/5W33yPCWoU61s/kys7p61t/ooWsr6/Vy5
 bHJ41N/W2D/FdkdC0Rr39+9WgtI8ZxLVTNiV+kXjIXO80=
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> A few update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (2):

I would appreciate a bit more information about the reasons
why this patch series was rejected.


>   One function call less in vas_window_alloc() after error detection

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/1f1c21cf-c34c-418c=
-b00c-8e6474f12612@web.de/


>   Return directly after a failed kasprintf() in map_paste_region()

https://patchwork.ozlabs.org/project/linuxppc-dev/patch/f46f04bc-613c-4e98=
-b602-4c5120556b09@web.de/


>  arch/powerpc/platforms/powernv/vas-window.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)


Regards,
Markus
