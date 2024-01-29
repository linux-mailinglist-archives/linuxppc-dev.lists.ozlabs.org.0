Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1E583FBF8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 02:58:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YEAVb6jU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YEAVb6jU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNWgF4DrMz3cTF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 12:58:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YEAVb6jU;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YEAVb6jU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNWfT4DlZz2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 12:58:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706493484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t5X+7+XPWD/yMamo09E+vqa8mLL0GiWmMXKBvuKtVnc=;
	b=YEAVb6jUJmnho3CUiEWMHL3hBHThbuf0de9+QEl/z2yPqIUYTUYTklm2Ow+1thEJLNWvYJ
	Kwggt3w2BBPJAvE+aHVcFZi7ibfuqp+eeV1fQnCkvKhTUn6InZiRimVbkpVdepH4Ctb1Zo
	8cWw1RWa0nWLy4tdHitAKPlopUaSqLU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706493484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t5X+7+XPWD/yMamo09E+vqa8mLL0GiWmMXKBvuKtVnc=;
	b=YEAVb6jUJmnho3CUiEWMHL3hBHThbuf0de9+QEl/z2yPqIUYTUYTklm2Ow+1thEJLNWvYJ
	Kwggt3w2BBPJAvE+aHVcFZi7ibfuqp+eeV1fQnCkvKhTUn6InZiRimVbkpVdepH4Ctb1Zo
	8cWw1RWa0nWLy4tdHitAKPlopUaSqLU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-320-9WvTuAhnPa6eorfNUQwX4g-1; Sun,
 28 Jan 2024 20:57:58 -0500
X-MC-Unique: 9WvTuAhnPa6eorfNUQwX4g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 255BC1C05AF0;
	Mon, 29 Jan 2024 01:57:57 +0000 (UTC)
Received: from localhost (unknown [10.72.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 085BB492BE2;
	Mon, 29 Jan 2024 01:57:55 +0000 (UTC)
Date: Mon, 29 Jan 2024 09:57:50 +0800
From: Baoquan He <bhe@redhat.com>
To: Klara Modin <klarasmodin@gmail.com>
Subject: Re: [PATCH linux-next v3 01/14] kexec: split crashkernel reservation
 code out from crash_core.c
Message-ID: <ZbcGHoLZfqro7i8g@MiWiFi-R3L-srv>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-2-bhe@redhat.com>
 <0b14826b-9373-4458-919d-1da2a62d4226@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b14826b-9373-4458-919d-1da2a62d4226@gmail.com>
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
Cc: linux-s390@vger.kernel.org, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, hbathini@linux.ibm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/28/24 at 02:28am, Klara Modin wrote:
> Hi,
> 
> On 2024-01-24 06:12, Baoquan He wrote:
> > And also add config item CRASH_RESERVE to control its enabling of the
> > codes. And update config items which has relationship with crashkernel
> > reservation.
> > 
> > And also change ifdeffery from CONFIG_CRASH_CORE to CONFIG_CRASH_RESERVE
> > when those scopes are only crashkernel reservation related.
> 
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index 502986237cb6..a9243e0948a3 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -2106,7 +2106,7 @@ config ARCH_SUPPORTS_CRASH_HOTPLUG
> >   	def_bool y
> >   config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
> > -	def_bool CRASH_CORE
> > +	def_bool CRASH_RESEERVE
> >   config PHYSICAL_START
> >   	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)
> 
> CRASH_RESEERVE is probably a typo and should be CRASH_RESERVE (with the
> former ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION isn't defined in my .config
> and `crashkernel=...` parameter has no effect).

You are right, thanks a lot. Will fix that.

