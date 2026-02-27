Return-Path: <linuxppc-dev+bounces-17384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPfEGrVyoWkPtQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 11:32:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763DF1B6048
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 11:32:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMl4x3CZFz3bmc;
	Fri, 27 Feb 2026 21:32:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772188337;
	cv=none; b=KZBC0+lpoy88P2LMeqeWTIW+U/HZIb7nyZaz0RfuNeXkd42bJP0vyvRlCaNKkRQhIteHn3591u+0tIRqrMn3vTwP6EvdfIBLdPoEX+k8EJBXelVth9XPYftnvnTX50/gYoJlp8cSy5Eujwlh7pv3eE8MDe9OEJeCKX3XfZ9iy+Qwq9NsryO6UF5HHGa3hJqkYvnP76uakYsTzk3f/9PdCM7cExEVu3l9l7d2rZ0SpyYifG0eEZXXNHYCV5ebJv9+qIwcvKeOUnlXH3kWXtel0YGCebUTJKsjSudoVviVFgNrjgfQluwBgs+DwsireCYzZrt7En/CFkdlWOxP6naIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772188337; c=relaxed/relaxed;
	bh=LT1HXP6ImCtKkrDGFwhhoLVXorV0oXPyJhBSmf51vOA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=VDCys0m/WM6bopRhSkVtEZHAIi7oFcUhDVuEmRUNk8lcL9QzHxCYG+xS+m0BLQ8vyrfavh+sUQO1Ko0u8TbADofv4AM0OkR8kypDrtwRzKn1jEHDx2euKDBo7cq3DocndR5/RAkBLb662kve9L98YL5XD7R583lbybHg9OFjOVuQzBAa6nDFKXuF3nSxdcr+MCboMZ2bLUhAxgpiYQqpDpQt3ouOqanhBcTequCoTCaBKCYAPMWn7do+Oi/EpmEx31JrB0tk7MLJCEK8YYA0K7MPeax5NKMwBNykEF1+ti3u45vcEnSqqnNExrKKFeEleLMUW4rgrTtWSLLDV2Baqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m6a80jh+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m6a80jh+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMl4w24QSz2xYw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 21:32:15 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c6e5998f90dso696555a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 02:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772188333; x=1772793133; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LT1HXP6ImCtKkrDGFwhhoLVXorV0oXPyJhBSmf51vOA=;
        b=m6a80jh+ExY3JtFUDK6PEQUU7Xow/9GlfSKifuPGA54JC6qSGmPJkGstvUiYYsAwn4
         8p/tTbFga5W2rV2lxokQkzz7FzaknydT3CvTeHLXLtnsSw1Ugph0lDxq45dvb225FaoS
         cPzbGFGV0mzZQQZg6mcqZmarKXI3ur9gPLsZQpvUKhSoTQB1lzz2dpbrSJeh2ysG93tP
         PkoWfvPWC6E5A0aByQZWNhnsYBW0kOijFHsaIPw6U6xj2C6176JcDRUm0sGhlOSE0tBY
         NpmLqA2oxehE3S0MXZAxDHbhowSOU48OapidwfQ2debfgT3pUbGKyuKrw7FfvJIr/cnf
         A9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772188333; x=1772793133;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LT1HXP6ImCtKkrDGFwhhoLVXorV0oXPyJhBSmf51vOA=;
        b=sJKV+MyVegAo3nO6z0z6i1vvSu39SkJEalH2XFBrgcHM6LqpSN/mVucZ2mH7hEaydk
         0c4+f6Rbu0iZu/Guf9KWgPUN1N5aGjKoatV9A/NlPEGvp1+b92Y0s12IvSJ1WQaykaU0
         bZntkTIfB5ySTS7wQtOBr1Tu9ivTAUbwi1iskydRbC4+8hU+nGs38sVy4rz0CwInoAhi
         VJUUS0O6wbmwnM3sk/ZjV49twRORSCxnif6vgmWeQCZaSUxShnYQTLiaghiMkeoJJ7ph
         VBeXWQFo2f22VSYC22wHpt1Wof8weX5q07qWV9MzZDpgTjeuwuEy1LZ/x3cq0mpJN781
         HGsg==
