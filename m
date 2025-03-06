Return-Path: <linuxppc-dev+bounces-6763-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D85D3A54DD1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 15:30:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7sJl1Ss7z3brR;
	Fri,  7 Mar 2025 01:30:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741271415;
	cv=none; b=n9oQK+7qw6eTd2L5oOk6VAiwuZbhUw4QqiGFR0gt50BE5A/HBh4AiI2XWVVfrPAZqgeEB2Cs2Fndmwo1fo9gO3gtCzuq3+3bbAAevBd/Ner8lbygjY/+1VKO6ETakXh6Iw7lH2AJoEXYoRmvV59oJ4a5qvS3/E06eYFk2dUqK8exM5IyFamoFt50MfGgIsoAhC518NRD7P+bamNqs3u7RAQ5LZXUxENtrNDjzASjScITYiRgy8f08xL2Fi4EQTcUzV8vOoqW0sd+nhw/hrz5s+kQQBeTs/Cr6FN3QsAUdiwgayFWPzj52LRdJ7Yak5actM08kOnNG1quRFDhyZEcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741271415; c=relaxed/relaxed;
	bh=+s8Sa65V/9ddeKgx8N3fRnLsd8R6GrlW9UDyXRKo1Ek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SVTemD4LGctkYjTnCM8CqffCBiuvMhglTv91UMKxongiKh3f+Su3DkaVl/quZYDXOTyYl43/57t/BkAw5UVdUxdmu1M4KyV/jHddA2x8wxqtYzDWAOTuY7S7ip4ksqsOFfX1EG61jajZUn/LCmvDIylNEdhGi1ELgSEXDN21pmuX3vzsTYBQsvWj4NF9AghRb/A8MPiPtt0D2vwH82+MuL8unZoFtY8zG2ggKYqGv2bMsLW5hbsboCwJzOY29kZbCwiugp+zcjci8mREKo1weTDYKuaixl8Yox9a+/YRpJrb/JckWU/UjUmkDNmzMJ+tg4TY9iyZmkiPsq8xFkkO2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XjBe8UUJ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XjBe8UUJ; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XjBe8UUJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XjBe8UUJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7sJk0cNnz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 01:30:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741271409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+s8Sa65V/9ddeKgx8N3fRnLsd8R6GrlW9UDyXRKo1Ek=;
	b=XjBe8UUJ8RqJvat1obarkYZqrO6JL3qGQD19sUSlw14DZubPyjrurYPzmCKFc26ab4PG1s
	Gop52hKu0ipLguSno/C9scWfkrck7PIi25qVgT646GsE+p/omON8UaY2kFOP2zznazvU7p
	8mmrEFqgLLCet/X8CKvq2ZA7P/GLtNc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741271409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+s8Sa65V/9ddeKgx8N3fRnLsd8R6GrlW9UDyXRKo1Ek=;
	b=XjBe8UUJ8RqJvat1obarkYZqrO6JL3qGQD19sUSlw14DZubPyjrurYPzmCKFc26ab4PG1s
	Gop52hKu0ipLguSno/C9scWfkrck7PIi25qVgT646GsE+p/omON8UaY2kFOP2zznazvU7p
	8mmrEFqgLLCet/X8CKvq2ZA7P/GLtNc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-a8uvzWN7MuiJf-ezRba4YQ-1; Thu, 06 Mar 2025 09:29:53 -0500
X-MC-Unique: a8uvzWN7MuiJf-ezRba4YQ-1
X-Mimecast-MFC-AGG-ID: a8uvzWN7MuiJf-ezRba4YQ_1741271392
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912a0439afso290991f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Mar 2025 06:29:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741271392; x=1741876192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+s8Sa65V/9ddeKgx8N3fRnLsd8R6GrlW9UDyXRKo1Ek=;
        b=dSvnfT0COtVbAIELP3FUFpB7vbwbLOr1RTXD9qahayOm1nBgpfYlsvPUoVSerDR9+2
         MaIKl5Xts5l0abJ4SdMDN53yzZRnyAVYFs/0ydB4HvwRovjGv6xa3naPVD8XJ5Octpxm
         XO7zhQC8l79zhRyvIJWypUlO9Ov/kqmixCu6F3073qrctff4fYKf7oCUYdBR1vHmp6Ns
         n2k3srwi8nhHmceLxNLOYY/41ie8PYM8STARewU4UR45OEDwE9tfxI/MM/m+U1selcyc
         3YR9qgOzp3id2xUjbORIrPZjYXAo3YYsFY1j2sVmaZXqcddXiOnEpBiqTTLHaBErTwni
         HsLw==
