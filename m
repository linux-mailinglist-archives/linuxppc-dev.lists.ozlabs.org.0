Return-Path: <linuxppc-dev+bounces-13229-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9622DC034E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 22:02:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csxlg11cPz3cYG;
	Fri, 24 Oct 2025 07:02:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761249759;
	cv=none; b=c0JH1onAOXjdM3+8TTDhghipZ53474LOPx3a88CPkKXwWRq9j4WCeB7s8rkTca5LXUb7Q5LM+WRmoXvp6ZTu5t/X9gQRMttn+aC9YZT+fQs/g8B96xS+iqOh5oqdtZJ7Qsef8DKQ6pMcpG5Yo+Xl3VsgGiNvPcLNRbe8zj5L4BYth16n2kyA//H38ry70yLBo2OnrzYN2vXHoX8epXvtMOUr4E63MyeQfaF/RSycn3nHGYABRl0HzP8cdZQ1pspnmjMNAbFrRBDB7AAWRctyZ5XZfpOxT9Man5Tzls43yFQ9DSzth9kPgo03/MfcUDvyOP0EMIKFt9TeVPqJ3Km+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761249759; c=relaxed/relaxed;
	bh=y4TTOO2cgFz3W+ccXXdCSitozQat0wJ24BVv7Ue1CUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+UOsot2m8ia/93Tv+95JHx1Z4FXDzoHoThyT5SWPuzVrAwJ8wt2/+Zj+NCt6a2xox5RY7jidxFzqfRZSdL90oUg+QV5pxWh3kFA69bncNNb51hNiUeJukUCRPUosI5Tw0o7TR8wx/cxxpoy6tUNdDo0Au/b2KqfpDYpkq2S0snf78xg0EQtA8xklNRscW6r0R2NrguI9RPdZS9ci5L7gs5C44u+4CQctPnSr/+eYpUAGhzSfTBdVPTivEJ2l6BKFJoWv+neHJCgVG2iKqTMGp0o0nV6Wb/gbwYPpIZHkSTfEj1pS0VSwNc+9/DtdOSnGn/tnCZp8292kd2A9DSXYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZBTbjO3h; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZBTbjO3h; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZBTbjO3h;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZBTbjO3h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csxlf2Gpkz3cQq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 07:02:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761249755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y4TTOO2cgFz3W+ccXXdCSitozQat0wJ24BVv7Ue1CUk=;
	b=ZBTbjO3hhmvFxI3OLGtkIaEr0cEMa3Tftrqp8EEvwqfTsn5DD6GjziA5RGjC4RBD8Nyvdc
	ywY1CGx8kQHzMqgHWT7+XiH5PetrqajEG06/si3Fvy6LbTpwG39e0pbZmQwW3DTDn9YBcD
	els7qo/+pwoPlIJCLbB0dUzaziDAkmU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761249755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=y4TTOO2cgFz3W+ccXXdCSitozQat0wJ24BVv7Ue1CUk=;
	b=ZBTbjO3hhmvFxI3OLGtkIaEr0cEMa3Tftrqp8EEvwqfTsn5DD6GjziA5RGjC4RBD8Nyvdc
	ywY1CGx8kQHzMqgHWT7+XiH5PetrqajEG06/si3Fvy6LbTpwG39e0pbZmQwW3DTDn9YBcD
	els7qo/+pwoPlIJCLbB0dUzaziDAkmU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-_ZQq2R_uPdCOv6LbUzmznQ-1; Thu, 23 Oct 2025 16:02:32 -0400
