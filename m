Return-Path: <linuxppc-dev+bounces-8946-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FC4AC4361
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 19:18:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5jBt671pz2xZV;
	Tue, 27 May 2025 03:17:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748279878;
	cv=none; b=mpfdDgwv2hDqIntbYSX5ICmGZMbDwgP+z4HYIQaRs0YXyXgL/nY7Xq5wRhRxel1/IHZvC6l4L8CIewXKqM2OdeHgece5i7iB9IoQlYYmEEzBLBQeco/llJ1QhBI2tp049vEBOqsXteoSol+omGSAdLy91AQ57e3IUtDfIeWVyPgMoWowVnvW6L6AXZZdj1hTx/UU5h1f8M5S8+umnA+2D1uzh2bvD102BkFyh/aD4rFQ5w93sp036OrgzY1tcMEQ9d1JJ9vERNGxaUctfw9hAgzLXNIuw9qJfDzfqvKjYWx6L8mZkSSgJt1cZIr1tp4zFNNNZIQofrLZV/wkFPgFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748279878; c=relaxed/relaxed;
	bh=N8TDaK9uBXZUW3XXXfrG3Ug+WZzSKko+ZOGBgacitkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A65v5M33MhMaNZbvHKf+E83omiKGlSiCRIf+Z+2ny9JRlCHuuqpEjgWvaz89IGYnzcaZQg64NK/tMgtotKVO/Kb22Hn/hDKrc5Bc+/pJ3YeUUbA3mdzDQPl/XZzV2x2B/obo5GJktQH96FPYu3aU40JQGS6AL7CEQaW19PUr68i/WFMwdCT7yztsc8CyprrWBupJYHZdLNRey/ohpeu2hgu2e1CWcPJFjO0VD2ek2wGk74tsWq7/W3zy9TNd2Y56ecz8GxuiUllNE6tTNvAEcaMfaoGuCTUvWzwWNt48aNe+saz7ZPCqmiRABtSkEFvahdSpAxTePek3DB5ai1wU2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BzJY+00o; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BzJY+00o; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BzJY+00o;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BzJY+00o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5jBt008Jz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 May 2025 03:17:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748279875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=N8TDaK9uBXZUW3XXXfrG3Ug+WZzSKko+ZOGBgacitkY=;
	b=BzJY+00oUhl9jNMVy3hor1PWE9+rMiceuoeU09Li3ak4BuFsOJhogkvpDSw4xkzv6Oi9MK
	M0xb3Z02UVbxOLe1iR/dBnJP4/DWCjYE7vz5qROb1wnCp1FY0GMhMbkyMf3GPHm8Vq1/0V
	No9+IUScNzLgYridM3jX8Ls+GVEC2GY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748279875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=N8TDaK9uBXZUW3XXXfrG3Ug+WZzSKko+ZOGBgacitkY=;
	b=BzJY+00oUhl9jNMVy3hor1PWE9+rMiceuoeU09Li3ak4BuFsOJhogkvpDSw4xkzv6Oi9MK
	M0xb3Z02UVbxOLe1iR/dBnJP4/DWCjYE7vz5qROb1wnCp1FY0GMhMbkyMf3GPHm8Vq1/0V
	No9+IUScNzLgYridM3jX8Ls+GVEC2GY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-NiNFLTATMDaAxvG3pylatw-1; Mon, 26 May 2025 13:17:51 -0400
