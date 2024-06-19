Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C272290E4A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 09:36:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQjLiS3w;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQjLiS3w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3wRD2FLgz3cT2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 17:36:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQjLiS3w;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQjLiS3w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3wQW0XkKz2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 17:35:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718782543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=q/BQulokRbiv0wrCAWzsfhXc40RD7RvdpYrqYPWW0K0=;
	b=hQjLiS3wRbBTUVoTceBc8rA5saZpI/2UCAi18sWNN2NzT/tqdLTwdAonwypw9RWcHtdIrx
	uLt0Czu6YKFuFt4mlTPar1cFC3zfrkZVFwtdesO+qckRsj9ouEeb1Dgmp69VcGzYy0Z9XD
	pXrzaKRnBNesIp/c/sQpxrUQFdKUkIQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718782543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=q/BQulokRbiv0wrCAWzsfhXc40RD7RvdpYrqYPWW0K0=;
	b=hQjLiS3wRbBTUVoTceBc8rA5saZpI/2UCAi18sWNN2NzT/tqdLTwdAonwypw9RWcHtdIrx
	uLt0Czu6YKFuFt4mlTPar1cFC3zfrkZVFwtdesO+qckRsj9ouEeb1Dgmp69VcGzYy0Z9XD
	pXrzaKRnBNesIp/c/sQpxrUQFdKUkIQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-MTnpTgAiP8C2EAGEaiCf7Q-1; Wed, 19 Jun 2024 03:35:41 -0400
X-MC-Unique: MTnpTgAiP8C2EAGEaiCf7Q-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-797f788afa8so118055685a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 00:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718782540; x=1719387340;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/BQulokRbiv0wrCAWzsfhXc40RD7RvdpYrqYPWW0K0=;
        b=mZSA6U7hHYqQH0S8rRZi0zUW0/aLXp7P7JJfeX0XQVuKl+5YhoDKeaKGjxsgwNQDeH
         s6GQ8SumpHAM2BuObgd41Qmkfgccw3xNNOKW+Afv91kgbCqfM2NAQTPZ2Bwg9kcFJyFE
         jQBGSdPcjFqBsCEGiaEXwZBwcY7IujrcpPJo1DKjA4olHEuS5oT+7YU686WxZ9DRzPiT
         H1CZIn085om/psQgVToLfTzZKrKqsTfHKOt7eRyo4SGXz2tAPpYdBl74YL3u/r7AuxNG
         6MFJDYb39uUnKPVaZxW05czn2d6mfT+m3RMDpILSEc/HCaFJbF3T+U+d3vKzDwluR7cV
         nrDg==
X-Forwarded-Encrypted: i=1; AJvYcCWvm6eRxnx85xdy/ZT4AxueTvkksAvdsZCTwGYwriKvebPmoyqZTTab0VsjJuJD+UtnLlkNXvJ76XdPfjmHtJlc3007Jarhry5gsWclIw==
X-Gm-Message-State: AOJu0Yz0YoTWpjH0iDDpH/Wu08zHju6Oq9WolJP5N9WPIk8CAEBW2taS
	Zhj+8vvS3ZVq9SM2Xeix9Oz/q1GK08vIU8ktdz+7B3Lpc/ddAANnbfAlOE8EQ29grEWfj8cg6HU
	yPqCPg85DkBGyUBmUw6wAZWgJeExdi9FX2Fj7hFaj1cWRNVtMNkgsxMs+XchbaRk=
X-Received: by 2002:a05:620a:4244:b0:797:f5ee:91d with SMTP id af79cd13be357-79bb3631838mr388962785a.24.1718782540597;
        Wed, 19 Jun 2024 00:35:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMmqqguxQCN8SZleowNGrch5Z/OQRIx49idbwBka8IY6uOdIvgROYxtc3m6xIk3THUjzpucA==
X-Received: by 2002:a05:620a:4244:b0:797:f5ee:91d with SMTP id af79cd13be357-79bb3631838mr388958785a.24.1718782539327;
        Wed, 19 Jun 2024 00:35:39 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-178-117.web.vodafone.de. [109.43.178.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-444ab89f4e1sm3465311cf.85.2024.06.19.00.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 00:35:39 -0700 (PDT)
Message-ID: <a262802c-f0f4-4004-9acb-cb97d94980c6@redhat.com>
Date: Wed, 19 Jun 2024 09:35:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v10 14/15] powerpc/gitlab-ci: Upgrade
 powerpc to Fedora 40
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240612052322.218726-1-npiggin@gmail.com>
 <20240612052322.218726-15-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240612052322.218726-15-npiggin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/06/2024 07.23, Nicholas Piggin wrote:
> QEMU has fixed a number of powerpc test fails in Fedora 40, so upgrade
> to that image.
> 
> Other architectures seem to be okay with Fedora 40 except for x86-64,
> which fails some xsave and realmode tests, so only change powerpc to
> start with.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   .gitlab-ci.yml | 2 ++
>   1 file changed, 2 insertions(+)

FYI, I've pushed now the generic patch to bump all jobs to F40, so I think 
you can drop this one here from your queue now.

  Thomas


