Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CB17DBF28
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 18:40:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ag6UE2BA;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ag6UE2BA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SK0sY6V0lz3dC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 04:40:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ag6UE2BA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ag6UE2BA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SK0rj517Lz3cBH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 04:39:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698687571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+DXS2SMXoVtHIusoTNobzAVDxifuslX+O0gTNMn/npQ=;
	b=Ag6UE2BAHIefNXhmix/VL8ONjRqROWaE6/41ZGC7ylIcnOP4F+x3INEoovmzt0X1oygXDG
	0DrsMFWnJvB07D9Jyy5GZYP0tturANBfzxFw1/mqIEs++XR7293VZQsEAKSyG+s//rkeCW
	t/AacLlEFUshELCV7IGu1gjdFstSu44=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698687571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+DXS2SMXoVtHIusoTNobzAVDxifuslX+O0gTNMn/npQ=;
	b=Ag6UE2BAHIefNXhmix/VL8ONjRqROWaE6/41ZGC7ylIcnOP4F+x3INEoovmzt0X1oygXDG
	0DrsMFWnJvB07D9Jyy5GZYP0tturANBfzxFw1/mqIEs++XR7293VZQsEAKSyG+s//rkeCW
	t/AacLlEFUshELCV7IGu1gjdFstSu44=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-YHtkeLLjPvKhEi33e4oFkQ-1; Mon, 30 Oct 2023 13:39:29 -0400
X-MC-Unique: YHtkeLLjPvKhEi33e4oFkQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-408508aa81cso35349075e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 10:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698687568; x=1699292368;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+DXS2SMXoVtHIusoTNobzAVDxifuslX+O0gTNMn/npQ=;
        b=hXZugVbSsG1m8yIW+EKzTMj9ttkCLVqxf74DPoMpIDbJ8lczY/5ZRwW3zglA2MRf1E
         F+slpYL+D/WO4j+A2GvEwdLwOexTJz49XWUnQw76MHpV+NAWJ/8FJXBdG0oiBpJ93KlJ
         Q5wj6Ffcy900lzw2TpBOGX3x9qaq0XCNsa5jMJN+XBSvoFgltSu28gkANkgrJCcXvEQ8
         w5dcqeAY14tCmdjpLv04ZLHQCL4GGeeh5VTjcjQwJtCz7hIPWYx7Etm83++45cQIw8ED
         DbG943vV92sL5FIFZmoFGL3JC9ht3Ain2GUBn45DIwOIOECIE88JfPMuWajR/WPNOvdJ
         bysA==
X-Gm-Message-State: AOJu0Yxoyo9A8bNFZGq6pWHQo/4E27sOl2/D4rRB8yQbVWsJZQcr4sxe
	F9TmOIzgRhK4r6SiuiIw/jJ6osY9r0xsi8AFZVlODhobT2FN9zlr2qHlmVyYvKox6MEAuI6VNEn
	0OAFP7x5MRQuNzKXLdcelrKYTig==
X-Received: by 2002:a05:600c:4748:b0:409:325:e499 with SMTP id w8-20020a05600c474800b004090325e499mr8333070wmo.32.1698687568553;
        Mon, 30 Oct 2023 10:39:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjkVjq8oZnh05Prw8i0aF39OlPnVPmFNjtO6TXzNl6UxyV80hGH62Lh8Nc0yfk4QqAnWBdUg==
X-Received: by 2002:a05:600c:4748:b0:409:325:e499 with SMTP id w8-20020a05600c474800b004090325e499mr8333053wmo.32.1698687568216;
        Mon, 30 Oct 2023 10:39:28 -0700 (PDT)
Received: from [192.168.1.174] ([151.81.68.207])
        by smtp.googlemail.com with ESMTPSA id c18-20020a05600c0a5200b0040770ec2c19sm13195773wmq.10.2023.10.30.10.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 10:39:27 -0700 (PDT)
Message-ID: <80471c15-a37e-4129-8101-d30b8f73cb9f@redhat.com>
Date: Mon, 30 Oct 2023 18:39:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/35] KVM: guest_memfd() and per-page attributes
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20231027182217.3615211-1-seanjc@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Xiaoyao Li <xiaoyao.li@intel.com>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, David Matlack <dmatlack@google.com>, Vlastimil Babka <vbabka@suse.cz>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?= =?UTF-8?Q?n?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal A
 nnapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/27/23 20:21, Sean Christopherson wrote:
> Non-KVM people, please take a gander at two small-ish patches buried in the
> middle of this series:
> 
>    fs: Export anon_inode_getfile_secure() for use by KVM
>    mm: Add AS_UNMOVABLE to mark mapping as completely unmovable
> 
> Our plan/hope is to take this through the KVM tree for 6.8, reviews (and acks!)
> would be much appreciated.  Note, adding AS_UNMOVABLE isn't strictly required as
> it's "just" an optimization, but we'd prefer to have it in place straightaway.

Reporting what I wrote in the other thread, for wider distribution:

I'm going to wait a couple days more for reviews to come in, post a v14
myself, and apply the series to kvm/next as soon as Linus merges the 6.7
changes.  The series will be based on the 6.7 tags/for-linus, and when
6.7-rc1 comes up, I'll do this to straighten the history:

	git checkout kvm/next
	git tag -s -f kvm-gmem HEAD
	git reset --hard v6.7-rc1
	git merge tags/kvm-gmem
	# fix conflict with Christian Brauner's VFS series
	git commit
	git push kvm

6.8 is not going to be out for four months, and I'm pretty sure that
anything that would be discovered within "a few weeks" can also be
applied on top, and the heaviness of a 35-patch series will outweigh any
imperfections by a long margin.

(Full disclosure: this is _also_ because I want to apply this series to
the RHEL kernel, and Red Hat has a high level of disdain for
non-upstream patches.  But it's mostly because I want all dependencies
to be able to move on and be developed on top of stock kvm/next).

Paolo

