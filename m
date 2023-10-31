Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2175F7DD270
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 17:44:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Fy012kC2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKbZk08rwz3cVS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Nov 2023 03:44:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Fy012kC2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=dmatlack@google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKbYr2q3Xz3c5Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Nov 2023 03:43:43 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5bcf83a8f6cso37787a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 09:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698770620; x=1699375420; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KUWzNpZFu6ZH+LPCMipXBlnOZ2iMu0xo6DdlSVTTSCM=;
        b=Fy012kC2MddLIClUmA89vrfdj1IulQKs4mz8tDaPbJSGi6BU0TrIw7vxiismgJaSs4
         UVacM2AlVW4RVnyYCkd3GwnAoxqc4i/7+A+FgyXJ1CdwM/i5YmDLxaSQdysVZF3Akw2Z
         SqfrieAmevXs5DRrgtr43gwSq7VC6+zSgdpaD08RlozSGCKp9911QK6MwrVmMxElgXJV
         yT07b2AgV/TnxGEFtLJ0bpfASWqcjSPJ+oscaia8poKxYPLH6zV+uEujF5DKVvW1d5Rg
         MOYmsRmCEYPZRQI75DqFocjK6j7kLxH46PEj5pwt5CMnaz2tIzs36SydhbBtbAmJA2IH
         3xwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698770620; x=1699375420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUWzNpZFu6ZH+LPCMipXBlnOZ2iMu0xo6DdlSVTTSCM=;
        b=fS/APuclHIW1S1/qQUDzONISdQizTTrwl8zQC9xOoJmmAPWngergX0plQc4P42jIIS
         t+ochZVCXRyOkevheMfl86Mr2g6iW9ZrfM4/w4SsdJNZNIVDekNGMB3vXzeVDsaMcOuj
         N6Aqkb00e0/ug+Qc3/mmWvPxEi66X6jr+D8jWWuQGH3bcQoeWy7gS3wZvY8seKN0KO6F
         HmnzLE6LrBg0fEsmTgqt3rmebodTwXISmYZGpkiZBtaCGilEBhshX/PVJg1yH8oQnfZf
         tbsaEI7N1iDjafKSXdH5PxCw1NITzdry6RCVQNvQHh3vWk9FuaLlqedYri0Ml+gBLhWS
         eqcA==
X-Gm-Message-State: AOJu0Yxea6hA9mDi5qpT5gPu4tGr+982FfNqg6ATJzO936SSuwqhCLV1
	lxA5cgyu8N9c4V2TUg/O8puITw==
X-Google-Smtp-Source: AGHT+IEij7+ydhlYjhr1xlKLUtNUJw25BFH2l+RQ8zeBA7dBnKRXxZXchV1bLlBIgwVsc3GuzIJ3dQ==
X-Received: by 2002:a05:6a20:a10b:b0:15d:7e2a:cc77 with SMTP id q11-20020a056a20a10b00b0015d7e2acc77mr12395968pzk.48.1698770620059;
        Tue, 31 Oct 2023 09:43:40 -0700 (PDT)
Received: from google.com (175.199.125.34.bc.googleusercontent.com. [34.125.199.175])
        by smtp.gmail.com with ESMTPSA id fb17-20020a056a002d9100b006b1e8f17b85sm1451493pfb.201.2023.10.31.09.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 09:43:39 -0700 (PDT)
Date: Tue, 31 Oct 2023 09:43:32 -0700
From: David Matlack <dmatlack@google.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v13 13/35] KVM: Introduce per-page memory attributes
Message-ID: <ZUEutAmPcVLHXlQc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-14-seanjc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027182217.3615211-14-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, Li
 am Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-10-27 11:21 AM, Sean Christopherson wrote:
> From: Chao Peng <chao.p.peng@linux.intel.com>
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 89c1a991a3b8..df573229651b 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -808,6 +809,9 @@ struct kvm {
>  
>  #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
>  	struct notifier_block pm_notifier;
> +#endif
> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
> +	struct xarray mem_attr_array;

Please document how access to mem_attr_array is synchronized. If I'm
reading the code correctly I think it's...

  /* Protected by slots_locks (for writes) and RCU (for reads) */
