Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C83E0745D47
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:28:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cSMhxyW4;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cSMhxyW4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvmwP3850z3bkM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 23:28:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cSMhxyW4;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cSMhxyW4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvmvV1Fx8z2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 23:28:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688390883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycsPEf+hk8Q2JnOBMERVIv1v1bxnQ/4XY8nDOt3hLFE=;
	b=cSMhxyW41m4t5Q4N9WErBHPb/CLNqMsrOyV3IiJsxyv6rtxbgM+7UtTTzjCq7ECF/a7WAa
	AzUuuRBa52Ay8BYgmQlC7NFaFEOBhDE4GBeUSRiwAKN28grmlEe9mcroaHvONRZb6KYG2/
	6o+EzrBomK60Rhkmd0sNL7ihmtVHuR4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688390883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycsPEf+hk8Q2JnOBMERVIv1v1bxnQ/4XY8nDOt3hLFE=;
	b=cSMhxyW41m4t5Q4N9WErBHPb/CLNqMsrOyV3IiJsxyv6rtxbgM+7UtTTzjCq7ECF/a7WAa
	AzUuuRBa52Ay8BYgmQlC7NFaFEOBhDE4GBeUSRiwAKN28grmlEe9mcroaHvONRZb6KYG2/
	6o+EzrBomK60Rhkmd0sNL7ihmtVHuR4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-VDT2T9PjP6e2nJwIVJCPbg-1; Mon, 03 Jul 2023 09:28:02 -0400
X-MC-Unique: VDT2T9PjP6e2nJwIVJCPbg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4033a6deb00so24102111cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Jul 2023 06:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688390881; x=1690982881;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ycsPEf+hk8Q2JnOBMERVIv1v1bxnQ/4XY8nDOt3hLFE=;
        b=YzIDswyl/iWRxSyy/F7KB77OxErs5wSicECv4vNXRRsECeKWxXSWN/ECNVqn2mtvsJ
         M9RUvAKSv7ghxpZt3PhvUFPnStDV5tgJHwTEPQ3QykESNn03wubvmOpfThzqNrnUS58N
         mBQ/fFiR8MgkpOyZRdYmTzV6j/dcYEjkL0eXAdVgoawyMaMllTeYaHHLwstcjQmVRC7B
         v202aTbiu7i++7FnNjBEoAfoiFfoejBDb5A53IsZhVLlu/sCBxvRtAEZwKh2xUPzahAY
         G0la5yaxjWx/b+dHi6acjh8te6udXhnIxDC3e6fl54GWAUAbJ6AFixzIU/W4/jOOUbbS
         MNIw==
X-Gm-Message-State: AC+VfDwqlTEeEhLWyPEOwZqF5QKLUUJ7eU+7ae5RipQ97WSyBMoSxid2
	d44IBekPpiwH+Vzq4jNjbyhZpinNf24rI/rSVxdtkWCoeCkqdTlWihwSsVHmyPRSGOg2CGA34kD
	ITVD6Jk/GXUw7sdAVDfLi+KNmtg==
X-Received: by 2002:a05:622a:1392:b0:400:9a53:75cf with SMTP id o18-20020a05622a139200b004009a5375cfmr18644555qtk.30.1688390881804;
        Mon, 03 Jul 2023 06:28:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5pGep0ZvHdyMHlfEcnPcwLb3nLyZyg6SGhfYHWcOPFIl3YZF8OBAcIezkPj1r9OSXjvN/daw==
X-Received: by 2002:a05:622a:1392:b0:400:9a53:75cf with SMTP id o18-20020a05622a139200b004009a5375cfmr18644535qtk.30.1688390881548;
        Mon, 03 Jul 2023 06:28:01 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-127.web.vodafone.de. [109.43.176.127])
        by smtp.gmail.com with ESMTPSA id n7-20020ac81e07000000b004033992e2dbsm4891888qtl.45.2023.07.03.06.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 06:28:01 -0700 (PDT)
Message-ID: <f2d4d019-4a77-7ba9-d564-6e39b194a5d8@redhat.com>
Date: Mon, 3 Jul 2023 15:27:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230608075826.86217-1-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [kvm-unit-tests v4 00/12] powerpc: updates, P10, PNV support
In-Reply-To: <20230608075826.86217-1-npiggin@gmail.com>
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

On 08/06/2023 09.58, Nicholas Piggin wrote:
> Posting again, a couple of patches were merged and accounted for review
> comments from last time.

Sorry for not being very responsive ... it's been a busy month.

Anyway, I've now merged the first 5 patches and the VPA test since they look 
fine to me.

As Joel already wrote, there is an issue with the sprs patch, I also get an 
error with the PIR register on the P8 box that I have access to as soon as I 
apply the "Specify SPRs with data rather than code" patch. It would be good 
to get that problem resolved before merging the remaining patches...

  Thomas


