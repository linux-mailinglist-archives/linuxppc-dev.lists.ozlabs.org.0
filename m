Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 315607E01A0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 11:41:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cRg4+PCq;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cRg4+PCq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SMHP10x34z3d9V
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 21:41:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cRg4+PCq;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cRg4+PCq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SMHN364Jjz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 21:41:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699008062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Lp6Jz+POVOM2ymATN0+4roKlcGz/gu2UjTswWR4Ytbw=;
	b=cRg4+PCqqSlOE2s/8+SbHCWChJ/PgzTXRoLzGH2VKsxlFbC6nK51LMuzcKpx7+fFQ85SE9
	ZqdCL60k0CdCxvgpyvUtNst78QeZG6G9eFzeg/QI6b37gEj2F0Veh//aj0hpgG1tnhl+/z
	GKWyOQ93PVAwx6y1OyziDH2saneefoY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699008062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Lp6Jz+POVOM2ymATN0+4roKlcGz/gu2UjTswWR4Ytbw=;
	b=cRg4+PCqqSlOE2s/8+SbHCWChJ/PgzTXRoLzGH2VKsxlFbC6nK51LMuzcKpx7+fFQ85SE9
	ZqdCL60k0CdCxvgpyvUtNst78QeZG6G9eFzeg/QI6b37gEj2F0Veh//aj0hpgG1tnhl+/z
	GKWyOQ93PVAwx6y1OyziDH2saneefoY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-enzryQ_LNeCpEEkfvkehtw-1; Fri, 03 Nov 2023 06:41:00 -0400
X-MC-Unique: enzryQ_LNeCpEEkfvkehtw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9d2606301eeso223862666b.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Nov 2023 03:41:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699008060; x=1699612860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lp6Jz+POVOM2ymATN0+4roKlcGz/gu2UjTswWR4Ytbw=;
        b=bwTsTjw3tbzG3DaOpzEVdB5S4gqPjCJYTPQEJw4z3dDbBMBWDHVMxQkTaYw8bzUL0k
         GEzQvP2I0sGfh9HTlKu5+qxz/YtTWhD1RDYXi5mHVg/U3D8MjVX3GFFyMKxEbyTxJLDl
         YmLUGreYvCtZsOZfYc7ZId4rt4iybBI9WYHFO/0OrgQG8pSESEb4B1qxCIo2tdHqb2i5
         91Wx9bWIC61i/GpIbpC6eYUxWvZI9XybjnfpwHx4Oi+0yPHr7rSdiMIuBaQxoWFgzA9O
         e7OAkIBsEq8AfWF6ZNNve1odIHUvD5N0TQLJx4qrQP2E4PhMITSo5n/2koYLLXOM0xxG
         SHPQ==
X-Gm-Message-State: AOJu0YzDUbdjq2zded12IrI6l2Co7ii8wBVtlREVv2/INt5x3hNKObtP
	b6oAiSugHxK7nfXyXuuFJXEZE+jZff9c+54Uj3OkOY5ytVEZw98jIBy/yfJ/DxvJzVWdeRZsbhq
	oPo5d+tUlqgvoXdtS1icME4PR4w==
X-Received: by 2002:a17:906:7950:b0:9bf:c00f:654a with SMTP id l16-20020a170906795000b009bfc00f654amr2302811ejo.24.1699008059842;
        Fri, 03 Nov 2023 03:40:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYL84kQ58i2cP4K6S7xeuKGH18ZQ7RIKhzKbyX3E6c1jOpr4P+mCWZM0GIPaXqH2aak15cSg==
X-Received: by 2002:a17:906:7950:b0:9bf:c00f:654a with SMTP id l16-20020a170906795000b009bfc00f654amr2302775ejo.24.1699008059454;
        Fri, 03 Nov 2023 03:40:59 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:4783:a68:c1ee:15c5? ([2001:b07:6468:f312:4783:a68:c1ee:15c5])
        by smtp.googlemail.com with ESMTPSA id g4-20020a170906394400b009a5f1d15644sm754493eje.119.2023.11.03.03.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Nov 2023 03:40:58 -0700 (PDT)
Message-ID: <e39a8f6e-c98d-4873-aa3f-2e566dead5c5@redhat.com>
Date: Fri, 3 Nov 2023 11:40:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 15/35] fs: Export anon_inode_getfile_secure() for use
 by KVM
To: Christian Brauner <brauner@kernel.org>,
 Sean Christopherson <seanjc@google.com>
References: <20231027182217.3615211-1-seanjc@google.com>
 <20231027182217.3615211-16-seanjc@google.com>
 <20231102-freihalten-vorsah-fdd68051b005@brauner>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20231102-freihalten-vorsah-fdd68051b005@brauner>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?= =?UTF-8?Q?n?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Oli
 ver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/2/23 17:24, Christian Brauner wrote:
> On Fri, Oct 27, 2023 at 11:21:57AM -0700, Sean Christopherson wrote:
>> Export anon_inode_getfile_secure() so that it can be used by KVM to create
>> and manage file-based guest memory without need a fullblow filesystem.
>> The "standard" anon_inode_getfd() doesn't work for KVM's use case as KVM
>> needs a unique inode for each file, e.g. to be able to independently
>> manage the size and lifecycle of a given file.
>>
>> Note, KVM doesn't need a "secure" version, just unique inodes, i.e. ignore
>> the name.
>>
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> ---
> 
> Before we enshrine this misleading name let's rename this to:
> 
> create_anon_inode_getfile()
> 
> I don't claim it's a great name but it's better than *_secure() which is
> very confusing. So just:
> 
> struct file *create_anon_inode_getfile(const char *name,
>                                         const struct file_operations *fops,
>                                         void *priv, int flags)

I slightly prefer anon_inode_create_getfile(); grepping include/linux 
for '\<create_' vs '_create_' shows that this is much more common.

Neither userfaultfd (which uses anon_inode_getfd_secure()) nor io_uring 
strictly speaking need separate inodes; they do want the call to 
inode_init_security_anon().  But I agree that the new name is better and 
I will adjust the comments so that it is clear why you'd use this 
function instead of anon_inode_get{file,fd}().

> May also just remove that context_inode argument from the exported
> function. The only other caller is io_uring. And neither it nor this
> patchset need the context_inode thing afaict.

True, OTOH we might as well rename anon_inode_getfd_secure() to 
anon_inode_create_getfd(), and that one does need context_inode.

I'll Cc you on v14 and will carry the patch in my tree.

Paolo

> Merge conflict risk is
> extremely low so carrying that as part of this patchset is fine and
> shouldn't cause huge issues for you.
> 