X-MC-Unique: NiNFLTATMDaAxvG3pylatw-1
X-Mimecast-MFC-AGG-ID: NiNFLTATMDaAxvG3pylatw_1748279870
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a367b3bb78so1295785f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 May 2025 10:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748279870; x=1748884670;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N8TDaK9uBXZUW3XXXfrG3Ug+WZzSKko+ZOGBgacitkY=;
        b=dpq0yk2qJjpMz9iN8SWdI7uZttlXzVn1F1gHUuLPiozeLmnorWaHSXEvqAn0d8K7SK
         Dys21IctU1BvIBaPe+rMNqSY6WK7iEt3C5qmRWOvvlqQ5G10yXuoKcwY9T7qFUCuom19
         iK37qi+ZUu2WLCCAm7aR907H1GiHYob2dQ8f44LdKkLsFPjWw8bLPUzdyAgNCUIzqqUb
         SoLAD0RkfYPz/Fm3fMLfb1xHQY3olL2JL0keUPY8S/CSSAfxh/VqLILTNiGROcSVhEqY
         +A42Bbel9ooVm+W8IliMJSTTWhU4x15hvA9uGTIB3SRwKLeywICt2FQlea9OR02vYjGB
         +6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVjr93Bdd0h+iE5zU7rr9IX5vZHRBrPWKU4dL8EwFJDMt+0VwII2SaPJWPQ1Mq1HIV+fvA4FQ88dTMSrvs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhiKnQdeAmHzJnrzJdoxEe/4VlMRMAHJQSsvQ1dqwoD9H9tVk2
	M8HxN0C4cA8ZwLvKf7QzYz4BpM7hLHDxt9J/s8lhUflMrmrrYaBN4ibYbA460BtAc3W7ZQspSbp
	CZ4YPlcTHxoxsRDxGWhS4+r9AUlWFRlfFK5kNCfKRLZH/sfDEnnYu3y4RqtiM3hVsGT4=
X-Gm-Gg: ASbGncs8xn37MY9+TKVlGW2Z1tLjW55yJdbvXAXHoftqd1qDG43uJn2Fm7L0xfMczUQ
	Lv7R+L5beu61WCubGuySc7uRAm7b1NYJrNbF5HhEZbnBHuRVI5M3pDR4G82EKQVfnLY5nOvYeeO
	dPbuszBZ4yIBvjFJ2Ge69bVBE3Aq2txCoAJjl5WHvaIp1MEV/bzKSphhvaTTAS7yB9WhOBBYzA2
	FNyJW9KGrqRQKmGYbZfbWZBqBwtdERqwD3ggPcwsTfLfBrZYm6qG1mLNpJuOIhfhmuFR63td/Ck
	VCL6lRM//0KB0vm1bRw3XYTk3oys9wrmac+ChVBsB23PKDLKcXTyqS2NRVKhzQucC/V/62SKhNp
	997LHWQD9/SwFfVjqVXxZqNNBZ6MET6eh9MbtKRo=
X-Received: by 2002:a05:6000:2507:b0:3a4:dc32:6cba with SMTP id ffacd0b85a97d-3a4dc326effmr2931252f8f.4.1748279870007;
        Mon, 26 May 2025 10:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/8MepRyYsY8Naj9dTGK3E2XahE9Z6zajZHBReowbde8nns/JUmGt3bFIhv3WrNuNUPFUiVQ==
X-Received: by 2002:a05:6000:2507:b0:3a4:dc32:6cba with SMTP id ffacd0b85a97d-3a4dc326effmr2931234f8f.4.1748279869658;
        Mon, 26 May 2025 10:17:49 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:6500:e1c1:8216:4c25:efe4? (p200300d82f196500e1c182164c25efe4.dip0.t-ipconnect.de. [2003:d8:2f19:6500:e1c1:8216:4c25:efe4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4ce65342fsm7602044f8f.6.2025.05.26.10.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 10:17:49 -0700 (PDT)
Message-ID: <5c0850ec-9407-49e8-ada6-e8967d676ddf@redhat.com>
Date: Mon, 26 May 2025 19:17:48 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] drivers/base/node: Rename __register_one_node() to
 register_one_node()
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nilay Shroff
 <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <bc754a238aa91fa36be463985ccde66aac7055e7.1748270306.git.donettom@linux.ibm.com>
 <6a2bd4deee8a9274e0d3dafe965c0119b2191b7d.1748270306.git.donettom@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6a2bd4deee8a9274e0d3dafe965c0119b2191b7d.1748270306.git.donettom@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MGwUdhWOb-ZW3D4BSH5cAKO7U2005kTyRnOH6WENrEU_1748279870
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 26.05.25 16:50, Donet Tom wrote:
> The register_one_node() function was a simple wrapper around
> __register_one_node(). To simplify the code, register_one_node()
> has been removed, and __register_one_node() has been renamed to
> register_one_node().
> 
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