X-Forwarded-Encrypted: i=1; AJvYcCXGPZon2r3lDFn1W5ohc6+OiDfEJAAaOqjayHGnNm8PIg9GBEDB5Zs31BMq6i8tA6DdILn80jBGz9kGzrw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzchg7J/CH/17VJPFjFjiQuoUjTSg6YU07LK2CUjgFHnjPTH3mi
	4mOn1Pf5kBqqhZK4zbCNLZSf69yQsSvE+i463VwzjniV/Q0epf1pZ1KuDYc5Dgfz6rc3YPE5Uad
	2bGK5nn3t1zji0KMu4RmNG78ssgonVVauOWX27VZMhYxNuX60eNa6EmplC8ld3Ag=
X-Gm-Gg: ASbGnctNYAq4lekHH15LhfqtUYu2Z6+sipV0UEI/0pOBpq754LXboY4STVeoD+1BvYP
	k/Ax7d8DvuZgYYClNq0B9aoO1nf91AKuvPeHlOsRrQSctYkjEHv6XTTReaAaBW7hQfiP2WRnPw9
	/3UshjvMwcEk8q6rUh0senur22Atg6LHdGyg7haZ9YzckmOdn7Ub3OlLF6KQLppWQykeU0lH1Da
	ilWk57ZxxqLbI5ZZQARf0G+OEWV9hnTwQl1m1PbH4p2RtR+G7d0UnK4qmxvdsM6TRZB5y1BEiUy
	KGapCtGvcCqS4O4dbRaFZWkIzz7V6G+K2X7kvlFLYxNqqQ==
X-Received: by 2002:a5d:47c3:0:b0:391:300f:7474 with SMTP id ffacd0b85a97d-391300f7814mr755623f8f.18.1741271391435;
        Thu, 06 Mar 2025 06:29:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmNrvNwgj8JP10FUTkFjkayzhqglMLbK2EPOM2dy9cPE1fLkIBgeqVz0hx1d6bSuhoE5j+XQ==
X-Received: by 2002:a5d:47c3:0:b0:391:300f:7474 with SMTP id ffacd0b85a97d-391300f7814mr755608f8f.18.1741271391040;
        Thu, 06 Mar 2025 06:29:51 -0800 (PST)
Received: from [192.168.88.253] (146-241-81-153.dyn.eolo.it. [146.241.81.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c102e01sm2234126f8f.93.2025.03.06.06.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:29:50 -0800 (PST)
Message-ID: <03492277-b7e8-4cd1-b92e-699ee0d7dc85@redhat.com>
Date: Thu, 6 Mar 2025 15:29:49 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 net-next 04/13] net: enetc: add MAC filter for i.MX95
 ENETC PF
To: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org
Cc: christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20250304072201.1332603-1-wei.fang@nxp.com>
 <20250304072201.1332603-5-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250304072201.1332603-5-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XhKw9_vNbSznsbQT5VF9SvL6FyW3xDx5HbMx-nAEBAY_1741271392
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 3/4/25 8:21 AM, Wei Fang wrote:
> +static void enetc_mac_list_del_matched_entries(struct enetc_pf *pf, u16 si_bit,
> +					       struct enetc_mac_addr *mac,
> +					       int mac_cnt)
> +{
> +	struct enetc_mac_list_entry *entry;
> +	int i;
> +
> +	for (i = 0; i < mac_cnt; i++) {
> +		entry = enetc_mac_list_lookup_entry(pf, mac[i].addr);
> +		if (entry) {
> +			entry->si_bitmap &= ~si_bit;
> +			if (!entry->si_bitmap) {


Minor nit: here and elsewhere you could reduce the level of indentation
restructoring the code as:

		if (!entry)
			continue;

		entry->si_bitmap &= ~si_bit;
		if (entry->si_bitmap)
			continue;
/P


