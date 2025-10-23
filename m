Return-Path: <linuxppc-dev+bounces-13233-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA906C03547
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 22:10:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csxx957z7z3cQx;
	Fri, 24 Oct 2025 07:10:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761250253;
	cv=none; b=khSw1TaQ1oxZyN5GOVYgXT1QtunwevEEe9hg+dTH7cSjw4bd0fGd3fDwQ03Vv7tytu19YGoFl8vHXU9H7B1mod/qcJ5BRgSOv7HdY2CA44Li12vDeP/astNWs+h61fi91Sos/B+F0Vdu9XMfeDFmmky1/CRVUn6e5O1eCZpXwgMGUdz/uyr+FN+Ftw/dLID7b/bVXKDy6611oY1/WiP8gcqbnFWVaKmlsjE4Ry68Z46BeI88kFGacvEN7Q3e3uldjNiqpr3bbrRniDYwu2f+tB2/QXskPFkMtnSCSDLNY8OdIf8BkssXSvUkFoxa3yqIISPGsdhjFWXFZvfnbE0Y1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761250253; c=relaxed/relaxed;
	bh=vF8Hb3hnoXfLSdgr9uXEesJUum0OfpN/YlQIs62F7QU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DkvBjJrcfAWlMsSZSmAjiKF2h49ihzQn0vA+31XlwYqnMK9p4rfE6ujHNOjGLMsYwXCWenErRsMz77Xucuo45XHRGwEEz89m1L05EWBFi+heI4UUlsM2xYXaKdd9h38lGWTn5XP+yrpSknQNC7/vfFhmUWwB8LwUAv1NVo+qU7vHpvW23grnBS6IuvMebskelmK+8boWL3S4BsA7Vy2WJbLeSMFPYivv4WaVilP+g+wZVAo9xY9FsFe04MLG6kMhvfYTfwF3da6SoaINtFEwO5NkiSkppHVhXc/Era+IRbdT2HSEJOqm+O1vqv3duzeIp/vvAuvsOEyqgCm63oIAdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pe+9BAXk; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pe+9BAXk; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pe+9BAXk;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pe+9BAXk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csxx85N6Nz3cBW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 07:10:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761250250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vF8Hb3hnoXfLSdgr9uXEesJUum0OfpN/YlQIs62F7QU=;
	b=Pe+9BAXk/Zn5hUg2n2BFIKD1g7IVbeo2PW5C7fnP/s9L1KSvIJW8LZZ4AmgE4Yqk2bvo5E
	zgoI1YrzDMxQfyOfNmK+KZ4L9vzJj3KoZ24iIufBFVHO8McYXJYn2lPagxX9bTKbvS6mt1
	X1tQ8Zat1vGLFS+R9VGxiQSFjcV099U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761250250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=vF8Hb3hnoXfLSdgr9uXEesJUum0OfpN/YlQIs62F7QU=;
	b=Pe+9BAXk/Zn5hUg2n2BFIKD1g7IVbeo2PW5C7fnP/s9L1KSvIJW8LZZ4AmgE4Yqk2bvo5E
	zgoI1YrzDMxQfyOfNmK+KZ4L9vzJj3KoZ24iIufBFVHO8McYXJYn2lPagxX9bTKbvS6mt1
	X1tQ8Zat1vGLFS+R9VGxiQSFjcV099U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-8XhT3SjBPQy8-Cz6O5cRWw-1; Thu, 23 Oct 2025 16:10:44 -0400
X-MC-Unique: 8XhT3SjBPQy8-Cz6O5cRWw-1
X-Mimecast-MFC-AGG-ID: 8XhT3SjBPQy8-Cz6O5cRWw_1761250243
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-42700099ff5so766904f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 13:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761250243; x=1761855043;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vF8Hb3hnoXfLSdgr9uXEesJUum0OfpN/YlQIs62F7QU=;
        b=KdgYUJz2QxeOWCYLLkUMv3sRCYjaGTGaek1/OTSgL19OoK8HTmROweesQJ65a3ZaGN
         qjJKcaEiB4yo/nvKPpWl+a2vDMHkF89afnUfwwugBgq76ymnprMldQqpOpbnbaG7N2ar
         +72vsMQ/afW5wDX04JFKZgzxkCgQYyk5h15VkmNHiZ59YcoD5H88/y0YXT8sm29SCX+8
         hbhuOFq+qLfRA3dTi4YsV5epGGG45aUUbCfpvW3d1TMRvNkrFVf+Z+SJyU00ckkGyPEX
         KePCV3UukTWd9JJw0z/aKRhjJxLKXwspB5rMHQkS5gQRsSKCCVg/d0CcasjX2ItsiPbI
         iSCg==
