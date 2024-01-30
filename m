Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB9C8417E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 01:52:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ua2GQ+qo;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ua2GQ+qo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TP67f61nXz3cR1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 11:51:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ua2GQ+qo;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ua2GQ+qo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TP66w3CXCz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 11:51:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706575876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ic8SLEwt/n2TU5ymNLL9qjS6kOyxZWYWDtyY/k8xnq4=;
	b=Ua2GQ+qo5wQOF0FknVSD4OXyDPth/l6KdMZtNY4azPK5vbMSIMntCnziccGyxEGfiqsTa8
	EEsYJO8ABVz/QJaRiut51oolaKk320xe4Mro+9c1dCCrR92xAQxrTkL0VBn8XZ8sd8T8rT
	Dzu30b/x1xys3CmNAdJ1CGFxoiGCqKE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706575876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ic8SLEwt/n2TU5ymNLL9qjS6kOyxZWYWDtyY/k8xnq4=;
	b=Ua2GQ+qo5wQOF0FknVSD4OXyDPth/l6KdMZtNY4azPK5vbMSIMntCnziccGyxEGfiqsTa8
	EEsYJO8ABVz/QJaRiut51oolaKk320xe4Mro+9c1dCCrR92xAQxrTkL0VBn8XZ8sd8T8rT
	Dzu30b/x1xys3CmNAdJ1CGFxoiGCqKE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-XoMqkmfeOBWi1hwiKGxF3Q-1; Mon, 29 Jan 2024 19:51:11 -0500
X-MC-Unique: XoMqkmfeOBWi1hwiKGxF3Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2792C1013768;
	Tue, 30 Jan 2024 00:51:11 +0000 (UTC)
Received: from localhost (unknown [10.72.116.15])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CC221C060AF;
	Tue, 30 Jan 2024 00:51:09 +0000 (UTC)
Date: Tue, 30 Jan 2024 08:51:06 +0800
From: Baoquan He <bhe@redhat.com>
To: Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH linux-next 1/3] x86, crash: don't nest CONFIG_CRASH_DUMP
 ifdef inside CONFIG_KEXEC_CODE ifdef scope
Message-ID: <ZbhH+sg1BPi+R0j4@MiWiFi-R3L-srv>
References: <20240129135033.157195-1-bhe@redhat.com>
 <SN6PR02MB41571397201804BD486C6148D47E2@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB41571397201804BD486C6148D47E2@SN6PR02MB4157.namprd02.prod.outlook.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nathan@kernel.org" <nathan@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/29/24 at 06:27pm, Michael Kelley wrote:
> From: Baoquan He <bhe@redhat.com> Sent: Monday, January 29, 2024 5:51 AM
> > 
> > Michael pointed out that the #ifdef CONFIG_CRASH_DUMP is nested inside
> > arch/x86/xen/enlighten_hvm.c.
> 
> Did some words get left out in the above sentence?  It mentions the Xen
> case, but not the Hyper-V case.  I'm not sure what you intended.

Thanks a lot for your careful reviewing.

Yeah, I tried to list all affected file names, seems my vim editor threw
away some words. And I forgot mentioning the change in reboot.c.

I adjusted log as below according to your comments, do you think it's OK
now?

===
Michael pointed out that the #ifdef CONFIG_CRASH_DUMP is nested inside
CONFIG_KEXEC_CODE ifdef scope in some XEN, HyperV codes. 

Although the nesting works well too since CONFIG_CRASH_DUMP has
dependency on CONFIG_KEXEC_CORE, it may cause confusion because there
are places where it's not nested, and people may think it needs be nested
even though it doesn't have to.

Fix that by moving  CONFIG_CRASH_DUMP ifdeffery of codes out of
CONFIG_KEXEC_CODE ifdeffery scope.

And also put function machine_crash_shutdown() definition inside
CONFIG_CRASH_DUMP ifdef scope instead of CONFIG_KEXEC_CORE ifdef.

And also fix a building error Nathan reported as below by replacing
CONFIG_KEXEC_CORE ifdef with CONFIG_VMCORE_INFO ifdef.
......
===

Thanks
Baoquan

