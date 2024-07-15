Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 436559315B4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 15:26:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=FPhMC7WN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WN2zc0yTrz3cYh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 23:26:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=FPhMC7WN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WN2ys2kwpz30Vk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 23:26:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1721049962; x=1721654762; i=markus.elfring@web.de;
	bh=vPG94mdyUfScDU9XjxT9wJHj1nF1OhhTm8LfdKYGKyU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FPhMC7WNWXRG6/KRhtLMZqsNR8fkpYBAOtAqiD2JYjG6Z5+lPP0zAIWn1gmPUZtQ
	 ff3Owb0YrUcZXjJQ2T4IKN8Y9PAEfR/QBqJDgPEUecZKloywMaAG75Qeo1NogJPBB
	 b/LgzsnrpufwffAGOmn2zYeEM66gHCxjXPVlp533/+uSrud49Hy8xaH0hMqEzfNFL
	 25JumibzR8IjPdLGNFJcpQ2E0HK9xiGKohflxbikNqtcfhnpzIVvDYfTJvadURgR2
	 EisfGRb2pW3ZbVYVO2qAOxHOwedsSBY/UrxFiZvcCnp2of4Uc8r+ccfoCUHpWtKhL
	 YpBQnsaUQqMQk21HKQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N0Icn-1s6kgV12v9-00xrqD; Mon, 15
 Jul 2024 15:19:00 +0200
Message-ID: <6c50de6d-7f35-4427-bd11-5f02f5e90c08@web.de>
Date: Mon, 15 Jul 2024 15:18:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: make24@iscas.ac.cn, linuxppc-dev@lists.ozlabs.org,
 kernel-janitors@vger.kernel.org
References: <20240715025442.3229209-1-make24@iscas.ac.cn>
Subject: Re: [PATCH v4] cxl: Fix possible null pointer dereference in
 read_handle()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240715025442.3229209-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:60AT5T8BRZHQ6Gfv9u427isOzaT1ol9JQSTUXVRY8R+RWiR+wlg
 uOOY0ka3OvtSIcX6lXp4OgDSPrJFLe03Ofze5Hs3wM9Z9IePcr3uBn+DZP1YpGcBh3A49id
 zatBnGaU1zQtqqXMksLXbjlMe4ZRKgt2qtbHowpg44jp0okSPQESB/hzUIbO43MhyUft7NK
 S3n1WF9VfhlErESXakadA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:K7ra6wQy10A=;giorSUE2aWX82OA1UluuoMt1TXj
 lg5DNCn3MS+LTr8P6rhoSxHRxCmJrvVQDAQqkVMHni2FcJYiE0WMgz5MzMa93vYEocxUR3loP
 wDYVooJbgNxtmqYI3kYbM2/jDOlMw6eYKsnetWIkQqeJK898KOwBwHX4pxl0+gdliG9LAaT2J
 xGKYquyJqhCnfYi0fV5xyfLx9BE3MmOeVXVuN3XN6czgtjsv0udfAnuVM2hH/CX7x92sy7SMh
 GAdNoOvruFT1uxHKY1pHlLdLYBVvqphT3f8t8Pf74w44eCBn60SDf+Q79/2wc+1Ce02U3Xk/U
 UIKsew4IUs8D0QnbJ5TT1Vv2Nr4RA+6p517f2cb0dys5nEOefys+s/gAEeOQVICb4D66He3fI
 ckcFoY0u7a35WuoLQn52cfzxM5AdJiJQ4InpyraZjLB94DLhDKt8Pn9zXyqLmw54yfKHtCSV5
 fsfg0aCbaKa5FPfQB/4g3GJ8ACMDiVSG4H1gFyMskHwndp28BhhC24ryHi74IAnlUPFikQvRu
 dmYZktfjxPBQg9PwQY28L4+f7fUj9QKRqqQWvhoI2ElpyRilmP8vWjrjwVr+hWvVBl3ySmXM4
 j730QtL86j/rq5y7LwUS3VwCyIpZi6W9gPBaUvUVUuvXYl3CHEqSPX09D6nRbElPP6aCuyRyk
 gve3+JulQQDCQXV4pqlPIixfiWBJQLWydKtk1Gg2DXJ5Cov8j0UDwmnRzkONE0EMVmkO+0n9D
 m8tZZWj/AfmYutR9T5mmUQFIlQzLx+AnHJHJrrJruvQOnLD7xrXcSvG4QdgcNJMeMTNbbYJso
 BBZDQ4eKZIvv/ERdiz3uBF5A==
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
Cc: Maxime Ripard <mripard@kernel.org>, Wei Liu <wei.liu@kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, Aleksandr Mishin <amishin@t-argos.ru>, Frederic Barrat <fbarrat@linux.ibm.com>, Shuah Khan <shuah@kernel.org>, Ian Munsie <imunsie@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> In read_handle(), of_get_address() may return NULL if getting address an=
d
> size of the node failed. When of_read_number() uses prop to handle
> conversions between different byte orders, it could lead to a null point=
er
> dereference. Add NULL check to fix potential issue.
>
> Found by static analysis.
>
> Cc: stable@vger.kernel.org
> Fixes: 14baf4d9c739 ("cxl: Add guest-specific code")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>

How will interests evolve for caring more according to known research
and development processes?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10#n398
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/researcher-guidelines.rst?h=3Dv6.10#n5


> ---
> Changes in v4:
> - modified vulnerability description according to suggestions, making th=
e
> process of static analysis of vulnerabilities clearer. No active researc=
h
> on developer behavior.
=E2=80=A6

Does such information indicate any communication difficulties?

Regards,
Markus
