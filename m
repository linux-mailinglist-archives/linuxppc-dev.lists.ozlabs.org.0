Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3354480A2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 14:54:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hnszq4hrKz301k
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 00:54:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lhNF1fhu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=lhNF1fhu; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hnsz2666cz2yPp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 00:53:48 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id z6so327654pfe.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Nov 2021 05:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=aQlnVxmo712dFkx+xG8KrJzAPEJl7/H7kztYpxtdiFg=;
 b=lhNF1fhutAQPzlrcS0EsB+iY5+oTFlf9CuNK62ccB4bpRV6mObYkOZeRXtOOuEWVU7
 d0RXo9lUgqTls6YUI4i2D5wAmbw7PEwiTXbuLKLtQlCFBC/zYsHUHu2t0VsA2mS+j+Ly
 0mC4WwAI082Z6BSywIqroNM/M1VbwG0S5iOPLfGC47sDONz+lunkWnFn6jr9MANgKsbj
 AZap0WIyfxYRgZpaCC8wpBEa/YGCbUvNwrCguA5tC9G2FhhaB5TEMDs2UhKyBaBcZcP4
 sUaLqU+JMGos7zmzDvr5MmOTllBLNOs5Nqj5K58fi2EM/KVwE5FVfoQyi0E+lyPDHszY
 xcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=aQlnVxmo712dFkx+xG8KrJzAPEJl7/H7kztYpxtdiFg=;
 b=jC/WSoZQu0cp248TYMSmuNwEOErvnEz6588TPu//M7MZRCgRNTdKM1wUuw8OI/Kb9L
 3IbTGx9YjNNpnNxBnZd7qdvOhc0rX1fTzLVnACYqTdXuYJtmVNkAgK0yqS8/NEs3L46Y
 lzDn8jdu+LQbl3ej5814+qwGe3ORnFexX1y57oY/5pzk0bf44lgs1ZaWn+LUf1/sL2AQ
 DXgT3JX+aqp8TuFtl/03bxZocGf2eJ+QLqf6Q2sVxY3XNe9aGAt7Mw3aYumrmO0swBup
 C22k3CiPs7ZVDBZ71NPBMOw0O7rmqxfZL5PAsmE+yVlIx3SK/5HBHJloGR0ek2bCRBFF
 i19A==
X-Gm-Message-State: AOAM530XHrj7N3S+8J2t23KK2QYiKU1r2Lha8ZJwL//fC8LX95EqznSE
 pEfq4nY6yXfOj2/JDEwcePIbenbXnJs=
X-Google-Smtp-Source: ABdhPJyLUvIa7i+SzlLovUWpHvI9NREnpT8GEKQHWSIx9zq++St26LB2K407VT+AFCXJqoHqEYHGRQ==
X-Received: by 2002:a63:85c6:: with SMTP id u189mr45896pgd.344.1636379623853; 
 Mon, 08 Nov 2021 05:53:43 -0800 (PST)
Received: from localhost (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id z16sm3585431pgl.29.2021.11.08.05.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 05:53:43 -0800 (PST)
Date: Mon, 08 Nov 2021 23:53:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/pseries: Fix numa FORM2 parsing fallback code
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20211105132909.1582449-1-npiggin@gmail.com>
 <87sfw76x5a.fsf@mpe.ellerman.id.au>
In-Reply-To: <87sfw76x5a.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1636379534.jahqi8gtfo.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of November 8, 2021 3:20 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> In case the FORM2 distance table from firmware is not the expected size,
>> there is fallback code that just populates the lookup table as local vs
>> remote.
>>
>> However it then continues on to use the distance table. Fix.
>>
>> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> Fixes: 1c6b5a7e7405 ("powerpc/pseries: Add support for FORM2 associativi=
ty")
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/mm/numa.c | 29 +++++++++++++----------------
>>  1 file changed, 13 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> index 6f14c8fb6359..0789cde7f658 100644
>> --- a/arch/powerpc/mm/numa.c
>> +++ b/arch/powerpc/mm/numa.c
>> @@ -380,6 +380,7 @@ static void initialize_form2_numa_distance_lookup_ta=
ble(void)
>>  	const __be32 *numa_lookup_index;
>>  	int numa_dist_table_length;
>>  	int max_numa_index, distance_index;
>> +	bool good =3D true;
>=20
> numa_dist_table is a pointer, so couldn't we just set it to NULL if the
> info it's pointing at is invalid?

Yeah probably could just do that.

>=20
>> =20
>>  	if (firmware_has_feature(FW_FEATURE_OPAL))
>>  		root =3D of_find_node_by_path("/ibm,opal");
>> @@ -407,30 +408,26 @@ static void initialize_form2_numa_distance_lookup_=
table(void)
>> =20
>>  	if (numa_dist_table_length !=3D max_numa_index * max_numa_index) {
>>  		WARN(1, "Wrong NUMA distance information\n");
>> -		/* consider everybody else just remote. */
>> -		for (i =3D 0;  i < max_numa_index; i++) {
>> -			for (j =3D 0; j < max_numa_index; j++) {
>> -				int nodeA =3D numa_id_index_table[i];
>> -				int nodeB =3D numa_id_index_table[j];
>> -
>> -				if (nodeA =3D=3D nodeB)
>> -					numa_distance_table[nodeA][nodeB] =3D LOCAL_DISTANCE;
>> -				else
>> -					numa_distance_table[nodeA][nodeB] =3D REMOTE_DISTANCE;
>> -			}
>> -		}
>> +		good =3D false;
>=20
> ie.		numa_dist_table =3D NULL;
>=20
>>  	}
>> -
>>  	distance_index =3D 0;
>>  	for (i =3D 0;  i < max_numa_index; i++) {
>>  		for (j =3D 0; j < max_numa_index; j++) {
>>  			int nodeA =3D numa_id_index_table[i];
>>  			int nodeB =3D numa_id_index_table[j];
>> -
>> -			numa_distance_table[nodeA][nodeB] =3D numa_dist_table[distance_index=
++];
>> -			pr_debug("dist[%d][%d]=3D%d ", nodeA, nodeB, numa_distance_table[nod=
eA][nodeB]);
>> +			int dist;
>> +
>> +			if (good)
>=20
> 			if (numa_dist_table)
>=20
>> +				dist =3D numa_dist_table[distance_index++];
>> +			else if (nodeA =3D=3D nodeB)
>> +				dist =3D LOCAL_DISTANCE;
>> +			else
>> +				dist =3D REMOTE_DISTANCE;
>> +			numa_distance_table[nodeA][nodeB] =3D dist;
>> +			pr_debug("dist[%d][%d]=3D%d ", nodeA, nodeB, dist);
>>  		}
>>  	}
>> +
>>  	of_node_put(root);
>>  }
>=20
>=20
> But maybe before we do that we can rename it, because it is really easy
> to confuse numa_dist_table and numa_distance_table if you don't look
> closely.

Maybe dt_form2_distances?

Thanks,
Nick
