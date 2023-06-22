Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECB373A18F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 15:12:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CLGYB8PI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CLGYB8PI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qn14g6lkvz3bnK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 23:12:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CLGYB8PI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CLGYB8PI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=ypodemsk@redhat.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 166812 seconds by postgrey-1.37 at boromir; Thu, 22 Jun 2023 23:11:46 AEST
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qn13k0xwgz30D2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 23:11:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687439500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sL8itRGmxApUKDOrvea4cRz5mnSUjX/8ZLxFKQlLox8=;
	b=CLGYB8PI6b4R3Ja0/X/dITVP9zfCpmEHxZYg+ZbdgX79gZVY5007ypxpd3+obrThZJlrRD
	wuctEKM8wYyPmExS8rzxvvDFH2KVAaucv5HiN9FMN+JdvwwYmEKEayqkZD8G36FkK+bJBn
	5n71BY3nNxQBeloGOZmih1Ym6iMvPwo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687439500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sL8itRGmxApUKDOrvea4cRz5mnSUjX/8ZLxFKQlLox8=;
	b=CLGYB8PI6b4R3Ja0/X/dITVP9zfCpmEHxZYg+ZbdgX79gZVY5007ypxpd3+obrThZJlrRD
	wuctEKM8wYyPmExS8rzxvvDFH2KVAaucv5HiN9FMN+JdvwwYmEKEayqkZD8G36FkK+bJBn
	5n71BY3nNxQBeloGOZmih1Ym6iMvPwo=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-nxT-MCzgOd2RscNm6HPZMQ-1; Thu, 22 Jun 2023 09:11:39 -0400
X-MC-Unique: nxT-MCzgOd2RscNm6HPZMQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4f618172ed6so5329547e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 06:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687439496; x=1690031496;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :cc:to:from:subject:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sL8itRGmxApUKDOrvea4cRz5mnSUjX/8ZLxFKQlLox8=;
        b=HamtpZ+nOGGBZzZUUHA0QFiNfRelFr2kn0GEdqWXYvEmnQch0FJdtIxfz68zW4IZf5
         P1RGBkQMu2Bl0JVDgEiBNT0EyBHXEw18mrVl3cZlid2vjP6EEBpM7B3txLLiWrr0bEhr
         j/L/BC44RNAhdK8swXWcuz9fsooEkNgdDWsE9AVBjqKPW+Oj1Afz7IOZSt6lN9PWrJZJ
         7C/BmFqmElaoYifqAgoOM9a6y7rDqjB7viGFySEO6RdrtNkNJj4HKLaI5l59eW8i3U54
         gBqF3lEGQwUzUuHZwWmbP5HN/u86PJv7DkVDJBs93lp2ouRC4gNA3fIMOSSTJcSLTGJ0
         c8ew==
X-Gm-Message-State: AC+VfDwOvNcfMt2bYcCUOp6WwgN5nV7w9jMm6weKplrADti7aoSRBg2w
	N4iDkOfvJO2VI4YF5H5ubmw/9PnqETME5MQC1u1pNF+CwpcRhQQ6v/KurVNmKWElxQLtoEXzz4g
	vl+y7eN8pkDjPxwq79XU6ReqCTQ==
X-Received: by 2002:a19:7710:0:b0:4f8:6800:86f6 with SMTP id s16-20020a197710000000b004f8680086f6mr7663768lfc.49.1687439496652;
        Thu, 22 Jun 2023 06:11:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6XeMu+ILD2rIWpjmZgWGZlKWI9+Th3UDxS632DqbBLE4GiDliqEnF0ulmrbywCCnR/Rw0JbA==
X-Received: by 2002:a19:7710:0:b0:4f8:6800:86f6 with SMTP id s16-20020a197710000000b004f8680086f6mr7663723lfc.49.1687439496259;
        Thu, 22 Jun 2023 06:11:36 -0700 (PDT)
Received: from ypodemsk.tlv.csb (IGLD-84-229-250-192.inter.net.il. [84.229.250.192])
        by smtp.gmail.com with ESMTPSA id k37-20020a05600c1ca500b003f9b3829269sm2706502wms.2.2023.06.22.06.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 06:11:35 -0700 (PDT)
Message-ID: <7a9f193e6fa9db1d5fa0eb4a91927a866909f13c.camel@redhat.com>
Subject: Re: [PATCH v2 0/2] send tlb_remove_table_smp_sync IPI only to
 necessary CPUs
From: ypodemsk@redhat.com
To: Peter Zijlstra <peterz@infradead.org>
Date: Thu, 22 Jun 2023 16:11:32 +0300
In-Reply-To: <20230621074337.GF2046280@hirez.programming.kicks-ass.net>
References: <20230620144618.125703-1-ypodemsk@redhat.com>
	 <20230621074337.GF2046280@hirez.programming.kicks-ass.net>
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
Cc: geert+renesas@glider.be, david@redhat.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, paulmck@kernel.org, x86@kernel.org, linux@armlinux.org.uk, ppandit@redhat.com, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, keescook@chromium.org, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, mtosatti@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, aneesh.kumar@linux.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-06-21 at 09:43 +0200, Peter Zijlstra wrote:
> On Tue, Jun 20, 2023 at 05:46:16PM +0300, Yair Podemsky wrote:
> > Currently the tlb_remove_table_smp_sync IPI is sent to all CPUs
> > indiscriminately, this causes unnecessary work and delays notable
> > in
> > real-time use-cases and isolated cpus.
> > By limiting the IPI to only be sent to cpus referencing the
> > effected
> > mm.
> > a config to differentiate architectures that support mm_cpumask
> > from
> > those that don't will allow safe usage of this feature.
> > 
> > changes from -v1:
> > - Previous version included a patch to only send the IPI to CPU's
> > with
> > context_tracking in the kernel space, this was removed due to race 
> > condition concerns.
> > - for archs that do not maintain mm_cpumask the mask used should be
> >  cpu_online_mask (Peter Zijlstra).
> >  
> 
> Would it not be much better to fix the root cause? As per the last
> time,
> there's patches that cure the thp abuse of this.
> 
Hi Peter,
Thanks for your reply.
There are two code paths leading to this IPI, one is the thp,
But the other is the failure to allocate page in tlb_remove_table,
It is the the second path that we are most interested in as it was
found
to cause interference in a real time process for a client (That system
did
 not have thp).
So while curing thp abuses is a good thing, it will not unfortunately
solve
our root cause.
If you have any idea of how to remove the tlb_remove_table_sync_one()
usage
in the tlb_remove_table()->tlb_remove_table_one() call path -- the
usage 
that's relevant for us -- that would be great. As long as we can't
remove
that, I'm afraid all we can do is optimize for it to not broadcast an
IPI
to all CPUs in the system, as done in this patch.
Thanks,
Yair

