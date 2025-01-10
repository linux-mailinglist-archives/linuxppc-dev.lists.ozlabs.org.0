Return-Path: <linuxppc-dev+bounces-4971-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6B0A08E45
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 11:44:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTyvC3JBpz3c9W;
	Fri, 10 Jan 2025 21:44:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736502302;
	cv=none; b=hU/VttKU9+ipd2453ke/QmBJ7Y5zukWybcW+525wofahiE70zBThRVoblaGzXqECg1HpLS1cuk4qCdaPhNuDQqxpgoA82bOD1jcSTdZjFUfAtKleq62PQPIKfIdmuoPAebrgALXMAvhPhTfRDblBXHhh1UgGSGepGaH4X3QwHEnpsJpRTB/5ZEgkQq6aBRK6IVmCg2lnN4+c8gInf7JbQxio436Q2x5E4S83MGu7rO9ifGzdFeBT52sb/PWuf+VliGyfUB9lOkBH2n8vX6XldESx20UeVfJGVkaHsQUhGTGuQmDbt6yMhtTbD6kA7zpl2Ypzfo/iwfk9F5O+5xiRLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736502302; c=relaxed/relaxed;
	bh=A4Kw1qoNYerqhNjh25Dgp7jdmE++mW9Fl3ZiJ8T3co8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=jky95A4nlo8IFFmzIBi+J38jdj5fFo9qcTfMCJSBvc00SHe1HA9Oxjn7ve4oBWJo9Yrkpmv5E7Svzt4lKmt2TxRZZQj3/BUkLNUmUjFqXBz+5D5yZDKbEIjS9qK9wa7r4MaGwk+aai+KK5H0yAKUmTZiqDOTHnRyiwI1TGd5C7LF0MOXifokplr/eoZ5ofk5TcyxwuiVVihfhh1OdpMlkPWZHcIUC4NMJmvWMJ2S+Yt9/dVM1Ky9CxhxVHYS+V7p2cYEKvpS7wEo28a163+/xoViyG+io1/e14RKGZZ0LCV69lIZPdo3Ds043F1XKh/cmN6832f91IKSNZcOhoEHbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OpFonKHK; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OpFonKHK; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OpFonKHK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OpFonKHK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTxb05t4tz3cBk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 20:44:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736502296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A4Kw1qoNYerqhNjh25Dgp7jdmE++mW9Fl3ZiJ8T3co8=;
	b=OpFonKHK4rsGIFf7HSuUlaFhBRRdsLlK1R0arRX8Qgj5U/1r5D9F44B4TYsKgwx49xHb+n
	5vBk4tEV8CbMFGi4NRmAKUmHTkpEW8Vd0dtx1wt9VRXgkCiiKSc63/ZnsFhVqgMtiikhQ6
	B6aTnOhYbqo/Q402brHq8KN6vSuJqMs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736502296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A4Kw1qoNYerqhNjh25Dgp7jdmE++mW9Fl3ZiJ8T3co8=;
	b=OpFonKHK4rsGIFf7HSuUlaFhBRRdsLlK1R0arRX8Qgj5U/1r5D9F44B4TYsKgwx49xHb+n
	5vBk4tEV8CbMFGi4NRmAKUmHTkpEW8Vd0dtx1wt9VRXgkCiiKSc63/ZnsFhVqgMtiikhQ6
	B6aTnOhYbqo/Q402brHq8KN6vSuJqMs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-Ko5u8BBNMpaBn7XAPuQIAg-1; Fri, 10 Jan 2025 04:44:54 -0500
X-MC-Unique: Ko5u8BBNMpaBn7XAPuQIAg-1
X-Mimecast-MFC-AGG-ID: Ko5u8BBNMpaBn7XAPuQIAg
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385dcae001fso783582f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 01:44:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736502293; x=1737107093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4Kw1qoNYerqhNjh25Dgp7jdmE++mW9Fl3ZiJ8T3co8=;
        b=GoggFeifY3vVHJYMb6AwILk576h2Q+NIy0SryYSTTAyayyTHJiZ15G/VCrsdakb7eC
         vfuwP3ClDQc1+fYvEM5OkoS7WF9yUWeXASoiLBDnqQPWjDWgOIi+w3dTSIf039zg74g3
         IQ2IfXOF1lVNVAYZHDVf5ZtC9i5qwiIjlxAu6ewFKplH39wY17prVXDqXwvXMqBu4iOs
         PbmRdO5Sr69+nEcFvhw3dsOAyGukbgsVqjm3v8gseR5ek0vXw6oqiye7AjKPriBn3RwT
         qJDz+boTemI0gqYOYoecI6N0miVsZ4tNPnPG7gcHulDis3+h4o9bqQwGTcrtT/g0f2d0
         NM9w==
