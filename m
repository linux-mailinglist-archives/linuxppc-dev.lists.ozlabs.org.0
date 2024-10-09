Return-Path: <linuxppc-dev+bounces-1867-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 204CD995EB9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 06:48:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNgQB5jRBz2xxr;
	Wed,  9 Oct 2024 15:48:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728449330;
	cv=none; b=JPr4hQxTIGY8fLHGh+JoQVAxMr5Z0akhmbJAvC6j9KVq9CpG7fPw395UPS/IjN+vJChrc60u9gyta2j7dsXnweZupt+HSceDQ1116sj2w/Iyf6bTgjNR60q/ARr0I5umjJjvf1caC71ZXeYUvQ/HCvI7YiaQUf5YJn3YI6maSQH/aiCNFc7kfYTDq+bqdJEQ/WlBLe/V4hzc3kXzmMkukOMMKpweVLKHJ0YZfCC8rdXfaOJS60KUVLEoocLVE1Wuzod7b1BCr3mNsF36ZTNgb1TTcC1RZ4r09BHAIi5RR+jG/L8JL2dbvDA8E0WBBiaRNtZ6Br7e29b7NHhT3zzWnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728449330; c=relaxed/relaxed;
	bh=uMgzHaq2PtarSf76t5H+hReShTblmOAvj1JQqJCeCbE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=de3j7Ygqu1RQursRBI8pE+OLsWihDCX2QJX+XPzRGxOcx0eFPVFN1QTTLI9bFQbrFruHKl8O5cCLUJba/8pctVtNDjA52/N8Go5DSPehgietPFIhouDdrtHDP2WWTuqqsULgN0+1XRT6nVlOqyr9wx/SAq3WWmsDcFyznCenEgVx03iwRUMnt1EAAefdt6CmPvGeq7L5amabqX0bNqefTjV1XyZ+LSGNsCA5SZyvV0k0zQuxvfMjjBf26ZP2To6iaFI3T9T8Slrqa3Yq2KtfmWirvGFZUnXKb2Z1s8Hg96lPM5KGPh4G1VyuZCkIyTr/z+Ax49q7f3O7nzVlYCa4Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=h75XvDhq; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=h75XvDhq;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNgQ83zqgz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 15:48:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728449323;
	bh=uMgzHaq2PtarSf76t5H+hReShTblmOAvj1JQqJCeCbE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=h75XvDhqBZJCnvzjFqZfVOueIrPpfavGyVgtKj2u9a4OeIBCKTJ1gCp1xj0+BlxwN
	 ppV3gFWMmkaE9WJADlMOSdGAzC0EvDtwYpNRMM+/Uqw2uaYzZiQ1j0H6zaNYFa7ja4
	 dFSXpdOx5zt6SD0+PtNop/4heFxNFFFqrgbDiMlocS7AQBran98c25ltHeeI7EUbQx
	 Rnwim5/UJ1n0vAHHQC3H/OIvDpTyPFbZst1zF0GzvUyU+DPAurJn0cD4tiUWcNe19d
	 4VilVP5dJ5O+i5DjI9DDI+nKbp/Zdp1ePAKAM0MDxxr+BlEChLl6sd04rR7PGV6/ks
	 TQvSqrdO6kvyw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNgQ21zPlz4wnr;
	Wed,  9 Oct 2024 15:48:42 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Markus Elfring
 <Markus.Elfring@web.de>, linuxppc-dev@lists.ozlabs.org, Jani Nikula
 <jani.nikula@intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Naveen
 N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Paul
 Mackerras <paulus@samba.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] powermac: Call of_node_put(bk_node) only once in
 pmac_has_backlight_type()
In-Reply-To: <d9bdc1b6-ea7e-47aa-80aa-02ae649abf72@csgroup.eu>
References: <b7e69e04-e15c-41ec-b62b-37253debc654@web.de>
 <d9bdc1b6-ea7e-47aa-80aa-02ae649abf72@csgroup.eu>
Date: Wed, 09 Oct 2024 15:48:42 +1100
Message-ID: <87cyk97ufp.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 02/10/2024 =C3=A0 22:02, Markus Elfring a =C3=A9crit=C2=A0:
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Wed, 2 Oct 2024 21:50:27 +0200
>>=20
>> An of_node_put(bk_node) call was immediately used after a pointer check
>> for an of_get_property() call in this function implementation.
>> Thus call such a function only once instead directly before the check.
>
> It seems pointless to perform a put immediately after a get. Shouldn't=20
> of_find_property() be used instead ? And then of_property_read_string()=20
> would probably be better.
>
> Maybe you can even use of_property_match_string().

Yes that would clean it up nicely I think, eg:

int pmac_has_backlight_type(const char *type)
{
        struct device_node* bk_node =3D of_find_node_by_name(NULL, "backlig=
ht");
        int i;

        i =3D of_property_match_string(bk_node, "backlight-control", type);
        of_node_put(bk_node);

        return i >=3D 0;
}

cheers

