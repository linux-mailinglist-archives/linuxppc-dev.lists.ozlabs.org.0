Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E616D9942
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 16:12:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Psk3n38yXz3fVJ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 00:12:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aZhN1NC/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KqgI7fCZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vschneid@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aZhN1NC/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KqgI7fCZ;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Psk2s2y9Bz3fGQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 00:12:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680790321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oy2QomrGUBDfWG7234e6lYS9Z4zzgLJXtJtCEsgjhmY=;
	b=aZhN1NC/iWWs/nmzETinltHhAezLhQDbgIzpvQxSWycMVSuxgGVvVcvmNr6gV/6TrwKrlR
	H/UpujZANJOXhiL0pyb+Jdl+gBaLUXFN3Vxuybe0NgK7HVpfqujLcfvS3Ryp88SzLPd/ho
	AL6MENLq53/v3AJTB/yPGoHczRXQdj0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680790322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oy2QomrGUBDfWG7234e6lYS9Z4zzgLJXtJtCEsgjhmY=;
	b=KqgI7fCZrOhz6x0LHRTRqHaocXnhl+PSCDrkvdigKJnJuMoeoC/udCKrXiz6U5FcgFhrOL
	bPvnH6bhKqVWYUBlphFcOYxnIxwNos8mjcYl629YJWNlCkXWxAjzaVzotD3U1OrJtrFyQq
	m3gB2TuSseY0CJ5Ayl7yEmzosR20WO8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-Sybh7YuCNrymBANPnvKDVA-1; Thu, 06 Apr 2023 10:12:00 -0400
X-MC-Unique: Sybh7YuCNrymBANPnvKDVA-1
Received: by mail-qt1-f200.google.com with SMTP id a11-20020ac85b8b000000b003e3979be6abso26577729qta.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 07:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680790319; x=1683382319;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oy2QomrGUBDfWG7234e6lYS9Z4zzgLJXtJtCEsgjhmY=;
        b=pwnEobPnb82hlwULI8gXJYiAkE0BwXoY+XdIaQ3X1v/Yc+CLneg3SUbCi2k71B2cCe
         sToGsa+hhKOJikBP+0JIQ3NiHDMPdKtGCw1eoLIQPfKh7XVYwVDu7tbCrpNxi/axUYg1
         RseSx5E3pkiS1JAV5oL7xT7UxsvXDWHoBnosIHxSjSwozURYwTHCvEoahf+ShJ/ctEwB
         QvAH4JiJu9cBqxNHh1DOZpYIemUA/8NoQU8IstivxJWEdN9C5P2Zmhg/oyj5HhEdJWIb
         VRJEjRp/Lk3WWd64AxtUlztBxzzcgPlLZ0dteQ8jEH2WPUhVLSuWugGSb/M23Qf+ukz8
         Ot/A==
X-Gm-Message-State: AAQBX9dhtLn9PtJQAYkqwGUbeBlIOvwbK2s/1V9SGAmIe18mz0URpY2v
	Oxad8Li88XKlk22WgBtLg7LcCWyCdSLlv1ZUI/PIcp3fIo/rfzKjBpuEu1hPrRHG7ow6fou4w3y
	SJ0raZVSObFuC4xsPQOO9trsfFQ==
X-Received: by 2002:a05:6214:c21:b0:5a2:e3e4:59b0 with SMTP id a1-20020a0562140c2100b005a2e3e459b0mr4151651qvd.44.1680790319558;
        Thu, 06 Apr 2023 07:11:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350YdFg9Rpod34ylmYUyAnCfxfiKdtnShPJSS+THNG9On45kotrwTmF6ARLq441OR3LQJbmn9Kg==
X-Received: by 2002:a05:6214:c21:b0:5a2:e3e4:59b0 with SMTP id a1-20020a0562140c2100b005a2e3e459b0mr4151612qvd.44.1680790319253;
        Thu, 06 Apr 2023 07:11:59 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id d11-20020a0cf6cb000000b005dd8b9345f4sm514523qvo.140.2023.04.06.07.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 07:11:58 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
In-Reply-To: <20230406133805.GO386572@hirez.programming.kicks-ass.net>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen> <ZC1XD/sEJY+zRujE@lothringen>
 <20230405114148.GA351571@hirez.programming.kicks-ass.net>
 <ZC1j8ivE/kK7+Gd5@lothringen> <xhsmhpm8ia46p.mognet@vschneid.remote.csb>
 <20230406133805.GO386572@hirez.programming.kicks-ass.net>
Date: Thu, 06 Apr 2023 15:11:52 +0100
Message-ID: <xhsmh8rf59k2f.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, hca@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, Frederic Weisbecker <frederic@kernel.org>, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, mtosatti@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@da
 vemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/04/23 15:38, Peter Zijlstra wrote:
> On Wed, Apr 05, 2023 at 01:45:02PM +0100, Valentin Schneider wrote:
>>
>> I've been hacking on something like this (CSD deferral for NOHZ-full),
>> and unfortunately this uses the CPU-local cfd_data storage thing, which
>> means any further smp_call_function() from the same CPU to the same
>> destination will spin on csd_lock_wait(), waiting for the target CPU to
>> come out of userspace and flush the queue - and we've just spent extra
>> effort into *not* disturbing it, so that'll take a while :(
>
> I'm not sure I buy into deferring stuff.. a NOHZ_FULL cpu might 'never'
> come back. Queueing data just in case it does seems wasteful.

Putting those callbacks straight into the bin would make my life much
easier!

Unfortunately, even if they really should, I don't believe all of the
things being crammed onto NOHZ_FULL CPUs have the same definition of
'never' as we do :/

