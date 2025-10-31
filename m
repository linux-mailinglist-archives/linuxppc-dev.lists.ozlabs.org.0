Return-Path: <linuxppc-dev+bounces-13645-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 506A0C24C4F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Oct 2025 12:25:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cydvJ6j4cz2xnh;
	Fri, 31 Oct 2025 22:25:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761909932;
	cv=none; b=Qdnl10hQzna43Z4d82y/FzvSsHB3a32n+0DLBEnIm8RB6NE9KwtA+P7u7mtcZE4KArpxQQdINEvThgSPZbBnIsIRqTPZMii1aVb3YszVs74mNlTb10hZAcH1EMoPAcGQODW8nETAAf2iG8OtdSCyJ4PgLcrrnOhUWhJWTweEP4AD1hMQS7jkl+uO6XXWONGEZi6KbnLNFjcagBwPn31VdidpA6ou9d1xBA+OVfrpJAjARBd56EinVxgmKsQ3WgLp4lRKNsqgonO75im8vqPYh2E49FUHWvP2aduNmJRrKK6n5i5xBjphgmUY3T51g539MXrZYiDsKJsZnyKSCVLJdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761909932; c=relaxed/relaxed;
	bh=RFPb4081j4iDpYYIpXTUIU5oVSwLr0pFAt1AsS8VIFM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=EhXPhgEdn6CdlB/5JxnrapAtdlT7bYCHH6O5oU2sLHZQ0h9egPVS6tzxD3gxgJ3bwlSvmPq1zjVje89ykrkdnZP7awh2DSjzFop5pbzEs8PsO4ohnt9iPrbboClTmpdwcYtPqeaJ+axIeap/aem55q/kTrKXe25+CiVHULrB1LL+gnyJQpjKGyldS8ff6ctt/5TJSivHPiBYqtA4xEKX2WEx0dLE5JLEZ/67AWmcvOHvOm4nq3VY7dEchONRM+isyXaKcn9i2RCqxsgO/Ka0SkTYnHF8axlLui1D/i8Ych7L/4rIZHf98QSncS50dzE0OidQ4vDmYxctZs2/VJ3yDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i+s97Yq0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i+s97Yq0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cydvH5P4Lz2xR2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 22:25:30 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7a4c202a30aso2410238b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 04:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761909928; x=1762514728; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RFPb4081j4iDpYYIpXTUIU5oVSwLr0pFAt1AsS8VIFM=;
        b=i+s97Yq0K6GmoeMFtnsYE+r/UYclxqamUpgxVQs6KmNcpUqJ10CN91WFK8A0Bfn2s3
         K/Pxt8VZHn5cf4d7j3eJ71IaQyTkJKaCVGGZ7d2i+MelQr8T8xXw2dBOzb2nh3CpRxig
         NhCO00UDhpLS5lOysyfu4yud8T0v3pknCJ7ek5wKbZhS7NLUgrB2i1ZLP43im8z221QK
         i0QkQ5LpfjKNKOlduKpq/oNH4UvihsZGhDJoZqWNDZROV4M5gdxUVZsKz4q8HY+Ev5DS
         oW9YdoXeJqOea4BLJX95Nj6lA7Vx+D2eAZPi1DJ2dTo5YY76ZkWY9dCLYGsdoKyqsTMD
         F64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761909928; x=1762514728;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RFPb4081j4iDpYYIpXTUIU5oVSwLr0pFAt1AsS8VIFM=;
        b=gkaGkPwTQriZ8nXuNfN6FpA9Y7JOiCtc0i9U85HG/sXN/M9ssg6FKNzn/Wvgfojivd
         O+79UBljOLdDlY96npCEeXq6rTOVZzCeZ7mUjdiln4v52fawGPC0l39Aqy1DbH8Fgcf5
         AF5nJ/p+9ktGq3f6FUDxbjuz5hAUW4ltYL5ysqZIMldi6zUUr7kT5YL0bSnlEeWtMSeR
         KnYwbRT0STl7Xf9fJ7YwgF8qyR5mnw6I2tU7Gvr5f7ejjbOr/Gm6Mej9J4QMmAeXpFFU
         PK8rPKMBBLKc6aCWFrt+xKX+cpTFe5FEl+lKh9LsDdrs60HssvjcPe6gzY9SIjTUX1pZ
         QMmA==
