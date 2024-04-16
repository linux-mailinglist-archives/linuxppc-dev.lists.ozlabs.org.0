Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FFC8A6D51
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 16:06:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BV+rQywq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJm735PKGz3vYt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 00:06:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BV+rQywq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJm6G1nNfz3dJ0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 00:05:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1713276319; x=1713881119; i=markus.elfring@web.de;
	bh=ICGpHm/MlVMTN5tT+yT0ALzoCJj/Nv+iChNyAF6Crfg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BV+rQywqAIdxBH0umDEn8bvGjPmvmzSqAzrxbTbKpM3uXumbe6gcX7CTQWSP5t56
	 1YTSUpLCG0Qkdr5GcTCA8zLZjfpbU6p4mrszRpAZvRYSM9VOYa6+aaGMthQCEfzq1
	 koDp5MNSqr1caICyB/lrzzdxDhdd6AJ66FSmF9Sah7Ukq0q7UR81HR0MRBd8WNzEo
	 gIMMx8Kym/SaK6vj41JHkIPZEe3fEg9mr9PWEQUO6ZymdHSNcktb0sNgMLO2yy5v4
	 RT5Wsby/gtVRlr/I9x7umdiBOZyMHWo/x4B5pcT0C+O7S02wDDOY0ze6WRgX8a/UW
	 Gd/U5HLtEwtpoYY2xQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MTOha-1sJwDz34d2-00Tmq6; Tue, 16
 Apr 2024 16:05:19 +0200
Message-ID: <d5304d62-0472-4d04-8727-9e9c88eb0533@web.de>
Date: Tue, 16 Apr 2024 16:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [0/2] powerpc/powernv/vas: Adjustments for map_paste_region()?
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 kernel-janitors@vger.kernel.org, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
References: <7be66990-de9e-488b-ad6d-fafd1c7bb34c@web.de>
 <ee6022b8-3aeb-4e6e-99f5-2668dd344e0a@web.de> <87plupbm0c.fsf@mail.lhotse>
 <795ca003-4231-45c0-8bb6-178597950fa5@csgroup.eu>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <795ca003-4231-45c0-8bb6-178597950fa5@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ORHzTV9JjHAw4zTbjE/EZ77vq6Kp7tJZyO1LnF5YwH3Wm4B8mFK
 9CDJOEyKMNgNsdIz/BIs81MLc1apFVK4NmG3Y3ATeJNBaNil7jjERn3Fa5wqGOqCl1KyLRz
 1VhgPaKUTJApamxerdglA5aKQf9MO0QMuQ4vq3mqg8TxdzwYK6lbYLIy5HkG2L7U1m1IqfH
 DufMlLVpDYZJHAnW7MGgA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8bmhXE821EU=;0UoJ/5dv4u3lZzMfraFWbbkbMm4
 yeLO+yOeHL8YDFVOoNZgpij7RieJG+s7gkXK8aVZl/ACsMiPzoWF6m9Q6p4yZIYALncj1ACJr
 b/jCDP5O7arA/0kWG1R9vkkk+gJJgnU4PdAAtF05ygVx2jVuAFLupnLWpWIs0Pz3Ao1rSp8kK
 +dhuc3Avvp3hGe0AVp8cWXSPE7MOs7Ena1oB+RQuqcVNmNOHGhfMb1l1FVxNr7wya02Cqyb7+
 tHblnwm2E4tKis7qlwrWw/ykWxA7kK2DdLkFBMSKdI47fVaVe1HQ0Q4QUxSmPEHmkfmsCEEiV
 rARvo0HpbOeLpB0vDIICHwyNXizQosGq7K6VTECIL6CWWqgfs2CAVnWbDkJyA+SYscuxwqZmp
 khLfnIKB47aF5iKpcA0/QKUv7cD1L+m6khtXn+2Ku0A6pAiiabNBg6u7DpevsGtIrwtJsnayT
 X0EN0pXxEKg9zWZUXbKEDtD+N5WszzdTahq3di3KRZM6xyO4XTJrzb2MGzQpFzLJuR3VT8MqS
 k7kOszx53xL+KRmWWHPShcZCA+CXucKeJ45bPcQmmYIOgN4Lrb8nG06tr/CJj0W+4sn2HJt7m
 Lb6LxrVFzUuEMV6X8npgq3XiT+TpFx81Ub+gGIW1hRtRuorQ6s4vcrYGM8bvDb5jaDcVnCOb0
 82Gpb0XwbudgMefEwunIqKhZhjhCN4CAHXStzYnZbDVjrlTD67B1YnQC8bQM8wsxBNKJ58Orm
 S4/VaoolUyjHNln2SBzYY905yLLKLXGztuakPb0Oe82JLKIADcaOrKFiA7AQhBHJ6Zp9ZCmS9
 f0GMV4Ue3Od0b5P/OxGxRmcyWbD9US4g/kmJvGmMjsI5E=
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

> Looking at that function, I however see a missing region release when
> ioremap_cache() fails.

Under which circumstances will the exception handling be completed also fo=
r
the implementation of the function =E2=80=9Cmap_paste_region=E2=80=9D?
https://elixir.bootlin.com/linux/v6.9-rc4/source/arch/powerpc/platforms/po=
wernv/vas-window.c#L67

Regards,
Markus
