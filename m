Return-Path: <linuxppc-dev+bounces-13065-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2653ABF1FDE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 17:05:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqzJb3BSvz304h;
	Tue, 21 Oct 2025 02:05:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760972751;
	cv=none; b=lJSNN8ZNx33b/QHttcBTJp71T4obGkbsE32yjW4K6tftyV+bdiywEkjDGzhE8lx6TmDMpN67QNYw07QIkTYZMfEjSRM75P1D8xM98besIOgdp6AmKYL6lA91Ux1nOBmqOfmU02frsSUmP453NzT/E6anoxLybydOMXd69iYERLaiK0GqnQ+RUsTzrDT/e2Tl0dlyb2+ouQGN7xJ5EjlaX5x7+R/qqZOfiwQUKT0WFU8Kxul+SXzzit/H6UG4QqxRZgk6k6lm1ZzffVoruMi91dzQmFnEUO7pPNzO0VeoqmqGRANqc3HL+JEaG0lhsVnU6mIh4cd2u0gAJK+WRqFoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760972751; c=relaxed/relaxed;
	bh=UoysR2dfgelM8ATLc2CIop8Abv9DjCmPw9q8A2JxxaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h4oMPDyYXofye6/vlYmDAuHaAIdQ74Rjl5o8sYC1atNh5QogXcu9HJUCddy7Wv1hIN09BofWZvsO2uR90xu+4qN4v2qbhVGCpqNhBUEIdPxiTUpAxaggmERKXObrQzAQVxEg4o+HFrRiGByQCtV/Zl5XsZCBFhoqXHkPbqaELAJ8d1SH0YAP+AptfFcsk0afSzfd5X3+D6tQp2XtxcSPEF3QURGht2E6Uv9wJpEepmAXuZcOK651Z07kSPn/Grg/cVaV2xyi5ccvU5XeNgbYM7OmCtzpsR6Fyh4iTjuA24j9en4sqUIxpn/ktNxMyoK1gxPRJPL8G9Hu1DAcF+WwsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TmmaFWVd; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HHtOBzF+; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TmmaFWVd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HHtOBzF+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqzJZ2G9zz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 02:05:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760972744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UoysR2dfgelM8ATLc2CIop8Abv9DjCmPw9q8A2JxxaE=;
	b=TmmaFWVdXou/LSPU15CHer1qvScXU4QirK9xWHgRUT2Ys7YDobau/7ROe9Gd9XWUTp1YxX
	IqMQ1njmWLVdA7NpV5WeLljEIWNGt3xe9QDtWLDRn7y5Hg7WpiTQYIQgOSd7+xDpxA3C1l
	j8HjMoim/67sqfOxVjIgUj43zokS+9Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760972745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UoysR2dfgelM8ATLc2CIop8Abv9DjCmPw9q8A2JxxaE=;
	b=HHtOBzF+08QGthmh2qnROsBtHcSw5DoYJFAnmM12E8DK/qMhjTPj0YIUgjncrTmJb1EfQK
	rASo8FbgIakwSNAweeZNK/F+NTr8ayBu/mlzLJwHrh9zMiDR2ZSe5LIVvcIOV5byY5JNMH
	KeFxe1Jpo6JmZLd72Vf6/2Az2ileWpE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-1bu-SBp1NUOVmVOzsUqMfw-1; Mon, 20 Oct 2025 11:05:42 -0400
X-MC-Unique: 1bu-SBp1NUOVmVOzsUqMfw-1
X-Mimecast-MFC-AGG-ID: 1bu-SBp1NUOVmVOzsUqMfw_1760972740
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-472ce95ed1dso10046255e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Oct 2025 08:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760972740; x=1761577540;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoysR2dfgelM8ATLc2CIop8Abv9DjCmPw9q8A2JxxaE=;
        b=bggYCehwHAdUsiIjVSp6Mua547kkulDdcI94ZuGzQAwLzWvrBbXjrFnpxAz1HcU2Oh
         4GeJE+Gnwv4xckeNMMMdCf/RSJss9ZF7xCdjJG1KVbga9ErHitc4vl76XKFihreooRlX
         16EdW+oVnitCUniticZxL8+PJOBihXyz9KcuMHN8TEkd136zVBQFnHJb5+TY0DpjiGNd
         pNgsSyJehTiHIHQHKoNSC+iXr9NIJALUeQtf7FrRBr0zgBzT+cGX75CsMB3vLfnJxhzI
         8bXyjzE8EVKPJ3DhC77brgX2PZRLAB7q57Rt1qECnNh744EY0EGuOCJWtqeQPPXlk9KG
         EM5g==
