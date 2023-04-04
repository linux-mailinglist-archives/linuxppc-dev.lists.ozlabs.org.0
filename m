Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA186D5950
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 09:19:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrJzL21CJz3cLr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 17:19:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D9TfVJxH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D9TfVJxH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D9TfVJxH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D9TfVJxH;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrJyW43zhz3bXQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 17:18:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680592705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EgJnOdp/ZioLEfs3ME3hFk19aCJYusVB5BBhbxm9Z+Q=;
	b=D9TfVJxHSnKNTyQjOpLJyje5W3xYUHDriRgjNEmMXkAQCv67pHUZ/lwYHwHkBCFtK/AorM
	8QmK5ClcQupyxLvcwGs7DulKGkJgeW92xTWe9FgSLqrWFRfLQqVLo2odQ2BSC59FecL2Qc
	WLj+nXl/UBtTQrZI8PRbfm00IUHgj4w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680592705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EgJnOdp/ZioLEfs3ME3hFk19aCJYusVB5BBhbxm9Z+Q=;
	b=D9TfVJxHSnKNTyQjOpLJyje5W3xYUHDriRgjNEmMXkAQCv67pHUZ/lwYHwHkBCFtK/AorM
	8QmK5ClcQupyxLvcwGs7DulKGkJgeW92xTWe9FgSLqrWFRfLQqVLo2odQ2BSC59FecL2Qc
	WLj+nXl/UBtTQrZI8PRbfm00IUHgj4w=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-ZqEnwog_NtKllq9gsX3A4Q-1; Tue, 04 Apr 2023 03:18:24 -0400
X-MC-Unique: ZqEnwog_NtKllq9gsX3A4Q-1
Received: by mail-qk1-f197.google.com with SMTP id v5-20020a379305000000b0074a37810157so2727280qkd.21
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Apr 2023 00:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680592703;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EgJnOdp/ZioLEfs3ME3hFk19aCJYusVB5BBhbxm9Z+Q=;
        b=Z2SVyPfO7yQh4hzVOnauARvWOc7QM1i4aICYwwb2elETORkKJYfzTPpn8crK3K3q9+
         w66EyLLO3NdVpPAOa+JdAZrp35ZcTm0R+0x0ft5sxz2dy5XDmm6g9+69ViZNvML5ChAO
         MsLOw7Dy5evjYQk7yng8M1UIVthQFw1xmD74uhb+eK7YitQ6POWGDKpeYovyPgBlPdCv
         /UXQJV5qo7vamWiXs6enDN3x+nIOdkrqZor7wdy/jP9om3jyTWr/9aCSGQANRXTr4uKb
         /W0Pz4nT68TPHwUlGyH9/lwpNEn8GnN+soXvFJim1PAtnGAkf0ydi7+5F0tD2hvnRDDp
         Wcgg==
X-Gm-Message-State: AAQBX9czLBMYzivkMzIAYcIv4O2AWvlLv4dOMvYNOdbg5kcpZBJ29YRx
	V4r7IgTZxO2H35u08Yeru4MCRwaTd45d+gb3hTUUzd1vSUdJc7o1UyOtee500Zy2u1XUgVp3a4t
	AVDdA8PEmDcWTM99OgbZ8kgXg/A==
X-Received: by 2002:a05:622a:1890:b0:3e3:913c:1c9c with SMTP id v16-20020a05622a189000b003e3913c1c9cmr2565555qtc.1.1680592703633;
        Tue, 04 Apr 2023 00:18:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350ax08d6VzguvXyv/lwJjbdIl+nJ0c64Jz/6oChv9QsegzYe3tY0ptJC6OrkeLLUFF2canVQSw==
X-Received: by 2002:a05:622a:1890:b0:3e3:913c:1c9c with SMTP id v16-20020a05622a189000b003e3913c1c9cmr2565540qtc.1.1680592703436;
        Tue, 04 Apr 2023 00:18:23 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-74.web.vodafone.de. [109.43.178.74])
        by smtp.gmail.com with ESMTPSA id t2-20020ac865c2000000b003b635a5d56csm3064528qto.30.2023.04.04.00.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 00:18:22 -0700 (PDT)
Message-ID: <cf3a5ab8-8e3a-d8ef-c391-6b1644652261@redhat.com>
Date: Tue, 4 Apr 2023 09:18:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [kvm-unit-tests v3 09/13] powerpc: Expand exception handler
 vector granularity
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230327124520.2707537-1-npiggin@gmail.com>
 <20230327124520.2707537-10-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230327124520.2707537-10-npiggin@gmail.com>
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
> Exception handlers are currently indexed in units of 0x100, but
> powerpc can have vectors that are aligned to as little as 0x20
> bytes. Increase granularity of the handler functions before
> adding support for thse vectors.

s/thse/those/

  Thomas

