Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FFF8258EF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jan 2024 18:20:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=w41Y8yUz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T69Fp11fgz3cT2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jan 2024 04:20:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=w41Y8yUz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T69Dy0g8cz3cMH
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jan 2024 04:19:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1704475159; x=1705079959; i=markus.elfring@web.de;
	bh=c9a72mh2hIDNLywI3xHSiIa41+RUwXrfonhkfw8ihFg=;
	h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:
	 In-Reply-To;
	b=w41Y8yUzzl7L3+IINq8nygYzaZVDOQ5yRxV6AZdvboQ6r9yPwsuCJxyYgql45lrr
	 l8iQ/Z3ZLXiDdWnwr/3zvRk6E7sjZpK27oxnj3HjupD3h0EJb1qVOjiaL96jFxB5H
	 bcSFVj80MZVrxcxOGv1KmRjw/dBYMIaFhVLSBtmDzzLQGARw/vd8+xI3HJttZF661
	 tQee9IGBjRkEeNE5oQl319v3sQQx5vd87k7K8k3jbAi/CL6mOnWrMCo/0QxJsvMyL
	 8gA/Wmvt9XahNUz6rAXub44CxNXolu5x+btyt6z74FOKmYmT4IiQrkDEZ523i3ypv
	 +uMhc/lwPWpal+sCnw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPrPT-1rZsUG1vlL-00MhqL; Fri, 05
 Jan 2024 18:19:19 +0100
Message-ID: <ac431904-993a-4c43-a54d-c183b08b7874@web.de>
Date: Fri, 5 Jan 2024 18:19:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH resent v2 0/2] powerpc/pseries: Fixes for exception
 handling in pSeries_reconfig_add_node()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <0981dc33-95d0-4a1b-51d9-168907da99e6@web.de> <871qln8quw.fsf@linux.ibm.com>
 <a01643fd-1e4a-1183-2fa6-000465bc81f3@web.de> <87v8iz75ck.fsf@linux.ibm.com>
 <2f5a00f6-f3fb-9f00-676a-acdcbef90c6c@web.de> <87pm9377qt.fsf@linux.ibm.com>
 <afb528f2-5960-d107-c3ba-42a3356ffc65@web.de>
 <d4bcde15-b4f1-0e98-9072-3153d1bd21bc@web.de>
 <08ddf274-b9a3-a702-dd1b-2c11b316ac5f@web.de>
In-Reply-To: <08ddf274-b9a3-a702-dd1b-2c11b316ac5f@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fd0DEtRES4E/LNEVX/4GnP30EuZ7SbZmpQ0+c+lSzsJF09hqG+p
 PogCSbXrZbPvufXCVapRZNE9wk9BJ9El0JY+t4w8HAgsTEk6+404fOWX2YDbBz0+3fT1Ozg
 f9z2FVRsbdVL86A5PKSFOsws3EIGiRm61Qc9IQ+gKi7h0gfwbBqMmLbPTY5HAkrZ3wwwFUW
 3XuOttoKqOtWYLDq1er/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2ese3NzFQnc=;JA9Oql4YFmQCNSHqtztlSaK4GAq
 +fjthp9Vnvv9dESoVYKzh1FrY8Z/qHa3Jw2C5YmaPHUEtZbBwCyf9sR/Ll+Zm9mXGRIWQe9o/
 /UjuKok/SyzZO7FK3X7iQtG5+QnGddNp/39DzCjJdCDHX6DxK95aN6LHMHqFG+yA8mzebV1j4
 DDW28DBcCM6fCIu/Zl0lf2di+c+47luBKHq5Fc6UAK/cqaB7pq+x+2UvnLcXk1RQHy4D6Vj7b
 0VL96ug72UMDfQrs7HoWBpOyleG8AP156TnGGGlNcnfCJhnl0CnbDx67tkhKmimlLyA4vtcXL
 Ij7TzXHpR7VugLIerNgO+BTelyt8S6qDvWn9rjebFvy7oSKyAhGxmcKvzXPZBi0rD7f7EKK20
 AfPyroG+x86lfOLFLLKOa60lWip2/kGoYn2vM/38qRcxPYSq4M0rEHy14h4Rz5h5CU6F3DjzU
 SPLVukFPjF85byQnZZkQRsnh1tYlQr4as0DOO2U69K31KJdFMzvknf8fNSC0BElk1jz0ud7dJ
 4OAgjrqcW2w6p9T5pOCCRJgyxpdbsoNov691is66TJ1tjd42/N7pWSonNYIPSrQDATRilWr40
 CjEJRFPV3/2M90D+/tPviPmSCQJghrBW4ncWNAfqgm1IcLMnuQXRfVUx7BzFfJHuTCWSxJqje
 zpeOYgINfnxVrtZfFh364t36ZWK8eAi2bxY81WzAaYPYzwF/bIpWS9C3H/sAeckj1YRzhFnmD
 Ezxz7hwyVZyEFWmtk76AojgAIPDMSGo0yT3v1Z6OffUxdfotJQjwLl+YIwfHtPzBe5S4rlxiH
 nKWJHk2X8RZ471iToxQGj4/hIesJjKmfQMdeO9wD27oK9L9lFVEoPrxq4eyFMqBhH62PqJ7e2
 9eRmjd3Fj50LIov224u9ZHL0TGpLqASzoT0t+THqJOZ8nF3UOHDP2NrclAQw5fF2YY7BGXPd/
 y0UBkVBoV8GM2hlKh3H9t52bdHY=
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

> Date: Tue, 21 Mar 2023 11:26:32 +0100
>
> A few update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (2):
>   Do not pass an error pointer to of_node_put()
>   Fix exception handling
>
>  arch/powerpc/platforms/pseries/reconfig.c | 26 ++++++++++++-----------
>  1 file changed, 14 insertions(+), 12 deletions(-)

Is this patch series still in review queues?

Regards,
Markus
