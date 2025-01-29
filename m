Return-Path: <linuxppc-dev+bounces-5688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EEEA2244E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 19:53:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yjrrf6HZgz2yyT;
	Thu, 30 Jan 2025 05:53:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738176786;
	cv=none; b=OfclGY3lWkTlXcAHg7xJfuKsJBp5knruy89Tn5LU2hhDi0uQJHUw80Z8J2YUni6/78nLE+we4av78HCHS+JIp5Pl38z4AWcWHXkVD7/is5bEUViDutu+tGyuQKwC3zXJgZQa79zHtEICzMNfYuSQ6Y4n/DTyqP8lLzn/7RuK6jWFsbAS0cYBcJN7ISQJBtIVC+pfpD+Zv245YaEGUQ35uC4JDsdJkF/TInqyar/xCbPjtYEheF1XEIaPtGTbJ6X8VtQIptfNDcEmOM96zImsAZLDzqIQADaP24tEctHjBdDqB4RG7iCGXurRAlgfXz9qpIZ82yQWNqlZTfrNSx9Gvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738176786; c=relaxed/relaxed;
	bh=vlOChQEKTp5JX+pbfAOT77vMe8ez+6+Y0ab8kJl+7mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iypOOuRRXVC6oN141iOWc/4a3fMCABUb6smS3zRSf4EmO8KPP4YAkLQElHjo1P2coasilGHWEL0gzuzzJpXbT0HypyKUcWE2xQH0WNjeCkdoYA8gKPoV0Q7fE/02eW3mHCLddW8ZjtxdAUeKC6pPN0gN2Nw6+NeIlMjuH0B+SASeRPwbHWnr/bWOzcGHRjve3Oiny9LQ61pUWGUuMrudCoLq5Wxx2lEOuq/3pxaSXsSQQeMs80EweXYCP9Tp34Ng3A+d3+en+nUyyMduu9kPXu3+4bZP5xLeaIvU72c2D8ah8PKJ4sjmVsoHzMzAaPheFkSCEOlFmVCrNhOWOK7BFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dFk9ZqPn; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WRb+khmg; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dFk9ZqPn;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WRb+khmg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yjrrd5ZbLz2ytm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2025 05:53:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738176781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vlOChQEKTp5JX+pbfAOT77vMe8ez+6+Y0ab8kJl+7mw=;
	b=dFk9ZqPnXrDNUuvjzR8PQuHxzaNUSNi9ViOXgADqLO3ARmwiK1/n0L/0lEEaTeFQI/FlIr
	DOkc5R5UMNXyrsKchRUE2T1bHqBDG79Cg584B1P8X1xC6LzhMHs09TWlR1BMsGHE8KZ4tz
	LpXJytgzl2v3cM0i3MTklG9c3pLr0Kg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738176782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vlOChQEKTp5JX+pbfAOT77vMe8ez+6+Y0ab8kJl+7mw=;
	b=WRb+khmgHLgCAl1ujK3GxAUAs6JFnnHfwClFvM/UcfI8UgankvZFXiJRxTTLHPUQfn3zNX
	AaixfGeMWAsrccNl/sO2FFDtoi9kkCpbjcGe/yxGeHVsp0d/yNMKia6/18U8FvG2PwpMDe
	90awVkH19OibJqO0Hbo7eDWyGs6QBwM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-9t9EmevBOu69KQmdLrigRQ-1; Wed,
 29 Jan 2025 13:52:59 -0500
X-MC-Unique: 9t9EmevBOu69KQmdLrigRQ-1
X-Mimecast-MFC-AGG-ID: 9t9EmevBOu69KQmdLrigRQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 39AD7180034F;
	Wed, 29 Jan 2025 18:52:48 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.226.29])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 3326919560AA;
	Wed, 29 Jan 2025 18:52:16 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 29 Jan 2025 19:52:21 +0100 (CET)
Date: Wed, 29 Jan 2025 19:51:49 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: Alexey Gladkov <legion@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	Shuah Khan <shuah@kernel.org>, linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-api@vger.kernel.org
Subject: Re: [PATCH v3 0/6] ptrace: introduce PTRACE_SET_SYSCALL_INFO API
Message-ID: <20250129185149.GA25901@redhat.com>
References: <20250128091445.GA8257@strace.io>
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
In-Reply-To: <20250128091445.GA8257@strace.io>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IrQvBykdDFxLIdaKBJH3rZA39agsm-_dCpHIfMqfk7o_1738176773
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 01/28, Dmitry V. Levin wrote:
>
>     * ptrace: Add explicit padding to the end of struct ptrace_syscall_info,
>       simplify obtaining of user ptrace_syscall_info,
>       do not introduce PTRACE_SYSCALL_INFO_SIZE_VER0
>     * ptrace: Change the return type of ptrace_set_syscall_info_* functions
>       from "unsigned long" to "int"
>     * ptrace: Add -ERANGE check to ptrace_set_syscall_info_exit,
>       add comments to -ERANGE checks
>     * ptrace: Update comments about supported syscall stops
>     * selftests: Extend set_syscall_info test, fix for mips n32

Again, I can't review 1-3, I know nothing about the non-x86 architectures.

As for 4-6, feel free to add

Reviewed-by: Oleg Nesterov <oleg@redhat.com>


