Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A10928197BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Dec 2023 05:23:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D3yMcK9b;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D3yMcK9b;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sw0md2fvhz3cV9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Dec 2023 15:23:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D3yMcK9b;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D3yMcK9b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sw0ln3Lskz2ykw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Dec 2023 15:22:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703046161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G45CImyqsOOmdqDD2eGP+r9BP7+mm5bd9KiBb8nBAIM=;
	b=D3yMcK9b2WExJ3zqsi7ES/PbEsj2PkZeR+C8g00ztxa3+JuPJcgZCOl3snzwhp6TazHJ7I
	0jtTyqXK4C63qks+SgVwo1g6gy7bSuig5lO3a/rupUm7+jqD4ejOG+ED+6pOarJUANgeM0
	duruL+35cneSBfsCiVAenVZdi4YlRxo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703046161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G45CImyqsOOmdqDD2eGP+r9BP7+mm5bd9KiBb8nBAIM=;
	b=D3yMcK9b2WExJ3zqsi7ES/PbEsj2PkZeR+C8g00ztxa3+JuPJcgZCOl3snzwhp6TazHJ7I
	0jtTyqXK4C63qks+SgVwo1g6gy7bSuig5lO3a/rupUm7+jqD4ejOG+ED+6pOarJUANgeM0
	duruL+35cneSBfsCiVAenVZdi4YlRxo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-Tu1M_nxTPP6L7Ts-3ewPyw-1; Tue, 19 Dec 2023 23:22:34 -0500
X-MC-Unique: Tu1M_nxTPP6L7Ts-3ewPyw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B6FA832D62;
	Wed, 20 Dec 2023 04:22:33 +0000 (UTC)
Received: from localhost (unknown [10.72.116.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83323492BE6;
	Wed, 20 Dec 2023 04:22:32 +0000 (UTC)
Date: Wed, 20 Dec 2023 12:22:29 +0800
From: Baoquan He <bhe@redhat.com>
To: Conor Dooley <conor@kernel.org>, akpm@linux-foundation.org
Subject: Re: [PATCH v4 5/7] kexec_file, ricv: print out debugging message if
 required
Message-ID: <ZYJsBW0Y7Y+XhSgf@MiWiFi-R3L-srv>
References: <20231213055747.61826-1-bhe@redhat.com>
 <20231213055747.61826-6-bhe@redhat.com>
 <20231219-twitch-many-ca8877857182@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219-twitch-many-ca8877857182@spud>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, nathan@kernel.org, joe@perches.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/19/23 at 02:44pm, Conor Dooley wrote:
> On Wed, Dec 13, 2023 at 01:57:45PM +0800, Baoquan He wrote:
> > Then when specifying '-d' for kexec_file_load interface, loaded
> > locations of kernel/initrd/cmdline etc can be printed out to help debug.
> > 
> > Here replace pr_debug() with the newly added kexec_dprintk() in kexec_file
> > loading related codes.
> > 
> > And also replace pr_notice() with kexec_dprintk() in elf_kexec_load()
> > because loaded location of purgatory and device tree are only printed
> > out for debugging, it doesn't make sense to always print them out.
> > 
> > And also remove kexec_image_info() because the content has been printed
> > out in generic code.
> > 
> > Signed-off-by: Baoquan He <bhe@redhat.com>
> 
> I'm sorry - I meant to look at this several days ago but I forgot.
> Apart from the typo that crept back into $subject, this version explains
> the rationale behind what you're changing a lot better, thanks.

Thanks for careful checking. I forgot the typo fixing you have pointed
out in v3 reviewing.

Hi Andrew,

Could you help fix the typo in subject?

[PATCH v4 5/7] kexec_file, ricv: print out debugging message if required
                           ~~~ s/ricv/riscv/

