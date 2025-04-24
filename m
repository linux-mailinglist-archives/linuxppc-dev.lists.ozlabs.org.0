Return-Path: <linuxppc-dev+bounces-7959-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59500A9B035
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 16:10:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjyXj65G6z3bnm;
	Fri, 25 Apr 2025 00:09:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745503797;
	cv=none; b=gOkcmbcONMxRpAy2uTdlDbL63+U+NaMpf/CcvoyqpBz2L7r5+EnrPiGryGZbxBHAaj0JstgznjVG3VqAHSeD7px2WxTHzmq3SCsomr8ssbKJcDkhAX3JUeGcO8j56PUaSt4PbRd37/FRZVqimLw7KchF1Et+XVYE9lVavMFXsyAJO+33O6xe4dXTJGFIp15z3juOt/toYqL+zRTt3aGeOclwzk+kWxc04MuF8HLaET6Mcl9KlCq/GUgz1V11LHR6A3/+GOAzFGgXH/0yUzL2eZhqA5vFdwRohIS/X/xatDFYj9BSPltFg4GZQLVE62suWQwO6dXBpKjazJCM5MJ2+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745503797; c=relaxed/relaxed;
	bh=Kcd6o2tvUH9Wlq0TU9ZCul/Ej7huhlgPAxSc9bD4eg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=TF44CfPPwVYM+qM9SQYGL4W+1uv6BJBSazKldAlLUMnAm6t8JC2rj8WhoQbZ4yhOODiEjRbLpN4gQuu9NVZEghUZbUJyIJpYbEehTUE2heXx+FUBnSDSybp45SdjOLVkNuOkA6RY4Yz5WGFDiWlGKRTyqepa41QWEwqV7sJ9r32Va7RP6t9qOCf94cmDDGaCsHWFqgiAy6BYJMlnMYGM7B2vF3aNAlqHRb+QsN5OAm0FsIMfsUv/fg87R9fU6pESHzrsALeV5ZTVwBYTEgXJcmNmcBC/st7xU5gn+7ZOkzZQLqp2jT980ePFzaFLPampZCKwElCj6CQQkmk67265Pw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gqI10tR6; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Uch8hh63; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gqI10tR6;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Uch8hh63;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjyXg61s2z2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Apr 2025 00:09:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745503789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kcd6o2tvUH9Wlq0TU9ZCul/Ej7huhlgPAxSc9bD4eg0=;
	b=gqI10tR6664EVHaUzsi6pGv6tz0HdbE9geKp9ilsJrCv/IGdHdIl3F+t87ZV5iEWJ36BFT
	90ww/K6AwKDagRwpzvjf85EZ5QIlj0H5iBbyf6dpvyMJHbcAUl6S24WnFsa6qAyHGrCAeF
	PakxFVdr+Mlayu7wN0mHe39Alz4ycjw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745503790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kcd6o2tvUH9Wlq0TU9ZCul/Ej7huhlgPAxSc9bD4eg0=;
	b=Uch8hh63NMIZLtr6HMzRYmlwJgq3RgBL9UYmA3CgrzfGcJUwIb0YleUkkzysnW6zFFkCOe
	1UzFb+vkNqHl16YTKQyBti+p9IeobrA1DuY5JlD12MKreY7rEhnyQRW51a0e6ytHaaq6Di
	JjZ8DMbMbpNz3Mk+RVjdCu20mgO0udk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-2YFT9AeDMqqF42BS9OdZhg-1; Thu, 24 Apr 2025 10:09:47 -0400
X-MC-Unique: 2YFT9AeDMqqF42BS9OdZhg-1
X-Mimecast-MFC-AGG-ID: 2YFT9AeDMqqF42BS9OdZhg_1745503786
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3913b2d355fso366585f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 07:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745503786; x=1746108586;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kcd6o2tvUH9Wlq0TU9ZCul/Ej7huhlgPAxSc9bD4eg0=;
        b=FK31PIL/9Q2ByYtEaElc5XPUE4SZ04/sUAIw+Ob0vn9Iyjuph07h4sIVJ/wFnXmk9s
         IUVen0QOJKnpNjr583ZVdGXg8vA0dch6EmpBwbfY1HD7C1ymnBjOORJEqhx7oCtm5tcY
         eUjDFFk5qLu3BtZ7vVOMcuCu8TL1zCAiSPHy+JqOhHl8+/6N9nv8MtkXYOaU46dyGFx6
         tXHU5L0E+gm2g/4vRhEYLhIKtUlgOtrUmTk98PWa9Yy6yF5dVuW3T54YjwseD01yiIe4
         jVXMmd1qtIzLKYj7IK7BDDOa03Xp83OOdJKhBIx0N8dl+Wur9+EchjXyGJyaskGzSEDa
         4Dmg==
X-Forwarded-Encrypted: i=1; AJvYcCV0P/H1DlAduObDpJR1zJGoLADy66TWbGpW0UIk7HdbjLE3NYdzwh/zTHQiDiEZpez0NGvc6b/6EePRNM4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzvuU/8oZt4TfJ8xdNYj7LmCi79+Q/HpJpwokobOxbR/FxiiAHI
	PlVGuGgMjI+wJksScHV0ZyCiRx5A/LYVuXYuf0SfLhiOOJ6NTPMdKeaHul4hL0NYcXhNjFKNbDA
	GMmHNsCh65eRR+OJGPlBgqOzpoYQqBvnfVbJNO2HITWnnoFgFcPZjUJ/KljuAGNQ=