X-Forwarded-Encrypted: i=1; AJvYcCUNeSOgSOilcrePeUjvwilc/cURAFs35AcY2scFiBU4mBoPCQdB67YRj/KrWSYUKwf4WeJEKuZHH0M6Wwk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyVUmVCbKA+14OcBi0pd/fQUxmxn4z9mBzey+7vF0tBLNaTAJ1C
	nD+CiTFhHbF/Uakntk8mZxFe0BMhYWdQd1f55bTkc7Kvjfsrxyvj9Ra/
X-Gm-Gg: ATEYQzyC8OxrufoM+zy8zMLdIAkkHVjyj2Um1t9VZalAShggvISgj//YzVZSm5i1lR1
	sF3GnxOqQ0d6/4uVEpsq3E7k6f8IuQIgpEy7ep8K6xUbKiipFGy/mu/wS+e5JP9HabGTkDUFmvY
	J+5b/0Q5z5vvVUkWX9U/k6pUhoKGPfr2hkVYHQoyxOQpzCAFIlL11iqMgn6Uo3+lRrpU7kweS8H
	RUfmLOIpS2cthfMp3C3XwGavWE5A0DtNvx3Mgd0lG1+4hoYLXvK6rcLMttew3fY3f5V3MCDMSqs
	NHI/SQ7Zu4yWD2njqACiBXn/GC0j1+eIuLxgzdyVjZ7QvDgfW60JdQmzM1+BzMCKITp67XTqmu1
	2IdJ4wM88R5N0dBgnJZW7havQxQUmDle0wBYVEtca0eTmY7NofoREIzlts7V2ZYTedxb/+cUgzt
	sRzTx/6E/zDCYyRi9gNQ==
X-Received: by 2002:a17:90b:2884:b0:356:4ea0:e9e2 with SMTP id 98e67ed59e1d1-35965d074afmr2219544a91.34.1772188332691;
        Fri, 27 Feb 2026 02:32:12 -0800 (PST)
