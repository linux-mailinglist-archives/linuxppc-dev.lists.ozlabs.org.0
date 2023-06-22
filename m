Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 946A673A1BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 15:16:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PWI5tj35;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SsufKQXM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qn18b3Z4wz3bcH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 23:15:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PWI5tj35;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SsufKQXM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=ypodemsk@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qn17f6QLKz30Mv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 23:15:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687439707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CwNoD4npTXJHndQ39H5OyokG0A2tJC7uKm6DdKDHg0U=;
	b=PWI5tj35TMPlbJI3NvOXVW+ABILZC6qkaJp44/4SZ64zTZ0jwf4YqqNizhoBDiGhWpkmAQ
	eNb9AI5y3qYtJFZspdQY5+L4em58CSYQLu6JSjNhEdxR+1k/HL5tfiED3rcw6q9FpgL6j8
	U4dRoAne3GwmIVX1khCiQotutjm73ck=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687439708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CwNoD4npTXJHndQ39H5OyokG0A2tJC7uKm6DdKDHg0U=;
	b=SsufKQXMPM3nlupyJWJk9Nu5RqL3/UaE/cExlwLc2Yza//9PRddv+oAch2ja9ZL5tlLBXw
	EQDMabbfRzQsGYYn8G7FpngAxcaX0EALDrhFk+AXJ5JYaI0oc1+JTf4u4LD1x1BMuciuBd
	ZV/XcnqGZB5+jifozvYl3hdvoxsWhd4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-I_hk3hENO9KTmDXEeqx86A-1; Thu, 22 Jun 2023 09:15:05 -0400
X-MC-Unique: I_hk3hENO9KTmDXEeqx86A-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-30e4943ca7fso2813500f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 06:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687439703; x=1690031703;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CwNoD4npTXJHndQ39H5OyokG0A2tJC7uKm6DdKDHg0U=;
        b=Xdp6ZypNrGOfZwG46NPitAfuyKHvsSHTR5W+BVhC7zdVd4ZI1Ngqg2c1X7NKDxiWeC
         fRjy2Oucba8O0/FXAEXySYZ50hn5NS4WSZ0YL57+2axjCGx7Mhh1sN+aOBLGmDyp2ysI
         pl6HtPVD9SQXWHx0ccTcIgxXJp+kX4Cwk5f2kVWY7fjZ+0u6nixnZQX7Djg94KLsYeIh
         1SiNhSWsSU/0mnwclKtjVQAmf3JJoCnVUcF9zfuAedRuLDxvWBrkyFvvEO0JzEEMKBdx
         mYV/Pkdor/1NLQ3KDGO3GpTCiTxiQ3YVWGe8fxmssQMuZ165fewjIe3QakQsGSTB4CFN
         qoKw==
X-Gm-Message-State: AC+VfDyryQor9l4y+UhMQCHOk6MmjiQWd21jGlf/K7/f5K3MKXNcjjPx
	k3C+aV5VnIyuIF5SC28FDq85XH2sMxFMGOcvLUaZpf7cn/lNJwxpzYieaYEYlu8EZbGp9IhhnFi
	aDL95bhhdUQ6MIGFaTHWpGTL9qQ==
X-Received: by 2002:adf:fa83:0:b0:30e:56ae:ccb7 with SMTP id h3-20020adffa83000000b0030e56aeccb7mr13129244wrr.52.1687439703141;
        Thu, 22 Jun 2023 06:15:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7wzrlESkKHfrkXueFgu575m1EZWaFeye+ZamuL5DG2JBkgkpwqxiajJqPMAdS7wlgFKQpT2g==
X-Received: by 2002:adf:fa83:0:b0:30e:56ae:ccb7 with SMTP id h3-20020adffa83000000b0030e56aeccb7mr13129176wrr.52.1687439702720;
        Thu, 22 Jun 2023 06:15:02 -0700 (PDT)
Received: from ypodemsk.tlv.csb (IGLD-84-229-250-192.inter.net.il. [84.229.250.192])
        by smtp.gmail.com with ESMTPSA id u6-20020adff886000000b0031130b9b173sm7014116wrp.34.2023.06.22.06.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 06:15:02 -0700 (PDT)