X-Gm-Gg: ASbGncuWPsyDk2aziPY/shkxoAYixws3LEq9/9974KaZrcLRGDWWaVxE89+UI6hctgh
	WI9bRS7vtZvsjL38V6dZQm9AXuxAS4iNezNxwocunl/l58oqwVkkzlXI90ogEMa5hlsUjwhtCha
	k3RcKkcHQpDNK9SXJ5JCkPQnXpK+eiVJ1LKoi3krALMb+wLT+3aLNKKbv3w3MPOPOvAcVY5/Wa4
	U/pNtJIUkp6mHo3wQM++D4mPifZ4Ye5JjU3a2BWA5/9dTsMGTCFCXE+v119i4k54KpqPLESlQTb
	zu4cZSyImqQfzN3331IKB0qcQw==
X-Received: by 2002:a05:6000:40dd:b0:39c:2669:d786 with SMTP id ffacd0b85a97d-3a06cf564f6mr2030221f8f.19.1745503786468;
        Thu, 24 Apr 2025 07:09:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCLnvnPrTr2kA4EPsTX8eBJWla0qlNHBLrDC/aXaOPuzLScpVQ0iwMUi89EkItUdIH45LJew==
X-Received: by 2002:a05:6000:40dd:b0:39c:2669:d786 with SMTP id ffacd0b85a97d-3a06cf564f6mr2030125f8f.19.1745503785858;
        Thu, 24 Apr 2025 07:09:45 -0700 (PDT)
Received: from t14ultra (109-81-82-22.rct.o2.cz. [109.81.82.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4c4945sm2217236f8f.47.2025.04.24.07.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:09:44 -0700 (PDT)
Date: Thu, 24 Apr 2025 16:10:04 +0200
From: Jan Stancek <jstancek@redhat.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>,
	jstancek@redhat.com
Subject: Re: [PATCH 08/19] vdso/gettimeofday: Prepare do_hres_timens() for
 introduction of struct vdso_clock
Message-ID: <aApGPAoctq_eoE2g@t14ultra>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
 <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de>
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
MIME-Version: 1.0
In-Reply-To: <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YdN_3kyBhxT1res-lqSLWhgICXHPfIxfwD7VVVnV2W8_1745503786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Mar 03, 2025 at 12:11:10PM +0100, Thomas Weiﬂschuh wrote:
>From: Anna-Maria Behnsen <anna-maria@linutronix.de>
>
>To support multiple PTP clocks, the VDSO data structure needs to be
>reworked. All clock specific data will end up in struct vdso_clock and in
>struct vdso_time_data there will be array of it. By now, vdso_clock is
>simply a define which maps vdso_clock to vdso_time_data.
>
>Prepare for the rework of these structures by adding struct vdso_clock
>pointer argument to do_hres_timens(), and replace the struct vdso_time_data
>pointer with the new pointer arugment whenever applicable.
>
>No functional change.
>
>Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
>Signed-off-by: Nam Cao <namcao@linutronix.de>
>Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
>---
> lib/vdso/gettimeofday.c | 35 ++++++++++++++++++-----------------
> 1 file changed, 18 insertions(+), 17 deletions(-)
>

Hi,

starting with this patch, I'm seeing user-space crashes when using clock_gettime():
   BAD  -> 83a2a6b8cfc5 vdso/gettimeofday: Prepare do_hres_timens() for introduction of struct vdso_clock
   GOOD -> 64c3613ce31a vdso/gettimeofday: Prepare do_hres() for introduction of struct vdso_clock

It appears to be unique to aarch64 with 64k pages, and can be reproduced with
LTP clock_gettime03 [1]:
   command: clock_gettime03 
   tst_kconfig.c:88: TINFO: Parsing kernel config '/lib/modules/6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k/build/.config'
   tst_test.c:1903: TINFO: LTP version: 20250130-231-gd02c2aea3
   tst_test.c:1907: TINFO: Tested kernel: 6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k #1 SMP PREEMPT_DYNAMIC Wed Apr 23 23:23:54 UTC 2025 aarch64
   tst_kconfig.c:88: TINFO: Parsing kernel config '/lib/modules/6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k/build/.config'
   tst_test.c:1720: TINFO: Overall timeout per run is 0h 05m 24s
   clock_gettime03.c:121: TINFO: Testing variant: vDSO or syscall with libc spec
   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct 10000ms
   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct 10000ms
   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct -10000ms
   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct -10000ms
   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
   tst_test.c:438: TBROK: Child (233649) killed by signal SIGSEGV

or with:
--------------------- 8< ----------------------
#define _GNU_SOURCE
#include <sched.h>
#include <time.h>
#include <unistd.h>                                                                                                                                                                                                                          #include <sys/wait.h>

int main(void)
{
         struct timespec tp;
         pid_t child;
         int status;

         unshare(CLONE_NEWTIME);

         child = fork();
         if (child == 0) {
                 clock_gettime(CLOCK_MONOTONIC_RAW, &tp);
         }

         wait(&status);
         return status;
}

# ./a.out ; echo $?
139
--------------------- >8 ----------------------

RPMs and configs can be found at Fedora koji, latest build is at [2] (look for kernel-64k).

Regards,
Jan

[1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
[2] https://koji.fedoraproject.org/koji/buildinfo?buildID=2704401


