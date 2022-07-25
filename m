Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B11058011A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 17:03:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls3FZ1CLcz3dpb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 01:03:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F5KaVJZE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GuvSgrGb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=javierm@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F5KaVJZE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GuvSgrGb;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls3Dv5B3qz3c74
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 01:02:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658761356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vHZGGE+UaT0lsujpHFYRwMapEZrOG0uqXxvqP8vp3jo=;
	b=F5KaVJZEY73JeqT73YTM0l/EPqs7PFJBEFOBrXDmGTP4ilJCDaRcW9kEIpi7d284meB/Ou
	U1RKOH0NfAODySBiwDR/Jli/Q8+/y49EoHOjTjtpVeBovn8Bp0SSQ9wewUQq66vgu2VnxZ
	aUMZ4UgVT4qVlQ7Bxie6lGXaKEOCVSA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658761357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vHZGGE+UaT0lsujpHFYRwMapEZrOG0uqXxvqP8vp3jo=;
	b=GuvSgrGb5hYzZdz433UTXHO6rMonZw/5z9p0rTPC03wi4dB1BuYRkqnEmPuWEb24syNYEH
	YKR/iMGwq6i5ngd+vMdlYxVN9s/GqBJ626wKR4DPGkbmBnP7YhJ5Tdjugx7IUIIx0z/vcZ
	UZOTyhZJsZRkYVpAVzY7/alozYejP+M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-bg9RbzB1Piy8mdpdaKq4jQ-1; Mon, 25 Jul 2022 11:02:35 -0400
X-MC-Unique: bg9RbzB1Piy8mdpdaKq4jQ-1
Received: by mail-wm1-f71.google.com with SMTP id az39-20020a05600c602700b003a321d33238so6316473wmb.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 08:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vHZGGE+UaT0lsujpHFYRwMapEZrOG0uqXxvqP8vp3jo=;
        b=aC+kZ5RkakolkQ5reocWSHCTt5zVv9R1kJ1qSm2ykodh+pQmK586ykm7TxoEDafx6t
         pQLdZvypzZenboca9hZH2ibm6TWcy3+4MIOusX/P022eQ015pHSdXpB50cZl95pm3iX0
         VjoH/1lRflsh5eTyPGWOiCxci+rbXQCk0o7hoqsAOlpfk55qnlSlJkvPzLWBVoOPQZzn
         Uh9ZFDSKaOmlZGWbTWCzjLbZEK4He3gKfV8cM09AanQPDDAZg9IaLkO/ihmQN3x32Af9
         igj3RZnnUNyNiJ0G0l1LqnKjcKjxf9POJC2o4jKoQ6I0iOk2iUPGpmT+Ju2VUpAasSap
         cj5w==
X-Gm-Message-State: AJIora8KYGNcHup8IKr0jqzFt82ffARCChroUIUhxrUZaOSCTGqq5pMf
	IDGpdgJwseAlhA4rEf2AQWsjsoNmE774uxRzmD3K2J8asSv7z8DazAY/acHVr3TdmMI4GalOkaL
	vLs2CUMmtudfsGHAKlFodfHj4BQ==
X-Received: by 2002:adf:fd42:0:b0:21e:4357:3f38 with SMTP id h2-20020adffd42000000b0021e43573f38mr7802990wrs.620.1658761354386;
        Mon, 25 Jul 2022 08:02:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1up2wqjTlCDkbuerUzqw3y4Lua29GD9rdcA18jLXX1pQ9fCVhFmF2mw6dWG6b5ahUovhc3P7w==
X-Received: by 2002:adf:fd42:0:b0:21e:4357:3f38 with SMTP id h2-20020adffd42000000b0021e43573f38mr7802975wrs.620.1658761354219;
        Mon, 25 Jul 2022 08:02:34 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id o27-20020a5d58db000000b0021d80f53324sm11992170wrf.7.2022.07.25.08.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 08:02:33 -0700 (PDT)
Message-ID: <307f7551-aa47-ea36-ea58-ab4c552dca38@redhat.com>
Date: Mon, 25 Jul 2022 17:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 03/10] drm/simpledrm: Remove pdev field from device
 structure
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-4-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/20/22 16:27, Thomas Zimmermann wrote:
> Replace the remaining uses of the field pdev by upcasts from the Linux
> device and remove the field.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Much better indeed.

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

