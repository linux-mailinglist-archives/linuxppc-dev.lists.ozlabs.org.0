Return-Path: <linuxppc-dev+bounces-7663-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3090EA89FC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Apr 2025 15:43:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcQNH5ypdz3bcy;
	Tue, 15 Apr 2025 23:43:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744724607;
	cv=none; b=judXxXs9sjft+8kw1/Fg89ieuUqMCLw8q5oNky0VvvwPjqp2RGBtg7Gf3F0QSkG1Vm6WAV8vWPKyCqxOrq755xzYORO6alxn4LT9KOOzVOp3ksIEjoUjZONzlbHY4x7XkhxmfdelxxrvHKcgOLKCwRpPMbKQ+8HZFb3EKWXXeJ4H8eSBowQdsUWpHJoT0xTSlSGINiNazkwxCnTMGm4OqX4k1R+0b7iN9kPqWcggzTFR2rO1/+e4xiRrQeq4oUuOq6YJHh9inUcE+/WFq0OV1D7sISbWYrIXpa9U9Sxz7D8FSqLMNSY2fA8xtVY5qdwmY8vagjd6VenidXVrRK0SdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744724607; c=relaxed/relaxed;
	bh=/BknlwHAWOUIUSD2VyjY9YAAgdtDCJlgRixChgK4ykw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTj6s8Pt5us5ZKWjcWX1z2zwIHykxrrXJw/qlE8e8zJsDZykbLVf12+lI0C2XmZyXSt5HFsw7P2eOg6qWYJjBGinyKUd1Z6ZLQAogPeTlWEyvng2CdokQ64NicPXaxTXZsfxPutHaHQf/YEu9C/VHH0vbxh8EvIdyQnqm8cUkIpMjm9Y8piNI5js4Eltv2BZgUdvvfKk4b/5XsPCph1VoYILwdIdIDc2Xf1SvrJjZGkRbsOFUtO6ugoyT5hrMcsTVzlGx0T1AhqSYZOTchJLwl4ScYD9HNzFaDnerC6wrLNxn8nDvpPdiS/NIYAVXRKcBiHdvXo0NzeS+u4FuKKihQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EXRnloSF; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EXRnloSF; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EXRnloSF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EXRnloSF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcQNG4GP7z2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Apr 2025 23:43:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744724601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/BknlwHAWOUIUSD2VyjY9YAAgdtDCJlgRixChgK4ykw=;
	b=EXRnloSF479QJV//yYVyB/XOaPifwzMte16jjkHkYwmeENIt0Y9GOFgmpeANd0D6x5KTQr
	1oRx4KQEwb7l0lXgDiCbltTrHpQmnpHjmvP3bT0OGqelyKYBUDFxukrpDVNPKUpr1o0LS9
	GXsMda+HQllnuHmeKHdyUBIxzrrQNXQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744724601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/BknlwHAWOUIUSD2VyjY9YAAgdtDCJlgRixChgK4ykw=;
	b=EXRnloSF479QJV//yYVyB/XOaPifwzMte16jjkHkYwmeENIt0Y9GOFgmpeANd0D6x5KTQr
	1oRx4KQEwb7l0lXgDiCbltTrHpQmnpHjmvP3bT0OGqelyKYBUDFxukrpDVNPKUpr1o0LS9
	GXsMda+HQllnuHmeKHdyUBIxzrrQNXQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-Upe69eqXOm2qzIMv4eHmZA-1; Tue, 15 Apr 2025 09:43:19 -0400
X-MC-Unique: Upe69eqXOm2qzIMv4eHmZA-1
X-Mimecast-MFC-AGG-ID: Upe69eqXOm2qzIMv4eHmZA_1744724598
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39c30f26e31so3744863f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Apr 2025 06:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724598; x=1745329398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BknlwHAWOUIUSD2VyjY9YAAgdtDCJlgRixChgK4ykw=;
        b=JvZhHQ1kAuqDLmJ4A/uN2m2kRi4feQufc0mZ7wbwgwLHysK90nznMS3Q040tGXTWE+
         FM+85ENynP8KM22bho6CWoE8XozItCbwp4TEtoZkWtS/BrlJJ1VE+SQs2UoBC38Tz6KM
         xfDNRccV376vXRmWqB8HtqzC5y390KG44HMtIgWGbEgDk0kYLdFKa8h/mf+7mV1DnS1h
         fH6twwRRg7TI4QofUH4zCxVMzQ69bdU4ukfiyo+658IqFbRG53gn4y9UF1Po2TCrRBuB
         nxM7TnNDRsMxdSh3VqgOe8k9P4LDJB3JSnsr2ogVh0mQEuBG8Zh8ncsSPURMzfUdfldX
         ld0w==