X-Forwarded-Encrypted: i=1; AJvYcCWLIsXRTBy4aYqeqpZn4TPziTQx52wHA4bgylWRCMw6XfiAUhqtWwoE05fAwCCqAuw2e42jnsXECLrZ0Jc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyi5fHQR+d80LhaF9wtxNhtP3yWWPlV3yMjPy4y1zSSKeYFh3z1
	EbQ2sIWNRSb8Q2DNWSFMtMPJ6W6t5kGED1eFrSuI7BSXUzKHCQy/hl1I2s9mME0CoIzAemnPGLC
	mrbk0fpaMPzRqUqcp33nr8iKA9xn07Xt3fOMeEIzGqlihgTRYvVp3fSDeoIuY9tuEqtY=
X-Gm-Gg: ASbGncvXoBHyfLg1CKBa60hdbk9uJ/J2QBeG7tw2QY+PhZDTr+4mjm4YeAAZY69HBzm
	GtBQzmc8Jo3mAzK5jTYZeh4uLmmmx3PG2lhOq8PNGplvRyylBorwDcmhLahzcYYW0WbBRBaNbUw
	n4Fst0xs32pKXmYZ5vzRQnHGbzQAd8oI3XWu6XOn5jAbEKpALzSLo0+2TvKf0e+3wfsSuK8RwxI
	SxW+DmKTReXSdLmKPKSD1iq2rMxEMEKkk8SD64bqsbDAmsOBqP3CEQDQhfmTVRPV7aD4jVdI0Mz
	mzNHrXBrjHDN3jkiotwvdmG4tz0kXfo5siZGNEBtvSIQlnJ43MlAeKiZlKJai9Ua4tq0xjncKSQ
	KAvsT8E2vIv7ZCj+ks53+W513ALfD5jAM2aGdX/HrWPt7moREoGrlhT12sOqAzEJgnZ7bLwXhAv
	Wmk/xOoj0IsMujQPLXUs07WVlNHos=
X-Received: by 2002:a05:600c:6291:b0:471:a43:123f with SMTP id 5b1f17b1804b1-471178a6882mr200628405e9.9.1761250243294;
        Thu, 23 Oct 2025 13:10:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEznsO/mZG7bXXGeVpf9lUsRK7DtoSEnI7rqyr8WVIAgGuBjLQ7Sb3p9c9Pj2m7/SEml5RHBQ==
X-Received: by 2002:a05:600c:6291:b0:471:a43:123f with SMTP id 5b1f17b1804b1-471178a6882mr200628295e9.9.1761250242917;
        Thu, 23 Oct 2025 13:10:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898cceebsm5532934f8f.37.2025.10.23.13.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 13:10:42 -0700 (PDT)
Message-ID: <3d6bba2d-9739-41d0-8f3a-f8b11620c33f@redhat.com>
Date: Thu, 23 Oct 2025 22:10:39 +0200
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
Subject: Re: [PATCH v3 13/13] mm: introduce arch_wants_lazy_mmu_mode()
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-14-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251015082727.2395128-14-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dHeWTN6bgeu6P0yK-qy7HIkMUxgLc2Aj6-EZ8z47I9U_1761250243
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15.10.25 10:27, Kevin Brodsky wrote:
> powerpc decides at runtime whether the lazy MMU mode should be used.
> 
> To avoid the overhead associated with managing
> task_struct::lazy_mmu_state if the mode isn't used, introduce
> arch_wants_lazy_mmu_mode() and bail out of lazy_mmu_mode_* if it
> returns false. Add a default definition returning true, and an
> appropriate implementation for powerpc.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
> This patch seemed like a good idea to start with, but now I'm not so
> sure that the churn added to the generic layer is worth it.

Exactly my thoughts :)

I think we need evidence that this is really worth it for optimizing out 
basically a counter update on powerpc.

-- 
Cheers

David / dhildenb