Received: from dw-tp ([203.81.240.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359134a0a2asm3170713a91.14.2026.02.27.02.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 02:32:11 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, kvm@vger.kernel.org, Alex Williamson <alex@shazbot.org>, Peter Xu <peterx@redhat.com>
Subject: Re: [RFC v1 1/2] drivers/vfio_pci_core: Change PXD_ORDER check from switch case to if/else block
In-Reply-To: <a864b2ed-1a77-4aac-b0e8-d97b4bf8be47@kernel.org>
Date: Fri, 27 Feb 2026 16:00:54 +0530
Message-ID: <87qzq6h40x.ritesh.list@gmail.com>
References: <0b8fce7a61561640634317a5e287cdb4794715fd.1772170860.git.ritesh.list@gmail.com> <a864b2ed-1a77-4aac-b0e8-d97b4bf8be47@kernel.org>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17384-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chleroy@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mm@kvack.org,m:kvm@vger.kernel.org,m:alex@shazbot.org,m:peterx@redhat.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 763DF1B6048
X-Rspamd-Action: no action

"Christophe Leroy (CS GROUP)" <chleroy@kernel.org> writes:

> Le 27/02/2026 à 07:16, Ritesh Harjani (IBM) a écrit :
>> Architectures like PowerPC uses runtime defined values for
>> PMD_ORDER/PUD_ORDER. This is because it can use either RADIX or HASH MMU
>> at runtime using kernel cmdline. So the pXd_index_size is not known at
>> compile time. Without this fix, when we add huge pfn support on powerpc
>> in the next patch, vfio_pci_core driver compilation can fail with the
>> following errors.
>> 
>>    CC [M]  drivers/vfio/vfio_main.o
>>    CC [M]  drivers/vfio/group.o
>>    CC [M]  drivers/vfio/container.o
>>    CC [M]  drivers/vfio/virqfd.o
>>    CC [M]  drivers/vfio/vfio_iommu_spapr_tce.o
>>    CC [M]  drivers/vfio/pci/vfio_pci_core.o
>>    CC [M]  drivers/vfio/pci/vfio_pci_intrs.o
>>    CC [M]  drivers/vfio/pci/vfio_pci_rdwr.o
>>    CC [M]  drivers/vfio/pci/vfio_pci_config.o
>>    CC [M]  drivers/vfio/pci/vfio_pci.o
>>    AR      kernel/built-in.a
>> ../drivers/vfio/pci/vfio_pci_core.c: In function ‘vfio_pci_vmf_insert_pfn’:
>> ../drivers/vfio/pci/vfio_pci_core.c:1678:9: error: case label does not reduce to an integer constant
>>   1678 |         case PMD_ORDER:
>>        |         ^~~~
>> ../drivers/vfio/pci/vfio_pci_core.c:1682:9: error: case label does not reduce to an integer constant
>>   1682 |         case PUD_ORDER:
>>        |         ^~~~
>> make[6]: *** [../scripts/Makefile.build:289: drivers/vfio/pci/vfio_pci_core.o] Error 1
>> make[6]: *** Waiting for unfinished jobs....
>> make[5]: *** [../scripts/Makefile.build:546: drivers/vfio/pci] Error 2
>> make[5]: *** Waiting for unfinished jobs....
>> make[4]: *** [../scripts/Makefile.build:546: drivers/vfio] Error 2
>> make[3]: *** [../scripts/Makefile.build:546: drivers] Error 2
>> 
>> Fixes: f9e54c3a2f5b7 ("vfio/pci: implement huge_fault support")
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>   drivers/vfio/pci/vfio_pci_core.c | 15 +++++++--------
>>   1 file changed, 7 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
>> index d43745fe4c84..5395a6f30904 100644
>> --- a/drivers/vfio/pci/vfio_pci_core.c
>> +++ b/drivers/vfio/pci/vfio_pci_core.c
>> @@ -1670,21 +1670,20 @@ vm_fault_t vfio_pci_vmf_insert_pfn(struct vfio_pci_core_device *vdev,
>>   	if (vdev->pm_runtime_engaged || !__vfio_pci_memory_enabled(vdev))
>>   		return VM_FAULT_SIGBUS;
>> 
>> -	switch (order) {
>> -	case 0:
>> +	if (order == 0) {
>>   		return vmf_insert_pfn(vmf->vma, vmf->address, pfn);
>> +	}
>
> Those braces are unneeded as all legs of the if/else are single lines
>
>>   #ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
>
> ifdef could be replaced by IS_ENABLED() because PxD_ORDER and 
> vmf_insert_pfn_xxx() are declared all the time
>
>> -	case PMD_ORDER:
>> +	 else if (order == PMD_ORDER) {
>
> 'else' is not needed because every 'if' leads to a return statement
>
>>   		return vmf_insert_pfn_pmd(vmf, pfn, false);
>> +	 }
>>   #endif
>>   #ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
>> -	case PUD_ORDER:
>> +	 else if (order == PUD_ORDER) {
>>   		return vmf_insert_pfn_pud(vmf, pfn, false);
>> -		break;
>> +	 }
>>   #endif
>> -	default:
>> -		return VM_FAULT_FALLBACK;
>> -	}
>> +	return VM_FAULT_FALLBACK;
>
> So at the end we should get something like:
>
> 	if (!order)
> 		return vmf_insert_pfn(vmf->vma, vmf->address, pfn);
>
> 	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) && order == PMD_ORDER)
> 		return vmf_insert_pfn_pmd(vmf, pfn, false);
>
> 	if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PUD_PFNMAP) && order == PMD_ORDER)
                                                                ^^^ PUD_ORDER

> 		return vmf_insert_pfn_pud(vmf, pfn, false);
>
> 	return VM_FAULT_FALLBACK;
>
>

Looks a lot cleaner. Thanks!
I will make that change in v2.

-ritesh

