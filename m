Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B3854EDF3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 01:37:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPJWC1xnPz3cFW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 09:37:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e+FtTJHd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPJVZ32cbz3bm1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 09:37:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e+FtTJHd;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LPJVX2vwnz4xYC;
	Fri, 17 Jun 2022 09:37:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1655422629;
	bh=5ZijR6qhFWh0lRMpvzqsTTnbgZItQhaW+1KLIE/u2wI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=e+FtTJHdDti39wtJq9ITPB9zrxjfh5agOaV73vFdXYjyub2PNJy7K3h84ileNQrsU
	 VF0EYukCElU6zzhizqVlHUA0NhQ2EOqMhpqzID2DSqQbIetjUeGMshLohNpTbMxwg3
	 pIhyr992cx1vYgNvwRYTQlDYMTEnHn4+ArgixcamUwMs6kbdrwVm9fi/4TPDZfvTv8
	 FYfVMWb6ymNLGj5qsiLVMIL3czDzlrTF49XaAaUIjg5m2b3DaZRKmlFjuK3dE67HZ1
	 CiNyic4V/ZpwZ7JZuKr7SG1VjAg/UulvpLHcTYJ2giajTX5IyAs2ijafC+aj2cBz7a
	 +4GHrqo6+gw3A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Liang He
 <windhl@126.com>, oss@buserror.net, paulus@samba.org,
 christophe.leroy@csgroup.eu, nixiaoming@huawei.com
Subject: Re: [PATCH v2] arch: powerpc: platforms: 85xx: Add missing
 of_node_put in sgy_cts1000.c
In-Reply-To: <bc6eaf7e-ff88-9b82-eae7-7e6902c33a10@wanadoo.fr>
References: <20220616151901.3989078-1-windhl@126.com>
 <bc6eaf7e-ff88-9b82-eae7-7e6902c33a10@wanadoo.fr>
Date: Fri, 17 Jun 2022 09:37:06 +1000
Message-ID: <87o7ysb2ot.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
> Le 16/06/2022 =C3=A0 17:19, Liang He a =C3=A9crit=C2=A0:
>> In gpio_halt_probe(), of_find_matching_node() will return a node pointer=
 with
>> refcount incremented. We should use of_node_put() in each fail path or w=
hen it
>> is not used anymore.
>>=20
>> Signed-off-by: Liang He <windhl@126.com>
>> ---
>>   changelog:
>>=20
>>   v2: use goto-label patch style advised by Christophe.
>>   v1: add of_node_put() before each exit.
>>=20
>>   arch/powerpc/platforms/85xx/sgy_cts1000.c | 27 +++++++++++++++--------
>>   1 file changed, 18 insertions(+), 9 deletions(-)
>>=20
>> diff --git a/arch/powerpc/platforms/85xx/sgy_cts1000.c b/arch/powerpc/pl=
atforms/85xx/sgy_cts1000.c
>> index 98ae64075193..e280f963d88c 100644
>> --- a/arch/powerpc/platforms/85xx/sgy_cts1000.c
>> +++ b/arch/powerpc/platforms/85xx/sgy_cts1000.c
>> @@ -73,6 +73,7 @@ static int gpio_halt_probe(struct platform_device *pde=
v)
...
>> @@ -122,8 +127,12 @@ static int gpio_halt_probe(struct platform_device *=
pdev)
>>=20=20=20
>>   	printk(KERN_INFO "gpio-halt: registered GPIO %d (%d trigger, %d"
>>   	       " irq).\n", gpio, trigger, irq);
>> +	ret =3D 0;
>>=20=20=20
>> -	return 0;
>> +err_put:
>> +	of_node_put(halt_node);
>> +	halt_node =3D NULL;
>
> Hi,
> so now we set 'halt_node' to NULL even in the normal case.
> This is really spurious.
>
> Look at gpio_halt_cb(), but I think that this is just wrong and badly=20
> breaks this driver.

I agree, thanks for reviewing.

I think the cleanest solution is to use a local variable for the node in
the body of gpio_halt_probe(), and only assign to halt_node once all the
checks have passed.

So something like:

        struct device_node *child_node;

	child_node =3D of_find_matching_node(node, child_match);
        ...

	printk(KERN_INFO "gpio-halt: registered GPIO %d (%d trigger, %d"
	       " irq).\n", gpio, trigger, irq);
        ret =3D 0;
        halt_node =3D of_node_get(child_node);

out_put:
        of_node_put(child_node);
=20=20=20=20=20=20=20=20
	return ret;
}


cheers