X-Forwarded-Encrypted: i=1; AJvYcCXkqcObVhwgelE5pBqVAfj0HMAbYjTiinOVzz9oXUg7BELxWmTQJgtcHybdZYjDIw/E9EdgQJvMoGAv/fU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzoDUgma+GiyNXmVugxlClqqZQAmb4mdq3pCJIvyatGIjmrjKqc
	I5mCudNNvllpCLEwDCZ/EUJUNTSr4Huf45JfutWtpDi7mZKK2z+Nt3iG
X-Gm-Gg: ASbGnctumlsJKcEuz7cNvXw8bEn2xcvhjleXVCBbgwMR7D6ULoedRgiO1VWzN6wGptS
	3N4/eEGznWQoHWAOOjCqQ6L+RAHP400VT/5ECA2QIvwv92cQocZJb3UZXM+xQgWZogl/stNgBm5
	VeM5Y82TVvaV4XGbbWUei3nFT2KutBdDpZolC7JQsP/YsRR9w/0ePeAJxuW/xnbncEyyM9mnhlE
	a5jVZLzynF+d4lgAtP/FWL8IR60Jj8SvyZeG4iEuCVmOCznznB9JxSW/pzcbiUbTTSh1jB6DlOt
	mYpbGMX7quiFgq2oyn9MPkDQoLMG+cHkFlgQZTkj1x+4+HTE4PZ/6Z9pbAy6MnjLTY9BBR8dq9s
	CtzGWCAV1plpEzLVKRrXW/ZLZX+WwMQJoI+sZvHtIseNSCtu8C2/PpwCa28t/xFb7wooqPw==
X-Google-Smtp-Source: AGHT+IHLO8q4qj25RwxQlCFaaE1wpsyEH92bFLJ75QQ1agXGmaIJ/hNuXoi6/DnC3YaVxA3uLTRLJQ==
X-Received: by 2002:aa7:88c5:0:b0:7a2:7964:64c0 with SMTP id d2e1a72fcca58-7a77737e673mr4416161b3a.12.1761909928472;
        Fri, 31 Oct 2025 04:25:28 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7db678f67sm1859975b3a.57.2025.10.31.04.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 04:25:27 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: Re: [PATCH v4] powerpc/kdump: Add support for crashkernel CMA reservation
In-Reply-To: <87ldkr72sq.ritesh.list@gmail.com>
Date: Fri, 31 Oct 2025 16:48:16 +0530
Message-ID: <87jz0b7213.ritesh.list@gmail.com>
References: <20251030100955.1453314-1-sourabhjain@linux.ibm.com> <87o6pn7mfp.ritesh.list@gmail.com> <c6ce9b94-1126-49fd-869b-76a7e386a7d1@linux.ibm.com> <87ldkr72sq.ritesh.list@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:

>>>
>>> I am not much familiar with the crash kernel workings but was curious
>>> about the following query related to this patch:
>>>
>>> As I understand this patch allows for the remaining crash kernel
>>> memory to come from CMA region. But do we limit the CMA region to be lower
>>> than 4G?
>>
>> No we are not and we don't need to.
>>
>>> Is this patch dependent over your other patch series [1] which
>>> supports high crashkernel reservation?
>>>
>>> [1]: https://lore.kernel.org/linuxppc-dev/20251027151338.819957-1-sourabhjain@linux.ibm.com/
>>
>> No, this is an independent patch.
>>
>
> Say, if we are in Hash mode and if the CMA reservations have come from
> higher addresses. Will that work with kdump kernel when it boots with Hash
> mmu? Because memory region beyond RMA is not accessible in Hash correct?
>

Oh sorry my bad! I think I got the answer to above question now. 
So this feature allows us to reserve the "extra memory" using CMA which
is mainly used to serve the kdump kernel's memory allocation requests.
So we will have two memory reservations i.e.

crashkernel=64M,crashkernel=1G,cma. 

So the second 1G cma reservation is mainly to serve the kdump kernel's
memory allocation requests to avoid the ooms. And this will only be
required once the MMU is initialized, so we don't have those RMA
restrictions which are only during early init time (before Hash is
initialized).

-ritesh

