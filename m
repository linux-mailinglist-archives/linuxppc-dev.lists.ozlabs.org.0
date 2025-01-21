Return-Path: <linuxppc-dev+bounces-5452-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F29A17FD7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 15:31:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcqQW4Rqbz304N;
	Wed, 22 Jan 2025 01:31:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737469891;
	cv=none; b=k8jUrQuRUIb4SZOogelL3Bt9L8pfp57HrNdBJuEdjBbvUyS/9uQMOSopzDokKn1CA+6rnwyhEGJv3cvpK6J8C6w+Kq6sOoBb+sX8m3jDzFHGcKuhLn7NKi5ueDMRmlxxCP4WBzm5H6iSi8uSm01Vw2jCkEii1IT3Q1448AAWoyu43dfUvWK0zjuoz2OvzZOzeYNqw1DdRHnzkYVpk/663uQVLXHQIVSGLYW2chAsxjNkqJhxwAUbiJMdJMlSu7prNSFt3yF8r7m7auErb4NkztNHG+UgY+sqrMF1JOO33jCHKMZ4nAlcEwWruDJ12m60KYPHhdu7QTzAB9BEYFvgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737469891; c=relaxed/relaxed;
	bh=6GmbrizBccdqBYi6hb4h7oEWiAa4+DQ5hN9o7ZNXkI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuMn8hXZixoTahcrCT5AFiZq7jIPlZOsaxnnDVFLlNKaSoJ91D10Eckq37Eh7gpDJLkhFlZuLrk9cyjnGYpPfkRT8hDZWxP83DjmlVRgJCVzWJb5L8D0w1F070VWg6ElSP/4UMGWx39Kndyn0Vf25jD1DE/HY+kxjFiflCjuIs65PesRYnzv2rGq3gpImItMcVNrRrZH04C87WpSy9fY/vdLISwuFBsAWqHGUs5pfNhvr1969PQtcrWvaq0j6dIl5JIE1rwe7DxbwY/sUDDF+gBTZOEcgxxXV1rWeEYOuvLtEHrB8UdWLhRKW1lserSHQysGVGT5s7rBb3BACKzF6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bI6MULAM; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bI6MULAM; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bI6MULAM;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bI6MULAM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=oleg@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YcqQS68QDz301Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 01:31:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737469881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6GmbrizBccdqBYi6hb4h7oEWiAa4+DQ5hN9o7ZNXkI4=;
	b=bI6MULAMv7xB+mx9Gd1Ny9EI5aXYJTsR1hVoa1YwcFPT4TUtzLjKkI7NCBX49EYVDG3cLX
	rdrHzLAzVKok13tCTlyqMDe7JFT9yXkce3Yhp8AplOFJN01VtljPY9eaYmr3kyzYjwfUEt
	g/ga+mXCD8dkI5fREN4TAnwjfzuaD48=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737469881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6GmbrizBccdqBYi6hb4h7oEWiAa4+DQ5hN9o7ZNXkI4=;
	b=bI6MULAMv7xB+mx9Gd1Ny9EI5aXYJTsR1hVoa1YwcFPT4TUtzLjKkI7NCBX49EYVDG3cLX
	rdrHzLAzVKok13tCTlyqMDe7JFT9yXkce3Yhp8AplOFJN01VtljPY9eaYmr3kyzYjwfUEt
	g/ga+mXCD8dkI5fREN4TAnwjfzuaD48=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-328-OpeHi3p_NmG1prZqbVPb9w-1; Tue,
 21 Jan 2025 09:31:14 -0500
X-MC-Unique: OpeHi3p_NmG1prZqbVPb9w-1
X-Mimecast-MFC-AGG-ID: OpeHi3p_NmG1prZqbVPb9w
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C15C21955BD2;
	Tue, 21 Jan 2025 14:31:11 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.31])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id A06E019560A7;
	Tue, 21 Jan 2025 14:31:06 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 21 Jan 2025 15:30:45 +0100 (CET)
Date: Tue, 21 Jan 2025 15:30:39 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] seccomp: kill the dead code in the
 !CONFIG_HAVE_ARCH_SECCOMP_FILTER version of __secure_computing()
Message-ID: <20250121143038.GB3422@redhat.com>
References: <20250120134409.GA21241@redhat.com>
 <20250120134452.GA21275@redhat.com>
 <202501201353.168E6AAC8@keescook>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501201353.168E6AAC8@keescook>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 01/20, Kees Cook wrote:
>
> On Mon, Jan 20, 2025 at 02:44:52PM +0100, Oleg Nesterov wrote:
> > Depending on CONFIG_HAVE_ARCH_SECCOMP_FILTER, __secure_computing(NULL)
> > will crash or not, this is not consistent/safe.
>
> Right now this never happens because there are no callers.
>
> > Fortunately, if CONFIG_HAVE_ARCH_SECCOMP_FILTER=n, __secure_computing()
> > has no callers, these architectures use secure_computing_strict().
>
> As you say here.
>
> > Also, after the previous change __secure_computing(sd) is always called
> > with sd == NULL, so it is clear that we can remove the code which makes
> > no sense.
>
> However, after this change, if someone were to *add* a caller, it would
> bypass strict mode.

OK, thanks, I agree this is not consistent, even if I think that
!CONFIG_HAVE_ARCH_SECCOMP_FILTER arches should not add a new caller.

> Instead of "return 0", it seems like it'd be better
> to remove the function entirely (and maybe add a comment about calling
> secure_computing_strict() directly)?

This means that __secure_computing() will be defined even if !CONFIG_SECCOMP,
but it won't be defined if CONFIG_SECCOMP && !CONFIG_HAVE_ARCH_SECCOMP_FILTER.

How about

	__secure_computing()
	{
		return secure_computing_strict(syscall_get_nr(...));
	}

in the "#ifndef CONFIG_HAVE_ARCH_SECCOMP_FILTER" section near
secure_computing_strict() in kernel/seccomp.c ?

Oleg.