X-Forwarded-Encrypted: i=1; AJvYcCWJRshdbJx+MOOx+ucZ94l8t1y++GzhFhgL+vt9khXXbHLiMdIsx60Jt4Fn2QvORw/S14c2JFbTCd2iFQ4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyKnTP+YJeSdrS9vSekJiULY6Q+4MPEYc4+bcPVo9PzWdXxRG7U
	KIBhao+MGAmwlNNYCpkA4JEREPO8R5nSyrb9a96skIyfSsy5iMgHeMAKFpKyOZVMJ7WrPiHBpZ8
	srhmIpN2zDu6jIDgYx4ghjak9F3Izh4UtJaVIPHu7Fz7XH+fUOohdIdozaf1N5dI=
X-Gm-Gg: ASbGncvi2gix2UhD7Log+ssZUcEuG8L/7nsmcEvcwmNx2nJgync7VAo6bjzWQpnGLi2
	/k+GYJS3/AGWF6vvQdb5159PcY1Q6V9tpQ98ibtTK+ZnHO0u8LCN4kl2kjY5kgsE79Q8r5e9j6P
	N3VAaeS+OB47JJXW+KCLA+RVmwro873WsTtAzzGJWl9UD30mTjajYfP/VJxmF0+6eqzFUw7WP6L
	9PsBOr7MNHv0OlR23GsJZOzYlk7UziRgEoZ3k1JucbiU15AUR4JcoQZ1aV6MwkHY6fFZRF1pIEM
	+lVvoG57VCdZkrvACZdc6tdIK5Qw5EeupoQz/PI=
X-Received: by 2002:a5d:59a3:0:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39eaaea4548mr13282375f8f.33.1744724598001;
        Tue, 15 Apr 2025 06:43:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0JyZk7iu1Ps9aWjZNEP8lEOiYdz+v1T/ibFseJb/dw7p9p9LOXvKaUssvdPPF8RDwWIrTgw==
X-Received: by 2002:a5d:59a3:0:b0:390:e1e0:1300 with SMTP id ffacd0b85a97d-39eaaea4548mr13282344f8f.33.1744724597586;
        Tue, 15 Apr 2025 06:43:17 -0700 (PDT)
Received: from [192.168.88.253] (146-241-34-52.dyn.eolo.it. [146.241.34.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c02esm14065754f8f.23.2025.04.15.06.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 06:43:17 -0700 (PDT)
Message-ID: <4ffd3630-bc75-47db-b63c-3dcb7af8249c@redhat.com>
Date: Tue, 15 Apr 2025 15:43:15 +0200
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
Subject: Re: [PATCH v5 net-next 06/14] net: enetc: add set/get_rss_table()
 hooks to enetc_si_ops
To: Wei Fang <wei.fang@nxp.com>, claudiu.manoil@nxp.com,
 vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org
Cc: christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-7-wei.fang@nxp.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250411095752.3072696-7-wei.fang@nxp.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1xM9GyTG_NfYO3_iLJ-annl8ioVtIKhrEjNa3nyulI0_1744724598
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 4/11/25 11:57 AM, Wei Fang wrote:
> Since i.MX95 ENETC (v4) uses NTMP 2.0 to manage the RSS table, which is
> different from LS1028A ENETC (v1). In order to reuse some functions
> related to the RSS table, so add .get_rss_table() and .set_rss_table()
> hooks to enetc_si_ops.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
> v5 changes:
> Add enetc_set_default_rss_key() to enetc_pf_common.c and use it in both
> enetc v1 and v4 drivers

Note for the reviewers: this changelog actually applies to the next
(07/14) patch.

/P


