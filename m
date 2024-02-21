Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CB585E8DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 21:12:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=MuEJuTRk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg6s119sVz3dRJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 07:12:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=MuEJuTRk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg6rD3GKDz3brV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 07:12:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B8F9615E1;
	Wed, 21 Feb 2024 20:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0F2C433F1;
	Wed, 21 Feb 2024 20:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1708546326;
	bh=KKWjsYrhxbzP+pEV3+kQm3VuOC8L+ibneC+FX980NRc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MuEJuTRkJMRKFh3mqp6fOZFvfpTamLVq2EoDhR5mfha94P8FQDRrLDaKnE+k3kAQZ
	 D+GTp72il9gGReGfi9Ecu5EvwmjwjIQjWeb5Sl3WDVdyp0MgKQCiHumttOefNnW4dZ
	 V8FEBJZwbop8/DmgOiy+uG0GbLTy+1K4MhvY4Dg8=
Date: Wed, 21 Feb 2024 12:12:05 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v2 01/14] kexec: split crashkernel reservation code out
 from crash_core.c
Message-Id: <20240221121205.00202fab8c1732bc433a845f@linux-foundation.org>
In-Reply-To: <e1bd53c6-ad9a-46d5-9f49-ecdd64d98f61@linux.ibm.com>
References: <20240119145241.769622-1-bhe@redhat.com>
	<20240119145241.769622-2-bhe@redhat.com>
	<e1bd53c6-ad9a-46d5-9f49-ecdd64d98f61@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, Baoquan He <bhe@redhat.com>, piliu@redhat.com, linux-sh@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, ebiederm@xmission.com, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com, viro@zeniv.linux.org.uk
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Feb 2024 22:59:47 +0530 Sourabh Jain <sourabhjain@linux.ibm.com> wrote:

> >   config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
> > -	def_bool CRASH_CORE
> > +	def_bool CRASH_RESEERVE
> 
> %s/CRASH_RESEERVE/CRASH_RESERVE? 

Yes, thanks, this has been addressed in a followon fixup patch
in the mm.git tree.
