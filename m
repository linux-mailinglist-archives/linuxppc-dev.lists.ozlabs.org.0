Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC01B4CEF01
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 01:45:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBfrY4HmZz3bZy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 11:45:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qq8XYFK1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBfqv3pzCz2x9d
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Mar 2022 11:44:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qq8XYFK1; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KBfqq4n3Yz4xvS;
 Mon,  7 Mar 2022 11:44:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646613897;
 bh=Zrj9TMcWdU7THoCQHnaeXqpNo4y/97gTHAtSAYR8WUs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qq8XYFK1jPdW29kMUi916JbqjClAoIq1X3XarZugcoOx4qgKhbLHhvrnSozRf4eK1
 qdBV0ra07kTChRVdCfpZhtp1Vqd+w04yo4KneXI0GZD7ztDMSxNrYZUL6QIpZGmqiE
 frGxrFspU9JlMQ20UoqvWxrMxMHIOLjJs8s2b7JNjX91E5WduuwHDHkhuSD6XlCE6u
 lCnGTkeK9lb39w0+dLyGhWmkZEikqsOnFSfbPl33YlUzjSFXnFIgAqfnjW0bifR9Km
 fxuOd3RYBCwJQ71QWsIOLUmNvOaD5iV08nlPXKf/V6DKsO5Uf1pXyjPbTg7N0TsGwN
 GMnhRLYMLgylw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Marc Zyngier
 <maz@kernel.org>
Subject: Re: [PATCH] powerpc/sysdev: Use of_device_get_match_data()
In-Reply-To: <4d569f2f-7c56-e5a0-e9e0-981cbca21468@csgroup.eu>
References: <20220304011830.2061591-1-chi.minghao@zte.com.cn>
 <6481b730-e338-294d-3602-bb899654ed2b@csgroup.eu>
 <87o82l23rb.wl-maz@kernel.org>
 <4d569f2f-7c56-e5a0-e9e0-981cbca21468@csgroup.eu>
Date: Mon, 07 Mar 2022 11:44:55 +1100
Message-ID: <875yoqoak8.fsf@mpe.ellerman.id.au>
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
Cc: "cgel.zte@gmail.com" <cgel.zte@gmail.com>, Zeal Robot <zealci@zte.com.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Minghao Chi <chi.minghao@zte.com.cn>, "jgg@ziepe.ca" <jgg@ziepe.ca>,
 "paulus@samba.org" <paulus@samba.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 04/03/2022 =C3=A0 15:26, Marc Zyngier a =C3=A9crit=C2=A0:
>> On Fri, 04 Mar 2022 13:10:19 +0000,
>> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>> Le 04/03/2022 =C3=A0 02:18, cgel.zte@gmail.com a =C3=A9crit=C2=A0:
>>>> From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
>>>>
>>>> Use of_device_get_match_data() to simplify the code.
>>>>
>>>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>>>> Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
>>>> ---
>>>>    arch/powerpc/sysdev/fsl_msi.c | 6 +-----
>>>>    1 file changed, 1 insertion(+), 5 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_m=
si.c
>>>> index b3475ae9f236..9d135bbb30b7 100644
>>>> --- a/arch/powerpc/sysdev/fsl_msi.c
>>>> +++ b/arch/powerpc/sysdev/fsl_msi.c
>>>> @@ -387,7 +387,6 @@ static int fsl_msi_setup_hwirq(struct fsl_msi *msi=
, struct platform_device *dev,
>>>>    static const struct of_device_id fsl_of_msi_ids[];
>>>>    static int fsl_of_msi_probe(struct platform_device *dev)
>>>>    {
>>>> -	const struct of_device_id *match;
>>>>    	struct fsl_msi *msi;
>>>>    	struct resource res, msiir;
>>>>    	int err, i, j, irq_index, count;
>>>> @@ -397,10 +396,7 @@ static int fsl_of_msi_probe(struct platform_devic=
e *dev)
>>>>    	u32 offset;
>>>>    	struct pci_controller *phb;
>>>>=20=20=20=20
>>>> -	match =3D of_match_device(fsl_of_msi_ids, &dev->dev);
>>>> -	if (!match)
>>>> -		return -EINVAL;
>>>> -	features =3D match->data;
>>>> +	features =3D of_device_get_match_data(&dev->dev);
>>>
>>> What happens when features is NULL ?
>>=20
>> I did jump at that one too, but as it turns out, it cannot happen, by
>> construction. All the fsl_of_msi_ids[] entries have a non-NULL .data
>> pointer, and you only enter probe if you match a fsl_of_msi_ids[]
>> entry with the DT.
>>=20
>> So the current check for a NULL match is not something that can happen
>> short of some other bug somewhere.
>>=20
>
> Ok.
>
> Then it would be good to have a sentence explaining that in the commit=20
> message.

Yes I agree. Too many of these cleanup patches assume the reviewer is
intimately familiar with the details of the new API/helper and don't
explain things fully in the change log.

The helper is:

const void *of_device_get_match_data(const struct device *dev)
{
	const struct of_device_id *match;

	match =3D of_match_device(dev->driver->of_match_table, dev);
	if (!match)
		return NULL;

	return match->data;
}

So as Marc says, if we're in probe then there must be a match.

IMHO there should be a check for match->data being NULL. Although the
current match table contains a non-NULL data for every element, that
could easily change in future (although this driver will probably never
be updated).

The forward declaration of fsl_of_msi_ids should also be removed, as it
will no longer be necessary.

cheers
