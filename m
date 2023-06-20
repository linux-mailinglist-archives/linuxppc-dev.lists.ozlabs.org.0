Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0684C738EEA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:35:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EFvLYNFP;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EFvLYNFP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmXHp6XjWz3cNS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:35:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EFvLYNFP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EFvLYNFP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlqQ22d72z3bfm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 00:53:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687272807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M+loKwD1RCVu8eKK2gw8N4KlZrUem/NzN5IicUf+C0A=;
	b=EFvLYNFPSqk1u4vmTRp/Negk6qS0NZmRBMPVVQiHe9Yv8diMPVyJc6M0dMtnr1qkHBE0WI
	yy02O5wK8aXW3L9gdJTgc3I0eONMJNHFvCJBByA/DRdkk5A8u38AcnGR9E21VPQQuKgbwn
	xIr0SgRO2IUGmOw9p7SVNP9/mseHEx0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687272807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M+loKwD1RCVu8eKK2gw8N4KlZrUem/NzN5IicUf+C0A=;
	b=EFvLYNFPSqk1u4vmTRp/Negk6qS0NZmRBMPVVQiHe9Yv8diMPVyJc6M0dMtnr1qkHBE0WI
	yy02O5wK8aXW3L9gdJTgc3I0eONMJNHFvCJBByA/DRdkk5A8u38AcnGR9E21VPQQuKgbwn
	xIr0SgRO2IUGmOw9p7SVNP9/mseHEx0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-xInM5PQYOXiUnqhucMOkTw-1; Tue, 20 Jun 2023 10:53:23 -0400
X-MC-Unique: xInM5PQYOXiUnqhucMOkTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 344871C2CFEB;
	Tue, 20 Jun 2023 14:49:56 +0000 (UTC)
Received: from localhost (ovpn-12-166.pek2.redhat.com [10.72.12.166])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5B4014682F7;
	Tue, 20 Jun 2023 14:49:54 +0000 (UTC)
Date: Tue, 20 Jun 2023 22:49:50 +0800
From: Baoquan He <bhe@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v2 02/13] x86/kexec: refactor for kernel/Kconfig.kexec
Message-ID: <ZJG8jtNUWXxmnfao@MiWiFi-R3L-srv>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
 <20230619145801.1064716-3-eric.devolder@oracle.com>
 <ZJFhlsFN6DxnWsQE@MiWiFi-R3L-srv>
 <ac065d02-61a4-3b1f-241d-443ede70d3f2@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac065d02-61a4-3b1f-241d-443ede70d3f2@oracle.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Thu, 22 Jun 2023 04:32:35 +1000
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
Cc: chenhuacai@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, linux-mips@vger.kernel.org, James.Bottomley@hansenpartnership.com, dalias@libc.org, hpa@zytor.com, linux-riscv@lists.infradead.org, will@kernel.org, kernel@xen0n.name, tsi@tuyoix.net, linux-s390@vger.kernel.org, agordeev@linux.ibm.com, rmk+kernel@armlinux.org.uk, paulmck@kernel.org, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, paul.walmsley@sifive.com, mingo@redhat.com, geert@linux-m68k.org, hbathini@linux.ibm.com, samitolvanen@google.com, ojeda@kernel.org, juerg.haefliger@canonical.com, borntraeger@linux.ibm.com, frederic@kernel.org, arnd@arndb.de, mhiramat@kernel.org, ardb@kernel.org, thunder.leizhen@huawei.com, aou@eecs.berkeley.edu, keescook@chromium.org, gor@linux.ibm.com, anshuman.khandual@arm.com, hca@linux.ibm.com, xin3.li@intel.com, npiggin@gmail.com, konrad.wilk@oracle.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists.linux.dev, glaubitz@physik.fu-berlin.de, tglx@linutronix.de, ziy@nvidia.com, linux-arm-kernel@lists.infradead.org, boris.ostrovsky@oracle.com, tsbogend@alpha.franken.de, sebastian.reichel@collabora.com, linux-parisc@vger.kernel.org, gregkh@linuxfoundation.org, kirill.shutemov@linux.intel.com, ndesaulniers@google.com, linux-kernel@vger.kernel.org, sourabhjain@linux.ibm.com, palmer@dabbelt.com, svens@linux.ibm.com, tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, masahiroy@kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/20/23 at 07:56am, Eric DeVolder wrote:
> 
> 
> On 6/20/23 03:21, Baoquan He wrote:
> > Hi Eric,
> > 
> > On 06/19/23 at 10:57am, Eric DeVolder wrote:
> > ......
> > > +config ARCH_SUPPORTS_KEXEC
> > > +	def_bool y
> > > -config ARCH_HAS_KEXEC_PURGATORY
> > > -	def_bool KEXEC_FILE
> > > +config ARCH_SUPPORTS_KEXEC_FILE
> > > +	def_bool X86_64 && CRYPTO && CRYPTO_SHA256
> > ......
> > > +config ARCH_SELECTS_KEXEC_FILE
> > > +	def_bool y
> > >   	depends on KEXEC_FILE
> > > -	help
> > 
> > I am a little confused about this ARCH_SELECTS_XX adding. Wondering what
> > limits us defining the ARCH_SUPPORTS_KEXEC_FILE like below? I have limited
> > knowledge about Kconfig, please correct me if I am wrong. Thanks in
> > advance.
> > 
> >   +config ARCH_SUPPORTS_KEXEC_FILE
> >   +	def_bool y
> >    	depends on KEXEC_FILE
> >    	depends on X86_64 && CRYPTO && CRYPTO_SHA256
> > 
> 
> For the ARCH_SUPPORTS_ options, I chose to list the dependencies on the
> def_bool line to show that it took all those conditions to result in True.
> However, as you point out, using a def_bool y and then listing them as 'depends on' works as well.
> Probably would have resulted in fewer changes to the Kconfig file.
> Either way is ok (the 'depends on KEXEC_FILE' is erroneous in your example).

Got it, thanks. To me, one option with explicit dependencies looks clearer
and straightforward. I need check and investigage why two options are needed,
whether two options are unavoidable. Not sure if other people would get
the same feeling or not. Honestly, it's my first time to see the usage of
XXX_SELECTS_XXX, it took me a while to dig into.

> 
> > > -
> > > -	  This option makes the kexec_file_load() syscall check for a valid
> > > -	  signature of the kernel image.  The image can still be loaded without
> > > -	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
> > > -	  there's a signature that we can check, then it must be valid.
> > > -
> > > -	  In addition to this option, you need to enable signature
> > > -	  verification for the corresponding kernel image type being
> > > -	  loaded in order for this to work.
> > > -
> > 
> 

