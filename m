Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C926D59BD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 09:35:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrKKZ36XQz3ccr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 17:34:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CLCy62Cb;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CLCy62Cb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CLCy62Cb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CLCy62Cb;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrKJl0mtKz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 17:34:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680593652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=99tQM16AOIPSiD36e9lC8KgNlMe8A/CLkwAQnzAPAlM=;
	b=CLCy62CbwyAVNK3NdQaTMLAhgAvNhvQHaSYEqw0eXRPRYIg0q6ehHOpDbqZcoj/9uudkh0
	PecQxjPkcYG5YvHuBfscf7VQN6+3rhOSWEbQVMbxquaqpPMtIDx/pMlNlZH2VnxEOy8Akb
	BSBpIeCbpUnqKytZlFa4HMaGuFcqGkM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680593652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=99tQM16AOIPSiD36e9lC8KgNlMe8A/CLkwAQnzAPAlM=;
	b=CLCy62CbwyAVNK3NdQaTMLAhgAvNhvQHaSYEqw0eXRPRYIg0q6ehHOpDbqZcoj/9uudkh0
	PecQxjPkcYG5YvHuBfscf7VQN6+3rhOSWEbQVMbxquaqpPMtIDx/pMlNlZH2VnxEOy8Akb
	BSBpIeCbpUnqKytZlFa4HMaGuFcqGkM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-cmKcvQV6MB6F7niXeQ9tAw-1; Tue, 04 Apr 2023 03:34:10 -0400
X-MC-Unique: cmKcvQV6MB6F7niXeQ9tAw-1
Received: by mail-qk1-f198.google.com with SMTP id c186-20020a379ac3000000b007484744a472so14029121qke.22
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Apr 2023 00:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680593650;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=99tQM16AOIPSiD36e9lC8KgNlMe8A/CLkwAQnzAPAlM=;
        b=rUyRlgWfdjXY0uxYCM/QjUOKHD+gpuBUL5ZwrSJ2xPlVq4msgMpX7gp9r7uiUH/R5b
         oGMZhMBRERkW19te9ChaYsWxGaNlnpuBdMiPlbRmGkpjBubmfg/cUvueeRTkEk7uSycN
         h3LWF3USZo9winw3EzWsv7/O1M7EqawpBZlPndK2xGSoUCu4K41dL/q8TTVt9SH6GjCz
         4ShG2W5KYQd1uA1q3Bsnvs6zclZnEkOFapkRjEDK6rmhtzdsZYefZpM6aQRCc8r8OyOX
         xfgHrfp6kkYzM2OUfZAajaFtBj1IK7wPflkCaU9gS9Ih0PxuduxT2uYJfRIioGVx6VsC
         k62Q==
X-Gm-Message-State: AAQBX9dhIW4VJI2mAV428LJ1R27YaXykdoAkFWKywNlbBfs2OLI1PhRT
	JVu8DydUla4UADBHcfiSP4afjw05GjigYQ8ypdgq7zHNGNCYaLUbkmjZSpAfLDOGNdQJ2lVZYPL
	Hw6yZFHPutuuXapiqr1I1vz2vCA==
X-Received: by 2002:ac8:5bd1:0:b0:3bf:b5fe:372d with SMTP id b17-20020ac85bd1000000b003bfb5fe372dmr1675112qtb.61.1680593650213;
        Tue, 04 Apr 2023 00:34:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yn6pC2+LOXbHC+brsOhPYWbUELBitKuSNkTaw8rn7U2Tsgh0u4bgya1L8Kaug4snYGGiJM5g==
X-Received: by 2002:ac8:5bd1:0:b0:3bf:b5fe:372d with SMTP id b17-20020ac85bd1000000b003bfb5fe372dmr1675096qtb.61.1680593649980;
        Tue, 04 Apr 2023 00:34:09 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-74.web.vodafone.de. [109.43.178.74])
        by smtp.gmail.com with ESMTPSA id m124-20020a375882000000b0073b8745fd39sm3385199qkb.110.2023.04.04.00.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 00:34:09 -0700 (PDT)
Message-ID: <773ea477-2702-0511-eaca-2a110c5bf13d@redhat.com>
Date: Tue, 4 Apr 2023 09:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [kvm-unit-tests v3 11/13] powerpc: Discover runtime load address
 dynamically
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230327124520.2707537-1-npiggin@gmail.com>
 <20230327124520.2707537-12-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230327124520.2707537-12-npiggin@gmail.com>
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
> The next change will load the kernels at different addresses depending
> on test options, so this needs to be reverted back to dynamic
> discovery.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   powerpc/cstart64.S | 19 ++++++++++++++-----
>   1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
> index 1bd0437..0592e03 100644
> --- a/powerpc/cstart64.S
> +++ b/powerpc/cstart64.S
> @@ -33,9 +33,14 @@ start:
>   	 * We were loaded at QEMU's kernel load address, but we're not
>   	 * allowed to link there due to how QEMU deals with linker VMAs,
>   	 * so we just linked at zero. This means the first thing to do is
> -	 * to find our stack and toc, and then do a relocate.
> +	 * to find our stack and toc, and then do a relocate. powernv and
> +	 * pseries load addreses are not the same, so find the address

With s/addreses/addresses/ :

Acked-by: Thomas Huth <thuth@redhat.com>

