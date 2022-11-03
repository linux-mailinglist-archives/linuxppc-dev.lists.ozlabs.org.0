Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F126617EDA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 15:05:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N35BG19SZz3cKM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 01:05:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KEJc5mWK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KEJc5mWK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KEJc5mWK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KEJc5mWK;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N359H4dlnz3bsK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 01:04:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667484273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ld7KbWWPpVg/DGXuI3WKVRs5TJPSNq4PfcjQdMphjo=;
	b=KEJc5mWK/XGWIDAdswXjbXXVhcNodZETUC0DjLncFSUJiYaRwGfZdz3ddf9Oyd19MXRNQB
	PF8Dd/Sp3F8oadxGZ+gMW/Uvi+eqZIknjP7HDLbOUfM19qxP2oV/A5FyyyVaEc+XE+HO2A
	YwufaRodatiRBgQuhnMpX8STv4olxLE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667484273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ld7KbWWPpVg/DGXuI3WKVRs5TJPSNq4PfcjQdMphjo=;
	b=KEJc5mWK/XGWIDAdswXjbXXVhcNodZETUC0DjLncFSUJiYaRwGfZdz3ddf9Oyd19MXRNQB
	PF8Dd/Sp3F8oadxGZ+gMW/Uvi+eqZIknjP7HDLbOUfM19qxP2oV/A5FyyyVaEc+XE+HO2A
	YwufaRodatiRBgQuhnMpX8STv4olxLE=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-144-2gn73RpqMhKlyu6FrlwvLQ-1; Thu, 03 Nov 2022 10:04:30 -0400
X-MC-Unique: 2gn73RpqMhKlyu6FrlwvLQ-1
Received: by mail-ua1-f71.google.com with SMTP id y44-20020ab048ef000000b003cd69b6e479so1422780uac.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 07:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ld7KbWWPpVg/DGXuI3WKVRs5TJPSNq4PfcjQdMphjo=;
        b=dmcuWd+StCd+HwylfyYYIr3Zo95KwtJ4JwA+zXZmapyyA2lBHRNc1RE6ZR06zubDR3
         m/f4ZSwIiKe/0yoClrrHbV5m9oyFgwAtPl8+UwYSURi1NDhw59xK7zQCGiXZyk7xNcqC
         O1qsVf8eLLxJMGiW9y+wP5OVuj6YLxvdDFQ94jwFzHjVb6HA3Mwo88pxfPArcDCgtRZx
         gXVZueOBqgBJgOayRsAGasUd3qGQ0Zn3aaU0PDYY65Oycqari5b0Ew/m/b6e1M5i8HC8
         qzlcV650WJcXSJ9n1whhGnfjlAqQqNyBlr5zzhny8AtcqlFWp3oqmsjw5yWdmyev8g7K
         yd5w==
X-Gm-Message-State: ACrzQf3woTNoUqWe+7r/ua1f9/TwgQWM78zI4aEWTh3ZR+NvGWsSGB2a
	XO/i8wsstMje9H2JhC3PhGYnHVACBeHsA8zrnq6IIt7tddUajZj8QB696q0itmvdJ7WxO2j2pfb
	9Tk8196fjKDubYctBTK3UD7cJy7nW5bidKXJqgZ31pA==
X-Received: by 2002:a67:c997:0:b0:3aa:1d0c:6bc7 with SMTP id y23-20020a67c997000000b003aa1d0c6bc7mr18114555vsk.16.1667484269693;
        Thu, 03 Nov 2022 07:04:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM57ejOKzdNWqeTyWHPkPRmEBqAcfUgljrJu10jVJC1iEGC5QqKTnJr+aHwKv6/RTPPoYaQADtoBOTHZ/wIpPrc=
X-Received: by 2002:a67:c997:0:b0:3aa:1d0c:6bc7 with SMTP id
 y23-20020a67c997000000b003aa1d0c6bc7mr18114480vsk.16.1667484269311; Thu, 03
 Nov 2022 07:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com> <20221102231911.3107438-11-seanjc@google.com>
 <d641088f-87d9-da77-7e98-92d1a9de6493@redhat.com>
In-Reply-To: <d641088f-87d9-da77-7e98-92d1a9de6493@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 3 Nov 2022 15:04:17 +0100
Message-ID: <CABgObfZDngVgmPetJEQGFW-MZGqYvW9tTa5jzcKheO5EO703Vw@mail.gmail.com>
Subject: Re: [PATCH 10/44] KVM: VMX: Clean up eVMCS enabling if KVM
 initialization fails
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Fabiano Rosas <farosas@linux.ibm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 3, 2022 at 3:01 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/3/22 00:18, Sean Christopherson wrote:
> > +static void hv_cleanup_evmcs(void)
>
> This needs to be __init.

Error: brain temporarily disconnected.

Paolo

