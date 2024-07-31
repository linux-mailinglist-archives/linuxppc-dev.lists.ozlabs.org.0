Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E36942BE8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 12:28:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=yuEGRxPn;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=1jxQraHY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYpGW2d2gz3dDM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 20:28:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=yuEGRxPn;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=1jxQraHY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYpFp5xfHz3cQq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 20:27:58 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1722421668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+2WiS37JbmCxNlGKN1CAx63Qz/WDKprgYFwCmASZdTs=;
	b=yuEGRxPnuDJr/wvzoTRwB8tWCsiYJd1IrUYwualwZPB0NanY9Fz1kyE2FQ83eK8irtFHJg
	nrrbZXe+2gZOgU63dY4TRxdgWvmAkZqUKIl5rbPpxoDq+LBo2x21gQ60e+4UFj7g4/2TBj
	K6EFEyjuko13nUTbew+usImvUOB0sIE2BFaVMkzsdfUyPA2M94XqBowTR+4P1jbv9e9dmB
	RFQDOS2rLdMkQmL77x625cvGHyvRHson48b39y01txtg5uCUVSOOIDDbcj4VgbJUKHTrL3
	LQQfDDrR6eM4/8uMvg6sHIvxubRFRLTBWDioFWWZh/uNlUJZlLNbvaVeoHHpbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1722421668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+2WiS37JbmCxNlGKN1CAx63Qz/WDKprgYFwCmASZdTs=;
	b=1jxQraHYtD4qSM38HL7PNqHpM032iKDVgHeii9Bsvxh9UYzxKL2leZzOLohHaNN2ye5G9t
	P7ipU/OtrhYQYxAA==
To: "Nysal Jan K.A." <nysal@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] cpu/SMT: Enable SMT only if a core is online
In-Reply-To: <20240731030126.956210-2-nysal@linux.ibm.com>
References: <20240731030126.956210-1-nysal@linux.ibm.com>
 <20240731030126.956210-2-nysal@linux.ibm.com>
Date: Wed, 31 Jul 2024 12:27:47 +0200
Message-ID: <87r0b96el8.ffs@tglx>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Eric DeVolder <eric.devolder@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Laurent Dufour <ldufour@linux.ibm.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, "Nysal Jan K.A" <nysal@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 31 2024 at 08:31, Nysal Jan K. A. wrote:
> If the user has decided to offline certain cores, enabling SMT should
> not online CPUs in those cores. This patch fixes the issue and changes
> the behaviour as described, by introducing an arch specific function
> topology_is_core_online(). It is currently implemented only for PowerPC.
>
> Fixes: 73c58e7e1412 ("powerpc: Add HOTPLUG_SMT support")
> Reported-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> Closes: https://groups.google.com/g/powerpc-utils-devel/c/wrwVzAAnRlI/m/5KJSoqP4BAAJ
> Signed-off-by: Nysal Jan K.A <nysal@linux.ibm.com>

Assuming this goes through the PPC tree:

  Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Michael: If I should route it through my tree, let me know.

Thanks,

        tglx
