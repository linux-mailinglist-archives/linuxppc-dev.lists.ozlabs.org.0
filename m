Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DCC6D594B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 09:17:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrJxx1Z8Qz3chb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 17:17:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gd2TbU5P;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gd2TbU5P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gd2TbU5P;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gd2TbU5P;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrJx63jKhz3bXQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 17:17:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680592630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NRYJdvmu2YT9+EZW2Y9gyrF6TzJ/lvpdC+QFmt09whw=;
	b=Gd2TbU5PLdrqTxidaF4SxXFFrx8evn/CfqvsKyzyyMGpjLF8QhriKJn+smY9HbHbDhZZQs
	FvqykJGfcF6lSQIMPTgW+aULNvyoPT28N4ATiDp8d60J05zKlVgc+8Of4d6WUr0SLuME0y
	hTZDZ6VlG9YB5eCB8Br4Tj8uWSufB+g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680592630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NRYJdvmu2YT9+EZW2Y9gyrF6TzJ/lvpdC+QFmt09whw=;
	b=Gd2TbU5PLdrqTxidaF4SxXFFrx8evn/CfqvsKyzyyMGpjLF8QhriKJn+smY9HbHbDhZZQs
	FvqykJGfcF6lSQIMPTgW+aULNvyoPT28N4ATiDp8d60J05zKlVgc+8Of4d6WUr0SLuME0y
	hTZDZ6VlG9YB5eCB8Br4Tj8uWSufB+g=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-mWPx5E5oOL6fivKIgKPvUA-1; Tue, 04 Apr 2023 03:17:08 -0400
X-MC-Unique: mWPx5E5oOL6fivKIgKPvUA-1
Received: by mail-qv1-f70.google.com with SMTP id v8-20020a0ccd88000000b005c1927d1609so14103766qvm.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Apr 2023 00:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680592628;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NRYJdvmu2YT9+EZW2Y9gyrF6TzJ/lvpdC+QFmt09whw=;
        b=mPpg+RyaX0mfRNiQeqidS3Z5iSBc6OUN8KNtrGHosjnNJb0bZUeEUu4vJCU0o24mp2
         439KAA6eb5IAr34WC3IBCFJHf3jXPtgQbLUfPPVxwBECDVbtfZDs8GR0g7bbkwNuMVna
         rcWkIz0otmWNC8+NYgnuqbgalgmvg5aDOwmuTQRwA/S1K9U2vof6mIsPCKiT9A+W7O3Q
         BEHfHUyIQfsf9RmT3srFrLpbmz90LfQFucPZa9UT8r/LofA8ZEHh50TfBOrg6zjISpqW
         +GLG2J4fvlJrpk4AygyHdco40TyD7tfri4yX2N6lLtWV+Tnpxj+c9ydVMCHVQs22ZIIM
         cRMg==
X-Gm-Message-State: AAQBX9fK2M8oEl5Fgcqqfwpvu52o1Fl+iK9b0mJYp+ZWfrrUZ4/0xeqj
	/Pg42afpfJFSsbOx+YW0q2K+fO/rMs7lZ/IQUKTadhWY03olrjBGAoYvslmTf1a9ejofRYfMafM
	M2BHszMmPB/v1ngOoIGxeXCRc9A==
X-Received: by 2002:a05:6214:27e5:b0:5df:44f2:e97d with SMTP id jt5-20020a05621427e500b005df44f2e97dmr33283682qvb.19.1680592628185;
        Tue, 04 Apr 2023 00:17:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350b6/Qv/o3wVhUyDFX4zCkfQ4F1t3P/9CUFpq6rARbRXin+E+2DWPBrOHxMRu4dS2R5/r6Cm9g==
X-Received: by 2002:a05:6214:27e5:b0:5df:44f2:e97d with SMTP id jt5-20020a05621427e500b005df44f2e97dmr33283667qvb.19.1680592627968;
        Tue, 04 Apr 2023 00:17:07 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-74.web.vodafone.de. [109.43.178.74])
        by smtp.gmail.com with ESMTPSA id k5-20020a0cebc5000000b005dd8b9345d3sm3160219qvq.107.2023.04.04.00.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 00:17:06 -0700 (PDT)
Message-ID: <de9407df-e3cf-8545-53fa-df7d671b4ea8@redhat.com>
Date: Tue, 4 Apr 2023 09:17:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230327124520.2707537-1-npiggin@gmail.com>
 <20230327124520.2707537-9-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [kvm-unit-tests v3 08/13] powerpc/spapr_vpa: Add basic VPA tests
In-Reply-To: <20230327124520.2707537-9-npiggin@gmail.com>
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
> The VPA is an optional memory structure shared between the hypervisor
> and operating system, defined by PAPR. This test defines the structure
> and adds registration, deregistration, and a few simple sanity tests.
> 
> [Thanks to Thomas Huth for suggesting many of the test cases.]
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
...
> diff --git a/powerpc/Makefile.ppc64 b/powerpc/Makefile.ppc64
> index ea68447..b0ed2b1 100644
> --- a/powerpc/Makefile.ppc64
> +++ b/powerpc/Makefile.ppc64
> @@ -19,7 +19,7 @@ reloc.o  = $(TEST_DIR)/reloc64.o
>   OBJDIRS += lib/ppc64
>   
>   # ppc64 specific tests
> -tests =
> +tests = $(TEST_DIR)/spapr_vpa.elf
>   
>   include $(SRCDIR)/$(TEST_DIR)/Makefile.common

That reminds me: We added all other tests to Makefile.common ... without 
ever checking them on 32-bit. Since we removed the early 32-bit code long 
ago already (see commit 2a814baab80af990eaf), it just might not make sense 
anymore to keep the separation for 64-bit and 32-bit Makefiles around here 
anymore --> could be a future cleanup to merge the Makefiles in the powerpc 
folder.

Anyway, that's not a problem of your patch here which looks fine, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>

