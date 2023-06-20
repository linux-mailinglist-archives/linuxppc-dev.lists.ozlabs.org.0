Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F06738EDC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 20:33:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bqpFt5V3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bqpFt5V3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmXFF0gsRz3bsn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:33:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bqpFt5V3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bqpFt5V3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Tue, 20 Jun 2023 18:23:03 AEST
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlflW648wz2y1c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 18:23:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687249381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5XHdbMNys0EMjfbiSdwj8lWyGP51R68NotGh4ls9XCg=;
	b=bqpFt5V3QLI2GxO8ApakkaAjuq9diyMpU8tyAnWFV32Z5ALRzQP7cm/LG5yOhId9EjrydZ
	TUhZN3ymgbJRCmzQj/umswV++pCbPAc3rQoSN0J6yy7dNvG4Sa4nb/0sRFOuWYQBUiF12T
	/Eq2WX4EE+2WDrYQKkII35hbmfF2F8U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687249381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5XHdbMNys0EMjfbiSdwj8lWyGP51R68NotGh4ls9XCg=;
	b=bqpFt5V3QLI2GxO8ApakkaAjuq9diyMpU8tyAnWFV32Z5ALRzQP7cm/LG5yOhId9EjrydZ
	TUhZN3ymgbJRCmzQj/umswV++pCbPAc3rQoSN0J6yy7dNvG4Sa4nb/0sRFOuWYQBUiF12T
	/Eq2WX4EE+2WDrYQKkII35hbmfF2F8U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-DHNnL6O0PoOX-_3jeDwo5g-1; Tue, 20 Jun 2023 04:21:49 -0400
X-MC-Unique: DHNnL6O0PoOX-_3jeDwo5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 918E73806739;
	Tue, 20 Jun 2023 08:21:48 +0000 (UTC)
Received: from localhost (ovpn-12-166.pek2.redhat.com [10.72.12.166])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B95A2166B26;
	Tue, 20 Jun 2023 08:21:46 +0000 (UTC)
Date: Tue, 20 Jun 2023 16:21:42 +0800
From: Baoquan He <bhe@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v2 02/13] x86/kexec: refactor for kernel/Kconfig.kexec
Message-ID: <ZJFhlsFN6DxnWsQE@MiWiFi-R3L-srv>
References: <20230619145801.1064716-1-eric.devolder@oracle.com>
 <20230619145801.1064716-3-eric.devolder@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619145801.1064716-3-eric.devolder@oracle.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

Hi Eric,

On 06/19/23 at 10:57am, Eric DeVolder wrote:
......
> +config ARCH_SUPPORTS_KEXEC
> +	def_bool y
>  
> -config ARCH_HAS_KEXEC_PURGATORY
> -	def_bool KEXEC_FILE
> +config ARCH_SUPPORTS_KEXEC_FILE
> +	def_bool X86_64 && CRYPTO && CRYPTO_SHA256
......  
> +config ARCH_SELECTS_KEXEC_FILE
> +	def_bool y
>  	depends on KEXEC_FILE
> -	help

I am a little confused about this ARCH_SELECTS_XX adding. Wondering what
limits us defining the ARCH_SUPPORTS_KEXEC_FILE like below? I have limited
knowledge about Kconfig, please correct me if I am wrong. Thanks in
advance.

 +config ARCH_SUPPORTS_KEXEC_FILE
 +	def_bool y
  	depends on KEXEC_FILE
  	depends on X86_64 && CRYPTO && CRYPTO_SHA256

> -
> -	  This option makes the kexec_file_load() syscall check for a valid
> -	  signature of the kernel image.  The image can still be loaded without
> -	  a valid signature unless you also enable KEXEC_SIG_FORCE, though if
> -	  there's a signature that we can check, then it must be valid.
> -
> -	  In addition to this option, you need to enable signature
> -	  verification for the corresponding kernel image type being
> -	  loaded in order for this to work.
> -