Message-ID: <79f29f99fa07c46dbaee7b802cdd7b477b2d8dd1.camel@redhat.com>
Subject: Re: [PATCH v2 2/2] mm/mmu_gather: send tlb_remove_table_smp_sync
 IPI only to MM CPUs
From: ypodemsk@redhat.com
To: Dave Hansen <dave.hansen@intel.com>, mtosatti@redhat.com, 
 ppandit@redhat.com, david@redhat.com, linux@armlinux.org.uk,
 mpe@ellerman.id.au,  npiggin@gmail.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com,  gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com,  svens@linux.ibm.com, davem@davemloft.net,
 tglx@linutronix.de, mingo@redhat.com,  bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, keescook@chromium.org, 
 paulmck@kernel.org, frederic@kernel.org, will@kernel.org,
 peterz@infradead.org,  ardb@kernel.org, samitolvanen@google.com,
 juerg.haefliger@canonical.com,  arnd@arndb.de, rmk+kernel@armlinux.org.uk,
 geert+renesas@glider.be,  linus.walleij@linaro.org,
 akpm@linux-foundation.org,  sebastian.reichel@collabora.com,
 rppt@kernel.org, aneesh.kumar@linux.ibm.com,  x86@kernel.org,
 linux-arm-kernel@lists.infradead.org,  linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org,  sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org
Date: Thu, 22 Jun 2023 16:14:58 +0300
In-Reply-To: <680fadba-9104-3914-5175-e207fd3d9246@intel.com>
References: <20230620144618.125703-1-ypodemsk@redhat.com>
	 <20230620144618.125703-3-ypodemsk@redhat.com>
	 <680fadba-9104-3914-5175-e207fd3d9246@intel.com>
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8)
Mime-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-06-21 at 10:42 -0700, Dave Hansen wrote:
> On 6/20/23 07:46, Yair Podemsky wrote:
> > -void tlb_remove_table_sync_one(void)
> > +#ifdef CONFIG_ARCH_HAS_CPUMASK_BITS
> > +#define REMOVE_TABLE_IPI_MASK mm_cpumask(mm)
> > +#else
> > +#define REMOVE_TABLE_IPI_MASK cpu_online_mask
> > +#endif /* CONFIG_ARCH_HAS_CPUMASK_BITS */
> > +
> > +void tlb_remove_table_sync_one(struct mm_struct *mm)
> >  {
> >  	/*
> >  	 * This isn't an RCU grace period and hence the page-tables
> > cannot be
> > @@ -200,7 +206,8 @@ void tlb_remove_table_sync_one(void)
> >  	 * It is however sufficient for software page-table walkers
> > that rely on
> >  	 * IRQ disabling.
> >  	 */
> > -	smp_call_function(tlb_remove_table_smp_sync, NULL, 1);
> > +	on_each_cpu_mask(REMOVE_TABLE_IPI_MASK,
> > tlb_remove_table_smp_sync,
> > +			NULL, true);
> >  }
> 
> That "REMOVE_TABLE_IPI_MASK" thing is pretty confusing.  It *looks*
> like
> a constant.  It does *NOT* look at all like it consumes 'mm'.  Worst
> case, just create a local variable:
> 
> 	if (IS_ENABLED(CONFIG_ARCH_HAS_CPUMASK_BITS))
> 		ipi_mask = mm_cpumask(mm);
> 	else
> 		ipi_mask = cpu_online_mask;
> 
> 	on_each_cpu_mask(ipi_mask, ...);
> 
> That's a billion times more clear and it'll compile down to the same
> thing.
> 
> I do think the CONFIG_ARCH_HAS_CPUMASK_BITS naming is also pretty
> confusing, but I don't have any better suggestions.  Maybe something
> with "MM_CPUMASK" in it?
> 

Hi Dave,
Thanks for your suggestions!
I will send a new version with the local variable as you suggested
soon.
As for the config name, what about CONFIG_ARCH_HAS_MM_CPUMASK?
Thanks,
Yair

