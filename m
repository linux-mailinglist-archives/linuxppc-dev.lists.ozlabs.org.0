Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8788CF2F9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2024 11:16:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=BiosjQv3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VnCbD6wWWz3gFY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2024 19:07:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=BiosjQv3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VnCZP2CbSz3cTS
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 May 2024 19:06:35 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4C66940E016A;
	Sun, 26 May 2024 09:06:25 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Dk9wYavNe0pk; Sun, 26 May 2024 09:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1716714381; bh=zedgAlxO21oymFWocT8Z0a1YC46yYpVIHt+BQbWlsm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiosjQv3CgKP7BO3GoueBe5N4EemSuxztQUHJYn97cnD8nm/6yMG+RUtS65yPGfLQ
	 4NLJx1yuIFj+xNd+kAB/v7t0pIGsW2UAR127P0ei/YQUssKXFvHTfBnymO9RrWgzwt
	 2NKp5e9QIhjKh2guIAPKBPu6tl4E4ig14hzZaIEB6pO05JRgUKOVTKahDmGimmNKZP
	 FSxcykzWS8TZtEG9XxYgLhzX93OKB8EcKhSIcrl4HkhvB3f8xoQpsLHzOjby+KcWLN
	 EE3NBzutPK2sjdV62SuG0faw+L4ai6ttxJ2yAWmT+t4WFUFijwDmXt2EwIl/yUlEnl
	 sCCrKnWaZDx8P1HrswavzFY7uD1+0D6M9KBh9lODQ3SAkctr3kdrR2f8JYDjny51Zr
	 6VBu2/+5guWTsmvaMJgF9pbGkeos47H14qxCZ/517birhB/8sbCvuEtdW+lQeNjcil
	 fAYhq6agtfwbATm5fBWpkJCChTOiEVRHUukrTdcjYYyVQkIUL9Y/oDnmpO2RyX3HSH
	 c4pkFNSxOSSGkNrtzvE6BEz7rz+iFfC0p89hHOpTatcPLbfbaACfAchp3KboI11tVQ
	 EdyzEqpcei2VXqSdiz45rF3N4vPQ4zJYR0KUqq+RUbIuerWwfi63Ra6Jd8kKqWYcU3
	 y0aey59Vkzlo3Lt2vfM6HiYQ=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7DE0F40E01A1;
	Sun, 26 May 2024 09:06:01 +0000 (UTC)
Date: Sun, 26 May 2024 11:05:54 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Balasubrmanian, Vignesh" <vigbalas@amd.com>
Subject: Re: [PATCH v2 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Message-ID: <20240526090554.GAZlL7cpva88mMUbCK@fat_crate.local>
References: <87wmo4o3r4.ffs@tglx>
 <4a090901-9705-40aa-ac3d-d67c52660f22@amd.com>
 <20240522153433.GCZk4QiX4Hf0OuI48E@fat_crate.local>
 <902b1bf0-15e6-42df-8f86-21387deef437@amd.com>
 <20240523144543.GDZk9WlwKpCKx8I3RE@fat_crate.local>
 <664e101b-3689-4876-825b-a5aa12b7978f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <664e101b-3689-4876-825b-a5aa12b7978f@amd.com>
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
Cc: "felix.willgerodt@intel.com" <felix.willgerodt@intel.com>, "matz@suse.de" <matz@suse.de>, "George, Jini Susan" <JiniSusan.George@amd.com>, "keescook@chromium.org" <keescook@chromium.org>, "jhb@FreeBSD.org" <jhb@freebsd.org>, "binutils@sourceware.org" <binutils@sourceware.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Balasubrmanian, Vignesh" <Vignesh.Balasubrmanian@amd.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 26, 2024 at 10:24:41AM +0530, Balasubrmanian, Vignesh wrote:
> If we can add a new enum only when we extend, then as Thomas suggested can
> we use other kernel variables as in the first version of the patch until we
> extend for other/new features?

I assume by "other kernel variables" you mean CPUID?

If so, can you change the layout of your buffer once you export it to
userspace?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
