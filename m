Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA8D292B07
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 18:03:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFM4L3hZwzDqfL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 03:03:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=OsciWpbx; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=OsciWpbx; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFM271VNnzDqWx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 03:01:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603123286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnOeLfGLTUy5AgN8jhCNmXzK0dSH/7S/Ox3jrYuwhp4=;
 b=OsciWpbxdXaV+0+i/en2ntNJiLKGdy2YT99GhrrIlavEyXSt/xEygtQWpiv+zGp5BaCaNg
 H5k9kyFcGONIiHG6kaI2SV6Hl+2PV2l3bVR18toOrhIzMhsoXDIJICpsoeyZ1KnCP6Ym9n
 /H96Q5RSxrd0b4tFXwxuDbvFnq8Cdyw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603123286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnOeLfGLTUy5AgN8jhCNmXzK0dSH/7S/Ox3jrYuwhp4=;
 b=OsciWpbxdXaV+0+i/en2ntNJiLKGdy2YT99GhrrIlavEyXSt/xEygtQWpiv+zGp5BaCaNg
 H5k9kyFcGONIiHG6kaI2SV6Hl+2PV2l3bVR18toOrhIzMhsoXDIJICpsoeyZ1KnCP6Ym9n
 /H96Q5RSxrd0b4tFXwxuDbvFnq8Cdyw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-4t5fYgrSOaKWT1a03e1AFw-1; Mon, 19 Oct 2020 12:01:18 -0400
X-MC-Unique: 4t5fYgrSOaKWT1a03e1AFw-1
Received: by mail-wm1-f72.google.com with SMTP id z7so6052wmi.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 09:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xnOeLfGLTUy5AgN8jhCNmXzK0dSH/7S/Ox3jrYuwhp4=;
 b=aHRLZGw6/cocOPSetwcgo5/EKBDMH126vCw9Afyd7rw3kxKxDGPfkjgrRsPpSsEMCx
 zSxIJZAy9ZxDz7Rhs2s6uwGaBANXimwmLh1Y8oKp+Ev1fo8V3cgF1Z4/3HCWeHjn1hAo
 6R0GgLcj/8FNC2yoSv5tuZQsL2GYtDFPJ9I6dT17SxVxOpbGw76g4VyDnnHBEOxIcmNU
 6w/uVSouGOj5BMcumPDKgyR6bKDvunYz51GZp2iMbNLM/So0BMXbmbZtQVQvVLgIkHd6
 6/VT3gyCX1ilD5uYw5T44Tg/BSkOqrfXAL89G+klQbkzOI8LP7vClb2SP5vFw5w5t2o1
 E2+Q==
X-Gm-Message-State: AOAM530nDvPvKGbwMdNxmWRsZQZBSX70dVViZ6HZOcRjG21erGqpi3Tm
 X11KS5LmgQ/gLJ2TAOBRyp7GSExLQG8badWTl/dVOwZp6+I+duUU91MAFFVRhrWT0gR/WaSYqmv
 oqOS0IQ31QE1kjbbfM2IoLer4Wg==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr245228wrr.57.1603123277243;
 Mon, 19 Oct 2020 09:01:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKxOu81uqDh+9uxrRSdxg88EvBO4mlL2AidEN3mjsJSrEou8SdfIvWp/NkY5z0pMi9CEOU/Q==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr245196wrr.57.1603123277038;
 Mon, 19 Oct 2020 09:01:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x65sm55385wmg.1.2020.10.19.09.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 09:01:16 -0700 (PDT)
Subject: Re: [PATCH 1/4] KVM: PPC: Book3S HV: Make struct kernel_param_ops
 definition const
To: Joe Perches <joe@perches.com>, Paul Mackerras <paulus@ozlabs.org>
References: <cover.1601770305.git.joe@perches.com>
 <d130e88dd4c82a12d979da747cc0365c72c3ba15.1601770305.git.joe@perches.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e1945b90-c97c-f998-56b2-e5635992848a@redhat.com>
Date: Mon, 19 Oct 2020 18:01:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <d130e88dd4c82a12d979da747cc0365c72c3ba15.1601770305.git.joe@perches.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: kvm-ppc@vger.kernel.org, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Bharata B Rao <bharata@linux.ibm.com>, Davidlohr Bueso <dave@stgolabs.net>,
 Nicholas Piggin <npiggin@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/10/20 02:18, Joe Perches wrote:
> This should be const, so make it so.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 4ba06a2a306c..2b215852cdc9 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -111,7 +111,7 @@ module_param(one_vm_per_core, bool, S_IRUGO | S_IWUSR);
>  MODULE_PARM_DESC(one_vm_per_core, "Only run vCPUs from the same VM on a core (requires indep_threads_mode=N)");
>  
>  #ifdef CONFIG_KVM_XICS
> -static struct kernel_param_ops module_param_ops = {
> +static const struct kernel_param_ops module_param_ops = {
>  	.set = param_set_int,
>  	.get = param_get_int,
>  };
> 

Queued, thanks.

Paolo