X-MC-Unique: _ZQq2R_uPdCOv6LbUzmznQ-1
X-Mimecast-MFC-AGG-ID: _ZQq2R_uPdCOv6LbUzmznQ_1761249751
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-471168953bdso14435645e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 13:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761249751; x=1761854551;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4TTOO2cgFz3W+ccXXdCSitozQat0wJ24BVv7Ue1CUk=;
        b=M0ZN38OBh52T8+ipnyVPmeBgzAEQ7IpOATOxRjs22db7hr5fMcatnJ6/PfWXkdv69X
         xp+1fC1VjX3LPqTS6eFVn1CenAbwf6mhRezPMfaTmHDBQX6Phuc/A5NDZbMFBF2yHh1o
         pm0Y3YLnCGVL2lHwu8gthxCidLsl5QUcGhMGveu2BKC3T3q9/OC5Ql/iL/CNxfUQCfn6
         AvFCX/diRp3So4EkVT5T74FgQ7nV5ti8dqoyZPUqDLMMfedOmtlb5s7J//5PV/X2ysjt
         QMa+vYQdCHvG6ilg1vu8juzdQSJTbui/CbYX0mLk9y1i5WNnmblj/sDlLhhlCDXX2NM8
         b0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWxHVTUJBsH/D0r5LZK9/EyGc5hdXpOSwGiVm3TcyrCSQ+Qwo+u2PinkJr5vd1bOhgaCOAwDbzFePCMzl4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw8KFYvxCI/egRIk0qhHCIgz+j4Oug5/tHpTab0nG5S2T38Wwc5
	9V370VVHAViOfsRaAhv7ReCCkY5Y1U4YxfaN1WXqzmO2STS8CM0MIbaw1JtDMv45SvHfMlgUaiX
	a2ahUovMUHjpZrM0yF3p1czzaIilFARaT0jY7HfwO3D9rx1bvy3+0ly2DDigyxo8IrVo=
X-Gm-Gg: ASbGnct7xDB/gp6G61dGeQFA5xdSP1I+4X/Br7nAL3Vi5E2/kBhEn2jcAukeReSCIXn
	kNNPLcdaMVDINgUrjXwE8fev+SssJrXK4z2AEZ72Cn5latxFl2GlyMTQTpnOMBKwllyP1Xwh7aW
	7x6QnVPMrMlO1Vsut2qZ2kI1t5e9EKI12kyxTPOcSqlkcXfy6GrmPlsE2qLSdpI4enRqUQo0sYg
	dzZdIzdmPTRhqN3P0JyU6igl6Eaoa8NWte84mIOgO0SpNNhneogwFs8LAfauzEEJiwdc8dpYsjc
	Qg6VKPNB2ZiBvr1PI9TcPH86Vu5K2FxmrKDC54Ytpl8+IXYO9R08Zvim0Gx6Z6gAqQ2+EaUJTSB
	/ZkVOw8A6fSLP3goqS/b+/dJcLqUN6fvM0tH/aspr80IoBbR3QOducAl7clyJHcRfstXt1s5MIq
	DIHmaq6+KMryldJKK3ji2ruvyJD1Q=
X-Received: by 2002:a05:600c:1f13:b0:46e:3b58:1b40 with SMTP id 5b1f17b1804b1-475d24125f6mr1089635e9.4.1761249751046;
        Thu, 23 Oct 2025 13:02:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMw+Op04CJGmhD/YPV6zz3oVUY6+u4w9wry9vJKgjouN71r54k9F5kFdt15tjjDg/5cU58MA==
X-Received: by 2002:a05:600c:1f13:b0:46e:3b58:1b40 with SMTP id 5b1f17b1804b1-475d24125f6mr1089255e9.4.1761249750674;
        Thu, 23 Oct 2025 13:02:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3? (p200300d82f4e3200c99da38b3f3ad4b3.dip0.t-ipconnect.de. [2003:d8:2f4e:3200:c99d:a38b:3f3a:d4b3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475caea0468sm54964965e9.8.2025.10.23.13.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 13:02:30 -0700 (PDT)
Message-ID: <8d5243ec-3edd-49a6-ab51-16643a709d84@redhat.com>
Date: Thu, 23 Oct 2025 22:02:28 +0200
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
Subject: Re: [PATCH v3 09/13] powerpc/mm: replace batch->active with
 in_lazy_mmu_mode()
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
 <20251015082727.2395128-10-kevin.brodsky@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251015082727.2395128-10-kevin.brodsky@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7LozfJiPb3NoWvoEhrMMnPfQdurgCrvM8LgOpExuvWM_1761249751
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
> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
> mode. As a result we no longer need to track whether the per-CPU TLB
> batch struct is active - we know it is if in_lazy_mmu_mode() returns
> true.

It's worth adding that disabling preemption while enabled makes sure 
that we cannot reschedule while in lazy MMU mode, so when the per-CPU 
TLB batch structure is active.


-- 
Cheers

David / dhildenb