X-Forwarded-Encrypted: i=1; AJvYcCUSu79Y//bFBgvLEfregWZTexpcbcO4k4QrgOoccCneNu8cPMv/ctzL1TknN2zb+FI/wc0ihrNR5kdxrKc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxmGqQSoqMZgdwmMzSRCGKCjGJ9K+OknuNQKcgMEEdSaN8QRU68
	ob89TXlyJjdB1rVIMK5Nya+CEMYH9UH1ZX6Nxd3w6LFCrDUhPUCGzE6YyfETXNoWpJYfb4wntKq
	ISMCotruhspeuZMeHMX+sosU3IjlMUTIk5Ei5UYofrrvy17BJiDnSxWjtZ+LD1A==
X-Gm-Gg: ASbGnct9SnXyiE1+lRzNArbvaO8iw/sDgpnMCUzwSElq2gCfwM/EzWJk3eIfpuY/Sya
	ELt8BoJ+/KdNCf00zgLinpMJF7EhpoCn+hjtjtEfdUQ7maOCx6pAQLR+YRQwXEHa3wiwjWCHxg5
	l5qYh1nNyORxfGj9fbz+HVVz+T9dpXxb3HWkj0NIegxzEA4/rtOQYMYsiRf3/owv4RTCQyjEOPr
	Hd4duSeeeThWkrVWfkWv7/011hXJnd/uBAaxVCWme4KTShtlTC2UB4mDQThp3kPUZfHVmjhxG/e
X-Received: by 2002:a05:6000:709:b0:386:3803:bbd5 with SMTP id ffacd0b85a97d-38a8733a1f9mr9910081f8f.45.1736502293453;
        Fri, 10 Jan 2025 01:44:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWMxVaNXeUTe+wjdV2pCbQXCctILb5vVg9f3+psJOjGS23Sr767uuQBsbyCemBlGukLyZjgw==
X-Received: by 2002:a05:6000:709:b0:386:3803:bbd5 with SMTP id ffacd0b85a97d-38a8733a1f9mr9910059f8f.45.1736502293124;
        Fri, 10 Jan 2025 01:44:53 -0800 (PST)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e383965sm4140444f8f.31.2025.01.10.01.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 01:44:52 -0800 (PST)
Date: Fri, 10 Jan 2025 10:44:51 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org, 
	Michal Simek <monstr@monstr.eu>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	chris@zankel.net, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>
Subject: Re: [PATCH] fs: introduce getfsxattrat and setfsxattrat syscalls
Message-ID: <4ad35w4mrxb4likkqijkivrkom5rpfdja6klb5uoufdjdyjioq@ksxubq4xb7ei>
References: <20250109174540.893098-1-aalbersh@kernel.org>
 <e7deabf6-8bba-45d7-a0f4-395bc8e5aabe@app.fastmail.com>
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
In-Reply-To: <e7deabf6-8bba-45d7-a0f4-395bc8e5aabe@app.fastmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6FQw9htdZ9i-uFu1tK9omgQHn-U_zZeGYLCMIIPz87M_1736502293
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-01-09 20:59:45, Arnd Bergmann wrote:
> On Thu, Jan 9, 2025, at 18:45, Andrey Albershteyn wrote:
> >
> >  arch/alpha/kernel/syscalls/syscall.tbl      |   2 +
> >  arch/m68k/kernel/syscalls/syscall.tbl       |   2 +
> >  arch/microblaze/kernel/syscalls/syscall.tbl |   2 +
> >  arch/parisc/kernel/syscalls/syscall.tbl     |   2 +
> >  arch/powerpc/kernel/syscalls/syscall.tbl    |   2 +
> >  arch/s390/kernel/syscalls/syscall.tbl       |   2 +
> >  arch/sh/kernel/syscalls/syscall.tbl         |   2 +
> >  arch/sparc/kernel/syscalls/syscall.tbl      |   2 +
> >  arch/x86/entry/syscalls/syscall_32.tbl      |   2 +
> >  arch/x86/entry/syscalls/syscall_64.tbl      |   2 +
> >  arch/xtensa/kernel/syscalls/syscall.tbl     |   2 +
> 
> You seem to be missing a couple of files here: 
> 
> arch/arm/tools/syscall.tbl
> arch/arm64/tools/syscall_32.tbl
> arch/mips/kernel/syscalls/syscall_n32.tbl
> arch/mips/kernel/syscalls/syscall_n64.tbl
> arch/mips/kernel/syscalls/syscall_o32.tbl
> 
>        Arnd
> 

Thanks! Added

-- 
- Andrey


