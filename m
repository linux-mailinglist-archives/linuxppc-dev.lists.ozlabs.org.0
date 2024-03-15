Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497C87D76E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 00:52:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=b3/1Rq+m;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XmTWXAk7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TxLdf1x7yz3vYy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Mar 2024 10:52:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=b3/1Rq+m;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=XmTWXAk7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TxLcn689Lz30fh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Mar 2024 10:51:37 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1710546688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Miou2k+UhGYGY4SJcmQw585wT8SSQhHvWDGf+ECF8+o=;
	b=b3/1Rq+mPFr7G3wtb7+wYHB2LiWKrlY7QVudbKeM8fs2DP7nI8gKDbdjS7HpjASZ0t0CIY
	KS4jwvvcUqG8pKGbiLgctdTz+Z/JHzvO3gQ79sMSPqgTAvcBPHyscsXsOOLvQvqCqUtoQE
	OqmAVthRG8X2NbB7CLrFhs/vrgYSNY3zoMjh/teUa0C/qwiPF654hWZ2AYtKJmRuKBtnms
	08Wm2IxibS1vzUQjzzMkJB+jMRHKZigu0IknS+vsyMwnRPyuavxCSOuQDKVUfRMlR03bKu
	ZQbCDGLAdJNQwXrK5ucbbtxjZAkfrrZeOHD+ivqxAqDE+cxpYGVO5CEDJcZCpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1710546688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Miou2k+UhGYGY4SJcmQw585wT8SSQhHvWDGf+ECF8+o=;
	b=XmTWXAk7jPDIJ9p3Z19L+CuwDaBuDDNc6y+XNbmOlsC4vNgPLaSm6cmW3ASyZvXnuNNb+H
	f5k9vDGESvQ/3BAA==
To: Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
In-Reply-To: <20240314162954.GAZfMmAnYQoRjRbRzc@fat_crate.local>
References: <20240314112359.50713-1-vigbalas@amd.com>
 <20240314112359.50713-2-vigbalas@amd.com>
 <dd54d6de-0bcc-4b2e-a420-b1a429b06246@intel.com>
 <20240314160824.GDZfMg-J1VOyjxIMiV@fat_crate.local>
 <6ce6aa20-25d2-4784-823f-2a18f592e002@intel.com>
 <20240314162954.GAZfMmAnYQoRjRbRzc@fat_crate.local>
Date: Sat, 16 Mar 2024 00:51:28 +0100
Message-ID: <87cyrvjbpb.ffs@tglx>
MIME-Version: 1.0
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
Cc: felix.willgerodt@intel.com, matz@suse.de, keescook@chromium.org, jhb@freebsd.org, binutils@sourceware.org, x86@kernel.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, npiggin@gmail.com, linux-toolchains@vger.kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 14 2024 at 17:29, Borislav Petkov wrote:
> On Thu, Mar 14, 2024 at 09:19:15AM -0700, Dave Hansen wrote:
>> Are you envisioning an *XSAVE* state component that's not described by
>> CPUID?
>
> I want to be prepared. You can imagine some of the short cuts and
> corners cutting hw guys would do so I'd want to be prepared there and
> not tie this to CPUID.

Anything which is not enumerated in CPUID does not exist in
XSTATE. Period and end of story.

Stop paving the way for hardware people to have an excuse for being
stupid.

Aside of that XSTATE is a dead end as we all know.

Thanks,

        tglx
