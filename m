Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4DC6C6747
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 12:56:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj3hr4FLfz3f6R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 22:56:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MLMqP0cK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U1oAn8YT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MLMqP0cK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U1oAn8YT;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj3gw1XKqz3cL0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 22:55:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679572535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tGk/j8vrX7r5dPbhWigUgMhkgAKMed1wg6HnqoWMy6w=;
	b=MLMqP0cKruwY5IbhvQHPjKKpjSHxocOXriXdV0DxPwWbJeCbdgzA27NJB9KJx3oUejqGCh
	Miz8/YG2rjcaLrGuRhMPTRAiIa7xROFqnQ7eF/n2uB/uldqBkpyRreh0DV9OzQndjlzzVL
	4Nfks2BWMS2MoCahtRFHG/onOQGZpWc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679572536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tGk/j8vrX7r5dPbhWigUgMhkgAKMed1wg6HnqoWMy6w=;
	b=U1oAn8YTXD4CtHekf/WnOy7makhhfpCTSCoeIDRRchjHYpFq58TvFiZso7Xb9WwgDATY5h
	tqE5sTYmqcUWz7BWPc5M838srG3GhMGwsMDD8tmZ+zE4t38842SQkLnnCkRyrx4LkzmDtb
	6pxPSdiZ+IfkOsbiNpVIQ+69mKRAvvY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-zGde_x8kM6Op3xkDQfOgvQ-1; Thu, 23 Mar 2023 07:55:34 -0400
X-MC-Unique: zGde_x8kM6Op3xkDQfOgvQ-1
Received: by mail-wm1-f72.google.com with SMTP id p10-20020a05600c358a00b003edf7d484d4so836987wmq.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 04:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679572533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGk/j8vrX7r5dPbhWigUgMhkgAKMed1wg6HnqoWMy6w=;
        b=GoEZOnmZHRZPLltc+gvoJMJWkrLl9CB3pNse3Nt3ho7xYUFuNWDPsR19W++59wwRjc
         VYztUSXs15BcxI30QTdrXbM4Wf3vRpWFbERm++VuIdZcihXWP0gvrQu9weVJoljKh6Cw
         AiraZCzFDDlHRSj7qHWpBM482SGTjhjAaLTEGwueYUCkrmdD6enRrVFqSbhnNvGn9i9m
         6Jf39D/c49fDuP5J/cjDJSUHliSqqbx16umEW/deTo/scepsW17+5KsJrVoM0pwNzM1q
         2zsFnty1ObDIkMv/BuW9MYD0YNbpOZ1eIQFdTLnDUQ4LHJ8QPxnOoI0KX1h8JAE9yuLe
         L/MQ==
X-Gm-Message-State: AAQBX9en/FNyUXs776XLa6X7rdrVqRGt0myv39z7OXq/8+XQHOJ/jDRj
	tpM56Wv4xzhwg6siXIjX4o8RU7RJi0rZhM2Dbl/lTSu/eq5ZparQZXlPf4LkOBSylqgWthgHC9w
	BfsAYE5OlTtGnzsd4fkmwWWiJpA==
X-Received: by 2002:adf:ff90:0:b0:2d8:28a9:f9e6 with SMTP id j16-20020adfff90000000b002d828a9f9e6mr2264218wrr.32.1679572533246;
        Thu, 23 Mar 2023 04:55:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350YPuNZYYyzUpcIbxfD7REs3D4UAbd0oztyEO7Q0ufMs36tPm8YxQyWWMujBLUwAGzzPKi651A==
X-Received: by 2002:adf:ff90:0:b0:2d8:28a9:f9e6 with SMTP id j16-20020adfff90000000b002d828a9f9e6mr2264208wrr.32.1679572533024;
        Thu, 23 Mar 2023 04:55:33 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-179-146.web.vodafone.de. [109.43.179.146])
        by smtp.gmail.com with ESMTPSA id b13-20020adff90d000000b002c54c92e125sm16015308wrr.46.2023.03.23.04.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 04:55:32 -0700 (PDT)
Message-ID: <6b08baaa-4117-a7b4-9682-c9fc5b32dc20@redhat.com>
Date: Thu, 23 Mar 2023 12:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [kvm-unit-tests PATCH 4/7] powerpc: Add ISA v3.1 (POWER10)
 support to SPR test
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230317123614.3687163-1-npiggin@gmail.com>
 <20230317123614.3687163-4-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230317123614.3687163-4-npiggin@gmail.com>
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

On 17/03/2023 13.36, Nicholas Piggin wrote:
> This is a very basic detection that does not include all new SPRs.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   powerpc/sprs.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)

Reviewed-by: Thomas Huth <thuth@redhat.com>

