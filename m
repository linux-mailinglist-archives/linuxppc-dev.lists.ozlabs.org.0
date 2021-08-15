Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D19DC3EC9A2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Aug 2021 16:39:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gng0j5lBFz3cGK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 00:39:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=Ynjh7QDJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=Ynjh7QDJ; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gng0066rfz302N
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 00:38:39 +1000 (AEST)
Received: from zn.tnic (p200300ec2f26310039d0ba97aac93c10.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f26:3100:39d0:ba97:aac9:3c10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5FF7A1EC0505;
 Sun, 15 Aug 2021 16:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1629038311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=jL5qXq5tPSUlQog/FJ5eZ1GT2YpJvvVnQmTTUk0cbrA=;
 b=Ynjh7QDJnobQuRzRBtXZMflPEf0vTQxZ/1e/DI2MnZmP0BU3+0pTK5ZZQ5Gk5RnrPuYHa6
 IdpdAyOEUiLJZd8HI6wSzceOtBbAWAY0K9LHdKOg+Qfc/RBmkhxNql4Enc7Gc4LTKOJnaI
 0ETWtaeGc2m89ri2xInjGo/yEh1iYis=
Date: Sun, 15 Aug 2021 16:39:09 +0200
From: Borislav Petkov <bp@alien8.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v2 03/12] x86/sev: Add an x86 version of prot_guest_has()
Message-ID: <YRknDQGUJJ/j9pth@zn.tnic>
References: <cover.1628873970.git.thomas.lendacky@amd.com>
 <7d55bac0cf2e73f53816bce3a3097877ed9663f3.1628873970.git.thomas.lendacky@amd.com>
 <YRgUxyhoqVJ0Kxvt@zn.tnic>
 <4710eb91-d054-7b31-5106-09e3e54bba9e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4710eb91-d054-7b31-5106-09e3e54bba9e@amd.com>
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
Cc: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-s390@vger.kernel.org,
 Andi Kleen <ak@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 x86@kernel.org, amd-gfx@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 linux-graphics-maintainer@vmware.com, Joerg Roedel <jroedel@suse.de>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 15, 2021 at 08:53:31AM -0500, Tom Lendacky wrote:
> It's not a cross-vendor thing as opposed to a KVM or other hypervisor
> thing where the family doesn't have to be reported as AMD or HYGON.

What would be the use case? A HV starts a guest which is supposed to be
encrypted using the AMD's confidential guest technology but the HV tells
the guest that it is not running on an AMD SVM HV but something else?

Is that even an actual use case?

Or am I way off?

I know we have talked about this in the past but this still sounds
insane.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