X-Forwarded-Encrypted: i=1; AJvYcCWonsF/eHxwJ6721BCvGuSgu9Vj3kDH05Tlr7wvUJl1eXdSzG1f4xgFofiYMILnud/nAAGA2HDWEfBTSBs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxkZ9VG8PE2XgPs1zNZAiQNE3rm/JerHOwcmZRaIMBZPpwDiOjU
	VV0ub2Y2i+GkDOyq6UUn4Bo61CcbmAVyosQ0P9DGe1+1V43llNIcDUZZiItKGBz5kHURVRUvuuh
	/I6aI6Gm5vopayEcpxipd9W6bpEtnbnkdkDToiemqvo60fvPN65yhlW5e+xbcrAHP12o=
X-Gm-Gg: ASbGncsDtk6F1EnQLFSvHQo6wxwuLqQtdRAFo4oNifOG84JHWnZwqmmb3C0vrBk5z67
	KXMZAEg/TzG8F+TCJLNIJemCnDO5CZjfne3H0iPJxPOAku6fPvTry5SIArOfZzw/efhOJP2Nqc2
	fDGk3AT1Ta1Z1hTsSpQAenNk2qHhUJ2ZlmTOV4KwPlbfIINAmjM8KRbDaeg4KeUruF6bJrZ7DT8
	rOkofu4rR3fLTMLVaiYS33mOMJNPqgQYSoz/hybkCXpBHpi9CyVHkHI9w700RZ93w2NbX/t9OzG
	3xbSUVnnUlL1uq13Xu/NlxXoELqfs5nB3SJhda/Ln5az7yLasFvwSrOUEM0C4WYg1RnBsHdAKsy
	XJqUTKvye+UmGlB3it13wvdCC+l/VPvjTGhu5lwvyoOnID8W848K0tSWySwiTr87FFTbBnbQfMW
	O04A==
X-Received: by 2002:a05:600c:548c:b0:468:9e79:bee0 with SMTP id 5b1f17b1804b1-471177bc126mr93668025e9.0.1760972740508;
        Mon, 20 Oct 2025 08:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/OQhxSYFv83q9Vf5Py7culoO2ecRKhVrom0FLqX6Ye00kYF5psp1cT3TotftVkvxc4hvwLg==
X-Received: by 2002:a05:600c:548c:b0:468:9e79:bee0 with SMTP id 5b1f17b1804b1-471177bc126mr93667645e9.0.1760972740118;
        Mon, 20 Oct 2025 08:05:40 -0700 (PDT)
Received: from [192.168.10.27] ([151.61.22.175])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4710ed4b47fsm117263495e9.4.2025.10.20.08.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 08:05:39 -0700 (PDT)
Message-ID: <cfc43786-5a9d-4813-b8ac-a8a55f430f03@redhat.com>
Date: Mon, 20 Oct 2025 17:05:37 +0200
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
Subject: Re: [RFC PATCH v3 00/10] paravirt CPUs and push task for less vCPU
 preemption
To: Sean Christopherson <seanjc@google.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
 maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org,
 vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com,
 rostedt@goodmis.org, dietmar.eggemann@arm.com, vineeth@bitbyteword.org,
 jgross@suse.com
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
 <aPZIGCFk-Rnlc1yT@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <aPZIGCFk-Rnlc1yT@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dao9-vCCMXJt7EnxqKcEGxSjFgE5dXsuyrO5AyCB6pU_1760972740
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 10/20/25 16:32, Sean Christopherson wrote:
>   : Till the hint from underlying hypervisor arrives, another idea is to
>   : approximate the hint from steal time.

I think this is the first thing to look at.

Perhaps single_task_running() can be exposed in the x86 steal time data 
structure, and in fact even in the rseq data for non-VM usecases?  This 
is not specific to VMs and I'd like the steal time implementation to 
follow the footsteps of rseq rather than the opposite.

Paolo


