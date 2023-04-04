Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0566D59B6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 09:33:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrKHZ4vNvz3cfg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 17:33:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BQn/ZtVw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BQn/ZtVw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BQn/ZtVw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BQn/ZtVw;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrKGk5FKxz3c7X
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 17:32:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680593547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KQO5h3+WmOjHOdR/RQTb8OxWC50lKlPJekouNAzkZ20=;
	b=BQn/ZtVwPmUS8d68NdUb/cMu3wcSq+Kb6McRcS9ophvHgOoqpYrr6I7krtDVV74Wco6mGf
	JraKjLifUC6uEp0700asJkuvvGzA07ggWTyVgh89bp5j0AAN1Z7gnaxUZLnI2mKiOI2eA/
	h8kzs9sB+F8WNm1ELQalvSqRb/3jTxs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680593547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KQO5h3+WmOjHOdR/RQTb8OxWC50lKlPJekouNAzkZ20=;
	b=BQn/ZtVwPmUS8d68NdUb/cMu3wcSq+Kb6McRcS9ophvHgOoqpYrr6I7krtDVV74Wco6mGf
	JraKjLifUC6uEp0700asJkuvvGzA07ggWTyVgh89bp5j0AAN1Z7gnaxUZLnI2mKiOI2eA/
	h8kzs9sB+F8WNm1ELQalvSqRb/3jTxs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-fvc_a-NCM7Ke3_apezcO6Q-1; Tue, 04 Apr 2023 03:32:25 -0400
X-MC-Unique: fvc_a-NCM7Ke3_apezcO6Q-1
Received: by mail-qt1-f200.google.com with SMTP id r22-20020ac85c96000000b003e638022bc9so9571512qta.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Apr 2023 00:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680593545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQO5h3+WmOjHOdR/RQTb8OxWC50lKlPJekouNAzkZ20=;
        b=OnKVBXwcG5jYOAP+Nk5UBtmEMekE/glxTKF/6aStDqEEk/YwMXqn/CdpttfEtA+jAt
         i9yYmcn/ei50gjYe1Np3IoyEzaFgx38pDn5YUHHXq1uEVoH0iBamJB8n7UOehCoFenyx
         RWRBsdAg2Uj6VZqm+8uSMVWG+kQ1JoXBkQBEg8Ym85Xdx+br7blTMcDicZwNdDDKmDC5
         YNs1ZsWRoXAsUy5W3t/F+mZTAfzGLDwu4L5ahDkT1ys+G18AIiawP9bAz18aJ7KEuyNh
         CWvPSWMsQ3uCG89W1ya4/3kqduOrHsfdERaiwMywf3O/Uowy52cMgwmxcytJ+17jCof8
         lWMQ==
X-Gm-Message-State: AAQBX9cJXEPO8Hdyw+L0RoqguxFAyilQB3iMiBqjYST8BjdyTRqQxOX4
	vv1Rmiiy3ijlYYiU0b6t6IJ91oFyNiRgCaw1FoJud2/UJi43jyNtywsXnsW2j8Y6JWW4XE+i64L
	z+h8iB0PDjmFrP1VGgzXaVvmbcA==
X-Received: by 2002:a05:622a:182:b0:3e4:eb53:b02b with SMTP id s2-20020a05622a018200b003e4eb53b02bmr1896139qtw.9.1680593545528;
        Tue, 04 Apr 2023 00:32:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZDOir1Y35E8xclX+Hnf46F/a/hbN46cWKyCZKECKxBaGphhxYeckRUlR/kD3u2/NfBjSZoGg==
X-Received: by 2002:a05:622a:182:b0:3e4:eb53:b02b with SMTP id s2-20020a05622a018200b003e4eb53b02bmr1896125qtw.9.1680593545342;
        Tue, 04 Apr 2023 00:32:25 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-74.web.vodafone.de. [109.43.178.74])
        by smtp.gmail.com with ESMTPSA id dt8-20020a05620a478800b00748461ac012sm3372415qkb.63.2023.04.04.00.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 00:32:24 -0700 (PDT)
Message-ID: <4ba1d826-b291-2120-f34f-e1e674608614@redhat.com>
Date: Tue, 4 Apr 2023 09:32:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [kvm-unit-tests v3 10/13] powerpc: Add support for more
 interrupts including HV interrupts
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230327124520.2707537-1-npiggin@gmail.com>
 <20230327124520.2707537-11-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230327124520.2707537-11-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/03/2023 14.45, Nicholas Piggin wrote:
> Interrupt vectors were not being populated for all architected
> interrupt types, which could lead to crashes rather than a message for
> unhandled interrupts.
> 
> 0x20 sized vectors require some reworking of the code to fit. This
> also adds support for HV / HSRR type interrupts which will be used in
> a later change.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   powerpc/cstart64.S | 79 ++++++++++++++++++++++++++++++++++++++--------
>   1 file changed, 65 insertions(+), 14 deletions(-)

Acked-by: Thomas Huth <thuth@redhat.com>

